module Gen.RouteBuilder exposing (annotation_, buildNoState, buildWithLocalState, buildWithSharedState, call_, caseOf_, make_, moduleName_, preRender, preRenderWithFallback, serverRender, single, values_, withOnAction)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, buildNoState, withOnAction, buildWithLocalState, buildWithSharedState, single, preRender, preRenderWithFallback, serverRender, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "RouteBuilder" ]


{-| {-| -}

serverRender: 
    { data :
        routeParams
        -> Server.Request.Request
        -> BackendTask FatalError (Server.Response.Response data ErrorPage)
    , action :
        routeParams
        -> Server.Request.Request
        -> BackendTask FatalError (Server.Response.Response action ErrorPage)
    , head : App data action routeParams -> List Head.Tag
    }
    -> Builder routeParams data action
-}
serverRender :
    { data : Elm.Expression -> Elm.Expression -> Elm.Expression
    , action : Elm.Expression -> Elm.Expression -> Elm.Expression
    , head : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
serverRender serverRenderArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "serverRender"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "data"
                              , Type.function
                                    [ Type.var "routeParams"
                                    , Type.namedWith
                                        [ "Server", "Request" ]
                                        "Request"
                                        []
                                    ]
                                    (Type.namedWith
                                        []
                                        "BackendTask"
                                        [ Type.namedWith [] "FatalError" []
                                        , Type.namedWith
                                            [ "Server", "Response" ]
                                            "Response"
                                            [ Type.var "data"
                                            , Type.namedWith [] "ErrorPage" []
                                            ]
                                        ]
                                    )
                              )
                            , ( "action"
                              , Type.function
                                    [ Type.var "routeParams"
                                    , Type.namedWith
                                        [ "Server", "Request" ]
                                        "Request"
                                        []
                                    ]
                                    (Type.namedWith
                                        []
                                        "BackendTask"
                                        [ Type.namedWith [] "FatalError" []
                                        , Type.namedWith
                                            [ "Server", "Response" ]
                                            "Response"
                                            [ Type.var "action"
                                            , Type.namedWith [] "ErrorPage" []
                                            ]
                                        ]
                                    )
                              )
                            , ( "head"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    ]
                                    (Type.list
                                        (Type.namedWith [ "Head" ] "Tag" [])
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "data"
                (Elm.functionReduced
                    "serverRenderUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (serverRenderArg.data functionReducedUnpack)
                    )
                )
            , Tuple.pair
                "action"
                (Elm.functionReduced
                    "serverRenderUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (serverRenderArg.action functionReducedUnpack)
                    )
                )
            , Tuple.pair
                "head"
                (Elm.functionReduced "serverRenderUnpack" serverRenderArg.head)
            ]
        ]


{-| {-| -}

preRenderWithFallback: 
    { data :
        routeParams
        -> BackendTask FatalError (Server.Response.Response data ErrorPage)
    , pages : BackendTask FatalError (List routeParams)
    , head : App data action routeParams -> List Head.Tag
    }
    -> Builder routeParams data action
-}
preRenderWithFallback :
    { data : Elm.Expression -> Elm.Expression
    , pages : Elm.Expression
    , head : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
preRenderWithFallback preRenderWithFallbackArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "preRenderWithFallback"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "data"
                              , Type.function
                                    [ Type.var "routeParams" ]
                                    (Type.namedWith
                                        []
                                        "BackendTask"
                                        [ Type.namedWith [] "FatalError" []
                                        , Type.namedWith
                                            [ "Server", "Response" ]
                                            "Response"
                                            [ Type.var "data"
                                            , Type.namedWith [] "ErrorPage" []
                                            ]
                                        ]
                                    )
                              )
                            , ( "pages"
                              , Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.list (Type.var "routeParams")
                                    ]
                              )
                            , ( "head"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    ]
                                    (Type.list
                                        (Type.namedWith [ "Head" ] "Tag" [])
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "data"
                (Elm.functionReduced
                    "preRenderWithFallbackUnpack"
                    preRenderWithFallbackArg.data
                )
            , Tuple.pair "pages" preRenderWithFallbackArg.pages
            , Tuple.pair
                "head"
                (Elm.functionReduced
                    "preRenderWithFallbackUnpack"
                    preRenderWithFallbackArg.head
                )
            ]
        ]


{-| {-| -}

preRender: 
    { data : routeParams -> BackendTask FatalError data
    , pages : BackendTask FatalError (List routeParams)
    , head : App data action routeParams -> List Head.Tag
    }
    -> Builder routeParams data action
-}
preRender :
    { data : Elm.Expression -> Elm.Expression
    , pages : Elm.Expression
    , head : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
preRender preRenderArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "preRender"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "data"
                              , Type.function
                                    [ Type.var "routeParams" ]
                                    (Type.namedWith
                                        []
                                        "BackendTask"
                                        [ Type.namedWith [] "FatalError" []
                                        , Type.var "data"
                                        ]
                                    )
                              )
                            , ( "pages"
                              , Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.list (Type.var "routeParams")
                                    ]
                              )
                            , ( "head"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    ]
                                    (Type.list
                                        (Type.namedWith [ "Head" ] "Tag" [])
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "data"
                (Elm.functionReduced "preRenderUnpack" preRenderArg.data)
            , Tuple.pair "pages" preRenderArg.pages
            , Tuple.pair
                "head"
                (Elm.functionReduced "preRenderUnpack" preRenderArg.head)
            ]
        ]


{-| {-| -}

single: 
    { data : BackendTask FatalError data
    , head : App data action {} -> List Head.Tag
    }
    -> Builder {} data action
-}
single :
    { data : Elm.Expression, head : Elm.Expression -> Elm.Expression }
    -> Elm.Expression
single singleArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "single"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "data"
                              , Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.var "data"
                                    ]
                              )
                            , ( "head"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.record []
                                        ]
                                    ]
                                    (Type.list
                                        (Type.namedWith [ "Head" ] "Tag" [])
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            []
                            "Builder"
                            [ Type.record []
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair "data" singleArg.data
            , Tuple.pair
                "head"
                (Elm.functionReduced "singleUnpack" singleArg.head)
            ]
        ]


