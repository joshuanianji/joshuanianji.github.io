module Page.Post exposing (Model, Msg, init, update, view)

-- Views a single post

import Browser.Navigation as Navigation
import Element exposing (Element)
import Element.Font as Font
import Helpers.MarkupConstructor exposing (fromMarkup)
import Http
import Mark
import Mark.Error
import Routes exposing (Route)
import SharedState exposing (SharedState, SharedStateUpdate(..))



-- MODEL


type alias Model =
    { blogSource : ExpectBlogPost }


{-| When I click on a post link on the projects page, it takes a fraction of a second to load the .emu file.

    During that loading time, the blogSource is Loading, so I can convey a "loading..." screen.

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



-- VIEW


view : Model -> SharedState -> Element Msg
view model sharedState =
    case model.blogSource of
        Loading ->
            Element.text "Loading..."

        Loaded result ->
            case result of
                Ok source ->
                    source
                        |> fromMarkup

                Err error ->
                    httpErrorView error


httpErrorView : Http.Error -> Element Msg
httpErrorView error =
    case error of
        Http.BadUrl url ->
            Element.text (url ++ " is not a valid url!")

        Http.Timeout ->
            Element.text "Took too long to load!"

        Http.NetworkError ->
            Element.text "Netowrk error!"

        Http.BadStatus int ->
            Element.text ("Failure with status code " ++ String.fromInt int)

        Http.BadBody string ->
            Element.paragraph
                []
            <|
                [ Element.text "Something weird happened with the .emu file. Here is the debugging message: "
                , Element.el
                    [ Font.family
                        [ Font.typeface "Courier New" ]
                    ]
                    (Element.text string)
                ]



-- UPDATE


type Msg
    = NavigateTo Route
    | GotSrc (Result Http.Error String)


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
