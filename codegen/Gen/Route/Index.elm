module Gen.Route.Index exposing (annotation_, make_, moduleName_, route, values_)

{-| 
@docs values_, make_, annotation_, route, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Route", "Index" ]


{-| route: StatefulRoute RouteParams Data ActionData Model Msg -}
route : Elm.Expression
route =
    Elm.value
        { importFrom = [ "Route", "Index" ]
        , name = "route"
        , annotation =
            Just
                (Type.namedWith
                    []
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
    , model : Type.Annotation
    , msg : Type.Annotation
    }
annotation_ =
    { actionData = Type.alias moduleName_ "ActionData" [] (Type.record [])
    , data =
        Type.alias
            moduleName_
            "Data"
            []
            (Type.record
                [ ( "pinnedProjects"
                  , Type.list (Type.namedWith [] "Project" [])
                  )
                , ( "homeProjects", Type.list (Type.namedWith [] "Project" []) )
                ]
            )
    , model =
        Type.alias
            moduleName_
            "Model"
            []
            (Type.record
                [ ( "ico", Type.namedWith [ "Icosahedron" ] "Model" [] )
                , ( "icoSize", Type.float )
                ]
            )
    , msg = Type.namedWith [ "Route", "Index" ] "Msg" []
    }


make_ :
    { actionData : actionData -> Elm.Expression
    , data :
        { pinnedProjects : Elm.Expression, homeProjects : Elm.Expression }
        -> Elm.Expression
    , model :
        { ico : Elm.Expression, icoSize : Elm.Expression } -> Elm.Expression
    }
make_ =
    { actionData =
        \actionData_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Index" ]
                    "ActionData"
                    []
                    (Type.record [])
                )
                (Elm.record [])
    , data =
        \data_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Index" ]
                    "Data"
                    []
                    (Type.record
                        [ ( "pinnedProjects"
                          , Type.list (Type.namedWith [] "Project" [])
                          )
                        , ( "homeProjects"
                          , Type.list (Type.namedWith [] "Project" [])
                          )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "pinnedProjects" data_args.pinnedProjects
                    , Tuple.pair "homeProjects" data_args.homeProjects
                    ]
                )
    , model =
        \model_args ->
            Elm.withType
                (Type.alias
                    [ "Route", "Index" ]
                    "Model"
                    []
                    (Type.record
                        [ ( "ico", Type.namedWith [ "Icosahedron" ] "Model" [] )
                        , ( "icoSize", Type.float )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "ico" model_args.ico
                    , Tuple.pair "icoSize" model_args.icoSize
                    ]
                )
    }


values_ : { route : Elm.Expression }
values_ =
    { route =
        Elm.value
            { importFrom = [ "Route", "Index" ]
            , name = "route"
            , annotation =
                Just
                    (Type.namedWith
                        []
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


