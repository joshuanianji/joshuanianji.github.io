module Main exposing (..)

import Browser exposing (Document, UrlRequest(..))
import Browser.Dom as Dom
import Browser.Navigation as Nav
import Data.Flags exposing (Flags, WindowSize)
import Element exposing (Element)
import Element.Font as Font
import Html exposing (Html)
import Routes exposing (Route)
import SharedState exposing (SharedState)
import Task
import Url exposing (Url)
import Util
import View.About as About
import View.Contact as Contact
import View.Home as Home
import View.Projects as Projects



---- PROGRAM ----


main : Program Flags Model Msg
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
    { windowSize : WindowSize
    , sharedState : SharedState
    , route : Route
    , about : About.Model
    , home : Home.Model
    , projects : Projects.Model
    , contact : Contact.Model
    }


init : Flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        route =
            Routes.fromUrl url
    in
    ( { windowSize = flags.windowSize
      , sharedState = SharedState.init key
      , route = route
      , about = About.init
      , home = Home.init flags
      , projects = Projects.init flags.projectsJson
      , contact = About.init
      }
    , Cmd.none
    )



---- VIEW ----


view : Model -> Document Msg
view model =
    let
        title =
            "Joshua Ji - " ++ Routes.toStrCapitals model.route

        body =
            Element.column
                [ Element.width Element.fill
                , Element.height Element.fill
                , Element.spacing 48
                ]
                [ Home.view model.home
                    |> Element.map HomeMsg
                , About.view model.about
                    |> Element.map AboutMsg
                , Projects.view model.projects
                    |> Element.map ProjectsMsg
                , Contact.view model.contact
                    |> Element.map ContactMsg
                , footer
                ]
                |> Element.layout
                    [ Font.family
                        [ Font.typeface "Lato"
                        , Font.sansSerif
                        ]
                    ]
    in
    { title = title
    , body = [ body ]
    }


footer : Element Msg
footer =
    Element.paragraph
        [ Element.padding 64
        , Font.center
        , Font.size 16
        ]
        [ Element.text "All code is open source and available on "
        , Util.link
            { label = "Github"
            , link = "https://github.com/joshuanianji/website"
            }
        ]



---- UPDATE ----


type Msg
    = ClickedLink UrlRequest
    | UrlChanged Url
    | HomeMsg Home.Msg
    | AboutMsg About.Msg
    | ProjectsMsg Projects.Msg
    | ContactMsg Contact.Msg
    | FailedRouteJump (Result Dom.Error ())


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedLink urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model
                    , Nav.pushUrl model.sharedState.navKey (Url.toString url)
                    )

                Browser.External href ->
                    ( model
                    , Nav.load href
                    )

        UrlChanged url ->
            let
                newRoute =
                    Routes.fromUrl url
            in
            ( model, jumpToId <| Routes.toStrLowercase newRoute )

        HomeMsg homeMsg ->
            let
                ( newHomeModel, homeCmd ) =
                    Home.update model.sharedState homeMsg model.home
            in
            ( { model | home = newHomeModel }, Cmd.map HomeMsg homeCmd )

        AboutMsg aboutMsg ->
            let
                ( newAboutModel, aboutCmd ) =
                    About.update model.sharedState aboutMsg model.about
            in
            ( { model | about = newAboutModel }, Cmd.map AboutMsg aboutCmd )

        ProjectsMsg projectsMsg ->
            let
                ( newProjectsModel, projectsCmd ) =
                    Projects.update model.sharedState projectsMsg model.projects
            in
            ( { model | projects = newProjectsModel }, Cmd.map ProjectsMsg projectsCmd )

        ContactMsg contactMsg ->
            let
                ( newContactModel, contactCmd ) =
                    Contact.update model.sharedState contactMsg model.contact
            in
            ( { model | contact = newContactModel }, Cmd.map ContactMsg contactCmd )

        FailedRouteJump r ->
            case r of
                Err (Dom.NotFound err) ->
                    let
                        _ =
                            Debug.log <| err ++ " could not be found"
                    in
                    ( model, Cmd.none )

                _ ->
                    let
                        _ =
                            Debug.log "found it!"
                    in
                    ( model, Cmd.none )


jumpToId : String -> Cmd Msg
jumpToId id =
    Dom.getElement id
        |> Task.andThen (\elem -> Dom.setViewport 0 elem.element.y)
        |> Task.attempt FailedRouteJump



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ --     Home.subscriptions model.home
          --     |> Sub.map HomeMsg
          -- ,
          About.subscriptions model.about
            |> Sub.map AboutMsg
        , Projects.subscriptions model.projects
            |> Sub.map ProjectsMsg
        , Contact.subscriptions model.contact
            |> Sub.map ContactMsg
        ]
