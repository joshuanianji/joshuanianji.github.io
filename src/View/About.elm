module View.About exposing
    ( Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Color
import Colours
import Element exposing (Element)
import Element.Font as Font
import FeatherIcons
import Html.Attributes
import Icon



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
        ]
        [ -- title
          Element.paragraph
            [ Element.htmlAttribute <| Html.Attributes.class "fat-underline"
            , Element.width Element.shrink
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
                            , msg = NoOp
                            }
                    }
            ]
            [ Element.text "About" ]
        , Element.textColumn
            [ Element.spacing 16 ]
            [ -- subtitle
              Element.paragraph
                []
                [ Element.text "I have been coding with HTML, CSS and Javascript since I was 12, " ]
            , Element.paragraph
                []
                [ Element.text "" ]
            ]
        ]



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
