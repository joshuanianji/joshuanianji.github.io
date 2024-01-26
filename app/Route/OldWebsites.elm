module Route.OldWebsites exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Effect
import ErrorPage
import FatalError exposing (FatalError)
import Head
import Head.Seo
import Html.Styled as Html
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Server.Request
import Server.Response
import Shared
import UrlPath
import View exposing (View)
import WebsiteVersion exposing (Website)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


init :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect.Effect Msg )
init app shared =
    ( {}, Effect.none )


update :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect.Effect Msg )
update app shared msg model =
    ( model, Effect.none )


subscriptions : RouteParams -> UrlPath.UrlPath -> Shared.Model -> Model -> Sub Msg
subscriptions routeParams path shared model =
    Sub.none


type alias Data =
    { websites : List Website
    }


type alias ActionData =
    {}


data : BackendTask FatalError Data
data =
    BackendTask.succeed Data
        |> BackendTask.andMap WebsiteVersion.getWebsites


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Head.Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Time Machine"
        , image =
            { url = [ "old-websites.logo.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "Time Machine Logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Welcome to my old websites!"
        , locale = Nothing
        , title = "Time Machine"
        }
        |> Head.Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    { title = "Time Machine"
    , body = [ Html.text "TODO" ]

    -- viewWebsites app.data.websites
    -- |> Html.map PagesMsg.fromMsg
    }


action :
    RouteParams
    -> Server.Request.Request
    -> BackendTask.BackendTask FatalError.FatalError (Server.Response.Response ActionData ErrorPage.ErrorPage)
action routeParams request =
    BackendTask.succeed (Server.Response.render {})
