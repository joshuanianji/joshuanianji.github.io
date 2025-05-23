port module Route.Blog.Slug_ exposing (ActionData, Data, Model, Msg, route)

import Article exposing (Metadata)
import BackendTask exposing (BackendTask)
import Css exposing (..)
import Date exposing (Date)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html.Styled as Html exposing (Attribute, Html, styled)
import Html.Styled.Attributes exposing (css)
import Markdown.Block
import Markdown.Renderer
import MarkdownCodec
import MarkdownRenderer
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Shared
import View exposing (View)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    { slug : String }


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.preRender
        { head = head
        , pages = pages
        , data = data
        }
        |> RouteBuilder.buildWithLocalState
            { view = view
            , init = \_ _ -> ( Model, Effect.fromCmd (highlightJS ()) )
            , update = \_ _ _ _ -> ( Model, Effect.none )
            , subscriptions = \_ _ _ _ -> Sub.none
            }


pages : BackendTask FatalError (List RouteParams)
pages =
    Article.blogPostsGlob
        |> BackendTask.map
            (List.map
                (\globData ->
                    { slug = globData.slug }
                )
            )


type alias Data =
    { metadata : Metadata
    , body : List Markdown.Block.Block
    }


type alias ActionData =
    {}


data : RouteParams -> BackendTask FatalError Data
data routeParams =
    MarkdownCodec.withFrontmatter Data
        Article.frontmatterDecoder
        MarkdownRenderer.renderer
        ("blog/" ++ routeParams.slug ++ ".md")


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "joshuas-blog"
        , image =
            { url = Pages.Url.external "TODO"
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = app.data.metadata.description
        , locale = Nothing
        , title = app.data.metadata.title
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Model
    -> View (PagesMsg Msg)
view app sharedModel model =
    { title = app.data.metadata.title
    , body = [ content app ]
    }


content : App Data ActionData RouteParams -> Html msg
content app =
    Html.div
        [ css
            [ maxWidth (px 900)
            , margin2 zero auto
            , displayFlex
            , flexDirection column
            , padding (em 1)
            , property "gap" "1em"
            ]
        ]
        [ Html.h1
            [ css
                [ fontSize (px 48)
                , fontFamilies [ qt "Playfair Display SC" ]
                , margin2 (em 0.5) zero
                ]
            ]
            [ Html.text app.data.metadata.title ]
        , Html.p
            [ css
                [ fontSize (em 0.75) ]
            ]
            [ Html.text <| Date.format "MMMM d, yyyy" app.data.metadata.published ]
        , app.data.body
            |> Markdown.Renderer.render MarkdownRenderer.renderer
            |> Result.withDefault []
            |> Html.div
                [ css
                    [ fontSize (px 18) ]
                ]
        ]


port highlightJS : () -> Cmd msg
