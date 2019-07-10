module Main exposing (main)

import Browser
import Model exposing (Flags, Model, Msg(..), init, subscriptions, update)
import View exposing (viewApplication)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = viewApplication
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequest
        , onUrlChange = UrlChange
        }
