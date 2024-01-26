module Gen.BackendTask exposing (allowFatal, andMap, andThen, annotation_, call_, combine, fail, fromResult, map, map2, map3, map4, map5, map6, map7, map8, map9, mapError, moduleName_, onError, resolve, succeed, toResult, values_)

{-| 
@docs values_, call_, annotation_, toResult, onError, mapError, allowFatal, map9, map8, map7, map6, map5, map4, map3, map2, andMap, combine, resolve, andThen, fromResult, fail, succeed, map, moduleName_
-}


import Elm
import Elm.Annotation as Type


{-| The name of this module. -}
moduleName_ : List String
moduleName_ =
    [ "BackendTask" ]


{-| Transform a request into an arbitrary value. The same underlying task will be performed,
but mapping allows you to change the resulting values by applying functions to the results.

    import BackendTask
    import BackendTask.Http
    import Json.Decode as Decode exposing (Decoder)

    starsMessage =
        BackendTask.Http.getJson
            "https://api.github.com/repos/dillonkearns/elm-pages"
            (Decode.field "stargazers_count" Decode.int)
            |> BackendTask.map
                (\stars -> "⭐️ " ++ String.fromInt stars)

map: (a -> b) -> BackendTask.BackendTask error a -> BackendTask.BackendTask error b
-}
map : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
map mapArg mapArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "a" ] (Type.var "b")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "b" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "mapUnpack" mapArg, mapArg0 ]


{-| This is useful for prototyping with some hardcoded data, or for having a view that doesn't have any StaticHttp data.

    import BackendTask

    view :
        List ( PagePath, Metadata )
        ->
            { path : PagePath
            , frontmatter : Metadata
            }
        ->
            StaticHttp.Request
                { view : Model -> View -> { title : String, body : Html Msg }
                , head : List (Head.Tag Pages.PathKey)
                }
    view siteMetadata page =
        StaticHttp.succeed
            { view =
                \model viewForPage ->
                    mainView model viewForPage
            , head = head page.frontmatter
            }

succeed: a -> BackendTask.BackendTask error a
-}
succeed : Elm.Expression -> Elm.Expression
succeed succeedArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "succeed"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "a" ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        )
                    )
            }
        )
        [ succeedArg ]


{-| fail: error -> BackendTask.BackendTask error a -}
fail : Elm.Expression -> Elm.Expression
fail failArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "fail"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "error" ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        )
                    )
            }
        )
        [ failArg ]


{-| Turn `Ok` into `BackendTask.succeed` and `Err` into `BackendTask.fail`.

fromResult: Result.Result error value -> BackendTask.BackendTask error value
-}
fromResult : Elm.Expression -> Elm.Expression
fromResult fromResultArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "fromResult"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Result" ]
                            "Result"
                            [ Type.var "error", Type.var "value" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value" ]
                        )
                    )
            }
        )
        [ fromResultArg ]


{-| Build off of the response from a previous `BackendTask` request to build a follow-up request. You can use the data
from the previous response to build up the URL, headers, etc. that you send to the subsequent request.

    import BackendTask
    import Json.Decode as Decode exposing (Decoder)

    licenseData : BackendTask String
    licenseData =
        BackendTask.Http.get
            (Secrets.succeed "https://api.github.com/repos/dillonkearns/elm-pages")
            (Decode.at [ "license", "url" ] Decode.string)
            |> BackendTask.andThen
                (\licenseUrl ->
                    BackendTask.Http.get (Secrets.succeed licenseUrl) (Decode.field "description" Decode.string)
                )

andThen: 
    (a -> BackendTask.BackendTask error b)
    -> BackendTask.BackendTask error a
    -> BackendTask.BackendTask error b
-}
andThen : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
andThen andThenArg andThenArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "andThen"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a" ]
                            (Type.namedWith
                                [ "BackendTask" ]
                                "BackendTask"
                                [ Type.var "error", Type.var "b" ]
                            )
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "b" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "andThenUnpack" andThenArg, andThenArg0 ]


