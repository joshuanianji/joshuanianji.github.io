module Helpers.Util exposing (mapMsg, toPairs)

{-
   Utilities
-}

import Element exposing (Element)



-- pair up everything in the list. If there are an odd amount of objects return (a, Nothing) in the last element. Mainly used just for the Projects page


toPairs : List a -> List ( a, Maybe a )
toPairs list =
    case list of
        [] ->
            []

        [ a ] ->
            [ ( a, Nothing ) ]

        a :: b :: c ->
            ( a, Just b ) :: toPairs c



-- used in Main.elm


mapMsg : (subMsg -> msg) -> Element subMsg -> Element msg
mapMsg toMsg element =
    element
        |> Element.map toMsg
