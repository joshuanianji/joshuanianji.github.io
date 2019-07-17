module Util exposing (toPairs)

{-
   Utilities
-}
-- pair up everything in the list. If there are an odd amount of objects return (a, Nothing) in the last element


toPairs : List a -> List ( a, Maybe a )
toPairs list =
    case list of
        [] ->
            []

        [ a ] ->
            [ ( a, Nothing ) ]

        a :: b :: c ->
            ( a, Just b ) :: toPairs c
