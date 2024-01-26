module Gen.Form.Field exposing (annotation_, call_, caseOf_, checkbox, date, email, exactValue, float, int, make_, map, moduleName_, password, range, required, search, select, telephone, text, textarea, time, url, validateMap, values_, withInitialValue, withMax, withMaxLength, withMin, withMinLength, withOptionalInitialValue, withStep)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, withStep, withMaxLength, withMinLength, withMax, withMin, range, textarea, url, telephone, search, password, email, map, validateMap, required, exactValue, withOptionalInitialValue, withInitialValue, time, date, select, float, int, checkbox, text, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Form", "Field" ]


{-| The base for a text field. You can add display modifiers to text fields, including displaying them as a `textarea`.
See [Text Field Display Options](#text-field-display-options).

By default, text fields are not required. If the field is not touched or has been deleted, the value will be `Nothing`
(_not_ empty string `Just ""`). See [`required`](#required).

    import Form.Field as Field

    type alias Profile =
        { status : Maybe String
        }

    example =
        (\username ->
            { combine =
                Validation.succeed Status
                    |> Validation.andMap username
            , view = []
            }
        )
            |> Form.form
            |> Form.field "status" Field.text

text: 
    Form.Field.Field error (Maybe String) input String Form.FieldView.Input { required :
        ()
    , plainText : ()
    , wasMapped : Form.Field.No
    , minlength : ()
    , maxlength : ()
    }
-}
text : Elm.Expression
text =
    Elm.value
        { importFrom = [ "Form", "Field" ]
        , name = "text"
        , annotation =
            Just
                (Type.namedWith
                    [ "Form", "Field" ]
                    "Field"
                    [ Type.var "error"
                    , Type.maybe Type.string
                    , Type.var "input"
                    , Type.string
                    , Type.namedWith [ "Form", "FieldView" ] "Input" []
                    , Type.record
                        [ ( "required", Type.unit )
                        , ( "plainText", Type.unit )
                        , ( "wasMapped"
                          , Type.namedWith [ "Form", "Field" ] "No" []
                          )
                        , ( "minlength", Type.unit )
                        , ( "maxlength", Type.unit )
                        ]
                    ]
                )
        }


{-| Renders a checkbox input (`<input type="checkbox">`), see <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/checkbox>.

    import Form.Field as Field

    example =
        Field.checkbox

checkbox: Form.Field.Field error Bool input Bool Form.FieldView.Input { required : () }
-}
checkbox : Elm.Expression
checkbox =
    Elm.value
        { importFrom = [ "Form", "Field" ]
        , name = "checkbox"
        , annotation =
            Just
                (Type.namedWith
                    [ "Form", "Field" ]
                    "Field"
                    [ Type.var "error"
                    , Type.bool
                    , Type.var "input"
                    , Type.bool
                    , Type.namedWith [ "Form", "FieldView" ] "Input" []
                    , Type.record [ ( "required", Type.unit ) ]
                    ]
                )
        }


{-| Renders a number input (`<input type="number">`), see <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/number>.

Floating point numbers will give a validation error, using the error value passed in through the `invalid` function.

    import Form.Field as Field

    example =
        Field.number
            { invalid =
                \value -> "Must be an integer"
            }

int: 
    { invalid : String -> error }
    -> Form.Field.Field error (Maybe Int) input Int Form.FieldView.Input { min : Int
    , max : Int
    , required : ()
    , wasMapped : Form.Field.No
    , step : Int
    }
-}
int : { invalid : Elm.Expression -> Elm.Expression } -> Elm.Expression
int intArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "int"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "invalid"
                              , Type.function [ Type.string ] (Type.var "error")
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe Type.int
                            , Type.var "input"
                            , Type.int
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "min", Type.int )
                                , ( "max", Type.int )
                                , ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                , ( "step", Type.int )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "invalid"
                (Elm.functionReduced "intUnpack" intArg.invalid)
            ]
        ]


{-| A number input (`<input type="number">`), see <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/number>.

Unlike [`int`](#int), this field allows floating point numbers.
It will give a validation error if the input is not a number, using the error value passed in through the `invalid` function.

    import Form.Field as Field

    example =
        Field.number
            { invalid =
                \value -> "Must be a number"
            }

float: 
    { invalid : String -> error }
    -> Form.Field.Field error (Maybe Float) input Float Form.FieldView.Input { min :
        Float
    , max : Float
    , required : ()
    , wasMapped : Form.Field.No
    }
-}
float : { invalid : Elm.Expression -> Elm.Expression } -> Elm.Expression
float floatArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "float"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "invalid"
                              , Type.function [ Type.string ] (Type.var "error")
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe Type.float
                            , Type.var "input"
                            , Type.float
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "min", Type.float )
                                , ( "max", Type.float )
                                , ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "invalid"
                (Elm.functionReduced "floatUnpack" floatArg.invalid)
            ]
        ]


