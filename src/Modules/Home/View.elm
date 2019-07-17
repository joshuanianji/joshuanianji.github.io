module Modules.Home.View exposing (view)

{-
   "Home" will also be the "About" page as well.

-}

import Element exposing (Device, DeviceClass(..), Element, Orientation(..))
import Element.Border as Border
import Element.Font as Font
import Model exposing (Model, Msg)


view : Model -> Element Msg
view model =
    case model.device.class of
        BigDesktop ->
            desktopDisplay Big model

        Desktop ->
            desktopDisplay Small model

        Tablet ->
            handheldDisplay Big model

        Phone ->
            handheldDisplay Small model



-- the code here may cause cancer sorry about that


desktopDisplay : ScreenSize -> Model -> Element Msg
desktopDisplay screenSize model =
    Element.row
        [ Element.padding 40
        , Element.spacing 40
        , Element.centerX
        ]
        [ profilePicWrap model
        , about model
        ]


handheldDisplay : ScreenSize -> Model -> Element Msg
handheldDisplay screenSize model =
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
        [ profilePicWrap model
        , about model
        ]



-- wrapper for my profile pic to take up more room. Adds padding of device os a tablet


profilePicWrap : Model -> Element Msg
profilePicWrap model =
    let
        attributes =
            [ Element.width (Element.fillPortion 1) ]
                |> (::)
                    (if model.device.class == Tablet then
                        Element.padding 30

                     else
                        Element.padding 0
                    )
    in
    Element.el
        attributes
        (profilePic model)



-- changes size and alignment based on device


profilePic : Model -> Element Msg
profilePic model =
    let
        ( maxSize, alignment ) =
            case model.device.class of
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


about : Model -> Element Msg
about model =
    Element.column
        [ Element.spacing 20
        , Element.width (Element.fillPortion 1)
        ]
        [ greeting
        , aboutContent model
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


aboutContent : Model -> Element Msg
aboutContent model =
    let
        fontSize =
            case model.device.class of
                BigDesktop ->
                    35

                Desktop ->
                    20

                Tablet ->
                    case model.device.orientation of
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
