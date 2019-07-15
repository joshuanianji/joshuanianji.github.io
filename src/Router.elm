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
    | HttpRequest String String -- first string is file name, second string is the URL we're getting the .emu file string from
    | GotSrc String (Result Http.Error String) -- we carry the markdown string and the .emu file name with it


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
            let
                route = Routes.fromUrl url 
            in
            case route of 
                Post fileName ->
                    


                _ ->
                    -- handles the Url changes
                    ( { model | route = route  }
                    , Cmd.none
                    )

        NavigateTo route ->
            -- changes url
            ( model
            , Nav.pushUrl model.navKey (Routes.toUrlString route)
            )


        
        -- when we're requesting a .emu file via http
        -- I carry the url as well just so that GotSrc can have cleaner code
        HttpRequest src ->
            ( model
            , Http.get
                { url = src
                , expect = Http.expectString (GotSrc fileName)
                }
            )

        -- after we've gotten the .emu file we update the url
        -- I carry the fileName as well so that we don't need to revert the src back to a fileName, because that turns it into a Maybe String
        GotSrc url result ->
            let
                m =
                    case result of
                        Ok markdown ->
                            { model | blogSource = Just markdown }

                        Err err ->
                            let
                                _ =
                                    Debug.log "err" err
                            in
                            model
            in
            -- If i used Update.elm's NavigateTo, I will end up with an infinite loop.
            updateRouter m (Router.UrlChanged (Post fileName))