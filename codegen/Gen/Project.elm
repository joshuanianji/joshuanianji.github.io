module Gen.Project exposing (annotation_, call_, caseOf_, getProjects, langToColor, langToString, make_, moduleName_, splitProjects, values_, view, viewFeatured)

{-| 
@docs values_, call_, caseOf_, make_, annotation_, splitProjects, getProjects, langToString, langToColor, view, viewFeatured, moduleName_
-}


import Elm
import Elm.Annotation as Type
import Elm.Case


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "Project" ]


{-| viewFeatured: Project -> Html msg -}
viewFeatured : Elm.Expression -> Elm.Expression
viewFeatured viewFeaturedArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Project" ]
            , name = "viewFeatured"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Project" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewFeaturedArg ]


{-| view: Project -> Html msg -}
view : Elm.Expression -> Elm.Expression
view viewArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Project" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Project" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
        )
        [ viewArg ]


{-| langToColor: Language -> Color.Color -}
langToColor : Elm.Expression -> Elm.Expression
langToColor langToColorArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Project" ]
            , name = "langToColor"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Language" [] ]
                        (Type.namedWith [ "Color" ] "Color" [])
                    )
            }
        )
        [ langToColorArg ]


{-| langToString: Language -> String -}
langToString : Elm.Expression -> Elm.Expression
langToString langToStringArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Project" ]
            , name = "langToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Language" [] ]
                        Type.string
                    )
            }
        )
        [ langToStringArg ]


{-| getProjects: String -> BackendTask FatalError (List Project) -}
getProjects : String -> Elm.Expression
getProjects getProjectsArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Project" ]
            , name = "getProjects"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.list (Type.namedWith [] "Project" [])
                            ]
                        )
                    )
            }
        )
        [ Elm.string getProjectsArg ]


{-| splitProjects: 
    List Project
    -> BackendTask FatalError { featured : List Project
    , home : List Project
    , other : List Project
    }
-}
splitProjects : List Elm.Expression -> Elm.Expression
splitProjects splitProjectsArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "Project" ]
            , name = "splitProjects"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.namedWith [] "Project" []) ]
                        (Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.record
                                [ ( "featured"
                                  , Type.list (Type.namedWith [] "Project" [])
                                  )
                                , ( "home"
                                  , Type.list (Type.namedWith [] "Project" [])
                                  )
                                , ( "other"
                                  , Type.list (Type.namedWith [] "Project" [])
                                  )
                                ]
                            ]
                        )
                    )
            }
        )
        [ Elm.list splitProjectsArg ]


annotation_ :
    { project : Type.Annotation
    , displayType : Type.Annotation
    , language : Type.Annotation
    }
annotation_ =
    { project =
        Type.alias
            moduleName_
            "Project"
            []
            (Type.record
                [ ( "id", Type.string )
                , ( "name", Type.string )
                , ( "blurb", Type.string )
                , ( "link", Type.namedWith [] "Maybe" [ Type.string ] )
                , ( "githubLink", Type.namedWith [] "Maybe" [ Type.string ] )
                , ( "year", Type.int )
                , ( "languages", Type.list (Type.namedWith [] "Language" []) )
                , ( "concepts"
                  , Type.namedWith [] "Maybe" [ Type.list Type.string ]
                  )
                , ( "displayType", Type.namedWith [] "DisplayType" [] )
                , ( "mobile", Type.bool )
                , ( "imgPath", Type.string )
                ]
            )
    , displayType = Type.namedWith [ "Project" ] "DisplayType" []
    , language = Type.namedWith [ "Project" ] "Language" []
    }


make_ :
    { project :
        { id : Elm.Expression
        , name : Elm.Expression
        , blurb : Elm.Expression
        , link : Elm.Expression
        , githubLink : Elm.Expression
        , year : Elm.Expression
        , languages : Elm.Expression
        , concepts : Elm.Expression
        , displayType : Elm.Expression
        , mobile : Elm.Expression
        , imgPath : Elm.Expression
        }
        -> Elm.Expression
    , featured : Elm.Expression
    , home : Elm.Expression
    , other : Elm.Expression
    , elm : Elm.Expression
    , python : Elm.Expression
    , rust : Elm.Expression
    , javascript : Elm.Expression
    , docker : Elm.Expression
    , typescript : Elm.Expression
    , shell : Elm.Expression
    , cPP : Elm.Expression
    , c : Elm.Expression
    , aNTLR4 : Elm.Expression
    }