{-| An input for a set of possible options. Can be rendered in two ways

  - As a dropdown (`<select>`)[`Form.FieldView.select`](Form-FieldView#select)
  - As a set of radio buttons (`<input type="radio">`)[`Form.FieldView.radio`](Form-FieldView#radio).

```elm
import Form
import Form.Field as Field
import Form.FieldView as FieldView
import Form.Validation as Validation

sizeForm : Form.HtmlForm String Size input msg
sizeForm =
    (\size ->
        { combine =
            Validation.succeed identity
                |> Validation.andMap size
        , view =
            \formState ->
                [ Html.div []
                    [ FieldView.select []
                        (\entry -> ( [], sizeToString entry ))
                        size
                    ]
                , Html.button [] [ Html.text "Submit" ]
                ]
        }
    )
        |> Form.form
        |> Form.field "size"
            (Field.select
                [ ( "small", Small )
                , ( "medium", Medium )
                , ( "large", Large )
                ]
                (\_ -> "Invalid")
                |> Field.required "Required"
                |> Field.withInitialValue (\_ -> Small)
            )

sizeToString : Size -> String
sizeToString size =
    case size of
        Small ->
            "Small"

        Medium ->
            "Medium"

        Large ->
            "Large"

type Size
    = Small
    | Medium
    | Large
```

select: 
    List ( String, option )
    -> (String -> error)
    -> Form.Field.Field error (Maybe option) input option (Internal.Input.Options option) { required :
        ()
    , wasMapped : Form.Field.No
    }
-}
select :
    List Elm.Expression -> (Elm.Expression -> Elm.Expression) -> Elm.Expression
select selectArg selectArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "select"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.tuple Type.string (Type.var "option"))
                        , Type.function [ Type.string ] (Type.var "error")
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe (Type.var "option")
                            , Type.var "input"
                            , Type.var "option"
                            , Type.namedWith
                                [ "Internal", "Input" ]
                                "Options"
                                [ Type.var "option" ]
                            , Type.record
                                [ ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.list selectArg, Elm.functionReduced "selectUnpack" selectArg0 ]


{-| A date field. Parses into a value of type [`Date`](https://package.elm-lang.org/packages/justinmimbs/date/latest/Date#Date).

    example =
        Field.date
            { invalid = \_ -> "Invalid date" }
            |> Field.required "Required"
            |> Field.withMin (Date.fromRataDie 738624) "Must be after today"
            -- date picker will show dates on the same day of the week starting from the start date
            |> Field.withStep 7

date: 
    { invalid : String -> error }
    -> Form.Field.Field error (Maybe Date.Date) input Date.Date Form.FieldView.Input { min :
        Date.Date
    , max : Date.Date
    , required : ()
    , wasMapped : Form.Field.No
    , step : Int
    }
-}
date : { invalid : Elm.Expression -> Elm.Expression } -> Elm.Expression
date dateArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "date"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "invalid"
                              , Type.function [ Type.string ] (Type.var "error")
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe (Type.namedWith [ "Date" ] "Date" [])
                            , Type.var "input"
                            , Type.namedWith [ "Date" ] "Date" []
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "min", Type.namedWith [ "Date" ] "Date" [] )
                                , ( "max", Type.namedWith [ "Date" ] "Date" [] )
                                , ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                , ( "step", Type.int )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "invalid"
                (Elm.functionReduced "dateUnpack" dateArg.invalid)
            ]
        ]


{-| <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/time>

time: 
    { invalid : String -> error }
    -> Form.Field.Field error (Maybe Form.Field.TimeOfDay) input Form.Field.TimeOfDay Form.FieldView.Input { min :
        Form.Field.TimeOfDay
    , max : Form.Field.TimeOfDay
    , required : ()
    , wasMapped : Form.Field.No
    , step : Int
    }
-}
time : { invalid : Elm.Expression -> Elm.Expression } -> Elm.Expression
time timeArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "time"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "invalid"
                              , Type.function [ Type.string ] (Type.var "error")
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "TimeOfDay"
                                    []
                                )
                            , Type.var "input"
                            , Type.namedWith [ "Form", "Field" ] "TimeOfDay" []
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "min"
                                  , Type.namedWith
                                        [ "Form", "Field" ]
                                        "TimeOfDay"
                                        []
                                  )
                                , ( "max"
                                  , Type.namedWith
                                        [ "Form", "Field" ]
                                        "TimeOfDay"
                                        []
                                  )
                                , ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                , ( "step", Type.int )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "invalid"
                (Elm.functionReduced "timeUnpack" timeArg.invalid)
            ]
        ]


{-| Set an initial value for the `Field` given the `Form`'s `input` (see [`Form.withInput`](Form#withInput)).
This allows you to pass in dynamic state like values from your `Model`.

The initial value will be used until the field is modified by the user, and from there it is controlled by user input. If you
need to programmatically set a field's value for more advanced use cases, you can also modify the [`Form.Model`](Form#Model).

The type you use to set the initial value depends on the Field. For example, you can set a `checkbox` Field's initial value
with a `Bool`

    example =
        Form.checkbox |> Form.withInitialValue .autoplay

    formOptions : { autoplay : Bool } -> Form.Options String parsed { autoplay : Bool } msg
    formOptions currentSettings =
        Form.options "settings"
            |> Form.withInput currentSettings

Note that the type used to set the initial value is independent of types you might `map` a field into.

withInitialValue: 
    (input -> initial)
    -> Form.Field.Field error value input initial kind constraints
    -> Form.Field.Field error value input initial kind constraints
-}
withInitialValue :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
withInitialValue withInitialValueArg withInitialValueArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withInitialValue"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "input" ]
                            (Type.var "initial")
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "withInitialValueUnpack" withInitialValueArg
        , withInitialValueArg0
        ]


