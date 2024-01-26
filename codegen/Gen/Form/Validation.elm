module Gen.Form.Validation exposing (andMap, andThen, annotation_, call_, caseOf_, fail, fieldName, fieldStatus, fieldStatusToString, fromResult, global, make_, map, map2, map3, map4, map5, map6, map7, map8, map9, moduleName_, statusAtLeast, succeed, value, values_, withError, withErrorIf, withFallback)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, global, map9, map8, map7, map6, map5, map4, map3, statusAtLeast, fieldStatusToString, fieldStatus, fieldName, value, withFallback, withErrorIf, withError, map2, map, fromResult, fail, andThen, andMap, succeed, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Form", "Validation" ]


{-| Get a `Combined` value that successfully parses into the given value with no errors.

Helpful for starting a chain of `Validation` functions that will eventually parse into a value. See [`andMap`](#andMap)
for an example of a common idiom.

succeed: parsed -> Form.Validation.Validation error parsed kind constraints
-}
succeed : Elm.Expression -> Elm.Expression
succeed succeedArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "succeed"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "parsed" ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ succeedArg ]


{-| Lets you combine Validation's in a pipeline.

    import Form
    import Form.Field as Field
    import Form.Validation as Validation

    example =
        (\first middle last ->
            { combine =
                Validation.succeed
                    (\vFirst vMiddle vLast ->
                        vFirst ++ " " ++ vMiddle ++ " " ++ vLast
                    )
                    |> Validation.andMap first
                    |> Validation.andMap middle
                    |> Validation.andMap last
            , view = \_ -> []
            }
        )
            |> Form.form
            |> Form.field "first" (Field.text |> Field.required "Required")
            |> Form.field "middle" (Field.text |> Field.required "Required")
            |> Form.field "last" (Field.text |> Field.required "Required")

andMap: 
    Form.Validation.Validation error a named1 constraints1
    -> Form.Validation.Validation error (a -> b) named2 constraints2
    -> Form.Validation.Validation error b Basics.Never constraints3
-}
andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
andMap andMapArg andMapArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "andMap"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.function [ Type.var "a" ] (Type.var "b")
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "b"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraints3"
                            ]
                        )
                    )
            }
        )
        [ andMapArg, andMapArg0 ]


{-| Continue a `Validation` based on the given `parsed` value.

    import Date
    import Form
    import Form.Field as Field
    import Form.Validation as Validation

    example : Form.HtmlForm String { date : Date, nights : Int } input msg
    example =
        (\checkIn checkOut ->
            { combine =
                Validation.map2
                    (\checkinValue checkoutValue ->
                        Validation.succeed
                            { date = checkinValue
                            , nights = Date.toRataDie checkoutValue - Date.toRataDie checkinValue
                            }
                            |> Validation.withErrorIf (Date.toRataDie checkinValue >= Date.toRataDie checkoutValue) checkIn "Must be before checkout"
                    )
                    checkIn
                    checkOut
                    |> Validation.andThen identity
            , view = \_ -> []
            }
        )
            |> Form.form
            |> Form.field "checkin"
                (Field.date
                    { invalid = \_ -> "Invalid" }
                    |> Field.required "Required"
                )
            |> Form.field "checkout"
                (Field.date
                    { invalid = \_ -> "Invalid" }
                    |> Field.required "Required"
                )

andThen: 
    (parsed -> Form.Validation.Validation error mapped named1 constraints1)
    -> Form.Validation.Validation error parsed named2 constraints2
    -> Form.Validation.Validation error mapped Basics.Never constraintsAny
-}
andThen : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
andThen andThenArg andThenArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "andThen"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.namedWith
                                [ "Form", "Validation" ]
                                "Validation"
                                [ Type.var "error"
                                , Type.var "mapped"
                                , Type.var "named1"
                                , Type.var "constraints1"
                                ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "mapped"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "andThenUnpack" andThenArg, andThenArg0 ]


{-| Add an error to the given `Field`, short-circuiting its parsed value so that it will fail to parse.
This can be helpful if you want to fail with a value that you can combine together with other values because
it has an unbound `parsed` type variable. Similar to how [`Json.Decode.fail`](https://package.elm-lang.org/packages/elm/json/latest/Json-Decode#fail)
gives you a `Decoder a`.

See [`withError`](#withError) if you want to add an error without short-circuiting the parsed value.

fail: 
    error
    -> Form.Validation.Field error parsed1 field
    -> Form.Validation.Validation error parsed kind constraints
-}
fail : Elm.Expression -> Elm.Expression -> Elm.Expression
fail failArg failArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fail"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "error"
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed1"
                            , Type.var "field"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ failArg, failArg0 ]


{-| Resolve a `Result` within a `Field`. If it is `Err`, the error will be added to the `Field`'s errors.

fromResult: 
    Form.Validation.Field error (Result.Result error parsed) kind
    -> Form.Validation.Validation error parsed Basics.Never Basics.Never
-}
fromResult : Elm.Expression -> Elm.Expression
fromResult fromResultArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fromResult"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "error", Type.var "parsed" ]
                            , Type.var "kind"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.namedWith [ "Basics" ] "Never" []
                            ]
                        )
                    )
            }
        )
        [ fromResultArg ]