make_ =
    { project =
        \project_args ->
            Elm.withType
                (Type.alias
                    [ "Project" ]
                    "Project"
                    []
                    (Type.record
                        [ ( "id", Type.string )
                        , ( "name", Type.string )
                        , ( "blurb", Type.string )
                        , ( "link", Type.namedWith [] "Maybe" [ Type.string ] )
                        , ( "githubLink"
                          , Type.namedWith [] "Maybe" [ Type.string ]
                          )
                        , ( "year", Type.int )
                        , ( "languages"
                          , Type.list (Type.namedWith [] "Language" [])
                          )
                        , ( "concepts"
                          , Type.namedWith [] "Maybe" [ Type.list Type.string ]
                          )
                        , ( "displayType", Type.namedWith [] "DisplayType" [] )
                        , ( "mobile", Type.bool )
                        , ( "imgPath", Type.string )
                        ]
                    )
                )
                (Elm.record
                    [ Tuple.pair "id" project_args.id
                    , Tuple.pair "name" project_args.name
                    , Tuple.pair "blurb" project_args.blurb
                    , Tuple.pair "link" project_args.link
                    , Tuple.pair "githubLink" project_args.githubLink
                    , Tuple.pair "year" project_args.year
                    , Tuple.pair "languages" project_args.languages
                    , Tuple.pair "concepts" project_args.concepts
                    , Tuple.pair "displayType" project_args.displayType
                    , Tuple.pair "mobile" project_args.mobile
                    , Tuple.pair "imgPath" project_args.imgPath
                    ]
                )
    , featured =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Featured"
            , annotation = Just (Type.namedWith [] "DisplayType" [])
            }
    , home =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Home"
            , annotation = Just (Type.namedWith [] "DisplayType" [])
            }
    , other =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Other"
            , annotation = Just (Type.namedWith [] "DisplayType" [])
            }
    , elm =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Elm"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    , python =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Python"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    , rust =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Rust"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    , javascript =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Javascript"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    , docker =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Docker"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    , typescript =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Typescript"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    , shell =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "Shell"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    , cPP =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "CPP"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    , c =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "C"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    , aNTLR4 =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "ANTLR4"
            , annotation = Just (Type.namedWith [] "Language" [])
            }
    }


caseOf_ :
    { displayType :
        Elm.Expression
        -> { displayTypeTags_0_0
            | featured : Elm.Expression
            , home : Elm.Expression
            , other : Elm.Expression
        }
        -> Elm.Expression
    , language :
        Elm.Expression
        -> { languageTags_1_0
            | elm : Elm.Expression
            , python : Elm.Expression
            , rust : Elm.Expression
            , javascript : Elm.Expression
            , docker : Elm.Expression
            , typescript : Elm.Expression
            , shell : Elm.Expression
            , cPP : Elm.Expression
            , c : Elm.Expression
            , aNTLR4 : Elm.Expression
        }
        -> Elm.Expression
    }
caseOf_ =
    { displayType =
        \displayTypeExpression displayTypeTags ->
            Elm.Case.custom
                displayTypeExpression
                (Type.namedWith [ "Project" ] "DisplayType" [])
                [ Elm.Case.branch0 "Featured" displayTypeTags.featured
                , Elm.Case.branch0 "Home" displayTypeTags.home
                , Elm.Case.branch0 "Other" displayTypeTags.other
                ]
    , language =
        \languageExpression languageTags ->
            Elm.Case.custom
                languageExpression
                (Type.namedWith [ "Project" ] "Language" [])
                [ Elm.Case.branch0 "Elm" languageTags.elm
                , Elm.Case.branch0 "Python" languageTags.python
                , Elm.Case.branch0 "Rust" languageTags.rust
                , Elm.Case.branch0 "Javascript" languageTags.javascript
                , Elm.Case.branch0 "Docker" languageTags.docker
                , Elm.Case.branch0 "Typescript" languageTags.typescript
                , Elm.Case.branch0 "Shell" languageTags.shell
                , Elm.Case.branch0 "CPP" languageTags.cPP
                , Elm.Case.branch0 "C" languageTags.c
                , Elm.Case.branch0 "ANTLR4" languageTags.aNTLR4
                ]
    }


