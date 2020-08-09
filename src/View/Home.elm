module View.Home exposing
    ( Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

{-| The Title screen with icosahedron
-}

import Color
import Data.Flags exposing (Flags, WindowSize)
import Element exposing (Element)
import Element.Font as Font
import FeatherIcons
import Html.Attributes
import Icon
import Icosahedron
import Util



---- MODEL ----


type alias Model =
    { windowSize : WindowSize
    , ico : Icosahedron.Model
    }


init : Flags -> Model
init flags =
    let
        icoSize =
            flags.windowSize.height // 2
    in
    { windowSize = flags.windowSize
    , ico = Icosahedron.init icoSize
    }



---- VIEW ----


view : Model -> Element Msg
view model =
    Element.column
        [ Element.width Element.fill
        , Element.height <| Element.px model.windowSize.height
        , Element.padding 36
        , Icosahedron.view model.ico
            |> Element.map IcoMsg
            |> Element.el
                [ Element.centerX
                , Element.centerY
                ]
            |> Element.behindContent
        ]
        [ Element.column
            [ Element.width (Element.maximum 800 Element.fill)
            , Element.centerX
            , Element.height Element.fill
            , Element.spaceEvenly
            , Font.center
            ]
            [ Element.paragraph
                [ Element.centerX
                , Font.size 100
                , Font.bold
                , Font.letterSpacing 3
                , Font.family
                    [ Font.typeface "Playfair Display SC" ]
                ]
                [ Element.text "Joshua Ji" ]
            , Element.paragraph
                [ Element.centerX
                , Element.spacing 4
                , Font.size 25
                ]
                [ Element.text "I am a undergraduate student studying computer science at the University of Alberta. I love web development, especially through functional languages like Elm." ]

            -- navbar
            , Element.row
                [ Element.width Element.fill
                , Element.centerX
                , Element.spaceEvenly
                ]
              <|
                List.map
                    (\label ->
                        Element.paragraph
                            [ Element.width Element.shrink
                            , Element.paddingXY 1 2
                            , Element.htmlAttribute <| Html.Attributes.class "fat-underline"
                            , Element.pointer
                            , Font.size 30
                            , Font.family
                                [ Font.typeface "Playfair Display SC"
                                , Font.sansSerif
                                ]
                            ]
                            [ Element.text label ]
                    )
                    [ "About", "Projects", "Contact" ]
            ]
            |> Util.surround
                { vertical = True
                , first = 2
                , middle = 5
                , last = 2
                }
        , Icon.view
            [ Element.centerX
            , Element.alignBottom
            ]
            { icon = FeatherIcons.chevronDown
            , strokeWidth = 2
            , color = Color.black
            , size = 40
            , msg = Nothing
            }
        ]



---- UPDATE ----


type Msg
    = IcoMsg Icosahedron.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        IcoMsg icoMsg ->
            ( { model | ico = Icosahedron.update icoMsg model.ico }, Cmd.none )



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions model =
    Icosahedron.subscriptions model.ico
        |> Sub.map IcoMsg
