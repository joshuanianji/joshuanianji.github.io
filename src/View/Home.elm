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


view : SharedState -> Model -> Element Msg
view sharedState model =
    let
        surround =
            case sharedState.device.class of
                Element.Phone ->
                    { vertical = True
                    , first = 2
                    , middle = 20
                    , last = 3
                    }

                _ ->
                    { vertical = True
                    , first = 1
                    , middle = 3
                    , last = 1
                    }

        content =
            case sharedState.device.class of
                Element.Phone ->
                    Element.column
                        [ Element.height Element.fill
                        , Element.width Element.fill
                        ]
                        [ Element.column
                            [ Element.height <| Element.fillPortion 4
                            , Element.centerX
                            , Element.spaceEvenly
                            ]
                            [ title sharedState model
                            , subTitle sharedState model
                            , description sharedState model
                            , mTimeMachine sharedState model
                            ]

                        -- navbar will ALWAYS take up 2/5 of the available space
                        , Element.el
                            [ Element.height <| Element.fillPortion 3
                            , Element.width Element.fill
                            ]
                            (navbar sharedState.device.class model)
                        ]

                _ ->
                    Element.column
                        [ Element.width (Element.maximum 900 Element.fill)
                        , Element.centerX
                        , Element.height Element.fill
                        , Element.spaceEvenly
                        ]
                        [ title sharedState model
                        , subTitle sharedState model
                        , description sharedState model
                        , mTimeMachine sharedState model
                        , navbar sharedState.device.class model
                        ]
    in
    Element.column
        [ Element.width Element.fill
        , Element.height <| Element.px model.windowSize.height
        , Element.padding 36

        -- distinct id for us to jump to
        , Element.htmlAttribute <| Html.Attributes.id "home"
        , Element.behindContent <| icosahedron sharedState model
        ]
        [ Util.surround surround content

        -- icon
        , Icon.view
            [ Element.centerX
            , Element.alignBottom
            , Element.pointer
            , Events.onClick <| NavigateTo Routes.About
            ]
            { icon = FeatherIcons.chevronDown
            , strokeWidth = 2
            , color = Colours.black
            , size = 40
            , msg = Nothing
            }
        ]


icosahedron : SharedState -> Model -> Element Msg
icosahedron sharedState model =
    case sharedState.device.class of
        Element.Phone ->
            -- name the ID so javascript can still query it. Wont do anything though xd.
            Element.el [ Element.htmlAttribute (Html.Attributes.id "icosahedron") ] Element.none

        _ ->
            Icosahedron.view model.ico
                |> Element.map IcoMsg
                |> Element.el
                    [ Element.centerX
                    , Element.centerY
                    ]


title : SharedState -> Model -> Element Msg
title sharedState model =
    let
        fontSize =
            case sharedState.device.class of
                Element.Phone ->
                    42

                _ ->
                    100
    in
    Element.paragraph
        [ Font.size fontSize
        , Font.bold
        , Font.center
        , Font.letterSpacing 3
        , Font.family
            [ Font.typeface "Playfair Display SC" ]
        ]
        [ Element.text "Joshua Ji" ]


subTitle : SharedState -> Model -> Element Msg
subTitle sharedState model =
    let
        fontSize =
            case sharedState.device.class of
                Element.Phone ->
                    18

                _ ->
                    25
    in
    Element.paragraph
        [ Element.spacing 4
        , Font.center
        , Font.size fontSize
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


description : SharedState -> Model -> Element Msg
description sharedState model =
    let
        ( fontSize, text ) =
            case sharedState.device.class of
                Element.Phone ->
                    ( 16, "Here are some of my projects, my resume, and ways to contact me!" )

                _ ->
                    ( 25, "I am an undergraduate student studying computer science at the University of Alberta. I love web development, especially through functional languages like Elm." )
    in
    Element.paragraph
        [ Font.center
        , Font.size fontSize
        ]
        [ Element.text text ]


mTimeMachine : SharedState -> Model -> Element Msg
mTimeMachine sharedState model =
    let
        fontSize =
            case sharedState.device.class of
                Element.Phone ->
                    12

                _ ->
                    15
    in
    if model.timeMachineInfo then
        Element.paragraph
            [ Element.paddingXY 6 3
            , Element.width Element.shrink
            , Element.centerX
            , Font.size fontSize
            , Font.color <| Colours.toElement Colours.white
            , Background.color <| Colours.toElement Colours.themeBlue
            ]
            [ Element.text "Time machine available. Scroll to bottom." ]

    else
        Element.el
            [ Element.height <| Element.px <| fontSize + 7
            , Element.width <| Element.px 1
            ]
            Element.none



-- helper type for the Navbar


type Link
    = Route Routes.Route
    | Url String


navbar : Element.DeviceClass -> Model -> Element Msg
navbar device model =
    let
        navbarItems =
            List.map
                (navbarItem device)
                [ ( "About", Route Routes.About )
                , ( "Projects", Route Routes.Projects )
                , ( "Contact", Route Routes.Contact )
                , ( "Resume", Url "https://joshuaji.com/resume.pdf" )
                ]
    in
    case device of
        Element.Phone ->
            Element.column
                [ Element.height Element.fill
                , Element.spaceEvenly
                , Element.centerX
                ]
                navbarItems

        _ ->
            Element.row
                [ Element.width Element.fill
                , Element.spaceEvenly
                ]
                navbarItems


navbarItem : Element.DeviceClass -> ( String, Link ) -> Element Msg
navbarItem device ( label, link ) =
    let
        ( fontSize, center ) =
            case device of
                Element.Phone ->
                    ( 24, Element.centerX )

                _ ->
                    ( 30, Element.centerY )
    in
    Element.el
        [ Element.width Element.shrink
        , center
        , Element.paddingXY 1 2
        , Element.htmlAttribute <| Html.Attributes.class "fat-underline"
        , Font.size fontSize
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
            , Process.sleep 5000
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


subscriptions : SharedState -> Model -> Sub Msg
subscriptions sharedState model =
    let
        icoSub =
            case ( model.inViewport, sharedState.device.class ) of
                ( True, Element.Phone ) ->
                    Sub.none

                ( True, _ ) ->
                    Icosahedron.subscriptions model.ico
                        |> Sub.map IcoMsg

                ( _, _ ) ->
                    Sub.none
    in
    Sub.batch
        [ Ports.updateHomeViewport UpdateViewport
        , icoSub
        ]
