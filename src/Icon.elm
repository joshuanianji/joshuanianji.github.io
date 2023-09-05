module Icon exposing (view)

import Color
import Colours
import Css exposing (..)
import FeatherIcons as Icons
import Html.Styled as Html exposing (Attribute, Html)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events


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


view : List (Attribute msg) -> Config msg -> Html msg
view attrs data =
    let
        elementIcon =
            data.icon
                |> Icons.withStrokeWidth data.strokeWidth
                |> Icons.withSize data.size
                |> Icons.toHtml []
                |> Html.fromUnstyled

        cssProps =
            [ color <| Colours.toCss data.color ]

        onclickAttrs =
            [ Maybe.map (\d -> Html.Styled.Events.onClick d.msg) data.msg ]
                |> List.filterMap identity

        eventCssProps =
            [ Maybe.map .msg data.msg
                |> Maybe.map
                    (\_ ->
                        [ cursor pointer ]
                    )
            , Maybe.andThen .hoverColor data.msg
                |> Maybe.map
                    (\hoverColor ->
                        [ hover
                            [ color <| Colours.toCss hoverColor ]
                        ]
                    )
            ]
                |> List.filterMap identity
                |> List.concat
    in
    Html.div
        ((css <| cssProps ++ eventCssProps) :: onclickAttrs ++ attrs)
        [ elementIcon ]
