module UiFramework.Text exposing (body, title)

{-
   This is where I put all the font attributes and whatnot
-}

import Element exposing (Attribute)
import Element.Font as Font
import Model exposing (Msg)



-- body text


body : Attribute Msg
body =
    Font.family
        [ Font.external
            { name = "Open Sans"
            , url = "https://fonts.googleapis.com/css?family=Open+Sans:300"
            }
        , Font.sansSerif
        ]


title : Attribute Msg
title =
    Font.family
        [ Font.external
            { name = "Antic Didone"
            , url = "https://fonts.googleapis.com/css?family=Antic+Didone"
            }
        , Font.sansSerif
        ]