{-| {-| -}

buildWithSharedState: 
    { view :
        App data action routeParams -> Shared.Model -> model -> View (PagesMsg msg)
    , init : App data action routeParams -> Shared.Model -> ( model, Effect msg )
    , update :
        App data action routeParams
        -> Shared.Model
        -> msg
        -> model
        -> ( model, Effect msg, Maybe Shared.Msg )
    , subscriptions : routeParams -> UrlPath -> Shared.Model -> model -> Sub msg
    }
    -> Builder routeParams data action
    -> StatefulRoute routeParams data action model msg
-}
buildWithSharedState :
    { view :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , init : Elm.Expression -> Elm.Expression -> Elm.Expression
    , update :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , subscriptions :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    }
    -> Elm.Expression
    -> Elm.Expression
buildWithSharedState buildWithSharedStateArg buildWithSharedStateArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "buildWithSharedState"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "view"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "model"
                                    ]
                                    (Type.namedWith
                                        []
                                        "View"
                                        [ Type.namedWith
                                            []
                                            "PagesMsg"
                                            [ Type.var "msg" ]
                                        ]
                                    )
                              )
                            , ( "init"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            []
                                            "Effect"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "update"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "msg"
                                    , Type.var "model"
                                    ]
                                    (Type.triple
                                        (Type.var "model")
                                        (Type.namedWith
                                            []
                                            "Effect"
                                            [ Type.var "msg" ]
                                        )
                                        (Type.namedWith
                                            []
                                            "Maybe"
                                            [ Type.namedWith
                                                [ "Shared" ]
                                                "Msg"
                                                []
                                            ]
                                        )
                                    )
                              )
                            , ( "subscriptions"
                              , Type.function
                                    [ Type.var "routeParams"
                                    , Type.namedWith [] "UrlPath" []
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "model"
                                    ]
                                    (Type.namedWith [] "Sub" [ Type.var "msg" ])
                              )
                            ]
                        , Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        ]
                        (Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "view"
                (Elm.functionReduced
                    "buildWithSharedStateUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (buildWithSharedStateArg.view
                                         functionReducedUnpack
                                        functionReducedUnpack0
                                    )
                            )
                    )
                )
            , Tuple.pair
                "init"
                (Elm.functionReduced
                    "buildWithSharedStateUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (buildWithSharedStateArg.init functionReducedUnpack)
                    )
                )
            , Tuple.pair
                "update"
                (Elm.functionReduced
                    "buildWithSharedStateUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_0_2_2_2_1_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (buildWithSharedStateArg.update
                                                 functionReducedUnpack
                                                 functionReducedUnpack0
                                                functionReducedUnpack_2_1_2_0_2_2_2_1_0_2_0_0
                                            )
                                    )
                            )
                    )
                )
            , Tuple.pair
                "subscriptions"
                (Elm.functionReduced
                    "buildWithSharedStateUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_0_2_2_3_1_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (buildWithSharedStateArg.subscriptions
                                                 functionReducedUnpack
                                                 functionReducedUnpack0
                                                functionReducedUnpack_2_1_2_0_2_2_3_1_0_2_0_0
                                            )
                                    )
                            )
                    )
                )
            ]
        , buildWithSharedStateArg0
        ]


{-| {-| -}

buildWithLocalState: 
    { view :
        App data action routeParams -> Shared.Model -> model -> View (PagesMsg msg)
    , init : App data action routeParams -> Shared.Model -> ( model, Effect msg )
    , update :
        App data action routeParams
        -> Shared.Model
        -> msg
        -> model
        -> ( model, Effect msg )
    , subscriptions : routeParams -> UrlPath -> Shared.Model -> model -> Sub msg
    }
    -> Builder routeParams data action
    -> StatefulRoute routeParams data action model msg
-}
buildWithLocalState :
    { view :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , init : Elm.Expression -> Elm.Expression -> Elm.Expression
    , update :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , subscriptions :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    }
    -> Elm.Expression
    -> Elm.Expression
buildWithLocalState buildWithLocalStateArg buildWithLocalStateArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "buildWithLocalState"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "view"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "model"
                                    ]
                                    (Type.namedWith
                                        []
                                        "View"
                                        [ Type.namedWith
                                            []
                                            "PagesMsg"
                                            [ Type.var "msg" ]
                                        ]
                                    )
                              )
                            , ( "init"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            []
                                            "Effect"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "update"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "msg"
                                    , Type.var "model"
                                    ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            []
                                            "Effect"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "subscriptions"
                              , Type.function
                                    [ Type.var "routeParams"
                                    , Type.namedWith [] "UrlPath" []
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "model"
                                    ]
                                    (Type.namedWith [] "Sub" [ Type.var "msg" ])
                              )
                            ]
                        , Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        ]
                        (Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "view"
                (Elm.functionReduced
                    "buildWithLocalStateUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (buildWithLocalStateArg.view
                                         functionReducedUnpack
                                        functionReducedUnpack0
                                    )
                            )
                    )
                )
            , Tuple.pair
                "init"
                (Elm.functionReduced
                    "buildWithLocalStateUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (buildWithLocalStateArg.init functionReducedUnpack)
                    )
                )
            , Tuple.pair
                "update"
                (Elm.functionReduced
                    "buildWithLocalStateUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_0_2_2_2_1_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (buildWithLocalStateArg.update
                                                 functionReducedUnpack
                                                 functionReducedUnpack0
                                                functionReducedUnpack_2_1_2_0_2_2_2_1_0_2_0_0
                                            )
                                    )
                            )
                    )
                )
            , Tuple.pair
                "subscriptions"
                (Elm.functionReduced
                    "buildWithLocalStateUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_0_2_2_3_1_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (buildWithLocalStateArg.subscriptions
                                                 functionReducedUnpack
                                                 functionReducedUnpack0
                                                functionReducedUnpack_2_1_2_0_2_2_3_1_0_2_0_0
                                            )
                                    )
                            )
                    )
                )
            ]
        , buildWithLocalStateArg0
        ]


{-| {-| -}

withOnAction: 
    (action -> msg)
    -> StatefulRoute routeParams data action model msg
    -> StatefulRoute routeParams data action model msg
-}
withOnAction :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
withOnAction withOnActionArg withOnActionArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "withOnAction"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "action" ] (Type.var "msg")
                        , Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        ]
                        (Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "withOnActionUnpack" withOnActionArg
        , withOnActionArg0
        ]


