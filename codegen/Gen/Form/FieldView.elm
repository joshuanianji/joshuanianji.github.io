module Gen.Form.FieldView exposing (annotation_, call_, input, inputStyled, moduleName_, radio, radioStyled, select, selectStyled, valueButton, valueButtonStyled, values_)

{-| 
@docs values_, call_, annotation_, valueButtonStyled, inputStyled, selectStyled, radioStyled, valueButton, select, radio, input, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Form", "FieldView" ]


{-| Renders the [`Field`](Form-Field#Field) to [`Html`](https://package.elm-lang.org/packages/elm/html/latest/Html).

These Fields are defined using [`Form.Field`](Form-Field) using functions like [`Form.Field.text`](Form-Field#text),
[`Form.Field.textarea`](Form-Field#textarea), [`Form.Field.int`](Form-Field#int), and [`Form.Field.date`](Form-Field#date).

This will render a form field HTML element with all of the appropriate attributes.

Often it's convenient to create a helper function that adds labels and renders the field's error messages with any
styles and layout conventions in your application.

    fieldView :
        Form.Context String input
        -> String
        -> Validation.Field String parsed FieldView.Input
        -> Html msg
    fieldView context label field =
        Html.div []
            [ Html.label []
                [ Html.text (label ++ " ")
                , FieldView.input [] field
                , errorsView context field
                ]
            ]

    errorsView :
        Form.Context String input
        -> Validation.Field String parsed kind
        -> Html msg
    errorsView { submitAttempted, errors } field =
        if submitAttempted || Validation.statusAtLeast Validation.Blurred field then
            errors
                |> Form.errorsForField field
                |> List.map (\error -> Html.li [ Html.Attributes.style "color" "red" ] [ Html.text error ])
                |> Html.ul []

        else
            Html.ul [] []

input: 
    List (Html.Attribute msg)
    -> Form.Validation.Field error parsed Form.FieldView.Input
    -> Html.Html msg
-}
input : List Elm.Expression -> Elm.Expression -> Elm.Expression
input inputArg inputArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "input"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list inputArg, inputArg0 ]


{-| Render an [`Options`](#Options) [`Field`](Form-Validation#Field) as a set of [`radio`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input/radio) elements.

Radio buttons are highly customizable. Even more so than dropdowns (`<select>` elements) because you can render HTML for each entry rather than just text.

To render using this `radio` function, you pass in

  - list of HTML attributes to add to the top-level `<fieldset>` that is rendered around the radio inputs.
  - A function that gives you the option render, and a function to render the radio element itself given a list of HTML attributes.
  - The `Options` Field to render the radio buttons for

Example:

    import Form.FieldView as FieldView
    import Html

    type Size
        = Small
        | Medium
        | Large

    dropdownView field =
        Html.div []
            [ FieldView.radio []
                (\size toRadio ->
                    Html.div []
                        [ Html.label []
                            [ Html.text (sizeToString size)
                            , toRadio []
                            ]
                        ]
                )
                field
            ]

    sizeToString : Size -> String
    sizeToString size =
        case size of
            Small ->
                "Small"

            Medium ->
                "Medium"

            Large ->
                "Large"

radio: 
    List (Html.Attribute msg)
    -> (option -> (List (Html.Attribute msg) -> Html.Html msg) -> Html.Html msg)
    -> Form.Validation.Field error parsed2 (Form.FieldView.Options option)
    -> Html.Html msg
-}
radio radioArg radioArg0 radioArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "radio"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.function
                            [ Type.var "option"
                            , Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.namedWith
                                [ "Form", "FieldView" ]
                                "Options"
                                [ Type.var "option" ]
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list radioArg
        , Elm.functionReduced
            "radioUnpack"
            (\functionReducedUnpack ->
                Elm.functionReduced "unpack" (radioArg0 functionReducedUnpack)
            )
        , radioArg1
        ]


{-| Render an [`Options`](#Options) field as a [`select`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/select) element.

    import Form.FieldView as FieldView

    type Size
        = Small
        | Medium
        | Large

    dropdownView field =
        FieldView.select []
            (\size ->
                ( -- we can optionally add HTML attributes here
                  []
                , sizeToString size
                )
            )
            field

    sizeToString : Size -> String
    sizeToString size =
        case size of
            Small ->
                "Small"

            Medium ->
                "Medium"

            Large ->
                "Large"

select: 
    List (Html.Attribute msg)
    -> (parsed -> ( List (Html.Attribute msg), String ))
    -> Form.Validation.Field error parsed2 (Form.FieldView.Options parsed)
    -> Html.Html msg
-}
select :
    List Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
select selectArg selectArg0 selectArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "select"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.function
                            [ Type.var "parsed" ]
                            (Type.tuple
                                (Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                )
                                Type.string
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.namedWith
                                [ "Form", "FieldView" ]
                                "Options"
                                [ Type.var "parsed" ]
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list selectArg
        , Elm.functionReduced "selectUnpack" selectArg0
        , selectArg1
        ]


{-| Gives you a submit button that will submit the form with a specific value for the given Field.

valueButton: 
    String
    -> List (Html.Attribute msg)
    -> List (Html.Html msg)
    -> Form.Validation.Field error parsed kind
    -> Html.Html msg
-}
valueButton :
    String
    -> List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
valueButton valueButtonArg valueButtonArg0 valueButtonArg1 valueButtonArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "valueButton"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string valueButtonArg
        , Elm.list valueButtonArg0
        , Elm.list valueButtonArg1
        , valueButtonArg2
        ]


{-| Same as [`radio`](#radio), but renders to [`Html.Styled`](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Html-Styled).

radioStyled: 
    List (Html.Styled.Attribute msg)
    -> (parsed
    -> (List (Html.Styled.Attribute msg) -> Html.Styled.Html msg)
    -> Html.Styled.Html msg)
    -> Form.Validation.Field error parsed2 (Form.FieldView.Options parsed)
    -> Html.Styled.Html msg
-}
radioStyled radioStyledArg radioStyledArg0 radioStyledArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "radioStyled"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.function
                            [ Type.var "parsed"
                            , Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                ]
                                (Type.namedWith
                                    [ "Html", "Styled" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            ]
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Html"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.namedWith
                                [ "Form", "FieldView" ]
                                "Options"
                                [ Type.var "parsed" ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
        )
        [ Elm.list radioStyledArg
        , Elm.functionReduced
            "radioStyledUnpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (radioStyledArg0 functionReducedUnpack)
            )
        , radioStyledArg1
        ]


{-| Same as [`select`](#select), but renders to [`Html.Styled`](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Html-Styled).

selectStyled: 
    List (Html.Styled.Attribute msg)
    -> (parsed -> ( List (Html.Styled.Attribute msg), String ))
    -> Form.Validation.Field error parsed2 (Form.FieldView.Options parsed)
    -> Html.Styled.Html msg
-}
selectStyled :
    List Elm.Expression
    -> (Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
selectStyled selectStyledArg selectStyledArg0 selectStyledArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "selectStyled"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.function
                            [ Type.var "parsed" ]
                            (Type.tuple
                                (Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                )
                                Type.string
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.namedWith
                                [ "Form", "FieldView" ]
                                "Options"
                                [ Type.var "parsed" ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
        )
        [ Elm.list selectStyledArg
        , Elm.functionReduced "selectStyledUnpack" selectStyledArg0
        , selectStyledArg1
        ]


{-| Same as [`input`](#input), but renders to [`Html.Styled`](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest/Html-Styled).

inputStyled: 
    List (Html.Styled.Attribute msg)
    -> Form.Validation.Field error parsed Form.FieldView.Input
    -> Html.Styled.Html msg
-}
inputStyled : List Elm.Expression -> Elm.Expression -> Elm.Expression
inputStyled inputStyledArg inputStyledArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "inputStyled"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
        )
        [ Elm.list inputStyledArg, inputStyledArg0 ]


{-| Gives you a submit button that will submit the form with a specific value for the given Field.

valueButtonStyled: 
    String
    -> List (Html.Styled.Attribute msg)
    -> List (Html.Styled.Html msg)
    -> Form.Validation.Field error parsed kind
    -> Html.Styled.Html msg
-}
valueButtonStyled :
    String
    -> List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
valueButtonStyled valueButtonStyledArg valueButtonStyledArg0 valueButtonStyledArg1 valueButtonStyledArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "valueButtonStyled"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Html"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
        )
        [ Elm.string valueButtonStyledArg
        , Elm.list valueButtonStyledArg0
        , Elm.list valueButtonStyledArg1
        , valueButtonStyledArg2
        ]


annotation_ :
    { input : Type.Annotation
    , options : Type.Annotation -> Type.Annotation
    , hidden : Type.Annotation
    }
annotation_ =
    { input =
        Type.alias
            moduleName_
            "Input"
            []
            (Type.namedWith [ "Internal", "Input" ] "Input" [])
    , options =
        \optionsArg0 ->
            Type.alias
                moduleName_
                "Options"
                [ optionsArg0 ]
                (Type.namedWith
                    [ "Internal", "Input" ]
                    "Options"
                    [ Type.var "a" ]
                )
    , hidden =
        Type.alias
            moduleName_
            "Hidden"
            []
            (Type.namedWith [ "Internal", "Input" ] "Hidden" [])
    }


call_ :
    { input : Elm.Expression -> Elm.Expression -> Elm.Expression
    , radio :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , select :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , valueButton :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , radioStyled :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , selectStyled :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , inputStyled : Elm.Expression -> Elm.Expression -> Elm.Expression
    , valueButtonStyled :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    }
call_ =
    { input =
        \inputArg inputArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "FieldView" ]
                    , name = "input"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ inputArg, inputArg0 ]
    , radio =
        \radioArg radioArg0 radioArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "FieldView" ]
                    , name = "radio"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.function
                                    [ Type.var "option"
                                    , Type.function
                                        [ Type.list
                                            (Type.namedWith
                                                [ "Html" ]
                                                "Attribute"
                                                [ Type.var "msg" ]
                                            )
                                        ]
                                        (Type.namedWith
                                            [ "Html" ]
                                            "Html"
                                            [ Type.var "msg" ]
                                        )
                                    ]
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed2"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Options"
                                        [ Type.var "option" ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ radioArg, radioArg0, radioArg1 ]
    , select =
        \selectArg selectArg0 selectArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "FieldView" ]
                    , name = "select"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.function
                                    [ Type.var "parsed" ]
                                    (Type.tuple
                                        (Type.list
                                            (Type.namedWith
                                                [ "Html" ]
                                                "Attribute"
                                                [ Type.var "msg" ]
                                            )
                                        )
                                        Type.string
                                    )
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed2"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Options"
                                        [ Type.var "parsed" ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ selectArg, selectArg0, selectArg1 ]
    , valueButton =
        \valueButtonArg valueButtonArg0 valueButtonArg1 valueButtonArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "FieldView" ]
                    , name = "valueButton"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
                                , Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ valueButtonArg
                , valueButtonArg0
                , valueButtonArg1
                , valueButtonArg2
                ]
    , radioStyled =
        \radioStyledArg radioStyledArg0 radioStyledArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "FieldView" ]
                    , name = "radioStyled"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.function
                                    [ Type.var "parsed"
                                    , Type.function
                                        [ Type.list
                                            (Type.namedWith
                                                [ "Html", "Styled" ]
                                                "Attribute"
                                                [ Type.var "msg" ]
                                            )
                                        ]
                                        (Type.namedWith
                                            [ "Html", "Styled" ]
                                            "Html"
                                            [ Type.var "msg" ]
                                        )
                                    ]
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed2"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Options"
                                        [ Type.var "parsed" ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html", "Styled" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ radioStyledArg, radioStyledArg0, radioStyledArg1 ]
    , selectStyled =
        \selectStyledArg selectStyledArg0 selectStyledArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "FieldView" ]
                    , name = "selectStyled"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.function
                                    [ Type.var "parsed" ]
                                    (Type.tuple
                                        (Type.list
                                            (Type.namedWith
                                                [ "Html", "Styled" ]
                                                "Attribute"
                                                [ Type.var "msg" ]
                                            )
                                        )
                                        Type.string
                                    )
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed2"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Options"
                                        [ Type.var "parsed" ]
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html", "Styled" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ selectStyledArg, selectStyledArg0, selectStyledArg1 ]
    , inputStyled =
        \inputStyledArg inputStyledArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "FieldView" ]
                    , name = "inputStyled"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Input"
                                        []
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html", "Styled" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ inputStyledArg, inputStyledArg0 ]
    , valueButtonStyled =
        \valueButtonStyledArg valueButtonStyledArg0 valueButtonStyledArg1 valueButtonStyledArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form", "FieldView" ]
                    , name = "valueButtonStyled"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
                                , Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                , Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html", "Styled" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            )
                    }
                )
                [ valueButtonStyledArg
                , valueButtonStyledArg0
                , valueButtonStyledArg1
                , valueButtonStyledArg2
                ]
    }


