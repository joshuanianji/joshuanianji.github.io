module Route.Index exposing (ActionData, Data, Model, Msg, footer, route)

import Article
import BackendTask exposing (BackendTask)
import BackendTask.File
import Colours
import Css exposing (..)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import FeatherIcons
import Head
import Head.Seo as Seo
import Html.Styled as Html exposing (Html)
import Html.Styled.Attributes exposing (css)
import Icon
import Icosahedron
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Project exposing (Project)
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
    { projects : ProjectData
    , blogPosts : BlogData
    }


type alias ProjectData =
    { -- top 3 "pinned" projects
      pinnedProjects : List Project

    -- projects on the home page (should be no more than 5)
    , homeProjects : List Project
    }


type alias BlogData =
    List ( Route.Route, Article.Metadata )


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
    let
        icoConfig =
            { size = 500

            -- a nice prime number
            , degs = 23
            , color = Colours.gray
            }
    in
    ( { ico = Icosahedron.init icoConfig, icoSize = 500 }, Effect.none )


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
    BackendTask.succeed Data
        |> BackendTask.andMap getProjects
        |> BackendTask.andMap getBlogPosts


getProjects : BackendTask FatalError ProjectData
getProjects =
    BackendTask.File.rawFile "projects.yml"
        |> BackendTask.allowFatal
        |> BackendTask.andThen Project.getProjects
        |> BackendTask.andThen Project.splitProjects
        |> BackendTask.map
            (\data_ -> { pinnedProjects = data_.featured, homeProjects = data_.home })


getBlogPosts : BackendTask FatalError BlogData
getBlogPosts =
    Article.allMetadata
        |> BackendTask.allowFatal
        |> BackendTask.map (List.take 3)


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
    { title = "Joshua Ji - Home"
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
                        , property "gap" "4em"
                        ]
                    ]
                    [ blog app.data.blogPosts
                    , projects app.data.projects
                    , footer
                    ]
                ]
            ]
        ]
    }



---- MAIN PAGE


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
        , contactLinks
        , Html.p
            [ css
                [ textAlign center
                , fontSize (px 25)
                ]
            ]
            [ Html.text "Welcome to my website! I'm a software engineer currently at InEight. I enjoy making webapps, primarily with React and Elm, and I'm also a big Docker + DevOps fan. I hope you enjoy your time here!" ]
        , jumbotronNavbar
        , Icon.view
            [ css [ displayFlex, flexDirection column, alignItems center ] ]
            { icon = FeatherIcons.chevronDown
            , strokeWidth = 2
            , size = 40
            , msg = Nothing
            }
        ]


contactLinks : Html msg
contactLinks =
    let
        contactItems =
            [ ( "Github", "github.svg", "https://github.com/joshuanianji" )
            , ( "Linkedin", "linkedin.png", "https://www.linkedin.com/in/joshua-niani-ji/" )
            , ( "Email", "email.webp", "mailto:joshuanji23@gmail.com" )
            , ( "Hardcover", "hardcover.png", "https://hardcover.app/@OshuaJay" )
            ]

        viewContact ( iconName, path, url ) =
            Html.a
                [ Html.Styled.Attributes.href url
                , Html.Styled.Attributes.attribute "aria-label" ("My " ++ iconName ++ " profile")
                ]
                [ Html.img
                    [ css
                        [ height (px 30) ]
                    , Html.Styled.Attributes.src ("contact_logos/" ++ path)
                    , Html.Styled.Attributes.alt (iconName ++ " logo")
                    ]
                    []
                ]
    in
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , width (pct 100)
            , justifyContent center
            , fontSize (em 2)
            , property "gap" "1em"
            ]
        ]
    <|
        List.map viewContact contactItems


jumbotronNavbar : Html msg
jumbotronNavbar =
    let
        navItems =
            [ ( "Blog", "#blog", False )
            , ( "Projects", "#projects", False )
            , ( "Resume", "https://joshuaji.com/resume/Joshua%20Ji%20Resume.pdf", True )
            ]
    in
    Html.div
        [ css
            [ displayFlex
            , flexDirection row
            , width (pct 100)
            , justifyContent spaceAround
            , fontSize (em 2)
            ]
        ]
    <|
        List.map
            (\( text, url, externalLink ) ->
                Util.underlinedLink Html.div
                    [ css
                        [ displayFlex
                        , flexDirection row
                        , fontFamilies [ qt "Playfair Display SC" ]
                        ]
                    , Html.Styled.Attributes.href url
                    ]
                    [ Html.text text
                    , if externalLink then
                        Icon.view
                            [ css [ alignItems center ] ]
                            { icon = FeatherIcons.externalLink
                            , strokeWidth = 2
                            , size = 20
                            , msg = Nothing
                            }

                      else
                        Html.text ""
                    ]
            )
            navItems


icosahedron : Model -> Html (PagesMsg Msg)
icosahedron model =
    Icosahedron.view model.ico
        |> Html.map (IcoMsg >> PagesMsg.fromMsg)



---- BLOG


blog : BlogData -> Html msg
blog data_ =
    Html.div
        [ css
            [ Util.flexDirection Util.Column
            , property "gap" "2em"
            ]
        ]
        [ Util.linkedHeader "blog" "Blog"
        , Html.h2 [] [ Html.text "📅 Recent Posts" ]
        , recentPosts data_
        , Html.div
            [ css
                [ Util.flexDirection Util.Row
                , alignItems center
                , fontSize (em 1.25)
                ]
            ]
            [ Util.textRouteLink Route.Blog "All posts"
            , Icon.view [] { icon = FeatherIcons.chevronRight, strokeWidth = 2, size = 20, msg = Nothing }
            ]
        ]


recentPosts : BlogData -> Html msg
recentPosts data_ =
    Html.div
        [ css
            [ Util.flexDirection Util.Column
            , property "gap" "1em"
            ]
        ]
        (List.map Article.view data_)



---- PROJECTS


projects : ProjectData -> Html msg
projects data_ =
    Html.div
        [ css
            [ Util.flexDirection Util.Column
            , property "gap" "2em"
            ]
        ]
        [ Util.linkedHeader "projects" "Projects"
        , Html.h2 [] [ Html.text "⭐ Featured" ]
        , featuredProjects data_.pinnedProjects
        , Html.div
            [ css
                [ Util.flexDirection Util.Row
                , alignItems center
                , fontSize (em 1.25)
                ]
            ]
            [ Util.textRouteLink Route.AllProjects "More projects"
            , Icon.view [] { icon = FeatherIcons.chevronRight, strokeWidth = 2, size = 20, msg = Nothing }
            ]

        -- , Html.h2 [] [ Html.text "🎖️ Honourable Mentions" ]
        -- , homeProjects data_.homeProjects
        ]


featuredProjects : List Project -> Html msg
featuredProjects projs =
    Html.div
        [ css
            [ Util.flexDirection Util.Row
            , property "gap" "0.75em"
            ]
        ]
        (List.map Project.viewFeatured projs)



---- FOOTER


footer : Html msg
footer =
    Html.div
        [ css
            [ Util.flexDirection Util.Column
            , textAlign center
            , property "gap" "0.5em"
            , margin2 (em 2) zero
            ]
        ]
        [ Html.p
            []
            [ Html.text "Made with Elm and Elm-Pages | Source code on "
            , Util.textLink "https://github.com/joshuanianji/joshuanianji.github.io" "Github"
            ]
        , Html.p
            []
            [ Html.text "Fun fact: This is the 6th iteration of my website! "
            , Util.textRouteLink Route.Archive "See other iterations"
            , Html.text "."
            ]
        ]