{-| Similar to [`withInitialValue`](#withInitialValue), but takes in a `Maybe` value. If the `Maybe` is `Nothing` then it's
the same as if no initial value were set.

    example =
        Form.text |> Form.withOptionalInitialValue .nickname

    formOptions : { nickname : Maybe String } -> Form.Options String parsed { nickname : Maybe String } msg
    formOptions currentProfile =
        Form.options "profile"
            |> Form.withInput currentProfile

withOptionalInitialValue: 
    (input -> Maybe initial)
    -> Form.Field.Field error value input initial kind constraints
    -> Form.Field.Field error value input initial kind constraints
-}
withOptionalInitialValue :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
withOptionalInitialValue withOptionalInitialValueArg withOptionalInitialValueArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withOptionalInitialValue"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "input" ]
                            (Type.maybe (Type.var "initial"))
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "withOptionalInitialValueUnpack"
            withOptionalInitialValueArg
        , withOptionalInitialValueArg0
        ]


{-| Render a field with a hardcoded value.

exactValue: 
    String
    -> error
    -> Form.Field.Field error String input Basics.Never Form.FieldView.Input { required :
        ()
    , plainText : ()
    , wasMapped : Form.Field.No
    }
-}
exactValue : String -> Elm.Expression -> Elm.Expression
exactValue exactValueArg exactValueArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "exactValue"
            , annotation =
                Just
                    (Type.function
                        [ Type.string, Type.var "error" ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.string
                            , Type.var "input"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "required", Type.unit )
                                , ( "plainText", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.string exactValueArg, exactValueArg0 ]


{-| Gives a validation error for fields that haven't been set, and removes the `Maybe` around the parsed value.

    example =
        Field.int { invalid = \_ -> "Invalid" }
            -- parses into `Maybe Int` before we call `required`
            -- after `required`, it parses into an `Int`
            |> Field.required "Required"

required: 
    error
    -> Form.Field.Field error (Maybe parsed) kind input initial { constraints
        | required : ()
        , wasMapped : Form.Field.No
    }
    -> Form.Field.Field error parsed kind input initial { constraints
        | wasMapped : Form.Field.No
    }
-}
required : Elm.Expression -> Elm.Expression -> Elm.Expression
required requiredArg requiredArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "required"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe (Type.var "parsed")
                            , Type.var "kind"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.extensible
                                "constraints"
                                [ ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.extensible
                                "constraints"
                                [ ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
        )
        [ requiredArg, requiredArg0 ]


{-| Add a custom validation and/or transformation of the value to the field.

    import Form.Field as Field

    example =
        Field.text
            |> Field.required "Required"
            |> Field.validateMap Username.fromString

      -- in Username.elm
      fromString : String -> Result String Username
      fromString string =
          if string |> String.contains "@" then
              Err "Must not contain @"

          else
              Username string |> Ok

validateMap: 
    (parsed -> Result.Result error mapped)
    -> Form.Field.Field error parsed input initial kind constraints
    -> Form.Field.Field error mapped input initial kind { constraints
        | wasMapped : Form.Field.Yes
    }
-}
validateMap :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
validateMap validateMapArg validateMapArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "validateMap"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "error", Type.var "mapped" ]
                            )
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "mapped"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "Yes" []
                                  )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "validateMapUnpack" validateMapArg
        , validateMapArg0
        ]


{-| Map the parsed value of a Field without adding or modifying its validations or rendering.

    import Form.Field as Field

    example =
        Field.text
            |> Field.required "Required"
            |> Field.map String.toUpper

map: 
    (parsed -> mapped)
    -> Form.Field.Field error parsed input initial kind constraints
    -> Form.Field.Field error mapped input initial kind { constraints
        | wasMapped : Form.Field.Yes
    }
-}
map : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
map mapArg mapArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.var "mapped")
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "mapped"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "Yes" []
                                  )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "mapUnpack" mapArg, mapArg0 ]


{-| Modifier for [`text`](#text) Field. This does not perform any additional validations on the Field, it only provides a hint to the browser
that the Field should be displayed as an email input (`<input type="email">`). This is especially useful for mobile devices to make sure
the correct keyboard is displayed.

See <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/email>.

    example =
        Field.text
            |> Field.email
            |> Field.required "Email is required"

email: 
    Form.Field.Field error parsed input initial Form.FieldView.Input { constraints
        | plainText : ()
    }
    -> Form.Field.Field error parsed input initial Form.FieldView.Input constraints
-}
email : Elm.Expression -> Elm.Expression
email emailArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "email"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ emailArg ]


{-| Modifier for [`text`](#text) Field. This is only a display hint to the browser that the Field should be displayed as a password input (`<input type="password">`).

See <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/password>.

    example =
        Field.text
            |> Field.password
            |> Field.required "Password is required"

password: 
    Form.Field.Field error parsed input initial Form.FieldView.Input { constraints
        | plainText : ()
    }
    -> Form.Field.Field error parsed input initial Form.FieldView.Input constraints
-}
password : Elm.Expression -> Elm.Expression
password passwordArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "password"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ passwordArg ]


{-| Modifier for [`text`](#text) Field. This changes the display of the Field to a password input (`<input type="search">`).
On mobile devices, this will display a keyboard with a search button.

See <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/search>.

    example =
        Field.text
            |> Field.search

search: 
    Form.Field.Field error parsed input initial Form.FieldView.Input { constraints
        | plainText : ()
    }
    -> Form.Field.Field error parsed input initial Form.FieldView.Input constraints
-}
search : Elm.Expression -> Elm.Expression
search searchArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "search"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ searchArg ]


