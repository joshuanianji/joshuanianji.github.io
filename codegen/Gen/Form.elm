module Gen.Form exposing (annotation_, call_, caseOf_, dynamic, errorsForField, field, form, hiddenField, hiddenKind, init, make_, mapMsg, methodToString, moduleName_, options, parse, renderHtml, renderStyledHtml, toResult, update, values_, withAction, withGetMethod, withInput, withOnSubmit, withServerResponse)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, toResult, mapMsg, update, init, dynamic, hiddenKind, hiddenField, parse, methodToString, withGetMethod, withServerResponse, withOnSubmit, withAction, withInput, options, renderStyledHtml, renderHtml, errorsForField, field, form, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Form" ]


{-| Initialize the builder for a `Form`. Typically an anonymous function is passed in to this function, with one
parameter for each field that comes after.

    form =
        Form.form
            (\name email ->
                { combine =
                    Validation.succeed User
                        |> Validation.andMap name
                        |> Validation.andMap email
                , view = \info -> [{- render fields -}]
                }
            )
            |> Form.field "name" (Field.text |> Field.required "Required")
            |> Form.field "email" (Field.text |> Field.required "Required")

form: combineAndView -> Form.Form error combineAndView parsed input
-}
form : Elm.Expression -> Elm.Expression
form formArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "form"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "combineAndView" ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        )
                    )
            }
        )
        [ formArg ]


{-| Declare a visible field for the form.

Use [`Form.Field`](Form-Field) to define the field and its validations.

    form =
        Form.form
            (\email ->
                { combine =
                    Validation.succeed SignupForm
                        |> Validation.andMap email
                , view = \info -> [{- render fields -}]
                }
            )
            |> Form.field "email"
                (Field.text |> Field.required "Required")

field: 
    String
    -> Form.Field.Field error parsed input initial kind constraints
    -> Form.Form error (Form.Validation.Field error parsed kind
    -> combineAndView) parsedCombined input
    -> Form.Form error combineAndView parsedCombined input
-}
field : String -> Elm.Expression -> Elm.Expression -> Elm.Expression
field fieldArg fieldArg0 fieldArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "field"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
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
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    ]
                                ]
                                (Type.var "combineAndView")
                            , Type.var "parsedCombined"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsedCombined"
                            , Type.var "input"
                            ]
                        )
                    )
            }
        )
        [ Elm.string fieldArg, fieldArg0, fieldArg1 ]


{-| Get the List of errors for a given field.

Often it's helpful to define a helper function for rendering a fields errors using your application's layout and style
conventions.

    import Form
    import Form.Validation as Validation
    import Html exposing (Html)

    errorsView :
        Form.Context String input
        -> Validation.Field String parsed kind
        -> Html msg
    errorsView { submitAttempted, errors } field =
        if submitAttempted || Validation.statusAtLeast Validation.Blurred field then
            -- only show validations when a field has been blurred
            -- (it can be annoying to see errors while you type the initial entry for a field, but we want to see the current
            -- errors once we've left the field, even if we are changing it so we know once it's been fixed or whether a new
            -- error is introduced)
            errors
                |> Form.errorsForField field
                |> List.map
                    (\error ->
                        Html.li
                            [ Html.Attributes.style "color" "red" ]
                            [ Html.text error ]
                    )
                |> Html.ul []

        else
            Html.ul [] []

errorsForField: Form.Validation.Field error parsed kind -> Form.Errors error -> List error
-}
errorsForField : Elm.Expression -> Elm.Expression -> Elm.Expression
errorsForField errorsForFieldArg errorsForFieldArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "errorsForField"
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
                        , Type.namedWith
                            [ "Form" ]
                            "Errors"
                            [ Type.var "error" ]
                        ]
                        (Type.list (Type.var "error"))
                    )
            }
        )
        [ errorsForFieldArg, errorsForFieldArg0 ]


{-| Render the form to `elm/html`.

    view model =
        signUpForm
            |> Form.renderHtml
                { submitting = model.submitting
                , state = model.formState
                , toMsg = FormMsg
                }
                (Form.options "signUpForm")
                []

Note: In `elm-pages`, you'll want to use the `Pages.Form.renderHtml` function instead.

renderHtml: 
    { submitting : Bool
    , state : Form.Model
    , toMsg : Form.Msg mappedMsg -> mappedMsg
    }
    -> Form.Options error parsed input mappedMsg extras
    -> List (Html.Attribute mappedMsg)
    -> Form.Form error { combine :
        Pages.Internal.Form.Validation error parsed named constraints
    , view : Form.Context error input -> List (Html.Html mappedMsg)
    } parsed input
    -> Html.Html mappedMsg
-}
renderHtml :
    { submitting : Bool
    , state : Elm.Expression
    , toMsg : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
renderHtml renderHtmlArg renderHtmlArg0 renderHtmlArg1 renderHtmlArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "renderHtml"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "submitting", Type.bool )
                            , ( "state", Type.namedWith [ "Form" ] "Model" [] )
                            , ( "toMsg"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Form" ]
                                        "Msg"
                                        [ Type.var "mappedMsg" ]
                                    ]
                                    (Type.var "mappedMsg")
                              )
                            ]
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "mappedMsg"
                            , Type.var "extras"
                            ]
                        , Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "mappedMsg" ]
                            )
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.record
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Pages", "Internal", "Form" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "named"
                                        , Type.var "constraints"
                                        ]
                                  )
                                , ( "view"
                                  , Type.function
                                        [ Type.namedWith
                                            [ "Form" ]
                                            "Context"
                                            [ Type.var "error"
                                            , Type.var "input"
                                            ]
                                        ]
                                        (Type.list
                                            (Type.namedWith
                                                [ "Html" ]
                                                "Html"
                                                [ Type.var "mappedMsg" ]
                                            )
                                        )
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Html" ]
                            "Html"
                            [ Type.var "mappedMsg" ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair "submitting" (Elm.bool renderHtmlArg.submitting)
            , Tuple.pair "state" renderHtmlArg.state
            , Tuple.pair
                "toMsg"
                (Elm.functionReduced "renderHtmlUnpack" renderHtmlArg.toMsg)
            ]
        , renderHtmlArg0
        , Elm.list renderHtmlArg1
        , renderHtmlArg2
        ]


{-| Render the form to [`rtfeldman/elm-css`](https://package.elm-lang.org/packages/rtfeldman/elm-css/latest/).

    view model =
        signUpForm
            |> Form.renderStyledHtml
                { submitting = model.submitting
                , state = model.formState
                , toMsg = FormMsg
                }
                (Form.options "signUpForm")
                []

Note: In `elm-pages`, you'll want to use the `Pages.Form.renderStyledHtml` function instead.

renderStyledHtml: 
    { submitting : Bool
    , state : Form.Model
    , toMsg : Form.Msg mappedMsg -> mappedMsg
    }
    -> Form.Options error parsed input mappedMsg extras
    -> List (Html.Styled.Attribute mappedMsg)
    -> Form.Form error { combine :
        Pages.Internal.Form.Validation error parsed field constraints
    , view : Form.Context error input -> List (Html.Styled.Html mappedMsg)
    } parsed input
    -> Html.Styled.Html mappedMsg
-}
renderStyledHtml :
    { submitting : Bool
    , state : Elm.Expression
    , toMsg : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
renderStyledHtml renderStyledHtmlArg renderStyledHtmlArg0 renderStyledHtmlArg1 renderStyledHtmlArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "renderStyledHtml"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "submitting", Type.bool )
                            , ( "state", Type.namedWith [ "Form" ] "Model" [] )
                            , ( "toMsg"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Form" ]
                                        "Msg"
                                        [ Type.var "mappedMsg" ]
                                    ]
                                    (Type.var "mappedMsg")
                              )
                            ]
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "mappedMsg"
                            , Type.var "extras"
                            ]
                        , Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "mappedMsg" ]
                            )
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.record
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Pages", "Internal", "Form" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "field"
                                        , Type.var "constraints"
                                        ]
                                  )
                                , ( "view"
                                  , Type.function
                                        [ Type.namedWith
                                            [ "Form" ]
                                            "Context"
                                            [ Type.var "error"
                                            , Type.var "input"
                                            ]
                                        ]
                                        (Type.list
                                            (Type.namedWith
                                                [ "Html", "Styled" ]
                                                "Html"
                                                [ Type.var "mappedMsg" ]
                                            )
                                        )
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "mappedMsg" ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair "submitting" (Elm.bool renderStyledHtmlArg.submitting)
            , Tuple.pair "state" renderStyledHtmlArg.state
            , Tuple.pair
                "toMsg"
                (Elm.functionReduced
                    "renderStyledHtmlUnpack"
                    renderStyledHtmlArg.toMsg
                )
            ]
        , renderStyledHtmlArg0
        , Elm.list renderStyledHtmlArg1
        , renderStyledHtmlArg2
        ]


