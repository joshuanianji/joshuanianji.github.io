module Gen.Colours exposing (black, call_, darkGray, errorRed, gray, green, moduleName_, themeBlue, toCss, values_, warningRed, white, withAlpha)

{-| 
@docs values_, call_, themeBlue, errorRed, warningRed, green, gray, darkGray, white, black, toCss, withAlpha, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Colours" ]


{-| withAlpha: Float -> Color.Color -> Color.Color -}
withAlpha : Float -> Elm.Expression -> Elm.Expression
withAlpha withAlphaArg withAlphaArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Colours" ]
            , name = "withAlpha"
            , annotation =
                Just
                    (Type.function
                        [ Type.float, Type.namedWith [ "Color" ] "Color" [] ]
                        (Type.namedWith [ "Color" ] "Color" [])
                    )
            }
        )
        [ Elm.float withAlphaArg, withAlphaArg0 ]


{-| toCss: Color -> Css.Color -}
toCss : Elm.Expression -> Elm.Expression
toCss toCssArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Colours" ]
            , name = "toCss"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Color" [] ]
                        (Type.namedWith [ "Css" ] "Color" [])
                    )
            }
        )
        [ toCssArg ]


{-| black: Color -}
black : Elm.Expression
black =
    Elm.value
        { importFrom = [ "Colours" ]
        , name = "black"
        , annotation = Just (Type.namedWith [] "Color" [])
        }


{-| white: Color -}
white : Elm.Expression
white =
    Elm.value
        { importFrom = [ "Colours" ]
        , name = "white"
        , annotation = Just (Type.namedWith [] "Color" [])
        }


{-| darkGray: Color -}
darkGray : Elm.Expression
darkGray =
    Elm.value
        { importFrom = [ "Colours" ]
        , name = "darkGray"
        , annotation = Just (Type.namedWith [] "Color" [])
        }


{-| gray: Color -}
gray : Elm.Expression
gray =
    Elm.value
        { importFrom = [ "Colours" ]
        , name = "gray"
        , annotation = Just (Type.namedWith [] "Color" [])
        }


{-| green: Color -}
green : Elm.Expression
green =
    Elm.value
        { importFrom = [ "Colours" ]
        , name = "green"
        , annotation = Just (Type.namedWith [] "Color" [])
        }


{-| warningRed: Color -}
warningRed : Elm.Expression
warningRed =
    Elm.value
        { importFrom = [ "Colours" ]
        , name = "warningRed"
        , annotation = Just (Type.namedWith [] "Color" [])
        }


{-| errorRed: Color -}
errorRed : Elm.Expression
errorRed =
    Elm.value
        { importFrom = [ "Colours" ]
        , name = "errorRed"
        , annotation = Just (Type.namedWith [] "Color" [])
        }


{-| themeBlue: Color -}
themeBlue : Elm.Expression
themeBlue =
    Elm.value
        { importFrom = [ "Colours" ]
        , name = "themeBlue"
        , annotation = Just (Type.namedWith [] "Color" [])
        }


call_ :
    { withAlpha : Elm.Expression -> Elm.Expression -> Elm.Expression
    , toCss : Elm.Expression -> Elm.Expression
    }
call_ =
    { withAlpha =
        \withAlphaArg withAlphaArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Colours" ]
                    , name = "withAlpha"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.float
                                , Type.namedWith [ "Color" ] "Color" []
                                ]
                                (Type.namedWith [ "Color" ] "Color" [])
                            )
                    }
                )
                [ withAlphaArg, withAlphaArg0 ]
    , toCss =
        \toCssArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Colours" ]
                    , name = "toCss"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Color" [] ]
                                (Type.namedWith [ "Css" ] "Color" [])
                            )
                    }
                )
                [ toCssArg ]
    }


values_ :
    { withAlpha : Elm.Expression
    , toCss : Elm.Expression
    , black : Elm.Expression
    , white : Elm.Expression
    , darkGray : Elm.Expression
    , gray : Elm.Expression
    , green : Elm.Expression
    , warningRed : Elm.Expression
    , errorRed : Elm.Expression
    , themeBlue : Elm.Expression
    }
values_ =
    { withAlpha =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "withAlpha"
            , annotation =
                Just
                    (Type.function
                        [ Type.float, Type.namedWith [ "Color" ] "Color" [] ]
                        (Type.namedWith [ "Color" ] "Color" [])
                    )
            }
    , toCss =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "toCss"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Color" [] ]
                        (Type.namedWith [ "Css" ] "Color" [])
                    )
            }
    , black =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "black"
            , annotation = Just (Type.namedWith [] "Color" [])
            }
    , white =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "white"
            , annotation = Just (Type.namedWith [] "Color" [])
            }
    , darkGray =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "darkGray"
            , annotation = Just (Type.namedWith [] "Color" [])
            }
    , gray =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "gray"
            , annotation = Just (Type.namedWith [] "Color" [])
            }
    , green =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "green"
            , annotation = Just (Type.namedWith [] "Color" [])
            }
    , warningRed =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "warningRed"
            , annotation = Just (Type.namedWith [] "Color" [])
            }
    , errorRed =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "errorRed"
            , annotation = Just (Type.namedWith [] "Color" [])
            }
    , themeBlue =
        Elm.value
            { importFrom = [ "Colours" ]
            , name = "themeBlue"
            , annotation = Just (Type.namedWith [] "Color" [])
            }
    }


