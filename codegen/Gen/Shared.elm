module Gen.Shared exposing (annotation_, caseOf_, make_, moduleName_, template, values_)

{-| 
@docs values_, caseOf_, make_, annotation_, template, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Shared" ]


{-| template: SharedTemplate Msg Model Data msg -}
template : Elm.Expression
template =
    Elm.value
        { importFrom = [ "Shared" ]
        , name = "template"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "SharedTemplate"
                    [ Type.namedWith [] "Msg" []
                    , Type.namedWith [] "Model" []
                    , Type.namedWith [] "Data" []
                    , Type.var "msg"
                    ]
                )
        }


annotation_ :
    { model : Type.Annotation
    , data : Type.Annotation
    , sharedMsg : Type.Annotation
    , msg : Type.Annotation
    }
annotation_ =
    { model =
        Type.alias
            moduleName_
            "Model"
            []
            (Type.record [ ( "showMenu", Type.bool ) ])
    , data = Type.alias moduleName_ "Data" [] Type.unit
    , sharedMsg = Type.namedWith [ "Shared" ] "SharedMsg" []
    , msg = Type.namedWith [ "Shared" ] "Msg" []
    }


make_ :
    { model : { showMenu : Elm.Expression } -> Elm.Expression
    , noOp : Elm.Expression
    , sharedMsg : Elm.Expression -> Elm.Expression
    , menuClicked : Elm.Expression
    }
make_ =
    { model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Shared" ]
                    "Model"
                    []
                    (Type.record [ ( "showMenu", Type.bool ) ])
                )
                (Elm.record [ Tuple.pair "showMenu" model_args.showMenu ])
    , noOp =
        Elm.value
            { importFrom = [ "Shared" ]
            , name = "NoOp"
            , annotation = Just (Type.namedWith [] "SharedMsg" [])
            }
    , sharedMsg =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Shared" ]
                    , name = "SharedMsg"
                    , annotation = Just (Type.namedWith [] "Msg" [])
                    }
                )
                [ ar0 ]
    , menuClicked =
        Elm.value
            { importFrom = [ "Shared" ]
            , name = "MenuClicked"
            , annotation = Just (Type.namedWith [] "Msg" [])
            }
    }


caseOf_ :
    { sharedMsg :
        Elm.Expression
        -> { sharedMsgTags_0_0 | noOp : Elm.Expression }
        -> Elm.Expression
    , msg :
        Elm.Expression
        -> { msgTags_1_0
            | sharedMsg : Elm.Expression -> Elm.Expression
            , menuClicked : Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { sharedMsg =
        \sharedMsgExpression sharedMsgTags ->
            Elm.Case.custom
                sharedMsgExpression
                (Type.namedWith [ "Shared" ] "SharedMsg" [])
                [ Elm.Case.branch0 "NoOp" sharedMsgTags.noOp ]
    , msg =
        \msgExpression msgTags ->
            Elm.Case.custom
                msgExpression
                (Type.namedWith [ "Shared" ] "Msg" [])
                [ Elm.Case.branch1
                    "SharedMsg"
                    ( "sharedMsg", Type.namedWith [] "SharedMsg" [] )
                    msgTags.sharedMsg
                , Elm.Case.branch0 "MenuClicked" msgTags.menuClicked
                ]
    }


values_ : { template : Elm.Expression }
values_ =
    { template =
        Elm.value
            { importFrom = [ "Shared" ]
            , name = "template"
            , annotation =
                Just
                    (Type.namedWith
                        []
                        "SharedTemplate"
                        [ Type.namedWith [] "Msg" []
                        , Type.namedWith [] "Model" []
                        , Type.namedWith [] "Data" []
                        , Type.var "msg"
                        ]
                    )
            }
    }