{-| {-| -}

buildNoState: 
    { view : App data action routeParams -> Shared.Model -> View (PagesMsg ()) }
    -> Builder routeParams data action
    -> StatefulRoute routeParams data action {} ()
-}
buildNoState :
    { view : Elm.Expression -> Elm.Expression -> Elm.Expression }
    -> Elm.Expression
    -> Elm.Expression
buildNoState buildNoStateArg buildNoStateArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "buildNoState"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "view"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    ]
                                    (Type.namedWith
                                        []
                                        "View"
                                        [ Type.namedWith
                                            []
                                            "PagesMsg"
                                            [ Type.unit ]
                                        ]
                                    )
                              )
                            ]
                        , Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        ]
                        (Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.record []
                            , Type.unit
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "view"
                (Elm.functionReduced
                    "buildNoStateUnpack"
                    (\functionReducedUnpack ->
                        Elm.functionReduced
                            "unpack"
                            (buildNoStateArg.view functionReducedUnpack)
                    )
                )
            ]
        , buildNoStateArg0
        ]


annotation_ :
    { app :
        Type.Annotation -> Type.Annotation -> Type.Annotation -> Type.Annotation
    , statelessRoute :
        Type.Annotation -> Type.Annotation -> Type.Annotation -> Type.Annotation
    , statefulRoute :
        Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
    , builder :
        Type.Annotation -> Type.Annotation -> Type.Annotation -> Type.Annotation
    }
annotation_ =
    { app =
        \appArg0 appArg1 appArg2 ->
            Type.alias
                moduleName_
                "App"
                [ appArg0, appArg1, appArg2 ]
                (Type.record
                    [ ( "data", Type.var "data" )
                    , ( "sharedData", Type.namedWith [ "Shared" ] "Data" [] )
                    , ( "routeParams", Type.var "routeParams" )
                    , ( "path", Type.namedWith [] "UrlPath" [] )
                    , ( "url"
                      , Type.namedWith
                            []
                            "Maybe"
                            [ Type.namedWith [] "PageUrl" [] ]
                      )
                    , ( "action"
                      , Type.namedWith [] "Maybe" [ Type.var "action" ]
                      )
                    , ( "submit"
                      , Type.function
                            [ Type.record
                                [ ( "fields"
                                  , Type.list
                                        (Type.tuple Type.string Type.string)
                                  )
                                , ( "headers"
                                  , Type.list
                                        (Type.tuple Type.string Type.string)
                                  )
                                ]
                            ]
                            (Type.namedWith
                                [ "Pages", "Fetcher" ]
                                "Fetcher"
                                [ Type.namedWith
                                    []
                                    "Result"
                                    [ Type.namedWith [ "Http" ] "Error" []
                                    , Type.var "action"
                                    ]
                                ]
                            )
                      )
                    , ( "navigation"
                      , Type.namedWith
                            []
                            "Maybe"
                            [ Type.namedWith
                                [ "Pages", "Navigation" ]
                                "Navigation"
                                []
                            ]
                      )
                    , ( "concurrentSubmissions"
                      , Type.namedWith
                            []
                            "Dict"
                            [ Type.string
                            , Type.namedWith
                                [ "Pages", "ConcurrentSubmission" ]
                                "ConcurrentSubmission"
                                [ Type.namedWith
                                    []
                                    "Maybe"
                                    [ Type.var "action" ]
                                ]
                            ]
                      )
                    , ( "pageFormState", Type.namedWith [ "Form" ] "Model" [] )
                    ]
                )
    , statelessRoute =
        \statelessRouteArg0 statelessRouteArg1 statelessRouteArg2 ->
            Type.alias
                moduleName_
                "StatelessRoute"
                [ statelessRouteArg0, statelessRouteArg1, statelessRouteArg2 ]
                (Type.namedWith
                    []
                    "StatefulRoute"
                    [ Type.var "routeParams"
                    , Type.var "data"
                    , Type.var "action"
                    , Type.record []
                    , Type.unit
                    ]
                )
    , statefulRoute =
        \statefulRouteArg0 statefulRouteArg1 statefulRouteArg2 statefulRouteArg3 statefulRouteArg4 ->
            Type.alias
                moduleName_
                "StatefulRoute"
                [ statefulRouteArg0
                , statefulRouteArg1
                , statefulRouteArg2
                , statefulRouteArg3
                , statefulRouteArg4
                ]
                (Type.record
                    [ ( "data"
                      , Type.function
                            [ Type.namedWith
                                [ "Server", "Request" ]
                                "Request"
                                []
                            , Type.var "routeParams"
                            ]
                            (Type.namedWith
                                []
                                "BackendTask"
                                [ Type.namedWith [] "FatalError" []
                                , Type.namedWith
                                    [ "Server", "Response" ]
                                    "Response"
                                    [ Type.var "data"
                                    , Type.namedWith [] "ErrorPage" []
                                    ]
                                ]
                            )
                      )
                    , ( "action"
                      , Type.function
                            [ Type.namedWith
                                [ "Server", "Request" ]
                                "Request"
                                []
                            , Type.var "routeParams"
                            ]
                            (Type.namedWith
                                []
                                "BackendTask"
                                [ Type.namedWith [] "FatalError" []
                                , Type.namedWith
                                    [ "Server", "Response" ]
                                    "Response"
                                    [ Type.var "action"
                                    , Type.namedWith [] "ErrorPage" []
                                    ]
                                ]
                            )
                      )
                    , ( "staticRoutes"
                      , Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.list (Type.var "routeParams")
                            ]
                      )
                    , ( "view"
                      , Type.function
                            [ Type.namedWith [ "Shared" ] "Model" []
                            , Type.var "model"
                            , Type.namedWith
                                []
                                "App"
                                [ Type.var "data"
                                , Type.var "action"
                                , Type.var "routeParams"
                                ]
                            ]
                            (Type.namedWith
                                []
                                "View"
                                [ Type.namedWith
                                    []
                                    "PagesMsg"
                                    [ Type.var "msg" ]
                                ]
                            )
                      )
                    , ( "head"
                      , Type.function
                            [ Type.namedWith
                                []
                                "App"
                                [ Type.var "data"
                                , Type.var "action"
                                , Type.var "routeParams"
                                ]
                            ]
                            (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                      )
                    , ( "init"
                      , Type.function
                            [ Type.namedWith [ "Shared" ] "Model" []
                            , Type.namedWith
                                []
                                "App"
                                [ Type.var "data"
                                , Type.var "action"
                                , Type.var "routeParams"
                                ]
                            ]
                            (Type.tuple
                                (Type.var "model")
                                (Type.namedWith [] "Effect" [ Type.var "msg" ])
                            )
                      )
                    , ( "update"
                      , Type.function
                            [ Type.namedWith
                                []
                                "App"
                                [ Type.var "data"
                                , Type.var "action"
                                , Type.var "routeParams"
                                ]
                            , Type.var "msg"
                            , Type.var "model"
                            , Type.namedWith [ "Shared" ] "Model" []
                            ]
                            (Type.triple
                                (Type.var "model")
                                (Type.namedWith [] "Effect" [ Type.var "msg" ])
                                (Type.namedWith
                                    []
                                    "Maybe"
                                    [ Type.namedWith [ "Shared" ] "Msg" [] ]
                                )
                            )
                      )
                    , ( "subscriptions"
                      , Type.function
                            [ Type.var "routeParams"
                            , Type.namedWith [] "UrlPath" []
                            , Type.var "model"
                            , Type.namedWith [ "Shared" ] "Model" []
                            ]
                            (Type.namedWith [] "Sub" [ Type.var "msg" ])
                      )
                    , ( "handleRoute"
                      , Type.function
                            [ Type.record
                                [ ( "moduleName", Type.list Type.string )
                                , ( "routePattern"
                                  , Type.namedWith [] "RoutePattern" []
                                  )
                                ]
                            , Type.function
                                [ Type.var "routeParams" ]
                                (Type.list (Type.tuple Type.string Type.string))
                            , Type.var "routeParams"
                            ]
                            (Type.namedWith
                                []
                                "BackendTask"
                                [ Type.namedWith [] "FatalError" []
                                , Type.namedWith
                                    []
                                    "Maybe"
                                    [ Type.namedWith [] "NotFoundReason" [] ]
                                ]
                            )
                      )
                    , ( "kind", Type.string )
                    , ( "onAction"
                      , Type.namedWith
                            []
                            "Maybe"
                            [ Type.function
                                [ Type.var "action" ]
                                (Type.var "msg")
                            ]
                      )
                    ]
                )
    , builder =
        \builderArg0 builderArg1 builderArg2 ->
            Type.namedWith
                [ "RouteBuilder" ]
                "Builder"
                [ builderArg0, builderArg1, builderArg2 ]
    }