{-| Helper to remove an inner layer of Request wrapping.

resolve: 
    BackendTask.BackendTask error (List (BackendTask.BackendTask error value))
    -> BackendTask.BackendTask error (List value)
-}
resolve : Elm.Expression -> Elm.Expression
resolve resolveArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "resolve"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error"
                            , Type.list
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value" ]
                                )
                            ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.list (Type.var "value") ]
                        )
                    )
            }
        )
        [ resolveArg ]


{-| Turn a list of `BackendTask`s into a single one.

    import BackendTask
    import Json.Decode as Decode exposing (Decoder)

    type alias Pokemon =
        { name : String
        , sprite : String
        }

    pokemonDetailRequest : BackendTask (List Pokemon)
    pokemonDetailRequest =
        BackendTask.Http.getJson
            "https://pokeapi.co/api/v2/pokemon/?limit=3"
            (Decode.field "results"
                (Decode.list
                    (Decode.map2 Tuple.pair
                        (Decode.field "name" Decode.string)
                        (Decode.field "url" Decode.string)
                        |> Decode.map
                            (\( name, url ) ->
                                BackendTask.Http.getJson url
                                    (Decode.at
                                        [ "sprites", "front_default" ]
                                        Decode.string
                                        |> Decode.map (Pokemon name)
                                    )
                            )
                    )
                )
            )
            |> BackendTask.andThen BackendTask.combine

combine: 
    List (BackendTask.BackendTask error value)
    -> BackendTask.BackendTask error (List value)
-}
combine : List Elm.Expression -> Elm.Expression
combine combineArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "combine"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "BackendTask" ]
                                "BackendTask"
                                [ Type.var "error", Type.var "value" ]
                            )
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.list (Type.var "value") ]
                        )
                    )
            }
        )
        [ Elm.list combineArg ]


{-| A helper for combining `BackendTask`s in pipelines.

andMap: 
    BackendTask.BackendTask error a
    -> BackendTask.BackendTask error (a -> b)
    -> BackendTask.BackendTask error b
-}
andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
andMap andMapArg andMapArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "andMap"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error"
                            , Type.function [ Type.var "a" ] (Type.var "b")
                            ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "b" ]
                        )
                    )
            }
        )
        [ andMapArg, andMapArg0 ]


{-| Like map, but it takes in two `Request`s.

    view siteMetadata page =
        StaticHttp.map2
            (\elmPagesStars elmMarkdownStars ->
                { view =
                    \model viewForPage ->
                        { title = "Repo Stargazers"
                        , body = starsView elmPagesStars elmMarkdownStars
                        }
                , head = head elmPagesStars elmMarkdownStars
                }
            )
            (get
                (Secrets.succeed "https://api.github.com/repos/dillonkearns/elm-pages")
                (Decode.field "stargazers_count" Decode.int)
            )
            (get
                (Secrets.succeed "https://api.github.com/repos/dillonkearns/elm-markdown")
                (Decode.field "stargazers_count" Decode.int)
            )

map2: 
    (a -> b -> c)
    -> BackendTask.BackendTask error a
    -> BackendTask.BackendTask error b
    -> BackendTask.BackendTask error c
-}
map2 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map2 map2Arg map2Arg0 map2Arg1 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map2"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a", Type.var "b" ]
                            (Type.var "c")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "b" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "c" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map2Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced "unpack" (map2Arg functionReducedUnpack)
            )
        , map2Arg0
        , map2Arg1
        ]


{-| map3: 
    (value1 -> value2 -> value3 -> valueCombined)
    -> BackendTask.BackendTask error value1
    -> BackendTask.BackendTask error value2
    -> BackendTask.BackendTask error value3
    -> BackendTask.BackendTask error valueCombined
-}
map3 :
    (Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map3 map3Arg map3Arg0 map3Arg1 map3Arg2 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map3"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map3Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (map3Arg functionReducedUnpack
                                functionReducedUnpack0
                            )
                    )
            )
        , map3Arg0
        , map3Arg1
        , map3Arg2
        ]


{-| map4: 
    (value1 -> value2 -> value3 -> value4 -> valueCombined)
    -> BackendTask.BackendTask error value1
    -> BackendTask.BackendTask error value2
    -> BackendTask.BackendTask error value3
    -> BackendTask.BackendTask error value4
    -> BackendTask.BackendTask error valueCombined
-}
map4 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map4 map4Arg map4Arg0 map4Arg1 map4Arg2 map4Arg3 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map4"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map4Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (map4Arg functionReducedUnpack
                                         functionReducedUnpack0
                                        functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                    )
                            )
                    )
            )
        , map4Arg0
        , map4Arg1
        , map4Arg2
        , map4Arg3
        ]


