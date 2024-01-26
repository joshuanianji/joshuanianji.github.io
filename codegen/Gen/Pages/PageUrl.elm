module Gen.Pages.PageUrl exposing (annotation_, call_, make_, moduleName_, parseQueryParams, toUrl, values_)

{-| 
@docs values_, call_, make_, annotation_, parseQueryParams, toUrl, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Pages", "PageUrl" ]


{-| toUrl: Pages.PageUrl.PageUrl -> Url.Url -}
toUrl : Elm.Expression -> Elm.Expression
toUrl toUrlArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Pages", "PageUrl" ]
            , name = "toUrl"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Pages", "PageUrl" ] "PageUrl" [] ]
                        (Type.namedWith [ "Url" ] "Url" [])
                    )
            }
        )
        [ toUrlArg ]


{-| parseQueryParams: String -> Dict.Dict String (List String) -}
parseQueryParams : String -> Elm.Expression
parseQueryParams parseQueryParamsArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Pages", "PageUrl" ]
            , name = "parseQueryParams"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "Dict" ]
                            "Dict"
                            [ Type.string, Type.list Type.string ]
                        )
                    )
            }
        )
        [ Elm.string parseQueryParamsArg ]


annotation_ : { pageUrl : Type.Annotation }
annotation_ =
    { pageUrl =
        Type.alias
            moduleName_
            "PageUrl"
            []
            (Type.record
                [ ( "protocol", Type.namedWith [ "Url" ] "Protocol" [] )
                , ( "host", Type.string )
                , ( "port_", Type.maybe Type.int )
                , ( "path", Type.namedWith [ "UrlPath" ] "UrlPath" [] )
                , ( "query"
                  , Type.namedWith
                        [ "Dict" ]
                        "Dict"
                        [ Type.string, Type.list Type.string ]
                  )
                , ( "fragment", Type.maybe Type.string )
                ]
            )
    }


make_ :
    { pageUrl :
        { protocol : Elm.Expression
        , host : Elm.Expression
        , port_ : Elm.Expression
        , path : Elm.Expression
        , query : Elm.Expression
        , fragment : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { pageUrl =
        \pageUrl_args ->
            Elm.withType
                (Type.alias
                    [ "Pages", "PageUrl" ]
                    "PageUrl"
                    []
                    (Type.record
                        [ ( "protocol", Type.namedWith [ "Url" ] "Protocol" [] )
                        , ( "host", Type.string )
                        , ( "port_", Type.maybe Type.int )
                        , ( "path", Type.namedWith [ "UrlPath" ] "UrlPath" [] )
                        , ( "query"
                          , Type.namedWith
                                [ "Dict" ]
                                "Dict"
                                [ Type.string, Type.list Type.string ]
                          )
                        , ( "fragment", Type.maybe Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "protocol" pageUrl_args.protocol
                    , Tuple.pair "host" pageUrl_args.host
                    , Tuple.pair "port_" pageUrl_args.port_
                    , Tuple.pair "path" pageUrl_args.path
                    , Tuple.pair "query" pageUrl_args.query
                    , Tuple.pair "fragment" pageUrl_args.fragment
                    ]
                )
    }


call_ :
    { toUrl : Elm.Expression -> Elm.Expression
    , parseQueryParams : Elm.Expression -> Elm.Expression
    }
call_ =
    { toUrl =
        \toUrlArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Pages", "PageUrl" ]
                    , name = "toUrl"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Pages", "PageUrl" ]
                                    "PageUrl"
                                    []
                                ]
                                (Type.namedWith [ "Url" ] "Url" [])
                            )
                    }
                )
                [ toUrlArg ]
    , parseQueryParams =
        \parseQueryParamsArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Pages", "PageUrl" ]
                    , name = "parseQueryParams"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.namedWith
                                    [ "Dict" ]
                                    "Dict"
                                    [ Type.string, Type.list Type.string ]
                                )
                            )
                    }
                )
                [ parseQueryParamsArg ]
    }


values_ : { toUrl : Elm.Expression, parseQueryParams : Elm.Expression }
values_ =
    { toUrl =
        Elm.value
            { importFrom = [ "Pages", "PageUrl" ]
            , name = "toUrl"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Pages", "PageUrl" ] "PageUrl" [] ]
                        (Type.namedWith [ "Url" ] "Url" [])
                    )
            }
    , parseQueryParams =
        Elm.value
            { importFrom = [ "Pages", "PageUrl" ]
            , name = "parseQueryParams"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "Dict" ]
                            "Dict"
                            [ Type.string, Type.list Type.string ]
                        )
                    )
            }
    }


