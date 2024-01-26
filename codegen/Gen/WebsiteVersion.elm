module Gen.WebsiteVersion exposing (annotation_, call_, caseOf_, getWebsites, make_, moduleName_, statusColour, statusToString, techStackToID, techStackToString, values_)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, getWebsites, techStackToString, techStackToID, statusToString, statusColour, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "WebsiteVersion" ]


{-| statusColour: Status -> Color -}
statusColour : Elm.Expression -> Elm.Expression
statusColour statusColourArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "statusColour"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Status" [] ]
                        (Type.namedWith [] "Color" [])
                    )
            }
        )
        [ statusColourArg ]


{-| statusToString: Status -> String -}
statusToString : Elm.Expression -> Elm.Expression
statusToString statusToStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "statusToString"
            , annotation =
                Just
                    (Type.function [ Type.namedWith [] "Status" [] ] Type.string
                    )
            }
        )
        [ statusToStringArg ]


{-| techStackToID: TechStack -> String -}
techStackToID : Elm.Expression -> Elm.Expression
techStackToID techStackToIDArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "techStackToID"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "TechStack" [] ]
                        Type.string
                    )
            }
        )
        [ techStackToIDArg ]


{-| techStackToString: TechStack -> String -}
techStackToString : Elm.Expression -> Elm.Expression
techStackToString techStackToStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "techStackToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "TechStack" [] ]
                        Type.string
                    )
            }
        )
        [ techStackToStringArg ]


{-| getWebsites: BackendTask FatalError (List Website) -}
getWebsites : Elm.Expression
getWebsites =
    Elm.value
        { importFrom = [ "WebsiteVersion" ]
        , name = "getWebsites"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "BackendTask"
                    [ Type.namedWith [] "FatalError" []
                    , Type.list (Type.namedWith [] "Website" [])
                    ]
                )
        }


annotation_ :
    { dateRange : Type.Annotation
    , website : Type.Annotation
    , status : Type.Annotation
    , techStack : Type.Annotation
    }
annotation_ =
    { dateRange =
        Type.alias
            moduleName_
            "DateRange"
            []
            (Type.record
                [ ( "start", Type.namedWith [] "Date" [] )
                , ( "end", Type.namedWith [] "Date" [] )
                ]
            )
    , website =
        Type.alias
            moduleName_
            "Website"
            []
            (Type.record
                [ ( "version", Type.int )
                , ( "techStack", Type.list (Type.namedWith [] "TechStack" []) )
                , ( "url", Type.string )
                , ( "status", Type.namedWith [] "Status" [] )
                , ( "comments", Type.string )
                ]
            )
    , status = Type.namedWith [ "WebsiteVersion" ] "Status" []
    , techStack = Type.namedWith [ "WebsiteVersion" ] "TechStack" []
    }


make_ :
    { dateRange :
        { start : Elm.Expression, end : Elm.Expression } -> Elm.Expression
    , website :
        { version : Elm.Expression
        , techStack : Elm.Expression
        , url : Elm.Expression
        , status : Elm.Expression
        , comments : Elm.Expression
        }
        -> Elm.Expression
    , deprecated : Elm.Expression -> Elm.Expression
    , unreleased : Elm.Expression -> Elm.Expression
    , online : Elm.Expression -> Elm.Expression
    , elm : Elm.Expression
    , hCJ : Elm.Expression
    , webpack : Elm.Expression
    , angularJS : Elm.Expression
    , bootstrap : Elm.Expression
    , jQuery : Elm.Expression
    }
make_ =
    { dateRange =
        \dateRange_args ->
            Elm.withType
                (Type.alias
                    [ "WebsiteVersion" ]
                    "DateRange"
                    []
                    (Type.record
                        [ ( "start", Type.namedWith [] "Date" [] )
                        , ( "end", Type.namedWith [] "Date" [] )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "start" dateRange_args.start
                    , Tuple.pair "end" dateRange_args.end
                    ]
                )
    , website =
        \website_args ->
            Elm.withType
                (Type.alias
                    [ "WebsiteVersion" ]
                    "Website"
                    []
                    (Type.record
                        [ ( "version", Type.int )
                        , ( "techStack"
                          , Type.list (Type.namedWith [] "TechStack" [])
                          )
                        , ( "url", Type.string )
                        , ( "status", Type.namedWith [] "Status" [] )
                        , ( "comments", Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "version" website_args.version
                    , Tuple.pair "techStack" website_args.techStack
                    , Tuple.pair "url" website_args.url
                    , Tuple.pair "status" website_args.status
                    , Tuple.pair "comments" website_args.comments
                    ]
                )
    , deprecated =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "WebsiteVersion" ]
                    , name = "Deprecated"
                    , annotation = Just (Type.namedWith [] "Status" [])
                    }
                )
                [ ar0 ]
    , unreleased =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "WebsiteVersion" ]
                    , name = "Unreleased"
                    , annotation = Just (Type.namedWith [] "Status" [])
                    }
                )
                [ ar0 ]
    , online =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "WebsiteVersion" ]
                    , name = "Online"
                    , annotation = Just (Type.namedWith [] "Status" [])
                    }
                )
                [ ar0 ]
    , elm =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "Elm"
            , annotation = Just (Type.namedWith [] "TechStack" [])
            }
    , hCJ =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "HCJ"
            , annotation = Just (Type.namedWith [] "TechStack" [])
            }
    , webpack =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "Webpack"
            , annotation = Just (Type.namedWith [] "TechStack" [])
            }
    , angularJS =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "AngularJS"
            , annotation = Just (Type.namedWith [] "TechStack" [])
            }
    , bootstrap =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "Bootstrap"
            , annotation = Just (Type.namedWith [] "TechStack" [])
            }
    , jQuery =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "JQuery"
            , annotation = Just (Type.namedWith [] "TechStack" [])
            }
    }


