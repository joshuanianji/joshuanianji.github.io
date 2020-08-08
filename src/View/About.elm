module View.About exposing
    ( Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Element exposing (Element)



---- MODEL ----


type alias Model =
    {}


init : Model
init =
    {}



---- VIEW ----


view : Model -> Element Msg
view _ =
    Element.text "ree"



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
