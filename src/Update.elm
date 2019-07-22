module Update exposing (update)

import Browser
import Browser.Navigation as Nav
import Element
import Http
import Model exposing (Model, Msg(..))
import Router
import Routes exposing (Route(..))
import SharedState exposing (SharedState, SharedStateUpdate)


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
            updateSharedState
                model
                (SharedState.UpdateDevice (Element.classifyDevice windowSize |> Debug.log "Device"))



-- how to update the router


updateRouter : Model -> Router.Msg -> ( Model, Cmd Msg )
updateRouter model routerMsg =
    let
        ( nextRouterModel, routerCmd, sharedStateUpdate ) =
            Router.update model.sharedState routerMsg model.router

        nextSharedState =
            SharedState.update model.sharedState sharedStateUpdate
    in
    ( { model | sharedState = nextSharedState, router = nextRouterModel }
    , Cmd.map RouterMsg routerCmd
    )



-- update the shared state


updateSharedState : Model -> SharedStateUpdate -> ( Model, Cmd Msg )
updateSharedState model ssupdate =
    ( { model | sharedState = SharedState.update model.sharedState ssupdate }
    , Cmd.none
    )
