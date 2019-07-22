module Modules.Post.Types exposing (ExpectBlogPost(..), Model, Msg(..), init, update)

{-| To hold types used around the Post modules

    Also hold the model - msg - update functions

-}

import Browser.Navigation as Navigation
import Http
import Routes exposing (Route)
import SharedState exposing (SharedState, SharedStateUpdate(..))



-- MODEL MSG UPDATE --


type alias Model =
    { blogSource : ExpectBlogPost }


{-| When I click on a post link on the projects page, it takes a fraction of a second to load the .emu file.

    During that loading time, the blogSource is Nothing, so the Modules.Post.View module thinks that the file is not found!
    I need a more expressive type so I can convey a "loading..." screen.

-}
type ExpectBlogPost
    = Loading
    | Loaded (Result Http.Error String)


init : String -> ( Model, Cmd Msg )
init fileName =
    ( { blogSource = Loading }
    , -- when we're requesting a .emu file via http
      Http.get
        { url = Routes.toEmuUrl fileName
        , expect = Http.expectString GotSrc
        }
    )


type Msg
    = NavigateTo Route
    | GotSrc (Result Http.Error String)



-- because we can either change the sharedState or model, we return a 3-element tuple. This tuple is handled by the root Update.elm module


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedStateUpdate )
update sharedState msg model =
    case msg of
        NavigateTo route ->
            ( model, Navigation.pushUrl sharedState.navKey (Routes.toUrlString route), NoUpdate )

        -- after we've gotten the .emu file we update the url
        GotSrc result ->
            ( { model | blogSource = Loaded result }
            , Cmd.none
            , NoUpdate
            )
