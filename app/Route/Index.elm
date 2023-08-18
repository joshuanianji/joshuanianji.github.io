module Route.Index exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import Colours exposing (blueTheme)
import Css exposing (..)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import Head
import Head.Seo as Seo
import Html.Styled as Html exposing (Attribute, Html, styled)
import Html.Styled.Attributes exposing (css, href, src)
import Html.Styled.Events exposing (onClick)
import Icosahedron
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Route
import RouteBuilder exposing (App, StatefulRoute)
import Shared
import UrlPath exposing (UrlPath)
import View exposing (View)


type alias Model =
    { ico : Icosahedron.Model }


type Msg
    = NoOp


type alias RouteParams =
    {}


type alias Data =
    { message : String
    }


type alias ActionData =
    {}


route : StatefulRoute RouteParams Data ActionData Model Msg
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildWithLocalState
            { init = init
            , view = view
            , update = update
            , subscriptions = subscriptions
            }


init :
    App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect Msg )
init app shared =
    ( { ico = Icosahedron.init 100 90 }, Effect.none )


update :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect Msg )
update app shared msg model =
    case msg of
        NoOp ->
            ( model, Effect.none )


subscriptions :
    RouteParams
    -> UrlPath
    -> Shared.Model
    -> Model
    -> Sub Msg
subscriptions routeParams path shared model =
    Sub.none


data : BackendTask FatalError Data
data =
    BackendTask.succeed Data
        |> BackendTask.andMap
            (BackendTask.succeed "Hello!")


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Welcome to elm-pages!"
        , locale = Nothing
        , title = "elm-pages is running"
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Model
    -> View (PagesMsg Msg)
view app shared model =
    { title = "(Dev) Joshua Ji - Home"
    , body =
        [ Html.div
            [ css
                [ width (vw 100)
                , height (vh 100)
                , position relative
                ]
            ]
            [ Html.div
                [ css
                    [ width (vw 100)
                    , height (vh 100)
                    , displayFlex
                    , alignItems center
                    , justifyContent center
                    ]
                ]
                [ jumbotron ]
            ]
        ]
    }


jumbotron : Html msg
jumbotron =
    Html.div
        [ css
            [ width (vw 60)
            , height (vh 60)
            , displayFlex
            , flexDirection column
            , justifyContent spaceAround
            ]
        ]
        [ Html.h1
            [ css
                [ textAlign center
                , fontSize (px 100)
                , fontFamilies [ qt "Playfair Display SC" ]
                ]
            ]
            [ Html.text "Joshua Ji" ]
        , Html.p
            [ css
                [ textAlign center
                , fontSize (px 25)
                , fontWeight bold
                ]
            ]
            [ Html.text "Welcome to my website!" ]
        , Html.p
            [ css
                [ textAlign center
                , fontSize (px 25)
                ]
            ]
            [ Html.text "I am an undergraduate student studying computer science at the University of Alberta. I enjoy making webapps, primarily with React and Elm, but I'm also a huge Docker + DevOps fan." ]
        , jumbotronNavbar
        ]


jumbotronNavbar : Html msg
jumbotronNavbar =
    let
        navItems =
            [ ( "About", "#about" )
            , ( "Projects", "#projects" )
            , ( "Contact", "#contact" )
            ]
    in
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , width (pct 100)
            , justifyContent spaceBetween
            ]
        ]
    <|
        List.map (\( text, url ) -> navItem [] [ Html.text text ]) navItems


navItem : List (Attribute msg) -> List (Html msg) -> Html msg
navItem =
    styled Html.a
        [ fontSize (px 30)
        , fontFamilies [ qt "Playfair Display SC" ]
        , boxShadow4 inset zero (px -10) blueTheme
        ]
