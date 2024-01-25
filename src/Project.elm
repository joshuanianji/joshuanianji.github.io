module Project exposing (DisplayType(..), Language(..), Project, getProjects, langToColor, langToString)

-- Represents a single "project"

import BackendTask exposing (BackendTask)
import BackendTask.Glob as Glob
import Color exposing (Color)
import FatalError exposing (FatalError)
import GithubColors
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


type DisplayType
    = Featured
    | Home
    | Other



-- BackendTask parse from string


getProjects : String -> BackendTask FatalError (List Project)
getProjects str =
    parseProjects str
        |> BackendTask.andThen
            (\projects -> BackendTask.combine (List.map addImagePath projects))


addImagePath : Project -> BackendTask FatalError Project
addImagePath proj =
    Glob.succeed identity
        |> Glob.captureFilePath
        |> Glob.match (Glob.literal "public/")
        |> Glob.match (Glob.literal "proj_icons/")
        |> Glob.match (Glob.literal proj.id)
        |> Glob.match (Glob.literal ".")
        |> Glob.match (Glob.oneOf ( ( "png", () ), [ ( "jpg", () ), ( "jpeg", () ), ( "webp", () ) ] ))
        |> Glob.toBackendTask
        |> BackendTask.andThen
            (\imgPaths ->
                case imgPaths of
                    [] ->
                        BackendTask.succeed { proj | imgPath = "public/proj_icons/transparent.png" }

                    [ imgPath ] ->
                        BackendTask.succeed { proj | imgPath = imgPath }

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


decoder : Yaml.Decoder Project
decoder =
    Yaml.succeed Project
        |> Yaml.andMap (Yaml.field "id" Yaml.string)
        |> Yaml.andMap (Yaml.field "name" Yaml.string)
        |> Yaml.andMap (Yaml.field "blurb" Yaml.string)
        |> Yaml.andMap (Yaml.maybe (Yaml.field "link" Yaml.string))
        |> Yaml.andMap (Yaml.maybe (Yaml.field "githubLink" Yaml.string))
        |> Yaml.andMap (Yaml.field "year" Yaml.int)
        |> Yaml.andMap (Yaml.field "languages" (Yaml.list languageDecoder))
        |> Yaml.andMap (Yaml.maybe (Yaml.field "concepts" (Yaml.list Yaml.string)))
        |> Yaml.andMap (Yaml.field "displayType" displayTypeDecoder)
        |> Yaml.andMap (Yaml.field "mobile" Yaml.bool)
        |> Yaml.andMap (Yaml.succeed "")


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
