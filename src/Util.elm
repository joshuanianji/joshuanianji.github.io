module Util exposing (..)

import Element exposing (Element)


surround : { vertical : Bool, first : Int, middle : Int, last : Int } -> Element msg -> Element msg
surround { vertical, first, middle, last } =
    let
        ( parent, attr, fillAttr ) =
            if vertical then
                ( Element.column, Element.height, Element.width )

            else
                ( Element.row, Element.width, Element.height )
    in
    \el ->
        parent
            [ Element.width Element.fill, Element.height Element.fill ]
            [ Element.el [ attr <| Element.fillPortion first, fillAttr Element.fill ] Element.none
            , Element.el [ attr <| Element.fillPortion middle, fillAttr Element.fill ] el
            , Element.el [ attr <| Element.fillPortion last, fillAttr Element.fill ] Element.none
            ]
