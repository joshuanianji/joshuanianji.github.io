module Project exposing (DisplayType(..), Language(..), Project, backendTaskParse, langToColor, langToString)

-- Represents a single "project"

import BackendTask exposing (BackendTask)
import Color exposing (Color)
import Colours
import FatalError exposing (FatalError)
import GithubColors
import Yaml.Decode as Yaml


type alias Project =
    { id : String
    , name : String
    , blurb : String
    , link : Maybe String
    , githubLink : String
    , year : Int
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


type DisplayType
    = Featured
    | Home
    | Other



-- BackendTask parse from string


backendTaskParse : String -> BackendTask FatalError (List Project)
backendTaskParse str =
    case Yaml.fromString (Yaml.list decoder) str of
        Ok projects ->
            BackendTask.succeed projects

        Err err ->
            BackendTask.fail (FatalError.fromString <| "Error parsing projects.yaml: " ++ Yaml.errorToString err)



-- PARSER


decoder : Yaml.Decoder Project
decoder =
    Yaml.succeed Project
        |> Yaml.andMap (Yaml.field "id" Yaml.string)
        |> Yaml.andMap (Yaml.field "name" Yaml.string)
        |> Yaml.andMap (Yaml.field "blurb" Yaml.string)
        |> Yaml.andMap (Yaml.maybe (Yaml.field "link" Yaml.string))
        |> Yaml.andMap (Yaml.field "githubLink" Yaml.string)
        |> Yaml.andMap (Yaml.field "year" Yaml.int)
        |> Yaml.andMap (Yaml.field "languages" (Yaml.list languageDecoder))
        |> Yaml.andMap (Yaml.maybe (Yaml.field "concepts" (Yaml.list Yaml.string)))
        |> Yaml.andMap (Yaml.field "displayType" displayTypeDecoder)
        |> Yaml.andMap (Yaml.field "mobile" Yaml.bool)


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


langToColor : Language -> Color
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
