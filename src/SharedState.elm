module SharedState exposing (Msg(..), SharedState, init, update)

{-| SharedState is the center piece that holds data that helps the view pages navigate.
the Nav.Key is one example, and the Route is another.
Anytime one of the view pages wants to change routes, the shared state will change the URL
this changed url will be read by the Main.elm folder
-}

import Browser.Navigation as Nav


type alias SharedState =
    { navKey : Nav.Key
    , timeMachineOpen : Bool
    }


init : Nav.Key -> SharedState
init key =
    { navKey = key
    , timeMachineOpen = False
    }


type Msg
    = OpenTimeMachine
    | NoOp


update : Msg -> SharedState -> SharedState
update msg ss =
    case msg of
        OpenTimeMachine ->
            { ss | timeMachineOpen = True }

        NoOp ->
            ss