{-| Initialize a set of default options with a unique `id` for your Form. Note that even if you are rendering the same form
multiple times this ID needs to be unique in order to manage the state of each form independently.

For example,

    cartView model items =
        items
            |> List.map
                (\item ->
                    itemForm
                        |> Form.renderHtml
                            { submitting = model.submitting
                            , state = model.formState
                            , toMsg = FormMsg
                            }
                            (Form.options ("cart-item-" ++ item.id))
                            []
                )
            |> Html.div []

options: String -> Form.Options error parsed () msg extras
-}
options : String -> Elm.Expression
options optionsArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "options"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.unit
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
        )
        [ Elm.string optionsArg ]


{-| You can pass in an `input` value to the `Options` that are passed in to [`renderHtml`](#renderHtml) or [`renderStyledHtml`](#renderStyledHtml).

You can use whichever data type you want as your `input` value. You will then have access to that value in two places:

1.  The Form's `view` through the [`Context`](#Context) argument's `input` field.
2.  [`Form.Field.withInitialValue`](Form-Field#withInitialValue)

One example where you would use an `input` value is if you have an existing UserProfile from the server that you want to use to pre-populate the form fields.

    import Form
    import Form.Field as Field
    import Form.Validation as Validation

    type alias UserProfile =
        { name : String
        , email : String
        }

    userProfileForm : Form.HtmlForm String UserProfile UserProfile msg
    userProfileForm =
        (\name email ->
            { combine =
                Validation.succeed UserProfile
                    |> Validation.andMap name
                    |> Validation.andMap email
            , view =
                \context ->
                    [ Html.h2
                        []
                        [ Html.text
                            --  use the input to display Model data
                            (context.input
                                ++ "'s Profile"
                            )
                        ]
                    , fieldView "Name" name
                    , fieldView "Email" email
                    , if context.submitting then
                        Html.button [ Html.Attributes.disabled True ] [ Html.text "Updating..." ]

                      else
                        Html.button [] [ Html.text "Update" ]
                    ]
            }
        )
            |> Form.form
            |> Form.field "name"
                (Field.text
                    |> Field.required "Required"
                    |> Field.withInitialValue .name
                )
            |> Form.field "email"
                (Field.text
                    |> Field.required "Required"
                    |> Field.withInitialValue .email
                )

    view model =
        [ model.userProfile
            |> Maybe.map
                (\userProfile ->
                    userProfileForm
                        |> Form.renderHtml
                            { submitting = model.submitting
                            , state = model.formState
                            , toMsg = FormMsg
                            }
                            (Form.options "userProfile"
                                |> Form.withInput userProfile
                            )
                            []
                )
            |> Maybe.withDefault "Loading Profile..."
        ]

withInput: 
    input
    -> Form.Options error parsed () msg extras
    -> Form.Options error parsed input msg extras
-}
withInput : Elm.Expression -> Elm.Expression -> Elm.Expression
withInput withInputArg withInputArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "withInput"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "input"
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.unit
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
        )
        [ withInputArg, withInputArg0 ]


{-| Set the `action` attribute of the rendered `<form>` element. Note that the `action` attribute in the `withOnSubmit` is preprocessed in the browser, so the String will point to the same URL but
won't necessarily be the exact same String that was passed in. For example, if you set `options |> Form.withAction "/login"`, your onSubmit will receive an absolute URL such as `{ action = "https://mysite.com/login" {- , ... -} }`.

Setting the `action` can be useful if you are progressively enhancing form behavior. The default browser form submission behavior is to submit to the current URL if no `action` attribute is set, and an `action` is present
then the form submission will go to the given URL. If you are attempting to use progressive enhancement then you can simulate this behavior through your `withOnSubmit` handler, or you may be using a framework that has this simulation built in like `elm-pages`.

See also <https://developer.mozilla.org/en-US/docs/Web/HTML/Element/form#action>.

withAction: 
    String
    -> Form.Options error parsed input msg extras
    -> Form.Options error parsed input msg extras
-}
withAction : String -> Elm.Expression -> Elm.Expression
withAction withActionArg withActionArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "withAction"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
        )
        [ Elm.string withActionArg, withActionArg0 ]


{-| You can add an onSubmit handler to the Form's `Options`. If you are using a framework that is integrated with `elm-form` (such as `elm-pages`), then you can
rely on the framework's onSubmit behavior. Otherwise, you will need to do something with the form when there is a valid form submission.

There are a few different approaches you can use.

1.  Progressively enhance the raw FormData submission. Since `withOnSubmit` gives you access to `{ fields : List ( String, String ) {- ... -} }`, you can propagate the raw key-value pairs (`fields`) and send those to your API. If you are doing full-stack Elm with `elm-pages` or Lamdera, then this can be a great fit because you can do code sharing and re-use your `Form` definition on the backend to parse the raw FormData. However, you may not want to use this approach with frontend-only Elm because you may prefer to communicate with your backend using more structured data like JSON rather than FormData (which is just key-value strings).
2.  Parse into your preferred type, then with an on-submit Msg, check if the data is `Valid`, and if it is, use the parsed data to make a request to your API (by JSON-encoding the value, building a GraphQL request, etc.).
3.  In your Form's `combine`, directly parse into a representation of your request, such as a `Json.Encode.Value`, a `Cmd Msg`, a `Task error Msg`, or an intermediary data type that represents an API request.

Let's look at an example of approach (3). In this example, we define a `Request` record alias which represents an API request. Note, there is nothing special about this `Request` type, this is just
an example ot illustrate this general pattern, but consider the best types for your use case when you adapt this example for your app.

    import Form
    import Form.Field as Field
    import Form.Validation as Validation

    type alias Request =
        { path : String
        , body : Encode.Value
        , expect : Http.Expect Msg
        }

    sendRequest : Request -> Cmd Msg
    sendRequest request =
        Http.post
            { url = "https://myservice.com/api" ++ request.path
            , body = Http.jsonBody request.body
            , expect = request.expect
            }

    userProfileForm : Form.HtmlForm String Request input msg
    userProfileForm =
        (\name email ->
            { combine =
                Validation.succeed
                    (\nameValue emailValue ->
                        { path = "/api/user"
                        , body =
                            Encode.object
                                [ ( "name", Encode.string nameValue )
                                , ( "email", Encode.string emailValue )
                                ]
                        }
                    , expect = Http.expectJson GotUpdatedProfile profileDecoder
                    )
                    |> Validation.andMap name
                    |> Validation.andMap email
            , view = \context -> [{- ... view here -}]
            }
        )
            |> Form.form
            |> Form.field "name" (Field.text |> Field.required "Required")
            |> Form.field "email" (Field.text |> Field.required "Required")

withOnSubmit: 
    ({ fields : List ( String, String )
    , method : Form.Method
    , action : String
    , parsed : Form.Validated error parsed
    }
    -> msg)
    -> Form.Options error parsed input oldMsg extras
    -> Form.Options error parsed input msg extras
-}
withOnSubmit :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
withOnSubmit withOnSubmitArg withOnSubmitArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "withOnSubmit"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.record
                                [ ( "fields"
                                  , Type.list
                                        (Type.tuple Type.string Type.string)
                                  )
                                , ( "method"
                                  , Type.namedWith [ "Form" ] "Method" []
                                  )
                                , ( "action", Type.string )
                                , ( "parsed"
                                  , Type.namedWith
                                        [ "Form" ]
                                        "Validated"
                                        [ Type.var "error", Type.var "parsed" ]
                                  )
                                ]
                            ]
                            (Type.var "msg")
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "oldMsg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "withOnSubmitUnpack" withOnSubmitArg
        , withOnSubmitArg0
        ]


