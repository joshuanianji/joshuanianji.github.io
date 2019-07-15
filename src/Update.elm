module Update exposing (update)

import Browser
import Browser.Navigation as Nav
import Element
import Http
import Model exposing (Model, Msg(..))
import Router
import Routes exposing (Route(..))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NavigateTo route ->
            -- pass it to the router to navigate for us
            updateRouter model (Router.NavigateTo route)

        UrlChange url ->
            -- handling url changes
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
