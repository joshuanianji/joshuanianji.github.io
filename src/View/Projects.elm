module View.Projects exposing
    ( Model
    , Msg
    , init
    , subscriptions
    , update
    , view
    )

import Browser.Navigation as Nav
import Colours
import Data.Flags exposing (Flags)
import Data.Project as Data exposing (Concept, Language, Project)
import Data.ProjectIcon as ProjIcon exposing (Icons)
import Element exposing (Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import FeatherIcons
import Html.Attributes
import Icon
import Routes exposing (Route)
import SharedState exposing (SharedState)
import String
import Util



---- MODEL ----


type alias Model =
    { projects : List Project
    , icons : Icons
    }


init : Flags -> Model
init flags =
    { projects = flags.projects
    , icons = flags.projectIcons
    }



---- VIEW ----


view : SharedState -> Model -> Element Msg
view sharedState model =
    Element.column
        [ Element.width (Element.maximum 900 Element.fill)
        , Element.centerX
        , Element.spacing 32

        -- distinct id for us to jump to
        , Element.htmlAttribute <| Html.Attributes.id "projects"
        ]
        [ -- title
          Util.pageTitle sharedState.device.class "Projects" NavigateTo Routes.Projects
        , pinnedProjects sharedState model
        , otherProjects sharedState model
        ]



-- pinned


pinnedProjects : SharedState -> Model -> Element Msg
pinnedProjects sharedState model =
    case sharedState.device.class of
        Element.Phone ->
            Element.column
                [ Element.width Element.fill
                , Element.spacing 12
                , Element.paddingXY 4 0
                ]
            <|
                Element.paragraph
                    [ Font.size 20, Font.center ]
                    [ Element.text "Pinned" ]
                    :: List.map (viewPinnedProjectMobile model.icons) (List.filter .pinned model.projects)

        _ ->
            Element.row
                [ Element.width Element.fill
                , Element.spacing 12
                ]
            <|
                Element.paragraph
                    [ Font.size 24 ]
                    [ Element.text "Pinned" ]
                    :: List.map (viewPinnedProjectDesktop model.icons) (List.filter .pinned model.projects)


viewPinnedProjectMobile : Icons -> Project -> Element Msg
viewPinnedProjectMobile icons proj =
    let
        projIcon =
            Element.image
                [ Element.width Element.fill
                , Element.height Element.shrink
                , Element.clip
                , Border.rounded 200
                ]
                { src =
                    proj.imgLink
                        |> Maybe.andThen (\id -> ProjIcon.get id icons)
                        |> Maybe.withDefault (ProjIcon.default icons)
                , description = "Project icon"
                }
                |> Util.surround
                    { vertical = False
                    , first = 3
                    , middle = 5
                    , last = 3
                    }

        linkBtn icon url =
            Element.newTabLink
                [ Element.width Element.fill
                , Element.paddingXY 20 8
                , Element.centerX
                , Border.rounded 5
                , Border.width 1
                , Border.color <| Colours.toElement Colours.gray
                ]
                { url = url
                , label =
                    Icon.view
                        [ Element.centerX ]
                        { icon = icon
                        , strokeWidth = 2
                        , color = Colours.black
                        , size = 18
                        , msg = Nothing
                        }
                }
                |> Util.surround
                    { vertical = False
                    , first = 1
                    , middle = 3
                    , last = 1
                    }
    in
    Element.column
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.spacing 16
        , Element.padding 24
        , Border.width 1
        , Border.rounded 8
        , Border.color <| Colours.toElement Colours.gray
        ]
        [ Element.el [ Element.paddingXY 0 12 ] projIcon
        , Element.row
            [ Element.centerX
            , Element.spacing 6
            ]
            [ Element.el
                [ Font.bold
                , Font.center
                ]
                (Element.text proj.name)
            , Element.text "|"

            -- year
            , Element.el
                [ Element.centerY
                , Font.light
                , Font.center
                , Font.size 16
                , Font.color <| Colours.toElement <| Colours.withAlpha 0.7 Colours.black
                ]
                (Element.text <| String.fromInt proj.year)
            ]
        , Element.paragraph
            [ Font.size 16
            , Font.center
            ]
            [ Element.text proj.blurb ]

        -- links
        , Element.row
            [ Element.width Element.fill
            , Element.spaceEvenly
            ]
            [ Element.el [ Element.width Element.fill ] <| linkBtn FeatherIcons.link2 proj.link
            , Element.el [ Element.width Element.fill ] <| linkBtn FeatherIcons.github proj.githubLink
            ]
        ]


