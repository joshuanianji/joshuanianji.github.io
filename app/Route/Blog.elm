module Route.Blog exposing (Model, Msg, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import Article
import BackendTask exposing (BackendTask)
import Css exposing (..)
import Effect
import ErrorPage
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html.Styled as Html exposing (Attribute, Html, styled)
import Html.Styled.Attributes exposing (css)
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
    { title = "Blog | Joshua Ji"
    , body = [ content ]
    }


content : Html msg
content =
    Html.div
        [ css
            [ maxWidth (px 900)
            , margin2 zero auto
            , displayFlex
            , flexDirection column
            , property "gap" "4em"
            ]
        ]
        [ Html.h1
            [ css
                [ fontSize (px 48)
                , fontFamilies [ qt "Playfair Display SC" ]
                , margin2 (em 1) zero
                ]
            ]
            [ Html.text "Blog" ]
        ]
