module View.Post exposing (view)

{-
   Where we show the "blog" posts and whatnot
-}

import Element exposing (Element)
import Mark
import Mark.Error
import Model exposing (Model, Msg)
import View.BlogPost as BlogPost


view : Model -> Element Msg
view model =
    case model.router.blogSource of
        Nothing ->
            Element.text "Source not received yet"

        Just source ->
            source
                |> BlogPost.fromMarkup


viewErrors errors =
    List.map
        (Mark.Error.toHtml Mark.Error.Light)
        errors
