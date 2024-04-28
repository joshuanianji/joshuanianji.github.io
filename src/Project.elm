module Project exposing (DisplayType(..), Language(..), Project, getProjects, langToColor, langToString, splitProjects, view, viewFeatured)

-- Represents a single "project"

import BackendTask exposing (BackendTask)
import BackendTask.Glob as Glob
import Color
import Colours
import Css exposing (..)
import Date exposing (Date)
import FatalError exposing (FatalError)
import FeatherIcons
import GithubColors
import Html.Styled as Html exposing (Attribute, Html)
import Html.Styled.Attributes exposing (css)
import Icon
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


type Language
    = Elm
    | Python
    | Rust
    | Javascript
    | Docker
    | Typescript
    | Shell
    | CPP
    | C
    | ANTLR4


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
        |> BackendTask.andMap (BackendTask.succeed <| Manual 0)
        |> BackendTask.map
            (\processed ->
                { raw = decodedProj
                , processed = processed
                }
            )


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
        |> Glob.capture (Glob.oneOf ( ( "png", "png" ), [ ( "jpg", "jpg" ), ( "jpeg", "jpeg" ), ( "webp", "webp" ) ] ))
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
            (\str ->
                case str of
                    "Elm" ->
                        Yaml.succeed Elm

                    "Python" ->
                        Yaml.succeed Python

                    "Rust" ->
                        Yaml.succeed Rust

                    "Javascript" ->
                        Yaml.succeed Javascript

                    "Typescript" ->
                        Yaml.succeed Typescript

                    "Docker" ->
                        Yaml.succeed Docker

                    "Shell" ->
                        Yaml.succeed Shell

                    "C++" ->
                        Yaml.succeed CPP

                    "C" ->
                        Yaml.succeed C

                    "ANTLR4" ->
                        Yaml.succeed ANTLR4

                    other ->
                        Yaml.fail <| "Unknown language " ++ other
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


langToString : Language -> String
langToString l =
    case l of
        Elm ->
            "Elm"

        Python ->
            "Python"

        Rust ->
            "Rust"

        Javascript ->
            "Javascript"

        Typescript ->
            "Typescript"

        Docker ->
            "Docker"

        Shell ->
            "Shell"

        CPP ->
            "C++"

        C ->
            "C"

        ANTLR4 ->
            "ANTLR4"


langToColor : Language -> Color.Color
langToColor l =
    case l of
        Elm ->
            GithubColors.elm.color

        Python ->
            GithubColors.python.color

        Rust ->
            GithubColors.rust.color

        Javascript ->
            GithubColors.javascript.color

        Typescript ->
            GithubColors.typescript.color

        Docker ->
            GithubColors.dockerfile.color

        Shell ->
            GithubColors.shell.color

        CPP ->
            GithubColors.cpp.color

        C ->
            GithubColors.c.color

        ANTLR4 ->
            GithubColors.antlr.color



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
            , projectYear proj.processed.year
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
        , projectYear proj.processed.year
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


projectYear : Year -> Html msg
projectYear year =
    let
        dateString =
            case year of
                Manual y ->
                    String.fromInt y

                Range start end ->
                    String.fromInt (Date.year start) ++ " - " ++ String.fromInt (Date.year end)
    in
    Html.p
        [ css
            [ fontSize (em 0.75) ]
        ]
        [ Html.text dateString ]



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
            ]
            []
        , Html.text <| langToString lang
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
