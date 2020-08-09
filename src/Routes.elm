module Routes exposing (..)

import Browser.Dom as Dom
import String
import Task


type Route
    = Home
    | About
    | Projects
    | Contact


routeToString : Route -> String
routeToString r =
    case r of
        Home ->
            "Home"

        About ->
            "About"

        Projects ->
            "Projects"

        Contact ->
            "Contact"
