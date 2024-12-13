module Shared exposing (Data, Model, Msg(..), SharedMsg(..), template)

import BackendTask exposing (BackendTask)
import Colours
import Css exposing (..)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import Html
import Html.Styled
import Html.Styled.Attributes exposing (css)
import Icosahedron
import Pages.Flags
import Pages.PageUrl exposing (PageUrl)
import Route exposing (Route)
import SharedTemplate exposing (SharedTemplate)
import Url
import UrlPath exposing (UrlPath)
import Util
import View exposing (View)


template : SharedTemplate Msg Model Data msg
template =
    { init = init
    , update = update
    , view = view
    , data = data
    , subscriptions = subscriptions
    , onPageChange = Nothing
    }


type Msg
    = SharedMsg SharedMsg
    | IcoMsg Icosahedron.Msg


type alias Data =
    ()


type SharedMsg
    = NoOp


type alias Model =
    { ico : Icosahedron.Model
    }


init :
    Pages.Flags.Flags
    ->
        Maybe
            { path :
                { path : UrlPath
                , query : Maybe String
                , fragment : Maybe String
                }
            , metadata : route
            , pageUrl : Maybe PageUrl
            }
    -> ( Model, Effect Msg )
init flags maybePagePath =
    let
        icoConfig =
            { size = 100
            , degs = 33
            , color = Colours.darkGray
            }
    in
    ( { ico = Icosahedron.init icoConfig }
    , Effect.none
    )


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        SharedMsg globalMsg ->
            ( model, Effect.none )

        IcoMsg icoMsg ->
            ( { model | ico = Icosahedron.update icoMsg model.ico }, Effect.none )


subscriptions : UrlPath -> Model -> Sub Msg
subscriptions _ model =
    Icosahedron.subscriptions model.ico
        |> Sub.map IcoMsg


data : BackendTask FatalError Data
data =
    BackendTask.succeed ()


view :
    Data
    ->
        { path : UrlPath
        , route : Maybe Route
        }
    -> Model
    -> (Msg -> msg)
    -> View msg
    -> { body : List (Html.Html msg), title : String }
view sharedData page model toMsg pageView =
    let
        pageTemplate =
            if page.route == Just Route.Index then
                homeTemplate

            else
                withNavbarTemplate model toMsg
    in
    { body =
        pageTemplate pageView.body
            |> List.map Html.Styled.toUnstyled
    , title = pageView.title
    }


homeTemplate : List (Html.Styled.Html msg) -> List (Html.Styled.Html msg)
homeTemplate content =
    [ Html.Styled.main_ [] content
    ]


withNavbarTemplate : Model -> (Msg -> msg) -> List (Html.Styled.Html msg) -> List (Html.Styled.Html msg)
withNavbarTemplate model toMsg content =
    [ Html.Styled.map toMsg (navbar model)
    , Html.Styled.main_ [] content
    ]


navbar : Model -> Html.Styled.Html Msg
navbar model =
    Html.Styled.ul
        [ css
            [ Util.flexDirection Util.Row
            , alignItems center
            , property "gap" "0.5em"
            , listStyleType none
            , margin4 zero (em 2) zero zero
            , padding zero
            ]
        ]
        [ Html.Styled.li
            []
            [ Html.Styled.a
                [ Html.Styled.Attributes.href "/" ]
                [ Icosahedron.view model.ico
                    |> Html.Styled.map IcoMsg
                    |> Util.htmlRouteLink Route.Index
                ]
            ]
        , Html.Styled.li
            [ css [ marginLeft auto ] ]
            [ Util.textRouteLink Route.Index "Home" ]
        , Html.Styled.li
            []
            [ Util.textRouteLink Route.AllProjects "Projects" ]
        , Html.Styled.li
            []
            [ Util.textRouteLink Route.Blog "Blog" ]
        ]
