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
            (Type.record
                [ ( "ico", Type.namedWith [ "Icosahedron" ] "Model" [] ) ]
            )
    , data = Type.alias moduleName_ "Data" [] Type.unit
    , sharedMsg = Type.namedWith [ "Shared" ] "SharedMsg" []
    , msg = Type.namedWith [ "Shared" ] "Msg" []
    }


make_ :
    { model : { ico : Elm.Expression } -> Elm.Expression
    , noOp : Elm.Expression
    , sharedMsg : Elm.Expression -> Elm.Expression
    , icoMsg : Elm.Expression -> Elm.Expression
    }
make_ =
    { model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Shared" ]
                    "Model"
                    []
                    (Type.record
                        [ ( "ico", Type.namedWith [ "Icosahedron" ] "Model" [] )
                        ]
                    )
                )
                (Elm.record [ Tuple.pair "ico" model_args.ico ])
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
    , icoMsg =
        \ar0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Shared" ]
                    , name = "IcoMsg"
                    , annotation = Just (Type.namedWith [] "Msg" [])
                    }
                )
                [ ar0 ]
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
            , icoMsg : Elm.Expression -> Elm.Expression
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
                , Elm.Case.branch1
                    "IcoMsg"
                    ( "icosahedron.Msg"
                    , Type.namedWith [ "Icosahedron" ] "Msg" []
                    )
                    msgTags.icoMsg
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


