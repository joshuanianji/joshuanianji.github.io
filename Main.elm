module Main exposing (main)

import Browser
import Model exposing (Flags, Model, Msg(..), init, subscriptions, update)
import View exposing (view)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = \model -> { title = "Joshua's App", body = [ view model ] }
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequest
        , onUrlChange = UrlChange
        }
