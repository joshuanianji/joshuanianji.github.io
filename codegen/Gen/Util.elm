module Gen.Util exposing (annotation_, call_, caseOf_, flexDirection, make_, moduleName_, values_)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, flexDirection, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Util" ]


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


call_ : { flexDirection : Elm.Expression -> Elm.Expression }
call_ =
    { flexDirection =
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


values_ : { flexDirection : Elm.Expression }
values_ =
    { flexDirection =
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


