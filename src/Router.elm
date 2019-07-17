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
    , currentPage : Page
    , navKey : Nav.Key
    , blogSource : Maybe String
    }


{-| Page Type vs. Route Type

    The Route type is mainly used by the routing module as an intermediary between the URL and the Page type.
    The Page type also holds the models for each of the page (fOr scALAbiLitY) so as the project requires multiple models,
    and cannot be replaced by the Route type.
    Thus, in essence, the Page type is used by the View module, but the Route type is used by the Router module.

-}
type Page
    = NotFoundPage
    | HomePage
    | ResumePage
    | ProjectPage
    | PostPage


init : Url.Url -> Nav.Key -> Model
init url key =
    { route = Routes.fromUrl url
    , currentPage = NotFoundPage
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
