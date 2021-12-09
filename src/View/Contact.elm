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
    {}


init : Model
init =
    {}



---- VIEW ----


view : SharedState -> Model -> Element Msg
view sharedState _ =
    let
        ( spacing, align, fontAlign ) =
            case sharedState.device.class of
                Element.Phone ->
                    ( 24, Element.centerX, Font.center )

                _ ->
                    ( 48, Element.alignLeft, Font.alignLeft )
    in
    Element.column
        [ Element.width (Element.maximum 900 Element.fill)
        , Element.paddingXY 4 0
        , Element.centerX
        , Element.spacing 32

        -- distinct id for us to jump to
        , Element.htmlAttribute <| Html.Attributes.id "contact"
        ]
        [ -- title
          Util.pageTitle sharedState.device.class "Contact" NavigateTo Routes.Contact
        , Element.paragraph
            [ fontAlign ]
            [ Element.text "Feel free to contact me anytime!" ]
        , Element.wrappedRow
            [ Element.spacing spacing
            , align
            ]
            [ contactColumn sharedState FeatherIcons.mail "mailto:joshuanji23@gmail.com" "Email"
            , contactColumn sharedState FeatherIcons.github "https://github.com/joshuanianji" "Github"
            , contactColumn sharedState FeatherIcons.linkedin "https://linkedin.com/in/joshua-ji-b596851a8" "LinkedIn"
            ]
        ]


contactColumn : SharedState -> FeatherIcons.Icon -> String -> String -> Element Msg
contactColumn sharedState icon link label =
    let
        { padding, spacing, size, fontSize } =
            case sharedState.device.class of
                Element.Phone ->
                    { padding = 8, spacing = 8, size = 24, fontSize = 14 }

                _ ->
                    { padding = 16, spacing = 16, size = 48, fontSize = 20 }

        iconView =
            Icon.view
                []
                { icon = icon
                , strokeWidth = 2
                , color = Colours.black
                , size = size
                , msg = Nothing
                }
    in
    Element.column
        [ Element.spacing spacing
        , Element.padding padding
        ]
        [ Element.newTabLink
            [ Element.centerX
            , Element.padding <| padding * 2
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
            [ Font.center
            , Font.size fontSize
            ]
            [ Element.text label ]
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
