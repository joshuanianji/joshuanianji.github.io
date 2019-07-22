module Modules.Post.View exposing (view)

{-
   Where we show the "blog" posts and whatnot
-}

import Element exposing (Element)
import Element.Font as Font
import Http
import Mark
import Mark.Error
import Modules.Post.Constructor as Constructor
import Modules.Post.Types exposing (ExpectBlogPost(..), Model, Msg)
import SharedState exposing (SharedState)


view : Model -> SharedState -> Element Msg
view model sharedState =
    case model.blogSource of
        Loading ->
            Element.text "Loading..."

        Loaded result ->
            case result of
                Ok source ->
                    source
                        |> Constructor.fromMarkup

                Err error ->
                    httpErrorView error


httpErrorView : Http.Error -> Element Msg
httpErrorView error =
    case error of
        Http.BadUrl url ->
            Element.text (url ++ " is not a valid url!")

        Http.Timeout ->
            Element.text "Took too long to load!"

        Http.NetworkError ->
            Element.text "Netowrk error!"

        Http.BadStatus int ->
            Element.text ("Failure with status code " ++ String.fromInt int)

        Http.BadBody string ->
            Element.paragraph
                []
            <|
                [ Element.text "Something weird happened with the .emu file. Here is the debugging message: "
                , Element.el
                    [ Font.family
                        [ Font.typeface "Courier New" ]
                    ]
                    (Element.text string)
                ]


stringTest : String
stringTest =
    """

|> Hello
"""
