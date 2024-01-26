module Route.AllProjects exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import BackendTask.File
import Css exposing (..)
import Effect
import FatalError
import Head
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import PagesMsg
import Project exposing (Project)
import RouteBuilder exposing (StatelessRoute)
import Shared
import UrlPath
import Util
import View


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
    { -- top 3 "pinned" projects
      featured : List Project

    -- projects on the home page (should be no more than 5)
    , home : List Project

    -- other projects
    , other : List Project
    }


type alias ActionData =
    BackendTask.BackendTask FatalError.FatalError (List RouteParams)


data : BackendTask FatalError.FatalError Data
data =
    BackendTask.File.rawFile "projects.yml"
        |> BackendTask.allowFatal
        |> BackendTask.andThen Project.getProjects
        |> BackendTask.andThen Project.splitProjects


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    []


view :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> View.View (PagesMsg.PagesMsg Msg)
view app shared =
    { title = "All Projects | Joshua Ji"
    , body =
        [ Html.div
            [ css
                [ displayFlex
                , alignItems center
                , justifyContent center
                , padding (em 1)
                ]
            ]
            [ Html.div
                [ css
                    [ Util.flexDirection Util.Column
                    , maxWidth (px 900)
                    ]
                ]
                [ Html.h2 [ css [ marginTop (em 2) ] ] [ Html.text "⭐ Featured" ]
                , viewList app.data.featured
                , Html.h2 [ css [ marginTop (em 2) ] ] [ Html.text "🎖️ Honourable Mentions" ]
                , viewList app.data.home
                , Html.h2 [ css [ marginTop (em 2) ] ] [ Html.text "📁 Other Projects" ]
                , viewList app.data.other
                ]
            ]
        ]
    }


viewList : List Project -> Html msg
viewList projs =
    Html.div
        [ css
            [ Util.flexDirection Util.Column
            , alignItems center
            , justifyContent center
            , property "gap" "0.75em"
            ]
        ]
        (List.map Project.view projs)
