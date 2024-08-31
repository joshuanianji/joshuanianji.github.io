module Project exposing (DisplayType(..), Project, getProjects, langToColor, splitProjects, view, viewFeatured)

-- Represents a single "project"

import Ansi.Log exposing (LineDiscipline(..))
import BackendTask exposing (BackendTask)
import BackendTask.Env
import BackendTask.Glob as Glob
import BackendTask.Http
import Color
import Colours
import Css exposing (..)
import Date exposing (Date)
import FatalError exposing (FatalError)
import FeatherIcons
import GithubColors exposing (Language)
import Html.Styled as Html exposing (Attribute, Html)
import Html.Styled.Attributes exposing (css)
import Icon
import Iso8601
import Json.Decode
import Time
import Util
import Yaml.Decode as Yaml



-- I would prefer to have all the processed and raw data in the top level
-- but Elm doesn't seem to like to do that.


type alias Project =
    { raw : RawData
    , processed : ProcessedData
    }



-- extra processed data from a project


type alias ProcessedData =
    { imgPath : String
    , year : Year

    -- only add github stars if the project has a github repo w/ 5 stars or more
    -- kinda awkward to display a project with 0 stars...
    , stargazers : Maybe Int
    }



-- data we get from the yaml file without any processing


type alias RawData =
    { id : String
    , name : String
    , blurb : String
    , link : Maybe String
    , githubRepo : Maybe String
    , rawYear : Maybe Int
    , languages : List Language
    , concepts : Maybe (List String)
    , displayType : DisplayType
    , mobile : Bool
    }


type DisplayType
    = Featured
    | Home
    | Other


type Year
    = Manual Int
    | Range Date Date



-- BackendTask parse from string


splitProjects : List Project -> BackendTask FatalError { featured : List Project, home : List Project, other : List Project }
splitProjects projs =
    let
        splitted =
            { featured = List.filter (\p -> p.raw.displayType == Featured) projs
            , home = List.filter (\p -> p.raw.displayType == Home) projs
            , other = List.filter (\p -> p.raw.displayType == Other) projs
            }
    in
    if List.length splitted.home > 5 then
        BackendTask.fail (FatalError.fromString "Too many projects on the home page! Keep it less than 5 :)")

    else if List.length splitted.featured > 3 then
        BackendTask.fail (FatalError.fromString "Too many pinned projects! Keep it less than 3 :)")

    else
        BackendTask.succeed splitted


getProjects : String -> BackendTask FatalError (List Project)
getProjects str =
    parseRawData str
        |> BackendTask.andThen (List.map addProcessedData >> BackendTask.combine)


addProcessedData : RawData -> BackendTask FatalError Project
addProcessedData decodedProj =
    BackendTask.succeed ProcessedData
        |> BackendTask.andMap (addImagePath decodedProj)
        |> BackendTask.andMap (addYear decodedProj)
        |> BackendTask.andMap (addStargazers decodedProj)
        |> BackendTask.map
            (\processed ->
                { raw = decodedProj
                , processed = processed
                }
            )


type alias Env =
    { githubToken : Maybe String
    }


getEnvs : BackendTask FatalError Env
getEnvs =
    BackendTask.succeed Env
        |> BackendTask.andMap (BackendTask.Env.get "GITHUB_TOKEN")


githubApiAuthHeader : Env -> List ( String, String )
githubApiAuthHeader env =
    case env.githubToken of
        Just token ->
            [ ( "Authorization", "token " ++ token ) ]

        Nothing ->
            []



-- it's ok to re-fetch the github API since the get requests are cached


addStargazers : RawData -> BackendTask FatalError (Maybe Int)
addStargazers proj =
    case proj.githubRepo of
        Just repoName ->
            getEnvs
                |> BackendTask.andThen (getStargazers repoName)

        Nothing ->
            BackendTask.succeed Nothing


