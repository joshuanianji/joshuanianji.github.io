module Router exposing (Model, Msg(..), init, update)

{-
   This model deals with the dirty work for routing - the update function. init, routing model, etc.
-}

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Routes exposing (Route(..))
import Url
import Url.Parser as Url exposing ((</>), Parser)


type Msg
    = UrlChanged Url.Url -- when the user changes url from bar
    | NavigateTo Route -- when the user clicks any link that changes the url


type alias Model =
    { route : Routes.Route
    , navKey : Nav.Key
    }


init : Url.Url -> Nav.Key -> Model
init url key =
    { route = Routes.fromUrl url
    , navKey = key
    }


update : Model -> Msg -> ( Model, Cmd Msg )
update model msg =
    case msg of
        UrlChanged url ->
            -- handles the Url changes
            ( { model | route = Routes.fromUrl url }
            , Cmd.none
            )

        NavigateTo route ->
            -- changes url
            ( model
            , Nav.pushUrl model.navKey (Routes.toUrlString route)
            )
