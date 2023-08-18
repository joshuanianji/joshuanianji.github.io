port module Ports exposing (updateMousePos)


port updateMousePos : ({ x : Float, y : Float } -> msg) -> Sub msg
