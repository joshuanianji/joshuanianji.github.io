module Route.Index exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import BackendTask.File
import Color.Manipulate
import Colours
import Css exposing (..)
import Css.Media
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import FeatherIcons
import Head
import Head.Seo as Seo
import Html.Styled as Html exposing (Attribute, Html, styled)
import Html.Styled.Attributes exposing (css, media)
import Html.Styled.Events exposing (onClick)
import Icon
import Icosahedron
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Project exposing (Language, Project)
import Route
import RouteBuilder exposing (App, StatefulRoute)
import Shared
import UrlPath exposing (UrlPath)
import Util
import View exposing (View)


type alias Model =
    { ico : Icosahedron.Model
    , icoSize : Float
    }


type Msg
    = IcoMsg Icosahedron.Msg


type alias RouteParams =
    {}


type alias Data =
    { -- top 3 "pinned" projects
      pinnedProjects : List Project

    -- projects on the home page (should be no more than 5)
    , homeProjects : List Project
    }


type alias ActionData =
    {}


route : StatefulRoute RouteParams Data ActionData Model Msg
route =
    RouteBuilder.single
        { head = head
        , data = data
        }
        |> RouteBuilder.buildWithLocalState
            { init = init
            , view = view
            , update = update
            , subscriptions = subscriptions
            }


init :
    App Data ActionData RouteParams
    -> Shared.Model
    -> ( Model, Effect Msg )
init app shared =
    ( { ico = Icosahedron.init 500 90, icoSize = 500 }, Effect.none )


update :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Msg
    -> Model
    -> ( Model, Effect Msg )
update app shared msg model =
    case msg of
        IcoMsg icoMsg ->
            ( { model | ico = Icosahedron.update icoMsg model.ico }, Effect.none )


subscriptions :
    RouteParams
    -> UrlPath
    -> Shared.Model
    -> Model
    -> Sub Msg
subscriptions routeParams path shared model =
    Sub.batch
        [ Icosahedron.subscriptions model.ico
            |> Sub.map IcoMsg
        ]


data : BackendTask FatalError Data
data =
    BackendTask.File.rawFile "projects.yml"
        |> BackendTask.allowFatal
        |> BackendTask.andThen Project.getProjects
        |> BackendTask.map
            (\projs ->
                { pinnedProjects = List.filter (\p -> p.displayType == Project.Featured) projs
                , homeProjects = List.filter (\p -> p.displayType == Project.Home) projs
                }
            )
        -- ensure project sizes are reasonable
        |> BackendTask.andThen
            (\data_ ->
                if List.length data_.homeProjects > 5 then
                    BackendTask.fail (FatalError.fromString "Too many projects on the home page! Keep it less than 5 :)")

                else if List.length data_.pinnedProjects > 3 then
                    BackendTask.fail (FatalError.fromString "Too many pinned projects! Keep it less than 3 :)")

                else
                    BackendTask.succeed data_
            )


head :
    App Data ActionData RouteParams
    -> List Head.Tag
head app =
    Seo.summary
        { canonicalUrlOverride = Nothing
        , siteName = "elm-pages"
        , image =
            { url = [ "images", "icon-png.png" ] |> UrlPath.join |> Pages.Url.fromPath
            , alt = "elm-pages logo"
            , dimensions = Nothing
            , mimeType = Nothing
            }
        , description = "Welcome to elm-pages!"
        , locale = Nothing
        , title = "elm-pages is running"
        }
        |> Seo.website


view :
    App Data ActionData RouteParams
    -> Shared.Model
    -> Model
    -> View (PagesMsg Msg)
