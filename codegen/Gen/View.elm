module Gen.View exposing (annotation_, call_, make_, map, moduleName_, values_)

{-| 
@docs values_, call_, make_, annotation_, map, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "View" ]


{-| {-| -}

map: (msg1 -> msg2) -> View msg1 -> View msg2
-}
map : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
map mapArg mapArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "View" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "msg1" ] (Type.var "msg2")
                        , Type.namedWith [] "View" [ Type.var "msg1" ]
                        ]
                        (Type.namedWith [] "View" [ Type.var "msg2" ])
                    )
            }
        )
        [ Elm.functionReduced "mapUnpack" mapArg, mapArg0 ]


annotation_ : { view : Type.Annotation -> Type.Annotation }
annotation_ =
    { view =
        \viewArg0 ->
            Type.alias
                moduleName_
                "View"
                [ viewArg0 ]
                (Type.record
                    [ ( "title", Type.string )
                    , ( "body"
                      , Type.list (Type.namedWith [] "Html" [ Type.var "msg" ])
                      )
                    ]
                )
    }


make_ :
    { view : { title : Elm.Expression, body : Elm.Expression } -> Elm.Expression
    }
make_ =
    { view =
        \view_args ->
            Elm.withType
                (Type.alias
                    [ "View" ]
                    "View"
                    [ Type.var "msg" ]
                    (Type.record
                        [ ( "title", Type.string )
                        , ( "body"
                          , Type.list
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "title" view_args.title
                    , Tuple.pair "body" view_args.body
                    ]
                )
    }


call_ : { map : Elm.Expression -> Elm.Expression -> Elm.Expression }
call_ =
    { map =
        \mapArg mapArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "View" ]
                    , name = "map"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "msg1" ]
                                    (Type.var "msg2")
                                , Type.namedWith [] "View" [ Type.var "msg1" ]
                                ]
                                (Type.namedWith [] "View" [ Type.var "msg2" ])
                            )
                    }
                )
                [ mapArg, mapArg0 ]
    }


values_ : { map : Elm.Expression }
values_ =
    { map =
        Elm.value
            { importFrom = [ "View" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "msg1" ] (Type.var "msg2")
                        , Type.namedWith [] "View" [ Type.var "msg1" ]
                        ]
                        (Type.namedWith [] "View" [ Type.var "msg2" ])
                    )
            }
    }


