module Route.Archive exposing (Model, Msg, RouteParams, route, Data, ActionData)

{-|

@docs Model, Msg, RouteParams, route, Data, ActionData

-}

import BackendTask exposing (BackendTask)
import Browser.Navigation exposing (back)
import Colours
import Css exposing (..)
import Css.Transitions exposing (background)
import Date
import Effect
import ErrorPage
import FatalError exposing (FatalError)
import FeatherIcons
import Head
import Head.Seo
import Html.Attributes
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import Icon
import Pages.Url
import PagesMsg exposing (PagesMsg)
import RouteBuilder exposing (App, StatelessRoute)
import Server.Request
import Server.Response
import Shared
import UrlPath
import Util
import View exposing (View)
import WebsiteVersion exposing (Website)


type alias Model =
    {}


type alias Msg =
    ()


type alias RouteParams =
    {}


route : StatelessRoute RouteParams Data ActionData
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildNoState { view = view }


init :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect.Effect Msg )
init app shared =
    ( {}, Effect.none )


update :
    RouteBuilder.App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect.Effect Msg )
update app shared msg model =
    ( model, Effect.none )


subscriptions : RouteParams -> UrlPath.UrlPath -> Shared.Model -> Model -> Sub Msg
subscriptions routeParams path shared model =
    Sub.none


type alias Data =
    { websites : List Website
    }


type alias ActionData =
    {}


data : BackendTask FatalError Data
data =
    BackendTask.succeed Data
        |> BackendTask.andMap WebsiteVersion.getWebsites