{-| Apply a function to the parsed value.

    import Form.Validation as Validation

    type Uuid
        = Uuid String

    example =
        (\uuid ->
            { combine =
                Validation.succeed identity
                    |> Validation.andMap (uuid |> Validation.map Uuid)
            , view = \_ -> []
            }
        )
            |> Form.form
            |> Form.hiddenField "uuid" (Field.text |> Field.required "Required")

map: 
    (parsed -> mapped)
    -> Form.Validation.Validation error parsed named constraint
    -> Form.Validation.Validation error mapped erasedKind erasedConstraints
-}
map : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
map mapArg mapArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.var "mapped")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraint"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "mapped"
                            , Type.var "erasedKind"
                            , Type.var "erasedConstraints"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "mapUnpack" mapArg, mapArg0 ]


{-| Combine together two `Validation`'s.

    import Form
    import Form.Field as Field
    import Form.Validation as Validation

    example =
        (\first last ->
            { combine =
                Validation.map2 Tuple.pair
                    first
                    last
            , view = \_ -> [{- ... -}]
            }
        )
            |> Form.form
            |> Form.field "first" (Field.text |> Field.required "Required")
            |> Form.field "last" (Field.text |> Field.required "Required")

map2: 
    (a -> b -> c)
    -> Form.Validation.Validation error a named1 constraints1
    -> Form.Validation.Validation error b named2 constraints2
    -> Form.Validation.Validation error c Basics.Never constraintsAny
-}
map2 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map2 map2Arg map2Arg0 map2Arg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map2"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a", Type.var "b" ]
                            (Type.var "c")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "b"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "c"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map2Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced "unpack" (map2Arg functionReducedUnpack)
            )
        , map2Arg0
        , map2Arg1
        ]


{-| Add an error to the given `Field`.

withError: 
    Form.Validation.Field error parsed1 field
    -> error
    -> Form.Validation.Validation error parsed2 named constraints
    -> Form.Validation.Validation error parsed2 named constraints
-}
withError : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
withError withErrorArg withErrorArg0 withErrorArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "withError"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed1"
                            , Type.var "field"
                            ]
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ withErrorArg, withErrorArg0, withErrorArg1 ]


{-| Conditionally add an error to the given `Field`.

    import Date
    import Form.Validation as Validation

    example checkIn checkOut =
        Validation.map2
            (\checkinValue checkoutValue ->
                Validation.succeed
                    { date = checkinValue
                    , nights = Date.toRataDie checkoutValue - Date.toRataDie checkinValue
                    }
                    |> Validation.withErrorIf (Date.toRataDie checkinValue >= Date.toRataDie checkoutValue) checkIn "Must be before checkout"
            )
            checkIn
            checkOut
            |> Validation.andThen identity

withErrorIf: 
    Bool
    -> Form.Validation.Field error ignored field
    -> error
    -> Form.Validation.Validation error parsed named constraints
    -> Form.Validation.Validation error parsed named constraints
-}
withErrorIf :
    Bool -> Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
withErrorIf withErrorIfArg withErrorIfArg0 withErrorIfArg1 withErrorIfArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "withErrorIf"
            , annotation =
                Just
                    (Type.function
                        [ Type.bool
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "ignored"
                            , Type.var "field"
                            ]
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ Elm.bool withErrorIfArg
        , withErrorIfArg0
        , withErrorIfArg1
        , withErrorIfArg2
        ]


{-| Include a fallback value to parse into. Does not remove any previous validation errors that have been encountered
so it will not effect whether it parses to `Valid` or `Invalid`.

withFallback: 
    parsed
    -> Form.Validation.Validation error parsed named constraints
    -> Form.Validation.Validation error parsed named constraints
-}
withFallback : Elm.Expression -> Elm.Expression -> Elm.Expression
withFallback withFallbackArg withFallbackArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "withFallback"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "parsed"
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ withFallbackArg, withFallbackArg0 ]


{-| Get the parsed value if it is parseable (could be either invalid or valid).

value: Form.Validation.Validation error parsed named constraint -> Maybe parsed
-}
value : Elm.Expression -> Elm.Expression
value valueArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "value"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraint"
                            ]
                        ]
                        (Type.maybe (Type.var "parsed"))
                    )
            }
        )
        [ valueArg ]


{-| Get the `Field`'s name.

fieldName: Form.Validation.Field error parsed kind -> String
-}
fieldName : Elm.Expression -> Elm.Expression
fieldName fieldNameArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fieldName"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        Type.string
                    )
            }
        )
        [ fieldNameArg ]


{-| Get the `Field`'s [`FieldStatus`](#FieldStatus).

fieldStatus: Form.Validation.Field error parsed kind -> Form.Validation.FieldStatus
-}
fieldStatus : Elm.Expression -> Elm.Expression
fieldStatus fieldStatusArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fieldStatus"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "FieldStatus"
                            []
                        )
                    )
            }
        )
        [ fieldStatusArg ]


