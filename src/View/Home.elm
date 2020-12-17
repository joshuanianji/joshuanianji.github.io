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

import Browser.Navigation as Nav
import Colours
import Data.Flags exposing (Flags, WindowSize)
import Element exposing (Element)
import Element.Background as Background
import Element.Events as Events
import Element.Font as Font
import FeatherIcons
import Html.Attributes
import Icon
import Icosahedron
import Ports
import Process
import Routes exposing (Route)
import SharedState exposing (SharedState)
import Task
import Util



---- MODEL ----


type alias Model =
    { windowSize : WindowSize
    , ico : Icosahedron.Model
    , timeMachineInfo : Bool
    , inViewport : Bool -- if it is in viewport - we know whether ir not to run the icosahedron thing
    }


init : Flags -> Model
init flags =
    let
        icoSize =
            flags.windowSize.height // 2
    in
    { windowSize = flags.windowSize
    , timeMachineInfo = False
    , ico = Icosahedron.init icoSize flags.icoSeed
    , inViewport = True
    }



---- VIEW ----


view : Model -> Element Msg
view model =
    Element.column
        [ Element.width Element.fill
        , Element.height <| Element.px model.windowSize.height
        , Element.padding 36

        -- distinct id for us to jump to
        , Element.htmlAttribute <| Html.Attributes.id "home"
        , Icosahedron.view model.ico
            |> Element.map IcoMsg
            |> Element.el
                [ Element.centerX
                , Element.centerY
                ]
            |> Element.behindContent
        ]
        [ Element.column
            [ Element.width (Element.maximum 900 Element.fill)
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
                , Font.bold
                ]
                [ Element.text "Welc"
                , Element.paragraph
                    [ Element.pointer
                    , Element.mouseOver
                        [ Font.color <| Colours.toElement Colours.subtleBlack ]
                    , Events.onDoubleClick OpenTimeMachine
                    ]
                    [ Element.text "o" ]
                , Element.text "me to my website!"
                ]
            , Element.paragraph
                [ Element.centerX
                , Font.size 25
                ]
                [ Element.text "I am an undergraduate student studying computer science at the University of Alberta. I love web development, especially through functional languages like Elm." ]

            -- time machine info
            , if model.timeMachineInfo then
                Element.paragraph
                    [ Element.paddingXY 6 3
                    , Font.size 15
                    , Font.color <| Colours.toElement Colours.subtleBlack
                    , Background.color <| Colours.toElement Colours.white
                    ]
                    [ Element.text "Time machine available. Scroll to bottom." ]

              else
                Element.el
                    [ Element.height <| Element.px 22
                    , Element.width <| Element.px 1
                    ]
                    Element.none

            -- navbar
            , navbar model
            ]
            |> Util.surround
                { vertical = True
                , first = 1
                , middle = 3
                , last = 1
                }
        , Icon.view
            [ Element.centerX
            , Element.alignBottom
            ]
            { icon = FeatherIcons.chevronDown
            , strokeWidth = 2
            , color = Colours.black
            , size = 40
            , msg = Nothing
            }
        ]



-- helper type for the Navbar


type Link
    = Route Routes.Route
    | Url String


navbar : Model -> Element Msg
navbar model =
    Element.row
        [ Element.width Element.fill
        , Element.centerX
        , Element.spaceEvenly
        ]
    <|
        List.map
            (\( label, link ) ->
                Element.el
                    [ Element.width Element.shrink
                    , Element.paddingXY 1 2
                    , Element.htmlAttribute <| Html.Attributes.class "fat-underline"
                    , Font.size 30
                    , Font.family [ Font.typeface "Playfair Display SC" ]
                    ]
                <|
                    case link of
                        Route route ->
                            Element.paragraph
                                [ Font.center
                                , Element.pointer
                                , Events.onClick <| NavigateTo route
                                ]
                                [ Element.text label ]

                        Url url ->
                            Element.row
                                [ Element.spacing 2
                                , Element.width Element.fill
                                ]
                                [ Element.newTabLink
                                    [ Element.centerX ]
                                    { url = url
                                    , label = Element.text label
                                    }
                                , Icon.view
                                    [ Element.centerY
                                    ]
                                    { icon = FeatherIcons.externalLink
                                    , strokeWidth = 2
                                    , color = Colours.black
                                    , size = 24
                                    , msg = Nothing
                                    }
                                ]
            )
            [ ( "About", Route Routes.About )
            , ( "Projects", Route Routes.Projects )
            , ( "Contact", Route Routes.Contact )
            , ( "Resume", Url "https://joshuaji.com/resume.pdf" )
            ]



---- UPDATE ----


type Msg
    = NavigateTo Route
    | IcoMsg Icosahedron.Msg
    | OpenTimeMachine
    | CloseTimeMachineInfo
    | UpdateViewport Bool


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedState.Msg )
update sharedState msg model =
    case msg of
        NavigateTo route ->
            ( model, Nav.pushUrl sharedState.navKey (Routes.toUrlString route), SharedState.NoOp )

        IcoMsg icoMsg ->
            ( { model | ico = Icosahedron.update icoMsg model.ico }, Cmd.none, SharedState.NoOp )

        OpenTimeMachine ->
            ( { model | timeMachineInfo = True }
            , Process.sleep 3000
                |> Task.perform (always CloseTimeMachineInfo)
            , SharedState.OpenTimeMachine
            )

        CloseTimeMachineInfo ->
            ( { model | timeMachineInfo = False }
            , Cmd.none
            , SharedState.NoOp
            )

        UpdateViewport viewport ->
            ( { model | inViewport = viewport }
            , Cmd.none
            , SharedState.NoOp
            )



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        icoSub =
            if model.inViewport then
                Icosahedron.subscriptions model.ico
                    |> Sub.map IcoMsg

            else
                Sub.none
    in
    Sub.batch
        [ Ports.updateHomeViewport UpdateViewport
        , icoSub
        ]