getStargazers : String -> Env -> BackendTask FatalError (Maybe Int)
getStargazers repoName env =
    BackendTask.Http.getWithOptions
        { url = "https://api.github.com/repos/" ++ repoName
        , expect = BackendTask.Http.expectJson (Json.Decode.field "stargazers_count" Json.Decode.int)
        , headers = githubApiAuthHeader env
        , cacheStrategy = Nothing
        , retries = Nothing
        , timeoutInMs = Nothing
        , cachePath = Nothing
        }
        |> BackendTask.mapError
            (\err ->
                FatalError.fromString <| "Error fetching stargazers for project " ++ repoName ++ "\n" ++ httpErrorToString err.recoverable
            )
        |> BackendTask.map
            (\stargazers ->
                if stargazers >= 5 then
                    Just stargazers

                else
                    Nothing
            )


httpErrorToString : BackendTask.Http.Error -> String
httpErrorToString error =
    let
        body =
            case error of
                BackendTask.Http.BadUrl string ->
                    "BadUrl " ++ string

                BackendTask.Http.Timeout ->
                    "Timeout"

                BackendTask.Http.NetworkError ->
                    "NetworkError"

                BackendTask.Http.BadStatus metadata _ ->
                    "BadStatus: " ++ String.fromInt metadata.statusCode ++ " " ++ metadata.statusText

                BackendTask.Http.BadBody _ string ->
                    "BadBody " ++ string
    in
    "HTTP Error: " ++ body



-- if the project doesn't have a "year" field, scrape the github API
-- to get the date of the first commit and latest commit, and use that to create a range


addYear : RawData -> BackendTask FatalError Year
addYear proj =
    case ( proj.rawYear, proj.githubRepo ) of
        ( Just y, _ ) ->
            BackendTask.succeed (Manual y)

        ( Nothing, Just repoName ) ->
            getEnvs
                |> BackendTask.andThen (getYearFromGithub repoName)

        ( Nothing, Nothing ) ->
            BackendTask.fail (FatalError.fromString <| "Error parsing projects.yaml: no year field and no githubRepo field for project " ++ proj.id)


getYearFromGithub : String -> Env -> BackendTask FatalError Year
getYearFromGithub repoName env =
    let
        dateDecoder fields =
            Iso8601.decoder
                |> Json.Decode.map (Date.fromPosix Time.utc)
                |> Json.Decode.at fields

        startDate =
            BackendTask.Http.getWithOptions
                { url = "https://api.github.com/repos/" ++ repoName
                , expect = BackendTask.Http.expectJson (dateDecoder [ "created_at" ])
                , headers = githubApiAuthHeader env
                , cacheStrategy = Nothing
                , retries = Nothing
                , timeoutInMs = Nothing
                , cachePath = Nothing
                }
                |> BackendTask.allowFatal

        endDate =
            BackendTask.Http.getWithOptions
                { url = "https://api.github.com/repos/" ++ repoName ++ "/commits?per_page=1"
                , expect = BackendTask.Http.expectJson (Json.Decode.index 0 <| dateDecoder [ "commit", "author", "date" ])
                , headers = githubApiAuthHeader env
                , cacheStrategy = Nothing
                , retries = Nothing
                , timeoutInMs = Nothing
                , cachePath = Nothing
                }
                |> BackendTask.allowFatal
    in
    BackendTask.map2 Range startDate endDate



-- add the image path to the project data


type alias Path =
    { public : String
    , projIcons : String
    , projId : String
    , extension : String
    }


addImagePath : RawData -> BackendTask FatalError String
addImagePath proj =
    Glob.succeed Path
        |> Glob.capture (Glob.literal "public/")
        |> Glob.capture (Glob.literal "proj_icons/")
        |> Glob.capture (Glob.literal proj.id)
        |> Glob.match (Glob.literal ".")
        |> Glob.capture (Glob.oneOf ( ( "png", "png" ), [ ( "jpg", "jpg" ), ( "jpeg", "jpeg" ), ( "webp", "webp" ), ( "svg", "svg" ) ] ))
        |> Glob.toBackendTask
        |> BackendTask.andThen
            (\imgPaths ->
                case imgPaths of
                    [] ->
                        BackendTask.succeed "/proj_icons/transparent.png"

                    [ path ] ->
                        BackendTask.succeed ("/" ++ path.projIcons ++ path.projId ++ "." ++ path.extension)

                    path :: paths ->
                        BackendTask.fail (FatalError.fromString <| "Multiple images found for project " ++ proj.id)
            )


