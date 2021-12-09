port module Ports exposing (scroll, updateHomeViewport, updateMousePos)

import Json.Encode exposing (Value)


port scroll : (() -> msg) -> Sub msg


port updateHomeViewport : (Bool -> msg) -> Sub msg


port updateMousePos : ({ x : Float, y : Float } -> msg) -> Sub msg
