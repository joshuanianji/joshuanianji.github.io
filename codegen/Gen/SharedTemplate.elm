module Gen.SharedTemplate exposing (annotation_, make_, moduleName_)

{-| 
@docs make_, annotation_, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "SharedTemplate" ]


annotation_ :
    { sharedTemplate :
        Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
    }
annotation_ =
    { sharedTemplate =
        \sharedTemplateArg0 sharedTemplateArg1 sharedTemplateArg2 sharedTemplateArg3 ->
            Type.alias
                moduleName_
                "SharedTemplate"
                [ sharedTemplateArg0
                , sharedTemplateArg1
                , sharedTemplateArg2
                , sharedTemplateArg3
                ]
                (Type.record
                    [ ( "init"
                      , Type.function
                            [ Type.namedWith [] "Flags" []
                            , Type.namedWith
                                []
                                "Maybe"
                                [ Type.record
                                    [ ( "path"
                                      , Type.record
                                            [ ( "path"
                                              , Type.namedWith [] "UrlPath" []
                                              )
                                            , ( "query"
                                              , Type.namedWith
                                                    []
                                                    "Maybe"
                                                    [ Type.string ]
                                              )
                                            , ( "fragment"
                                              , Type.namedWith
                                                    []
                                                    "Maybe"
                                                    [ Type.string ]
                                              )
                                            ]
                                      )
                                    , ( "metadata"
                                      , Type.namedWith
                                            []
                                            "Maybe"
                                            [ Type.namedWith [] "Route" [] ]
                                      )
                                    , ( "pageUrl"
                                      , Type.namedWith
                                            []
                                            "Maybe"
                                            [ Type.namedWith [] "PageUrl" [] ]
                                      )
                                    ]
                                ]
                            ]
                            (Type.tuple
                                (Type.var "sharedModel")
                                (Type.namedWith [] "Effect" [ Type.var "msg" ])
                            )
                      )
                    , ( "update"
                      , Type.function
                            [ Type.var "msg", Type.var "sharedModel" ]
                            (Type.tuple
                                (Type.var "sharedModel")
                                (Type.namedWith [] "Effect" [ Type.var "msg" ])
                            )
                      )
                    , ( "view"
                      , Type.function
                            [ Type.var "sharedData"
                            , Type.record
                                [ ( "path", Type.namedWith [] "UrlPath" [] )
                                , ( "route"
                                  , Type.namedWith
                                        []
                                        "Maybe"
                                        [ Type.namedWith [] "Route" [] ]
                                  )
                                ]
                            , Type.var "sharedModel"
                            , Type.function
                                [ Type.var "msg" ]
                                (Type.var "mappedMsg")
                            , Type.namedWith [] "View" [ Type.var "mappedMsg" ]
                            ]
                            (Type.record
                                [ ( "body"
                                  , Type.list
                                        (Type.namedWith
                                            []
                                            "Html"
                                            [ Type.var "mappedMsg" ]
                                        )
                                  )
                                , ( "title", Type.string )
                                ]
                            )
                      )
                    , ( "data"
                      , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.var "sharedData"
                            ]
                      )
                    , ( "subscriptions"
                      , Type.function
                            [ Type.namedWith [] "UrlPath" []
                            , Type.var "sharedModel"
                            ]
                            (Type.namedWith [] "Sub" [ Type.var "msg" ])
                      )
                    , ( "onPageChange"
                      , Type.namedWith
                            []
                            "Maybe"
                            [ Type.function
                                [ Type.record
                                    [ ( "path", Type.namedWith [] "UrlPath" [] )
                                    , ( "query"
                                      , Type.namedWith
                                            []
                                            "Maybe"
                                            [ Type.string ]
                                      )
                                    , ( "fragment"
                                      , Type.namedWith
                                            []
                                            "Maybe"
                                            [ Type.string ]
                                      )
                                    ]
                                ]
                                (Type.var "msg")
                            ]
                      )
                    ]
                )
    }