parseRawData : String -> BackendTask FatalError (List RawData)
parseRawData str =
    case Yaml.fromString (Yaml.list decoder) str of
        Ok projects ->
            BackendTask.succeed projects

        Err err ->
            BackendTask.fail (FatalError.fromString <| "Error parsing projects.yaml: " ++ Yaml.errorToString err)



-- PARSER
-- we also parse githubLink first, since we'll need to use it in the "year" field


decoder : Yaml.Decoder RawData
decoder =
    Yaml.succeed RawData
        |> Yaml.andMap (Yaml.field "id" Yaml.string)
        |> Yaml.andMap (Yaml.field "name" Yaml.string)
        |> Yaml.andMap (Yaml.field "blurb" Yaml.string)
        |> Yaml.andMap (Yaml.maybe (Yaml.field "link" Yaml.string))
        |> Yaml.andMap (Yaml.maybe (Yaml.field "githubRepo" Yaml.string))
        |> Yaml.andMap (Yaml.maybe (Yaml.field "year" Yaml.int))
        |> Yaml.andMap (Yaml.field "languages" (Yaml.list languageDecoder))
        |> Yaml.andMap (Yaml.maybe (Yaml.field "concepts" (Yaml.list Yaml.string)))
        |> Yaml.andMap (Yaml.field "displayType" displayTypeDecoder)
        |> Yaml.andMap (Yaml.field "mobile" Yaml.bool)


githubRepoToLink : String -> String
githubRepoToLink repo =
    "https://github.com/" ++ repo


languageDecoder : Yaml.Decoder Language
languageDecoder =
    Yaml.string
        |> Yaml.andThen
            (\s ->
                case GithubColors.fromString s of
                    Just lang ->
                        Yaml.succeed lang

                    Nothing ->
                        Yaml.fail <| "Unknown language " ++ s
            )


displayTypeDecoder : Yaml.Decoder DisplayType
displayTypeDecoder =
    Yaml.string
        |> Yaml.andThen
            (\str ->
                case str of
                    "featured" ->
                        Yaml.succeed Featured

                    "home" ->
                        Yaml.succeed Home

                    "other" ->
                        Yaml.succeed Other

                    unknown ->
                        Yaml.fail <| "Unknown display type " ++ unknown
            )



-- Helpers


langToColor : Language -> Color.Color
langToColor =
    GithubColors.toColor >> .color



---- VIEWS


view : Project -> Html msg
view proj =
    projectContainer Util.Row
        [ css
            [ property "gap" "1em"
            , alignItems center
            ]
        ]
        [ projectImage
            { imgSize = px 50
            , dir = Util.Row
            , link = proj.processed.imgPath
            , name = proj.raw.name
            }
            [ padding2 (px 0) (em 1) ]
        , Html.div
            [ css
                [ displayFlex
                , flexDirection column
                , property "gap" "0.5em"
                , flex (int 1)
                ]
            ]
            [ projectTitle proj.raw
            , Html.p
                [ css [ fontSize (em 0.75) ] ]
                [ projectStars proj.processed.stargazers
                , projectYear proj.processed.year
                ]
            , Html.p [] [ Html.text proj.raw.blurb ]
            , languagesAndConcepts Util.Row { languages = proj.raw.languages, concepts = proj.raw.concepts }
            ]
        , projectLinks Util.Column { githubRepo = proj.raw.githubRepo, link = proj.raw.link }
        ]


