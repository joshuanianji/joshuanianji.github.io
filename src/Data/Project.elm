module Data.Project exposing (Language(..), Project, decoder, langToColor, langToString)

-- Project type!

import Color exposing (Color)
import Colours
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline


type alias Project =
    { name : String
    , imgLink : Maybe String -- might not have an icon
    , blurb : String
    , link : Maybe String
    , githubLink : String
    , year : Int
    , language : List Language
    , concepts : Maybe (List String)
    , pinned : Bool
    , mobile : Bool
    }


type Language
    = Elm
    | Python
    | Rust
    | Javascript
    | Docker
    | Typescript


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


langToColor : Language -> Color
langToColor l =
    case l of
        Elm ->
            Colours.elm

        Python ->
            Colours.python

        Rust ->
            Colours.rust

        Javascript ->
            Colours.javascript
        
        Typescript ->
            Colours.typescript

        Docker ->
            Colours.docker



-- PARSER


decoder : Decoder Project
decoder =
    Decode.succeed Project
        |> Pipeline.required "name" Decode.string
        |> Pipeline.optional "imgLink" (Decode.map Just Decode.string) Nothing
        |> Pipeline.required "blurb" Decode.string
        |> Pipeline.optional "link" (Decode.map Just Decode.string) Nothing
        |> Pipeline.required "githubLink" Decode.string
        |> Pipeline.required "year" Decode.int
        |> Pipeline.required "languages" (Decode.list languageDecoder)
        |> Pipeline.optional "concepts" (Decode.map Just <| Decode.list Decode.string) Nothing
        |> Pipeline.required "pinned" Decode.bool
        |> Pipeline.required "mobile" Decode.bool


languageDecoder : Decoder Language
languageDecoder =
    Decode.string
        |> Decode.andThen
            (\str ->
                case str of
                    "Elm" ->
                        Decode.succeed Elm

                    "Python" ->
                        Decode.succeed Python

                    "Rust" ->
                        Decode.succeed Rust

                    "Javascript" ->
                        Decode.succeed Javascript
                    
                    "Typescript" ->
                        Decode.succeed Typescript

                    "Docker" ->
                        Decode.succeed Docker

                    other ->
                        Decode.fail <| "Unknown language " ++ other
            )