{-| Modifier for [`text`](#text) Field. This is only a display hint to the browser (`<input type="tel">`).

This is especially important on mobile devices for ensuring that the correct keyboard is displayed for inputting a phone number.

See <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/tel>.

    example =
        Field.text
            |> Field.telephone

telephone: 
    Form.Field.Field error parsed input initial Form.FieldView.Input { constraints
        | plainText : ()
    }
    -> Form.Field.Field error parsed input initial Form.FieldView.Input constraints
-}
telephone : Elm.Expression -> Elm.Expression
telephone telephoneArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "telephone"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ telephoneArg ]


{-| Modifier for [`text`](#text) Field. This does not perform any additional validations on the Field, it only provides a hint to the browser
that the Field should be displayed as a URL input (`<input type="url">`).

See <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/url>.

    example =
        Field.text
            |> Field.url
            |> Field.required "URL is required"

url: 
    Form.Field.Field error parsed input initial Form.FieldView.Input { constraints
        | plainText : ()
    }
    -> Form.Field.Field error parsed input initial Form.FieldView.Input constraints
-}
url : Elm.Expression -> Elm.Expression
url urlArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "url"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ urlArg ]


{-| Modifier for [`text`](#text) Field to display it as a [`textarea`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/textarea).

`textarea` are for multi-line text input. For example, you might use a regular `text` Field for a username, and a `textarea` Field for a biography.

    import Form.Field as Field

    type alias Profile =
        { username : String
        , bio : String
        }

    example =
        (\username bio ->
            { combine =
                Validation.succeed Profile
                    |> Validation.andMap username
                    |> Validation.andMap bio
            , view = []
            }
        )
            |> Form.form
            |> Form.field "username"
                (Field.text
                    |> Field.required "Required"
                )
            |> Form.field "bio"
                (Field.text
                    |> Field.textarea
                        { rows = Just 20
                        , cols = Just 50
                        }
                    |> Field.required "Required"
                )

textarea: 
    { rows : Maybe Int, cols : Maybe Int }
    -> Form.Field.Field error parsed input initial Form.FieldView.Input { constraints
        | plainText : ()
    }
    -> Form.Field.Field error parsed input initial Form.FieldView.Input constraints
-}
textarea :
    { rows : Elm.Expression, cols : Elm.Expression }
    -> Elm.Expression
    -> Elm.Expression
textarea textareaArg textareaArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "textarea"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "rows", Type.maybe Type.int )
                            , ( "cols", Type.maybe Type.int )
                            ]
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair "rows" textareaArg.rows
            , Tuple.pair "cols" textareaArg.cols
            ]
        , textareaArg0
        ]


{-| Display a range input (`<input type="range">`). See <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/range>.

    import Form.Field as Field

    type alias Settings =
        { brightness : Int
        }

    example =
        (\brightness ->
            { combine =
                Validation.succeed Settings
                    |> Validation.andMap brightness
            , view = []
            }
        )
            |> Form.form
            |> Form.field "brightness"
                (Field.range
                    { min = 0
                    , max = 100
                    , missing = "Required"
                    , invalid =
                        \outsideRange ->
                            case outsideRange of
                                Field.AboveRange ->
                                    "Must be below 100"

                                Field.BelowRange ->
                                    "Must be above 0"
                    }
                    (Field.int { invalid = \_ -> "Invalid" })
                )

Can be used with either [`int`](#int) or [`float`](#float).

range: 
    { min : numberInitial
    , max : numberInitial
    , missing : error
    , invalid : Form.Field.OutsideRange -> error
    }
    -> Form.Field.Field error (Maybe valueType) input numberInitial kind { constraints
        | required : ()
        , min : numberInitial
        , max : numberInitial
        , wasMapped : Form.Field.No
    }
    -> Form.Field.Field error valueType input numberInitial Form.FieldView.Input { constraints
        | wasMapped : Form.Field.No
    }
-}
range :
    { min : Elm.Expression
    , max : Elm.Expression
    , missing : Elm.Expression
    , invalid : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
    -> Elm.Expression
range rangeArg rangeArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "range"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "min", Type.var "numberInitial" )
                            , ( "max", Type.var "numberInitial" )
                            , ( "missing", Type.var "error" )
                            , ( "invalid"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Form", "Field" ]
                                        "OutsideRange"
                                        []
                                    ]
                                    (Type.var "error")
                              )
                            ]
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe (Type.var "valueType")
                            , Type.var "input"
                            , Type.var "numberInitial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "required", Type.unit )
                                , ( "min", Type.var "numberInitial" )
                                , ( "max", Type.var "numberInitial" )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "valueType"
                            , Type.var "input"
                            , Type.var "numberInitial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair "min" rangeArg.min
            , Tuple.pair "max" rangeArg.max
            , Tuple.pair "missing" rangeArg.missing
            , Tuple.pair
                "invalid"
                (Elm.functionReduced "rangeUnpack" rangeArg.invalid)
            ]
        , rangeArg0
        ]


{-| Set the min value for the Field. This results in both a validation (run on the server as well as the client) as well as a display hint to the browser
(`<input type="date" min="2023-04-14">`). The Browser will prevent the user from entering a value below the min value in some cases but not all.

See <https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/min>.

If the value is invalid (below the minimum), the error will be whichever error is passed in as the second argument.

    import Date exposing (Date)
    import Form.Field as Field

    example =
        Field.date
            { invalid = \_ -> "Must be valid date" }
            |> Field.required "Required"
            |> Field.withMin today ("Must be after " ++ Date.toIsoString today)

    today : Date
    today =
        Date.fromRataDie 738624

withMin: 
    initial
    -> error
    -> Form.Field.Field error parsed input initial kind { constraints
        | min : initial
    }
    -> Form.Field.Field error parsed input initial kind constraints
-}
withMin : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
withMin withMinArg withMinArg0 withMinArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withMin"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "initial"
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "min", Type.var "initial" ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ withMinArg, withMinArg0, withMinArg1 ]


