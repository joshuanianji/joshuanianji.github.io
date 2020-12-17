module Main exposing (main)

import Browser exposing (Document, UrlRequest(..))
import Browser.Dom as Dom
import Browser.Events
import Browser.Navigation as Nav
import Colours
import Data.Flags as Flags exposing (WindowSize)
import Ease
import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import FeatherIcons
import Html exposing (Html)
import Html.Attributes
import Icon
import Json.Decode as Decode
import Json.Encode exposing (Value)
import Ports
import Routes exposing (Route)
import SharedState exposing (SharedState)
import SmoothScroll
import Task
import Url exposing (Url)
import Util
import View.About as About
import View.Contact as Contact
import View.Home as Home
import View.Projects as Projects



---- PROGRAM ----


main : Program Value Model Msg
main =
    Browser.application
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = ClickedLink
        , onUrlChange = UrlChanged
        }



---- MODEL ----


type alias Model =
    Result Decode.Error M


type alias M =
    { windowSize : WindowSize
    , sharedState : SharedState
    , route : Route
    , about : About.Model
    , home : Home.Model
    , projects : Projects.Model
    , contact : Contact.Model
    }



-- config for scrolling
-- higher speed means FASTER SCROLLING


scrollConfig : SmoothScroll.Config
scrollConfig =
    { offset = 12
    , speed = 75
    , easing = Ease.outQuint
    }


init : Value -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flagsJson url key =
    let
        flagsResult =
            Flags.decode flagsJson

        route =
            Routes.fromUrl url
    in
    case flagsResult of
        Err decodeErr ->
            ( Err decodeErr, Cmd.none )

        Ok flags ->
            ( Ok
                { windowSize = flags.windowSize
                , sharedState = SharedState.init key
                , route = route
                , about = About.init
                , home = Home.init flags
                , projects = Projects.init flags
                , contact = Contact.init
                }
            , Cmd.none
            )



---- VIEW ----


view : Model -> Document Msg
view model =
    let
        ( title, body ) =
            case model of
                Err decodeError ->
                    ( "Error!", viewErr decodeError )

                Ok m ->
                    ( "Joshua Ji - " ++ Routes.toStrCapitals m.route
                    , viewOk m
                    )
    in
    { title = title
    , body = [ body ]
    }


viewErr : Decode.Error -> Html Msg
viewErr err =
    Element.column
        [ Element.spacing 16
        , Element.centerX
        , Element.centerY
        ]
        [ Icon.view
            [ Element.centerX
            ]
            { icon = FeatherIcons.frown
            , strokeWidth = 2
            , color = Colours.errorRed
            , size = 40
            , msg = Nothing
            }
        , Element.paragraph
            [ Font.family [ Font.typeface "Playfair Display SC" ]
            , Font.center
            ]
            [ Element.text "Json Decoding error!" ]
        , Element.el
            [ Element.padding 16
            , Element.htmlAttribute (Html.Attributes.style "white-space" "pre-wrap")
            , Border.color <| Colours.toElement Colours.errorRed
            , Border.rounded 4
            , Border.width 2
            , Background.color <| Colours.toElement <| Colours.withAlpha 0.5 Colours.errorRed
            , Font.color <| Colours.toElement Colours.white
            ]
          <|
            Element.text (Decode.errorToString err)
        ]
        |> Element.layout
            [ Font.family
                [ Font.typeface "Lato"
                , Font.sansSerif
                ]
            ]


viewOk : M -> Html Msg
viewOk model =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.spacing 64
        ]
        [ Home.view model.home
            |> Element.map HomeMsg
        , About.view model.about
            |> Element.map AboutMsg
        , Projects.view model.projects
            |> Element.map ProjectsMsg
        , Contact.view model.contact
            |> Element.map ContactMsg
        , footer model.sharedState.timeMachineOpen
        ]
        |> Element.layout
            [ Font.family
                [ Font.typeface "Lato"
                , Font.sansSerif
                ]
            ]


