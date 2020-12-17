module Data.Flags exposing (Flags, WindowSize, decode)

import Data.Project as Project exposing (Project)
import Data.ProjectIcon as ProjectIcon exposing (Icons)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline
import Json.Encode


type alias Flags =
    { windowSize : WindowSize
    , projects : List Project
    , projectIcons : Icons
    , icoSeed : Float -- for the icosahedron
    }


type alias WindowSize =
    { width : Int
    , height : Int
    }



-- JSON


decode : Json.Encode.Value -> Result Decode.Error Flags
decode =
    Decode.decodeValue decoder


decoder : Decoder Flags
decoder =
    Decode.succeed Flags
        |> Pipeline.required "windowSize" windowSizeDecoder
        |> Pipeline.required "projectsJson" projectsDecoder
        |> Pipeline.required "projectIcons" ProjectIcon.decoder
        |> Pipeline.required "icoSeed" Decode.float


windowSizeDecoder : Decoder WindowSize
windowSizeDecoder =
    Decode.succeed WindowSize
        |> Pipeline.required "width" Decode.int
        |> Pipeline.required "height" Decode.int


projectsDecoder : Decoder (List Project)
projectsDecoder =
    Decode.list Project.decoder