head : RouteBuilder.App Data ActionData RouteParams -> List Head.Tag
head app =
    Head.Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "Time Machine"
        , image =
            { url = [ "old-websites-logo.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "Time Machine Logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Welcome to my old websites!"
        , locale = Nothing
        , title = "Time Machine"
        }
        |> Head.Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> View (PagesMsg Msg)
view app shared =
    { title = "Time Machine"
    , body =
        [ Html.div
            [ css
                [ displayFlex
                , justifyContent center
                , alignItems center
                ]
            ]
            [ viewWebsites app.data.websites ]
        ]
    }


viewWebsites : List Website -> Html msg
viewWebsites websites =
    Html.div
        [ css
            [ Util.flexDirection Util.Column
            , justifyContent center
            , alignItems center
            , maxWidth (px 950)
            , padding (em 2)
            , property "gap" "3em"
            ]
        ]
        [ Html.div
            [ css
                [ textAlign center ]
            ]
            [ Html.h1
                [ css
                    [ fontSize (em 4)
                    , fontWeight lighter
                    ]
                ]
                [ Html.text "Time Machine" ]
            , Html.h2
                [ css
                    [ fontSize (em 2)
                    , fontWeight lighter
                    ]
                ]
                [ Html.text "A look back at my old websites!" ]
            ]
        , Html.div
            [ css
                [ Util.flexDirection Util.Column
                , property "gap" "1em"
                ]
            ]
          <|
            List.map viewWebsite websites
        ]


viewWebsite : Website -> Html msg
viewWebsite w =
    let
        statusColour =
            WebsiteVersion.statusColour w.status
                |> Colours.toCss

        statusIcon =
            Html.div
                [ css
                    [ Util.flexDirection Util.Row
                    , border3 (px 1) solid statusColour
                    , borderRadius (em 1)
                    , color statusColour
                    , maxWidth fitContent
                    , fontSize (em 0.75)
                    , alignItems center
                    , padding2 (px 3) (px 6)
                    , property "gap" "0.3em"
                    , hover
                        [ color (Colours.toCss Colours.white)
                        , backgroundColor statusColour
                        ]
                    ]
                , Html.Styled.Attributes.class "unselectable"
                ]
                [ Html.div
                    [ css
                        [ height (px 10)
                        , width (px 10)
                        , borderRadius (em 0.75)
                        , backgroundColor statusColour
                        ]
                    ]
                    []
                , Html.text (WebsiteVersion.statusToString w.status)
                ]

        datesActive =
            let
                content =
                    case w.status of
                        WebsiteVersion.Online date ->
                            [ Html.text "Online since "
                            , Html.text <| Date.format "MMMM yyyy" date
                            ]

                        WebsiteVersion.Deprecated { start, end } ->
                            [ Html.text "Online from "
                            , Html.text <| Date.format "MMMM yyyy" start
                            , Html.text " - "
                            , Html.text <| Date.format "MMMM yyyy" end
                            ]

                        WebsiteVersion.Unreleased { start, end } ->
                            [ Html.text "Worked on from "
                            , Html.text <| Date.format "MMMM yyyy" start
                            , Html.text " - "
                            , Html.text <| Date.format "MMMM yyyy" end
                            ]
            in
            Html.p
                [ css
                    []
                ]
                content

        comments =
            Html.p
                [ css
                    []
                ]
                [ Html.text w.comments ]

        techStackElement tech =
            Html.div
                [ css
                    [ Util.flexDirection Util.Row
                    , border3 (px 1) solid (Colours.toCss Colours.darkGray)
                    , borderRadius (em 1)
                    , color (Colours.toCss Colours.darkGray)
                    , fontSize (em 0.75)
                    , alignItems center
                    , padding2 (px 3) (px 6)
                    , property "gap" "0.3em"
                    , hover
                        [ color (Colours.toCss Colours.white)
                        , backgroundColor (Colours.toCss Colours.darkGray)
                        ]
                    ]
                ]
                [ Html.div
                    [ css
                        [ height (px 10)
                        , width (px 10)
                        , backgroundImage <| url ("/techstack_icons/" ++ WebsiteVersion.techStackToID tech ++ ".png")
                        , backgroundSize cover
                        , backgroundPosition center
                        ]
                    ]
                    []
                , Html.text (WebsiteVersion.techStackToString tech)
                ]

        techStack =
            case w.techStack of
                [] ->
                    Html.text ""

                l ->
                    Html.div
                        [ css
                            [ Util.flexDirection Util.Row
                            , alignItems center
                            , property "gap" "0.25em"
                            ]
                        ]
                    <|
                        Html.text "Tech Stack: "
                            :: List.map techStackElement l
    in
    Html.div
        [ css
            [ Util.flexDirection Util.Row
            , justifyContent spaceBetween
            , alignItems stretch
            , padding (px 16)
            , width (pct 100)
            , border3 (px 1) solid (Colours.toCss Colours.black)
            , borderRadius (em 0.75)
            , property "gap" "1em"
            ]
        ]
        [ Html.h2
            [ css
                [ fontSize (em 4)
                , displayFlex
                , justifyContent center
                , alignItems center
                , flex (int 3)
                , margin zero
                , fontWeight lighter
                ]
            ]
            [ Html.text (String.fromInt w.version) ]
        , Html.div
            [ css
                [ width (px 1)
                , backgroundColor (Colours.toCss Colours.gray)
                ]
            ]
            [ Html.text "" ]
        , Html.a
            [ css
                [ displayFlex
                , flex (int 2)
                , hover
                    [ backgroundColor <| Colours.toCss <| Colours.withAlpha 0.5 Colours.gray ]
                , borderRadius (em 0.5)
                , justifyContent center
                , alignItems center
                , color (Colours.toCss Colours.black)
                ]
            , Html.Styled.Attributes.href w.url
            ]
            [ Icon.view
                []
                { icon = FeatherIcons.link2
                , strokeWidth = 1
                , size = 30
                , msg = Nothing
                }
            ]
        , Html.div
            [ css
                [ Util.flexDirection Util.Column
                , flex (int 18)
                , property "gap" "0.66em"
                ]
            ]
            [ statusIcon
            , datesActive
            , techStack
            , comments
            ]
        ]