{-| You can render your `Form` with an initial set of values and errors that semantically represent a server response.

Conceptually, this is like sending a traditional form submission to a backend. When this happens in a `<form>` with no
JavaScript event handlers, the server responds with a new page load, and that newly rendered page needs to contain any
field errors and persist any field values that were submitted so the user can continue filling out their form.

In an `elm-pages` app, you can submit your forms with JavaScript turned off and see this exact behavior, but you need to
be sure to wire in a `ServerResponse` so that the form state is persisted in the freshly rendered page.

You can also use this `ServerResponse` to send down server-side errors, especially if you are using full-stack Elm.

withServerResponse: 
    Maybe (Form.ServerResponse error)
    -> Form.Options error parsed input msg extras
    -> Form.Options error parsed input msg extras
-}
withServerResponse : Elm.Expression -> Elm.Expression -> Elm.Expression
withServerResponse withServerResponseArg withServerResponseArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "withServerResponse"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe
                            (Type.namedWith
                                [ "Form" ]
                                "ServerResponse"
                                [ Type.var "error" ]
                            )
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
        )
        [ withServerResponseArg, withServerResponseArg0 ]


{-| The default Method from `options` is `Post` since that is the most common. The `Get` Method for form submissions will add the form fields as a query string and navigate to that route using a GET.
You will need to progressively enhance your onSubmit to simulate this browser behavior if you want something similar, or use a framework that has this simulation built in like `elm-pages`.

withGetMethod: 
    Form.Options error parsed input msg extras
    -> Form.Options error parsed input msg extras
-}
withGetMethod : Elm.Expression -> Elm.Expression
withGetMethod withGetMethodArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "withGetMethod"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
        )
        [ withGetMethodArg ]


{-| Turn a `Method` into "GET" or "POST".

methodToString: Form.Method -> String
-}
methodToString : Elm.Expression -> Elm.Expression
methodToString methodToStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "methodToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Form" ] "Method" [] ]
                        Type.string
                    )
            }
        )
        [ methodToStringArg ]


{-| Try parsing the `Form`. Usually not needed directly, usually it's better to use [`Form.Handler`](Form-Handler)
to try parsing one of multiple `Form`s.

parse: 
    String
    -> Form.Model
    -> input
    -> Form.Form error { info
        | combine : Pages.Internal.Form.Validation error parsed named constraints
    } parsed input
    -> Form.Validated error parsed
-}
parse :
    String
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
parse parseArg parseArg0 parseArg1 parseArg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "parse"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.namedWith [ "Form" ] "Model" []
                        , Type.var "input"
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.extensible
                                "info"
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Pages", "Internal", "Form" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "named"
                                        , Type.var "constraints"
                                        ]
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Validated"
                            [ Type.var "error", Type.var "parsed" ]
                        )
                    )
            }
        )
        [ Elm.string parseArg, parseArg0, parseArg1, parseArg2 ]


{-| Declare a hidden field for the form.

Unlike [`field`](#field) declarations which are rendered using [`Form.FieldView`](Form-FieldView)
functions, `hiddenField` inputs are automatically inserted into the form when you render it.

You define the field's validations the same way as for `field`, with the
[`Form.Field`](Form-Field) API.

    form =
        Form.form
            (\quantity productId ->
                { combine = {- combine fields -}
                , view = \info -> [{- render visible fields -}]
                }
            )
            |> Form.field "quantity"
                (Field.int |> Field.required "Required")
            |> Form.field "productId"
                (Field.text
                    |> Field.required "Required"
                    |> Field.withInitialValue (\product -> Form.Value.string product.id)
                )

hiddenField: 
    String
    -> Form.Field.Field error parsed input initial kind constraints
    -> Form.Form error (Form.Validation.Field error parsed Form.FieldView.Hidden
    -> combineAndView) parsedCombined input
    -> Form.Form error combineAndView parsedCombined input
-}
hiddenField : String -> Elm.Expression -> Elm.Expression -> Elm.Expression
hiddenField hiddenFieldArg hiddenFieldArg0 hiddenFieldArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "hiddenField"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
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
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Hidden"
                                        []
                                    ]
                                ]
                                (Type.var "combineAndView")
                            , Type.var "parsedCombined"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsedCombined"
                            , Type.var "input"
                            ]
                        )
                    )
            }
        )
        [ Elm.string hiddenFieldArg, hiddenFieldArg0, hiddenFieldArg1 ]


{-| Like [`hiddenField`](#hiddenField), but uses a hardcoded value. This is useful to ensure that your [`Form.Handler`](Form-Handler)
is parsing the right kind of Form when there is more than one kind of Form on a given page.

    updateProfile : Form.HtmlForm String ( String, String ) input msg
    updateProfile =
        Form.form
            (\first last ->
                { combine =
                    Validation.succeed Tuple.pair
                        |> Validation.andMap first
                        |> Validation.andMap last
                , view = \_ -> []
                }
            )
            |> Form.field "first" (Field.text |> Field.required "Required")
            |> Form.field "last" (Field.text |> Field.required "Required")
            |> Form.hiddenKind ( "kind", "update-profile" ) "Expected kind"

hiddenKind: 
    ( String, String )
    -> error
    -> Form.Form error combineAndView parsed input
    -> Form.Form error combineAndView parsed input
-}
hiddenKind :
    Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
hiddenKind hiddenKindArg hiddenKindArg0 hiddenKindArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "hiddenKind"
            , annotation =
                Just
                    (Type.function
                        [ Type.tuple Type.string Type.string
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        )
                    )
            }
        )
        [ hiddenKindArg, hiddenKindArg0, hiddenKindArg1 ]


{-| Allows you to render a Form that renders a sub-form based on the `decider` value.

For example, here is a `Form` that shows a dropdown to select between a `Post` and a `Link`, and then
renders the `linkForm` or `postForm` based on the dropdown selection.

    import Form.Handler
    import Form.Validation as Validation
    import Form.Field as Field

    type PostAction
        = ParsedLink String
        | ParsedPost { title : String, body : Maybe String }


    type PostKind
        = Link
        | Post

    dependentForm : Form.HtmlForm String PostAction input msg
    dependentForm =
        Form.form
            (\kind postForm_ ->
                { combine =
                    kind
                        |> Validation.andThen postForm_.combine
                , view = \_ -> []
                }
            )
            |> Form.field "kind"
                (Field.select
                    [ ( "link", Link )
                    , ( "post", Post )
                    ]
                    (\_ -> "Invalid")
                    |> Field.required "Required"
                )
            |> Form.dynamic
                (\parsedKind ->
                    case parsedKind of
                        Link -> linkForm
                        Post -> postForm
                )

    linkForm : Form.HtmlForm String PostAction input msg
    linkForm =
        Form.form
            (\url ->
                { combine =
                    Validation.succeed ParsedLink
                        |> Validation.andMap url
                , view = \_ -> []
                }
            )
            |> Form.field "url"
                (Field.text
                    |> Field.required "Required"
                    |> Field.url
                )


    postForm : Form.HtmlForm String PostAction input msg
    postForm =
        Form.form
            (\title body ->
                { combine =
                    Validation.succeed
                        (\titleValue bodyValue ->
                            { title = titleValue
                            , body = bodyValue
                            }
                        )
                        |> Validation.andMap title
                        |> Validation.andMap body
                        |> Validation.map ParsedPost
                , view = \_ -> []
                }
            )
            |> Form.field "title" (Field.text |> Field.required "Required")
            |> Form.field "body" Field.text


    Form.Handler.run
        [ ( "kind", "link" )
        , ( "url", "https://elm-radio.com/episode/wrap-early-unwrap-late" )
        ]
        (dependentForm |> Form.Handler.init identity)

    --> (Valid (ParsedLink "https://elm-radio.com/episode/wrap-early-unwrap-late"))

dynamic: 
    (decider
    -> Form.Form error { combine :
        Pages.Internal.Form.Validation error parsed named constraints1
    , view : subView
    } parsed input)
    -> Form.Form error ({ combine :
        decider -> Pages.Internal.Form.Validation error parsed named constraints1
    , view : decider -> subView
    }
    -> combineAndView) parsed input
    -> Form.Form error combineAndView parsed input
-}
dynamic : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
dynamic dynamicArg dynamicArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "dynamic"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "decider" ]
                            (Type.namedWith
                                [ "Form" ]
                                "Form"
                                [ Type.var "error"
                                , Type.record
                                    [ ( "combine"
                                      , Type.namedWith
                                            [ "Pages", "Internal", "Form" ]
                                            "Validation"
                                            [ Type.var "error"
                                            , Type.var "parsed"
                                            , Type.var "named"
                                            , Type.var "constraints1"
                                            ]
                                      )
                                    , ( "view", Type.var "subView" )
                                    ]
                                , Type.var "parsed"
                                , Type.var "input"
                                ]
                            )
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.function
                                [ Type.record
                                    [ ( "combine"
                                      , Type.function
                                            [ Type.var "decider" ]
                                            (Type.namedWith
                                                [ "Pages", "Internal", "Form" ]
                                                "Validation"
                                                [ Type.var "error"
                                                , Type.var "parsed"
                                                , Type.var "named"
                                                , Type.var "constraints1"
                                                ]
                                            )
                                      )
                                    , ( "view"
                                      , Type.function
                                            [ Type.var "decider" ]
                                            (Type.var "subView")
                                      )
                                    ]
                                ]
                                (Type.var "combineAndView")
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "dynamicUnpack" dynamicArg, dynamicArg0 ]


