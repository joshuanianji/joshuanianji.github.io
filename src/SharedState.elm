module SharedState exposing (SharedState, SharedStateUpdate(..), init, update)

{-
   a record holding information all models will need,
   and is passed around during their update calls.

   This module ONLY deals with itself. the update doesn't change urls, for example, though it can.
   The update only returns new sharedStates.
-}

import Browser.Navigation
import Element exposing (Device)


type alias SharedState =
    { navKey : Browser.Navigation.Key -- used by other pages to navigate (through Browser.Navigation.pushUrl)
    , device : Device
    }


init : Device -> Browser.Navigation.Key -> SharedState
init device key =
    { navKey = key
    , device = device
    }


type SharedStateUpdate
    = UpdateDevice Device
    | NoUpdate


update : SharedState -> SharedStateUpdate -> SharedState
update sharedState sharedStateUpdate =
    case sharedStateUpdate of
        UpdateDevice device ->
            { sharedState | device = device }

        NoUpdate ->
            -- when we have to output a SharedStateUpdate but don't want to change anything
            sharedState
