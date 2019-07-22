module Model exposing (Flags, Model, Msg(..), WindowSize, init)

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Element exposing (Device)
import Http
import Router
import Routes exposing (Route(..))
import SharedState exposing (SharedState)
import Url exposing (Url)



-- MODEL--


type alias Flags =
    WindowSize



-- window size. As of now it's the only flag that Javascript passes onto us


type alias WindowSize =
    { width : Int
    , height : Int
    }



{-
   Model :

       sharedState : the state that holds information all models need access to (e.g. device)
       router : the router model because it holds thepage stuff we need access to.
-}


type alias Model =
    { sharedState : SharedState
    , router : Router.Model
    }


{-| the flag that we pass to the init function was created from the javascript elm.js. It is a record

    I'm going to be completely honest with you I have no idea what Browser.Navigation.Key is.
    I just know we need it to handle URL changes and to change them ourselves and whatnot. (https://package.elm-lang.org/packages/elm/browser/latest/Browser-Navigation#Key)

-}
init : Flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        ( initRouterModel, routerCmd ) =
            Router.init url key
    in
    ( { sharedState = SharedState.init (Element.classifyDevice flags) key
      , router = initRouterModel
      }
    , Cmd.map RouterMsg routerCmd
    )



-- MSG


type Msg
    = NavigateTo Route
    | UrlChange Url.Url
    | UrlRequest UrlRequest
    | RouterMsg Router.Msg
    | WindowResize WindowSize
