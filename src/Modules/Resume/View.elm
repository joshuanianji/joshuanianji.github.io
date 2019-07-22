module Modules.Resume.View exposing (view)

import Element exposing (Element)
import Modules.Resume.Types exposing (Model, Msg)
import SharedState exposing (SharedState)


view : Model -> SharedState -> Element Msg
view model sharedState =
    Element.text "Lol nothing's here yet"
