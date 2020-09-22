port module Ports exposing (scroll, updateHomeViewport)


port scroll : (() -> msg) -> Sub msg


port updateHomeViewport : (Bool -> msg) -> Sub msg