{-| Same as [`withMin`](#withMin) but for a maximum value. See <https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/max>.

    import Date exposing (Date)
    import Form.Field as Field

    example =
        Field.date
            { invalid = \_ -> "Must be valid date" }
            |> Field.required "Required"
            |> Field.withMax today "Cannot schedule more than 7 days in advance"

    inAWeek : Date
    inAWeek =
        Date.fromRataDie (today + 7)

    today : Int
    today =
        738624

withMax: 
    initial
    -> error
    -> Form.Field.Field error parsed input initial kind { constraints
        | max : initial
    }
    -> Form.Field.Field error parsed input initial kind constraints
-}
withMax : Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
withMax withMaxArg withMaxArg0 withMaxArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withMax"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "initial"
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "max", Type.var "initial" ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ withMaxArg, withMaxArg0, withMaxArg1 ]


{-| Set a minimum length for the string. See <https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/minlength>.

withMinLength: 
    Int
    -> error
    -> Form.Field.Field error parsed input initial kind { constraints
        | minlength : ()
    }
    -> Form.Field.Field error parsed input initial kind constraints
-}
withMinLength : Int -> Elm.Expression -> Elm.Expression -> Elm.Expression
withMinLength withMinLengthArg withMinLengthArg0 withMinLengthArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withMinLength"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "minlength", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ Elm.int withMinLengthArg, withMinLengthArg0, withMinLengthArg1 ]


{-| Set a maximum length for the string. See <https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/maxlength>.

withMaxLength: 
    Int
    -> error
    -> Form.Field.Field error parsed input initial kind { constraints
        | maxlength : ()
    }
    -> Form.Field.Field error parsed input initial kind constraints
-}
withMaxLength : Int -> Elm.Expression -> Elm.Expression -> Elm.Expression
withMaxLength withMaxLengthArg withMaxLengthArg0 withMaxLengthArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withMaxLength"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "maxlength", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ Elm.int withMaxLengthArg, withMaxLengthArg0, withMaxLengthArg1 ]


