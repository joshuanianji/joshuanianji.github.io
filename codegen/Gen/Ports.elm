module Gen.Ports exposing (call_, moduleName_, updateMousePos, values_)

{-| 
@docs values_, call_, updateMousePos, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Ports" ]


{-| updateMousePos: ({ x : Float, y : Float } -> msg) -> Sub msg -}
updateMousePos : (Elm.Expression -> Elm.Expression) -> Elm.Expression
updateMousePos updateMousePosArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Ports" ]
            , name = "updateMousePos"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.record
                                [ ( "x", Type.float ), ( "y", Type.float ) ]
                            ]
                            (Type.var "msg")
                        ]
                        (Type.namedWith [] "Sub" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced "updateMousePosUnpack" updateMousePosArg ]


call_ : { updateMousePos : Elm.Expression -> Elm.Expression }
call_ =
    { updateMousePos =
        \updateMousePosArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Ports" ]
                    , name = "updateMousePos"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.record
                                        [ ( "x", Type.float )
                                        , ( "y", Type.float )
                                        ]
                                    ]
                                    (Type.var "msg")
                                ]
                                (Type.namedWith [] "Sub" [ Type.var "msg" ])
                            )
                    }
                )
                [ updateMousePosArg ]
    }


values_ : { updateMousePos : Elm.Expression }
values_ =
    { updateMousePos =
        Elm.value
            { importFrom = [ "Ports" ]
            , name = "updateMousePos"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.record
                                [ ( "x", Type.float ), ( "y", Type.float ) ]
                            ]
                            (Type.var "msg")
                        ]
                        (Type.namedWith [] "Sub" [ Type.var "msg" ])
                    )
            }
    }