{-| Initialize the [`Form.Model`](Form#Model).

    import Form

    init : Flags -> ( Model, Cmd Msg )
    init flags =
        ( { formModel = Form.init
          , submitting = False
          }
        , Cmd.none
        )

init: Form.Model
-}
init : Elm.Expression
init =
    Elm.value
        { importFrom = [ "Form" ]
        , name = "init"
        , annotation = Just (Type.namedWith [ "Form" ] "Model" [])
        }


{-| Update the `Form.Model` given the `Form.Msg` and the previous `Form.Model`. See the
[README's section on Wiring](./#wiring).

update: Form.Msg msg -> Form.Model -> ( Form.Model, Platform.Cmd.Cmd msg )
-}
update : Elm.Expression -> Elm.Expression -> Elm.Expression
update updateArg updateArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "update"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Form" ] "Msg" [ Type.var "msg" ]
                        , Type.namedWith [ "Form" ] "Model" []
                        ]
                        (Type.tuple
                            (Type.namedWith [ "Form" ] "Model" [])
                            (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                        )
                    )
            }
        )
        [ updateArg, updateArg0 ]


{-| Lets you map a user msg within a `Form.Msg`.

mapMsg: (msg -> msgMapped) -> Form.Msg msg -> Form.Msg msgMapped
-}
mapMsg : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
mapMsg mapMsgArg mapMsgArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "mapMsg"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "msg" ]
                            (Type.var "msgMapped")
                        , Type.namedWith [ "Form" ] "Msg" [ Type.var "msg" ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Msg"
                            [ Type.var "msgMapped" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "mapMsgUnpack" mapMsgArg, mapMsgArg0 ]


{-| Parsing a `Form` gives you a [`Validated`](#Validated) type. This helper turns it into a `Result`
that is semantically the same. This can be useful for using a parsed `Form` value in a pipeline.

toResult: 
    Form.Validated error value
    -> Result.Result ( Maybe value, Dict.Dict String (List error) ) value
-}
toResult : Elm.Expression -> Elm.Expression
toResult toResultArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Form" ]
            , name = "toResult"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form" ]
                            "Validated"
                            [ Type.var "error", Type.var "value" ]
                        ]
                        (Type.namedWith
                            [ "Result" ]
                            "Result"
                            [ Type.tuple
                                (Type.maybe (Type.var "value"))
                                (Type.namedWith
                                    [ "Dict" ]
                                    "Dict"
                                    [ Type.string
                                    , Type.list (Type.var "error")
                                    ]
                                )
                            , Type.var "value"
                            ]
                        )
                    )
            }
        )
        [ toResultArg ]


annotation_ :
    { form :
        Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
    , htmlForm :
        Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
    , styledHtmlForm :
        Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
    , context : Type.Annotation -> Type.Annotation -> Type.Annotation
    , errors : Type.Annotation -> Type.Annotation
    , options :
        Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
        -> Type.Annotation
    , method : Type.Annotation
    , validated : Type.Annotation -> Type.Annotation -> Type.Annotation
    , msg : Type.Annotation -> Type.Annotation
    , model : Type.Annotation
    , formState : Type.Annotation
    , fieldState : Type.Annotation
    , serverResponse : Type.Annotation -> Type.Annotation
    }
annotation_ =
    { form =
        \formArg0 formArg1 formArg2 formArg3 ->
            Type.alias
                moduleName_
                "Form"
                [ formArg0, formArg1, formArg2, formArg3 ]
                (Type.namedWith
                    [ "Internal", "Form" ]
                    "Form"
                    [ Type.var "error"
                    , Type.var "combineAndView"
                    , Type.var "parsed"
                    , Type.var "input"
                    ]
                )
    , htmlForm =
        \htmlFormArg0 htmlFormArg1 htmlFormArg2 htmlFormArg3 ->
            Type.alias
                moduleName_
                "HtmlForm"
                [ htmlFormArg0, htmlFormArg1, htmlFormArg2, htmlFormArg3 ]
                (Type.namedWith
                    [ "Form" ]
                    "Form"
                    [ Type.var "error"
                    , Type.record
                        [ ( "combine"
                          , Type.namedWith
                                [ "Pages", "Internal", "Form" ]
                                "Validation"
                                [ Type.var "error"
                                , Type.var "parsed"
                                , Type.namedWith [ "Basics" ] "Never" []
                                , Type.namedWith [ "Basics" ] "Never" []
                                ]
                          )
                        , ( "view"
                          , Type.function
                                [ Type.namedWith
                                    [ "Form" ]
                                    "Context"
                                    [ Type.var "error", Type.var "input" ]
                                ]
                                (Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                )
                          )
                        ]
                    , Type.var "parsed"
                    , Type.var "input"
                    ]
                )
    , styledHtmlForm =
        \styledHtmlFormArg0 styledHtmlFormArg1 styledHtmlFormArg2 styledHtmlFormArg3 ->
            Type.alias
                moduleName_
                "StyledHtmlForm"
                [ styledHtmlFormArg0
                , styledHtmlFormArg1
                , styledHtmlFormArg2
                , styledHtmlFormArg3
                ]
                (Type.namedWith
                    [ "Form" ]
                    "Form"
                    [ Type.var "error"
                    , Type.record
                        [ ( "combine"
                          , Type.namedWith
                                [ "Pages", "Internal", "Form" ]
                                "Validation"
                                [ Type.var "error"
                                , Type.var "parsed"
                                , Type.namedWith [ "Basics" ] "Never" []
                                , Type.namedWith [ "Basics" ] "Never" []
                                ]
                          )
                        , ( "view"
                          , Type.function
                                [ Type.namedWith
                                    [ "Form" ]
                                    "Context"
                                    [ Type.var "error", Type.var "input" ]
                                ]
                                (Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Html"
                                        [ Type.var "msg" ]
                                    )
                                )
                          )
                        ]
                    , Type.var "parsed"
                    , Type.var "input"
                    ]
                )
    , context =
        \contextArg0 contextArg1 ->
            Type.alias
                moduleName_
                "Context"
                [ contextArg0, contextArg1 ]
                (Type.record
                    [ ( "errors"
                      , Type.namedWith [ "Form" ] "Errors" [ Type.var "error" ]
                      )
                    , ( "submitting", Type.bool )
                    , ( "submitAttempted", Type.bool )
                    , ( "input", Type.var "input" )
                    ]
                )
    , errors = \errorsArg0 -> Type.namedWith [ "Form" ] "Errors" [ errorsArg0 ]
    , options =
        \optionsArg0 optionsArg1 optionsArg2 optionsArg3 optionsArg4 ->
            Type.alias
                moduleName_
                "Options"
                [ optionsArg0
                , optionsArg1
                , optionsArg2
                , optionsArg3
                , optionsArg4
                ]
                (Type.record
                    [ ( "id", Type.string )
                    , ( "action", Type.maybe Type.string )
                    , ( "method", Type.namedWith [ "Form" ] "Method" [] )
                    , ( "input", Type.var "input" )
                    , ( "onSubmit"
                      , Type.maybe
                            (Type.function
                                [ Type.record
                                    [ ( "fields"
                                      , Type.list
                                            (Type.tuple Type.string Type.string)
                                      )
                                    , ( "method"
                                      , Type.namedWith [ "Form" ] "Method" []
                                      )
                                    , ( "action", Type.string )
                                    , ( "parsed"
                                      , Type.namedWith
                                            [ "Form" ]
                                            "Validated"
                                            [ Type.var "error"
                                            , Type.var "parsed"
                                            ]
                                      )
                                    ]
                                ]
                                (Type.var "msg")
                            )
                      )
                    , ( "serverResponse"
                      , Type.maybe
                            (Type.namedWith
                                [ "Form" ]
                                "ServerResponse"
                                [ Type.var "error" ]
                            )
                      )
                    , ( "extras", Type.maybe (Type.var "extras") )
                    ]
                )
    , method = Type.namedWith [ "Form" ] "Method" []
    , validated =
        \validatedArg0 validatedArg1 ->
            Type.namedWith
                [ "Form" ]
                "Validated"
                [ validatedArg0, validatedArg1 ]
    , msg =
        \msgArg0 ->
            Type.alias
                moduleName_
                "Msg"
                [ msgArg0 ]
                (Type.namedWith
                    [ "Internal", "FieldEvent" ]
                    "Msg"
                    [ Type.var "msg" ]
                )
    , model =
        Type.alias
            moduleName_
            "Model"
            []
            (Type.namedWith
                [ "Dict" ]
                "Dict"
                [ Type.string, Type.namedWith [ "Form" ] "FormState" [] ]
            )
    , formState =
        Type.alias
            moduleName_
            "FormState"
            []
            (Type.record
                [ ( "fields"
                  , Type.namedWith
                        [ "Dict" ]
                        "Dict"
                        [ Type.string
                        , Type.namedWith [ "Form" ] "FieldState" []
                        ]
                  )
                , ( "submitAttempted", Type.bool )
                ]
            )
    , fieldState =
        Type.alias
            moduleName_
            "FieldState"
            []
            (Type.record
                [ ( "value", Type.string )
                , ( "status"
                  , Type.namedWith [ "Form", "Validation" ] "FieldStatus" []
                  )
                ]
            )
    , serverResponse =
        \serverResponseArg0 ->
            Type.alias
                moduleName_
                "ServerResponse"
                [ serverResponseArg0 ]
                (Type.record
                    [ ( "persisted"
                      , Type.record
                            [ ( "fields"
                              , Type.maybe
                                    (Type.list
                                        (Type.tuple Type.string Type.string)
                                    )
                              )
                            , ( "clientSideErrors"
                              , Type.maybe
                                    (Type.namedWith
                                        [ "Dict" ]
                                        "Dict"
                                        [ Type.string
                                        , Type.list (Type.var "error")
                                        ]
                                    )
                              )
                            ]
                      )
                    , ( "serverSideErrors"
                      , Type.namedWith
                            [ "Dict" ]
                            "Dict"
                            [ Type.string, Type.list (Type.var "error") ]
                      )
                    ]
                )
    }


