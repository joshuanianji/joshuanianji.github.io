module Page.Projects exposing (Model, Msg, init, update, view)

{-| viewing the projects
-}

import Browser.Navigation as Navigation
import Element exposing (Device, DeviceClass(..), Element, Orientation(..))
import Element.Background as Background
import Element.Border as Border
import Element.Events
import Element.Font as Font
import FontAwesome.Brands
import FontAwesome.Solid
import Helpers.Colour as Colour
import Helpers.Icon as Icon
import Helpers.Padding
import Helpers.Util as Util
import Projects exposing (..)
import Routes exposing (Route(..))
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
    Element.column
        [ Element.spacing 50 ]
        [ introText
        , elmDivider
        , groupView model sharedState (Projects.filter Elm projects)
        ]
        |> Helpers.Padding.responsive sharedState.device


introText : Element Msg
introText =
    Element.paragraph
        [ Element.paddingXY 0 30 ]
        [ Element.text "Welcome to my projects page! I am in the process or organizing them so they're just all grouped up as elm projects lol." ]


elmDivider : Element Msg
elmDivider =
    divider
        { logoImage = "src/img/elm_logo.png"
        , logoDescription = "Sexy elm logo. You should click it!"
        , link = "elm-lang.org"
        , text = "Created with Elm"
        }


divider : DividerOptions -> Element Msg
divider options =
    let
        logo opt =
            Element.newTabLink
                [ Element.height Element.fill
                , Element.paddingXY 40 0
                ]
                { url = opt.link
                , label =
                    Element.image
                        [ Element.height (Element.px 60)
                        , Element.centerY
                        ]
                        { src = opt.logoImage
                        , description = opt.logoDescription
                        }
                }
    in
    Element.column
        [ Element.paddingXY 0 15
        , Element.width Element.fill
        , Element.spacing 15
        ]
        [ Element.el [ Element.centerX ] <| logo options
        , Element.paragraph
            [ Font.center
            , Font.size 30
            ]
            [ Element.text options.text ]
        ]


type alias DividerOptions =
    { logoImage : String
    , logoDescription : String
    , link : String
    , text : String
    }



-- display a group of projects


groupView : Model -> SharedState -> List Project -> Element Msg
groupView model sharedState projects =
    let
        projectsPerRow =
            case sharedState.device.class of
                BigDesktop ->
                    2

                Desktop ->
                    2

                Tablet ->
                    case sharedState.device.orientation of
                        Portrait ->
                            1

                        Landscape ->
                            2

                Phone ->
                    1
    in
    if projectsPerRow == 1 then
        -- single list of projects
        projects
            |> List.map (singleProjectView sharedState)
            --creating the content
            |> Element.column
                [ Element.width Element.fill
                ]

    else
        -- a column of pairs of projects
        projects
            |> Util.toPairs
            |> List.map
                (\( project, maybeProject ) ->
                    Element.row
                        [ Element.width Element.fill ]
                        [ project |> singleProjectView sharedState
                        , maybeProject |> Maybe.map (singleProjectView sharedState) |> Maybe.withDefault Element.none |> Element.el [ Element.width Element.fill ]
                        ]
                )
            -- create content
            |> Element.column
                [ Element.width Element.fill
                , Element.height Element.shrink
                ]



-- Display a single project


singleProjectView : SharedState -> Project -> Element Msg
singleProjectView sharedState project =
    Element.el
        [ Element.inFront <| textBox sharedState project
        , Element.width Element.fill
        ]
        (Element.image
            [ Element.width Element.fill ]
            { src = project.imgLink
            , description = "project image for " ++ project.name
            }
        )


textBox : SharedState -> Project -> Element Msg
textBox sharedState project =
    (case sharedState.device.class of
        Phone ->
            touchScreenTextBox project

        Tablet ->
            touchScreenTextBox project

        Desktop ->
            regularScreenTextBox project

        BigDesktop ->
            regularScreenTextBox project
    )
    <|
        [ header project
        , description project
        ]


regularScreenTextBox : Project -> List (Element Msg) -> Element Msg
regularScreenTextBox project =
    Element.column
        [ Font.color Colour.white
        , Element.spacing 15
        , Element.padding 40
        , Element.width Element.fill
        , Background.color Colour.shaded
        , Element.height Element.fill
        , Element.transparent True
        , Element.mouseOver [ Element.transparent False ]
        , Element.inFront <| iconRow project
        ]


touchScreenTextBox : Project -> List (Element Msg) -> Element Msg
touchScreenTextBox project =
    Element.column
        [ Font.color Colour.white
        , Element.spacing 15
        , Element.padding 40
        , Element.width Element.fill
        , Background.color Colour.shaded
        , Element.height Element.fill
        , Element.inFront <| iconRow project
        ]



-- holds the title and the date


header : Project -> Element Msg
header project =
    Element.column [ Element.spacing 20 ]
        [ Element.el
            [ Font.size 30 ]
            (Element.text project.name)
        , Element.el
            [ Font.size 15 ]
            (Element.text (project.year |> String.fromInt))
        ]



-- row of the icons that are overlaid on top of the text box


iconRow : Project -> Element Msg
iconRow project =
    Element.row
        [ Element.width Element.fill
        , Element.height Element.fill
        ]
        [ linkWrap project.githubLink <|
            iconWrapper (Icon.view FontAwesome.Brands.github)
        , postLinkWrap project.aboutLink <|
            iconWrapper (Icon.view FontAwesome.Solid.info)
        , linkWrap project.link <|
            iconWrapper (Icon.view FontAwesome.Solid.link)
        ]


iconWrapper : Element Msg -> Element Msg
iconWrapper icon =
    Element.el
        [ Element.centerX
        , Element.centerY
        ]
        icon



-- the big box that covers the entire height of the textBox and has a `width fill` attribute. This makes a bigger area clickable. It redirects the user to a link


linkWrap : String -> Element Msg -> Element Msg
linkWrap link icon =
    Element.newTabLink
        [ Element.width Element.fill
        , Element.height Element.fill
        , Border.rounded 30
        , Element.mouseOver
            [ Font.size 40
            ]
        ]
        { url = link
        , label = icon
        }



-- same thing as linkWrap but it redirects to the blog page. We need to navigate *within* our SPA so I need another wrapper lol.


postLinkWrap : String -> Element Msg -> Element Msg
postLinkWrap link icon =
    let
        -- the filename is just the name of the .emu file without the .emu
        fileName =
            Routes.getFileName link
                |> Maybe.withDefault "oof"
    in
    Element.el
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.pointer
        , Element.Events.onClick (NavigateTo (Post fileName))
        , Element.mouseOver
            [ Font.size 40
            ]
        ]
        icon


description : Project -> Element Msg
description project =
    Element.paragraph
        [ Font.size 20
        , Element.alignBottom
        ]
        [ Element.text project.blurb ]



-- UPDATE


type Msg
    = NavigateTo Route


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedStateUpdate )
update sharedState msg model =
    case msg of
        NavigateTo route ->
            ( model, Navigation.pushUrl sharedState.navKey (Routes.toUrlString route), NoUpdate )