viewFeatured : Project -> Html msg
viewFeatured proj =
    projectContainer Util.Column
        [ css
            [ property "gap" "0.75em"
            , alignItems center
            , textAlign center
            ]
        ]
        [ projectImage
            { imgSize = px 120
            , dir = Util.Column
            , link = proj.processed.imgPath
            , name = proj.raw.name
            }
            [ padding2 (px 0) (em 1) ]
        , projectTitle proj.raw
        , Html.p
            [ css [ fontSize (em 0.75) ] ]
            [ projectStars proj.processed.stargazers
            , projectYear proj.processed.year
            ]
        , Html.p [] [ Html.text proj.raw.blurb ]

        -- height-filling empty div to align the languages/concepts and links to the bottom
        , Html.div [ css [ flex (int 1) ] ] []
        , projectLinks Util.Row { githubRepo = proj.raw.githubRepo, link = proj.raw.link }
        , languagesAndConcepts Util.Column { languages = proj.raw.languages, concepts = proj.raw.concepts }
        ]



-- view Helpers


projectTitle : RawData -> Html msg
projectTitle raw =
    let
        -- try link, otherwise link to github, else Nothing
        mainLink =
            case raw.link of
                Just _ ->
                    raw.link

                Nothing ->
                    Maybe.map githubRepoToLink raw.githubRepo

        mainLinkCSS =
            case mainLink of
                Just _ ->
                    hover
                        [ color (Colours.toCss Colours.themeBlue) ]

                Nothing ->
                    cursor notAllowed
    in
    Html.a
        [ css
            [ fontSize (em 1.25)
            , fontWeight bold
            , textDecoration none
            , color (Colours.toCss Colours.black)
            , mainLinkCSS
            ]
        , case mainLink of
            Just url ->
                Html.Styled.Attributes.href url

            Nothing ->
                Html.Styled.Attributes.title "No link available, sorry!"
        ]
        [ Html.text raw.name ]


projectStars : Maybe Int -> Html msg
projectStars stargazers =
    case stargazers of
        Just stars ->
            Html.span
                []
                [ Html.text <| String.fromInt stars ++ " ⭐  ⋅  " ]

        Nothing ->
            Html.text ""


projectYear : Year -> Html msg
projectYear year =
    let
        displayRange : Date -> Date -> List (Html msg)
        displayRange start end =
            if Date.year start == Date.year end then
                [ Html.span
                    [ Html.Styled.Attributes.title (Date.format "EEEE, MMMM d y" start ++ " - " ++ Date.format "EEEE, MMMM d y" end) ]
                    [ Html.text <| String.fromInt (Date.year start) ]
                ]

            else
                [ Html.span
                    [ Html.Styled.Attributes.title <| Date.format "EEEE, MMMM d y" start ]
                    [ Html.text <| String.fromInt (Date.year start) ]
                , Html.text " - "
                , Html.span
                    [ Html.Styled.Attributes.title <| Date.format "EEEE, MMMM d y" end ]
                    [ Html.text <| String.fromInt (Date.year end) ]
                ]

        dateHtml =
            case year of
                Manual y ->
                    [ Html.text (String.fromInt y) ]

                Range start end ->
                    displayRange start end
    in
    Html.span
        [ case year of
            Manual _ ->
                Html.Styled.Attributes.attribute "data-datetype" "manual"

            Range _ _ ->
                Html.Styled.Attributes.attribute "data-datetype" "range"
        ]
        dateHtml



-- direction is which way the image is centered
-- if direction is row, the image will be centered horizontally


projectImage :
    { imgSize : LengthOrAuto compatible
    , dir : Util.FlexDirection
    , link : String
    , name : String
    }
    -> List Style
    -> Html msg
projectImage image extraCss =
    let
        imgContainer attrs children =
            Html.div
                [ css
                    ([ Util.flexDirection image.dir
                     , justifyContent center
                     ]
                        ++ extraCss
                    )
                ]
                [ Html.styled Html.img
                    [ if image.dir == Util.Row then
                        -- constrain width
                        width image.imgSize

                      else
                        -- constrain height
                        height image.imgSize
                    ]
                    attrs
                    children
                ]
    in
    imgContainer
        [ Html.Styled.Attributes.src image.link
        , Html.Styled.Attributes.alt ("Project image for " ++ image.name)
        ]
        []


