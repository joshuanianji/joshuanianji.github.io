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


{-| route: RouteBuilder.StatefulRoute RouteParams Data ActionData Model Msg -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "AllProjects" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    [ "RouteBuilder" ]
                    "StatefulRoute"
                    [ Type.namedWith [] "RouteParams" []
                    , Type.namedWith [] "Data" []
                    , Type.namedWith [] "ActionData" []
                    , Type.namedWith [] "Model" []
                    , Type.namedWith [] "Msg" []
                    ]
                )
        }


annotation_ :
    { actionData : Type.Annotation
    , data : Type.Annotation
    , routeParams : Type.Annotation
    , model : Type.Annotation
    , msg : Type.Annotation
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
    , data = Type.alias moduleName_ "Data" [] (Type.record [])
    , routeParams = Type.alias moduleName_ "RouteParams" [] (Type.record [])
    , model = Type.alias moduleName_ "Model" [] (Type.record [])
    , msg = Type.namedWith [ "Route", "AllProjects" ] "Msg" []
    }


make_ :
    { data : data -> Elm.Expression
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
                    (Type.record [])
                )
                (Elm.record [])
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
                        [ "RouteBuilder" ]
                        "StatefulRoute"
                        [ Type.namedWith [] "RouteParams" []
                        , Type.namedWith [] "Data" []
                        , Type.namedWith [] "ActionData" []
                        , Type.namedWith [] "Model" []
                        , Type.namedWith [] "Msg" []
                        ]
                    )
            }
    }


