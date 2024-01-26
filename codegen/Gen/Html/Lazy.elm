module Gen.Html.Lazy exposing (call_, lazy, lazy2, lazy3, lazy4, lazy5, lazy6, lazy7, lazy8, moduleName_, values_)

{-| 
@docs values_, call_, lazy8, lazy7, lazy6, lazy5, lazy4, lazy3, lazy2, lazy, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Html", "Lazy" ]


{-| A performance optimization that delays the building of virtual DOM nodes.

Calling `(view model)` will definitely build some virtual DOM, perhaps a lot of
it. Calling `(lazy view model)` delays the call until later. During diffing, we
can check to see if `model` is referentially equal to the previous value used,
and if so, we just stop. No need to build up the tree structure and diff it,
we know if the input to `view` is the same, the output must be the same!

lazy: (a -> Html.Html msg) -> a -> Html.Html msg
-}
lazy : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
lazy lazyArg lazyArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a" ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced "lazyUnpack" lazyArg, lazyArg0 ]


{-| Same as `lazy` but checks on two arguments.

lazy2: (a -> b -> Html.Html msg) -> a -> b -> Html.Html msg
-}
lazy2 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
lazy2 lazy2Arg lazy2Arg0 lazy2Arg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy2"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a", Type.var "b" ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced
            "lazy2Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced "unpack" (lazy2Arg functionReducedUnpack)
            )
        , lazy2Arg0
        , lazy2Arg1
        ]


{-| Same as `lazy` but checks on three arguments.

lazy3: (a -> b -> c -> Html.Html msg) -> a -> b -> c -> Html.Html msg
-}
lazy3 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
lazy3 lazy3Arg lazy3Arg0 lazy3Arg1 lazy3Arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy3"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a", Type.var "b", Type.var "c" ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced
            "lazy3Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (lazy3Arg functionReducedUnpack
                                functionReducedUnpack0
                            )
                    )
            )
        , lazy3Arg0
        , lazy3Arg1
        , lazy3Arg2
        ]


{-| Same as `lazy` but checks on four arguments.

lazy4: (a -> b -> c -> d -> Html.Html msg) -> a -> b -> c -> d -> Html.Html msg
-}
lazy4 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
lazy4 lazy4Arg lazy4Arg0 lazy4Arg1 lazy4Arg2 lazy4Arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy4"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced
            "lazy4Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (lazy4Arg functionReducedUnpack
                                         functionReducedUnpack0
                                        functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                    )
                            )
                    )
            )
        , lazy4Arg0
        , lazy4Arg1
        , lazy4Arg2
        , lazy4Arg3
        ]


{-| Same as `lazy` but checks on five arguments.

lazy5: 
    (a -> b -> c -> d -> e -> Html.Html msg)
    -> a
    -> b
    -> c
    -> d
    -> e
    -> Html.Html msg
-}
lazy5 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
lazy5 lazy5Arg lazy5Arg0 lazy5Arg1 lazy5Arg2 lazy5Arg3 lazy5Arg4 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy5"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            , Type.var "e"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        , Type.var "e"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced
            "lazy5Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (lazy5Arg functionReducedUnpack
                                                 functionReducedUnpack0
                                                 functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                            )
                                    )
                            )
                    )
            )
        , lazy5Arg0
        , lazy5Arg1
        , lazy5Arg2
        , lazy5Arg3
        , lazy5Arg4
        ]


{-| Same as `lazy` but checks on six arguments.

lazy6: 
    (a -> b -> c -> d -> e -> f -> Html.Html msg)
    -> a
    -> b
    -> c
    -> d
    -> e
    -> f
    -> Html.Html msg
-}
lazy6 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
lazy6 lazy6Arg lazy6Arg0 lazy6Arg1 lazy6Arg2 lazy6Arg3 lazy6Arg4 lazy6Arg5 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy6"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            , Type.var "e"
                            , Type.var "f"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        , Type.var "e"
                        , Type.var "f"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced
            "lazy6Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (\functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                Elm.functionReduced
                                                    "unpack"
                                                    (lazy6Arg
                                                         functionReducedUnpack
                                                         functionReducedUnpack0
                                                         functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                         functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                                        functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                    )
                                            )
                                    )
                            )
                    )
            )
        , lazy6Arg0
        , lazy6Arg1
        , lazy6Arg2
        , lazy6Arg3
        , lazy6Arg4
        , lazy6Arg5
        ]