view app shared model =
    { title = "(Dev) Joshua Ji - Home"
    , body =
        [ Html.div
            [ css
                [ width (vw 100)
                , height (vh 100)
                , position relative
                ]
            , Html.Styled.Attributes.id "home"
            ]
            [ Html.div
                [ css
                    [ width (pct 100)
                    , height (pct 100)
                    , displayFlex
                    , alignItems center
                    , justifyContent center
                    , zIndex (int 2)
                    , position relative
                    ]
                ]
                [ jumbotron ]
            , Html.div
                [ css
                    [ position absolute
                    , top (calc (pct 50) minus (px <| model.icoSize / 2))
                    , left (calc (pct 50) minus (px <| model.icoSize / 2))
                    ]
                , Html.Styled.Attributes.id "icosahedron"
                ]
                [ icosahedron model ]

            --  main content
            , Html.div
                [ css
                    [ displayFlex
                    , alignItems center
                    , justifyContent center
                    , padding (em 1)
                    ]
                ]
                [ Html.div
                    [ css
                        [ maxWidth (px 900)
                        , flex (int 1)
                        , displayFlex
                        , flexDirection column
                        ]
                    ]
                    [ projects app.data
                    ]
                ]
            ]
        ]
    }


jumbotron : Html msg
jumbotron =
    Html.div
        [ css
            [ width (vw 75)
            , height (vh 75)
            , displayFlex
            , flexDirection column
            , justifyContent spaceAround
            ]
        ]
        [ Html.h1
            [ css
                [ textAlign center
                , fontSize (px 100)
                , fontFamilies [ qt "Playfair Display SC" ]
                ]
            ]
            [ Html.text "Joshua Ji" ]
        , Html.p
            [ css
                [ textAlign center
                , fontSize (px 25)
                , fontWeight bold
                ]
            ]
            [ Html.text "Welcome to my website!" ]
        , Html.p
            [ css
                [ textAlign center
                , fontSize (px 25)
                ]
            ]
            [ Html.text "I am an undergraduate student studying computer science at the University of Alberta. I enjoy making webapps, primarily with React and Elm, but I'm also a big Docker + DevOps fan." ]
        , jumbotronNavbar
        , Icon.view
            [ css [ displayFlex, flexDirection column, alignItems center ] ]
            { icon = FeatherIcons.chevronDown
            , strokeWidth = 2
            , color = Colours.black
            , size = 40
            , msg = Nothing
            }
        ]


jumbotronNavbar : Html msg
jumbotronNavbar =
    let
        navItems =
            [ ( "About", "#about" )
            , ( "Projects", "#projects" )
            , ( "Contact", "#contact" )
            ]
    in
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , width (pct 100)
            , justifyContent spaceBetween
            , fontSize (em 2)
            ]
        ]
    <|
        List.map
            (\( text, url ) ->
                underlinedLink Html.div
                    [ Html.Styled.Attributes.href url ]
                    [ Html.text text ]
            )
            navItems


icosahedron : Model -> Html (PagesMsg Msg)
icosahedron model =
    Icosahedron.view model.ico
        |> Html.map (IcoMsg >> PagesMsg.fromMsg)



---- PROJECTS


projects : Data -> Html msg
projects data_ =
    Html.div
        [ css
            [ Util.flexDirection Util.Column
            , property "gap" "2em"
            ]
        ]
        [ Html.div
            [ css
                [ fontSize (em 1.5) ]
            ]
            [ underlinedLink Html.h1
                [ Html.Styled.Attributes.href "#projects" ]
                [ Html.text "Projects" ]
            ]
        , Html.h2 [] [ Html.text "⭐ Featured" ]
        , featuredProjects data_.pinnedProjects
        , Html.h2 [] [ Html.text "🎖️ Honourable Mentions" ]
        , homeProjects data_.homeProjects
        ]


featuredProjects : List Project -> Html msg
featuredProjects projs =
    Html.div
        [ css
            [ Util.flexDirection Util.Row
            , property "gap" "0.75em"
            ]
        ]
        (List.map featuredProject projs)


homeProjects : List Project -> Html msg
homeProjects projs =
    Html.div
        [ css
            [ Util.flexDirection Util.Column
            , alignItems center
            , justifyContent center
            , property "gap" "0.75em"
            ]
        ]
        (List.map homeProject projs)


