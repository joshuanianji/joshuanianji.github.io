module Router exposing (Model, Msg(..), Page(..), init, update)

{-
   This model deals with the dirty work for routing - the update function. init, routing model, etc.

   I got a lot of the code from my dad's jHipster-elm-demo lol.
-}

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Http
import Modules.Home.Types as Home
import Modules.NotFound.Types as NotFound
import Modules.Post.Types as Post
import Modules.PostOverview.Types as PostOverview
import Modules.Projects.Types as Projects
import Modules.Resume.Types as Resume
import Routes exposing (Route(..))
import SharedState exposing (SharedState, SharedStateUpdate)
import Task
import Url
import Url.Parser as Url exposing ((</>), Parser)


{-| Page Type vs. Route Type

    The Route type is mainly used by the routing module as an intermediary between the URL and the Page type.
    The Page type also holds the models for each of the page (fOr scALAbiLitY) so as the project requires multiple models,
    and cannot be replaced by the Route type.
    Thus, in essence, the Page type is used by the View module, but the Route type is used by the Router module.

-}
type Page
    = HomePage Home.Model
    | ResumePage Resume.Model
    | ProjectsPage Projects.Model
    | PostOverviewPage PostOverview.Model
    | PostPage Post.Model
    | NotFoundPage NotFound.Model


type Msg
    = UrlChanged Url.Url -- when the user changes url from bar
    | NavigateTo Route -- when the user clicks any link that changes the url
    | HomeMsg Home.Msg
    | ResumeMsg Resume.Msg
    | ProjectsMsg Projects.Msg
    | PostOverviewMsg PostOverview.Msg
    | PostMsg Post.Msg
    | NotFoundMsg NotFound.Msg



-- Router model is p important lol


type alias Model =
    { route : Routes.Route
    , currentPage : Page
    , navKey : Nav.Key
    }


{-| Dad uses a nice trick where he makes the current page a NotFoundPage, but sends a command where he changed the Url

    This makes it easier for us because the NotFoundPage will always be the simplest model so we don't need to execute some init command

-}
init : Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init url key =
    let
        currentRoute =
            Routes.fromUrl url
    in
    ( { route = currentRoute
      , currentPage = NotFoundPage {}
      , navKey = key
      }
    , (Task.perform identity << Task.succeed) <| UrlChanged url
    )


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedStateUpdate )
update sharedState msg model =
    case ( msg, model.currentPage ) of
        ( UrlChanged url, _ ) ->
            let
                route =
                    Routes.fromUrl url

                ( newModel, newCmd, newSharedStateUpdate ) =
                    navigateTo route sharedState model
            in
            ( { newModel | route = route }
            , newCmd
            , newSharedStateUpdate
            )

        ( NavigateTo route, _ ) ->
            -- changes url
            ( model
            , Nav.pushUrl model.navKey
                (Routes.toUrlString route)
            , SharedState.NoUpdate
            )

        ( HomeMsg subMsg, HomePage subModel ) ->
            Home.update sharedState subMsg subModel
                |> updateWith HomePage HomeMsg model

        ( ResumeMsg subMsg, ResumePage subModel ) ->
            Resume.update sharedState subMsg subModel
                |> updateWith ResumePage ResumeMsg model

        ( ProjectsMsg subMsg, ProjectsPage subModel ) ->
            Projects.update sharedState subMsg subModel
                |> updateWith ProjectsPage ProjectsMsg model

        ( PostOverviewMsg subMsg, PostOverviewPage subModel ) ->
            PostOverview.update sharedState subMsg subModel
                |> updateWith PostOverviewPage PostOverviewMsg model

        ( PostMsg subMsg, PostPage subModel ) ->
            Post.update sharedState subMsg subModel
                |> updateWith PostPage PostMsg model

        ( NotFoundMsg subMsg, NotFoundPage subModel ) ->
            NotFound.update sharedState subMsg subModel
                |> updateWith NotFoundPage NotFoundMsg model

        ( _, _ ) ->
            -- message arrived for the wron age. Ignore.
            ( model, Cmd.none, SharedState.NoUpdate )


{-| If I just left the update function as

    ( HomeMsg subMsg, HomePage subModel ) ->
            Home.update sharedState subMsg subModel

    It wouldn't work because Home.update returns a
    (#Resume.Model#,    Cmd #Resume.Msg#,  SharedStateUpdate)   type and we want a
    ( Model,            Cmd Msg,           SharedStateUpdate )  type!\

    We use this function to change the types and make it work.
    Dad's updateWith function had a lot more features so the naming makes sense (e.g. toasties between pages) but I might want to change
    the naming because I don't have that many features lol.

-}
updateWith :
    (subModel -> Page)
    -> (subMsg -> Msg)
    -> Model
    -> ( subModel, Cmd subMsg, SharedStateUpdate )
    -> ( Model, Cmd Msg, SharedStateUpdate )
updateWith toPage toMsg model ( subModel, subCmd, subSharedStateUpdate ) =
    ( { model | currentPage = toPage subModel }
    , Cmd.map toMsg subCmd
    , subSharedStateUpdate
    )



-- changes the model's currentPage, mostly


navigateTo : Route -> SharedState -> Model -> ( Model, Cmd Msg, SharedStateUpdate )
navigateTo route sharedState model =
    case route of
        Home ->
            Home.init |> initWith HomePage HomeMsg model SharedState.NoUpdate

        Resume ->
            Resume.init |> initWith ResumePage ResumeMsg model SharedState.NoUpdate

        Projects ->
            Projects.init |> initWith ProjectsPage ProjectsMsg model SharedState.NoUpdate

        PostOverview ->
            PostOverview.init |> initWith PostOverviewPage PostOverviewMsg model SharedState.NoUpdate

        Post fileName ->
            Post.init fileName |> initWith PostPage PostMsg model SharedState.NoUpdate

        NotFound ->
            NotFound.init |> initWith NotFoundPage NotFoundMsg model SharedState.NoUpdate


initWith : (subModel -> Page) -> (subMsg -> Msg) -> Model -> SharedStateUpdate -> ( subModel, Cmd subMsg ) -> ( Model, Cmd Msg, SharedStateUpdate )
initWith toPage toMsg model sharedStateUpdate ( subModel, subCmd ) =
    ( { model | currentPage = toPage subModel }
    , Cmd.map toMsg subCmd
    , sharedStateUpdate
    )
