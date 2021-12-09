module Data.Project exposing (Concept(..), Language(..), Project, conceptToString, decoder, langToColor, langToString)

-- Project type!

import Color exposing (Color)
import Colours
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline


type alias Project =
    { name : String
    , imgLink : Maybe String -- might not have an icon
    , blurb : String
    , link : String
    , githubLink : String
    , year : Int
    , language : Language
    , concepts : Maybe (List Concept)
    , pinned : Bool
    , mobile : Bool
    }


type Language
    = Elm
    | Python
    | Rust


langToString : Language -> String
langToString l =
    case l of
        Elm ->
            "Elm"

        Python ->
            "Python"

        Rust ->
            "Rust"


langToColor : Language -> Color
langToColor l =
    case l of
        Elm ->
            Colours.elm

        Python ->
            Colours.python

        Rust ->
            Colours.rust


type Concept
    = Parsing
    | APIs
    | SPA
    | PWA
    | DataStructures
    | Firebase
    | Cli


conceptToString : Concept -> String
conceptToString concept =
    case concept of
        Parsing ->
            "Parsing"

        APIs ->
            "APIs"

        SPA ->
            "SPA"

        PWA ->
            "PWA"

        DataStructures ->
            "Data Structures"

        Firebase ->
            "Firebase"

        Cli ->
            "Cli "



-- PARSER


decoder : Decoder Project
decoder =
    Decode.succeed Project
        |> Pipeline.required "name" Decode.string
        |> Pipeline.optional "imgLink" (Decode.map Just Decode.string) Nothing
        |> Pipeline.required "blurb" Decode.string
        |> Pipeline.required "link" Decode.string
        |> Pipeline.required "githubLink" Decode.string
        |> Pipeline.required "year" Decode.int
        |> Pipeline.required "language" languageDecoder
        |> Pipeline.optional "concepts" (Decode.map Just conceptsDecoder) Nothing
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

                    other ->
                        Decode.fail <| "Unknown language " ++ other
            )


conceptsDecoder : Decoder (List Concept)
conceptsDecoder =
    let
        singleDecoder =
            Decode.string
                |> Decode.andThen
                    (\str ->
                        case str of
                            "Parsing" ->
                                Decode.succeed Parsing

                            "APIs" ->
                                Decode.succeed APIs

                            "SPA" ->
                                Decode.succeed SPA

                            "PWA" ->
                                Decode.succeed PWA

                            "DataStructures" ->
                                Decode.succeed DataStructures

                            "Firebase" ->
                                Decode.succeed Firebase

                            "Cli" ->
                                Decode.succeed Cli

                            other ->
                                Decode.fail <| "Unknown concept " ++ other
                    )
    in
    Decode.list singleDecoder
