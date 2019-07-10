module Colour exposing (black, gray, shaded, white)

import Element exposing (Color, rgb, rgb255, rgba255)


black : Color
black =
    rgb255 0 0 0


gray : Color
gray =
    rgb255 175 175 175


white : Color
white =
    rgb 1 1 1



-- used for my project template


shaded : Color
shaded =
    rgba255 0 0 0 0.5
