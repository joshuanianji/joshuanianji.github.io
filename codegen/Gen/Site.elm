module Gen.Site exposing (config, moduleName_, values_)

{-| 
@docs values_, config, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Site" ]


{-| config: SiteConfig -}
config : Elm.Expression
config =
    Elm.value
        { importFrom = [ "Site" ]
        , name = "config"
        , annotation = Just (Type.namedWith [] "SiteConfig" [])
        }


values_ : { config : Elm.Expression }
values_ =
    { config =
        Elm.value
            { importFrom = [ "Site" ]
            , name = "config"
            , annotation = Just (Type.namedWith [] "SiteConfig" [])
            }
    }