footer : Bool -> Element Msg
footer showTimeMachine =
    Element.column
        [ Element.padding 64
        , Element.spacing 16
        , Element.width Element.fill
        ]
        [ Element.paragraph
            [ Font.center
            , Font.size 16
            ]
            [ Element.text "All code is open source and available on "
            , Util.link
                { label = "Github"
                , link = "https://github.com/joshuanianji/website"
                }
            , Element.text "."
            ]
        , if showTimeMachine then
            Element.paragraph
                [ Font.center
                , Font.size 16
                ]
                [ Element.text "Fun fact: This is the 5th iteration of my website! Feel free to "
                , Util.link
                    { label = "take a look"
                    , link = "https://joshuaji.com/time-machine/"
                    }
                , Element.text " at my old websites."
                ]

          else
            Element.none
        ]



---- UPDATE ----


type Msg
    = ClickedLink UrlRequest
    | UrlChanged Url
    | WindowResize WindowSize
    | ScrollTo String
    | HomeMsg Home.Msg
    | AboutMsg About.Msg
    | ProjectsMsg Projects.Msg
    | ContactMsg Contact.Msg
    | FailedRouteJump (Result Dom.Error (List ()))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg m =
    case ( m, msg ) of
        ( Ok model, ClickedLink urlRequest ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( m
                    , Nav.pushUrl model.sharedState.navKey (Url.toString url)
                    )

                Browser.External href ->
                    ( m
                    , Nav.load href
                    )

        ( Ok _, UrlChanged url ) ->
            let
                newRoute =
                    Routes.fromUrl url
            in
            update (ScrollTo <| Routes.toId newRoute) m

        ( Ok model, WindowResize newWindow ) ->
            ( Ok { model | windowSize = newWindow }, Cmd.none )

        ( Ok _, ScrollTo id ) ->
            ( m
            , SmoothScroll.scrollToWithOptions scrollConfig id
                |> Task.attempt FailedRouteJump
            )

        ( Ok model, HomeMsg homeMsg ) ->
            let
                ( newHomeModel, homeCmd, sharedStateMsg ) =
                    Home.update model.sharedState homeMsg model.home
            in
            ( Ok
                { model
                    | home = newHomeModel
                    , sharedState = SharedState.update sharedStateMsg model.sharedState
                }
            , Cmd.map HomeMsg homeCmd
            )

        ( Ok model, AboutMsg aboutMsg ) ->
            let
                ( newAboutModel, aboutCmd, sharedStateMsg ) =
                    About.update model.sharedState aboutMsg model.about
            in
            ( Ok
                { model
                    | about = newAboutModel
                    , sharedState = SharedState.update sharedStateMsg model.sharedState
                }
            , Cmd.map AboutMsg aboutCmd
            )

        ( Ok model, ProjectsMsg projectsMsg ) ->
            let
                ( newProjectsModel, projectsCmd, sharedStateMsg ) =
                    Projects.update model.sharedState projectsMsg model.projects
            in
            ( Ok
                { model
                    | projects = newProjectsModel
                    , sharedState = SharedState.update sharedStateMsg model.sharedState
                }
            , Cmd.map ProjectsMsg projectsCmd
            )

        ( Ok model, ContactMsg contactMsg ) ->
            let
                ( newContactModel, contactCmd, sharedStateMsg ) =
                    Contact.update model.sharedState contactMsg model.contact
            in
            ( Ok
                { model
                    | contact = newContactModel
                    , sharedState = SharedState.update sharedStateMsg model.sharedState
                }
            , Cmd.map ContactMsg contactCmd
            )

        ( Ok _, FailedRouteJump r ) ->
            case r of
                Err (Dom.NotFound _) ->
                    ( m, Cmd.none )

                _ ->
                    ( m, Cmd.none )

        _ ->
            ( m, Cmd.none )



-- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions m =
    case m of
        Err _ ->
            Sub.none

        Ok model ->
            Sub.batch
                [ Home.subscriptions model.home
                    |> Sub.map HomeMsg
                , About.subscriptions model.about
                    |> Sub.map AboutMsg
                , Projects.subscriptions model.projects
                    |> Sub.map ProjectsMsg
                , Contact.subscriptions model.contact
                    |> Sub.map ContactMsg
                , Browser.Events.onResize (\x y -> WindowResize (WindowSize x y))
                , Ports.scroll (always <| ScrollTo <| Routes.toId model.route)
                ]