featuredProject : Project -> Html msg
featuredProject proj =
    projectContainer Util.Column
        [ css
            [ property "gap" "0.75em"
            , alignItems center
            , textAlign center
            ]
        ]
        [ projectImage
            { imgWidth = px 120
            , dir = Util.Column
            , link = proj.imgPath
            }
            [ padding2 (px 0) (em 1) ]
        , projectTitle proj
        , Html.p
            [ css
                [ fontSize (em 0.75) ]
            ]
            [ Html.text <| String.fromInt proj.year ]
        , Html.p [] [ Html.text proj.blurb ]

        -- height-filling empty div to align the languages/concepts and links to the bottom
        , Html.div [ css [ flex (int 1) ] ] []
        , projectLinks Util.Row { githubLink = proj.githubLink, link = proj.link }
        , languagesAndConcepts Util.Column { languages = proj.languages, concepts = proj.concepts }
        ]


homeProject : Project -> Html msg
homeProject proj =
    projectContainer Util.Row
        [ css [ property "gap" "1em" ] ]
        [ projectImage
            { imgWidth = px 50
            , dir = Util.Column
            , link = proj.imgPath
            }
            [ padding2 (px 0) (em 1) ]
        , Html.div
            [ css
                [ displayFlex
                , flexDirection column
                , property "gap" "0.5em"
                , flex (int 1)
                ]
            ]
            [ projectTitle proj
            , Html.p
                [ css
                    [ fontSize (em 0.75) ]
                ]
                [ Html.text <| String.fromInt proj.year ]
            , Html.p [] [ Html.text proj.blurb ]
            , languagesAndConcepts Util.Row { languages = proj.languages, concepts = proj.concepts }
            ]
        , projectLinks Util.Column { githubLink = proj.githubLink, link = proj.link }
        ]



-- Project Helpers


projectTitle : Project -> Html msg
projectTitle proj =
    let
        -- try link, otherwise link to github, else Nothing
        mainLink =
            case proj.link of
                Just _ ->
                    proj.link

                Nothing ->
                    proj.githubLink

        mainLinkCSS =
            case mainLink of
                Just _ ->
                    hover
                        [ color (Colours.toCss Colours.themeBlue) ]

                Nothing ->
                    cursor notAllowed
    in
    Html.a
        [ css
            [ fontSize (em 1.25)
            , fontWeight bold
            , textDecoration none
            , color (Colours.toCss Colours.black)
            , mainLinkCSS
            ]
        , case mainLink of
            Just url ->
                Html.Styled.Attributes.href url

            Nothing ->
                Html.Styled.Attributes.title "No link available, sorry!"
        ]
        [ Html.text proj.name ]



-- direction is which way the image is centered
-- if direction is row, the image will be centered horizontally


projectImage :
    { imgWidth : LengthOrAuto compatible
    , dir : Util.FlexDirection
    , link : String
    }
    -> List Style
    -> Html msg
projectImage image extraCss =
    let
        imgContainer attrs children =
            Html.div
                [ css
                    ([ Util.flexDirection image.dir
                     , justifyContent center
                     ]
                        ++ extraCss
                    )
                ]
                [ styled Html.img
                    [ width image.imgWidth
                    , property "aspect-ratio" "1/1"
                    ]
                    attrs
                    children
                ]
    in
    imgContainer
        [ Html.Styled.Attributes.src image.link
        ]
        []


languagesAndConcepts :
    Util.FlexDirection
    ->
        { languages : List Language
        , concepts : Maybe (List String)
        }
    -> Html msg
languagesAndConcepts dir data_ =
    Html.div
        [ css
            [ Util.flexDirection dir
            , property "gap" "0.5em"
            , alignItems center
            ]
        ]
        [ viewLanguages data_.languages
        , case data_.concepts of
            Just (x :: xs) ->
                viewConcepts (x :: xs)

            _ ->
                Html.text ""
        ]


