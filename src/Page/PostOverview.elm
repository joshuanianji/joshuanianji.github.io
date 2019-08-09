module Page.PostOverview exposing (Model, Msg, init, update, view)

import Element exposing (Element)
import SharedState exposing (SharedState, SharedStateUpdate(..))



-- MODEL


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- VIEW


view : Model -> SharedState -> Element Msg
view model sharedState =
    Element.text "bruh dont look here smh"



-- UPDATE


type Msg
    = NoOp


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedStateUpdate )
update sharedState msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none, NoUpdate )
