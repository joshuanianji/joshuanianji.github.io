module Gen.Icon exposing (call_, moduleName_, values_, view)

{-| 
@docs values_, call_, view, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Icon" ]


{-| view: List (Attribute msg) -> Config msg -> Html msg -}
view : List Elm.Expression -> Elm.Expression -> Elm.Expression
view viewArg viewArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Icon" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith [] "Attribute" [ Type.var "msg" ])
                        , Type.namedWith [] "Config" [ Type.var "msg" ]
                        ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list viewArg, viewArg0 ]


call_ : { view : Elm.Expression -> Elm.Expression -> Elm.Expression }
call_ =
    { view =
        \viewArg viewArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Icon" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        []
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith [] "Config" [ Type.var "msg" ]
                                ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ viewArg, viewArg0 ]
    }


values_ : { view : Elm.Expression }
values_ =
    { view =
        Elm.value
            { importFrom = [ "Icon" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith [] "Attribute" [ Type.var "msg" ])
                        , Type.namedWith [] "Config" [ Type.var "msg" ]
                        ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    }