{-| Same as `lazy` but checks on seven arguments.

lazy7: 
    (a -> b -> c -> d -> e -> f -> g -> Html.Html msg)
    -> a
    -> b
    -> c
    -> d
    -> e
    -> f
    -> g
    -> Html.Html msg
-}
lazy7 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
lazy7 lazy7Arg lazy7Arg0 lazy7Arg1 lazy7Arg2 lazy7Arg3 lazy7Arg4 lazy7Arg5 lazy7Arg6 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy7"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            , Type.var "e"
                            , Type.var "f"
                            , Type.var "g"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        , Type.var "e"
                        , Type.var "f"
                        , Type.var "g"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced
            "lazy7Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (\functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                Elm.functionReduced
                                                    "unpack"
                                                    (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                        Elm.functionReduced
                                                            "unpack"
                                                            (lazy7Arg
                                                                 functionReducedUnpack
                                                                 functionReducedUnpack0
                                                                 functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                                 functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                                                 functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                            )
                                                    )
                                            )
                                    )
                            )
                    )
            )
        , lazy7Arg0
        , lazy7Arg1
        , lazy7Arg2
        , lazy7Arg3
        , lazy7Arg4
        , lazy7Arg5
        , lazy7Arg6
        ]


{-| Same as `lazy` but checks on eight arguments.

lazy8: 
    (a -> b -> c -> d -> e -> f -> g -> h -> Html.Html msg)
    -> a
    -> b
    -> c
    -> d
    -> e
    -> f
    -> g
    -> h
    -> Html.Html msg
-}
lazy8 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
lazy8 lazy8Arg lazy8Arg0 lazy8Arg1 lazy8Arg2 lazy8Arg3 lazy8Arg4 lazy8Arg5 lazy8Arg6 lazy8Arg7 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy8"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            , Type.var "e"
                            , Type.var "f"
                            , Type.var "g"
                            , Type.var "h"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        , Type.var "e"
                        , Type.var "f"
                        , Type.var "g"
                        , Type.var "h"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced
            "lazy8Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (\functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                Elm.functionReduced
                                                    "unpack"
                                                    (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                        Elm.functionReduced
                                                            "unpack"
                                                            (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                                Elm.functionReduced
                                                                    "unpack"
                                                                    (lazy8Arg
                                                                         functionReducedUnpack
                                                                         functionReducedUnpack0
                                                                         functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                                         functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                                                         functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                         functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                        functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                    )
                                                            )
                                                    )
                                            )
                                    )
                            )
                    )
            )
        , lazy8Arg0
        , lazy8Arg1
        , lazy8Arg2
        , lazy8Arg3
        , lazy8Arg4
        , lazy8Arg5
        , lazy8Arg6
        , lazy8Arg7
        ]


call_ :
    { lazy : Elm.Expression -> Elm.Expression -> Elm.Expression
    , lazy2 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , lazy3 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , lazy4 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , lazy5 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , lazy6 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , lazy7 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , lazy8 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    }
