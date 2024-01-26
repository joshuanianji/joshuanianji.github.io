module Gen.SiteConfig exposing (annotation_, make_, moduleName_)

{-| 
@docs make_, annotation_, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "SiteConfig" ]


annotation_ : { siteConfig : Type.Annotation }
annotation_ =
    { siteConfig =
        Type.alias
            moduleName_
            "SiteConfig"
            []
            (Type.record
                [ ( "canonicalUrl", Type.string )
                , ( "head"
                  , Type.namedWith
                        []
                        "BackendTask"
                        [ Type.namedWith [] "FatalError" []
                        , Type.list (Type.namedWith [ "Head" ] "Tag" [])
                        ]
                  )
                ]
            )
    }


make_ :
    { siteConfig :
        { canonicalUrl : Elm.Expression, head : Elm.Expression }
        -> Elm.Expression
    }
make_ =
    { siteConfig =
        \siteConfig_args ->
            Elm.withType
                (Type.alias
                    [ "SiteConfig" ]
                    "SiteConfig"
                    []
                    (Type.record
                        [ ( "canonicalUrl", Type.string )
                        , ( "head"
                          , Type.namedWith
                                []
                                "BackendTask"
                                [ Type.namedWith [] "FatalError" []
                                , Type.list (Type.namedWith [ "Head" ] "Tag" [])
                                ]
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "canonicalUrl" siteConfig_args.canonicalUrl
                    , Tuple.pair "head" siteConfig_args.head
                    ]
                )
    }