{-| map5: 
    (value1 -> value2 -> value3 -> value4 -> value5 -> valueCombined)
    -> BackendTask.BackendTask error value1
    -> BackendTask.BackendTask error value2
    -> BackendTask.BackendTask error value3
    -> BackendTask.BackendTask error value4
    -> BackendTask.BackendTask error value5
    -> BackendTask.BackendTask error valueCombined
-}
map5 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map5 map5Arg map5Arg0 map5Arg1 map5Arg2 map5Arg3 map5Arg4 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map5"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map5Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (map5Arg functionReducedUnpack
                                                 functionReducedUnpack0
                                                 functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                            )
                                    )
                            )
                    )
            )
        , map5Arg0
        , map5Arg1
        , map5Arg2
        , map5Arg3
        , map5Arg4
        ]


{-| map6: 
    (value1 -> value2 -> value3 -> value4 -> value5 -> value6 -> valueCombined)
    -> BackendTask.BackendTask error value1
    -> BackendTask.BackendTask error value2
    -> BackendTask.BackendTask error value3
    -> BackendTask.BackendTask error value4
    -> BackendTask.BackendTask error value5
    -> BackendTask.BackendTask error value6
    -> BackendTask.BackendTask error valueCombined
-}
map6 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map6 map6Arg map6Arg0 map6Arg1 map6Arg2 map6Arg3 map6Arg4 map6Arg5 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map6"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            , Type.var "value6"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value6" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map6Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (\functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                Elm.functionReduced
                                                    "unpack"
                                                    (map6Arg
                                                         functionReducedUnpack
                                                         functionReducedUnpack0
                                                         functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                         functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                                        functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                    )
                                            )
                                    )
                            )
                    )
            )
        , map6Arg0
        , map6Arg1
        , map6Arg2
        , map6Arg3
        , map6Arg4
        , map6Arg5
        ]


{-| map7: 
    (value1
    -> value2
    -> value3
    -> value4
    -> value5
    -> value6
    -> value7
    -> valueCombined)
    -> BackendTask.BackendTask error value1
    -> BackendTask.BackendTask error value2
    -> BackendTask.BackendTask error value3
    -> BackendTask.BackendTask error value4
    -> BackendTask.BackendTask error value5
    -> BackendTask.BackendTask error value6
    -> BackendTask.BackendTask error value7
    -> BackendTask.BackendTask error valueCombined
-}
map7 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map7 map7Arg map7Arg0 map7Arg1 map7Arg2 map7Arg3 map7Arg4 map7Arg5 map7Arg6 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map7"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            , Type.var "value6"
                            , Type.var "value7"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value6" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value7" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map7Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (\functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                Elm.functionReduced
                                                    "unpack"
                                                    (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                        Elm.functionReduced
                                                            "unpack"
                                                            (map7Arg
                                                                 functionReducedUnpack
                                                                 functionReducedUnpack0
                                                                 functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                                 functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                                                 functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                            )
                                                    )
                                            )
                                    )
                            )
                    )
            )
        , map7Arg0
        , map7Arg1
        , map7Arg2
        , map7Arg3
        , map7Arg4
        , map7Arg5
        , map7Arg6
        ]


