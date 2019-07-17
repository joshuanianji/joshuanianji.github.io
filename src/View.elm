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
import Routes exposing (Route(..))
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
    case model.router.route of
        Home ->
            "Joshua's Website"

        Resume ->
            "Resume"

        Projects ->
            "Projects"

        Post fileName ->
            "Post"

        NotFound ->
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
            case model.device.class of
                BigDesktop ->
                    ( 70, 0 )

                Desktop ->
                    ( 50, 0 )

                Tablet ->
                    case model.device.orientation of
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
    case model.router.route of
        Home ->
            Home.view model

        Resume ->
            Resume.view model

        Projects ->
            Projects.view model

        Post fileName ->
            Post.view model

        NotFound ->
            NotFound.view



-- so buttons won't have that ugly border


focusStyle : FocusStyle
focusStyle =
    { borderColor = Nothing
    , backgroundColor = Nothing
    , shadow = Nothing
    }