make_ :
    { context :
        { errors : Elm.Expression
        , submitting : Elm.Expression
        , submitAttempted : Elm.Expression
        , input : Elm.Expression
        }
        -> Elm.Expression
    , options :
        { id : Elm.Expression
        , action : Elm.Expression
        , method : Elm.Expression
        , input : Elm.Expression
        , onSubmit : Elm.Expression
        , serverResponse : Elm.Expression
        , extras : Elm.Expression
        }
        -> Elm.Expression
    , get : Elm.Expression
    , post : Elm.Expression
    , valid : Elm.Expression -> Elm.Expression
    , invalid : Elm.Expression -> Elm.Expression -> Elm.Expression
    , formState :
        { fields : Elm.Expression, submitAttempted : Elm.Expression }
        -> Elm.Expression
    , fieldState :
        { value : Elm.Expression, status : Elm.Expression } -> Elm.Expression
    , serverResponse :
        { persisted : Elm.Expression, serverSideErrors : Elm.Expression }
        -> Elm.Expression
    }
make_ =
    { context =
        \context_args ->
            Elm.withType
                (Type.alias
                    [ "Form" ]
                    "Context"
                    [ Type.var "error", Type.var "input" ]
                    (Type.record
                        [ ( "errors"
                          , Type.namedWith
                                [ "Form" ]
                                "Errors"
                                [ Type.var "error" ]
                          )
                        , ( "submitting", Type.bool )
                        , ( "submitAttempted", Type.bool )
                        , ( "input", Type.var "input" )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "errors" context_args.errors
                    , Tuple.pair "submitting" context_args.submitting
                    , Tuple.pair "submitAttempted" context_args.submitAttempted
                    , Tuple.pair "input" context_args.input
                    ]
                )
    , options =
        \options_args ->
            Elm.withType
                (Type.alias
                    [ "Form" ]
                    "Options"
                    [ Type.var "error"
                    , Type.var "parsed"
                    , Type.var "input"
                    , Type.var "msg"
                    , Type.var "extras"
                    ]
                    (Type.record
                        [ ( "id", Type.string )
                        , ( "action", Type.maybe Type.string )
                        , ( "method", Type.namedWith [ "Form" ] "Method" [] )
                        , ( "input", Type.var "input" )
                        , ( "onSubmit"
                          , Type.maybe
                                (Type.function
                                    [ Type.record
                                        [ ( "fields"
                                          , Type.list
                                                (Type.tuple
                                                    Type.string
                                                    Type.string
                                                )
                                          )
                                        , ( "method"
                                          , Type.namedWith
                                                [ "Form" ]
                                                "Method"
                                                []
                                          )
                                        , ( "action", Type.string )
                                        , ( "parsed"
                                          , Type.namedWith
                                                [ "Form" ]
                                                "Validated"
                                                [ Type.var "error"
                                                , Type.var "parsed"
                                                ]
                                          )
                                        ]
                                    ]
                                    (Type.var "msg")
                                )
                          )
                        , ( "serverResponse"
                          , Type.maybe
                                (Type.namedWith
                                    [ "Form" ]
                                    "ServerResponse"
                                    [ Type.var "error" ]
                                )
                          )
                        , ( "extras", Type.maybe (Type.var "extras") )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "id" options_args.id
                    , Tuple.pair "action" options_args.action
                    , Tuple.pair "method" options_args.method
                    , Tuple.pair "input" options_args.input
                    , Tuple.pair "onSubmit" options_args.onSubmit
                    , Tuple.pair "serverResponse" options_args.serverResponse
                    , Tuple.pair "extras" options_args.extras
                    ]
                )
    , get =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "Get"
            , annotation = Just (Type.namedWith [] "Method" [])
            }
    , post =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "Post"
            , annotation = Just (Type.namedWith [] "Method" [])
            }
    , valid =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "Valid"
                    , annotation =
                        Just
                            (Type.namedWith
                                []
                                "Validated"
                                [ Type.var "error", Type.var "value" ]
                            )
                    }
                )
                [ ar0 ]
    , invalid =
        \ar0 ar1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "Invalid"
                    , annotation =
                        Just
                            (Type.namedWith
                                []
                                "Validated"
                                [ Type.var "error", Type.var "value" ]
                            )
                    }
                )
                [ ar0, ar1 ]
    , formState =
        \formState_args ->
            Elm.withType
                (Type.alias
                    [ "Form" ]
                    "FormState"
                    []
                    (Type.record
                        [ ( "fields"
                          , Type.namedWith
                                [ "Dict" ]
                                "Dict"
                                [ Type.string
                                , Type.namedWith [ "Form" ] "FieldState" []
                                ]
                          )
                        , ( "submitAttempted", Type.bool )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "fields" formState_args.fields
                    , Tuple.pair
                        "submitAttempted"
                        formState_args.submitAttempted
                    ]
                )
    , fieldState =
        \fieldState_args ->
            Elm.withType
                (Type.alias
                    [ "Form" ]
                    "FieldState"
                    []
                    (Type.record
                        [ ( "value", Type.string )
                        , ( "status"
                          , Type.namedWith
                                [ "Form", "Validation" ]
                                "FieldStatus"
                                []
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "value" fieldState_args.value
                    , Tuple.pair "status" fieldState_args.status
                    ]
                )
    , serverResponse =
        \serverResponse_args ->
            Elm.withType
                (Type.alias
                    [ "Form" ]
                    "ServerResponse"
                    [ Type.var "error" ]
                    (Type.record
                        [ ( "persisted"
                          , Type.record
                                [ ( "fields"
                                  , Type.maybe
                                        (Type.list
                                            (Type.tuple Type.string Type.string)
                                        )
                                  )
                                , ( "clientSideErrors"
                                  , Type.maybe
                                        (Type.namedWith
                                            [ "Dict" ]
                                            "Dict"
                                            [ Type.string
                                            , Type.list (Type.var "error")
                                            ]
                                        )
                                  )
                                ]
                          )
                        , ( "serverSideErrors"
                          , Type.namedWith
                                [ "Dict" ]
                                "Dict"
                                [ Type.string, Type.list (Type.var "error") ]
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "persisted" serverResponse_args.persisted
                    , Tuple.pair
                        "serverSideErrors"
                        serverResponse_args.serverSideErrors
                    ]
                )
    }


caseOf_ :
    { method :
        Elm.Expression
        -> { methodTags_0_0 | get : Elm.Expression, post : Elm.Expression }
        -> Elm.Expression
    , validated :
        Elm.Expression
        -> { validatedTags_1_0
            | valid : Elm.Expression -> Elm.Expression
            , invalid : Elm.Expression -> Elm.Expression -> Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { method =
        \methodExpression methodTags ->
            Elm.Case.custom
                methodExpression
                (Type.namedWith [ "Form" ] "Method" [])
                [ Elm.Case.branch0 "Get" methodTags.get
                , Elm.Case.branch0 "Post" methodTags.post
                ]
    , validated =
        \validatedExpression validatedTags ->
            Elm.Case.custom
                validatedExpression
                (Type.namedWith
                    [ "Form" ]
                    "Validated"
                    [ Type.var "error", Type.var "value" ]
                )
                [ Elm.Case.branch1
                    "Valid"
                    ( "value", Type.var "value" )
                    validatedTags.valid
                , Elm.Case.branch2
                    "Invalid"
                    ( "maybe.Maybe", Type.maybe (Type.var "value") )
                    ( "dict.Dict"
                    , Type.namedWith
                        [ "Dict" ]
                        "Dict"
                        [ Type.string, Type.list (Type.var "error") ]
                    )
                    validatedTags.invalid
                ]
    }


call_ :
    { form : Elm.Expression -> Elm.Expression
    , field :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , errorsForField : Elm.Expression -> Elm.Expression -> Elm.Expression
    , renderHtml :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , renderStyledHtml :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , options : Elm.Expression -> Elm.Expression
    , withInput : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withAction : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withOnSubmit : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withServerResponse : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withGetMethod : Elm.Expression -> Elm.Expression
    , methodToString : Elm.Expression -> Elm.Expression
    , parse :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , hiddenField :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , hiddenKind :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , dynamic : Elm.Expression -> Elm.Expression -> Elm.Expression
    , update : Elm.Expression -> Elm.Expression -> Elm.Expression
    , mapMsg : Elm.Expression -> Elm.Expression -> Elm.Expression
    , toResult : Elm.Expression -> Elm.Expression
    }
call_ =
    { form =
        \formArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "form"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "combineAndView" ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.var "combineAndView"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                )
                            )
                    }
                )
                [ formArg ]
    , field =
        \fieldArg fieldArg0 fieldArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "field"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
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
                                , Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.function
                                        [ Type.namedWith
                                            [ "Form", "Validation" ]
                                            "Field"
                                            [ Type.var "error"
                                            , Type.var "parsed"
                                            , Type.var "kind"
                                            ]
                                        ]
                                        (Type.var "combineAndView")
                                    , Type.var "parsedCombined"
                                    , Type.var "input"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.var "combineAndView"
                                    , Type.var "parsedCombined"
                                    , Type.var "input"
                                    ]
                                )
                            )
                    }
                )
                [ fieldArg, fieldArg0, fieldArg1 ]
    , errorsForField =
        \errorsForFieldArg errorsForFieldArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "errorsForField"
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
                                , Type.namedWith
                                    [ "Form" ]
                                    "Errors"
                                    [ Type.var "error" ]
                                ]
                                (Type.list (Type.var "error"))
                            )
                    }
                )
                [ errorsForFieldArg, errorsForFieldArg0 ]
    , renderHtml =
        \renderHtmlArg renderHtmlArg0 renderHtmlArg1 renderHtmlArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "renderHtml"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "submitting", Type.bool )
                                    , ( "state"
                                      , Type.namedWith [ "Form" ] "Model" []
                                      )
                                    , ( "toMsg"
                                      , Type.function
                                            [ Type.namedWith
                                                [ "Form" ]
                                                "Msg"
                                                [ Type.var "mappedMsg" ]
                                            ]
                                            (Type.var "mappedMsg")
                                      )
                                    ]
                                , Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "mappedMsg"
                                    , Type.var "extras"
                                    ]
                                , Type.list
                                    (Type.namedWith
                                        [ "Html" ]
                                        "Attribute"
                                        [ Type.var "mappedMsg" ]
                                    )
                                , Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.record
                                        [ ( "combine"
                                          , Type.namedWith
                                                [ "Pages", "Internal", "Form" ]
                                                "Validation"
                                                [ Type.var "error"
                                                , Type.var "parsed"
                                                , Type.var "named"
                                                , Type.var "constraints"
                                                ]
                                          )
                                        , ( "view"
                                          , Type.function
                                                [ Type.namedWith
                                                    [ "Form" ]
                                                    "Context"
                                                    [ Type.var "error"
                                                    , Type.var "input"
                                                    ]
                                                ]
                                                (Type.list
                                                    (Type.namedWith
                                                        [ "Html" ]
                                                        "Html"
                                                        [ Type.var "mappedMsg" ]
                                                    )
                                                )
                                          )
                                        ]
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html" ]
                                    "Html"
                                    [ Type.var "mappedMsg" ]
                                )
                            )
                    }
                )
                [ renderHtmlArg
                , renderHtmlArg0
                , renderHtmlArg1
                , renderHtmlArg2
                ]
    , renderStyledHtml =
        \renderStyledHtmlArg renderStyledHtmlArg0 renderStyledHtmlArg1 renderStyledHtmlArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "renderStyledHtml"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "submitting", Type.bool )
                                    , ( "state"
                                      , Type.namedWith [ "Form" ] "Model" []
                                      )
                                    , ( "toMsg"
                                      , Type.function
                                            [ Type.namedWith
                                                [ "Form" ]
                                                "Msg"
                                                [ Type.var "mappedMsg" ]
                                            ]
                                            (Type.var "mappedMsg")
                                      )
                                    ]
                                , Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "mappedMsg"
                                    , Type.var "extras"
                                    ]
                                , Type.list
                                    (Type.namedWith
                                        [ "Html", "Styled" ]
                                        "Attribute"
                                        [ Type.var "mappedMsg" ]
                                    )
                                , Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.record
                                        [ ( "combine"
                                          , Type.namedWith
                                                [ "Pages", "Internal", "Form" ]
                                                "Validation"
                                                [ Type.var "error"
                                                , Type.var "parsed"
                                                , Type.var "field"
                                                , Type.var "constraints"
                                                ]
                                          )
                                        , ( "view"
                                          , Type.function
                                                [ Type.namedWith
                                                    [ "Form" ]
                                                    "Context"
                                                    [ Type.var "error"
                                                    , Type.var "input"
                                                    ]
                                                ]
                                                (Type.list
                                                    (Type.namedWith
                                                        [ "Html", "Styled" ]
                                                        "Html"
                                                        [ Type.var "mappedMsg" ]
                                                    )
                                                )
                                          )
                                        ]
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Html", "Styled" ]
                                    "Html"
                                    [ Type.var "mappedMsg" ]
                                )
                            )
                    }
                )
                [ renderStyledHtmlArg
                , renderStyledHtmlArg0
                , renderStyledHtmlArg1
                , renderStyledHtmlArg2
                ]
    , options =
        \optionsArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "options"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.unit
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                )
                            )
                    }
                )
                [ optionsArg ]
    , withInput =
        \withInputArg withInputArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "withInput"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "input"
                                , Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.unit
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                )
                            )
                    }
                )
                [ withInputArg, withInputArg0 ]
    , withAction =
        \withActionArg withActionArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "withAction"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
                                , Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                )
                            )
                    }
                )
                [ withActionArg, withActionArg0 ]
    , withOnSubmit =
        \withOnSubmitArg withOnSubmitArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "withOnSubmit"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.record
                                        [ ( "fields"
                                          , Type.list
                                                (Type.tuple
                                                    Type.string
                                                    Type.string
                                                )
                                          )
                                        , ( "method"
                                          , Type.namedWith
                                                [ "Form" ]
                                                "Method"
                                                []
                                          )
                                        , ( "action", Type.string )
                                        , ( "parsed"
                                          , Type.namedWith
                                                [ "Form" ]
                                                "Validated"
                                                [ Type.var "error"
                                                , Type.var "parsed"
                                                ]
                                          )
                                        ]
                                    ]
                                    (Type.var "msg")
                                , Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "oldMsg"
                                    , Type.var "extras"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                )
                            )
                    }
                )
                [ withOnSubmitArg, withOnSubmitArg0 ]
    , withServerResponse =
        \withServerResponseArg withServerResponseArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "withServerResponse"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.maybe
                                    (Type.namedWith
                                        [ "Form" ]
                                        "ServerResponse"
                                        [ Type.var "error" ]
                                    )
                                , Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                )
                            )
                    }
                )
                [ withServerResponseArg, withServerResponseArg0 ]
    , withGetMethod =
        \withGetMethodArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "withGetMethod"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Options"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    , Type.var "msg"
                                    , Type.var "extras"
                                    ]
                                )
                            )
                    }
                )
                [ withGetMethodArg ]
    , methodToString =
        \methodToStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "methodToString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [ "Form" ] "Method" [] ]
                                Type.string
                            )
                    }
                )
                [ methodToStringArg ]
    , parse =
        \parseArg parseArg0 parseArg1 parseArg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "parse"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
                                , Type.namedWith [ "Form" ] "Model" []
                                , Type.var "input"
                                , Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.extensible
                                        "info"
                                        [ ( "combine"
                                          , Type.namedWith
                                                [ "Pages", "Internal", "Form" ]
                                                "Validation"
                                                [ Type.var "error"
                                                , Type.var "parsed"
                                                , Type.var "named"
                                                , Type.var "constraints"
                                                ]
                                          )
                                        ]
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Validated"
                                    [ Type.var "error", Type.var "parsed" ]
                                )
                            )
                    }
                )
                [ parseArg, parseArg0, parseArg1, parseArg2 ]
    , hiddenField =
        \hiddenFieldArg hiddenFieldArg0 hiddenFieldArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "hiddenField"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string
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
                                , Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.function
                                        [ Type.namedWith
                                            [ "Form", "Validation" ]
                                            "Field"
                                            [ Type.var "error"
                                            , Type.var "parsed"
                                            , Type.namedWith
                                                [ "Form", "FieldView" ]
                                                "Hidden"
                                                []
                                            ]
                                        ]
                                        (Type.var "combineAndView")
                                    , Type.var "parsedCombined"
                                    , Type.var "input"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.var "combineAndView"
                                    , Type.var "parsedCombined"
                                    , Type.var "input"
                                    ]
                                )
                            )
                    }
                )
                [ hiddenFieldArg, hiddenFieldArg0, hiddenFieldArg1 ]
    , hiddenKind =
        \hiddenKindArg hiddenKindArg0 hiddenKindArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "hiddenKind"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.tuple Type.string Type.string
                                , Type.var "error"
                                , Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.var "combineAndView"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.var "combineAndView"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                )
                            )
                    }
                )
                [ hiddenKindArg, hiddenKindArg0, hiddenKindArg1 ]
    , dynamic =
        \dynamicArg dynamicArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "dynamic"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "decider" ]
                                    (Type.namedWith
                                        [ "Form" ]
                                        "Form"
                                        [ Type.var "error"
                                        , Type.record
                                            [ ( "combine"
                                              , Type.namedWith
                                                    [ "Pages"
                                                    , "Internal"
                                                    , "Form"
                                                    ]
                                                    "Validation"
                                                    [ Type.var "error"
                                                    , Type.var "parsed"
                                                    , Type.var "named"
                                                    , Type.var "constraints1"
                                                    ]
                                              )
                                            , ( "view", Type.var "subView" )
                                            ]
                                        , Type.var "parsed"
                                        , Type.var "input"
                                        ]
                                    )
                                , Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.function
                                        [ Type.record
                                            [ ( "combine"
                                              , Type.function
                                                    [ Type.var "decider" ]
                                                    (Type.namedWith
                                                        [ "Pages"
                                                        , "Internal"
                                                        , "Form"
                                                        ]
                                                        "Validation"
                                                        [ Type.var "error"
                                                        , Type.var "parsed"
                                                        , Type.var "named"
                                                        , Type.var
                                                            "constraints1"
                                                        ]
                                                    )
                                              )
                                            , ( "view"
                                              , Type.function
                                                    [ Type.var "decider" ]
                                                    (Type.var "subView")
                                              )
                                            ]
                                        ]
                                        (Type.var "combineAndView")
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Form"
                                    [ Type.var "error"
                                    , Type.var "combineAndView"
                                    , Type.var "parsed"
                                    , Type.var "input"
                                    ]
                                )
                            )
                    }
                )
                [ dynamicArg, dynamicArg0 ]
    , update =
        \updateArg updateArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "update"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form" ]
                                    "Msg"
                                    [ Type.var "msg" ]
                                , Type.namedWith [ "Form" ] "Model" []
                                ]
                                (Type.tuple
                                    (Type.namedWith [ "Form" ] "Model" [])
                                    (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                                )
                            )
                    }
                )
                [ updateArg, updateArg0 ]
    , mapMsg =
        \mapMsgArg mapMsgArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "mapMsg"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "msg" ]
                                    (Type.var "msgMapped")
                                , Type.namedWith
                                    [ "Form" ]
                                    "Msg"
                                    [ Type.var "msg" ]
                                ]
                                (Type.namedWith
                                    [ "Form" ]
                                    "Msg"
                                    [ Type.var "msgMapped" ]
                                )
                            )
                    }
                )
                [ mapMsgArg, mapMsgArg0 ]
    , toResult =
        \toResultArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Form" ]
                    , name = "toResult"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Form" ]
                                    "Validated"
                                    [ Type.var "error", Type.var "value" ]
                                ]
                                (Type.namedWith
                                    [ "Result" ]
                                    "Result"
                                    [ Type.tuple
                                        (Type.maybe (Type.var "value"))
                                        (Type.namedWith
                                            [ "Dict" ]
                                            "Dict"
                                            [ Type.string
                                            , Type.list (Type.var "error")
                                            ]
                                        )
                                    , Type.var "value"
                                    ]
                                )
                            )
                    }
                )
                [ toResultArg ]
    }


