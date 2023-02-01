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
import Data.Project as Data exposing (Language, Project)
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
    let
        device =
            sharedState.device.class
    in
    Element.column
        [ Element.width (Element.maximum 900 Element.fill)
        , Element.centerX
        , Element.spacing 32

        -- distinct id for us to jump to
        , Element.htmlAttribute <| Html.Attributes.id "projects"
        ]
        [ -- title
          Util.pageTitle device "Projects" NavigateTo Routes.Projects
        , projHeader device "Pinned"
        , pinnedProjects device model
        , projHeader device "Other Projects"
        , otherProjects device model
        ]


projHeader : Element.DeviceClass -> String -> Element Msg
projHeader device label =
    let
        ( fontSize, fontAlign ) =
            case device of
                Element.Phone ->
                    ( 20, Font.center )

                _ ->
                    ( 24, Font.alignLeft )
    in
    Element.paragraph
        [ Font.size fontSize
        , fontAlign
        ]
        [ Element.text label ]



-- pinned


pinnedProjects : Element.DeviceClass -> Model -> Element Msg
pinnedProjects device model =
    let
        ( parent, attrs ) =
            case device of
                Element.Phone ->
                    ( Element.column, [ Element.paddingXY 8 0 ] )

                _ ->
                    ( Element.row, [] )

        isMobile =
            device == Element.Phone
    in
    parent
        ([ Element.width Element.fill
         , Element.spacing 12
         ]
            ++ attrs
        )
    <|
        List.map (viewPinnedProject isMobile model.icons) (List.filter .pinned model.projects)


viewPinnedProject : Bool -> Icons -> Project -> Element Msg
viewPinnedProject mobile icons proj =
    let
        projIcon =
            viewProjectIcon
                { iconWidth = Element.fill
                , iconHeight = Element.shrink
                , icons = icons
                , icon = proj.imgLink
                }
                |> (if mobile then
                        Util.surround
                            { vertical = False
                            , first = 1
                            , middle = 1
                            , last = 1
                            }

                    else
                        Util.surround
                            { vertical = False
                            , first = 1
                            , middle = 2
                            , last = 1
                            }
                   )

        linkBtn icon url =
            viewLink
                { icon = icon
                , link = url
                , mobile = mobile
                , pinned = True
                , iconSize = 18
                }
                |> (if mobile then
                        Util.surround
                            { vertical = False
                            , first = 1
                            , middle = 3
                            , last = 1
                            }
                            >> Element.el [ Element.width Element.fill ]

                    else
                        identity
                   )

        links =
            let
                attrs =
                    if mobile then
                        [ Element.width Element.fill
                        , Element.spaceEvenly
                        ]

                    else
                        [ Element.width Element.fill ]
            in
            Element.row
                attrs
                [ Maybe.withDefault Element.none <| Maybe.map (\link -> linkBtn FeatherIcons.link2 link) proj.link
                , linkBtn FeatherIcons.github proj.githubLink
                ]

        concepts =
            case proj.concepts of
                Just c ->
                    Element.row
                        [ Element.spacing 5
                        , Element.centerX
                        ]
                        (List.map viewConcept c)

                Nothing ->
                    Element.none

        -- header
        title =
            if mobile then
                Element.el
                    [ Font.bold
                    , Font.center
                    ]
                    (Element.text proj.name)

            else
                Element.newTabLink
                    [ Element.pointer
                    , Element.width Element.fill
                    , Font.bold
                    , Element.mouseOver
                        [ Font.color <| Colours.toElement Colours.themeBlue ]
                    ]
                    { url = Maybe.withDefault proj.githubLink proj.link
                    , label = Element.text proj.name
                    }

        year fontSize =
            let
                attrs =
                    if mobile then
                        [ Element.alignBottom ]

                    else
                        [ Element.width Element.fill, Font.center ]
            in
            Element.el
                ([ Font.light
                 , Font.size fontSize
                 , Font.color <| Colours.toElement <| Colours.withAlpha 0.7 Colours.black
                 ]
                    ++ attrs
                )
                (Element.text <| String.fromInt proj.year)

        mobileWarning =
            viewMobileWarning proj.mobile 16
                |> Element.el [ Element.centerX ]

        blurb =
            Element.paragraph
                [ Font.size 16
                , Font.center
                ]
                [ Element.text proj.blurb ]

        -- attrs
        extraAttrs =
            if mobile then
                [ Element.spacing 20
                , Element.padding 24
                ]

            else
                [ Element.spacing 12
                , Element.padding 24
                , Font.center
                , Element.mouseOver
                    [ Border.color <| Colours.toElement Colours.black ]
                ]
    in
    Element.column
        ([ Element.width Element.fill
         , Element.height Element.fill
         , Border.width 1
         , Border.rounded 8
         , Border.color <| Colours.toElement Colours.gray
         ]
            ++ extraAttrs
        )
    <|
        if mobile then
            [ Element.el [ Element.width Element.fill ] projIcon
            , Element.row
                [ Element.centerX
                , Element.spacing 8
                ]
                [ title
                , Element.text "·"
                , year 18
                ]
            , blurb
            , mobileWarning
            , links
            ]

        else
            [ Element.el [ Element.width Element.fill, Element.paddingXY 0 12 ] projIcon
            , title
            , year 12
            , blurb
            , Util.fillVertical
            , links
            , Element.el [ Element.centerX ] <| viewLangs proj.language
            , concepts
            ]



-- view other projects