{-| Mostly useful for debugging, you'll usually want to compare `FieldStatus` to other `FieldStatus` values or use helpers like [`statusAtLeast`](#statusAtLeast).

fieldStatusToString: Form.Validation.FieldStatus -> String
-}
fieldStatusToString : Elm.Expression -> Elm.Expression
fieldStatusToString fieldStatusToStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fieldStatusToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "FieldStatus"
                            []
                        ]
                        Type.string
                    )
            }
        )
        [ fieldStatusToStringArg ]


{-| `elm-form` manages form fields' `FieldStatus` in the order described in [`FieldStatus`](#FieldStatus).

This function is useful when writing a condition for when to show a `Field`'s validation errors in the view.
See [`Form.errorsForField`](Form#errorsForField) for an example.

statusAtLeast: Form.Validation.FieldStatus -> Form.Validation.Field error parsed kind -> Bool
-}
statusAtLeast : Elm.Expression -> Elm.Expression -> Elm.Expression
statusAtLeast statusAtLeastArg statusAtLeastArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "statusAtLeast"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "FieldStatus"
                            []
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        Type.bool
                    )
            }
        )
        [ statusAtLeastArg, statusAtLeastArg0 ]


{-| map3: 
    (a1 -> a2 -> a3 -> a4)
    -> Form.Validation.Validation error a1 named1 constraints1
    -> Form.Validation.Validation error a2 named2 constraints2
    -> Form.Validation.Validation error a3 named3 constraints3
    -> Form.Validation.Validation error a4 Basics.Never constraintsAny
-}
map3 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map3 map3Arg map3Arg0 map3Arg1 map3Arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map3"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1", Type.var "a2", Type.var "a3" ]
                            (Type.var "a4")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map3Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (map3Arg functionReducedUnpack
                                functionReducedUnpack0
                            )
                    )
            )
        , map3Arg0
        , map3Arg1
        , map3Arg2
        ]


{-| map4: 
    (a1 -> a2 -> a3 -> a4 -> a5)
    -> Form.Validation.Validation error a1 named1 constraints1
    -> Form.Validation.Validation error a2 named2 constraints2
    -> Form.Validation.Validation error a3 named3 constraints3
    -> Form.Validation.Validation error a4 named4 constraints4
    -> Form.Validation.Validation error a5 Basics.Never constraintsAny
-}
map4 :
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
map4 map4Arg map4Arg0 map4Arg1 map4Arg2 map4Arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map4"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            ]
                            (Type.var "a5")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map4Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (map4Arg functionReducedUnpack
                                         functionReducedUnpack0
                                        functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                    )
                            )
                    )
            )
        , map4Arg0
        , map4Arg1
        , map4Arg2
        , map4Arg3
        ]


{-| map5: 
    (a1 -> a2 -> a3 -> a4 -> a5 -> a6)
    -> Form.Validation.Validation error a1 named1 constraints1
    -> Form.Validation.Validation error a2 named2 constraints2
    -> Form.Validation.Validation error a3 named3 constraints3
    -> Form.Validation.Validation error a4 named4 constraints4
    -> Form.Validation.Validation error a5 named5 constraints5
    -> Form.Validation.Validation error a6 Basics.Never constraintsAny
-}
map5 :
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
map5 map5Arg map5Arg0 map5Arg1 map5Arg2 map5Arg3 map5Arg4 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map5"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            ]
                            (Type.var "a6")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map5Unpack"
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
                                            (map5Arg functionReducedUnpack
                                                 functionReducedUnpack0
                                                 functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                            )
                                    )
                            )
                    )
            )
        , map5Arg0
        , map5Arg1
        , map5Arg2
        , map5Arg3
        , map5Arg4
        ]


{-| map6: 
    (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7)
    -> Form.Validation.Validation error a1 named1 constraints1
    -> Form.Validation.Validation error a2 named2 constraints2
    -> Form.Validation.Validation error a3 named3 constraints3
    -> Form.Validation.Validation error a4 named4 constraints4
    -> Form.Validation.Validation error a5 named5 constraints5
    -> Form.Validation.Validation error a6 named6 constraints6
    -> Form.Validation.Validation error a7 Basics.Never constraintsAny
-}
map6 :
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
map6 map6Arg map6Arg0 map6Arg1 map6Arg2 map6Arg3 map6Arg4 map6Arg5 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map6"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            , Type.var "a6"
                            ]
                            (Type.var "a7")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.var "named6"
                            , Type.var "constraints6"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a7"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map6Unpack"
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
                                                    (map6Arg
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
        , map6Arg0
        , map6Arg1
        , map6Arg2
        , map6Arg3
        , map6Arg4
        , map6Arg5
        ]