call_ :
    { viewFeatured : Elm.Expression -> Elm.Expression
    , view : Elm.Expression -> Elm.Expression
    , langToColor : Elm.Expression -> Elm.Expression
    , langToString : Elm.Expression -> Elm.Expression
    , getProjects : Elm.Expression -> Elm.Expression
    , splitProjects : Elm.Expression -> Elm.Expression
    }
call_ =
    { viewFeatured =
        \viewFeaturedArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Project" ]
                    , name = "viewFeatured"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Project" [] ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ viewFeaturedArg ]
    , view =
        \viewArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Project" ]
                    , name = "view"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Project" [] ]
                                (Type.namedWith [] "Html" [ Type.var "msg" ])
                            )
                    }
                )
                [ viewArg ]
    , langToColor =
        \langToColorArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Project" ]
                    , name = "langToColor"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Language" [] ]
                                (Type.namedWith [ "Color" ] "Color" [])
                            )
                    }
                )
                [ langToColorArg ]
    , langToString =
        \langToStringArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Project" ]
                    , name = "langToString"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith [] "Language" [] ]
                                Type.string
                            )
                    }
                )
                [ langToStringArg ]
    , getProjects =
        \getProjectsArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Project" ]
                    , name = "getProjects"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.string ]
                                (Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.list (Type.namedWith [] "Project" [])
                                    ]
                                )
                            )
                    }
                )
                [ getProjectsArg ]
    , splitProjects =
        \splitProjectsArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "Project" ]
                    , name = "splitProjects"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list (Type.namedWith [] "Project" []) ]
                                (Type.namedWith
                                    []
                                    "BackendTask"
                                    [ Type.namedWith [] "FatalError" []
                                    , Type.record
                                        [ ( "featured"
                                          , Type.list
                                                (Type.namedWith [] "Project" [])
                                          )
                                        , ( "home"
                                          , Type.list
                                                (Type.namedWith [] "Project" [])
                                          )
                                        , ( "other"
                                          , Type.list
                                                (Type.namedWith [] "Project" [])
                                          )
                                        ]
                                    ]
                                )
                            )
                    }
                )
                [ splitProjectsArg ]
    }


values_ :
    { viewFeatured : Elm.Expression
    , view : Elm.Expression
    , langToColor : Elm.Expression
    , langToString : Elm.Expression
    , getProjects : Elm.Expression
    , splitProjects : Elm.Expression
    }
values_ =
    { viewFeatured =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "viewFeatured"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Project" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    , view =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "view"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Project" [] ]
                        (Type.namedWith [] "Html" [ Type.var "msg" ])
                    )
            }
    , langToColor =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "langToColor"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Language" [] ]
                        (Type.namedWith [ "Color" ] "Color" [])
                    )
            }
    , langToString =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "langToString"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith [] "Language" [] ]
                        Type.string
                    )
            }
    , getProjects =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "getProjects"
            , annotation =
                Just
                    (Type.function
                        [ Type.string ]
                        (Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.list (Type.namedWith [] "Project" [])
                            ]
                        )
                    )
            }
    , splitProjects =
        Elm.value
            { importFrom = [ "Project" ]
            , name = "splitProjects"
            , annotation =
                Just
                    (Type.function
                        [ Type.list (Type.namedWith [] "Project" []) ]
                        (Type.namedWith
                            []
                            "BackendTask"
                            [ Type.namedWith [] "FatalError" []
                            , Type.record
                                [ ( "featured"
                                  , Type.list (Type.namedWith [] "Project" [])
                                  )
                                , ( "home"
                                  , Type.list (Type.namedWith [] "Project" [])
                                  )
                                , ( "other"
                                  , Type.list (Type.namedWith [] "Project" [])
                                  )
                                ]
                            ]
                        )
                    )
            }
    }


