module Data.Flags exposing (Flags, ProjIcons, WindowSize, decode)

import Data.Project as Project exposing (Project)
import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline
import Json.Encode


type alias Flags =
    { windowSize : WindowSize
    , projects : List Project
    , projectIcons : ProjIcons
    }


type alias WindowSize =
    { width : Int
    , height : Int
    }


type alias ProjIcons =
    Dict String String



-- JSON


decode : Json.Encode.Value -> Result Decode.Error Flags
decode =
    Decode.decodeValue decoder


decoder : Decoder Flags
decoder =
    Decode.succeed Flags
        |> Pipeline.required "windowSize" windowSizeDecoder
        |> Pipeline.required "projectsJson" projectsDecoder
        |> Pipeline.required "projectIcons" iconsDecoder


windowSizeDecoder : Decoder WindowSize
windowSizeDecoder =
    Decode.succeed WindowSize
        |> Pipeline.required "width" Decode.int
        |> Pipeline.required "height" Decode.int


projectsDecoder : Decoder (List Project)
projectsDecoder =
    Decode.list Project.decoder


iconsDecoder : Decoder ProjIcons
iconsDecoder =
    let
        itemDecoder =
            Decode.map2 Tuple.pair (Decode.at [ "id" ] Decode.string) (Decode.at [ "src" ] Decode.string)
    in
    Decode.list itemDecoder
        |> Decode.map Dict.fromList
