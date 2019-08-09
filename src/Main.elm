module Main exposing (main)

import Browser exposing (UrlRequest(..))
import Browser.Events
import Browser.Navigation as Nav
import Element exposing (Attribute, Device, DeviceClass(..), Element, Orientation(..))
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import FontAwesome.Styles
import Helpers.Colour as Colour
import Helpers.FontFamily as FontFamily
import Html exposing (Html)
import Http
import Page.Home as Home
import Page.NotFound as NotFound
import Page.Post as Post
import Page.PostOverview as PostOverview
import Page.Projects as Projects
import Page.Resume as Resume
import Router exposing (Page(..))
import Routes exposing (Route(..))
import SharedState exposing (SharedState, SharedStateUpdate)
import Url exposing (Url)



-- PROGRAM --


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = viewApplication
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = UrlRequest
        , onUrlChange = UrlChange
        }



-- MODEL


type alias Model =
    { sharedState : SharedState
    , router : Router.Model
    }


type alias Flags =
    WindowSize



-- window size. As of now it's the only flag that Javascript passes onto us


type alias WindowSize =
    { width : Int
    , height : Int
    }


{-| the flag that we pass to the init function was created from the javascript elm.js. It is a record

    I'm going to be completely honest with you I have no idea what Browser.Navigation.Key is.
    I just know we need it to handle URL changes and to change them ourselves and whatnot. (https://package.elm-lang.org/packages/elm/browser/latest/Browser-Navigation#Key)

-}
init : Flags -> Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        ( initRouterModel, routerCmd ) =
            Router.init url key
    in
    ( { sharedState = SharedState.init (Element.classifyDevice flags) key
      , router = initRouterModel
      }
    , Cmd.map RouterMsg routerCmd
    )



-- VIEW


viewApplication : Model -> Browser.Document Msg
viewApplication model =
    { title = tabBarTitle model
    , body = [ view model ]
    }



-- title of our app (shows in tab bar)


tabBarTitle : Model -> String
tabBarTitle model =
    case model.router.currentPage of
        HomePage _ ->
            "Joshua's Website"

        ResumePage _ ->
            "Joshua's Resume"

        ProjectsPage _ ->
            "Joshua's Projects"

        PostOverviewPage _ ->
            "Get out of here!"

        PostPage _ ->
            "Post"

        NotFoundPage _ ->
            "Joshua Can't Find the Page!"



-- basically everything inside the <body> tag


view : Model -> Html Msg
view model =
    Element.layoutWith
        { options =
            [ Element.focusStyle
                { borderColor = Nothing
                , backgroundColor = Nothing
                , shadow = Nothing
                }
            ]
        }
        []
    <|
        Element.column
            [ Element.width Element.fill
            , Element.padding 40
            , Element.spacing 20
            , FontFamily.body
            , Element.height Element.fill
            ]
            [ FontAwesome.Styles.css |> Element.html -- injecting fontAwesome stylesheet so the icons will render
            , title model
            , navbar model
            , content model
            , footer model
            ]


title : Model -> Element Msg
title model =
    let
        ( fontSize, padding ) =
            case model.sharedState.device.class of
                BigDesktop ->
                    ( 70, 0 )

                Desktop ->
                    ( 50, 0 )

                Tablet ->
                    case model.sharedState.device.orientation of
                        Portrait ->
                            ( 80, 30 )

                        Landscape ->
                            ( 50, 0 )

                Phone ->
                    ( 80, 30 )
    in
    Element.el
        [ Font.size fontSize
        , Element.centerX
        , FontFamily.title
        ]
        (Element.text "Joshua Ji")


navbar : Model -> Element Msg
navbar model =
    Element.row
        [ Element.centerX
        ]
        (List.map
            (\( string, route ) ->
                Input.button
                    (navbarElementAttributes model route)
                    { onPress = Just (NavigateTo route)
                    , label = Element.el [ Element.centerX ] (Element.text string)
                    }
            )
            navbarMapList
        )


navbarMapList : List ( String, Route )
navbarMapList =
    [ ( "Home", Home )
    , ( "Resume", Resume )
    , ( "Projects", Projects )
    ]


navbarElementAttributes : Model -> Route -> List (Attribute Msg)
navbarElementAttributes model route =
    let
        fontSize =
            case model.sharedState.device.class of
                BigDesktop ->
                    25

                Desktop ->
                    20

                Tablet ->
                    case model.sharedState.device.orientation of
                        Portrait ->
                            30

                        Landscape ->
                            25

                Phone ->
                    30

        basicNavBarAttributes =
            [ Element.padding 15
            , Border.width 0
            , Font.size fontSize
            ]
    in
    if model.router.route == route then
        Font.color Colour.black :: basicNavBarAttributes

    else
        Font.color Colour.gray :: basicNavBarAttributes



-- the main body that switches b/w the directories


content : Model -> Element Msg
content model =
    case model.router.currentPage of
        HomePage homeModel ->
            Home.view homeModel model.sharedState
                |> mapMsg Router.HomeMsg

        ResumePage resumeModel ->
            Resume.view resumeModel model.sharedState
                |> mapMsg Router.ResumeMsg

        ProjectsPage projectsModel ->
            Projects.view projectsModel model.sharedState
                |> mapMsg Router.ProjectsMsg

        PostOverviewPage postOverviewModel ->
            PostOverview.view postOverviewModel model.sharedState
                |> mapMsg Router.PostOverviewMsg

        PostPage postModel ->
            Post.view postModel model.sharedState
                |> mapMsg Router.PostMsg

        NotFoundPage notFoundModel ->
            NotFound.view notFoundModel model.sharedState
                |> mapMsg Router.NotFoundMsg


mapMsg : (subMsg -> Router.Msg) -> Element subMsg -> Element Msg
mapMsg toMsg element =
    element
        |> Element.map toMsg
        |> Element.map RouterMsg


footer : Model -> Element Msg
footer model =
    let
        paddingEach =
            { top = 40
            , right = 0
            , bottom = 0
            , left = 0
            }
    in
    Element.el
        [ Element.width Element.fill
        , Element.alignBottom
        , Element.paddingEach paddingEach
        ]
        (Element.paragraph
            [ Font.center
            , Font.size 15
            ]
            [ Element.text "Created by Joshua Ji. Find the source code on my "
            , Element.newTabLink
                [ Font.underline ]
                { url = "https://github.com/joshuanianji/website"
                , label = Element.text "github!"
                }
            ]
        )



-- UPDATE


type Msg
    = NavigateTo Route
    | UrlChange Url.Url
    | UrlRequest UrlRequest
    | RouterMsg Router.Msg
    | WindowResize WindowSize


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NavigateTo route ->
            -- pass it to the router to navigate for us
            updateRouter model (Router.NavigateTo route)

        UrlChange url ->
            -- handling url changes
            updateRouter model (Router.UrlChanged url)

        UrlRequest urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    update (NavigateTo (url |> Routes.fromUrl) |> Debug.log "internal url") model

                Browser.External url ->
                    ( model, Nav.load url |> Debug.log "external url" )

        RouterMsg routerMsg ->
            -- to handle messages created by the router
            updateRouter model routerMsg

        -- every time the page reloads
        WindowResize windowSize ->
            updateSharedState
                model
                (SharedState.UpdateDevice (Element.classifyDevice windowSize |> Debug.log "Device"))



-- how to update the router


updateRouter : Model -> Router.Msg -> ( Model, Cmd Msg )
updateRouter model routerMsg =
    let
        ( nextRouterModel, routerCmd, sharedStateUpdate ) =
            Router.update model.sharedState routerMsg model.router

        nextSharedState =
            SharedState.update model.sharedState sharedStateUpdate
    in
    ( { model | sharedState = nextSharedState, router = nextRouterModel }
    , Cmd.map RouterMsg routerCmd
    )



-- update the shared state


updateSharedState : Model -> SharedStateUpdate -> ( Model, Cmd Msg )
updateSharedState model ssupdate =
    ( { model | sharedState = SharedState.update model.sharedState ssupdate }
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onResize
        (\x y ->
            WindowResize (WindowSize x y)
        )
