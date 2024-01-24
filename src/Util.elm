module Util exposing (..)

import Css exposing (Style)


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