{-| Sets the `step` attribute on the form field for Field's with `Int` steps. See <https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/step>.

For `int` fields, the step will change the up/down buttons in the field's UI to increment/decrement by the given step.

`Int` step values have different meanings for different kinds of Fields.

  - [`date`](#date) - number of days
  - [`time`](#time) - time in seconds

withStep: 
    Int
    -> Form.Field.Field error value input initial view { constraints | step : Int }
    -> Form.Field.Field error value input initial view constraints
-}
withStep : Int -> Elm.Expression -> Elm.Expression
withStep withStepArg withStepArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withStep"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "view"
                            , Type.extensible
                                "constraints"
                                [ ( "step", Type.int ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "view"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
        )
        [ Elm.int withStepArg, withStepArg0 ]


annotation_ :
    { field :
        Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
    , outsideRange : Type.Annotation
    , timeOfDay : Type.Annotation
    , no : Type.Annotation
    , yes : Type.Annotation
    }
annotation_ =
    { field =
        \fieldArg0 fieldArg1 fieldArg2 fieldArg3 fieldArg4 fieldArg5 ->
            Type.alias
                moduleName_
                "Field"
                [ fieldArg0
                , fieldArg1
                , fieldArg2
                , fieldArg3
                , fieldArg4
                , fieldArg5
                ]
                (Type.namedWith
                    [ "Internal", "Field" ]
                    "Field"
                    [ Type.var "error"
                    , Type.var "parsed"
                    , Type.var "input"
                    , Type.var "initial"
                    , Type.var "kind"
                    , Type.var "constraints"
                    ]
                )
    , outsideRange = Type.namedWith [ "Form", "Field" ] "OutsideRange" []
    , timeOfDay =
        Type.alias
            moduleName_
            "TimeOfDay"
            []
            (Type.record
                [ ( "hours", Type.int )
                , ( "minutes", Type.int )
                , ( "seconds", Type.maybe Type.int )
                ]
            )
    , no = Type.namedWith [ "Form", "Field" ] "No" []
    , yes = Type.namedWith [ "Form", "Field" ] "Yes" []
    }


make_ :
    { aboveRange : Elm.Expression
    , belowRange : Elm.Expression
    , timeOfDay :
        { hours : Elm.Expression
        , minutes : Elm.Expression
        , seconds : Elm.Expression
        }
        -> Elm.Expression
    }
make_ =
    { aboveRange =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "AboveRange"
            , annotation = Just (Type.namedWith [] "OutsideRange" [])
            }
    , belowRange =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "BelowRange"
            , annotation = Just (Type.namedWith [] "OutsideRange" [])
            }
    , timeOfDay =
        \timeOfDay_args ->
            Elm.withType
                (Type.alias
                    [ "Form", "Field" ]
                    "TimeOfDay"
                    []
                    (Type.record
                        [ ( "hours", Type.int )
                        , ( "minutes", Type.int )
                        , ( "seconds", Type.maybe Type.int )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "hours" timeOfDay_args.hours
                    , Tuple.pair "minutes" timeOfDay_args.minutes
                    , Tuple.pair "seconds" timeOfDay_args.seconds
                    ]
                )
    }


caseOf_ :
    { outsideRange :
        Elm.Expression
        -> { outsideRangeTags_0_0
            | aboveRange : Elm.Expression
            , belowRange : Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { outsideRange =
        \outsideRangeExpression outsideRangeTags ->
            Elm.Case.custom
                outsideRangeExpression
                (Type.namedWith [ "Form", "Field" ] "OutsideRange" [])
                [ Elm.Case.branch0 "AboveRange" outsideRangeTags.aboveRange
                , Elm.Case.branch0 "BelowRange" outsideRangeTags.belowRange
                ]
    }


call_ :
    { int : Elm.Expression -> Elm.Expression
    , float : Elm.Expression -> Elm.Expression
    , select : Elm.Expression -> Elm.Expression -> Elm.Expression
    , date : Elm.Expression -> Elm.Expression
    , time : Elm.Expression -> Elm.Expression
    , withInitialValue : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withOptionalInitialValue :
        Elm.Expression -> Elm.Expression -> Elm.Expression
    , exactValue : Elm.Expression -> Elm.Expression -> Elm.Expression
    , required : Elm.Expression -> Elm.Expression -> Elm.Expression
    , validateMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , map : Elm.Expression -> Elm.Expression -> Elm.Expression
    , email : Elm.Expression -> Elm.Expression
    , password : Elm.Expression -> Elm.Expression
    , search : Elm.Expression -> Elm.Expression
    , telephone : Elm.Expression -> Elm.Expression
    , url : Elm.Expression -> Elm.Expression
    , textarea : Elm.Expression -> Elm.Expression -> Elm.Expression
    , range : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withMin :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , withMax :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , withMinLength :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , withMaxLength :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , withStep : Elm.Expression -> Elm.Expression -> Elm.Expression
    }
call_ =
    { int =
        \intArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "int"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "invalid"
                                      , Type.function
                                            [ Type.string ]
                                            (Type.var "error")
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.maybe Type.int
                                    , Type.var "input"
                                    , Type.int
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.record
                                        [ ( "min", Type.int )
                                        , ( "max", Type.int )
                                        , ( "required", Type.unit )
                                        , ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        , ( "step", Type.int )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ intArg ]
    , float =
        \floatArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "float"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "invalid"
                                      , Type.function
                                            [ Type.string ]
                                            (Type.var "error")
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.maybe Type.float
                                    , Type.var "input"
                                    , Type.float
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.record
                                        [ ( "min", Type.float )
                                        , ( "max", Type.float )
                                        , ( "required", Type.unit )
                                        , ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ floatArg ]
    , select =
        \selectArg selectArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "select"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.tuple Type.string (Type.var "option"))
                                , Type.function
                                    [ Type.string ]
                                    (Type.var "error")
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.maybe (Type.var "option")
                                    , Type.var "input"
                                    , Type.var "option"
                                    , Type.namedWith
                                        [ "Internal", "Input" ]
                                        "Options"
                                        [ Type.var "option" ]
                                    , Type.record
                                        [ ( "required", Type.unit )
                                        , ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ selectArg, selectArg0 ]
    , date =
        \dateArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "date"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "invalid"
                                      , Type.function
                                            [ Type.string ]
                                            (Type.var "error")
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.maybe
                                        (Type.namedWith [ "Date" ] "Date" [])
                                    , Type.var "input"
                                    , Type.namedWith [ "Date" ] "Date" []
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.record
                                        [ ( "min"
                                          , Type.namedWith [ "Date" ] "Date" []
                                          )
                                        , ( "max"
                                          , Type.namedWith [ "Date" ] "Date" []
                                          )
                                        , ( "required", Type.unit )
                                        , ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        , ( "step", Type.int )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ dateArg ]
    , time =
        \timeArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "time"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "invalid"
                                      , Type.function
                                            [ Type.string ]
                                            (Type.var "error")
                                      )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.maybe
                                        (Type.namedWith
                                            [ "Form", "Field" ]
                                            "TimeOfDay"
                                            []
                                        )
                                    , Type.var "input"
                                    , Type.namedWith
                                        [ "Form", "Field" ]
                                        "TimeOfDay"
                                        []
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.record
                                        [ ( "min"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "TimeOfDay"
                                                []
                                          )
                                        , ( "max"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "TimeOfDay"
                                                []
                                          )
                                        , ( "required", Type.unit )
                                        , ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        , ( "step", Type.int )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ timeArg ]
    , withInitialValue =
        \withInitialValueArg withInitialValueArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "withInitialValue"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "input" ]
                                    (Type.var "initial")
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "value"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "value"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withInitialValueArg, withInitialValueArg0 ]
    , withOptionalInitialValue =
        \withOptionalInitialValueArg withOptionalInitialValueArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "withOptionalInitialValue"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "input" ]
                                    (Type.maybe (Type.var "initial"))
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "value"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "value"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withOptionalInitialValueArg, withOptionalInitialValueArg0 ]
    , exactValue =
        \exactValueArg exactValueArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "exactValue"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string, Type.var "error" ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.string
                                    , Type.var "input"
                                    , Type.namedWith [ "Basics" ] "Never" []
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.record
                                        [ ( "required", Type.unit )
                                        , ( "plainText", Type.unit )
                                        , ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ exactValueArg, exactValueArg0 ]
    , required =
        \requiredArg requiredArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "required"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "error"
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.maybe (Type.var "parsed")
                                    , Type.var "kind"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "required", Type.unit )
                                        , ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ requiredArg, requiredArg0 ]
    , validateMap =
        \validateMapArg validateMapArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "validateMap"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "parsed" ]
                                    (Type.namedWith
                                        [ "Result" ]
                                        "Result"
                                        [ Type.var "error", Type.var "mapped" ]
                                    )
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "mapped"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "Yes"
                                                []
                                          )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ validateMapArg, validateMapArg0 ]
    , map =
        \mapArg mapArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "map"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "parsed" ]
                                    (Type.var "mapped")
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "mapped"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "Yes"
                                                []
                                          )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ mapArg, mapArg0 ]
    , email =
        \emailArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "email"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.extensible
                                        "constraints"
                                        [ ( "plainText", Type.unit ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ emailArg ]
    , password =
        \passwordArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "password"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.extensible
                                        "constraints"
                                        [ ( "plainText", Type.unit ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ passwordArg ]
    , search =
        \searchArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "search"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.extensible
                                        "constraints"
                                        [ ( "plainText", Type.unit ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ searchArg ]
    , telephone =
        \telephoneArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "telephone"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.extensible
                                        "constraints"
                                        [ ( "plainText", Type.unit ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ telephoneArg ]
    , url =
        \urlArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "url"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.extensible
                                        "constraints"
                                        [ ( "plainText", Type.unit ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ urlArg ]
    , textarea =
        \textareaArg textareaArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "textarea"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "rows", Type.maybe Type.int )
                                    , ( "cols", Type.maybe Type.int )
                                    ]
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.extensible
                                        "constraints"
                                        [ ( "plainText", Type.unit ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ textareaArg, textareaArg0 ]
    , range =
        \rangeArg rangeArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "range"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "min", Type.var "numberInitial" )
                                    , ( "max", Type.var "numberInitial" )
                                    , ( "missing", Type.var "error" )
                                    , ( "invalid"
                                      , Type.function
                                            [ Type.namedWith
                                                [ "Form", "Field" ]
                                                "OutsideRange"
                                                []
                                            ]
                                            (Type.var "error")
                                      )
                                    ]
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.maybe (Type.var "valueType")
                                    , Type.var "input"
                                    , Type.var "numberInitial"
                                    , Type.var "kind"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "required", Type.unit )
                                        , ( "min", Type.var "numberInitial" )
                                        , ( "max", Type.var "numberInitial" )
                                        , ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "valueType"
                                    , Type.var "input"
                                    , Type.var "numberInitial"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    , Type.extensible
                                        "constraints"
                                        [ ( "wasMapped"
                                          , Type.namedWith
                                                [ "Form", "Field" ]
                                                "No"
                                                []
                                          )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ rangeArg, rangeArg0 ]
    , withMin =
        \withMinArg withMinArg0 withMinArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "withMin"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "initial"
                                , Type.var "error"
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "min", Type.var "initial" ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withMinArg, withMinArg0, withMinArg1 ]
    , withMax =
        \withMaxArg withMaxArg0 withMaxArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "withMax"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "initial"
                                , Type.var "error"
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "max", Type.var "initial" ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withMaxArg, withMaxArg0, withMaxArg1 ]
    , withMinLength =
        \withMinLengthArg withMinLengthArg0 withMinLengthArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "withMinLength"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.int
                                , Type.var "error"
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "minlength", Type.unit ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withMinLengthArg, withMinLengthArg0, withMinLengthArg1 ]
    , withMaxLength =
        \withMaxLengthArg withMaxLengthArg0 withMaxLengthArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "withMaxLength"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.int
                                , Type.var "error"
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "maxlength", Type.unit ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "kind"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withMaxLengthArg, withMaxLengthArg0, withMaxLengthArg1 ]
    , withStep =
        \withStepArg withStepArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "Field" ]
                    , name = "withStep"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.int
                                , Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "value"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "view"
                                    , Type.extensible
                                        "constraints"
                                        [ ( "step", Type.int ) ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "value"
                                    , Type.var "input"
                                    , Type.var "initial"
                                    , Type.var "view"
                                    , Type.var "constraints"
                                    ]
                                )
                            )
                    }
                )
                [ withStepArg, withStepArg0 ]
    }


