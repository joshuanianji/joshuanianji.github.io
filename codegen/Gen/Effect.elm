module Gen.Effect exposing (annotation_, batch, call_, caseOf_, fromCmd, make_, map, moduleName_, none, perform, values_)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, none, batch, fromCmd, map, perform, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Effect" ]


{-| {-| -}

perform: 
    { fetchRouteData :
        { data : Maybe FormData, toMsg : Result Http.Error Url -> pageMsg }
        -> Cmd msg
    , submit :
        { values : FormData, toMsg : Result Http.Error Url -> pageMsg } -> Cmd msg
    , runFetcher : Pages.Fetcher.Fetcher pageMsg -> Cmd msg
    , fromPageMsg : pageMsg -> msg
    , key : Browser.Navigation.Key
    , setField : { formId : String, name : String, value : String } -> Cmd msg
    }
    -> Effect pageMsg
    -> Cmd msg
-}
perform :
    { fetchRouteData : Elm.Expression -> Elm.Expression
    , submit : Elm.Expression -> Elm.Expression
    , runFetcher : Elm.Expression -> Elm.Expression
    , fromPageMsg : Elm.Expression -> Elm.Expression
    , key : Elm.Expression
    , setField : Elm.Expression -> Elm.Expression
    }
    -> Elm.Expression
    -> Elm.Expression
perform performArg performArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Effect" ]
            , name = "perform"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "fetchRouteData"
                              , Type.function
                                    [ Type.record
                                        [ ( "data"
                                          , Type.namedWith
                                                []
                                                "Maybe"
                                                [ Type.namedWith
                                                    []
                                                    "FormData"
                                                    []
                                                ]
                                          )
                                        , ( "toMsg"
                                          , Type.function
                                                [ Type.namedWith
                                                    []
                                                    "Result"
                                                    [ Type.namedWith
                                                        [ "Http" ]
                                                        "Error"
                                                        []
                                                    , Type.namedWith [] "Url" []
                                                    ]
                                                ]
                                                (Type.var "pageMsg")
                                          )
                                        ]
                                    ]
                                    (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                              )
                            , ( "submit"
                              , Type.function
                                    [ Type.record
                                        [ ( "values"
                                          , Type.namedWith [] "FormData" []
                                          )
                                        , ( "toMsg"
                                          , Type.function
                                                [ Type.namedWith
                                                    []
                                                    "Result"
                                                    [ Type.namedWith
                                                        [ "Http" ]
                                                        "Error"
                                                        []
                                                    , Type.namedWith [] "Url" []
                                                    ]
                                                ]
                                                (Type.var "pageMsg")
                                          )
                                        ]
                                    ]
                                    (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                              )
                            , ( "runFetcher"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Pages", "Fetcher" ]
                                        "Fetcher"
                                        [ Type.var "pageMsg" ]
                                    ]
                                    (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                              )
                            , ( "fromPageMsg"
                              , Type.function
                                    [ Type.var "pageMsg" ]
                                    (Type.var "msg")
                              )
                            , ( "key"
                              , Type.namedWith
                                    [ "Browser", "Navigation" ]
                                    "Key"
                                    []
                              )
                            , ( "setField"
                              , Type.function
                                    [ Type.record
                                        [ ( "formId", Type.string )
                                        , ( "name", Type.string )
                                        , ( "value", Type.string )
                                        ]
                                    ]
                                    (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                              )
                            ]
                        , Type.namedWith [] "Effect" [ Type.var "pageMsg" ]
                        ]
                        (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair
                "fetchRouteData"
                (Elm.functionReduced "performUnpack" performArg.fetchRouteData)
            , Tuple.pair
                "submit"
                (Elm.functionReduced "performUnpack" performArg.submit)
            , Tuple.pair
                "runFetcher"
                (Elm.functionReduced "performUnpack" performArg.runFetcher)
            , Tuple.pair
                "fromPageMsg"
                (Elm.functionReduced "performUnpack" performArg.fromPageMsg)
            , Tuple.pair "key" performArg.key
            , Tuple.pair
                "setField"
                (Elm.functionReduced "performUnpack" performArg.setField)
            ]
        , performArg0
        ]


