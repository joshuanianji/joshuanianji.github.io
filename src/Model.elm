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

       router : Holds the Router model
       device: what device the consumer is using
       blogUrl : the Url to the the blog page (because we'll have to remember this when we change pages)
-}


type alias Model =
    { staredState : SharedState
    , router : Router.Model
    }



-- the flag that we pass to the init function was created from the javascript elm.js. It is a record


init : Flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( initModel flags url key
    , Cmd.none
    )



-- I'm going to be completely honest with you I have no idea what Browser.Navigation.Key is. I just know we need it to handle URL changes and to change them ourselves and whatnot. (https://package.elm-lang.org/packages/elm/browser/latest/Browser-Navigation#Key)


initModel : Flags -> Url -> Nav.Key -> Model
initModel flags url key =
    { sharedState = SharedState.init (Element.classifyDevice flags) key
    , router = Router.init url key
    }



-- MSG


type Msg
    = NavigateTo Route
    | UrlChange Url.Url
    | UrlRequest UrlRequest
    | RouterMsg Router.Msg
    | WindowResize WindowSize
