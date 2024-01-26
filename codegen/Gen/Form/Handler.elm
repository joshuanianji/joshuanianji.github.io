module Gen.Form.Handler exposing (annotation_, call_, init, moduleName_, run, values_, with)

{-| 
@docs values_, call_, annotation_, run, with, init, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Form", "Handler" ]


{-| Start building a `Handler`.

init: 
    (parsed -> combined)
    -> Internal.Form.Form error { combineAndView
        | combine : Form.Validation.Validation error parsed kind constraints
    } parsed input
    -> Form.Handler.Handler error combined
-}
init : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
init initArg initArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Handler" ]
            , name = "init"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.var "combined")
                        , Type.namedWith
                            [ "Internal", "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.extensible
                                "combineAndView"
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Form", "Validation" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "kind"
                                        , Type.var "constraints"
                                        ]
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Handler" ]
                            "Handler"
                            [ Type.var "error", Type.var "combined" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "initUnpack" initArg, initArg0 ]


{-| Include an additional `Form` as one of the possibilities to parse into.

with: 
    (parsed -> combined)
    -> Internal.Form.Form error { combineAndView
        | combine : Form.Validation.Validation error parsed kind constraints
    } parsed input
    -> Form.Handler.Handler error combined
    -> Form.Handler.Handler error combined
-}
with :
    (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
with withArg withArg0 withArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Handler" ]
            , name = "with"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.var "combined")
                        , Type.namedWith
                            [ "Internal", "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.extensible
                                "combineAndView"
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Form", "Validation" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "kind"
                                        , Type.var "constraints"
                                        ]
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        , Type.namedWith
                            [ "Form", "Handler" ]
                            "Handler"
                            [ Type.var "error", Type.var "combined" ]
                        ]
                        (Type.namedWith
                            [ "Form", "Handler" ]
                            "Handler"
                            [ Type.var "error", Type.var "combined" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "withUnpack" withArg, withArg0, withArg1 ]


{-| Parse your [`Handler`](#Handler) with the given raw form data into a [`Validated`](Form#Validated) value.

run: 
    List ( String, String )
    -> Form.Handler.Handler error parsed
    -> Form.Validated error parsed
-}
run : List Elm.Expression -> Elm.Expression -> Elm.Expression
run runArg runArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Handler" ]
            , name = "run"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.tuple Type.string Type.string)
                        , Type.namedWith
                            [ "Form", "Handler" ]
                            "Handler"
                            [ Type.var "error", Type.var "parsed" ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Validated"
                            [ Type.var "error", Type.var "parsed" ]
                        )
                    )
            }
        )
        [ Elm.list runArg, runArg0 ]


annotation_ :
    { handler : Type.Annotation -> Type.Annotation -> Type.Annotation }
annotation_ =
    { handler =
        \handlerArg0 handlerArg1 ->
            Type.namedWith
                [ "Form", "Handler" ]
                "Handler"
                [ handlerArg0, handlerArg1 ]
    }


call_ :
    { init : Elm.Expression -> Elm.Expression -> Elm.Expression
    , with :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , run : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { init =
        \initArg initArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Handler" ]
                    , name = "init"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "parsed" ]
                                    (Type.var "combined")
                                , Type.namedWith
                                    [ "Internal", "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.extensible
                                        "combineAndView"
                                        [ ( "combine"
                                          , Type.namedWith
                                                [ "Form", "Validation" ]
                                                "Validation"
                                                [ Type.var "error"
                                                , Type.var "parsed"
                                                , Type.var "kind"
                                                , Type.var "constraints"
                                                ]
                                          )
                                        ]
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Handler" ]
                                    "Handler"
                                    [ Type.var "error", Type.var "combined" ]
                                )
                            )
                    }
                )
                [ initArg, initArg0 ]
    , with =
        \withArg withArg0 withArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Handler" ]
                    , name = "with"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "parsed" ]
                                    (Type.var "combined")
                                , Type.namedWith
                                    [ "Internal", "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.extensible
                                        "combineAndView"
                                        [ ( "combine"
                                          , Type.namedWith
                                                [ "Form", "Validation" ]
                                                "Validation"
                                                [ Type.var "error"
                                                , Type.var "parsed"
                                                , Type.var "kind"
                                                , Type.var "constraints"
                                                ]
                                          )
                                        ]
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Handler" ]
                                    "Handler"
                                    [ Type.var "error", Type.var "combined" ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Handler" ]
                                    "Handler"
                                    [ Type.var "error", Type.var "combined" ]
                                )
                            )
                    }
                )
                [ withArg, withArg0, withArg1 ]
    , run =
        \runArg runArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Handler" ]
                    , name = "run"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list (Type.tuple Type.string Type.string)
                                , Type.namedWith
                                    [ "Form", "Handler" ]
                                    "Handler"
                                    [ Type.var "error", Type.var "parsed" ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Validated"
                                    [ Type.var "error", Type.var "parsed" ]
                                )
                            )
                    }
                )
                [ runArg, runArg0 ]
    }


values_ : { init : Elm.Expression, with : Elm.Expression, run : Elm.Expression }
values_ =
    { init =
        Elm.value
            { importFrom = [ "Form", "Handler" ]
            , name = "init"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.var "combined")
                        , Type.namedWith
                            [ "Internal", "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.extensible
                                "combineAndView"
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Form", "Validation" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "kind"
                                        , Type.var "constraints"
                                        ]
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Handler" ]
                            "Handler"
                            [ Type.var "error", Type.var "combined" ]
                        )
                    )
            }
    , with =
        Elm.value
            { importFrom = [ "Form", "Handler" ]
            , name = "with"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.var "combined")
                        , Type.namedWith
                            [ "Internal", "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.extensible
                                "combineAndView"
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Form", "Validation" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "kind"
                                        , Type.var "constraints"
                                        ]
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        , Type.namedWith
                            [ "Form", "Handler" ]
                            "Handler"
                            [ Type.var "error", Type.var "combined" ]
                        ]
                        (Type.namedWith
                            [ "Form", "Handler" ]
                            "Handler"
                            [ Type.var "error", Type.var "combined" ]
                        )
                    )
            }
    , run =
        Elm.value
            { importFrom = [ "Form", "Handler" ]
            , name = "run"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.tuple Type.string Type.string)
                        , Type.namedWith
                            [ "Form", "Handler" ]
                            "Handler"
                            [ Type.var "error", Type.var "parsed" ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Validated"
                            [ Type.var "error", Type.var "parsed" ]
                        )
                    )
            }
    }


