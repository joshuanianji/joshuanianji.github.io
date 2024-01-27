module Gen.Route.AllProjects exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs values_, make_, annotation_, route, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "AllProjects" ]


{-| route: StatelessRoute RouteParams Data ActionData -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "AllProjects" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    []
                    "StatelessRoute"
                    [ Type.namedWith [] "RouteParams" []
                    , Type.namedWith [] "Data" []
                    , Type.namedWith [] "ActionData" []
                    ]
                )
        }


annotation_ :
    { actionData : Type.Annotation
    , data : Type.Annotation
    , routeParams : Type.Annotation
    , msg : Type.Annotation
    , model : Type.Annotation
    }
annotation_ =
    { actionData =
        Type.alias
            moduleName_
            "ActionData"
            []
            (Type.namedWith
                [ "BackendTask" ]
                "BackendTask"
                [ Type.namedWith [ "FatalError" ] "FatalError" []
                , Type.list (Type.namedWith [] "RouteParams" [])
                ]
            )
    , data =
        Type.alias
            moduleName_
            "Data"
            []
            (Type.record
                [ ( "featured", Type.list (Type.namedWith [] "Project" []) )
                , ( "home", Type.list (Type.namedWith [] "Project" []) )
                , ( "other", Type.list (Type.namedWith [] "Project" []) )
                ]
            )
    , routeParams = Type.alias moduleName_ "RouteParams" [] (Type.record [])
    , msg = Type.alias moduleName_ "Msg" [] Type.unit
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    }


make_ :
    { data :
        { featured : Elm.Expression
        , home : Elm.Expression
        , other : Elm.Expression
        }
        -> Elm.Expression
    , routeParams : routeParams -> Elm.Expression
    , model : model -> Elm.Expression
    }
make_ =
    { data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "AllProjects" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "featured"
                          , Type.list (Type.namedWith [] "Project" [])
                          )
                        , ( "home", Type.list (Type.namedWith [] "Project" []) )
                        , ( "other"
                          , Type.list (Type.namedWith [] "Project" [])
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "featured" data_args.featured
                    , Tuple.pair "home" data_args.home
                    , Tuple.pair "other" data_args.other
                    ]
                )
    , routeParams =
        \routeParams_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "AllProjects" ]
                    "RouteParams"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "AllProjects" ]
                    "Model"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "AllProjects" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        []
                        "StatelessRoute"
                        [ Type.namedWith [] "RouteParams" []
                        , Type.namedWith [] "Data" []
                        , Type.namedWith [] "ActionData" []
                        ]
                    )
            }
    }