make_ :
    { sharedTemplate :
        { init : Elm.Expression
        , update : Elm.Expression
        , view : Elm.Expression
        , data : Elm.Expression
        , subscriptions : Elm.Expression
        , onPageChange : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { sharedTemplate =
        \sharedTemplate_args ->
            Elm.withType
                (Type.alias
                    [ "SharedTemplate" ]
                    "SharedTemplate"
                    [ Type.var "msg"
                    , Type.var "sharedModel"
                    , Type.var "sharedData"
                    , Type.var "mappedMsg"
                    ]
                    (Type.record
                        [ ( "init"
                          , Type.function
                                [ Type.namedWith [] "Flags" []
                                , Type.namedWith
                                    []
                                    "Maybe"
                                    [ Type.record
                                        [ ( "path"
                                          , Type.record
                                                [ ( "path"
                                                  , Type.namedWith
                                                        []
                                                        "UrlPath"
                                                        []
                                                  )
                                                , ( "query"
                                                  , Type.namedWith
                                                        []
                                                        "Maybe"
                                                        [ Type.string ]
                                                  )
                                                , ( "fragment"
                                                  , Type.namedWith
                                                        []
                                                        "Maybe"
                                                        [ Type.string ]
                                                  )
                                                ]
                                          )
                                        , ( "metadata"
                                          , Type.namedWith
                                                []
                                                "Maybe"
                                                [ Type.namedWith [] "Route" [] ]
                                          )
                                        , ( "pageUrl"
                                          , Type.namedWith
                                                []
                                                "Maybe"
                                                [ Type.namedWith [] "PageUrl" []
                                                ]
                                          )
                                        ]
                                    ]
                                ]
                                (Type.tuple
                                    (Type.var "sharedModel")
                                    (Type.namedWith
                                        []
                                        "Effect"
                                        [ Type.var "msg" ]
                                    )
                                )
                          )
                        , ( "update"
                          , Type.function
                                [ Type.var "msg", Type.var "sharedModel" ]
                                (Type.tuple
                                    (Type.var "sharedModel")
                                    (Type.namedWith
                                        []
                                        "Effect"
                                        [ Type.var "msg" ]
                                    )
                                )
                          )
                        , ( "view"
                          , Type.function
                                [ Type.var "sharedData"
                                , Type.record
                                    [ ( "path", Type.namedWith [] "UrlPath" [] )
                                    , ( "route"
                                      , Type.namedWith
                                            []
                                            "Maybe"
                                            [ Type.namedWith [] "Route" [] ]
                                      )
                                    ]
                                , Type.var "sharedModel"
                                , Type.function
                                    [ Type.var "msg" ]
                                    (Type.var "mappedMsg")
                                , Type.namedWith
                                    []
                                    "View"
                                    [ Type.var "mappedMsg" ]
                                ]
                                (Type.record
                                    [ ( "body"
                                      , Type.list
                                            (Type.namedWith
                                                []
                                                "Html"
                                                [ Type.var "mappedMsg" ]
                                            )
                                      )
                                    , ( "title", Type.string )
                                    ]
                                )
                          )
                        , ( "data"
                          , Type.namedWith
                                [ "BackendTask" ]
                                "BackendTask"
                                [ Type.namedWith [] "FatalError" []
                                , Type.var "sharedData"
                                ]
                          )
                        , ( "subscriptions"
                          , Type.function
                                [ Type.namedWith [] "UrlPath" []
                                , Type.var "sharedModel"
                                ]
                                (Type.namedWith [] "Sub" [ Type.var "msg" ])
                          )
                        , ( "onPageChange"
                          , Type.namedWith
                                []
                                "Maybe"
                                [ Type.function
                                    [ Type.record
                                        [ ( "path"
                                          , Type.namedWith [] "UrlPath" []
                                          )
                                        , ( "query"
                                          , Type.namedWith
                                                []
                                                "Maybe"
                                                [ Type.string ]
                                          )
                                        , ( "fragment"
                                          , Type.namedWith
                                                []
                                                "Maybe"
                                                [ Type.string ]
                                          )
                                        ]
                                    ]
                                    (Type.var "msg")
                                ]
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "init" sharedTemplate_args.init
                    , Tuple.pair "update" sharedTemplate_args.update
                    , Tuple.pair "view" sharedTemplate_args.view
                    , Tuple.pair "data" sharedTemplate_args.data
                    , Tuple.pair
                        "subscriptions"
                        sharedTemplate_args.subscriptions
                    , Tuple.pair "onPageChange" sharedTemplate_args.onPageChange
                    ]
                )
    }


