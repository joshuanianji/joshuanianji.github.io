module Gen.Pages.Script exposing (annotation_, call_, caseOf_, log, make_, moduleName_, values_, withCliOptions, withoutCliOptions, writeFile)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, log, writeFile, withoutCliOptions, withCliOptions, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Pages", "Script" ]


{-| Same as [`withoutCliOptions`](#withoutCliOptions), but allows you to define a CLI Options Parser so the user can
pass in additional options for the script.

Uses <https://package.elm-lang.org/packages/dillonkearns/elm-cli-options-parser/latest/>.

Read more at <https://elm-pages.com/docs/elm-pages-scripts/#adding-command-line-options>.

withCliOptions: 
    Cli.Program.Config cliOptions
    -> (cliOptions -> BackendTask.BackendTask FatalError.FatalError ())
    -> Pages.Script.Script
-}
withCliOptions :
    Elm.Expression -> (Elm.Expression -> Elm.Expression) -> Elm.Expression
withCliOptions withCliOptionsArg withCliOptionsArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "Pages", "Script" ]
            , name = "withCliOptions"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Cli", "Program" ]
                            "Config"
                            [ Type.var "cliOptions" ]
                        , Type.function
                            [ Type.var "cliOptions" ]
                            (Type.namedWith
                                [ "BackendTask" ]
                                "BackendTask"
                                [ Type.namedWith
                                    [ "FatalError" ]
                                    "FatalError"
                                    []
                                , Type.unit
                                ]
                            )
                        ]
                        (Type.namedWith [ "Pages", "Script" ] "Script" [])
                    )
            }
        )
        [ withCliOptionsArg
        , Elm.functionReduced "withCliOptionsUnpack" withCliOptionsArg0
        ]


{-| Define a simple Script (no CLI Options).

    module MyScript exposing (run)

    import BackendTask
    import Pages.Script as Script

    run =
        Script.withoutCliOptions
            (Script.log "Hello!"
                |> BackendTask.allowFatal
            )

withoutCliOptions: BackendTask.BackendTask FatalError.FatalError () -> Pages.Script.Script
-}
withoutCliOptions : Elm.Expression -> Elm.Expression
withoutCliOptions withoutCliOptionsArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Pages", "Script" ]
            , name = "withoutCliOptions"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.unit
                            ]
                        ]
                        (Type.namedWith [ "Pages", "Script" ] "Script" [])
                    )
            }
        )
        [ withoutCliOptionsArg ]


{-| Write a file to the file system.

    module MyScript exposing (run)

    import BackendTask
    import Pages.Script as Script

    run =
        Script.withoutCliOptions
            (Script.writeFile
                { path = "hello.json"
                , body = """{ "message": "Hello, World!" }"""
                }
                |> BackendTask.allowFatal
            )

writeFile: 
    { path : String, body : String }
    -> BackendTask.BackendTask { fatal : FatalError.FatalError
    , recoverable : Pages.Script.Error
    } ()
-}
writeFile : { path : String, body : String } -> Elm.Expression
writeFile writeFileArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Pages", "Script" ]
            , name = "writeFile"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "path", Type.string ), ( "body", Type.string ) ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.record
                                [ ( "fatal"
                                  , Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                  )
                                , ( "recoverable"
                                  , Type.namedWith
                                        [ "Pages", "Script" ]
                                        "Error"
                                        []
                                  )
                                ]
                            , Type.unit
                            ]
                        )
                    )
            }
        )
        [ Elm.record
            [ Tuple.pair "path" (Elm.string writeFileArg.path)
            , Tuple.pair "body" (Elm.string writeFileArg.body)
            ]
        ]


{-| Log to stdout.

    module MyScript exposing (run)

    import BackendTask
    import Pages.Script as Script

    run =
        Script.withoutCliOptions
            (Script.log "Hello!"
                |> BackendTask.allowFatal
            )

log: String -> BackendTask.BackendTask error ()
-}
log : String -> Elm.Expression
log logArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Pages", "Script" ]
            , name = "log"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.unit ]
                        )
                    )
            }
        )
        [ Elm.string logArg ]


annotation_ : { script : Type.Annotation, error : Type.Annotation }
annotation_ =
    { script =
        Type.alias
            moduleName_
            "Script"
            []
            (Type.namedWith [ "Pages", "Internal", "Script" ] "Script" [])
    , error = Type.namedWith [ "Pages", "Script" ] "Error" []
    }


make_ : { fileWriteError : Elm.Expression }
make_ =
    { fileWriteError =
        Elm.value
            { importFrom = [ "Pages", "Script" ]
            , name = "FileWriteError"
            , annotation = Just (Type.namedWith [] "Error" [])
            }
    }