make_ :
    { app :
        { data : Elm.Expression
        , sharedData : Elm.Expression
        , routeParams : Elm.Expression
        , path : Elm.Expression
        , url : Elm.Expression
        , action : Elm.Expression
        , submit : Elm.Expression
        , navigation : Elm.Expression
        , concurrentSubmissions : Elm.Expression
        , pageFormState : Elm.Expression
        }
        -> Elm.Expression
    , statefulRoute :
        { data : Elm.Expression
        , action : Elm.Expression
        , staticRoutes : Elm.Expression
        , view : Elm.Expression
        , head : Elm.Expression
        , init : Elm.Expression
        , update : Elm.Expression
        , subscriptions : Elm.Expression
        , handleRoute : Elm.Expression
        , kind : Elm.Expression
        , onAction : Elm.Expression
        }
        -> Elm.Expression
    , withData : Elm.Expression -> Elm.Expression
    }
make_ =
    { app =
        \app_args ->
            Elm.withType
                (Type.alias
                    [ "RouteBuilder" ]
                    "App"
                    [ Type.var "data"
                    , Type.var "action"
                    , Type.var "routeParams"
                    ]
                    (Type.record
                        [ ( "data", Type.var "data" )
                        , ( "sharedData"
                          , Type.namedWith [ "Shared" ] "Data" []
                          )
                        , ( "routeParams", Type.var "routeParams" )
                        , ( "path", Type.namedWith [] "UrlPath" [] )
                        , ( "url"
                          , Type.namedWith
                                []
                                "Maybe"
                                [ Type.namedWith [] "PageUrl" [] ]
                          )
                        , ( "action"
                          , Type.namedWith [] "Maybe" [ Type.var "action" ]
                          )
                        , ( "submit"
                          , Type.function
                                [ Type.record
                                    [ ( "fields"
                                      , Type.list
                                            (Type.tuple Type.string Type.string)
                                      )
                                    , ( "headers"
                                      , Type.list
                                            (Type.tuple Type.string Type.string)
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Pages", "Fetcher" ]
                                    "Fetcher"
                                    [ Type.namedWith
                                        []
                                        "Result"
                                        [ Type.namedWith [ "Http" ] "Error" []
                                        , Type.var "action"
                                        ]
                                    ]
                                )
                          )
                        , ( "navigation"
                          , Type.namedWith
                                []
                                "Maybe"
                                [ Type.namedWith
                                    [ "Pages", "Navigation" ]
                                    "Navigation"
                                    []
                                ]
                          )
                        , ( "concurrentSubmissions"
                          , Type.namedWith
                                []
                                "Dict"
                                [ Type.string
                                , Type.namedWith
                                    [ "Pages", "ConcurrentSubmission" ]
                                    "ConcurrentSubmission"
                                    [ Type.namedWith
                                        []
                                        "Maybe"
                                        [ Type.var "action" ]
                                    ]
                                ]
                          )
                        , ( "pageFormState"
                          , Type.namedWith [ "Form" ] "Model" []
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "data" app_args.data
                    , Tuple.pair "sharedData" app_args.sharedData
                    , Tuple.pair "routeParams" app_args.routeParams
                    , Tuple.pair "path" app_args.path
                    , Tuple.pair "url" app_args.url
                    , Tuple.pair "action" app_args.action
                    , Tuple.pair "submit" app_args.submit
                    , Tuple.pair "navigation" app_args.navigation
                    , Tuple.pair
                        "concurrentSubmissions"
                        app_args.concurrentSubmissions
                    , Tuple.pair "pageFormState" app_args.pageFormState
                    ]
                )
    , statefulRoute =
        \statefulRoute_args ->
            Elm.withType
                (Type.alias
                    [ "RouteBuilder" ]
                    "StatefulRoute"
                    [ Type.var "routeParams"
                    , Type.var "data"
                    , Type.var "action"
                    , Type.var "model"
                    , Type.var "msg"
                    ]
                    (Type.record
                        [ ( "data"
                          , Type.function
                                [ Type.namedWith
                                    [ "Server", "Request" ]
                                    "Request"
                                    []
                                , Type.var "routeParams"
                                ]
                                (Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.namedWith
                                        [ "Server", "Response" ]
                                        "Response"
                                        [ Type.var "data"
                                        , Type.namedWith [] "ErrorPage" []
                                        ]
                                    ]
                                )
                          )
                        , ( "action"
                          , Type.function
                                [ Type.namedWith
                                    [ "Server", "Request" ]
                                    "Request"
                                    []
                                , Type.var "routeParams"
                                ]
                                (Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.namedWith
                                        [ "Server", "Response" ]
                                        "Response"
                                        [ Type.var "action"
                                        , Type.namedWith [] "ErrorPage" []
                                        ]
                                    ]
                                )
                          )
                        , ( "staticRoutes"
                          , Type.namedWith
                                []
                                "BackendTask"
                                [ Type.namedWith [] "FatalError" []
                                , Type.list (Type.var "routeParams")
                                ]
                          )
                        , ( "view"
                          , Type.function
                                [ Type.namedWith [ "Shared" ] "Model" []
                                , Type.var "model"
                                , Type.namedWith
                                    []
                                    "App"
                                    [ Type.var "data"
                                    , Type.var "action"
                                    , Type.var "routeParams"
                                    ]
                                ]
                                (Type.namedWith
                                    []
                                    "View"
                                    [ Type.namedWith
                                        []
                                        "PagesMsg"
                                        [ Type.var "msg" ]
                                    ]
                                )
                          )
                        , ( "head"
                          , Type.function
                                [ Type.namedWith
                                    []
                                    "App"
                                    [ Type.var "data"
                                    , Type.var "action"
                                    , Type.var "routeParams"
                                    ]
                                ]
                                (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                          )
                        , ( "init"
                          , Type.function
                                [ Type.namedWith [ "Shared" ] "Model" []
                                , Type.namedWith
                                    []
                                    "App"
                                    [ Type.var "data"
                                    , Type.var "action"
                                    , Type.var "routeParams"
                                    ]
                                ]
                                (Type.tuple
                                    (Type.var "model")
                                    (Type.namedWith
                                        []
                                        "Effect"
                                        [ Type.var "msg" ]
                                    )
                                )
                          )
                        , ( "update"
                          , Type.function
                                [ Type.namedWith
                                    []
                                    "App"
                                    [ Type.var "data"
                                    , Type.var "action"
                                    , Type.var "routeParams"
                                    ]
                                , Type.var "msg"
                                , Type.var "model"
                                , Type.namedWith [ "Shared" ] "Model" []
                                ]
                                (Type.triple
                                    (Type.var "model")
                                    (Type.namedWith
                                        []
                                        "Effect"
                                        [ Type.var "msg" ]
                                    )
                                    (Type.namedWith
                                        []
                                        "Maybe"
                                        [ Type.namedWith [ "Shared" ] "Msg" [] ]
                                    )
                                )
                          )
                        , ( "subscriptions"
                          , Type.function
                                [ Type.var "routeParams"
                                , Type.namedWith [] "UrlPath" []
                                , Type.var "model"
                                , Type.namedWith [ "Shared" ] "Model" []
                                ]
                                (Type.namedWith [] "Sub" [ Type.var "msg" ])
                          )
                        , ( "handleRoute"
                          , Type.function
                                [ Type.record
                                    [ ( "moduleName", Type.list Type.string )
                                    , ( "routePattern"
                                      , Type.namedWith [] "RoutePattern" []
                                      )
                                    ]
                                , Type.function
                                    [ Type.var "routeParams" ]
                                    (Type.list
                                        (Type.tuple Type.string Type.string)
                                    )
                                , Type.var "routeParams"
                                ]
                                (Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.namedWith
                                        []
                                        "Maybe"
                                        [ Type.namedWith [] "NotFoundReason" []
                                        ]
                                    ]
                                )
                          )
                        , ( "kind", Type.string )
                        , ( "onAction"
                          , Type.namedWith
                                []
                                "Maybe"
                                [ Type.function
                                    [ Type.var "action" ]
                                    (Type.var "msg")
                                ]
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "data" statefulRoute_args.data
                    , Tuple.pair "action" statefulRoute_args.action
                    , Tuple.pair "staticRoutes" statefulRoute_args.staticRoutes
                    , Tuple.pair "view" statefulRoute_args.view
                    , Tuple.pair "head" statefulRoute_args.head
                    , Tuple.pair "init" statefulRoute_args.init
                    , Tuple.pair "update" statefulRoute_args.update
                    , Tuple.pair
                        "subscriptions"
                        statefulRoute_args.subscriptions
                    , Tuple.pair "handleRoute" statefulRoute_args.handleRoute
                    , Tuple.pair "kind" statefulRoute_args.kind
                    , Tuple.pair "onAction" statefulRoute_args.onAction
                    ]
                )
    , withData =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "RouteBuilder" ]
                    , name = "WithData"
                    , annotation =
                        Just
                            (Type.namedWith
                                []
                                "Builder"
                                [ Type.var "routeParams"
                                , Type.var "data"
                                , Type.var "action"
                                ]
                            )
                    }
                )
                [ ar0 ]
    }


caseOf_ :
    { builder :
        Elm.Expression
        -> { builderTags_0_0 | withData : Elm.Expression -> Elm.Expression }
        -> Elm.Expression
    }
caseOf_ =
    { builder =
        \builderExpression builderTags ->
            Elm.Case.custom
                builderExpression
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "Builder"
                    [ Type.var "routeParams"
                    , Type.var "data"
                    , Type.var "action"
                    ]
                )
                [ Elm.Case.branch1
                    "WithData"
                    ( "one"
                    , Type.record
                        [ ( "data"
                          , Type.function
                                [ Type.namedWith
                                    [ "Server", "Request" ]
                                    "Request"
                                    []
                                , Type.var "routeParams"
                                ]
                                (Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.namedWith
                                        [ "Server", "Response" ]
                                        "Response"
                                        [ Type.var "data"
                                        , Type.namedWith [] "ErrorPage" []
                                        ]
                                    ]
                                )
                          )
                        , ( "action"
                          , Type.function
                                [ Type.namedWith
                                    [ "Server", "Request" ]
                                    "Request"
                                    []
                                , Type.var "routeParams"
                                ]
                                (Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.namedWith
                                        [ "Server", "Response" ]
                                        "Response"
                                        [ Type.var "action"
                                        , Type.namedWith [] "ErrorPage" []
                                        ]
                                    ]
                                )
                          )
                        , ( "staticRoutes"
                          , Type.namedWith
                                []
                                "BackendTask"
                                [ Type.namedWith [] "FatalError" []
                                , Type.list (Type.var "routeParams")
                                ]
                          )
                        , ( "head"
                          , Type.function
                                [ Type.namedWith
                                    []
                                    "App"
                                    [ Type.var "data"
                                    , Type.var "action"
                                    , Type.var "routeParams"
                                    ]
                                ]
                                (Type.list (Type.namedWith [ "Head" ] "Tag" []))
                          )
                        , ( "serverless", Type.bool )
                        , ( "handleRoute"
                          , Type.function
                                [ Type.record
                                    [ ( "moduleName", Type.list Type.string )
                                    , ( "routePattern"
                                      , Type.namedWith [] "RoutePattern" []
                                      )
                                    ]
                                , Type.function
                                    [ Type.var "routeParams" ]
                                    (Type.list
                                        (Type.tuple Type.string Type.string)
                                    )
                                , Type.var "routeParams"
                                ]
                                (Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.namedWith
                                        []
                                        "Maybe"
                                        [ Type.namedWith [] "NotFoundReason" []
                                        ]
                                    ]
                                )
                          )
                        , ( "kind", Type.string )
                        ]
                    )
                    builderTags.withData
                ]
    }


