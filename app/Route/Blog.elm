module Route.Blog exposing (Model, Msg, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import Article
import BackendTask exposing (BackendTask)
import Effect
import ErrorPage
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html.Styled as Html
import Pages.Url
import PagesMsg
import Route exposing (Route)
import RouteBuilder exposing (App, StatelessRoute)
import Server.Request
import Server.Response
import Shared
import UrlPath
import View exposing (View)


type alias Msg =
    ()


type alias RouteParams =
    {}


type alias Model =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState
            { view = view
            }


type alias Data =
    List ( Route, Article.ArticleMetadata )


type alias ActionData =
    {}


data : BackendTask FatalError Data
data =
    Article.allMetadata
        |> BackendTask.allowFatal


head : App Data ActionData RouteParams -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "joshuas-blog"
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Articles by Joshua Ji"
        , locale = Nothing
        , title = "Joshua's Blog"
        }
        |> Seo.website


view :
    App Data ActionData {}
    -> Shared.Model
    -> View msg
view app shared =
    { title = "Blog", body = [ Html.h2 [] [ Html.text "Blog" ] ] }