{-| map7: 
    (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8)
    -> Form.Validation.Validation error a1 named1 constraints1
    -> Form.Validation.Validation error a2 named2 constraints2
    -> Form.Validation.Validation error a3 named3 constraints3
    -> Form.Validation.Validation error a4 named4 constraints4
    -> Form.Validation.Validation error a5 named5 constraints5
    -> Form.Validation.Validation error a6 named6 constraints6
    -> Form.Validation.Validation error a7 named7 constraints7
    -> Form.Validation.Validation error a8 Basics.Never constraintsAny
-}
map7 :
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
map7 map7Arg map7Arg0 map7Arg1 map7Arg2 map7Arg3 map7Arg4 map7Arg5 map7Arg6 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map7"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            , Type.var "a6"
                            , Type.var "a7"
                            ]
                            (Type.var "a8")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.var "named6"
                            , Type.var "constraints6"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a7"
                            , Type.var "named7"
                            , Type.var "constraints7"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a8"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map7Unpack"
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
                                                            (map7Arg
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
        , map7Arg0
        , map7Arg1
        , map7Arg2
        , map7Arg3
        , map7Arg4
        , map7Arg5
        , map7Arg6
        ]


{-| map8: 
    (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8 -> a9)
    -> Form.Validation.Validation error a1 named1 constraints1
    -> Form.Validation.Validation error a2 named2 constraints2
    -> Form.Validation.Validation error a3 named3 constraints3
    -> Form.Validation.Validation error a4 named4 constraints4
    -> Form.Validation.Validation error a5 named5 constraints5
    -> Form.Validation.Validation error a6 named6 constraints6
    -> Form.Validation.Validation error a7 named7 constraints7
    -> Form.Validation.Validation error a8 named8 constraints8
    -> Form.Validation.Validation error a9 Basics.Never constraintsAny
-}
map8 :
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
map8 map8Arg map8Arg0 map8Arg1 map8Arg2 map8Arg3 map8Arg4 map8Arg5 map8Arg6 map8Arg7 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map8"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            , Type.var "a6"
                            , Type.var "a7"
                            , Type.var "a8"
                            ]
                            (Type.var "a9")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.var "named6"
                            , Type.var "constraints6"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a7"
                            , Type.var "named7"
                            , Type.var "constraints7"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a8"
                            , Type.var "named8"
                            , Type.var "constraints8"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a9"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map8Unpack"
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
                                                                    (map8Arg
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
        , map8Arg0
        , map8Arg1
        , map8Arg2
        , map8Arg3
        , map8Arg4
        , map8Arg5
        , map8Arg6
        , map8Arg7
        ]


{-| map9: 
    (a1 -> a2 -> a3 -> a4 -> a5 -> a6 -> a7 -> a8 -> a9 -> a10)
    -> Form.Validation.Validation error a1 named1 constraints1
    -> Form.Validation.Validation error a2 named2 constraints2
    -> Form.Validation.Validation error a3 named3 constraints3
    -> Form.Validation.Validation error a4 named4 constraints4
    -> Form.Validation.Validation error a5 named5 constraints5
    -> Form.Validation.Validation error a6 named6 constraints6
    -> Form.Validation.Validation error a7 named7 constraints7
    -> Form.Validation.Validation error a8 named8 constraints8
    -> Form.Validation.Validation error a9 named9 constraints9
    -> Form.Validation.Validation error a10 Basics.Never constraintsAny
-}
map9 :
    (Elm.Expression
    -> Elm.Expression
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
    -> Elm.Expression
map9 map9Arg map9Arg0 map9Arg1 map9Arg2 map9Arg3 map9Arg4 map9Arg5 map9Arg6 map9Arg7 map9Arg8 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map9"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            , Type.var "a6"
                            , Type.var "a7"
                            , Type.var "a8"
                            , Type.var "a9"
                            ]
                            (Type.var "a10")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.var "named6"
                            , Type.var "constraints6"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a7"
                            , Type.var "named7"
                            , Type.var "constraints7"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a8"
                            , Type.var "named8"
                            , Type.var "constraints8"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a9"
                            , Type.var "named9"
                            , Type.var "constraints9"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a10"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map9Unpack"
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
                                                                    (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                                        Elm.functionReduced
                                                                            "unpack"
                                                                            (map9Arg
                                                                                 functionReducedUnpack
                                                                                 functionReducedUnpack0
                                                                                 functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                                                 functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                                                                 functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                                 functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                                 functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                                functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                            )
                                                                    )
                                                            )
                                                    )
                                            )
                                    )
                            )
                    )
            )
        , map9Arg0
        , map9Arg1
        , map9Arg2
        , map9Arg3
        , map9Arg4
        , map9Arg5
        , map9Arg6
        , map9Arg7
        , map9Arg8
        ]


{-| A `Field` that represents the form as a whole. This is useful for attaching validation errors to the form as a whole rather than to a specific field.

global: Form.Validation.Field error () Basics.Never
-}
global : Elm.Expression
global =
    Elm.value
        { importFrom = [ "Form", "Validation" ]
        , name = "global"
        , annotation =
            Just
                (Type.namedWith
                    [ "Form", "Validation" ]
                    "Field"
                    [ Type.var "error"
                    , Type.unit
                    , Type.namedWith [ "Basics" ] "Never" []
                    ]
                )
        }


annotation_ :
    { field :
        Type.Annotation -> Type.Annotation -> Type.Annotation -> Type.Annotation
    , validation :
        Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
    , fieldStatus : Type.Annotation
    }
