module Gen.Icosahedron exposing (annotation_, call_, init, make_, moduleName_, subscriptions, update, values_, view)

{-| 
@docs values_, call_, make_, annotation_, init, view, update, subscriptions, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Icosahedron" ]


{-| subscriptions: Model -> Sub Msg -}
subscriptions : Elm.Expression -> Elm.Expression
subscriptions subscriptionsArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Icosahedron" ]
            , name = "subscriptions"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Model" [] ]
                        (Type.namedWith [] "Sub" [ Type.namedWith [] "Msg" [] ])
                    )
            }
        )
        [ subscriptionsArg ]


{-| update: Msg -> Model -> Model -}
update : Elm.Expression -> Elm.Expression -> Elm.Expression
update updateArg updateArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Icosahedron" ]
            , name = "update"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Msg" []
                        , Type.namedWith [] "Model" []
                        ]
                        (Type.namedWith [] "Model" [])
                    )
            }
        )
        [ updateArg, updateArg0 ]


{-| view: Model -> Html Msg -}
view : Elm.Expression -> Elm.Expression
view viewArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Icosahedron" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Model" [] ]
                        (Type.namedWith [] "Html" [ Type.namedWith [] "Msg" [] ]
                        )
                    )
            }
        )
        [ viewArg ]


{-| init: Int -> Float -> Model -}
init : Int -> Float -> Elm.Expression
init initArg initArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Icosahedron" ]
            , name = "init"
            , annotation =
                Just
                    (Type.function
                        [ Type.int, Type.float ]
                        (Type.namedWith [] "Model" [])
                    )
            }
        )
        [ Elm.int initArg, Elm.float initArg0 ]


annotation_ : { model : Type.Annotation, msg : Type.Annotation }
annotation_ =
    { model =
        Type.alias
            moduleName_
            "Model"
            []
            (Type.record
                [ ( "size", Type.int )
                , ( "azimuth", Type.namedWith [] "Angle" [] )
                , ( "elevation", Type.namedWith [] "Angle" [] )
                , ( "mouse", Type.namedWith [] "Mouse" [] )
                ]
            )
    , msg = Type.namedWith [ "Icosahedron" ] "Msg" []
    }


make_ :
    { model :
        { size : Elm.Expression
        , azimuth : Elm.Expression
        , elevation : Elm.Expression
        , mouse : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Icosahedron" ]
                    "Model"
                    []
                    (Type.record
                        [ ( "size", Type.int )
                        , ( "azimuth", Type.namedWith [] "Angle" [] )
                        , ( "elevation", Type.namedWith [] "Angle" [] )
                        , ( "mouse", Type.namedWith [] "Mouse" [] )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "size" model_args.size
                    , Tuple.pair "azimuth" model_args.azimuth
                    , Tuple.pair "elevation" model_args.elevation
                    , Tuple.pair "mouse" model_args.mouse
                    ]
                )
    }


call_ :
    { subscriptions : Elm.Expression -> Elm.Expression
    , update : Elm.Expression -> Elm.Expression -> Elm.Expression
    , view : Elm.Expression -> Elm.Expression
    , init : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { subscriptions =
        \subscriptionsArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Icosahedron" ]
                    , name = "subscriptions"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Model" [] ]
                                (Type.namedWith
                                    []
                                    "Sub"
                                    [ Type.namedWith [] "Msg" [] ]
                                )
                            )
                    }
                )
                [ subscriptionsArg ]
    , update =
        \updateArg updateArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Icosahedron" ]
                    , name = "update"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Msg" []
                                , Type.namedWith [] "Model" []
                                ]
                                (Type.namedWith [] "Model" [])
                            )
                    }
                )
                [ updateArg, updateArg0 ]
    , view =
        \viewArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Icosahedron" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Model" [] ]
                                (Type.namedWith
                                    []
                                    "Html"
                                    [ Type.namedWith [] "Msg" [] ]
                                )
                            )
                    }
                )
                [ viewArg ]
    , init =
        \initArg initArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Icosahedron" ]
                    , name = "init"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.int, Type.float ]
                                (Type.namedWith [] "Model" [])
                            )
                    }
                )
                [ initArg, initArg0 ]
    }


values_ :
    { subscriptions : Elm.Expression
    , update : Elm.Expression
    , view : Elm.Expression
    , init : Elm.Expression
    }
values_ =
    { subscriptions =
        Elm.value
            { importFrom = [ "Icosahedron" ]
            , name = "subscriptions"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Model" [] ]
                        (Type.namedWith [] "Sub" [ Type.namedWith [] "Msg" [] ])
                    )
            }
    , update =
        Elm.value
            { importFrom = [ "Icosahedron" ]
            , name = "update"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Msg" []
                        , Type.namedWith [] "Model" []
                        ]
                        (Type.namedWith [] "Model" [])
                    )
            }
    , view =
        Elm.value
            { importFrom = [ "Icosahedron" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Model" [] ]
                        (Type.namedWith [] "Html" [ Type.namedWith [] "Msg" [] ]
                        )
                    )
            }
    , init =
        Elm.value
            { importFrom = [ "Icosahedron" ]
            , name = "init"
            , annotation =
                Just
                    (Type.function
                        [ Type.int, Type.float ]
                        (Type.namedWith [] "Model" [])
                    )
            }
    }


