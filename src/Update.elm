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
            case route of
                Post fileName ->
                    -- if it's a post, we first load the .emu file via http, then change the url
                    update (HttpRequest fileName (fileName |> Routes.toEmuUrl)) model

                _ ->
                    -- otherwise, we just go directly to changing the url
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
        -- I carry the fileName as well just so that GotSrc can have cleaner code
        HttpRequest fileName src ->
            ( model
            , Http.get
                { url = src
                , expect = Http.expectString (GotSrc fileName)
                }
            )

        -- after we've gotten the .emu file we update the url
        -- I carry the fileName as well so that we don't need to revert the src back to a fileName, because that turns it into a Maybe String
        GotSrc fileName result ->
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
            updateRouter m (Router.NavigateTo (Post fileName))



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