{-| map8: 
    (value1
    -> value2
    -> value3
    -> value4
    -> value5
    -> value6
    -> value7
    -> value8
    -> valueCombined)
    -> BackendTask.BackendTask error value1
    -> BackendTask.BackendTask error value2
    -> BackendTask.BackendTask error value3
    -> BackendTask.BackendTask error value4
    -> BackendTask.BackendTask error value5
    -> BackendTask.BackendTask error value6
    -> BackendTask.BackendTask error value7
    -> BackendTask.BackendTask error value8
    -> BackendTask.BackendTask error valueCombined
-}
map8 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map8 map8Arg map8Arg0 map8Arg1 map8Arg2 map8Arg3 map8Arg4 map8Arg5 map8Arg6 map8Arg7 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map8"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            , Type.var "value6"
                            , Type.var "value7"
                            , Type.var "value8"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value6" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value7" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value8" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map8Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (\functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                Elm.functionReduced
                                                    "unpack"
                                                    (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                        Elm.functionReduced
                                                            "unpack"
                                                            (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                                Elm.functionReduced
                                                                    "unpack"
                                                                    (map8Arg
                                                                         functionReducedUnpack
                                                                         functionReducedUnpack0
                                                                         functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                                         functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                                                         functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                         functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                        functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                    )
                                                            )
                                                    )
                                            )
                                    )
                            )
                    )
            )
        , map8Arg0
        , map8Arg1
        , map8Arg2
        , map8Arg3
        , map8Arg4
        , map8Arg5
        , map8Arg6
        , map8Arg7
        ]


{-| map9: 
    (value1
    -> value2
    -> value3
    -> value4
    -> value5
    -> value6
    -> value7
    -> value8
    -> value9
    -> valueCombined)
    -> BackendTask.BackendTask error value1
    -> BackendTask.BackendTask error value2
    -> BackendTask.BackendTask error value3
    -> BackendTask.BackendTask error value4
    -> BackendTask.BackendTask error value5
    -> BackendTask.BackendTask error value6
    -> BackendTask.BackendTask error value7
    -> BackendTask.BackendTask error value8
    -> BackendTask.BackendTask error value9
    -> BackendTask.BackendTask error valueCombined
-}
map9 :
    (Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression)
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
    -> Elm.Expression
map9 map9Arg map9Arg0 map9Arg1 map9Arg2 map9Arg3 map9Arg4 map9Arg5 map9Arg6 map9Arg7 map9Arg8 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map9"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            , Type.var "value6"
                            , Type.var "value7"
                            , Type.var "value8"
                            , Type.var "value9"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value6" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value7" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value8" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value9" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced
            "map9Unpack"
            (\functionReducedUnpack ->
                Elm.functionReduced
                    "unpack"
                    (\functionReducedUnpack0 ->
                        Elm.functionReduced
                            "unpack"
                            (\functionReducedUnpack_2_1_2_0_2_0_2_0_0 ->
                                Elm.functionReduced
                                    "unpack"
                                    (\functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0 ->
                                        Elm.functionReduced
                                            "unpack"
                                            (\functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                Elm.functionReduced
                                                    "unpack"
                                                    (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                        Elm.functionReduced
                                                            "unpack"
                                                            (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                                Elm.functionReduced
                                                                    "unpack"
                                                                    (\functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0 ->
                                                                        Elm.functionReduced
                                                                            "unpack"
                                                                            (map9Arg
                                                                                 functionReducedUnpack
                                                                                 functionReducedUnpack0
                                                                                 functionReducedUnpack_2_1_2_0_2_0_2_0_0
                                                                                 functionReducedUnpack_2_1_2_1_2_0_2_0_2_0_0
                                                                                 functionReducedUnpack_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                                 functionReducedUnpack_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                                 functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                                functionReducedUnpack_2_1_2_1_2_1_2_1_2_1_2_1_2_0_2_0_2_0_0
                                                                            )
                                                                    )
                                                            )
                                                    )
                                            )
                                    )
                            )
                    )
            )
        , map9Arg0
        , map9Arg1
        , map9Arg2
        , map9Arg3
        , map9Arg4
        , map9Arg5
        , map9Arg6
        , map9Arg7
        , map9Arg8
        ]


{-| Ignore any recoverable error data and propagate the `FatalError`. Similar to a `Cmd` in The Elm Architecture,
a `FatalError` will not do anything except if it is returned at the top-level of your application. Read more
in the [`FatalError` docs](FatalError).

allowFatal: 
    BackendTask.BackendTask { error | fatal : FatalError.FatalError } data
    -> BackendTask.BackendTask FatalError.FatalError data
-}
allowFatal : Elm.Expression -> Elm.Expression
allowFatal allowFatalArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "allowFatal"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.extensible
                                "error"
                                [ ( "fatal"
                                  , Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                  )
                                ]
                            , Type.var "data"
                            ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.var "data"
                            ]
                        )
                    )
            }
        )
        [ allowFatalArg ]


