module Util exposing (fillVertical, link, pageTitle, surround)

import Colours
import Element exposing (Element)
import Element.Background as Background
import Element.Font as Font
import FeatherIcons
import Html.Attributes
import Icon
import Routes exposing (Route)


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


link : { label : String, link : String } -> Element msg
link data =
    Element.newTabLink
        [ Element.htmlAttribute <| Html.Attributes.class "fat-underline"
        , Element.mouseOver
            [ Background.color <| Colours.toElement <| Colours.withAlpha 0.5 Colours.themeBlue
            ]
        ]
        { url = data.link
        , label = Element.text data.label
        }


pageTitle : Element.DeviceClass -> String -> (Route -> msg) -> Route -> Element msg
pageTitle device title msg route =
    let
        ( fontSize, fontAlign ) =
            case device of
                Element.Phone ->
                    ( 32, Element.centerX )

                _ ->
                    ( 50, Element.alignLeft )
    in
    Element.paragraph
        [ Element.htmlAttribute <| Html.Attributes.class "fat-underline"
        , Element.width Element.shrink
        , Element.paddingXY 0 4
        , Font.size fontSize
        , fontAlign
        , Font.family [ Font.typeface "Playfair Display SC" ]

        -- link thingy
        , Element.onLeft <|
            if device == Element.Phone then
                Element.none

            else
                Icon.view
                    [ Element.centerY
                    , Element.paddingXY 16 0
                    ]
                    { icon = FeatherIcons.link
                    , strokeWidth = 2
                    , color = Colours.gray
                    , size = 25
                    , msg =
                        Just
                            { hoverColor = Just Colours.themeBlue
                            , msg = msg route
                            }
                    }
        ]
        [ Element.text title ]


fillVertical : Element msg
fillVertical =
    Element.el
        [ Element.height Element.fill ]
        Element.none