{-| {-| -}

map: (a -> b) -> Effect a -> Effect b
-}
map : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
map mapArg mapArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Effect" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "a" ] (Type.var "b")
                        , Type.namedWith [] "Effect" [ Type.var "a" ]
                        ]
                        (Type.namedWith [] "Effect" [ Type.var "b" ])
                    )
            }
        )
        [ Elm.functionReduced "mapUnpack" mapArg, mapArg0 ]


{-| {-| -}

fromCmd: Cmd msg -> Effect msg
-}
fromCmd : Elm.Expression -> Elm.Expression
fromCmd fromCmdArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Effect" ]
            , name = "fromCmd"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Cmd" [ Type.var "msg" ] ]
                        (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    )
            }
        )
        [ fromCmdArg ]


{-| {-| -}

batch: List (Effect msg) -> Effect msg
-}
batch : List Elm.Expression -> Elm.Expression
batch batchArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Effect" ]
            , name = "batch"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith [] "Effect" [ Type.var "msg" ])
                        ]
                        (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.list batchArg ]


{-| {-| -}

none: Effect msg
-}
none : Elm.Expression
none =
    Elm.value
        { importFrom = [ "Effect" ]
        , name = "none"
        , annotation = Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
        }


annotation_ : { effect : Type.Annotation -> Type.Annotation }
annotation_ =
    { effect =
        \effectArg0 -> Type.namedWith [ "Effect" ] "Effect" [ effectArg0 ]
    }


make_ :
    { none : Elm.Expression
    , cmd : Elm.Expression -> Elm.Expression
    , batch : Elm.Expression -> Elm.Expression
    , getStargazers : Elm.Expression -> Elm.Expression
    , setField : Elm.Expression -> Elm.Expression
    , fetchRouteData : Elm.Expression -> Elm.Expression
    , submit : Elm.Expression -> Elm.Expression
    , submitFetcher : Elm.Expression -> Elm.Expression
    }
make_ =
    { none =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "None"
            , annotation = Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
            }
    , cmd =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "Cmd"
                    , annotation =
                        Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    }
                )
                [ ar0 ]
    , batch =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "Batch"
                    , annotation =
                        Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    }
                )
                [ ar0 ]
    , getStargazers =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "GetStargazers"
                    , annotation =
                        Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    }
                )
                [ ar0 ]
    , setField =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "SetField"
                    , annotation =
                        Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    }
                )
                [ ar0 ]
    , fetchRouteData =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "FetchRouteData"
                    , annotation =
                        Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    }
                )
                [ ar0 ]
    , submit =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "Submit"
                    , annotation =
                        Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    }
                )
                [ ar0 ]
    , submitFetcher =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "SubmitFetcher"
                    , annotation =
                        Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    }
                )
                [ ar0 ]
    }