{-| mapError: 
    (error -> errorMapped)
    -> BackendTask.BackendTask error value
    -> BackendTask.BackendTask errorMapped value
-}
mapError :
    (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
mapError mapErrorArg mapErrorArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "mapError"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "error" ]
                            (Type.var "errorMapped")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "errorMapped", Type.var "value" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "mapErrorUnpack" mapErrorArg, mapErrorArg0 ]


{-| onError: 
    (error -> BackendTask.BackendTask mappedError value)
    -> BackendTask.BackendTask error value
    -> BackendTask.BackendTask mappedError value
-}
onError : (Elm.Expression -> Elm.Expression) -> Elm.Expression -> Elm.Expression
onError onErrorArg onErrorArg0 =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "onError"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "error" ]
                            (Type.namedWith
                                [ "BackendTask" ]
                                "BackendTask"
                                [ Type.var "mappedError", Type.var "value" ]
                            )
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "mappedError", Type.var "value" ]
                        )
                    )
            }
        )
        [ Elm.functionReduced "onErrorUnpack" onErrorArg, onErrorArg0 ]


{-| toResult: 
    BackendTask.BackendTask error data
    -> BackendTask.BackendTask noError (Result.Result error data)
-}
toResult : Elm.Expression -> Elm.Expression
toResult toResultArg =
    Elm.apply
        (Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "toResult"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "data" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "noError"
                            , Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "error", Type.var "data" ]
                            ]
                        )
                    )
            }
        )
        [ toResultArg ]


annotation_ :
    { backendTask : Type.Annotation -> Type.Annotation -> Type.Annotation }
annotation_ =
    { backendTask =
        \backendTaskArg0 backendTaskArg1 ->
            Type.alias
                moduleName_
                "BackendTask"
                [ backendTaskArg0, backendTaskArg1 ]
                (Type.namedWith
                    [ "Pages", "StaticHttpRequest" ]
                    "RawRequest"
                    [ Type.var "error", Type.var "value" ]
                )
    }


call_ :
    { map : Elm.Expression -> Elm.Expression -> Elm.Expression
    , succeed : Elm.Expression -> Elm.Expression
    , fail : Elm.Expression -> Elm.Expression
    , fromResult : Elm.Expression -> Elm.Expression
    , andThen : Elm.Expression -> Elm.Expression -> Elm.Expression
    , resolve : Elm.Expression -> Elm.Expression
    , combine : Elm.Expression -> Elm.Expression
    , andMap : Elm.Expression -> Elm.Expression -> Elm.Expression
    , map2 :
        Elm.Expression -> Elm.Expression -> Elm.Expression -> Elm.Expression
    , map3 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map4 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map5 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map6 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map7 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map8 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , map9 :
        Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
        -> Elm.Expression
    , allowFatal : Elm.Expression -> Elm.Expression
    , mapError : Elm.Expression -> Elm.Expression -> Elm.Expression
    , onError : Elm.Expression -> Elm.Expression -> Elm.Expression
    , toResult : Elm.Expression -> Elm.Expression
    }