otherProjects : Element.DeviceClass -> Model -> Element Msg
otherProjects device model =
    let
        ( padding, viewProj ) =
            case device of
                Element.Phone ->
                    ( Element.paddingXY 8 0, viewProjectMobile )

                _ ->
                    ( Element.padding 0, viewProjectDesktop )
    in
    Element.column
        [ Element.width Element.fill
        , Element.spacing 12
        , padding
        ]
    <|
        List.map (viewProj model.icons) (List.filter (.pinned >> not) model.projects)


viewProjectMobile : Icons -> Project -> Element Msg
viewProjectMobile icons proj =
    let
        projIcon =
            viewProjectIcon
                { iconWidth = Element.px 36
                , iconHeight = Element.px 36
                , icons = icons
                , icon = proj.imgLink
                }

        linkBtn icon url =
            viewLink
                { icon = icon
                , link = url
                , mobile = True
                , pinned = False
                , iconSize = 14
                }

        title =
            Element.paragraph
                [ Element.width Element.fill
                , Font.bold
                , Element.mouseOver
                    [ Font.color <| Colours.toElement Colours.themeBlue ]
                ]
                [ Element.text proj.name ]

        year =
            Element.el
                [ Font.light
                , Font.size 12
                , Font.color <| Colours.toElement <| Colours.withAlpha 0.7 Colours.black
                ]
                (Element.text <| String.fromInt proj.year)

        mobileWarning =
            viewMobileWarning proj.mobile 16

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
                [ Element.spacing 4
                , Element.paddingXY 0 6
                , Element.width Element.fill
                ]
                [ title
                , year
                ]
            ]
        , blurb
        , mobileWarning
        , Element.row
            [ Element.spacing 16 ]
            [ Maybe.withDefault Element.none <| Maybe.map (\link -> linkBtn FeatherIcons.link2 link) proj.link
            , linkBtn FeatherIcons.github proj.githubLink
            ]
        ]


viewProjectDesktop : Icons -> Project -> Element Msg
viewProjectDesktop icons proj =
    let
        projIcon =
            viewProjectIcon
                { iconWidth = Element.px 50
                , iconHeight = Element.px 50
                , icons = icons
                , icon = proj.imgLink
                }

        linkBtn icon url =
            viewLink
                { icon = icon
                , link = url
                , mobile = False
                , pinned = False
                , iconSize = 18
                }

        title =
            Element.newTabLink
                [ Element.pointer
                , Element.width Element.fill
                , Font.bold
                , Element.mouseOver
                    [ Font.color <| Colours.toElement Colours.themeBlue ]
                ]
                { url = Maybe.withDefault proj.githubLink proj.link
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
                [ viewLangs proj.language
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
            [ Maybe.withDefault Element.none <| Maybe.map (\link -> linkBtn FeatherIcons.link2 link) proj.link
            , linkBtn FeatherIcons.github proj.githubLink
            ]
        ]


viewProjectIcon :
    { iconWidth : Element.Length
    , iconHeight : Element.Length
    , icons : Icons
    , icon : Maybe String
    }
    -> Element Msg
viewProjectIcon { iconWidth, iconHeight, icons, icon } =
    Element.image
        [ Element.width iconWidth
        , Element.height iconHeight
        , Element.clip
        ]
        { src =
            icon
                |> Maybe.andThen (\id -> ProjIcon.get id icons)
                |> Maybe.withDefault (ProjIcon.default icons)
        , description = "Project icon"
        }


viewMobileWarning : Bool -> Int -> Element Msg
viewMobileWarning compatible fontSize =
    if not compatible then
        Element.row
            [ Element.spacing 8
            , Font.size (fontSize - 2)
            , Font.color <| Colours.toElement Colours.warningRed
            ]
            [ Icon.view []
                { icon = FeatherIcons.alertCircle
                , strokeWidth = 2
                , color = Colours.warningRed
                , size = toFloat fontSize
                , msg = Nothing
                }
            , Element.el [ Element.centerY ] <| Element.text "Not compatible on mobile!"
            ]

    else
        Element.none


viewLink : { icon : FeatherIcons.Icon, link : String, mobile : Bool, pinned : Bool, iconSize : Int } -> Element Msg
viewLink { icon, link, mobile, pinned, iconSize } =
    let
        ( paddingX, paddingY, borderRadius ) =
            case ( pinned, mobile ) of
                ( True, True ) ->
                    ( 20, 8, 5 )

                ( True, False ) ->
                    ( 0, 12, 5 )

                ( False, True ) ->
                    ( 12, 8, 24 )

                ( False, False ) ->
                    ( 16, 0, 5 )

        -- random thing xd
        extraAttr =
            if mobile then
                Border.width 1

            else
                Element.mouseOver
                    [ Background.color <| Colours.toElement <| Colours.withAlpha 0.5 Colours.gray ]
    in
    Element.newTabLink
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.paddingXY paddingX paddingY
        , Border.rounded borderRadius
        , Border.color <| Colours.toElement <| Colours.withAlpha 0.7 Colours.gray
        , extraAttr
        ]
        { url = link
        , label =
            Icon.view
                [ Element.centerX ]
                { icon = icon
                , strokeWidth = 2
                , color = Colours.black
                , size = toFloat iconSize
                , msg = Nothing
                }
        }


viewConcept : String -> Element Msg
viewConcept concept =
    Element.el
        [ Element.paddingXY 6 3
        , Border.rounded 4
        , Background.color <| Colours.toElement Colours.themeBlue
        , Font.size 12
        , Font.color <| Colours.toElement Colours.white
        ]
    <|
        Element.text concept


viewLangs : List Language -> Element Msg
viewLangs langs =
    Element.row
        [ Element.spacing 8
        , Element.width Element.fill
        ]
        (List.map viewLang langs)


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
