module Colours exposing (..)

import Color exposing (Color)
import Element


themeBlue : Color
themeBlue =
    Color.rgb255 50 145 201


withAlpha : Float -> Color -> Color
withAlpha a color =
    let
        { red, green, blue, alpha } =
            Color.toRgba color
    in
    Color.rgba red green blue a


toElement : Color -> Element.Color
toElement color =
    let
        { red, green, blue, alpha } =
            Color.toRgba color
    in
    Element.rgba red green blue alpha
