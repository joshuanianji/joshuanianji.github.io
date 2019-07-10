module Model exposing (Flags, Model, Msg(..), init, subscriptions, update)

import Browser exposing (UrlRequest(..))
import Browser.Dom
import Browser.Events
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
    | HttpRequest String -- Http.get the source at that url
    | GotSrc (Result Http.Error String)



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NavigateTo route ->
            -- when the link be clicking
            updateRouter model (Router.NavigateTo route)

        UrlChange url ->
            -- handle url changes not made by us
            updateRouter model (Router.UrlChanged url)

        UrlRequest urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    update (NavigateTo (url |> Routes.fromUrl) |> Debug.log "internal url") model

                Browser.External url ->
                    ( model, Nav.load url |> Debug.log "external url" )

        RouterMsg routerMsg ->
            -- to handle messages created by the router
            updateRouter model routerMsg

        -- every time the page reloads
        WindowResize windowSize ->
            ( { model | device = Element.classifyDevice windowSize |> Debug.log "Device" }, Cmd.none )

        -- when we're requesting a .emu file via http
        HttpRequest src ->
            ( model
            , Http.get
                { url = src
                , expect = Http.expectString GotSrc
                }
            )

        -- after we've gotten the .emu file
        GotSrc result ->
            update (NavigateTo Post) <|
                case result of
                    Ok src ->
                        { model | blogSource = Just src }

                    Err err ->
                        let
                            _ =
                                Debug.log "err" err
                        in
                        model



-- how to update the router


updateRouter : Model -> Router.Msg -> ( Model, Cmd Msg )
updateRouter model routerMsg =
    let
        ( routerModel, routerCmd ) =
            Router.update model.router routerMsg
    in
    ( { model | router = routerModel }
    , Cmd.map RouterMsg routerCmd
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onResize
        (\x y ->
            WindowResize (WindowSize x y)
        )
