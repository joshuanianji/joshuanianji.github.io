module SharedState exposing (Msg(..), SharedState, init, update)

{-| SharedState is the center piece that holds data that helps the view pages navigate.
the Nav.Key is one example, and the Route is another.
Anytime one of the view pages wants to change routes, the shared state will change the URL
this changed url will be read by the Main.elm folder

It also helps keep track of data all the pages need, such as the window size

-}

import Browser.Navigation as Nav
import Data.Flags exposing (Flags, WindowSize)
import Element exposing (Device)


type alias SharedState =
    { navKey : Nav.Key
    , timeMachineOpen : Bool
    , windowSize : WindowSize
    , device : Device
    }


init : Nav.Key -> Flags -> SharedState
init key flags =
    { navKey = key
    , timeMachineOpen = False
    , windowSize = flags.windowSize
    , device = Element.classifyDevice flags.windowSize
    }


type Msg
    = OpenTimeMachine
    | UpdateWindow WindowSize
    | NoOp


update : Msg -> SharedState -> SharedState
update msg ss =
    case msg of
        OpenTimeMachine ->
            { ss | timeMachineOpen = True }

        UpdateWindow newWindow ->
            { ss
                | windowSize = newWindow
                , device = Element.classifyDevice newWindow
            }

        NoOp ->
            ss
