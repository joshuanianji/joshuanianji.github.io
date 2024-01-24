module Colours exposing (..)

import Color exposing (Color)
import Color.Manipulate
import Css


blueTheme : Color
blueTheme =
    Color.rgb255 60 145 201
        |> Color.Manipulate.fadeOut 0.5



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
