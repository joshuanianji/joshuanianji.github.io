module Main exposing (..)

import Browser
import Data.Flags exposing (Flags, WindowSize)
import Element exposing (Element)
import Element.Font as Font
import Html exposing (Html)
import View.About as About
import View.Home as Home



---- PROGRAM ----


main : Program Flags Model Msg
main =
    Browser.element
        { view = view
        , init = init
        , update = update
        , subscriptions = subscriptions
        }



---- MODEL ----


type alias Model =
    { windowSize : WindowSize
    , about : About.Model
    , home : Home.Model
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( { windowSize = flags.windowSize
      , about = About.init
      , home = Home.init flags
      }
    , Cmd.none
    )



---- VIEW ----


view : Model -> Html Msg
view model =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.spacing 48
        ]
        [ Home.view model.home
            |> Element.map HomeMsg
        , About.view model.about
            |> Element.map AboutMsg
        ]
        |> Element.layout
            [ Font.family
                [ Font.typeface "Lato"
                , Font.sansSerif
                ]
            ]



---- UPDATE ----


type Msg
    = HomeMsg Home.Msg
    | AboutMsg About.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        HomeMsg homeMsg ->
            let
                ( newHomeModel, homeCmd ) =
                    Home.update homeMsg model.home
            in
            ( { model | home = newHomeModel }, Cmd.map HomeMsg homeCmd )

        AboutMsg aboutMsg ->
            let
                ( newAboutModel, aboutCmd ) =
                    About.update aboutMsg model.about
            in
            ( { model | about = newAboutModel }, Cmd.map AboutMsg aboutCmd )



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Home.subscriptions model.home
            |> Sub.map HomeMsg
        , About.subscriptions model.about
            |> Sub.map AboutMsg
        ]
