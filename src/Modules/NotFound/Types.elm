module Modules.NotFound.Types exposing (Model, Msg(..), init, update)

{-| To hold types used around the Project modules

    Also hold the model - msg - update functions

-}

import Browser.Navigation as Navigation
import Routes exposing (Route)
import SharedState exposing (SharedState, SharedStateUpdate(..))



-- MODEL MSG UPDATE --


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



-- Msg type consists of nothing lmao


type Msg
    = NoOp



-- because we can either change the sharedState or model, we return a tuple. This tuple is handled by the root Update.elm module


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedStateUpdate )
update sharedState msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none, NoUpdate )
