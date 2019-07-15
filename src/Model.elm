module Model exposing (Flags, Model, Msg(..), WindowSize, init)

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Element exposing (Device)
import Http
import Router
import Routes exposing (Route(..))
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
       blogSource: the markup string if we're in the blog page / project info page
-}


type alias Model =
    { router : Router.Model
    , device : Device
    , blogSource : Maybe String
    }



-- the flag that we pass to the init function was created from the javascript elm.js. It is a record


init : Flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( initModel flags url key
    , Cmd.none
    )



-- I'm going to be completely honest with you I have no idea what Browser.Navigation.Key is. I just know we need it to handle URL changes and to change them ourelves and whatnot. (https://package.elm-lang.org/packages/elm/browser/latest/Browser-Navigation#Key)


initModel : Flags -> Url -> Nav.Key -> Model
initModel flags url key =
    { router = Router.init url key
    , device = Element.classifyDevice flags |> Debug.log "device"
    , blogSource = Nothing
    }



-- MSG


type Msg
    = NavigateTo Route
    | UrlChange Url.Url
    | UrlRequest UrlRequest
    | RouterMsg Router.Msg
    | WindowResize WindowSize
    | HttpRequest String String -- first string is file name, second string is the URL we're getting the .emu file string from
    | GotSrc String (Result Http.Error String) -- we carry the markdown string and the .emu file name with it
