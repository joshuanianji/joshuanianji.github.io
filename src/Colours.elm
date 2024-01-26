module Colours exposing (..)

import Color exposing (Color)
import Css


themeBlue : Color
themeBlue =
    Color.rgb255 50 145 201


errorRed : Color
errorRed =
    Color.rgb255 224 71 76


warningRed : Color
warningRed =
    Color.rgb255 253 150 150


green : Color
green =
    Color.rgb255 63 104 28



-- copied colours


gray : Color
gray =
    Color.gray


white : Color
white =
    Color.white


black : Color
black =
    Color.black



-- helpers


toCss : Color -> Css.Color
toCss c =
    let
        colorRecord =
            Color.toRgba c

        scale x =
            round <| x * 255
    in
    Css.rgba (scale colorRecord.red) (scale colorRecord.green) (scale colorRecord.blue) colorRecord.alpha


withAlpha : Float -> Color.Color -> Color.Color
withAlpha a color =
    let
        rgba =
            Color.toRgba color
    in
    Color.rgba rgba.red rgba.green rgba.blue a