caseOf_ :
    { error :
        Elm.Expression
        -> { errorTags_0_0 | fileWriteError : Elm.Expression }
        -> Elm.Expression
    }
caseOf_ =
    { error =
        \errorExpression errorTags ->
            Elm.Case.custom
                errorExpression
                (Type.namedWith [ "Pages", "Script" ] "Error" [])
                [ Elm.Case.branch0 "FileWriteError" errorTags.fileWriteError ]
    }


call_ :
    { withCliOptions : Elm.Expression -> Elm.Expression -> Elm.Expression
    , withoutCliOptions : Elm.Expression -> Elm.Expression
    , writeFile : Elm.Expression -> Elm.Expression
    , log : Elm.Expression -> Elm.Expression
    }
call_ =
    { withCliOptions =
        \withCliOptionsArg withCliOptionsArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Pages", "Script" ]
                    , name = "withCliOptions"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Cli", "Program" ]
                                    "Config"
                                    [ Type.var "cliOptions" ]
                                , Type.function
                                    [ Type.var "cliOptions" ]
                                    (Type.namedWith
                                        [ "BackendTask" ]
                                        "BackendTask"
                                        [ Type.namedWith
                                            [ "FatalError" ]
                                            "FatalError"
                                            []
                                        , Type.unit
                                        ]
                                    )
                                ]
                                (Type.namedWith
                                    [ "Pages", "Script" ]
                                    "Script"
                                    []
                                )
                            )
                    }
                )
                [ withCliOptionsArg, withCliOptionsArg0 ]
    , withoutCliOptions =
        \withoutCliOptionsArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Pages", "Script" ]
                    , name = "withoutCliOptions"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                    , Type.unit
                                    ]
                                ]
                                (Type.namedWith
                                    [ "Pages", "Script" ]
                                    "Script"
                                    []
                                )
                            )
                    }
                )
                [ withoutCliOptionsArg ]
    , writeFile =
        \writeFileArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Pages", "Script" ]
                    , name = "writeFile"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.record
                                    [ ( "path", Type.string )
                                    , ( "body", Type.string )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.record
                                        [ ( "fatal"
                                          , Type.namedWith
                                                [ "FatalError" ]
                                                "FatalError"
                                                []
                                          )
                                        , ( "recoverable"
                                          , Type.namedWith
                                                [ "Pages", "Script" ]
                                                "Error"
                                                []
                                          )
                                        ]
                                    , Type.unit
                                    ]
                                )
                            )
                    }
                )
                [ writeFileArg ]
    , log =
        \logArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Pages", "Script" ]
                    , name = "log"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.unit ]
                                )
                            )
                    }
                )
                [ logArg ]
    }


values_ :
    { withCliOptions : Elm.Expression
    , withoutCliOptions : Elm.Expression
    , writeFile : Elm.Expression
    , log : Elm.Expression
    }
values_ =
    { withCliOptions =
        Elm.value
            { importFrom = [ "Pages", "Script" ]
            , name = "withCliOptions"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Cli", "Program" ]
                            "Config"
                            [ Type.var "cliOptions" ]
                        , Type.function
                            [ Type.var "cliOptions" ]
                            (Type.namedWith
                                [ "BackendTask" ]
                                "BackendTask"
                                [ Type.namedWith
                                    [ "FatalError" ]
                                    "FatalError"
                                    []
                                , Type.unit
                                ]
                            )
                        ]
                        (Type.namedWith [ "Pages", "Script" ] "Script" [])
                    )
            }
    , withoutCliOptions =
        Elm.value
            { importFrom = [ "Pages", "Script" ]
            , name = "withoutCliOptions"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.unit
                            ]
                        ]
                        (Type.namedWith [ "Pages", "Script" ] "Script" [])
                    )
            }
    , writeFile =
        Elm.value
            { importFrom = [ "Pages", "Script" ]
            , name = "writeFile"
            , annotation =
                Just
                    (Type.function
                        [ Type.record
                            [ ( "path", Type.string ), ( "body", Type.string ) ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.record
                                [ ( "fatal"
                                  , Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                  )
                                , ( "recoverable"
                                  , Type.namedWith
                                        [ "Pages", "Script" ]
                                        "Error"
                                        []
                                  )
                                ]
                            , Type.unit
                            ]
                        )
                    )
            }
    , log =
        Elm.value
            { importFrom = [ "Pages", "Script" ]
            , name = "log"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.unit ]
                        )
                    )
            }
    }