annotation_ =
    { field =
        \fieldArg0 fieldArg1 fieldArg2 ->
            Type.alias
                moduleName_
                "Field"
                [ fieldArg0, fieldArg1, fieldArg2 ]
                (Type.namedWith
                    [ "Form", "Validation" ]
                    "Validation"
                    [ Type.var "error"
                    , Type.var "parsed"
                    , Type.var "kind"
                    , Type.record [ ( "field", Type.var "kind" ) ]
                    ]
                )
    , validation =
        \validationArg0 validationArg1 validationArg2 validationArg3 ->
            Type.alias
                moduleName_
                "Validation"
                [ validationArg0
                , validationArg1
                , validationArg2
                , validationArg3
                ]
                (Type.namedWith
                    [ "Pages", "Internal", "Form" ]
                    "Validation"
                    [ Type.var "error"
                    , Type.var "parsed"
                    , Type.var "kind"
                    , Type.var "constraints"
                    ]
                )
    , fieldStatus = Type.namedWith [ "Form", "Validation" ] "FieldStatus" []
    }


make_ :
    { notVisited : Elm.Expression
    , focused : Elm.Expression
    , changed : Elm.Expression
    , blurred : Elm.Expression
    }
make_ =
    { notVisited =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "NotVisited"
            , annotation = Just (Type.namedWith [] "FieldStatus" [])
            }
    , focused =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "Focused"
            , annotation = Just (Type.namedWith [] "FieldStatus" [])
            }
    , changed =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "Changed"
            , annotation = Just (Type.namedWith [] "FieldStatus" [])
            }
    , blurred =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "Blurred"
            , annotation = Just (Type.namedWith [] "FieldStatus" [])
            }
    }


