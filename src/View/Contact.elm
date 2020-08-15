module View.Contact exposing
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
import Html exposing (label)
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
        , Element.htmlAttribute <| Html.Attributes.id "contact"
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
                    , color = Colours.gray
                    , size = 25
                    , msg =
                        Just
                            { hoverColor = Just Colours.themeBlue
                            , msg = NavigateTo Routes.Contact
                            }
                    }
            ]
            [ Element.text "Contact" ]
        , Element.paragraph
            []
            [ Element.text "Feel free to contact me anytime <idk what to put here lmaooo>" ]
        , Element.column
            []
          <|
            List.map
                (\( icon, label ) ->
                    Element.row
                        []
                        [ Icon.view
                            []
                            { icon = icon
                            , strokeWidth = 1
                            , color = Colours.black
                            , size = 50
                            , msg = Nothing
                            }
                        , Element.text label
                        ]
                )
                [ ( FeatherIcons.github, "Github" )
                , ( FeatherIcons.mail, "Gmail" )
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
