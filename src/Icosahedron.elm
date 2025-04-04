module Icosahedron exposing (Model, Msg, init, subscriptions, update, view)

{-| ICOSAHEDRON
Literally hardcoding an icosahedron for Elm-3d-scene to render
-}

import Angle exposing (Angle)
import Browser.Events
import Camera3d
import Color exposing (Color)
import Duration exposing (Duration)
import Html.Styled exposing (Html, fromUnstyled)
import Length
import LineSegment3d
import Pixels exposing (Pixels)
import Point3d
import Ports
import Quantity exposing (Quantity)
import Scene3d
import Scene3d.Material as Material
import Viewpoint3d



-- Honestly idk what the world coordinates do


type WorldCoordinates
    = WorldCoordinates



---- MODEL ----


type alias Model =
    { azimuth : Angle
    , elevation : Angle
    , mouse : Mouse
    , config : Config
    }


type alias Mouse =
    ( Quantity Float Pixels, Quantity Float Pixels )


type alias Config =
    { size : Int
    , degs : Float
    , color : Color
    }



-- Init: size, and initial degrees to rotate in


init : Config -> Model
init config =
    let
        ( mouseX, mouseY ) =
            ( cos (degrees config.degs), sin (degrees config.degs) )
    in
    { azimuth = Angle.degrees 0
    , elevation = Angle.degrees 0
    , mouse = ( Pixels.float mouseX, Pixels.float mouseY )
    , config = config
    }



---- VIEW ----


view : Model -> Html Msg
view model =
    let
        viewpoint =
            Viewpoint3d.orbitZ
                { focalPoint = Point3d.meters 0 0 0
                , azimuth = model.azimuth
                , elevation = model.elevation
                , distance = Length.cssPixels 50
                }

        camera =
            Camera3d.perspective
                { viewpoint = viewpoint
                , verticalFieldOfView = Angle.degrees 30
                }
    in
    Scene3d.unlit
        { camera = camera
        , dimensions = ( Pixels.int model.config.size, Pixels.int model.config.size )
        , entities = [ initialIcosahedron model.config ]
        , clipDepth = Length.cssPixels 10
        , background = Scene3d.transparentBackground
        }
        |> fromUnstyled


