module Gen.Api exposing (call_, moduleName_, routes, values_)

{-| 
@docs values_, call_, routes, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Api" ]


{-| routes: 
    BackendTask FatalError (List Route)
    -> (Maybe { indent : Int, newLines : Bool } -> Html Never -> String)
    -> List (ApiRoute ApiRoute.Response)
-}
routes :
    Elm.Expression
    -> (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
routes routesArg routesArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Api" ]
            , name = "routes"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.list (Type.namedWith [] "Route" [])
                            ]
                        , Type.function
                            [ Type.namedWith
                                []
                                "Maybe"
                                [ Type.record
                                    [ ( "indent", Type.int )
                                    , ( "newLines", Type.bool )
                                    ]
                                ]
                            , Type.namedWith
                                []
                                "Html"
                                [ Type.namedWith [] "Never" [] ]
                            ]
                            Type.string
                        ]
                        (Type.list
                            (Type.namedWith
                                []
                                "ApiRoute"
                                [ Type.namedWith [ "ApiRoute" ] "Response" [] ]
                            )
                        )
                    )
            }
        )
        [ routesArg
        , Elm.functionReduced
            "routesUnpack"
            (\functionReducedUnpack ->
                Elm.functionReduced "unpack" (routesArg0 functionReducedUnpack)
            )
        ]


call_ : { routes : Elm.Expression -> Elm.Expression -> Elm.Expression }
call_ =
    { routes =
        \routesArg routesArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Api" ]
                    , name = "routes"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.list (Type.namedWith [] "Route" [])
                                    ]
                                , Type.function
                                    [ Type.namedWith
                                        []
                                        "Maybe"
                                        [ Type.record
                                            [ ( "indent", Type.int )
                                            , ( "newLines", Type.bool )
                                            ]
                                        ]
                                    , Type.namedWith
                                        []
                                        "Html"
                                        [ Type.namedWith [] "Never" [] ]
                                    ]
                                    Type.string
                                ]
                                (Type.list
                                    (Type.namedWith
                                        []
                                        "ApiRoute"
                                        [ Type.namedWith
                                            [ "ApiRoute" ]
                                            "Response"
                                            []
                                        ]
                                    )
                                )
                            )
                    }
                )
                [ routesArg, routesArg0 ]
    }


values_ : { routes : Elm.Expression }
values_ =
    { routes =
        Elm.value
            { importFrom = [ "Api" ]
            , name = "routes"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.list (Type.namedWith [] "Route" [])
                            ]
                        , Type.function
                            [ Type.namedWith
                                []
                                "Maybe"
                                [ Type.record
                                    [ ( "indent", Type.int )
                                    , ( "newLines", Type.bool )
                                    ]
                                ]
                            , Type.namedWith
                                []
                                "Html"
                                [ Type.namedWith [] "Never" [] ]
                            ]
                            Type.string
                        ]
                        (Type.list
                            (Type.namedWith
                                []
                                "ApiRoute"
                                [ Type.namedWith [ "ApiRoute" ] "Response" [] ]
                            )
                        )
                    )
            }
    }


