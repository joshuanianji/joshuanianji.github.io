module Project exposing (DisplayType(..), Language(..), Project, getProjects, langToColor, langToString, splitProjects, view, viewFeatured)

-- Represents a single "project"

import BackendTask exposing (BackendTask)
import BackendTask.Glob as Glob
import Color
import Colours
import Css exposing (..)
import FatalError exposing (FatalError)
import FeatherIcons
import GithubColors
import Html.Styled as Html exposing (Attribute, Html)
import Html.Styled.Attributes exposing (css)
import Icon
import Util
import Yaml.Decode as Yaml


type alias Project =
    { id : String
    , name : String
    , blurb : String
    , link : Maybe String
    , githubLink : Maybe String
    , year : Int
    , languages : List Language
    , concepts : Maybe (List String)
    , displayType : DisplayType
    , mobile : Bool

    -- transparent icon if no image found
    , imgPath : String
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



-- BackendTask parse from string


splitProjects : List Project -> BackendTask FatalError { featured : List Project, home : List Project, other : List Project }
splitProjects projs =
    let
        splitted =
            { featured = List.filter (\p -> p.displayType == Featured) projs
            , home = List.filter (\p -> p.displayType == Home) projs
            , other = List.filter (\p -> p.displayType == Other) projs
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
    parseProjects str
        |> BackendTask.andThen
            (\projects -> BackendTask.combine (List.map addImagePath projects))


type alias Path =
    { public : String
    , projIcons : String
    , projId : String
    , extension : String
    }


addImagePath : Project -> BackendTask FatalError Project
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
                        BackendTask.succeed { proj | imgPath = "/proj_icons/transparent.png" }

                    [ path ] ->
                        BackendTask.succeed { proj | imgPath = "/" ++ path.projIcons ++ path.projId ++ "." ++ path.extension }

                    path :: paths ->
                        BackendTask.fail (FatalError.fromString <| "Multiple images found for project " ++ proj.id)
            )


parseProjects : String -> BackendTask FatalError (List Project)
parseProjects str =
    case Yaml.fromString (Yaml.list decoder) str of
        Ok projects ->
            BackendTask.succeed projects

        Err err ->
            BackendTask.fail (FatalError.fromString <| "Error parsing projects.yaml: " ++ Yaml.errorToString err)



-- PARSER
-- imgPath is not parsed, it is filled in later
-- we also parse githubLink first, since we'll need to use it in the "year" field


decoder : Yaml.Decoder Project
decoder =
    Yaml.maybe (Yaml.field "githubLink" Yaml.string)
        |> Yaml.andThen
            (\maybeGithubLink ->
                Yaml.succeed Project
                    |> Yaml.andMap (Yaml.field "id" Yaml.string)
                    |> Yaml.andMap (Yaml.field "name" Yaml.string)
                    |> Yaml.andMap (Yaml.field "blurb" Yaml.string)
                    |> Yaml.andMap (Yaml.maybe (Yaml.field "link" Yaml.string))
                    |> Yaml.andMap (Yaml.succeed maybeGithubLink)
                    |> Yaml.andMap (Yaml.field "year" Yaml.int)
                    |> Yaml.andMap (Yaml.field "languages" (Yaml.list languageDecoder))
                    |> Yaml.andMap (Yaml.maybe (Yaml.field "concepts" (Yaml.list Yaml.string)))
                    |> Yaml.andMap (Yaml.field "displayType" displayTypeDecoder)
                    |> Yaml.andMap (Yaml.field "mobile" Yaml.bool)
                    |> Yaml.andMap (Yaml.succeed "")
            )


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
            , link = proj.imgPath
            , name = proj.name
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
            [ projectTitle proj
            , Html.p
                [ css
                    [ fontSize (em 0.75) ]
                ]
                [ Html.text <| String.fromInt proj.year ]
            , Html.p [] [ Html.text proj.blurb ]
            , languagesAndConcepts Util.Row { languages = proj.languages, concepts = proj.concepts }
            ]
        , projectLinks Util.Column { githubLink = proj.githubLink, link = proj.link }
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
            , link = proj.imgPath
            , name = proj.name
            }
            [ padding2 (px 0) (em 1) ]
        , projectTitle proj
        , Html.p
            [ css
                [ fontSize (em 0.75) ]
            ]
            [ Html.text <| String.fromInt proj.year ]
        , Html.p [] [ Html.text proj.blurb ]

        -- height-filling empty div to align the languages/concepts and links to the bottom
        , Html.div [ css [ flex (int 1) ] ] []
        , projectLinks Util.Row { githubLink = proj.githubLink, link = proj.link }
        , languagesAndConcepts Util.Column { languages = proj.languages, concepts = proj.concepts }
        ]



-- view Helpers


projectTitle : Project -> Html msg
projectTitle proj =
    let
        -- try link, otherwise link to github, else Nothing
        mainLink =
            case proj.link of
                Just _ ->
                    proj.link

                Nothing ->
                    proj.githubLink

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
        [ Html.text proj.name ]



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
        { githubLink : Maybe String
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
        , Maybe.withDefault (Html.text "") <| Maybe.map (renderLink FeatherIcons.github) links.githubLink
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
