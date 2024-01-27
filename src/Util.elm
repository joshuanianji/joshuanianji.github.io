module Util exposing (..)

import Color.Manipulate
import Colours
import Css exposing (..)
import FeatherIcons
import Html.Styled as Html exposing (Attribute, Html)
import Html.Styled.Attributes exposing (css)
import Icon
import Route exposing (Route)


type FlexDirection
    = Row
    | Column


flexDirection : FlexDirection -> Style
flexDirection direction =
    case direction of
        Row ->
            Css.batch
                [ Css.displayFlex
                , Css.flexDirection Css.row
                ]

        Column ->
            Css.batch
                [ Css.displayFlex
                , Css.flexDirection Css.column
                ]



-- Links


textRouteLink : Route -> String -> Html msg
textRouteLink route text =
    htmlRouteLink route (Html.text text)


htmlRouteLink : Route -> Html msg -> Html msg
htmlRouteLink route html =
    Route.toLink
        (\attrs ->
            underlinedLink Html.span
                (List.map Html.Styled.Attributes.fromUnstyled attrs)
                [ html ]
        )
        route


textLink : String -> String -> Html msg
textLink url text =
    underlinedLink Html.span
        [ Html.Styled.Attributes.href url ]
        [ Html.text text ]


linkedHeader : String -> String -> Html msg
linkedHeader fragment text =
    Html.div
        [ css
            [ fontSize (em 1.5)
            , position relative
            , color (Colours.toCss Colours.gray)
            , maxWidth fitContent
            , hover
                [ color (Colours.toCss Colours.themeBlue) ]
            ]
        , Html.Styled.Attributes.id fragment
        ]
        [ Icon.view
            [ css
                [ position absolute
                , left (em -3)
                , cursor pointer
                , padding2 zero (em 1)

                --  center vertically
                , property "top" "calc(50% - 15px)"
                ]
            ]
            { icon = FeatherIcons.link
            , strokeWidth = 2
            , size = 30
            , msg = Nothing
            }
        , underlinedLink Html.h1
            [ Html.Styled.Attributes.href <| "#" ++ fragment
            , css [ fontFamilies [ qt "Playfair Display SC" ] ]
            ]
            [ Html.text text ]
        ]


underlinedLink : (List (Attribute msg) -> List (Html msg) -> Html msg) -> List (Attribute msg) -> List (Html msg) -> Html msg
underlinedLink parentElem attrs content =
    let
        lightBlue =
            Color.Manipulate.fadeOut 0.5 Colours.themeBlue
    in
    parentElem
        [ css
            [ maxWidth fitContent
            , boxShadow4 inset zero (em -0.2) (Colours.toCss lightBlue)
            , borderBottom3 (em 0.0625) solid (Colours.toCss lightBlue)
            , property "line-height" "1"
            , hover
                [ boxShadow4 inset zero (em -0.3) (Colours.toCss lightBlue) ]
            ]
        ]
        [ Html.styled Html.a
            [ color (Colours.toCss Colours.black)
            , textDecoration none
            ]
            attrs
            content
        ]
