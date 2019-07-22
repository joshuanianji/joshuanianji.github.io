module Modules.Projects.Types exposing (Language(..), Model, Msg(..), Project, init, update)

{-| To hold types used around the Project modules

    Also hold the model - msg - update functions

-}

import Browser.Navigation as Navigation
import Routes exposing (Route)
import SharedState exposing (SharedState, SharedStateUpdate(..))



{-
   This is the type alias to hold all my information regarding a project
-}


type alias Project =
    { name : String
    , imgLink : String
    , blurb : String
    , aboutLink : String
    , link : String
    , githubLink : String
    , year : Int
    , language : Language
    }



-- programming languages


type Language
    = Elm
    | Python



-- MODEL MSG UPDATE --


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )


type Msg
    = NavigateTo Route



-- because we can either change the sharedState or model, we return a tuple. This tuple is handled by the root Update.elm module


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedStateUpdate )
update sharedState msg model =
    case msg of
        NavigateTo route ->
            ( model, Navigation.pushUrl sharedState.navKey (Routes.toUrlString route), NoUpdate )
