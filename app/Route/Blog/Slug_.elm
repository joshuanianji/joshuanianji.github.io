module Route.Blog.Slug_ exposing (ActionData, Data, Model, Msg, route)

import Article exposing (ArticleMetadata)
import BackendTask exposing (BackendTask)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html.Styled as Html
import Markdown.Block
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
        |> RouteBuilder.buildNoState { view = view }


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
    { metadata : ArticleMetadata
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
    -> View (PagesMsg Msg)
view app sharedModel =
    { title = app.data.metadata.title
    , body =
        [ Html.h1 [] [ Html.text app.data.metadata.title ]
        , Html.text "You're on the page Blog.Slug_"
        ]
    }
