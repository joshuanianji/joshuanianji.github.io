module Colours exposing (..)

import Color exposing (Color)
import Element


themeBlue : Color
themeBlue =
    Color.rgb255 50 145 201



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


withAlpha : Float -> Color.Color -> Color.Color
withAlpha a color =
    let
        rgba =
            Color.toRgba color
    in
    Color.rgba rgba.red rgba.green rgba.blue a


toElement : Color -> Element.Color
toElement color =
    let
        { red, green, blue, alpha } =
            Color.toRgba color
    in
    Element.rgba red green blue alpha
