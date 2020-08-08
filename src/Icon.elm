module Icon exposing (view)

import Color
import Colours
import Element exposing (Element)
import Element.Events as Events
import Element.Font as Font
import FeatherIcons as Icons


type alias Config msg =
    { icon : Icons.Icon
    , strokeWidth : Float
    , color : Color.Color
    , size : Float
    , msg :
        Maybe
            { hoverColor : Maybe Color.Color
            , msg : msg
            }
    }


view : List (Element.Attribute msg) -> Config msg -> Element msg
view attrs data =
    let
        elementIcon =
            data.icon
                |> Icons.withStrokeWidth data.strokeWidth
                |> Icons.withSize data.size
                |> Icons.toHtml []
                |> Element.html

        attributes =
            (Font.color <| Colours.toElement data.color) :: attrs

        onClickAttrs =
            [ Maybe.map Events.onClick <| Maybe.map .msg data.msg
            , Maybe.andThen .hoverColor data.msg
                |> Maybe.map
                    (\hoverColor ->
                        Element.mouseOver
                            [ Font.color <| Colours.toElement hoverColor ]
                    )
            ]
                |> List.filterMap identity
    in
    Element.el (attributes ++ onClickAttrs) elementIcon