values_ :
    { text : Elm.Expression
    , checkbox : Elm.Expression
    , int : Elm.Expression
    , float : Elm.Expression
    , select : Elm.Expression
    , date : Elm.Expression
    , time : Elm.Expression
    , withInitialValue : Elm.Expression
    , withOptionalInitialValue : Elm.Expression
    , exactValue : Elm.Expression
    , required : Elm.Expression
    , validateMap : Elm.Expression
    , map : Elm.Expression
    , email : Elm.Expression
    , password : Elm.Expression
    , search : Elm.Expression
    , telephone : Elm.Expression
    , url : Elm.Expression
    , textarea : Elm.Expression
    , range : Elm.Expression
    , withMin : Elm.Expression
    , withMax : Elm.Expression
    , withMinLength : Elm.Expression
    , withMaxLength : Elm.Expression
    , withStep : Elm.Expression
    }
values_ =
    { text =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "text"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Form", "Field" ]
                        "Field"
                        [ Type.var "error"
                        , Type.maybe Type.string
                        , Type.var "input"
                        , Type.string
                        , Type.namedWith [ "Form", "FieldView" ] "Input" []
                        , Type.record
                            [ ( "required", Type.unit )
                            , ( "plainText", Type.unit )
                            , ( "wasMapped"
                              , Type.namedWith [ "Form", "Field" ] "No" []
                              )
                            , ( "minlength", Type.unit )
                            , ( "maxlength", Type.unit )
                            ]
                        ]
                    )
            }
    , checkbox =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "checkbox"
            , annotation =
                Just
                    (Type.namedWith
                        [ "Form", "Field" ]
                        "Field"
                        [ Type.var "error"
                        , Type.bool
                        , Type.var "input"
                        , Type.bool
                        , Type.namedWith [ "Form", "FieldView" ] "Input" []
                        , Type.record [ ( "required", Type.unit ) ]
                        ]
                    )
            }
    , int =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "int"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "invalid"
                              , Type.function [ Type.string ] (Type.var "error")
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe Type.int
                            , Type.var "input"
                            , Type.int
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "min", Type.int )
                                , ( "max", Type.int )
                                , ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                , ( "step", Type.int )
                                ]
                            ]
                        )
                    )
            }
    , float =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "float"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "invalid"
                              , Type.function [ Type.string ] (Type.var "error")
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe Type.float
                            , Type.var "input"
                            , Type.float
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "min", Type.float )
                                , ( "max", Type.float )
                                , ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
    , select =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "select"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.tuple Type.string (Type.var "option"))
                        , Type.function [ Type.string ] (Type.var "error")
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe (Type.var "option")
                            , Type.var "input"
                            , Type.var "option"
                            , Type.namedWith
                                [ "Internal", "Input" ]
                                "Options"
                                [ Type.var "option" ]
                            , Type.record
                                [ ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
    , date =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "date"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "invalid"
                              , Type.function [ Type.string ] (Type.var "error")
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe (Type.namedWith [ "Date" ] "Date" [])
                            , Type.var "input"
                            , Type.namedWith [ "Date" ] "Date" []
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "min", Type.namedWith [ "Date" ] "Date" [] )
                                , ( "max", Type.namedWith [ "Date" ] "Date" [] )
                                , ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                , ( "step", Type.int )
                                ]
                            ]
                        )
                    )
            }
    , time =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "time"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "invalid"
                              , Type.function [ Type.string ] (Type.var "error")
                              )
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe
                                (Type.namedWith
                                    [ "Form", "Field" ]
                                    "TimeOfDay"
                                    []
                                )
                            , Type.var "input"
                            , Type.namedWith [ "Form", "Field" ] "TimeOfDay" []
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "min"
                                  , Type.namedWith
                                        [ "Form", "Field" ]
                                        "TimeOfDay"
                                        []
                                  )
                                , ( "max"
                                  , Type.namedWith
                                        [ "Form", "Field" ]
                                        "TimeOfDay"
                                        []
                                  )
                                , ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                , ( "step", Type.int )
                                ]
                            ]
                        )
                    )
            }
    , withInitialValue =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withInitialValue"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "input" ]
                            (Type.var "initial")
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , withOptionalInitialValue =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withOptionalInitialValue"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "input" ]
                            (Type.maybe (Type.var "initial"))
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , exactValue =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "exactValue"
            , annotation =
                Just
                    (Type.function
                        [ Type.string, Type.var "error" ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.string
                            , Type.var "input"
                            , Type.namedWith [ "Basics" ] "Never" []
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.record
                                [ ( "required", Type.unit )
                                , ( "plainText", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
    , required =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "required"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe (Type.var "parsed")
                            , Type.var "kind"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.extensible
                                "constraints"
                                [ ( "required", Type.unit )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.extensible
                                "constraints"
                                [ ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
    , validateMap =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "validateMap"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "error", Type.var "mapped" ]
                            )
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "mapped"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "Yes" []
                                  )
                                ]
                            ]
                        )
                    )
            }
    , map =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "parsed" ]
                            (Type.var "mapped")
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "mapped"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "Yes" []
                                  )
                                ]
                            ]
                        )
                    )
            }
    , email =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "email"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , password =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "password"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , search =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "search"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , telephone =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "telephone"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , url =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "url"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , textarea =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "textarea"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "rows", Type.maybe Type.int )
                            , ( "cols", Type.maybe Type.int )
                            ]
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "plainText", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , range =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "range"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "min", Type.var "numberInitial" )
                            , ( "max", Type.var "numberInitial" )
                            , ( "missing", Type.var "error" )
                            , ( "invalid"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Form", "Field" ]
                                        "OutsideRange"
                                        []
                                    ]
                                    (Type.var "error")
                              )
                            ]
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.maybe (Type.var "valueType")
                            , Type.var "input"
                            , Type.var "numberInitial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "required", Type.unit )
                                , ( "min", Type.var "numberInitial" )
                                , ( "max", Type.var "numberInitial" )
                                , ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "valueType"
                            , Type.var "input"
                            , Type.var "numberInitial"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            , Type.extensible
                                "constraints"
                                [ ( "wasMapped"
                                  , Type.namedWith [ "Form", "Field" ] "No" []
                                  )
                                ]
                            ]
                        )
                    )
            }
    , withMin =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withMin"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "initial"
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "min", Type.var "initial" ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , withMax =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withMax"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "initial"
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "max", Type.var "initial" ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , withMinLength =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withMinLength"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "minlength", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , withMaxLength =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withMaxLength"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.extensible
                                "constraints"
                                [ ( "maxlength", Type.unit ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "kind"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    , withStep =
        Elm.value
            { importFrom = [ "Form", "Field" ]
            , name = "withStep"
            , annotation =
                Just
                    (Type.function
                        [ Type.int
                        , Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "view"
                            , Type.extensible
                                "constraints"
                                [ ( "step", Type.int ) ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Form", "Field" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "value"
                            , Type.var "input"
                            , Type.var "initial"
                            , Type.var "view"
                            , Type.var "constraints"
                            ]
                        )
                    )
            }
    }


