module UiFramework.Text exposing (body, title)

{-
   This is where I put all the font attributes and whatnot
-}

import Element exposing (Attribute)
import Element.Font as Font



-- body text


body : Attribute msg
body =
    Font.family
        [ Font.external
            { name = "Open Sans"
            , url = "https://fonts.googleapis.com/css?family=Open+Sans:300"
            }
        , Font.sansSerif
        ]


title : Attribute msg
title =
    Font.family
        [ Font.external
            { name = "Antic Didone"
            , url = "https://fonts.googleapis.com/css?family=Antic+Didone"
            }
        , Font.sansSerif
        ]