caseOf_ :
    { effect :
        Elm.Expression
        -> { effectTags_0_0
            | none : Elm.Expression
            , cmd : Elm.Expression -> Elm.Expression
            , batch : Elm.Expression -> Elm.Expression
            , getStargazers : Elm.Expression -> Elm.Expression
            , setField : Elm.Expression -> Elm.Expression
            , fetchRouteData : Elm.Expression -> Elm.Expression
            , submit : Elm.Expression -> Elm.Expression
            , submitFetcher : Elm.Expression -> Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { effect =
        \effectExpression effectTags ->
            Elm.Case.custom
                effectExpression
                (Type.namedWith [ "Effect" ] "Effect" [ Type.var "msg" ])
                [ Elm.Case.branch0 "None" effectTags.none
                , Elm.Case.branch1
                    "Cmd"
                    ( "cmd", Type.namedWith [] "Cmd" [ Type.var "msg" ] )
                    effectTags.cmd
                , Elm.Case.branch1
                    "Batch"
                    ( "list.List"
                    , Type.list (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    )
                    effectTags.batch
                , Elm.Case.branch1
                    "GetStargazers"
                    ( "one"
                    , Type.function
                        [ Type.namedWith
                            []
                            "Result"
                            [ Type.namedWith [ "Http" ] "Error" [], Type.int ]
                        ]
                        (Type.var "msg")
                    )
                    effectTags.getStargazers
                , Elm.Case.branch1
                    "SetField"
                    ( "one"
                    , Type.record
                        [ ( "formId", Type.string )
                        , ( "name", Type.string )
                        , ( "value", Type.string )
                        ]
                    )
                    effectTags.setField
                , Elm.Case.branch1
                    "FetchRouteData"
                    ( "one"
                    , Type.record
                        [ ( "data"
                          , Type.namedWith
                                []
                                "Maybe"
                                [ Type.namedWith [] "FormData" [] ]
                          )
                        , ( "toMsg"
                          , Type.function
                                [ Type.namedWith
                                    []
                                    "Result"
                                    [ Type.namedWith [ "Http" ] "Error" []
                                    , Type.namedWith [] "Url" []
                                    ]
                                ]
                                (Type.var "msg")
                          )
                        ]
                    )
                    effectTags.fetchRouteData
                , Elm.Case.branch1
                    "Submit"
                    ( "one"
                    , Type.record
                        [ ( "values", Type.namedWith [] "FormData" [] )
                        , ( "toMsg"
                          , Type.function
                                [ Type.namedWith
                                    []
                                    "Result"
                                    [ Type.namedWith [ "Http" ] "Error" []
                                    , Type.namedWith [] "Url" []
                                    ]
                                ]
                                (Type.var "msg")
                          )
                        ]
                    )
                    effectTags.submit
                , Elm.Case.branch1
                    "SubmitFetcher"
                    ( "pages.Fetcher.Fetcher"
                    , Type.namedWith
                        [ "Pages", "Fetcher" ]
                        "Fetcher"
                        [ Type.var "msg" ]
                    )
                    effectTags.submitFetcher
                ]
    }


call_ :
    { perform : Elm.Expression -> Elm.Expression -> Elm.Expression
    , map : Elm.Expression -> Elm.Expression -> Elm.Expression
    , fromCmd : Elm.Expression -> Elm.Expression
    , batch : Elm.Expression -> Elm.Expression
    }
call_ =
    { perform =
        \performArg performArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "perform"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "fetchRouteData"
                                      , Type.function
                                            [ Type.record
                                                [ ( "data"
                                                  , Type.namedWith
                                                        []
                                                        "Maybe"
                                                        [ Type.namedWith
                                                            []
                                                            "FormData"
                                                            []
                                                        ]
                                                  )
                                                , ( "toMsg"
                                                  , Type.function
                                                        [ Type.namedWith
                                                            []
                                                            "Result"
                                                            [ Type.namedWith
                                                                [ "Http" ]
                                                                "Error"
                                                                []
                                                            , Type.namedWith
                                                                []
                                                                "Url"
                                                                []
                                                            ]
                                                        ]
                                                        (Type.var "pageMsg")
                                                  )
                                                ]
                                            ]
                                            (Type.namedWith
                                                []
                                                "Cmd"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    , ( "submit"
                                      , Type.function
                                            [ Type.record
                                                [ ( "values"
                                                  , Type.namedWith
                                                        []
                                                        "FormData"
                                                        []
                                                  )
                                                , ( "toMsg"
                                                  , Type.function
                                                        [ Type.namedWith
                                                            []
                                                            "Result"
                                                            [ Type.namedWith
                                                                [ "Http" ]
                                                                "Error"
                                                                []
                                                            , Type.namedWith
                                                                []
                                                                "Url"
                                                                []
                                                            ]
                                                        ]
                                                        (Type.var "pageMsg")
                                                  )
                                                ]
                                            ]
                                            (Type.namedWith
                                                []
                                                "Cmd"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    , ( "runFetcher"
                                      , Type.function
                                            [ Type.namedWith
                                                [ "Pages", "Fetcher" ]
                                                "Fetcher"
                                                [ Type.var "pageMsg" ]
                                            ]
                                            (Type.namedWith
                                                []
                                                "Cmd"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    , ( "fromPageMsg"
                                      , Type.function
                                            [ Type.var "pageMsg" ]
                                            (Type.var "msg")
                                      )
                                    , ( "key"
                                      , Type.namedWith
                                            [ "Browser", "Navigation" ]
                                            "Key"
                                            []
                                      )
                                    , ( "setField"
                                      , Type.function
                                            [ Type.record
                                                [ ( "formId", Type.string )
                                                , ( "name", Type.string )
                                                , ( "value", Type.string )
                                                ]
                                            ]
                                            (Type.namedWith
                                                []
                                                "Cmd"
                                                [ Type.var "msg" ]
                                            )
                                      )
                                    ]
                                , Type.namedWith
                                    []
                                    "Effect"
                                    [ Type.var "pageMsg" ]
                                ]
                                (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                            )
                    }
                )
                [ performArg, performArg0 ]
    , map =
        \mapArg mapArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "map"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function [ Type.var "a" ] (Type.var "b")
                                , Type.namedWith [] "Effect" [ Type.var "a" ]
                                ]
                                (Type.namedWith [] "Effect" [ Type.var "b" ])
                            )
                    }
                )
                [ mapArg, mapArg0 ]
    , fromCmd =
        \fromCmdArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "fromCmd"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Cmd" [ Type.var "msg" ] ]
                                (Type.namedWith [] "Effect" [ Type.var "msg" ])
                            )
                    }
                )
                [ fromCmdArg ]
    , batch =
        \batchArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Effect" ]
                    , name = "batch"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        []
                                        "Effect"
                                        [ Type.var "msg" ]
                                    )
                                ]
                                (Type.namedWith [] "Effect" [ Type.var "msg" ])
                            )
                    }
                )
                [ batchArg ]
    }