{-| Create a cube entity by constructing six square faces with different colors
-}
initialIcosahedron : Config -> Scene3d.Entity WorldCoordinates
initialIcosahedron config =
    let
        phi =
            Length.cssPixels <| (1 + sqrt 5) / 2

        nPhi =
            Length.cssPixels <| (1 + sqrt 5) / -2

        one =
            Length.cssPixels 1

        nOne =
            Length.cssPixels -1

        zero =
            Length.cssPixels 0

        -- Define the 12 vertices of the icosahedron
        -- rect 1
        rect1a =
            Point3d.xyz zero one phi

        rect1b =
            Point3d.xyz zero one nPhi

        rect1c =
            Point3d.xyz zero nOne nPhi

        rect1d =
            Point3d.xyz zero nOne phi

        -- rect 2
        rect2a =
            Point3d.xyz one phi zero

        rect2b =
            Point3d.xyz one nPhi zero

        rect2c =
            Point3d.xyz nOne nPhi zero

        rect2d =
            Point3d.xyz nOne phi zero

        -- rect 3
        rect3a =
            Point3d.xyz phi zero one

        rect3b =
            Point3d.xyz nPhi zero one

        rect3c =
            Point3d.xyz nPhi zero nOne

        rect3d =
            Point3d.xyz phi zero nOne

        -- 20 faces of the icosahedron lmao
        rects =
            [ rect1a
            , rect1b
            , rect1c
            , rect1d
            , rect2a
            , rect2b
            , rect2c
            , rect2d
            , rect3a
            , rect3b
            , rect3c
            , rect3d
            ]

        points color =
            Scene3d.group <|
                List.map
                    (\rect -> Scene3d.point { radius = Pixels.float (toFloat config.size / 100) } (Material.color color) rect)
                    rects

        -- The pentagon with center rect1a
        rect1aLines color =
            Scene3d.group
                [ Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1a rect2a)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1a rect2d)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1a rect1d)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1a rect3b)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1a rect3a)

                -- outer lines
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect2a rect2d)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect2d rect3b)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect3b rect1d)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1d rect3a)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect3a rect2a)

                -- , Scene3d.triangle (Material.color Color.black) (Triangle3d.from rect1a rect2d rect3b)
                -- , Scene3d.triangle (Material.color Color.black) (Triangle3d.from rect1a rect2d rect2a)
                -- , Scene3d.triangle (Material.color Color.black) (Triangle3d.from rect1a rect1d rect3b)
                -- , Scene3d.triangle (Material.color Color.black) (Triangle3d.from rect1a rect1d rect3a)
                ]

        -- pentagon with center rect1c
        rect1cLines color =
            Scene3d.group
                [ Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1c rect2b)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1c rect2c)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1c rect3c)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1c rect3d)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1c rect1b)

                -- outer lines
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect2b rect3d)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect3d rect1b)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1b rect3c)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect3c rect2c)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect2c rect2b)

                -- , Scene3d.triangle (Material.color Color.black) (Triangle3d.from rect1b rect2a rect2d)
                -- , Scene3d.triangle (Material.color Color.black) (Triangle3d.from rect1b rect2a rect3d)
                -- , Scene3d.triangle (Material.color Color.black) (Triangle3d.from rect1b rect2d rect3d)
                -- , Scene3d.triangle (Material.color Color.black) (Triangle3d.from rect1b rect3d rect1c)
                -- , Scene3d.triangle (Material.color Color.black) (Triangle3d.from rect1b rect3c rect3c)
                ]

        -- start from 2b and just go around
        middleLines color =
            Scene3d.group
                [ Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect2b rect3a)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect3a rect3d)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect3d rect2a)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect2a rect1b)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1b rect2d)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect2d rect3c)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect3c rect3b)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect3b rect2c)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect2c rect1d)
                , Scene3d.lineSegment (Material.color color) (LineSegment3d.from rect1d rect2b)
                ]
    in
    -- Combine all faces into a single entity
    Scene3d.group
        [ points config.color
        , rect1aLines config.color
        , rect1cLines config.color
        , middleLines config.color
        ]
        |> Scene3d.scaleAbout Point3d.origin 5



---- UPDATE ----


type Msg
    = MouseMove { x : Float, y : Float }
    | Tick Duration


update : Msg -> Model -> Model
update msg model =
    case msg of
        -- Orbit camera on mouse move
        MouseMove { x, y } ->
            { model | mouse = ( Pixels.float x, Pixels.float y ) }

        Tick _ ->
            let
                ( dx, dy ) =
                    model.mouse

                -- How fast we want to orbit the camera (orbiting the
                -- camera by 1 degree per pixel of drag is a decent default
                -- to start with)
                rotationRate =
                    Angle.degrees 0.5 |> Quantity.per Pixels.pixel

                -- Adjust azimuth based on horizontal mouse motion (one
                -- degree per pixel)
                newAzimuth =
                    model.azimuth
                        |> Quantity.minus
                            (dx
                                |> Quantity.at rotationRate
                            )

                -- Adjust elevation based on vertical mouse motion (one
                -- degree per pixel), and clamp to make sure camera cannot
                -- go past vertical in either direction
                newElevation =
                    model.elevation
                        |> Quantity.minus
                            (dy
                                |> Quantity.at rotationRate
                            )

                -- |> Quantity.clamp (Angle.degrees -90) (Angle.degrees 90)
            in
            { model | azimuth = newAzimuth, elevation = newElevation }



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.batch
        [ Browser.Events.onAnimationFrameDelta (Duration.milliseconds >> Tick)
        , Ports.updateMousePos MouseMove
        ]
