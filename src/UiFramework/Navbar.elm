{-
   I created this using the same algorithm as the navbar in my cryptography project lol.
   Nothing really changed here haha

   Dad's navbar is like an opaque type with record constructors and I'm here with a Model -> Element Msg function lmao
-}


module UiFramework.Navbar exposing (navbar)

import Element exposing (Attribute, DeviceClass(..), Element, Orientation(..))
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Model exposing (Model, Msg(..))
import Routes exposing (Route(..))
import SharedState exposing (SharedState)
import UiFramework.Colour as Colour


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



-- specifies framework for every individual navbar button


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