caseOf_ :
    { fieldStatus :
        Elm.Expression
        -> { fieldStatusTags_0_0
            | notVisited : Elm.Expression
            , focused : Elm.Expression
            , changed : Elm.Expression
            , blurred : Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { fieldStatus =
        \fieldStatusExpression fieldStatusTags ->
            Elm.Case.custom
                fieldStatusExpression
                (Type.namedWith [ "Form", "Validation" ] "FieldStatus" [])
                [ Elm.Case.branch0 "NotVisited" fieldStatusTags.notVisited
                , Elm.Case.branch0 "Focused" fieldStatusTags.focused
                , Elm.Case.branch0 "Changed" fieldStatusTags.changed
                , Elm.Case.branch0 "Blurred" fieldStatusTags.blurred
                ]
    }


call_ :
    { succeed : Elm.Expression -> Elm.Expression
    , andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , andThen : Elm.Expression -> Elm.Expression -> Elm.Expression
    , fail : Elm.Expression -> Elm.Expression -> Elm.Expression
    , fromResult : Elm.Expression -> Elm.Expression
    , map : Elm.Expression -> Elm.Expression -> Elm.Expression
    , map2 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , withError :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , withErrorIf :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , withFallback : Elm.Expression -> Elm.Expression -> Elm.Expression
    , value : Elm.Expression -> Elm.Expression
    , fieldName : Elm.Expression -> Elm.Expression
    , fieldStatus : Elm.Expression -> Elm.Expression
    , fieldStatusToString : Elm.Expression -> Elm.Expression
    , statusAtLeast : Elm.Expression -> Elm.Expression -> Elm.Expression
    , map3 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map4 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map5 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map6 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map7 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map8 :
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
    , map9 :
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
        -> Elm.Expression
    }
call_ =
    { succeed =
        \succeedArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "succeed"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "parsed" ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ succeedArg ]
    , andMap =
        \andMapArg andMapArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "andMap"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a"
                                    , Type.var "named1"
                                    , Type.var "constraints1"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.function
                                        [ Type.var "a" ]
                                        (Type.var "b")
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "b"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraints3"
                                    ]
                                )
                            )
                    }
                )
                [ andMapArg, andMapArg0 ]
    , andThen =
        \andThenArg andThenArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "andThen"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "parsed" ]
                                    (Type.namedWith
                                        [ "Form", "Validation" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "mapped"
                                        , Type.var "named1"
                                        , Type.var "constraints1"
                                        ]
                                    )
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "mapped"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraintsAny"
                                    ]
                                )
                            )
                    }
                )
                [ andThenArg, andThenArg0 ]
    , fail =
        \failArg failArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "fail"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "error"
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed1"
                                    , Type.var "field"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ failArg, failArg0 ]
    , fromResult =
        \fromResultArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "fromResult"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.namedWith
                                        [ "Result" ]
                                        "Result"
                                        [ Type.var "error", Type.var "parsed" ]
                                    , Type.var "kind"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    ]
                                )
                            )
                    }
                )
                [ fromResultArg ]
    , map =
        \mapArg mapArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "map"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "parsed" ]
                                    (Type.var "mapped")
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "named"
                                    , Type.var "constraint"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "mapped"
                                    , Type.var "erasedKind"
                                    , Type.var "erasedConstraints"
                                    ]
                                )
                            )
                    }
                )
                [ mapArg, mapArg0 ]
    , map2 =
        \map2Arg map2Arg0 map2Arg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "map2"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a", Type.var "b" ]
                                    (Type.var "c")
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a"
                                    , Type.var "named1"
                                    , Type.var "constraints1"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "b"
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "c"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraintsAny"
                                    ]
                                )
                            )
                    }
                )
                [ map2Arg, map2Arg0, map2Arg1 ]
    , withError =
        \withErrorArg withErrorArg0 withErrorArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "withError"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed1"
                                    , Type.var "field"
                                    ]
                                , Type.var "error"
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed2"
                                    , Type.var "named"
                                    , Type.var "constraints"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed2"
                                    , Type.var "named"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withErrorArg, withErrorArg0, withErrorArg1 ]
    , withErrorIf =
        \withErrorIfArg withErrorIfArg0 withErrorIfArg1 withErrorIfArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "withErrorIf"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.bool
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "ignored"
                                    , Type.var "field"
                                    ]
                                , Type.var "error"
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "named"
                                    , Type.var "constraints"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "named"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withErrorIfArg
                , withErrorIfArg0
                , withErrorIfArg1
                , withErrorIfArg2
                ]
    , withFallback =
        \withFallbackArg withFallbackArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "withFallback"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "parsed"
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "named"
                                    , Type.var "constraints"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "named"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withFallbackArg, withFallbackArg0 ]
    , value =
        \valueArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "value"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "named"
                                    , Type.var "constraint"
                                    ]
                                ]
                                (Type.maybe (Type.var "parsed"))
                            )
                    }
                )
                [ valueArg ]
    , fieldName =
        \fieldNameArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "fieldName"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    ]
                                ]
                                Type.string
                            )
                    }
                )
                [ fieldNameArg ]
    , fieldStatus =
        \fieldStatusArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "fieldStatus"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "FieldStatus"
                                    []
                                )
                            )
                    }
                )
                [ fieldStatusArg ]
    , fieldStatusToString =
        \fieldStatusToStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "fieldStatusToString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "FieldStatus"
                                    []
                                ]
                                Type.string
                            )
                    }
                )
                [ fieldStatusToStringArg ]
    , statusAtLeast =
        \statusAtLeastArg statusAtLeastArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "statusAtLeast"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "FieldStatus"
                                    []
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    ]
                                ]
                                Type.bool
                            )
                    }
                )
                [ statusAtLeastArg, statusAtLeastArg0 ]
    , map3 =
        \map3Arg map3Arg0 map3Arg1 map3Arg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "map3"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a1"
                                    , Type.var "a2"
                                    , Type.var "a3"
                                    ]
                                    (Type.var "a4")
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a1"
                                    , Type.var "named1"
                                    , Type.var "constraints1"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a2"
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a3"
                                    , Type.var "named3"
                                    , Type.var "constraints3"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a4"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraintsAny"
                                    ]
                                )
                            )
                    }
                )
                [ map3Arg, map3Arg0, map3Arg1, map3Arg2 ]
    , map4 =
        \map4Arg map4Arg0 map4Arg1 map4Arg2 map4Arg3 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "map4"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a1"
                                    , Type.var "a2"
                                    , Type.var "a3"
                                    , Type.var "a4"
                                    ]
                                    (Type.var "a5")
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a1"
                                    , Type.var "named1"
                                    , Type.var "constraints1"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a2"
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a3"
                                    , Type.var "named3"
                                    , Type.var "constraints3"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a4"
                                    , Type.var "named4"
                                    , Type.var "constraints4"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a5"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraintsAny"
                                    ]
                                )
                            )
                    }
                )
                [ map4Arg, map4Arg0, map4Arg1, map4Arg2, map4Arg3 ]
    , map5 =
        \map5Arg map5Arg0 map5Arg1 map5Arg2 map5Arg3 map5Arg4 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "map5"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a1"
                                    , Type.var "a2"
                                    , Type.var "a3"
                                    , Type.var "a4"
                                    , Type.var "a5"
                                    ]
                                    (Type.var "a6")
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a1"
                                    , Type.var "named1"
                                    , Type.var "constraints1"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a2"
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a3"
                                    , Type.var "named3"
                                    , Type.var "constraints3"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a4"
                                    , Type.var "named4"
                                    , Type.var "constraints4"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a5"
                                    , Type.var "named5"
                                    , Type.var "constraints5"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a6"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraintsAny"
                                    ]
                                )
                            )
                    }
                )
                [ map5Arg, map5Arg0, map5Arg1, map5Arg2, map5Arg3, map5Arg4 ]
    , map6 =
        \map6Arg map6Arg0 map6Arg1 map6Arg2 map6Arg3 map6Arg4 map6Arg5 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "map6"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a1"
                                    , Type.var "a2"
                                    , Type.var "a3"
                                    , Type.var "a4"
                                    , Type.var "a5"
                                    , Type.var "a6"
                                    ]
                                    (Type.var "a7")
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a1"
                                    , Type.var "named1"
                                    , Type.var "constraints1"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a2"
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a3"
                                    , Type.var "named3"
                                    , Type.var "constraints3"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a4"
                                    , Type.var "named4"
                                    , Type.var "constraints4"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a5"
                                    , Type.var "named5"
                                    , Type.var "constraints5"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a6"
                                    , Type.var "named6"
                                    , Type.var "constraints6"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a7"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraintsAny"
                                    ]
                                )
                            )
                    }
                )
                [ map6Arg
                , map6Arg0
                , map6Arg1
                , map6Arg2
                , map6Arg3
                , map6Arg4
                , map6Arg5
                ]
    , map7 =
        \map7Arg map7Arg0 map7Arg1 map7Arg2 map7Arg3 map7Arg4 map7Arg5 map7Arg6 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "map7"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a1"
                                    , Type.var "a2"
                                    , Type.var "a3"
                                    , Type.var "a4"
                                    , Type.var "a5"
                                    , Type.var "a6"
                                    , Type.var "a7"
                                    ]
                                    (Type.var "a8")
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a1"
                                    , Type.var "named1"
                                    , Type.var "constraints1"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a2"
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a3"
                                    , Type.var "named3"
                                    , Type.var "constraints3"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a4"
                                    , Type.var "named4"
                                    , Type.var "constraints4"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a5"
                                    , Type.var "named5"
                                    , Type.var "constraints5"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a6"
                                    , Type.var "named6"
                                    , Type.var "constraints6"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a7"
                                    , Type.var "named7"
                                    , Type.var "constraints7"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a8"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraintsAny"
                                    ]
                                )
                            )
                    }
                )
                [ map7Arg
                , map7Arg0
                , map7Arg1
                , map7Arg2
                , map7Arg3
                , map7Arg4
                , map7Arg5
                , map7Arg6
                ]
    , map8 =
        \map8Arg map8Arg0 map8Arg1 map8Arg2 map8Arg3 map8Arg4 map8Arg5 map8Arg6 map8Arg7 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "map8"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a1"
                                    , Type.var "a2"
                                    , Type.var "a3"
                                    , Type.var "a4"
                                    , Type.var "a5"
                                    , Type.var "a6"
                                    , Type.var "a7"
                                    , Type.var "a8"
                                    ]
                                    (Type.var "a9")
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a1"
                                    , Type.var "named1"
                                    , Type.var "constraints1"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a2"
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a3"
                                    , Type.var "named3"
                                    , Type.var "constraints3"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a4"
                                    , Type.var "named4"
                                    , Type.var "constraints4"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a5"
                                    , Type.var "named5"
                                    , Type.var "constraints5"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a6"
                                    , Type.var "named6"
                                    , Type.var "constraints6"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a7"
                                    , Type.var "named7"
                                    , Type.var "constraints7"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a8"
                                    , Type.var "named8"
                                    , Type.var "constraints8"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a9"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraintsAny"
                                    ]
                                )
                            )
                    }
                )
                [ map8Arg
                , map8Arg0
                , map8Arg1
                , map8Arg2
                , map8Arg3
                , map8Arg4
                , map8Arg5
                , map8Arg6
                , map8Arg7
                ]
    , map9 =
        \map9Arg map9Arg0 map9Arg1 map9Arg2 map9Arg3 map9Arg4 map9Arg5 map9Arg6 map9Arg7 map9Arg8 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Validation" ]
                    , name = "map9"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a1"
                                    , Type.var "a2"
                                    , Type.var "a3"
                                    , Type.var "a4"
                                    , Type.var "a5"
                                    , Type.var "a6"
                                    , Type.var "a7"
                                    , Type.var "a8"
                                    , Type.var "a9"
                                    ]
                                    (Type.var "a10")
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a1"
                                    , Type.var "named1"
                                    , Type.var "constraints1"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a2"
                                    , Type.var "named2"
                                    , Type.var "constraints2"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a3"
                                    , Type.var "named3"
                                    , Type.var "constraints3"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a4"
                                    , Type.var "named4"
                                    , Type.var "constraints4"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a5"
                                    , Type.var "named5"
                                    , Type.var "constraints5"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a6"
                                    , Type.var "named6"
                                    , Type.var "constraints6"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a7"
                                    , Type.var "named7"
                                    , Type.var "constraints7"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a8"
                                    , Type.var "named8"
                                    , Type.var "constraints8"
                                    ]
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a9"
                                    , Type.var "named9"
                                    , Type.var "constraints9"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Validation"
                                    [ Type.var "error"
                                    , Type.var "a10"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.var "constraintsAny"
                                    ]
                                )
                            )
                    }
                )
                [ map9Arg
                , map9Arg0
                , map9Arg1
                , map9Arg2
                , map9Arg3
                , map9Arg4
                , map9Arg5
                , map9Arg6
                , map9Arg7
                , map9Arg8
                ]
    }


