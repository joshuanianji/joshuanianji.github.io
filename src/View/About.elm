module View.About exposing
    ( Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Browser.Navigation as Nav
import Colours
import Element exposing (Element)
import Element.Font as Font
import FeatherIcons
import Html.Attributes
import Icon
import Routes exposing (Route)
import SharedState exposing (SharedState)
import Util



---- MODEL ----


type alias Model =
    {}


init : Model
init =
    {}



---- VIEW ----


view : Model -> Element Msg
view model =
    Element.column
        [ Element.width (Element.maximum 800 Element.fill)
        , Element.centerX
        , Element.spacing 32

        -- distinct id for us to jump to
        , Element.htmlAttribute <| Html.Attributes.id "about"
        ]
        [ -- title
          Util.pageTitle "About" NavigateTo Routes.About
        , Element.textColumn
            [ Element.spacing 16
            , Element.spacing 4
            ]
            [ -- subtitle
              Element.paragraph
                [ Element.spacing 6 ]
                [ Element.text "I have been coding with HTML, CSS and Javascript since I was 12: making blogs, web apps, or anything that will make my life easier. Recently, I've been taking a deep dive into functional programming, and I'm currently using "
                , Util.link
                    { label = "Elm"
                    , link = "https://elm-lang.org"
                    }
                , Element.text " as my main language for my web apps. On the side, I'm learning Haskell, Purescript and Rust."
                ]
            ]
        ]



---- UPDATE ----


type Msg
    = NavigateTo Route


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg )
update sharedState msg model =
    case msg of
        NavigateTo route ->
            ( model, Nav.pushUrl sharedState.navKey (Routes.toUrlString route) )



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