values_ :
    { form : Elm.Expression
    , field : Elm.Expression
    , errorsForField : Elm.Expression
    , renderHtml : Elm.Expression
    , renderStyledHtml : Elm.Expression
    , options : Elm.Expression
    , withInput : Elm.Expression
    , withAction : Elm.Expression
    , withOnSubmit : Elm.Expression
    , withServerResponse : Elm.Expression
    , withGetMethod : Elm.Expression
    , methodToString : Elm.Expression
    , parse : Elm.Expression
    , hiddenField : Elm.Expression
    , hiddenKind : Elm.Expression
    , dynamic : Elm.Expression
    , init : Elm.Expression
    , update : Elm.Expression
    , mapMsg : Elm.Expression
    , toResult : Elm.Expression
    }
values_ =
    { form =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "form"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "combineAndView" ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        )
                    )
            }
    , field =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "field"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
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
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.var "kind"
                                    ]
                                ]
                                (Type.var "combineAndView")
                            , Type.var "parsedCombined"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsedCombined"
                            , Type.var "input"
                            ]
                        )
                    )
            }
    , errorsForField =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "errorsForField"
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
                        , Type.namedWith
                            [ "Form" ]
                            "Errors"
                            [ Type.var "error" ]
                        ]
                        (Type.list (Type.var "error"))
                    )
            }
    , renderHtml =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "renderHtml"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "submitting", Type.bool )
                            , ( "state", Type.namedWith [ "Form" ] "Model" [] )
                            , ( "toMsg"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Form" ]
                                        "Msg"
                                        [ Type.var "mappedMsg" ]
                                    ]
                                    (Type.var "mappedMsg")
                              )
                            ]
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "mappedMsg"
                            , Type.var "extras"
                            ]
                        , Type.list
                            (Type.namedWith
                                [ "Html" ]
                                "Attribute"
                                [ Type.var "mappedMsg" ]
                            )
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.record
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Pages", "Internal", "Form" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "named"
                                        , Type.var "constraints"
                                        ]
                                  )
                                , ( "view"
                                  , Type.function
                                        [ Type.namedWith
                                            [ "Form" ]
                                            "Context"
                                            [ Type.var "error"
                                            , Type.var "input"
                                            ]
                                        ]
                                        (Type.list
                                            (Type.namedWith
                                                [ "Html" ]
                                                "Html"
                                                [ Type.var "mappedMsg" ]
                                            )
                                        )
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Html" ]
                            "Html"
                            [ Type.var "mappedMsg" ]
                        )
                    )
            }
    , renderStyledHtml =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "renderStyledHtml"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "submitting", Type.bool )
                            , ( "state", Type.namedWith [ "Form" ] "Model" [] )
                            , ( "toMsg"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Form" ]
                                        "Msg"
                                        [ Type.var "mappedMsg" ]
                                    ]
                                    (Type.var "mappedMsg")
                              )
                            ]
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "mappedMsg"
                            , Type.var "extras"
                            ]
                        , Type.list
                            (Type.namedWith
                                [ "Html", "Styled" ]
                                "Attribute"
                                [ Type.var "mappedMsg" ]
                            )
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.record
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Pages", "Internal", "Form" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "field"
                                        , Type.var "constraints"
                                        ]
                                  )
                                , ( "view"
                                  , Type.function
                                        [ Type.namedWith
                                            [ "Form" ]
                                            "Context"
                                            [ Type.var "error"
                                            , Type.var "input"
                                            ]
                                        ]
                                        (Type.list
                                            (Type.namedWith
                                                [ "Html", "Styled" ]
                                                "Html"
                                                [ Type.var "mappedMsg" ]
                                            )
                                        )
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Html", "Styled" ]
                            "Html"
                            [ Type.var "mappedMsg" ]
                        )
                    )
            }
    , options =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "options"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.unit
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
    , withInput =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "withInput"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "input"
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.unit
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
    , withAction =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "withAction"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
    , withOnSubmit =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "withOnSubmit"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.record
                                [ ( "fields"
                                  , Type.list
                                        (Type.tuple Type.string Type.string)
                                  )
                                , ( "method"
                                  , Type.namedWith [ "Form" ] "Method" []
                                  )
                                , ( "action", Type.string )
                                , ( "parsed"
                                  , Type.namedWith
                                        [ "Form" ]
                                        "Validated"
                                        [ Type.var "error", Type.var "parsed" ]
                                  )
                                ]
                            ]
                            (Type.var "msg")
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "oldMsg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
    , withServerResponse =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "withServerResponse"
            , annotation =
                Just
                    (Type.function
                        [ Type.maybe
                            (Type.namedWith
                                [ "Form" ]
                                "ServerResponse"
                                [ Type.var "error" ]
                            )
                        , Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
    , withGetMethod =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "withGetMethod"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Options"
                            [ Type.var "error"
                            , Type.var "parsed"
                            , Type.var "input"
                            , Type.var "msg"
                            , Type.var "extras"
                            ]
                        )
                    )
            }
    , methodToString =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "methodToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Form" ] "Method" [] ]
                        Type.string
                    )
            }
    , parse =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "parse"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
                        , Type.namedWith [ "Form" ] "Model" []
                        , Type.var "input"
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.extensible
                                "info"
                                [ ( "combine"
                                  , Type.namedWith
                                        [ "Pages", "Internal", "Form" ]
                                        "Validation"
                                        [ Type.var "error"
                                        , Type.var "parsed"
                                        , Type.var "named"
                                        , Type.var "constraints"
                                        ]
                                  )
                                ]
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Validated"
                            [ Type.var "error", Type.var "parsed" ]
                        )
                    )
            }
    , hiddenField =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "hiddenField"
            , annotation =
                Just
                    (Type.function
                        [ Type.string
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
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.function
                                [ Type.namedWith
                                    [ "Form", "Validation" ]
                                    "Field"
                                    [ Type.var "error"
                                    , Type.var "parsed"
                                    , Type.namedWith
                                        [ "Form", "FieldView" ]
                                        "Hidden"
                                        []
                                    ]
                                ]
                                (Type.var "combineAndView")
                            , Type.var "parsedCombined"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsedCombined"
                            , Type.var "input"
                            ]
                        )
                    )
            }
    , hiddenKind =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "hiddenKind"
            , annotation =
                Just
                    (Type.function
                        [ Type.tuple Type.string Type.string
                        , Type.var "error"
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        )
                    )
            }
    , dynamic =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "dynamic"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "decider" ]
                            (Type.namedWith
                                [ "Form" ]
                                "Form"
                                [ Type.var "error"
                                , Type.record
                                    [ ( "combine"
                                      , Type.namedWith
                                            [ "Pages", "Internal", "Form" ]
                                            "Validation"
                                            [ Type.var "error"
                                            , Type.var "parsed"
                                            , Type.var "named"
                                            , Type.var "constraints1"
                                            ]
                                      )
                                    , ( "view", Type.var "subView" )
                                    ]
                                , Type.var "parsed"
                                , Type.var "input"
                                ]
                            )
                        , Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.function
                                [ Type.record
                                    [ ( "combine"
                                      , Type.function
                                            [ Type.var "decider" ]
                                            (Type.namedWith
                                                [ "Pages", "Internal", "Form" ]
                                                "Validation"
                                                [ Type.var "error"
                                                , Type.var "parsed"
                                                , Type.var "named"
                                                , Type.var "constraints1"
                                                ]
                                            )
                                      )
                                    , ( "view"
                                      , Type.function
                                            [ Type.var "decider" ]
                                            (Type.var "subView")
                                      )
                                    ]
                                ]
                                (Type.var "combineAndView")
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Form"
                            [ Type.var "error"
                            , Type.var "combineAndView"
                            , Type.var "parsed"
                            , Type.var "input"
                            ]
                        )
                    )
            }
    , init =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "init"
            , annotation = Just (Type.namedWith [ "Form" ] "Model" [])
            }
    , update =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "update"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [ "Form" ] "Msg" [ Type.var "msg" ]
                        , Type.namedWith [ "Form" ] "Model" []
                        ]
                        (Type.tuple
                            (Type.namedWith [ "Form" ] "Model" [])
                            (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                        )
                    )
            }
    , mapMsg =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "mapMsg"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "msg" ]
                            (Type.var "msgMapped")
                        , Type.namedWith [ "Form" ] "Msg" [ Type.var "msg" ]
                        ]
                        (Type.namedWith
                            [ "Form" ]
                            "Msg"
                            [ Type.var "msgMapped" ]
                        )
                    )
            }
    , toResult =
        Elm.value
            { importFrom = [ "Form" ]
            , name = "toResult"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Form" ]
                            "Validated"
                            [ Type.var "error", Type.var "value" ]
                        ]
                        (Type.namedWith
                            [ "Result" ]
                            "Result"
                            [ Type.tuple
                                (Type.maybe (Type.var "value"))
                                (Type.namedWith
                                    [ "Dict" ]
                                    "Dict"
                                    [ Type.string
                                    , Type.list (Type.var "error")
                                    ]
                                )
                            , Type.var "value"
                            ]
                        )
                    )
            }
    }