caseOf_ :
    { status :
        Elm.Expression
        -> { statusTags_0_0
            | deprecated : Elm.Expression -> Elm.Expression
            , unreleased : Elm.Expression -> Elm.Expression
            , online : Elm.Expression -> Elm.Expression
        }
        -> Elm.Expression
    , techStack :
        Elm.Expression
        -> { techStackTags_1_0
            | elm : Elm.Expression
            , hCJ : Elm.Expression
            , webpack : Elm.Expression
            , angularJS : Elm.Expression
            , bootstrap : Elm.Expression
            , jQuery : Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { status =
        \statusExpression statusTags ->
            Elm.Case.custom
                statusExpression
                (Type.namedWith [ "WebsiteVersion" ] "Status" [])
                [ Elm.Case.branch1
                    "Deprecated"
                    ( "dateRange", Type.namedWith [] "DateRange" [] )
                    statusTags.deprecated
                , Elm.Case.branch1
                    "Unreleased"
                    ( "dateRange", Type.namedWith [] "DateRange" [] )
                    statusTags.unreleased
                , Elm.Case.branch1
                    "Online"
                    ( "date", Type.namedWith [] "Date" [] )
                    statusTags.online
                ]
    , techStack =
        \techStackExpression techStackTags ->
            Elm.Case.custom
                techStackExpression
                (Type.namedWith [ "WebsiteVersion" ] "TechStack" [])
                [ Elm.Case.branch0 "Elm" techStackTags.elm
                , Elm.Case.branch0 "HCJ" techStackTags.hCJ
                , Elm.Case.branch0 "Webpack" techStackTags.webpack
                , Elm.Case.branch0 "AngularJS" techStackTags.angularJS
                , Elm.Case.branch0 "Bootstrap" techStackTags.bootstrap
                , Elm.Case.branch0 "JQuery" techStackTags.jQuery
                ]
    }


call_ :
    { statusColour : Elm.Expression -> Elm.Expression
    , statusToString : Elm.Expression -> Elm.Expression
    , techStackToID : Elm.Expression -> Elm.Expression
    , techStackToString : Elm.Expression -> Elm.Expression
    }
call_ =
    { statusColour =
        \statusColourArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "WebsiteVersion" ]
                    , name = "statusColour"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Status" [] ]
                                (Type.namedWith [] "Color" [])
                            )
                    }
                )
                [ statusColourArg ]
    , statusToString =
        \statusToStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "WebsiteVersion" ]
                    , name = "statusToString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Status" [] ]
                                Type.string
                            )
                    }
                )
                [ statusToStringArg ]
    , techStackToID =
        \techStackToIDArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "WebsiteVersion" ]
                    , name = "techStackToID"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "TechStack" [] ]
                                Type.string
                            )
                    }
                )
                [ techStackToIDArg ]
    , techStackToString =
        \techStackToStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "WebsiteVersion" ]
                    , name = "techStackToString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "TechStack" [] ]
                                Type.string
                            )
                    }
                )
                [ techStackToStringArg ]
    }


values_ :
    { statusColour : Elm.Expression
    , statusToString : Elm.Expression
    , techStackToID : Elm.Expression
    , techStackToString : Elm.Expression
    , getWebsites : Elm.Expression
    }
values_ =
    { statusColour =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "statusColour"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Status" [] ]
                        (Type.namedWith [] "Color" [])
                    )
            }
    , statusToString =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "statusToString"
            , annotation =
                Just
                    (Type.function [ Type.namedWith [] "Status" [] ] Type.string
                    )
            }
    , techStackToID =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "techStackToID"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "TechStack" [] ]
                        Type.string
                    )
            }
    , techStackToString =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "techStackToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "TechStack" [] ]
                        Type.string
                    )
            }
    , getWebsites =
        Elm.value
            { importFrom = [ "WebsiteVersion" ]
            , name = "getWebsites"
            , annotation =
                Just
                    (Type.namedWith
                        []
                        "BackendTask"
                        [ Type.namedWith [] "FatalError" []
                        , Type.list (Type.namedWith [] "Website" [])
                        ]
                    )
            }
    }


