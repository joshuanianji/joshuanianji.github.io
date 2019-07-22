module Modules.Home.View exposing (view)

{-
   "Home" will also be the "About" page as well.

-}

import Element exposing (Device, DeviceClass(..), Element, Orientation(..))
import Element.Border as Border
import Element.Font as Font
import Modules.Home.Types exposing (Model, Msg)
import SharedState exposing (SharedState)


view : Model -> SharedState -> Element Msg
view model sharedState =
    case sharedState.device.class of
        BigDesktop ->
            desktopDisplay Big sharedState

        Desktop ->
            desktopDisplay Small sharedState

        Tablet ->
            handheldDisplay Big sharedState

        Phone ->
            handheldDisplay Small sharedState



-- the code here may cause cancer sorry about that


desktopDisplay : ScreenSize -> SharedState -> Element Msg
desktopDisplay screenSize sharedState =
    Element.row
        [ Element.padding 40
        , Element.spacing 40
        , Element.centerX
        ]
        [ profilePicWrap sharedState
        , about sharedState
        ]


handheldDisplay : ScreenSize -> SharedState -> Element Msg
handheldDisplay screenSize sharedState =
    let
        space =
            case screenSize of
                Big ->
                    40

                Small ->
                    10
    in
    Element.column
        [ Element.padding space
        , Element.spacing space
        , Element.centerX
        ]
        [ profilePicWrap sharedState
        , about sharedState
        ]



-- wrapper for my profile pic to take up more room. Adds padding of device os a tablet


profilePicWrap : SharedState -> Element Msg
profilePicWrap sharedState =
    let
        attributes =
            [ Element.width (Element.fillPortion 1) ]
                |> (::)
                    (if sharedState.device.class == Tablet then
                        Element.padding 30

                     else
                        Element.padding 0
                    )
    in
    Element.el
        attributes
        (profilePic sharedState)



-- changes size and alignment based on device


profilePic : SharedState -> Element Msg
profilePic sharedState =
    let
        ( maxSize, alignment ) =
            case sharedState.device.class of
                BigDesktop ->
                    ( 500, Element.alignRight )

                Desktop ->
                    ( 400, Element.alignRight )

                Tablet ->
                    ( 400, Element.centerX )

                Phone ->
                    ( 300, Element.centerX )
    in
    Element.image
        [ Element.width (Element.fill |> Element.maximum maxSize)
        , alignment
        ]
        { src = "src/img/profile_pic.png"
        , description = "Profile Pic"
        }



-- differentiates between the desktops and handhelds


type ScreenSize
    = Big
    | Small



-- description


about : SharedState -> Element Msg
about sharedState =
    Element.column
        [ Element.spacing 20
        , Element.width (Element.fillPortion 1)
        ]
        [ greeting
        , aboutContent sharedState
        ]



-- BIG "hey" lmao


greeting : Element Msg
greeting =
    Element.el
        [ Font.size 55
        , Font.bold
        ]
        (Element.text "Hey,")



{- my little about text. Scales text based on device.
   I used paragraph and textColumn so that the aboutContent is flexible and can wrap the text, or else it would just hog up all the space and won't align properly
-}


aboutContent : SharedState -> Element Msg
aboutContent sharedState =
    let
        fontSize =
            case sharedState.device.class of
                BigDesktop ->
                    35

                Desktop ->
                    20

                Tablet ->
                    case sharedState.device.orientation of
                        Portrait ->
                            30

                        Landscape ->
                            25

                Phone ->
                    30
    in
    Element.textColumn
        [ Font.size fontSize
        , Element.spacing 15
        ]
        [ Element.paragraph [] [ Element.text "my name is Joshua Ji." ]
        , Element.paragraph [] [ Element.text "I am a 17 year old high school student passionate about Computer Science." ]
        , Element.paragraph [] [ Element.text "I attend Old Scona Academic." ]
        , Element.paragraph [] [ Element.text "I program in Elm, Python and Java," ]
        , Element.paragraph [] [ Element.text "though I have ventured into HTML, CSS and Javascript." ]
        ]