viewPinnedProjectDesktop : Icons -> Project -> Element Msg
viewPinnedProjectDesktop icons proj =
    let
        projIcon =
            Element.image
                [ Element.width Element.fill
                , Element.height Element.shrink
                , Element.clip
                , Border.rounded 200
                ]
                { src =
                    proj.imgLink
                        |> Maybe.andThen (\id -> ProjIcon.get id icons)
                        |> Maybe.withDefault (ProjIcon.default icons)
                , description = "Project icon"
                }
                |> Util.surround
                    { vertical = False
                    , first = 1
                    , middle = 2
                    , last = 1
                    }

        linkBtn icon url =
            Element.newTabLink
                [ Element.width Element.fill
                , Element.paddingXY 0 12
                , Border.rounded 5
                , Element.mouseOver
                    [ Background.color <| Colours.toElement <| Colours.withAlpha 0.5 Colours.gray ]
                ]
                { url = url
                , label =
                    Icon.view
                        [ Element.centerX ]
                        { icon = icon
                        , strokeWidth = 2
                        , color = Colours.black
                        , size = 18
                        , msg = Nothing
                        }
                }
    in
    Element.column
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.spacing 12
        , Element.padding 24
        , Border.width 1
        , Border.rounded 8
        , Border.color <| Colours.toElement Colours.gray
        , Element.mouseOver
            [ Border.color <| Colours.toElement Colours.black ]
        ]
        [ Element.el [ Element.paddingXY 0 12 ] projIcon
        , Element.newTabLink
            [ Element.pointer
            , Element.width Element.fill
            , Font.bold
            , Font.center
            , Element.mouseOver
                [ Font.color <| Colours.toElement Colours.themeBlue ]
            ]
            { url = proj.link
            , label = Element.text proj.name
            }

        -- year
        , Element.paragraph
            [ Font.light
            , Font.center
            , Font.size 12
            , Font.color <| Colours.toElement <| Colours.withAlpha 0.7 Colours.black
            ]
            [ Element.text <| String.fromInt proj.year ]
        , Element.paragraph
            [ Font.size 16
            , Font.center
            ]
            [ Element.text proj.blurb ]

        -- fill in remaining space
        , Element.el
            [ Element.height Element.fill ]
            Element.none

        -- links
        , Element.row
            [ Element.width Element.fill ]
            [ linkBtn FeatherIcons.link2 proj.link
            , linkBtn FeatherIcons.github proj.githubLink
            ]
        , Element.el [ Element.centerX ] <| viewLang proj.language
        , case proj.concepts of
            Nothing ->
                Element.none

            Just concepts ->
                Element.row
                    [ Element.spacing 5
                    , Element.centerX
                    ]
                    (List.map viewConcept concepts)
        ]



-- view other projects


otherProjects : SharedState -> Model -> Element Msg
otherProjects sharedState model =
    case sharedState.device.class of
        Element.Phone ->
            Element.column
                [ Element.width Element.fill
                , Element.spacing 12
                , Element.paddingXY 4 0
                ]
            <|
                Element.paragraph
                    [ Font.size 20, Font.center ]
                    [ Element.text "Other Projects" ]
                    :: List.map (viewProjectMobile model.icons) (List.filter (.pinned >> not) model.projects)

        _ ->
            Element.row
                [ Element.width Element.fill
                , Element.spacing 12
                ]
            <|
                Element.paragraph
                    [ Font.size 24 ]
                    [ Element.text "Other Projects" ]
                    :: List.map (viewProjectDesktop model.icons) (List.filter (.pinned >> not) model.projects)


viewProjectMobile : Icons -> Project -> Element Msg
viewProjectMobile icons proj =
    let
        projIcon =
            Element.image
                [ Element.width (Element.px 36)
                , Element.height (Element.px 36)
                , Element.clip
                , Border.rounded 200
                ]
                { src =
                    proj.imgLink
                        |> Maybe.andThen (\id -> ProjIcon.get id icons)
                        |> Maybe.withDefault (ProjIcon.default icons)
                , description = "Project icon"
                }

        linkBtn icon url =
            Element.newTabLink
                [ Element.paddingXY 12 8
                , Border.rounded 16
                , Border.width 1
                , Border.color <| Colours.toElement <| Colours.withAlpha 0.7 Colours.gray
                ]
                { url = url
                , label =
                    Icon.view
                        [ Element.centerX ]
                        { icon = icon
                        , strokeWidth = 2
                        , color = Colours.black
                        , size = 14
                        , msg = Nothing
                        }
                }

        title =
            Element.newTabLink
                [ Element.pointer
                , Element.width Element.fill
                , Font.bold
                , Element.mouseOver
                    [ Font.color <| Colours.toElement Colours.themeBlue ]
                ]
                { url = proj.link
                , label = Element.text proj.name
                }

        year =
            Element.el
                [ Font.light
                , Font.size 12
                , Font.color <| Colours.toElement <| Colours.withAlpha 0.7 Colours.black
                ]
            <|
                Element.text (String.fromInt proj.year)

        blurb =
            Element.paragraph
                [ Font.size 14 ]
                [ Element.text proj.blurb ]
    in
    Element.column
        [ Element.spacing 16
        , Element.padding 16
        , Element.width Element.fill
        , Border.width 1
        , Border.rounded 8
        , Border.color <| Colours.toElement Colours.gray
        ]
        [ Element.row
            [ Element.spacing 16 ]
            [ projIcon
            , Element.column
                [ Element.spacing 8
                , Element.width Element.fill
                ]
                [ title
                , year
                ]
            ]
        , blurb
        , Element.row
            [ Element.spacing 8 ]
            [ linkBtn FeatherIcons.link2 proj.link
            , linkBtn FeatherIcons.github proj.githubLink
            ]
        ]


