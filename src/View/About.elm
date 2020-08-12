module View.About exposing
    ( Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Browser.Navigation as Nav
import Color
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
          Element.paragraph
            [ Element.htmlAttribute <| Html.Attributes.class "fat-underline"
            , Element.width Element.shrink
            , Element.paddingXY 0 4
            , Font.size 50
            , Font.family [ Font.typeface "Playfair Display SC" ]

            -- link thingy
            , Element.onLeft <|
                Icon.view
                    [ Element.centerY
                    , Element.paddingXY 16 0
                    ]
                    { icon = FeatherIcons.link
                    , strokeWidth = 2
                    , color = Color.gray
                    , size = 25
                    , msg =
                        Just
                            { hoverColor = Just Colours.themeBlue
                            , msg = NavigateTo Routes.About
                            }
                    }
            ]
            [ Element.text "About" ]
        , Element.textColumn
            [ Element.spacing 16
            , Element.spacing 4
            ]
            [ -- subtitle
              Element.paragraph
                [ Element.spacing 6 ]
                [ Element.text "I have been coding with HTML, CSS and Javascript since I was 12: making blogs, web apps, or anything that will make my life easier. Currently, my projects are in "
                , Util.link
                    { label = "Elm"
                    , link = "https://elm-lang.org"
                    }
                , Element.text ", and I have been learning Haskell, Purescript and Rust."
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
