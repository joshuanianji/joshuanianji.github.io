module Gen.Util exposing (annotation_, call_, caseOf_, flexDirection, linkedHeader, make_, moduleName_, textLink, underlinedLink, values_)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, flexDirection, textLink, linkedHeader, underlinedLink, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Util" ]


{-| underlinedLink: 
    (List (Attribute msg) -> List (Html msg) -> Html msg)
    -> List (Attribute msg)
    -> List (Html msg)
    -> Html msg
-}
underlinedLink :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> List Elm.Expression
    -> List Elm.Expression
    -> Elm.Expression
underlinedLink underlinedLinkArg underlinedLinkArg0 underlinedLinkArg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util" ]
            , name = "underlinedLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.list
                                (Type.namedWith
                                    []
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            , Type.list
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            ]
                            (Type.namedWith [] "Html" [ Type.var "msg" ])
                        , Type.list
                            (Type.namedWith [] "Attribute" [ Type.var "msg" ])
                        , Type.list
                            (Type.namedWith [] "Html" [ Type.var "msg" ])
                        ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.functionReduced
            "underlinedLinkUnpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (underlinedLinkArg functionReducedUnpack)
            )
        , Elm.list underlinedLinkArg0
        , Elm.list underlinedLinkArg1
        ]


{-| linkedHeader: String -> String -> Html msg -}
linkedHeader : String -> String -> Elm.Expression
linkedHeader linkedHeaderArg linkedHeaderArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util" ]
            , name = "linkedHeader"
            , annotation =
                Just
                    (Type.function
                        [ Type.string, Type.string ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string linkedHeaderArg, Elm.string linkedHeaderArg0 ]


{-| textLink: String -> String -> Html msg -}
textLink : String -> String -> Elm.Expression
textLink textLinkArg textLinkArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util" ]
            , name = "textLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.string, Type.string ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ Elm.string textLinkArg, Elm.string textLinkArg0 ]


{-| flexDirection: FlexDirection -> Style -}
flexDirection : Elm.Expression -> Elm.Expression
flexDirection flexDirectionArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Util" ]
            , name = "flexDirection"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "FlexDirection" [] ]
                        (Type.namedWith [] "Style" [])
                    )
            }
        )
        [ flexDirectionArg ]


annotation_ : { flexDirection : Type.Annotation }
annotation_ =
    { flexDirection = Type.namedWith [ "Util" ] "FlexDirection" [] }


make_ : { row : Elm.Expression, column : Elm.Expression }
make_ =
    { row =
        Elm.value
            { importFrom = [ "Util" ]
            , name = "Row"
            , annotation = Just (Type.namedWith [] "FlexDirection" [])
            }
    , column =
        Elm.value
            { importFrom = [ "Util" ]
            , name = "Column"
            , annotation = Just (Type.namedWith [] "FlexDirection" [])
            }
    }


caseOf_ :
    { flexDirection :
        Elm.Expression
        -> { flexDirectionTags_0_0
            | row : Elm.Expression
            , column : Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { flexDirection =
        \flexDirectionExpression flexDirectionTags ->
            Elm.Case.custom
                flexDirectionExpression
                (Type.namedWith [ "Util" ] "FlexDirection" [])
                [ Elm.Case.branch0 "Row" flexDirectionTags.row
                , Elm.Case.branch0 "Column" flexDirectionTags.column
                ]
    }


call_ :
    { underlinedLink :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , linkedHeader : Elm.Expression -> Elm.Expression -> Elm.Expression
    , textLink : Elm.Expression -> Elm.Expression -> Elm.Expression
    , flexDirection : Elm.Expression -> Elm.Expression
    }
call_ =
    { underlinedLink =
        \underlinedLinkArg underlinedLinkArg0 underlinedLinkArg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util" ]
                    , name = "underlinedLink"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.list
                                        (Type.namedWith
                                            []
                                            "Attribute"
                                            [ Type.var "msg" ]
                                        )
                                    , Type.list
                                        (Type.namedWith
                                            []
                                            "Html"
                                            [ Type.var "msg" ]
                                        )
                                    ]
                                    (Type.namedWith [] "Html" [ Type.var "msg" ]
                                    )
                                , Type.list
                                    (Type.namedWith
                                        []
                                        "Attribute"
                                        [ Type.var "msg" ]
                                    )
                                , Type.list
                                    (Type.namedWith [] "Html" [ Type.var "msg" ]
                                    )
                                ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ underlinedLinkArg, underlinedLinkArg0, underlinedLinkArg1 ]
    , linkedHeader =
        \linkedHeaderArg linkedHeaderArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util" ]
                    , name = "linkedHeader"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string, Type.string ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ linkedHeaderArg, linkedHeaderArg0 ]
    , textLink =
        \textLinkArg textLinkArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util" ]
                    , name = "textLink"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string, Type.string ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ textLinkArg, textLinkArg0 ]
    , flexDirection =
        \flexDirectionArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Util" ]
                    , name = "flexDirection"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "FlexDirection" [] ]
                                (Type.namedWith [] "Style" [])
                            )
                    }
                )
                [ flexDirectionArg ]
    }


values_ :
    { underlinedLink : Elm.Expression
    , linkedHeader : Elm.Expression
    , textLink : Elm.Expression
    , flexDirection : Elm.Expression
    }
values_ =
    { underlinedLink =
        Elm.value
            { importFrom = [ "Util" ]
            , name = "underlinedLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.list
                                (Type.namedWith
                                    []
                                    "Attribute"
                                    [ Type.var "msg" ]
                                )
                            , Type.list
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            ]
                            (Type.namedWith [] "Html" [ Type.var "msg" ])
                        , Type.list
                            (Type.namedWith [] "Attribute" [ Type.var "msg" ])
                        , Type.list
                            (Type.namedWith [] "Html" [ Type.var "msg" ])
                        ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    , linkedHeader =
        Elm.value
            { importFrom = [ "Util" ]
            , name = "linkedHeader"
            , annotation =
                Just
                    (Type.function
                        [ Type.string, Type.string ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    , textLink =
        Elm.value
            { importFrom = [ "Util" ]
            , name = "textLink"
            , annotation =
                Just
                    (Type.function
                        [ Type.string, Type.string ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    , flexDirection =
        Elm.value
            { importFrom = [ "Util" ]
            , name = "flexDirection"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "FlexDirection" [] ]
                        (Type.namedWith [] "Style" [])
                    )
            }
    }


