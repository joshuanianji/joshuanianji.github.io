module View exposing (view)

import Element exposing (DeviceClass(..), Element, FocusStyle, Orientation(..))
import Element.Font as Font
import FontAwesome.Styles
import Html exposing (Html)
import Model exposing (Model, Msg)
import Routes exposing (Route(..))
import Text
import View.Home as Home
import View.Navbar exposing (navbar)
import View.NotFound as NotFound
import View.Post as Post
import View.Projects as Projects
import View.Resume as Resume


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
        , Text.body
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
        , Text.title
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

        Post ->
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