projectLinks :
    Util.FlexDirection
    ->
        { githubLink : Maybe String
        , link : Maybe String
        }
    -> Html msg
projectLinks dir links =
    let
        renderLink : FeatherIcons.Icon -> String -> Html msg
        renderLink icon url =
            Html.a
                [ Html.Styled.Attributes.href url
                , css
                    [ padding (em 0.8)
                    , borderRadius (em 0.5)
                    , flex (int 1)
                    , displayFlex
                    , flexDirection column
                    , alignItems center
                    , justifyContent center
                    , hover
                        [ backgroundColor (Colours.toCss <| Colours.withAlpha 0.5 Colours.gray) ]
                    ]
                ]
                [ Icon.view []
                    { icon = icon
                    , strokeWidth = 2
                    , color = Colours.black
                    , size = 18
                    , msg = Nothing
                    }
                ]
    in
    Html.div
        [ css
            [ Util.flexDirection dir
            , property "gap" "0.5em"
            , alignSelf stretch
            ]
        ]
        [ Maybe.withDefault (Html.text "") <| Maybe.map (renderLink FeatherIcons.link2) links.link
        , Maybe.withDefault (Html.text "") <| Maybe.map (renderLink FeatherIcons.github) links.githubLink
        ]


viewLanguages : List Language -> Html msg
viewLanguages langs =
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , property "gap" "0.5em"
            ]
        ]
        (List.map viewLanguage langs)


viewLanguage : Language -> Html msg
viewLanguage lang =
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , padding2 (px 3) (px 6)
            , fontSize (em 0.75)
            , alignItems center
            , property "gap" "0.2em"
            , border3 (px 1) solid (Colours.toCss <| Project.langToColor lang)
            , borderRadius (em 1)
            ]
        ]
        [ Html.div
            [ css
                [ height (em 0.8)
                , width (em 0.8)
                , borderRadius (em 1)
                , backgroundColor (Colours.toCss <| Project.langToColor lang)
                ]
            ]
            []
        , Html.text <| Project.langToString lang
        ]


viewConcepts : List String -> Html msg
viewConcepts concepts =
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , property "gap" "0.5em"
            ]
        ]
        (List.map viewConcept concepts)


viewConcept : String -> Html msg
viewConcept concept =
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , padding2 (px 3) (px 6)
            , fontSize (em 0.75)
            , alignItems center
            , borderRadius (em 0.5)
            , backgroundColor (Colours.toCss Colours.themeBlue)
            , color (Colours.toCss Colours.white)
            ]
        ]
        [ Html.text concept ]


projectContainer : Util.FlexDirection -> List (Attribute msg) -> List (Html msg) -> Html msg
projectContainer dir =
    styled Html.div
        [ Util.flexDirection dir
        , width (pct 100)
        , padding (em 1.5)
        , border3 (px 1) solid (Colours.toCss Colours.gray)
        , borderRadius (em 0.5)
        , hover
            [ borderColor (Colours.toCss Colours.black) ]
        ]



---- GLOBAL HELPERS


underlinedLink : (List (Attribute msg) -> List (Html msg) -> Html msg) -> List (Attribute msg) -> List (Html msg) -> Html msg
underlinedLink parentElem attrs content =
    let
        lightBlue =
            Color.Manipulate.fadeOut 0.5 Colours.themeBlue
    in
    parentElem
        [ css
            [ maxWidth fitContent
            , boxShadow4 inset zero (em -0.2) (Colours.toCss lightBlue)
            , borderBottom3 (em 0.0625) solid (Colours.toCss lightBlue)
            ]
        ]
        [ styled Html.a
            [ fontFamilies [ qt "Playfair Display SC" ]
            , color (Colours.toCss Colours.black)
            , textDecoration none
            , position relative
            , top (em 0.15)
            ]
            attrs
            content
        ]