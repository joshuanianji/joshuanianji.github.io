module Colours exposing (..)

import Color exposing (Color)
import Element


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



-- slightly lighter than black - for the easter egg on "I love web development"


subtleBlack : Color
subtleBlack =
    Color.rgb255 30 30 30



-- Github Colours for languages
-- taken from https://github.com/ozh/github-colors/blob/master/colors.json


elm : Color
elm =
    Color.rgb255 96 181 204


python : Color
python =
    Color.rgb255 53 114 165


rust : Color
rust =
    Color.rgb255 222 165 132


purescript : Color
purescript =
    Color.rgb255 29 34 45


haskell : Color
haskell =
    Color.rgb255 94 80 134


javascript : Color
javascript =
    Color.rgb255 241 224 90



typescript : Color
typescript =
    Color.rgb255 48 119 198


docker : Color
docker =
    Color.rgb255 56 77 84


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
