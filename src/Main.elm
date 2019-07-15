module Main exposing (main)

import Browser
import Model exposing (Flags, Model, Msg(..), init)
import Subscriptions exposing (subscriptions)
import Update exposing (update)
import View exposing (viewApplication)


main : Program Flags Model Msg
main =
    Browser.application
        { init = Model.init
        , view = viewApplication
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequest
        , onUrlChange = UrlChange
        }
