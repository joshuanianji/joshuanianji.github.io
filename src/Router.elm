module Router exposing (Model, Msg(..), init, update)

{-
   This model deals with the dirty work for routing - the update function. init, routing model, etc.
-}

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Http
import Routes exposing (Route(..))
import Url
import Url.Parser as Url exposing ((</>), Parser)


type Msg
    = UrlChanged Url.Url -- when the user changes url from bar
    | NavigateTo Route -- when the user clicks any link that changes the url
    | HttpRequest String String -- first string is file name, second string is the URL we're getting the .emu file string from
    | GotSrc String (Result Http.Error String) -- we carry the file name and markdown string for better code



-- blogSource is the markup string if we're in the blog page / project info page, and we have to store it here because here is the place we retrieve the string


type alias Model =
    { route : Routes.Route
    , navKey : Nav.Key
    , blogSource : Maybe String
    }


init : Url.Url -> Nav.Key -> Model
init url key =
    { route = Routes.fromUrl url
    , navKey = key
    , blogSource = Nothing
    }


update : Model -> Msg -> ( Model, Cmd Msg )
update model msg =
    case msg of
        UrlChanged url ->
            let
                route =
                    Routes.fromUrl url
            in
            case route of
                Post fileName ->
                    -- first get the .emu file content, then change model
                    let
                        emuSrc =
                            Routes.toEmuUrl fileName
                    in
                    update model (HttpRequest fileName emuSrc)

                _ ->
                    -- handles the Url changes
                    ( { model | route = route }
                    , Cmd.none
                    )

        NavigateTo route ->
            let
                url =
                    Routes.toUrlString route
            in
            -- changes url
            ( model
            , Nav.pushUrl model.navKey url
            )

        -- when we're requesting a .emu file via http
        -- I carry the url as well just so that GotSrc can have cleaner code
        HttpRequest fileName emuSrc ->
            ( model
            , Http.get
                { url = emuSrc
                , expect = Http.expectString (GotSrc fileName)
                }
            )

        -- after we've gotten the .emu file we update the url
        -- I carry the fileName as well
        GotSrc fileName result ->
            case result of
                Ok markdown ->
                    ( { model
                        | blogSource = Just markdown
                        , route = Post fileName
                      }
                    , Cmd.none
                    )

                Err err ->
                    let
                        _ =
                            Debug.log "err" err
                    in
                    ( model, Cmd.none )