call_ =
    { map =
        \mapArg mapArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "map"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function [ Type.var "a" ] (Type.var "b")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "a" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "b" ]
                                )
                            )
                    }
                )
                [ mapArg, mapArg0 ]
    , succeed =
        \succeedArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "succeed"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "a" ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "a" ]
                                )
                            )
                    }
                )
                [ succeedArg ]
    , fail =
        \failArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "fail"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.var "error" ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "a" ]
                                )
                            )
                    }
                )
                [ failArg ]
    , fromResult =
        \fromResultArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "fromResult"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "Result" ]
                                    "Result"
                                    [ Type.var "error", Type.var "value" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value" ]
                                )
                            )
                    }
                )
                [ fromResultArg ]
    , andThen =
        \andThenArg andThenArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "andThen"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a" ]
                                    (Type.namedWith
                                        [ "BackendTask" ]
                                        "BackendTask"
                                        [ Type.var "error", Type.var "b" ]
                                    )
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "a" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "b" ]
                                )
                            )
                    }
                )
                [ andThenArg, andThenArg0 ]
    , resolve =
        \resolveArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "resolve"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.list
                                        (Type.namedWith
                                            [ "BackendTask" ]
                                            "BackendTask"
                                            [ Type.var "error"
                                            , Type.var "value"
                                            ]
                                        )
                                    ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.list (Type.var "value")
                                    ]
                                )
                            )
                    }
                )
                [ resolveArg ]
    , combine =
        \combineArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "combine"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.list
                                    (Type.namedWith
                                        [ "BackendTask" ]
                                        "BackendTask"
                                        [ Type.var "error", Type.var "value" ]
                                    )
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.list (Type.var "value")
                                    ]
                                )
                            )
                    }
                )
                [ combineArg ]
    , andMap =
        \andMapArg andMapArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "andMap"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "a" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.function
                                        [ Type.var "a" ]
                                        (Type.var "b")
                                    ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "b" ]
                                )
                            )
                    }
                )
                [ andMapArg, andMapArg0 ]
    , map2 =
        \map2Arg map2Arg0 map2Arg1 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "map2"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "a", Type.var "b" ]
                                    (Type.var "c")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "a" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "b" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "c" ]
                                )
                            )
                    }
                )
                [ map2Arg, map2Arg0, map2Arg1 ]
    , map3 =
        \map3Arg map3Arg0 map3Arg1 map3Arg2 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "map3"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "value1"
                                    , Type.var "value2"
                                    , Type.var "value3"
                                    ]
                                    (Type.var "valueCombined")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value1" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value2" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value3" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.var "valueCombined"
                                    ]
                                )
                            )
                    }
                )
                [ map3Arg, map3Arg0, map3Arg1, map3Arg2 ]
    , map4 =
        \map4Arg map4Arg0 map4Arg1 map4Arg2 map4Arg3 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "map4"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "value1"
                                    , Type.var "value2"
                                    , Type.var "value3"
                                    , Type.var "value4"
                                    ]
                                    (Type.var "valueCombined")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value1" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value2" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value3" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value4" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.var "valueCombined"
                                    ]
                                )
                            )
                    }
                )
                [ map4Arg, map4Arg0, map4Arg1, map4Arg2, map4Arg3 ]
    , map5 =
        \map5Arg map5Arg0 map5Arg1 map5Arg2 map5Arg3 map5Arg4 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "map5"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "value1"
                                    , Type.var "value2"
                                    , Type.var "value3"
                                    , Type.var "value4"
                                    , Type.var "value5"
                                    ]
                                    (Type.var "valueCombined")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value1" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value2" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value3" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value4" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value5" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.var "valueCombined"
                                    ]
                                )
                            )
                    }
                )
                [ map5Arg, map5Arg0, map5Arg1, map5Arg2, map5Arg3, map5Arg4 ]
    , map6 =
        \map6Arg map6Arg0 map6Arg1 map6Arg2 map6Arg3 map6Arg4 map6Arg5 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "map6"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "value1"
                                    , Type.var "value2"
                                    , Type.var "value3"
                                    , Type.var "value4"
                                    , Type.var "value5"
                                    , Type.var "value6"
                                    ]
                                    (Type.var "valueCombined")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value1" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value2" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value3" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value4" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value5" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value6" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.var "valueCombined"
                                    ]
                                )
                            )
                    }
                )
                [ map6Arg
                , map6Arg0
                , map6Arg1
                , map6Arg2
                , map6Arg3
                , map6Arg4
                , map6Arg5
                ]
    , map7 =
        \map7Arg map7Arg0 map7Arg1 map7Arg2 map7Arg3 map7Arg4 map7Arg5 map7Arg6 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "map7"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "value1"
                                    , Type.var "value2"
                                    , Type.var "value3"
                                    , Type.var "value4"
                                    , Type.var "value5"
                                    , Type.var "value6"
                                    , Type.var "value7"
                                    ]
                                    (Type.var "valueCombined")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value1" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value2" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value3" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value4" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value5" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value6" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value7" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.var "valueCombined"
                                    ]
                                )
                            )
                    }
                )
                [ map7Arg
                , map7Arg0
                , map7Arg1
                , map7Arg2
                , map7Arg3
                , map7Arg4
                , map7Arg5
                , map7Arg6
                ]
    , map8 =
        \map8Arg map8Arg0 map8Arg1 map8Arg2 map8Arg3 map8Arg4 map8Arg5 map8Arg6 map8Arg7 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "map8"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "value1"
                                    , Type.var "value2"
                                    , Type.var "value3"
                                    , Type.var "value4"
                                    , Type.var "value5"
                                    , Type.var "value6"
                                    , Type.var "value7"
                                    , Type.var "value8"
                                    ]
                                    (Type.var "valueCombined")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value1" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value2" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value3" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value4" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value5" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value6" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value7" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value8" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.var "valueCombined"
                                    ]
                                )
                            )
                    }
                )
                [ map8Arg
                , map8Arg0
                , map8Arg1
                , map8Arg2
                , map8Arg3
                , map8Arg4
                , map8Arg5
                , map8Arg6
                , map8Arg7
                ]
    , map9 =
        \map9Arg map9Arg0 map9Arg1 map9Arg2 map9Arg3 map9Arg4 map9Arg5 map9Arg6 map9Arg7 map9Arg8 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "map9"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "value1"
                                    , Type.var "value2"
                                    , Type.var "value3"
                                    , Type.var "value4"
                                    , Type.var "value5"
                                    , Type.var "value6"
                                    , Type.var "value7"
                                    , Type.var "value8"
                                    , Type.var "value9"
                                    ]
                                    (Type.var "valueCombined")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value1" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value2" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value3" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value4" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value5" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value6" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value7" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value8" ]
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value9" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error"
                                    , Type.var "valueCombined"
                                    ]
                                )
                            )
                    }
                )
                [ map9Arg
                , map9Arg0
                , map9Arg1
                , map9Arg2
                , map9Arg3
                , map9Arg4
                , map9Arg5
                , map9Arg6
                , map9Arg7
                , map9Arg8
                ]
    , allowFatal =
        \allowFatalArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "allowFatal"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.extensible
                                        "error"
                                        [ ( "fatal"
                                          , Type.namedWith
                                                [ "FatalError" ]
                                                "FatalError"
                                                []
                                          )
                                        ]
                                    , Type.var "data"
                                    ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                    , Type.var "data"
                                    ]
                                )
                            )
                    }
                )
                [ allowFatalArg ]
    , mapError =
        \mapErrorArg mapErrorArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "mapError"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "error" ]
                                    (Type.var "errorMapped")
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "errorMapped", Type.var "value" ]
                                )
                            )
                    }
                )
                [ mapErrorArg, mapErrorArg0 ]
    , onError =
        \onErrorArg onErrorArg0 ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "onError"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.function
                                    [ Type.var "error" ]
                                    (Type.namedWith
                                        [ "BackendTask" ]
                                        "BackendTask"
                                        [ Type.var "mappedError"
                                        , Type.var "value"
                                        ]
                                    )
                                , Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "mappedError", Type.var "value" ]
                                )
                            )
                    }
                )
                [ onErrorArg, onErrorArg0 ]
    , toResult =
        \toResultArg ->
            Elm.apply
                (Elm.value
                    { importFrom = [ "BackendTask" ]
                    , name = "toResult"
                    , annotation =
                        Just
                            (Type.function
                                [ Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "data" ]
                                ]
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "noError"
                                    , Type.namedWith
                                        [ "Result" ]
                                        "Result"
                                        [ Type.var "error", Type.var "data" ]
                                    ]
                                )
                            )
                    }
                )
                [ toResultArg ]
    }


