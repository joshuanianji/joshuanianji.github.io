module View.About exposing
    ( Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Browser.Navigation as Nav
import Element exposing (Element)
import Element.Font as Font
import Html.Attributes
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


view : SharedState -> Model -> Element Msg
view sharedState _ =
    let
        ( fontSize, paddingX ) =
            if sharedState.device.class == Element.Phone then
                ( 16, 4 )

            else
                ( 22, 0 )
    in
    Element.column
        [ Element.width (Element.maximum 900 Element.fill)
        , Element.centerX
        , Element.spacing 32

        -- distinct id for us to jump to
        , Element.htmlAttribute <| Html.Attributes.id "about"
        ]
        [ -- title
          Util.pageTitle sharedState.device.class "About" NavigateTo Routes.About
        , Element.textColumn
            [ Element.spacing 16
            , Element.width Element.fill
            , Element.paddingXY paddingX 0
            , Font.size fontSize
            ]
            [ -- subtitle
              Element.paragraph
                [ Element.spacing 6 ]
                [ Element.text "I have been coding with HTML, CSS and Javascript since I was 12: making blogs, web apps, or anything that will make my life easier."
                ]
            , Element.paragraph
                [ Element.spacing 6 ]
                [ Element.text "Recently, I've been taking a deep dive into functional programming. I'm currently using "
                , Util.link
                    { label = "Elm"
                    , link = "https://elm-lang.org"
                    }
                , Element.text " as my main language for my web apps, and I'm learning Haskell, Purescript and Rust on my free time."
                ]
            ]
        ]



---- UPDATE ----


type Msg
    = NavigateTo Route


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedState.Msg )
update sharedState msg model =
    case msg of
        NavigateTo route ->
            ( model, Nav.pushUrl sharedState.navKey (Routes.toUrlString route), SharedState.NoOp )



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