call_ =
    { lazy =
        \lazyArg lazyArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Html", "Lazy" ]
                    , name = "lazy"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a" ]
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.var "a"
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ lazyArg, lazyArg0 ]
    , lazy2 =
        \lazy2Arg lazy2Arg0 lazy2Arg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Html", "Lazy" ]
                    , name = "lazy2"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a", Type.var "b" ]
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.var "a"
                                , Type.var "b"
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ lazy2Arg, lazy2Arg0, lazy2Arg1 ]
    , lazy3 =
        \lazy3Arg lazy3Arg0 lazy3Arg1 lazy3Arg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Html", "Lazy" ]
                    , name = "lazy3"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a", Type.var "b", Type.var "c" ]
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.var "a"
                                , Type.var "b"
                                , Type.var "c"
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ lazy3Arg, lazy3Arg0, lazy3Arg1, lazy3Arg2 ]
    , lazy4 =
        \lazy4Arg lazy4Arg0 lazy4Arg1 lazy4Arg2 lazy4Arg3 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Html", "Lazy" ]
                    , name = "lazy4"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a"
                                    , Type.var "b"
                                    , Type.var "c"
                                    , Type.var "d"
                                    ]
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.var "a"
                                , Type.var "b"
                                , Type.var "c"
                                , Type.var "d"
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ lazy4Arg, lazy4Arg0, lazy4Arg1, lazy4Arg2, lazy4Arg3 ]
    , lazy5 =
        \lazy5Arg lazy5Arg0 lazy5Arg1 lazy5Arg2 lazy5Arg3 lazy5Arg4 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Html", "Lazy" ]
                    , name = "lazy5"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a"
                                    , Type.var "b"
                                    , Type.var "c"
                                    , Type.var "d"
                                    , Type.var "e"
                                    ]
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.var "a"
                                , Type.var "b"
                                , Type.var "c"
                                , Type.var "d"
                                , Type.var "e"
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ lazy5Arg
                , lazy5Arg0
                , lazy5Arg1
                , lazy5Arg2
                , lazy5Arg3
                , lazy5Arg4
                ]
    , lazy6 =
        \lazy6Arg lazy6Arg0 lazy6Arg1 lazy6Arg2 lazy6Arg3 lazy6Arg4 lazy6Arg5 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Html", "Lazy" ]
                    , name = "lazy6"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a"
                                    , Type.var "b"
                                    , Type.var "c"
                                    , Type.var "d"
                                    , Type.var "e"
                                    , Type.var "f"
                                    ]
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.var "a"
                                , Type.var "b"
                                , Type.var "c"
                                , Type.var "d"
                                , Type.var "e"
                                , Type.var "f"
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ lazy6Arg
                , lazy6Arg0
                , lazy6Arg1
                , lazy6Arg2
                , lazy6Arg3
                , lazy6Arg4
                , lazy6Arg5
                ]
    , lazy7 =
        \lazy7Arg lazy7Arg0 lazy7Arg1 lazy7Arg2 lazy7Arg3 lazy7Arg4 lazy7Arg5 lazy7Arg6 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Html", "Lazy" ]
                    , name = "lazy7"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a"
                                    , Type.var "b"
                                    , Type.var "c"
                                    , Type.var "d"
                                    , Type.var "e"
                                    , Type.var "f"
                                    , Type.var "g"
                                    ]
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.var "a"
                                , Type.var "b"
                                , Type.var "c"
                                , Type.var "d"
                                , Type.var "e"
                                , Type.var "f"
                                , Type.var "g"
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ lazy7Arg
                , lazy7Arg0
                , lazy7Arg1
                , lazy7Arg2
                , lazy7Arg3
                , lazy7Arg4
                , lazy7Arg5
                , lazy7Arg6
                ]
    , lazy8 =
        \lazy8Arg lazy8Arg0 lazy8Arg1 lazy8Arg2 lazy8Arg3 lazy8Arg4 lazy8Arg5 lazy8Arg6 lazy8Arg7 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Html", "Lazy" ]
                    , name = "lazy8"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a"
                                    , Type.var "b"
                                    , Type.var "c"
                                    , Type.var "d"
                                    , Type.var "e"
                                    , Type.var "f"
                                    , Type.var "g"
                                    , Type.var "h"
                                    ]
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.var "a"
                                , Type.var "b"
                                , Type.var "c"
                                , Type.var "d"
                                , Type.var "e"
                                , Type.var "f"
                                , Type.var "g"
                                , Type.var "h"
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ lazy8Arg
                , lazy8Arg0
                , lazy8Arg1
                , lazy8Arg2
                , lazy8Arg3
                , lazy8Arg4
                , lazy8Arg5
                , lazy8Arg6
                , lazy8Arg7
                ]
    }


values_ :
    { lazy : Elm.Expression
    , lazy2 : Elm.Expression
    , lazy3 : Elm.Expression
    , lazy4 : Elm.Expression
    , lazy5 : Elm.Expression
    , lazy6 : Elm.Expression
    , lazy7 : Elm.Expression
    , lazy8 : Elm.Expression
    }
values_ =
    { lazy =
        Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a" ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , lazy2 =
        Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy2"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a", Type.var "b" ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , lazy3 =
        Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy3"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a", Type.var "b", Type.var "c" ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , lazy4 =
        Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy4"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , lazy5 =
        Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy5"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            , Type.var "e"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        , Type.var "e"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , lazy6 =
        Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy6"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            , Type.var "e"
                            , Type.var "f"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        , Type.var "e"
                        , Type.var "f"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , lazy7 =
        Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy7"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            , Type.var "e"
                            , Type.var "f"
                            , Type.var "g"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        , Type.var "e"
                        , Type.var "f"
                        , Type.var "g"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , lazy8 =
        Elm.value
            { importFrom = [ "Html", "Lazy" ]
            , name = "lazy8"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a"
                            , Type.var "b"
                            , Type.var "c"
                            , Type.var "d"
                            , Type.var "e"
                            , Type.var "f"
                            , Type.var "g"
                            , Type.var "h"
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.var "a"
                        , Type.var "b"
                        , Type.var "c"
                        , Type.var "d"
                        , Type.var "e"
                        , Type.var "f"
                        , Type.var "g"
                        , Type.var "h"
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    }