values_ :
    { map : Elm.Expression
    , succeed : Elm.Expression
    , fail : Elm.Expression
    , fromResult : Elm.Expression
    , andThen : Elm.Expression
    , resolve : Elm.Expression
    , combine : Elm.Expression
    , andMap : Elm.Expression
    , map2 : Elm.Expression
    , map3 : Elm.Expression
    , map4 : Elm.Expression
    , map5 : Elm.Expression
    , map6 : Elm.Expression
    , map7 : Elm.Expression
    , map8 : Elm.Expression
    , map9 : Elm.Expression
    , allowFatal : Elm.Expression
    , mapError : Elm.Expression
    , onError : Elm.Expression
    , toResult : Elm.Expression
    }
values_ =
    { map =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map"
            , annotation =
                Just
                    (Type.function
                        [ Type.function [ Type.var "a" ] (Type.var "b")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "b" ]
                        )
                    )
            }
    , succeed =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "succeed"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "a" ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        )
                    )
            }
    , fail =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "fail"
            , annotation =
                Just
                    (Type.function
                        [ Type.var "error" ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        )
                    )
            }
    , fromResult =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "fromResult"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "Result" ]
                            "Result"
                            [ Type.var "error", Type.var "value" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value" ]
                        )
                    )
            }
    , andThen =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "andThen"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a" ]
                            (Type.namedWith
                                [ "BackendTask" ]
                                "BackendTask"
                                [ Type.var "error", Type.var "b" ]
                            )
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "b" ]
                        )
                    )
            }
    , resolve =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "resolve"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error"
                            , Type.list
                                (Type.namedWith
                                    [ "BackendTask" ]
                                    "BackendTask"
                                    [ Type.var "error", Type.var "value" ]
                                )
                            ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.list (Type.var "value") ]
                        )
                    )
            }
    , combine =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "combine"
            , annotation =
                Just
                    (Type.function
                        [ Type.list
                            (Type.namedWith
                                [ "BackendTask" ]
                                "BackendTask"
                                [ Type.var "error", Type.var "value" ]
                            )
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.list (Type.var "value") ]
                        )
                    )
            }
    , andMap =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "andMap"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error"
                            , Type.function [ Type.var "a" ] (Type.var "b")
                            ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "b" ]
                        )
                    )
            }
    , map2 =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map2"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "a", Type.var "b" ]
                            (Type.var "c")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "a" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "b" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "c" ]
                        )
                    )
            }
    , map3 =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map3"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
    , map4 =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map4"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
    , map5 =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map5"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
    , map6 =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map6"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            , Type.var "value6"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value6" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
    , map7 =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map7"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            , Type.var "value6"
                            , Type.var "value7"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value6" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value7" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
    , map8 =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map8"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            , Type.var "value6"
                            , Type.var "value7"
                            , Type.var "value8"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value6" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value7" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value8" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
    , map9 =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "map9"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "value1"
                            , Type.var "value2"
                            , Type.var "value3"
                            , Type.var "value4"
                            , Type.var "value5"
                            , Type.var "value6"
                            , Type.var "value7"
                            , Type.var "value8"
                            , Type.var "value9"
                            ]
                            (Type.var "valueCombined")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value1" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value2" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value3" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value4" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value5" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value6" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value7" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value8" ]
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value9" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "valueCombined" ]
                        )
                    )
            }
    , allowFatal =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "allowFatal"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.extensible
                                "error"
                                [ ( "fatal"
                                  , Type.namedWith
                                        [ "FatalError" ]
                                        "FatalError"
                                        []
                                  )
                                ]
                            , Type.var "data"
                            ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.namedWith [ "FatalError" ] "FatalError" []
                            , Type.var "data"
                            ]
                        )
                    )
            }
    , mapError =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "mapError"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "error" ]
                            (Type.var "errorMapped")
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "errorMapped", Type.var "value" ]
                        )
                    )
            }
    , onError =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "onError"
            , annotation =
                Just
                    (Type.function
                        [ Type.function
                            [ Type.var "error" ]
                            (Type.namedWith
                                [ "BackendTask" ]
                                "BackendTask"
                                [ Type.var "mappedError", Type.var "value" ]
                            )
                        , Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "value" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "mappedError", Type.var "value" ]
                        )
                    )
            }
    , toResult =
        Elm.value
            { importFrom = [ "BackendTask" ]
            , name = "toResult"
            , annotation =
                Just
                    (Type.function
                        [ Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "error", Type.var "data" ]
                        ]
                        (Type.namedWith
                            [ "BackendTask" ]
                            "BackendTask"
                            [ Type.var "noError"
                            , Type.namedWith
                                [ "Result" ]
                                "Result"
                                [ Type.var "error", Type.var "data" ]
                            ]
                        )
                    )
            }
    }


