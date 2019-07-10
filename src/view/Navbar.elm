{-
   I created this using the same algorithm as the navbar in my cryptography project lol.
   Nothing really changed here haha
-}


module View.Navbar exposing (navbar)

import Colour
import Element exposing (Attribute, DeviceClass(..), Element, Orientation(..))
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Model exposing (..)
import Routes exposing (Route(..))


navbar : Model -> Element Msg
navbar model =
    Element.row
        [ Element.centerX
        ]
        (List.map
            (navbarFramework model)
            navbarMapList
        )


navbarMapList : List ( String, Route )
navbarMapList =
    [ ( "Home", Home )
    , ( "Resume", Resume )
    , ( "Projects", Projects )
    ]



-- specifies fracework for every individual navbar button


navbarFramework : Model -> ( String, Route ) -> Element Msg
navbarFramework model ( name, route ) =
    Input.button
        (navbarElementAttributes model route)
        { onPress = Just (NavigateTo route)
        , label = Element.el [ Element.centerX ] (Element.text name)
        }



-- checks to see in the model if we're in that specific route. if we are we make the text bold.


navbarElementAttributes : Model -> Route -> List (Attribute Msg)
navbarElementAttributes model route =
    let
        fontSize =
            case model.device.class of
                BigDesktop ->
                    25

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
