module Data.ProjectIcon exposing (Icons, decoder, default, get)

-- holds project icons and provides a way to query for them via identifier

import Dict exposing (Dict)
import Json.Decode as Decode exposing (Decoder)


type alias Icons =
    ( String, Dict String String )


get : String -> Icons -> Maybe String
get id ( _, dict ) =
    Dict.get id dict


default : Icons -> String
default =
    Tuple.first


decoder : Decoder Icons
decoder =
    let
        itemDecoder =
            Decode.map2 Tuple.pair (Decode.at [ "id" ] Decode.string) (Decode.at [ "src" ] Decode.string)
    in
    Decode.map2 Tuple.pair
        (Decode.at [ "default" ] Decode.string)
        (Decode.at [ "icons" ]
            (Decode.list itemDecoder
                |> Decode.map Dict.fromList
            )
        )