values_ :
    { perform : Elm.Expression
    , map : Elm.Expression
    , fromCmd : Elm.Expression
    , batch : Elm.Expression
    , none : Elm.Expression
    }
values_ =
    { perform =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "perform"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "fetchRouteData"
                              , Type.function
                                    [ Type.record
                                        [ ( "data"
                                          , Type.namedWith
                                                []
                                                "Maybe"
                                                [ Type.namedWith
                                                    []
                                                    "FormData"
                                                    []
                                                ]
                                          )
                                        , ( "toMsg"
                                          , Type.function
                                                [ Type.namedWith
                                                    []
                                                    "Result"
                                                    [ Type.namedWith
                                                        [ "Http" ]
                                                        "Error"
                                                        []
                                                    , Type.namedWith [] "Url" []
                                                    ]
                                                ]
                                                (Type.var "pageMsg")
                                          )
                                        ]
                                    ]
                                    (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                              )
                            , ( "submit"
                              , Type.function
                                    [ Type.record
                                        [ ( "values"
                                          , Type.namedWith [] "FormData" []
                                          )
                                        , ( "toMsg"
                                          , Type.function
                                                [ Type.namedWith
                                                    []
                                                    "Result"
                                                    [ Type.namedWith
                                                        [ "Http" ]
                                                        "Error"
                                                        []
                                                    , Type.namedWith [] "Url" []
                                                    ]
                                                ]
                                                (Type.var "pageMsg")
                                          )
                                        ]
                                    ]
                                    (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                              )
                            , ( "runFetcher"
                              , Type.function
                                    [ Type.namedWith
                                        [ "Pages", "Fetcher" ]
                                        "Fetcher"
                                        [ Type.var "pageMsg" ]
                                    ]
                                    (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                              )
                            , ( "fromPageMsg"
                              , Type.function
                                    [ Type.var "pageMsg" ]
                                    (Type.var "msg")
                              )
                            , ( "key"
                              , Type.namedWith
                                    [ "Browser", "Navigation" ]
                                    "Key"
                                    []
                              )
                            , ( "setField"
                              , Type.function
                                    [ Type.record
                                        [ ( "formId", Type.string )
                                        , ( "name", Type.string )
                                        , ( "value", Type.string )
                                        ]
                                    ]
                                    (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                              )
                            ]
                        , Type.namedWith [] "Effect" [ Type.var "pageMsg" ]
                        ]
                        (Type.namedWith [] "Cmd" [ Type.var "msg" ])
                    )
            }
    , map =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "a" ] (Type.var "b")
                        , Type.namedWith [] "Effect" [ Type.var "a" ]
                        ]
                        (Type.namedWith [] "Effect" [ Type.var "b" ])
                    )
            }
    , fromCmd =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "fromCmd"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Cmd" [ Type.var "msg" ] ]
                        (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    )
            }
    , batch =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "batch"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith [] "Effect" [ Type.var "msg" ])
                        ]
                        (Type.namedWith [] "Effect" [ Type.var "msg" ])
                    )
            }
    , none =
        Elm.value
            { importFrom = [ "Effect" ]
            , name = "none"
            , annotation = Just (Type.namedWith [] "Effect" [ Type.var "msg" ])
            }
    }


