module Modules.Post.View exposing (view)

{-
   Where we show the "blog" posts and whatnot
-}

import Element exposing (Element)
import Mark
import Mark.Error
import Model exposing (Model, Msg)
import Modules.Post.Constructor as Constructor


view : Model -> Element Msg
view model =
    case model.router.blogSource of
        Nothing ->
            Element.text "File not found"

        Just source ->
            source
                |> Constructor.fromMarkup


viewErrors errors =
    List.map
        (Mark.Error.toHtml Mark.Error.Light)
        errors


stringTest : String
stringTest =
    """

|> Hello
"""
