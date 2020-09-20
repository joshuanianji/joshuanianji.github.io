module SharedState exposing (SharedState, init)

{-| SharedState is the center piece that holds data that helps the view pages navigate.
the Nav.Key is one example, and the Route is another.
Anytime one of the view pages wants to change routes, the shared state will change the URL
this changed url will be read by the Main.elm folder

Honestly this is kinda useless rn unless I have some other global variable

-}

import Browser.Navigation as Nav


type alias SharedState =
    { navKey : Nav.Key }


init : Nav.Key -> SharedState
init key =
    { navKey = key }