call_ :
    { serverRender : Elm.Expression -> Elm.Expression
    , preRenderWithFallback : Elm.Expression -> Elm.Expression
    , preRender : Elm.Expression -> Elm.Expression
    , single : Elm.Expression -> Elm.Expression
    , buildWithSharedState : Elm.Expression -> Elm.Expression -> Elm.Expression
    , buildWithLocalState : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withOnAction : Elm.Expression -> Elm.Expression -> Elm.Expression
    , buildNoState : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { serverRender =
        \serverRenderArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "RouteBuilder" ]
                    , name = "serverRender"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "data"
                                      , Type.function
                                            [ Type.var "routeParams"
                                            , Type.namedWith
                                                [ "Server", "Request" ]
                                                "Request"
                                                []
                                            ]
                                            (Type.namedWith
                                                []
                                                "BackendTask"
                                                [ Type.namedWith
                                                    []
                                                    "FatalError"
                                                    []
                                                , Type.namedWith
                                                    [ "Server", "Response" ]
                                                    "Response"
                                                    [ Type.var "data"
                                                    , Type.namedWith
                                                        []
                                                        "ErrorPage"
                                                        []
                                                    ]
                                                ]
                                            )
                                      )
                                    , ( "action"
                                      , Type.function
                                            [ Type.var "routeParams"
                                            , Type.namedWith
                                                [ "Server", "Request" ]
                                                "Request"
                                                []
                                            ]
                                            (Type.namedWith
                                                []
                                                "BackendTask"
                                                [ Type.namedWith
                                                    []
                                                    "FatalError"
                                                    []
                                                , Type.namedWith
                                                    [ "Server", "Response" ]
                                                    "Response"
                                                    [ Type.var "action"
                                                    , Type.namedWith
                                                        []
                                                        "ErrorPage"
                                                        []
                                                    ]
                                                ]
                                            )
                                      )
                                    , ( "head"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            ]
                                            (Type.list
                                                (Type.namedWith
                                                    [ "Head" ]
                                                    "Tag"
                                                    []
                                                )
                                            )
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    []
                                    "Builder"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    ]
                                )
                            )
                    }
                )
                [ serverRenderArg ]
    , preRenderWithFallback =
        \preRenderWithFallbackArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "RouteBuilder" ]
                    , name = "preRenderWithFallback"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "data"
                                      , Type.function
                                            [ Type.var "routeParams" ]
                                            (Type.namedWith
                                                []
                                                "BackendTask"
                                                [ Type.namedWith
                                                    []
                                                    "FatalError"
                                                    []
                                                , Type.namedWith
                                                    [ "Server", "Response" ]
                                                    "Response"
                                                    [ Type.var "data"
                                                    , Type.namedWith
                                                        []
                                                        "ErrorPage"
                                                        []
                                                    ]
                                                ]
                                            )
                                      )
                                    , ( "pages"
                                      , Type.namedWith
                                            []
                                            "BackendTask"
                                            [ Type.namedWith [] "FatalError" []
                                            , Type.list (Type.var "routeParams")
                                            ]
                                      )
                                    , ( "head"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            ]
                                            (Type.list
                                                (Type.namedWith
                                                    [ "Head" ]
                                                    "Tag"
                                                    []
                                                )
                                            )
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    []
                                    "Builder"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    ]
                                )
                            )
                    }
                )
                [ preRenderWithFallbackArg ]
    , preRender =
        \preRenderArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "RouteBuilder" ]
                    , name = "preRender"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "data"
                                      , Type.function
                                            [ Type.var "routeParams" ]
                                            (Type.namedWith
                                                []
                                                "BackendTask"
                                                [ Type.namedWith
                                                    []
                                                    "FatalError"
                                                    []
                                                , Type.var "data"
                                                ]
                                            )
                                      )
                                    , ( "pages"
                                      , Type.namedWith
                                            []
                                            "BackendTask"
                                            [ Type.namedWith [] "FatalError" []
                                            , Type.list (Type.var "routeParams")
                                            ]
                                      )
                                    , ( "head"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            ]
                                            (Type.list
                                                (Type.namedWith
                                                    [ "Head" ]
                                                    "Tag"
                                                    []
                                                )
                                            )
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    []
                                    "Builder"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    ]
                                )
                            )
                    }
                )
                [ preRenderArg ]
    , single =
        \singleArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "RouteBuilder" ]
                    , name = "single"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "data"
                                      , Type.namedWith
                                            []
                                            "BackendTask"
                                            [ Type.namedWith [] "FatalError" []
                                            , Type.var "data"
                                            ]
                                      )
                                    , ( "head"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.record []
                                                ]
                                            ]
                                            (Type.list
                                                (Type.namedWith
                                                    [ "Head" ]
                                                    "Tag"
                                                    []
                                                )
                                            )
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    []
                                    "Builder"
                                    [ Type.record []
                                    , Type.var "data"
                                    , Type.var "action"
                                    ]
                                )
                            )
                    }
                )
                [ singleArg ]
    , buildWithSharedState =
        \buildWithSharedStateArg buildWithSharedStateArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "RouteBuilder" ]
                    , name = "buildWithSharedState"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "view"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            , Type.namedWith
                                                [ "Shared" ]
                                                "Model"
                                                []
                                            , Type.var "model"
                                            ]
                                            (Type.namedWith
                                                []
                                                "View"
                                                [ Type.namedWith
                                                    []
                                                    "PagesMsg"
                                                    [ Type.var "msg" ]
                                                ]
                                            )
                                      )
                                    , ( "init"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            , Type.namedWith
                                                [ "Shared" ]
                                                "Model"
                                                []
                                            ]
                                            (Type.tuple
                                                (Type.var "model")
                                                (Type.namedWith
                                                    []
                                                    "Effect"
                                                    [ Type.var "msg" ]
                                                )
                                            )
                                      )
                                    , ( "update"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            , Type.namedWith
                                                [ "Shared" ]
                                                "Model"
                                                []
                                            , Type.var "msg"
                                            , Type.var "model"
                                            ]
                                            (Type.triple
                                                (Type.var "model")
                                                (Type.namedWith
                                                    []
                                                    "Effect"
                                                    [ Type.var "msg" ]
                                                )
                                                (Type.namedWith
                                                    []
                                                    "Maybe"
                                                    [ Type.namedWith
                                                        [ "Shared" ]
                                                        "Msg"
                                                        []
                                                    ]
                                                )
                                            )
                                      )
                                    , ( "subscriptions"
                                      , Type.function
                                            [ Type.var "routeParams"
                                            , Type.namedWith [] "UrlPath" []
                                            , Type.namedWith
                                                [ "Shared" ]
                                                "Model"
                                                []
                                            , Type.var "model"
                                            ]
                                            (Type.namedWith
                                                []
                                                "Sub"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    ]
                                , Type.namedWith
                                    []
                                    "Builder"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    ]
                                ]
                                (Type.namedWith
                                    []
                                    "StatefulRoute"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    , Type.var "model"
                                    , Type.var "msg"
                                    ]
                                )
                            )
                    }
                )
                [ buildWithSharedStateArg, buildWithSharedStateArg0 ]
    , buildWithLocalState =
        \buildWithLocalStateArg buildWithLocalStateArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "RouteBuilder" ]
                    , name = "buildWithLocalState"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "view"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            , Type.namedWith
                                                [ "Shared" ]
                                                "Model"
                                                []
                                            , Type.var "model"
                                            ]
                                            (Type.namedWith
                                                []
                                                "View"
                                                [ Type.namedWith
                                                    []
                                                    "PagesMsg"
                                                    [ Type.var "msg" ]
                                                ]
                                            )
                                      )
                                    , ( "init"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            , Type.namedWith
                                                [ "Shared" ]
                                                "Model"
                                                []
                                            ]
                                            (Type.tuple
                                                (Type.var "model")
                                                (Type.namedWith
                                                    []
                                                    "Effect"
                                                    [ Type.var "msg" ]
                                                )
                                            )
                                      )
                                    , ( "update"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            , Type.namedWith
                                                [ "Shared" ]
                                                "Model"
                                                []
                                            , Type.var "msg"
                                            , Type.var "model"
                                            ]
                                            (Type.tuple
                                                (Type.var "model")
                                                (Type.namedWith
                                                    []
                                                    "Effect"
                                                    [ Type.var "msg" ]
                                                )
                                            )
                                      )
                                    , ( "subscriptions"
                                      , Type.function
                                            [ Type.var "routeParams"
                                            , Type.namedWith [] "UrlPath" []
                                            , Type.namedWith
                                                [ "Shared" ]
                                                "Model"
                                                []
                                            , Type.var "model"
                                            ]
                                            (Type.namedWith
                                                []
                                                "Sub"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    ]
                                , Type.namedWith
                                    []
                                    "Builder"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    ]
                                ]
                                (Type.namedWith
                                    []
                                    "StatefulRoute"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    , Type.var "model"
                                    , Type.var "msg"
                                    ]
                                )
                            )
                    }
                )
                [ buildWithLocalStateArg, buildWithLocalStateArg0 ]
    , withOnAction =
        \withOnActionArg withOnActionArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "RouteBuilder" ]
                    , name = "withOnAction"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "action" ]
                                    (Type.var "msg")
                                , Type.namedWith
                                    []
                                    "StatefulRoute"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    , Type.var "model"
                                    , Type.var "msg"
                                    ]
                                ]
                                (Type.namedWith
                                    []
                                    "StatefulRoute"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    , Type.var "model"
                                    , Type.var "msg"
                                    ]
                                )
                            )
                    }
                )
                [ withOnActionArg, withOnActionArg0 ]
    , buildNoState =
        \buildNoStateArg buildNoStateArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "RouteBuilder" ]
                    , name = "buildNoState"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "view"
                                      , Type.function
                                            [ Type.namedWith
                                                []
                                                "App"
                                                [ Type.var "data"
                                                , Type.var "action"
                                                , Type.var "routeParams"
                                                ]
                                            , Type.namedWith
                                                [ "Shared" ]
                                                "Model"
                                                []
                                            ]
                                            (Type.namedWith
                                                []
                                                "View"
                                                [ Type.namedWith
                                                    []
                                                    "PagesMsg"
                                                    [ Type.unit ]
                                                ]
                                            )
                                      )
                                    ]
                                , Type.namedWith
                                    []
                                    "Builder"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    ]
                                ]
                                (Type.namedWith
                                    []
                                    "StatefulRoute"
                                    [ Type.var "routeParams"
                                    , Type.var "data"
                                    , Type.var "action"
                                    , Type.record []
                                    , Type.unit
                                    ]
                                )
                            )
                    }
                )
                [ buildNoStateArg, buildNoStateArg0 ]
    }


