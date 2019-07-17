module UiFramework.Padding exposing (responsive)

{-
   Responsive padding using fillPortion
-}

import Element exposing (..)



{-
   Elm-ui does not have a "percent padding". For example, I can't get a 50% padding because I have to use pixels. Thus, I am going to use fillPortion, which works a bit like bootstrap where they will designate a specified ratio of the width of each element with the fillPortion.

   Let's say I have (left, middle, right) as (1, 2, 1)
   The Element.fillPortion will be 1 for the padding,
   and the Element.fillPortion will be 2 for the content

   This means:

   | --  left   -- | --    middle (content)    --| --  right  -- |
   Each padding will be half the length of the content, and will use `Element.none` to display nothing.

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