values_ :
    { input : Elm.Expression
    , radio : Elm.Expression
    , select : Elm.Expression
    , valueButton : Elm.Expression
    , radioStyled : Elm.Expression
    , selectStyled : Elm.Expression
    , inputStyled : Elm.Expression
    , valueButtonStyled : Elm.Expression
    }
values_ =
    { input =
        Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "input"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , radio =
        Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "radio"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.function
                            [ Type.var "option"
                            , Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            ]
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.namedWith
                                [ "Form", "FieldView" ]
                                "Options"
                                [ Type.var "option" ]
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , select =
        Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "select"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.function
                            [ Type.var "parsed" ]
                            (Type.tuple
                                (Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                )
                                Type.string
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.namedWith
                                [ "Form", "FieldView" ]
                                "Options"
                                [ Type.var "parsed" ]
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , valueButton =
        Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "valueButton"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.list
                            (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        (Type.namedWith [ "Html" ] "Html" [ Type.var "msg" ])
                    )
            }
    , radioStyled =
        Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "radioStyled"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.function
                            [ Type.var "parsed"
                            , Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                ]
                                (Type.namedWith
                                    [ "Html", "Styled" ]
                                    "Html"
                                    [ Type.var "msg" ]
                                )
                            ]
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Html"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.namedWith
                                [ "Form", "FieldView" ]
                                "Options"
                                [ Type.var "parsed" ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
    , selectStyled =
        Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "selectStyled"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.function
                            [ Type.var "parsed" ]
                            (Type.tuple
                                (Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                )
                                Type.string
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed2"
                            , Type.namedWith
                                [ "Form", "FieldView" ]
                                "Options"
                                [ Type.var "parsed" ]
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
    , inputStyled =
        Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "inputStyled"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.namedWith [ "Form", "FieldView" ] "Input" []
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
    , valueButtonStyled =
        Elm.value
            { importFrom = [ "Form", "FieldView" ]
            , name = "valueButtonStyled"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "msg" ]
                            )
                        , Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Html"
                                [ Type.var "msg" ]
                            )
                        , Type.namedWith
                            [ "Form", "Validation" ]
                            "Field"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "kind"
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "msg" ]
                        )
                    )
            }
    }


