module Colours exposing (..)

import Color exposing (Color)
import Color.Manipulate
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
        { red, green, blue, alpha } =
            Color.toRgba c

        scale x =
            round <| x * 255
    in
    Css.rgba (scale red) (scale green) (scale blue) alpha
