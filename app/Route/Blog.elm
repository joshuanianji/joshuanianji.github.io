module Route.Blog exposing (Model, Msg, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import Article
import BackendTask exposing (BackendTask)
import Colours
import Css exposing (..)
import Date exposing (Date)
import Effect
import ErrorPage
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html as HtmlOriginal
import Html.Styled as Html exposing (Html, styled)
import Html.Styled.Attributes exposing (css, fromUnstyled)
import Pages.Url
import PagesMsg
import Route exposing (Route)
import RouteBuilder exposing (App, StatelessRoute)
import Server.Request
import Server.Response
import Shared
import UrlPath
import Util
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
    , body = [ content app.data ]
    }


content : Data -> Html msg
content articles =
    Html.div
        [ css
            [ maxWidth (px 900)
            , margin2 zero auto
            , displayFlex
            , flexDirection column
            , property "gap" "1em"
            , padding (em 1)
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
        , Html.div
            [ css
                [ Util.flexDirection Util.Column
                , property "gap" "1em"
                ]
            ]
          <|
            List.map viewBlogPost articles
        ]


viewBlogPost : ( Route, Article.ArticleMetadata ) -> Html msg
viewBlogPost ( route_, metadata ) =
    Html.div
        [ css
            [ Util.flexDirection Util.Column
            , width (pct 100)
            , padding (em 1.5)
            , border3 (px 1) solid (Colours.toCss Colours.gray)
            , borderRadius (em 0.5)
            , hover
                [ borderColor (Colours.toCss Colours.black) ]
            , property "gap" "0.5em"
            ]
        ]
        [ Route.toLink (blogPostTitle metadata) route_
        , blogDate metadata.published
        , blogDescription metadata.description
        ]


blogPostTitle : Article.ArticleMetadata -> List (HtmlOriginal.Attribute msg) -> Html msg
blogPostTitle metadata attrs =
    Html.a
        ([ css
            [ fontSize (em 1.25)
            , fontWeight bold
            , textDecoration none
            , color (Colours.toCss Colours.black)
            , hover
                [ color (Colours.toCss Colours.themeBlue) ]
            ]
         ]
            ++ List.map fromUnstyled attrs
        )
        [ Html.text metadata.title ]


blogDate : Date -> Html msg
blogDate date =
    Html.p
        [ css
            [ fontSize (em 0.75) ]
        ]
        [ Html.text <| Date.format "MMMM d, yyyy" date ]


blogDescription : String -> Html msg
blogDescription description =
    Html.p [] [ Html.text description ]
