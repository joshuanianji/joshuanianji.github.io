module View exposing (viewApplication)

import Browser
import Element exposing (DeviceClass(..), Element, FocusStyle, Orientation(..))
import Element.Font as Font
import FontAwesome.Styles
import Html exposing (Html)
import Model exposing (Model, Msg)
import Modules.Home.View as Home
import Modules.NotFound.View as NotFound
import Modules.Post.View as Post
import Modules.Projects.View as Projects
import Modules.Resume.View as Resume
import Router exposing (Page(..))
import Routes exposing (Route(..))
import SharedState exposing (SharedState)
import UiFramework.Navbar exposing (navbar)
import UiFramework.Text



-- I used Browser.Application and they want me to use a different kind of view function (see Main.elm) so I need to wrap my view in this function


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
            "Resume"

        ProjectsPage _ ->
            "Projects"

        PostPage _ ->
            "Post"

        NotFoundPage _ ->
            "Oops"



-- basically everything inside the <body> tag


view : Model -> Html Msg
view model =
    Element.layoutWith
        { options = [ Element.focusStyle focusStyle ] }
        []
    <|
        page model



{- the view before we translate it into the Html Msg type
   We have to inject the FontAwesome stylesheet into the column so the icons will render
-}


page : Model -> Element Msg
page model =
    Element.column
        [ Element.width Element.fill
        , Element.padding 40
        , Element.spacing 20
        , UiFramework.Text.body
        ]
        [ FontAwesome.Styles.css |> Element.html
        , title model
        , navbar model
        , content model
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
        , UiFramework.Text.title
        ]
        (Element.text "Joshua Ji")



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

        PostPage postModel ->
            Post.view postModel model.sharedState
                |> mapMsg Router.PostMsg

        NotFoundPage notFoundModel ->
            NotFound.view notFoundModel model.sharedState
                |> mapMsg Router.NotFoundMsg



-- convert the Msg types to the preferred msg type lmao


mapMsg : (subMsg -> Router.Msg) -> Element subMsg -> Element Model.Msg
mapMsg toMsg element =
    element
        |> Element.map toMsg
        |> Element.map Model.RouterMsg



-- so buttons won't have that ugly border


focusStyle : FocusStyle
focusStyle =
    { borderColor = Nothing
    , backgroundColor = Nothing
    , shadow = Nothing
    }
