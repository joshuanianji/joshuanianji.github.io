module UiFramework.Padding exposing (responsive)

{-
   Responsive padding using fillPortion
-}

import Element exposing (..)



{-
   Elm-ui does not have a "percent padding". For example, I can't get 50% padding because I have to use pixels.

   Thus, I am going to use fillPortion, which works a bit like bootstrap
   Elm-ui will automatically designate a specified ratio of the width of each element with the fillPortion in a row or column.

   Let's say I have (left, middle, right) as (1, 2, 1)
   The Element.fillPortion will be 1 for the padding on the left and right,
   and the Element.fillPortion will be 2 for the content

   This means:

   | --  left   -- | --    middle (content)    --| --  right  -- |
   Each "padding," which is just Element.none to display nothing, will be half the length of the content.

     If you want 0 padding, just put 0 in the respective position
-}


responsive : Device -> Element msg -> Element msg
responsive device content =
    let
        ( left, middle, right ) =
            case device.class of
                BigDesktop ->
                    ( 1, 4, 1 )

                Desktop ->
                    ( 1, 6, 1 )

                Tablet ->
                    case device.orientation of
                        Portrait ->
                            ( 1, 8, 1 )

                        Landscape ->
                            ( 0, 1, 0 )

                Phone ->
                    ( 0, 1, 0 )
    in
    -- basically squish the content between two Element.none
    row
        [ width fill ]
        [ el [ width <| fillPortion left ] none
        , el [ width <| fillPortion middle ] content
        , el [ width <| fillPortion right ] none
        ]