values_ :
    { succeed : Elm.Expression
    , andMap : Elm.Expression
    , andThen : Elm.Expression
    , fail : Elm.Expression
    , fromResult : Elm.Expression
    , map : Elm.Expression
    , map2 : Elm.Expression
    , withError : Elm.Expression
    , withErrorIf : Elm.Expression
    , withFallback : Elm.Expression
    , value : Elm.Expression
    , fieldName : Elm.Expression
    , fieldStatus : Elm.Expression
    , fieldStatusToString : Elm.Expression
    , statusAtLeast : Elm.Expression
    , map3 : Elm.Expression
    , map4 : Elm.Expression
    , map5 : Elm.Expression
    , map6 : Elm.Expression
    , map7 : Elm.Expression
    , map8 : Elm.Expression
    , map9 : Elm.Expression
    , global : Elm.Expression
    }
values_ =
    { succeed =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "succeed"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "parsed" ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , andMap =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "andMap"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.function [ Type.var "a" ] (Type.var "b")
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "b"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraints3"
                            ]
                        )
                    )
            }
    , andThen =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "andThen"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.namedWith
                                [ "Form", "Validation" ]
                                "Validation"
                                [ Type.var "error"
                                , Type.var "mapped"
                                , Type.var "named1"
                                , Type.var "constraints1"
                                ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "mapped"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
    , fail =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fail"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "error"
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed1"
                            , Type.var "field"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , fromResult =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fromResult"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "error", Type.var "parsed" ]
                            , Type.var "kind"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.namedWith [ "Basics" ] "Never" []
                            ]
                        )
                    )
            }
    , map =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.var "mapped")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraint"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "mapped"
                            , Type.var "erasedKind"
                            , Type.var "erasedConstraints"
                            ]
                        )
                    )
            }
    , map2 =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map2"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a", Type.var "b" ]
                            (Type.var "c")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "b"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "c"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
    , withError =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "withError"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed1"
                            , Type.var "field"
                            ]
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , withErrorIf =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "withErrorIf"
            , annotation =
                Just
                    (Type.function
                        [ Type.bool
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "ignored"
                            , Type.var "field"
                            ]
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , withFallback =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "withFallback"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "parsed"
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , value =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "value"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "named"
                            , Type.var "constraint"
                            ]
                        ]
                        (Type.maybe (Type.var "parsed"))
                    )
            }
    , fieldName =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fieldName"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        Type.string
                    )
            }
    , fieldStatus =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fieldStatus"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "FieldStatus"
                            []
                        )
                    )
            }
    , fieldStatusToString =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "fieldStatusToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "FieldStatus"
                            []
                        ]
                        Type.string
                    )
            }
    , statusAtLeast =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "statusAtLeast"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Validation" ]
                            "FieldStatus"
                            []
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        Type.bool
                    )
            }
    , map3 =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map3"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1", Type.var "a2", Type.var "a3" ]
                            (Type.var "a4")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
    , map4 =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map4"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            ]
                            (Type.var "a5")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
    , map5 =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map5"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            ]
                            (Type.var "a6")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
    , map6 =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map6"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            , Type.var "a6"
                            ]
                            (Type.var "a7")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.var "named6"
                            , Type.var "constraints6"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a7"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
    , map7 =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map7"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            , Type.var "a6"
                            , Type.var "a7"
                            ]
                            (Type.var "a8")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.var "named6"
                            , Type.var "constraints6"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a7"
                            , Type.var "named7"
                            , Type.var "constraints7"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a8"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
    , map8 =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map8"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            , Type.var "a6"
                            , Type.var "a7"
                            , Type.var "a8"
                            ]
                            (Type.var "a9")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.var "named6"
                            , Type.var "constraints6"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a7"
                            , Type.var "named7"
                            , Type.var "constraints7"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a8"
                            , Type.var "named8"
                            , Type.var "constraints8"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a9"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
    , map9 =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "map9"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a1"
                            , Type.var "a2"
                            , Type.var "a3"
                            , Type.var "a4"
                            , Type.var "a5"
                            , Type.var "a6"
                            , Type.var "a7"
                            , Type.var "a8"
                            , Type.var "a9"
                            ]
                            (Type.var "a10")
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a1"
                            , Type.var "named1"
                            , Type.var "constraints1"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a2"
                            , Type.var "named2"
                            , Type.var "constraints2"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a3"
                            , Type.var "named3"
                            , Type.var "constraints3"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a4"
                            , Type.var "named4"
                            , Type.var "constraints4"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a5"
                            , Type.var "named5"
                            , Type.var "constraints5"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a6"
                            , Type.var "named6"
                            , Type.var "constraints6"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a7"
                            , Type.var "named7"
                            , Type.var "constraints7"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a8"
                            , Type.var "named8"
                            , Type.var "constraints8"
                            ]
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a9"
                            , Type.var "named9"
                            , Type.var "constraints9"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Validation" ]
                            "Validation"
                            [ Type.var "error"
                            , Type.var "a10"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.var "constraintsAny"
                            ]
                        )
                    )
            }
    , global =
        Elm.value
            { importFrom = [ "Form", "Validation" ]
            , name = "global"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Form", "Validation" ]
                        "Field"
                        [ Type.var "error"
                        , Type.unit
                        , Type.namedWith [ "Basics" ] "Never" []
                        ]
                    )
            }
    }


