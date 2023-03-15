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
                ( 16, 8 )

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
                [ Element.text "I started off with HTML, CSS and Javascript: making blogs, web apps, or anything that will make my life easier."
                ]
            , Element.paragraph
                [ Element.spacing 6 ]
                [ Element.text "Currently, I use "
                , Util.link
                    { label = "Elm"
                    , link = "https://elm-lang.org"
                    }
                , Element.text " and "
                , Util.link
                    { label = "Typescript"
                    , link = "https://www.typescriptlang.org"
                    }
                , Element.text " for most of my projects, and I'm learning Haskell, Purescript and Rust on my free time."
                ]
            , Element.paragraph [ Element.spacing 6 ]
                [ Element.text "I've recently been taking a deep dive into DevOps. I'm always looking for new ways to improve and automate my workflow. It's exciting to keep learning in this vast and complex field!"
                ]
            , Element.paragraph
                [ Element.spacing 6 ]
                [ Element.text "In my free time, I like to play volleyball and walk my dog. I also love reading scifi: check me out on "
                , Util.link
                    { label = "Hardcover"
                    , link = "https://hardcover.app/@OshuaJay"
                    }
                , Element.text "!"
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
