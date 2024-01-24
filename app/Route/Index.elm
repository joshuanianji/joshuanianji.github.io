module Route.Index exposing (ActionData, Data, Model, Msg, route)

import BackendTask exposing (BackendTask)
import BackendTask.File
import Color.Manipulate
import Colours
import Css exposing (..)
import Effect exposing (Effect)
import FatalError exposing (FatalError)
import FeatherIcons
import Head
import Head.Seo as Seo
import Html.Styled as Html exposing (Attribute, Html, styled)
import Html.Styled.Attributes exposing (css)
import Html.Styled.Events exposing (onClick)
import Icon
import Icosahedron
import Pages.Url
import PagesMsg exposing (PagesMsg)
import Project exposing (Project)
import Route
import RouteBuilder exposing (App, StatefulRoute)
import Shared
import UrlPath exposing (UrlPath)
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
        |> BackendTask.andThen Project.backendTaskParse
        |> BackendTask.map
            (\projects ->
                { pinnedProjects = List.filter (\p -> p.displayType == Project.Featured) projects
                , homeProjects = List.filter (\p -> p.displayType == Project.Home) projects
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
            [ -- Html.div
              --     [ css
              --         [ width (pct 100)
              --         , height (pct 100)
              --         , displayFlex
              --         , alignItems center
              --         , justifyContent center
              --         , zIndex (int 2)
              --         , position relative
              --         ]
              --     ]
              --     [ jumbotron ]
              -- , Html.div
              --     [ css
              --         [ position absolute
              --         , top (calc (pct 50) minus (px <| model.icoSize / 2))
              --         , left (calc (pct 50) minus (px <| model.icoSize / 2))
              --         ]
              --     , Html.Styled.Attributes.id "icosahedron"
              --     ]
              --     [ icosahedron model ]
              -- ,
              -- main content
              Html.div
                [ css
                    [ displayFlex
                    , alignItems center
                    , justifyContent center
                    , padding (px 15)
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
                    [ homeProjects app.data.homeProjects ]
                ]
            ]
        ]
    }


jumbotron : Html msg
jumbotron =
    Html.div
        [ css
            [ width (vw 60)
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
            ]
        ]
    <|
        List.map (\( text, url ) -> navItem [ Html.Styled.Attributes.href url ] [ Html.text text ]) navItems


navItem : List (Attribute msg) -> List (Html msg) -> Html msg
navItem =
    styled Html.a
        [ fontSize (px 30)
        , fontFamilies [ qt "Playfair Display SC" ]
        , boxShadow4 inset zero (px -10) (Colours.toCss <| Color.Manipulate.fadeOut 0.5 Colours.themeBlue)
        , color (Colours.toCss Colours.black)
        , textDecoration none
        ]


icosahedron : Model -> Html (PagesMsg Msg)
icosahedron model =
    Icosahedron.view model.ico
        |> Html.map (IcoMsg >> PagesMsg.fromMsg)



---- PROJECTS


homeProjects : List Project -> Html msg
homeProjects projects =
    Html.div
        [ css
            [ displayFlex
            , flexDirection column
            , alignItems center
            , justifyContent center
            , property "gap" "0.75em"
            ]
        ]
        (List.map viewHomeProject projects)


viewHomeProject : Project -> Html msg
viewHomeProject proj =
    Html.div
        [ css
            [ width (pct 100)
            , displayFlex
            , flexDirection column
            , padding (em 1.5)
            , property "gap" "0.5em"
            , border3 (px 1) solid (Colours.toCss Colours.gray)
            , borderRadius (em 0.5)
            , hover
                [ borderColor (Colours.toCss Colours.black) ]
            ]
        ]
        [ Html.a
            [ css
                [ fontSize (em 1.25)
                , fontWeight bold
                , textDecoration none
                , color (Colours.toCss Colours.black)
                , hover
                    [ color (Colours.toCss Colours.themeBlue) ]
                , active
                    [ textDecoration underline ]
                ]
            , Html.Styled.Attributes.href <| Maybe.withDefault proj.githubLink proj.link
            ]
            [ Html.text proj.name ]
        , Html.p
            [ css
                [ fontSize (em 0.75) ]
            ]
            [ Html.text <| String.fromInt proj.year ]
        , Html.p [] [ Html.text proj.blurb ]
        ]