viewProjectDesktop : Icons -> Project -> Element Msg
viewProjectDesktop icons proj =
    let
        projIcon =
            Element.image
                [ Element.width (Element.px 50)
                , Element.height (Element.px 50)
                , Element.clip
                , Border.rounded 200
                ]
                { src =
                    proj.imgLink
                        |> Maybe.andThen (\id -> ProjIcon.get id icons)
                        |> Maybe.withDefault (ProjIcon.default icons)
                , description = "Project icon"
                }

        linkBtn icon url =
            Element.newTabLink
                [ Element.height Element.fill
                , Element.paddingXY 16 0
                , Border.rounded 5
                , Element.mouseOver
                    [ Background.color <| Colours.toElement <| Colours.withAlpha 0.5 Colours.gray ]
                ]
                { url = url
                , label =
                    Icon.view
                        [ Element.centerX ]
                        { icon = icon
                        , strokeWidth = 2
                        , color = Colours.black
                        , size = 18
                        , msg = Nothing
                        }
                }

        title =
            Element.newTabLink
                [ Element.pointer
                , Element.width Element.fill
                , Font.bold
                , Element.mouseOver
                    [ Font.color <| Colours.toElement Colours.themeBlue ]
                ]
                { url = proj.link
                , label = Element.text proj.name
                }

        year =
            Element.el
                [ Font.light
                , Font.size 12
                , Font.color <| Colours.toElement <| Colours.withAlpha 0.7 Colours.black
                ]
            <|
                Element.text (String.fromInt proj.year)

        blurb =
            Element.paragraph
                [ Font.size 16 ]
                [ Element.text proj.blurb ]

        concepts =
            Element.row
                [ Element.spacing 8 ]
                [ viewLang proj.language
                , case proj.concepts of
                    Nothing ->
                        Element.none

                    Just cpts ->
                        Element.row
                            [ Element.spacing 5 ]
                            (List.map viewConcept cpts)
                ]
    in
    Element.row
        [ Element.spacing 24
        , Element.padding 24
        , Element.width Element.fill
        , Border.width 1
        , Border.rounded 8
        , Border.color <| Colours.toElement Colours.gray
        , Element.mouseOver
            [ Border.color <| Colours.toElement Colours.black ]
        ]
        [ Element.el [ Element.paddingXY 12 0 ] projIcon
        , Element.column
            [ Element.spacing 12
            , Element.width Element.fill
            ]
            [ title
            , year
            , blurb
            , concepts
            ]
        , Element.column
            [ Element.height Element.fill
            , Element.alignRight
            ]
            [ linkBtn FeatherIcons.link2 proj.link
            , linkBtn FeatherIcons.github proj.githubLink
            ]
        ]


viewConcept : Concept -> Element Msg
viewConcept concept =
    Element.el
        [ Element.paddingXY 6 3
        , Border.rounded 4
        , Background.color <| Colours.toElement Colours.themeBlue
        , Font.size 12
        , Font.color <| Colours.toElement Colours.white
        ]
    <|
        Element.text (Data.conceptToString concept)


viewLang : Language -> Element Msg
viewLang lang =
    let
        color =
            Colours.toElement <| Data.langToColor lang
    in
    Element.row
        [ Element.paddingXY 6 3
        , Border.rounded 12
        , Border.width 1
        , Border.color color
        , Font.size 12
        , Element.spacing 3
        ]
        [ Element.el
            [ Element.height (Element.px 10)
            , Element.width (Element.px 10)
            , Border.rounded 12
            , Background.color color
            ]
            Element.none
        , Element.text (Data.langToString lang)
        ]



---- UPDATE ----


type Msg
    = NavigateTo Route


update : SharedState -> Msg -> Model -> ( Model, Cmd Msg, SharedState.Msg )
update sharedState msg model =
    case msg of
        NavigateTo route ->
            ( model, Nav.pushUrl sharedState.navKey (Routes.toUrlString route), SharedState.NoOp )



---- SUBSCRIPTIONS ----


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none
