module View exposing (View, map)

{-|

@docs View, map

-}

import Element exposing (Element)


{-| -}
type alias View msg =
    { title : String
    , body : List (Element msg)
    }


{-| -}
map : (msg1 -> msg2) -> View msg1 -> View msg2
map fn doc =
    { title = doc.title
    , body = List.map (Element.map fn) doc.body
    }
