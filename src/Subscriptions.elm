module Subscriptions exposing (subscriptions)

import Browser.Events
import Model exposing (Model, Msg(..), WindowSize)


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onResize
        (\x y ->
            WindowResize (WindowSize x y)
        )
