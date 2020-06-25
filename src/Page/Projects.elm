module Page.Projects exposing (Model, Msg, init, update, view)

{-| viewing the projects
-}

import Browser.Navigation as Navigation
import Element exposing (Device, DeviceClass(..), Element, Orientation(..))
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
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
    { organized : Organized
    , dropdownShowing : Bool
    }


type Organized
    = ByLanguage
    | ByPurpose


organizeList : List Organized
organizeList =
    [ ByLanguage, ByPurpose ]


organizedString : Organized -> String
organizedString organized =
    case organized of
        ByLanguage ->
            "Language"

        ByPurpose ->
            "Purpose"


init : ( Model, Cmd Msg )
init =
    ( { organized = ByLanguage
      , dropdownShowing = False
      }
    , Cmd.none
    )



-- VIEW


view : Model -> SharedState -> Element Msg
view model sharedState =
    Element.column
        [ Element.spacing 50 ]
        [ introText

        -- , organizer model
        , elmDivider
        , groupView model sharedState (Projects.filterLanguage Elm projects)
        ]
        |> Helpers.Padding.responsive sharedState.device


introText : Element Msg
introText =
    Element.paragraph
        [ Element.paddingXY 0 30 ]
        [ Element.text "Welcome to my projects page! I am in the process or organizing them, but as of now they are organized by date."
        ]


organizer : Model -> Element Msg
organizer model =
    Element.row
        [ Element.spacing 20
        , Element.width Element.fill
        , Element.pointer
        , Events.onMouseDown ToggleDropdown
        , Element.below <| dropdown model
        ]
        [ Icon.view FontAwesome.Solid.bars
        , Element.paragraph
            []
            [ Element.text "Organize by: "
            , Element.text <| organizedString model.organized
            ]
        ]


dropdown : Model -> Element Msg
dropdown model =
    if model.dropdownShowing then
        Element.column
            [ Border.width 1
            , Border.color Colour.black
            , Element.padding 15
            , Element.spacing 15
            ]
            (List.map
                (\organize ->
                    Element.el
                        [ Events.onDoubleClick <| OrganizeBy organize ]
                    <|
                        Element.text <|
                            organizedString organize
                )
                organizeList
            )

    else
        Element.none


elmDivider : Element Msg
elmDivider =
    divider
        { logoImage = "src/img/elm_logo.png"
        , logoDescription = "Sexy elm logo. You should click it!"
        , link = "https://elm-lang.org"
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
    let
        containerInFront =
            case sharedState.device.class of
                Phone ->
                    textBox False 12 project

                Tablet ->
                    textBox False 15 project

                Desktop ->
                    textBox True 14 project

                BigDesktop ->
                    textBox True 16 project
    in
    Element.el
        [ Element.inFront <| containerInFront
        , Element.width Element.fill
        ]
        (Element.image
            [ Element.width Element.fill ]
            { src = project.imgLink
            , description = "project image for " ++ project.name
            }
        )


{-| TextBox needs to be responsive,
and that also means it needs to scale its font size to the screen width.

    The isTransparent parameter decides whether or not it's showing.
    The parentFontSize parameter is similar to em in css,
    where child elements can scale their font sizes based on that.

    This is probably a bad way to do this but whatever lol

-}
textBox : Bool -> Int -> Project -> Element Msg
textBox isTransparent parentFontSize project =
    Element.column
        [ Font.color Colour.white
        , Element.spacing 15
        , Element.padding <| parentFontSize * 3
        , Element.width Element.fill
        , Background.color Colour.shaded
        , Element.height Element.fill
        , Element.transparent isTransparent
        , Element.mouseOver [ Element.transparent False ]
        , Element.inFront <| iconRow parentFontSize project
        , Font.size parentFontSize
        ]
        [ header parentFontSize project
        , description parentFontSize project
        ]



-- holds the title and the date


header : Int -> Project -> Element Msg
header parentFontSize project =
    Element.column [ Element.spacing 20 ]
        [ Element.el
            [ Font.size <| parentFontSize * 2 ]
            (Element.text project.name)
        , Element.el
            [ Font.size parentFontSize ]
            (Element.text (project.year |> String.fromInt))
        ]



-- row of the icons that are overlaid on top of the text box


iconRow : Int -> Project -> Element Msg
iconRow parentFontSize project =
    Element.row
        [ Element.width Element.fill
        , Element.height Element.fill
        ]
        [ linkWrap parentFontSize project.githubLink <|
            iconWrapper (Icon.view FontAwesome.Brands.github)

        -- , postLinkWrap parentFontSize project.aboutLink <|
        --     iconWrapper (Icon.view FontAwesome.Solid.info)
        , linkWrap parentFontSize project.link <|
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


linkWrap : Int -> String -> Element Msg -> Element Msg
linkWrap parentFontSize link icon =
    Element.newTabLink
        [ Element.width Element.fill
        , Element.height Element.fill
        , Border.rounded 30
        , Element.mouseOver
            [ Font.size <| parentFontSize * 2
            ]
        ]
        { url = link
        , label = icon
        }



-- same thing as linkWrap but it redirects to the blog page. We need to navigate *within* our SPA so I need another wrapper lol.


postLinkWrap : Int -> String -> Element Msg -> Element Msg
postLinkWrap parentFontSize link icon =
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
        , Events.onClick <| NavigateTo <| Post fileName
        , Element.mouseOver
            [ Font.size <| parentFontSize * 2
            ]
        ]
        icon


description : Int -> Project -> Element Msg
description parentFontSize project =
    Element.paragraph
        [ Element.alignBottom
        , Font.size parentFontSize
        ]
        [ Element.text project.blurb ]



-- UPDATE


type Msg
    = NavigateTo Route
    | OrganizeBy Organized
    | ToggleDropdown


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedStateUpdate )
update sharedState msg model =
    case msg of
        NavigateTo route ->
            ( model, Navigation.pushUrl sharedState.navKey (Routes.toUrlString route), NoUpdate )

        OrganizeBy organized ->
            update sharedState ToggleDropdown { model | organized = organized }

        ToggleDropdown ->
            ( { model | dropdownShowing = not model.dropdownShowing }
            , Cmd.none
            , NoUpdate
            )