values_ :
    { serverRender : Elm.Expression
    , preRenderWithFallback : Elm.Expression
    , preRender : Elm.Expression
    , single : Elm.Expression
    , buildWithSharedState : Elm.Expression
    , buildWithLocalState : Elm.Expression
    , withOnAction : Elm.Expression
    , buildNoState : Elm.Expression
    }
values_ =
    { serverRender =
        Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "serverRender"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "data"
                              , Type.function
                                    [ Type.var "routeParams"
                                    , Type.namedWith
                                        [ "Server", "Request" ]
                                        "Request"
                                        []
                                    ]
                                    (Type.namedWith
                                        []
                                        "BackendTask"
                                        [ Type.namedWith [] "FatalError" []
                                        , Type.namedWith
                                            [ "Server", "Response" ]
                                            "Response"
                                            [ Type.var "data"
                                            , Type.namedWith [] "ErrorPage" []
                                            ]
                                        ]
                                    )
                              )
                            , ( "action"
                              , Type.function
                                    [ Type.var "routeParams"
                                    , Type.namedWith
                                        [ "Server", "Request" ]
                                        "Request"
                                        []
                                    ]
                                    (Type.namedWith
                                        []
                                        "BackendTask"
                                        [ Type.namedWith [] "FatalError" []
                                        , Type.namedWith
                                            [ "Server", "Response" ]
                                            "Response"
                                            [ Type.var "action"
                                            , Type.namedWith [] "ErrorPage" []
                                            ]
                                        ]
                                    )
                              )
                            , ( "head"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    ]
                                    (Type.list
                                        (Type.namedWith [ "Head" ] "Tag" [])
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        )
                    )
            }
    , preRenderWithFallback =
        Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "preRenderWithFallback"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "data"
                              , Type.function
                                    [ Type.var "routeParams" ]
                                    (Type.namedWith
                                        []
                                        "BackendTask"
                                        [ Type.namedWith [] "FatalError" []
                                        , Type.namedWith
                                            [ "Server", "Response" ]
                                            "Response"
                                            [ Type.var "data"
                                            , Type.namedWith [] "ErrorPage" []
                                            ]
                                        ]
                                    )
                              )
                            , ( "pages"
                              , Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.list (Type.var "routeParams")
                                    ]
                              )
                            , ( "head"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    ]
                                    (Type.list
                                        (Type.namedWith [ "Head" ] "Tag" [])
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        )
                    )
            }
    , preRender =
        Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "preRender"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "data"
                              , Type.function
                                    [ Type.var "routeParams" ]
                                    (Type.namedWith
                                        []
                                        "BackendTask"
                                        [ Type.namedWith [] "FatalError" []
                                        , Type.var "data"
                                        ]
                                    )
                              )
                            , ( "pages"
                              , Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.list (Type.var "routeParams")
                                    ]
                              )
                            , ( "head"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    ]
                                    (Type.list
                                        (Type.namedWith [ "Head" ] "Tag" [])
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        )
                    )
            }
    , single =
        Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "single"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "data"
                              , Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.var "data"
                                    ]
                              )
                            , ( "head"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.record []
                                        ]
                                    ]
                                    (Type.list
                                        (Type.namedWith [ "Head" ] "Tag" [])
                                    )
                              )
                            ]
                        ]
                        (Type.namedWith
                            []
                            "Builder"
                            [ Type.record []
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        )
                    )
            }
    , buildWithSharedState =
        Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "buildWithSharedState"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "view"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "model"
                                    ]
                                    (Type.namedWith
                                        []
                                        "View"
                                        [ Type.namedWith
                                            []
                                            "PagesMsg"
                                            [ Type.var "msg" ]
                                        ]
                                    )
                              )
                            , ( "init"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            []
                                            "Effect"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "update"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "msg"
                                    , Type.var "model"
                                    ]
                                    (Type.triple
                                        (Type.var "model")
                                        (Type.namedWith
                                            []
                                            "Effect"
                                            [ Type.var "msg" ]
                                        )
                                        (Type.namedWith
                                            []
                                            "Maybe"
                                            [ Type.namedWith
                                                [ "Shared" ]
                                                "Msg"
                                                []
                                            ]
                                        )
                                    )
                              )
                            , ( "subscriptions"
                              , Type.function
                                    [ Type.var "routeParams"
                                    , Type.namedWith [] "UrlPath" []
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "model"
                                    ]
                                    (Type.namedWith [] "Sub" [ Type.var "msg" ])
                              )
                            ]
                        , Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        ]
                        (Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        )
                    )
            }
    , buildWithLocalState =
        Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "buildWithLocalState"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "view"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "model"
                                    ]
                                    (Type.namedWith
                                        []
                                        "View"
                                        [ Type.namedWith
                                            []
                                            "PagesMsg"
                                            [ Type.var "msg" ]
                                        ]
                                    )
                              )
                            , ( "init"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            []
                                            "Effect"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "update"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "msg"
                                    , Type.var "model"
                                    ]
                                    (Type.tuple
                                        (Type.var "model")
                                        (Type.namedWith
                                            []
                                            "Effect"
                                            [ Type.var "msg" ]
                                        )
                                    )
                              )
                            , ( "subscriptions"
                              , Type.function
                                    [ Type.var "routeParams"
                                    , Type.namedWith [] "UrlPath" []
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    , Type.var "model"
                                    ]
                                    (Type.namedWith [] "Sub" [ Type.var "msg" ])
                              )
                            ]
                        , Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        ]
                        (Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        )
                    )
            }
    , withOnAction =
        Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "withOnAction"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "action" ] (Type.var "msg")
                        , Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        ]
                        (Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.var "model"
                            , Type.var "msg"
                            ]
                        )
                    )
            }
    , buildNoState =
        Elm.value
            { importFrom = [ "RouteBuilder" ]
            , name = "buildNoState"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "view"
                              , Type.function
                                    [ Type.namedWith
                                        []
                                        "App"
                                        [ Type.var "data"
                                        , Type.var "action"
                                        , Type.var "routeParams"
                                        ]
                                    , Type.namedWith [ "Shared" ] "Model" []
                                    ]
                                    (Type.namedWith
                                        []
                                        "View"
                                        [ Type.namedWith
                                            []
                                            "PagesMsg"
                                            [ Type.unit ]
                                        ]
                                    )
                              )
                            ]
                        , Type.namedWith
                            []
                            "Builder"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            ]
                        ]
                        (Type.namedWith
                            []
                            "StatefulRoute"
                            [ Type.var "routeParams"
                            , Type.var "data"
                            , Type.var "action"
                            , Type.record []
                            , Type.unit
                            ]
                        )
                    )
            }
    }


