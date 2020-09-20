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
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import FeatherIcons
import Html.Attributes
import Icon
import Routes exposing (Route)
import SharedState exposing (SharedState)
import Util



---- MODEL ----


type alias Model =
    { githubIcon : String }


init : String -> Model
init icon =
    { githubIcon = icon }



---- VIEW ----


view : Model -> Element Msg
view _ =
    Element.column
        [ Element.width (Element.maximum 900 Element.fill)
        , Element.centerX
        , Element.spacing 32

        -- distinct id for us to jump to
        , Element.htmlAttribute <| Html.Attributes.id "contact"
        ]
        [ -- title
          Util.pageTitle "Contact" NavigateTo Routes.Contact
        , Element.paragraph
            []
            [ Element.text "Feel free to contact me anytime!" ]
        , Element.row
            [ Element.spacing 48
            , Element.width Element.fill
            ]
            [ contactColumn FeatherIcons.mail "mailto:joshuanji23@gmail.com" "Email"
            , contactColumn FeatherIcons.github "https://github.com/joshuanianji" "Github"
            ]
        ]


contactColumn : FeatherIcons.Icon -> String -> String -> Element Msg
contactColumn icon link label =
    let
        iconView =
            Icon.view
                []
                { icon = icon
                , strokeWidth = 2
                , color = Colours.black
                , size = 48
                , msg = Nothing
                }
    in
    Element.column
        [ Element.spacing 16
        , Element.padding 16
        ]
        [ Element.newTabLink
            [ Element.centerX
            , Element.padding 32
            , Border.rounded 64
            , Element.mouseOver
                [ Background.color <| Colours.toElement Colours.gray
                , Font.color <| Colours.toElement Colours.white
                ]
            ]
            { url = link
            , label = iconView
            }
        , Element.paragraph
            [ Font.center ]
            [ Element.text label ]
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
subscriptions _ =
    Sub.none