languagesAndConcepts :
    Util.FlexDirection
    ->
        { languages : List Language
        , concepts : Maybe (List String)
        }
    -> Html msg
languagesAndConcepts dir data_ =
    Html.div
        [ css
            [ Util.flexDirection dir
            , property "gap" "0.5em"
            , alignItems center
            ]
        ]
        [ viewLanguages data_.languages
        , case data_.concepts of
            Just (x :: xs) ->
                viewConcepts (x :: xs)

            _ ->
                Html.text ""
        ]


projectLinks :
    Util.FlexDirection
    ->
        { githubRepo : Maybe String
        , link : Maybe String
        }
    -> Html msg
projectLinks dir links =
    let
        renderLink : FeatherIcons.Icon -> String -> Html msg
        renderLink icon url =
            Html.a
                [ Html.Styled.Attributes.href url
                , css
                    [ padding (em 0.8)
                    , borderRadius (em 0.5)
                    , flex (int 1)
                    , displayFlex
                    , flexDirection column
                    , alignItems center
                    , justifyContent center
                    , color (Colours.toCss Colours.black)
                    , hover
                        [ backgroundColor (Colours.toCss <| Colours.withAlpha 0.5 Colours.gray) ]
                    ]
                ]
                [ Icon.view []
                    { icon = icon
                    , strokeWidth = 2
                    , size = 18
                    , msg = Nothing
                    }
                ]
    in
    Html.div
        [ css
            [ Util.flexDirection dir
            , property "gap" "0.5em"
            , alignSelf stretch
            ]
        ]
        [ Maybe.withDefault (Html.text "") <| Maybe.map (renderLink FeatherIcons.link2) links.link
        , Maybe.withDefault (Html.text "") <| Maybe.map (githubRepoToLink >> renderLink FeatherIcons.github) links.githubRepo
        ]


viewLanguages : List Language -> Html msg
viewLanguages langs =
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , property "gap" "0.5em"
            ]
        ]
        (List.map viewLanguage langs)


viewLanguage : Language -> Html msg
viewLanguage lang =
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , padding2 (px 3) (px 6)
            , fontSize (em 0.75)
            , alignItems center
            , property "gap" "0.2em"
            , border3 (px 1) solid (Colours.toCss <| langToColor lang)
            , borderRadius (em 1)
            ]
        ]
        [ Html.div
            [ css
                [ height (em 0.8)
                , width (em 0.8)
                , borderRadius (em 1)
                , backgroundColor (Colours.toCss <| langToColor lang)
                ]
            , Html.Styled.Attributes.attribute "data-lang" (GithubColors.toString lang)
            ]
            []
        , Html.text <| GithubColors.toString lang
        ]


viewConcepts : List String -> Html msg
viewConcepts concepts =
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , property "gap" "0.5em"
            ]
        ]
        (List.map viewConcept concepts)


viewConcept : String -> Html msg
viewConcept concept =
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , padding2 (px 3) (px 6)
            , fontSize (em 0.75)
            , alignItems center
            , borderRadius (em 0.5)
            , backgroundColor (Colours.toCss Colours.themeBlue)
            , color (Colours.toCss Colours.white)
            ]
        ]
        [ Html.text concept ]


projectContainer : Util.FlexDirection -> List (Attribute msg) -> List (Html msg) -> Html msg
projectContainer dir =
    Html.styled Html.div
        [ Util.flexDirection dir
        , width (pct 100)
        , padding (em 1.5)
        , border3 (px 1) solid (Colours.toCss Colours.gray)
        , borderRadius (em 0.5)
        , hover
            [ borderColor (Colours.toCss Colours.black) ]
        ]
