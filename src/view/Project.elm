module View.Project exposing (Project, view)

{-
   For the project modules in the Projects page
-}

import Colour
import Element exposing (Element)
import Element.Background as Background
import Element.Events
import Element.Font as Font
import FontAwesome.Brands
import FontAwesome.Solid
import Icon
import Model exposing (Msg(..))
import Text



{-
   This is the type alias to hold all my information regarding a project
-}


type alias Project =
    { name : String
    , imgLink : String
    , blurb : String
    , aboutLink : String
    , link : String
    , githubLink : String
    , year : Int
    }



-- the template for displaying a single project. We basically just show the picture and display an overlay when the user hovers over it


view : Project -> Element Msg
view project =
    Element.el
        [ Element.inFront <| textBox project
        , Element.width Element.fill
        ]
        (Element.image
            [ Element.width Element.fill ]
            { src = project.imgLink
            , description = "project image for " ++ project.name
            }
        )



{- textbox inside the shaded area
   honestly it feels really bad when i used :
       Element.transparent True
       , Element.mouseOver [ Element.transparent False ]
   but I guess its the only way rip
-}


textBox : Project -> Element Msg
textBox project =
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
        [ header project
        , description project
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
        , blogLinkWrap project.aboutLink <|
            iconWrapper (Icon.view FontAwesome.Solid.info)
        , linkWrap project.link <|
            iconWrapper (Icon.view FontAwesome.Solid.link)
        ]



-- wraps the icon to center it


iconWrapper : Element Msg -> Element Msg
iconWrapper icon =
    Element.el
        [ Element.centerX
        , Element.centerY
        ]
        icon



-- the big box that covers the entire height of the textBox and has a `width fill` attribute. This makes a bigger area clickable.


linkWrap : String -> Element Msg -> Element Msg
linkWrap link icon =
    Element.newTabLink
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.mouseOver [ Font.color Colour.gray ]
        ]
        { url = link
        , label = icon
        }



-- same thing as linkWrap but it redirects to the blog page


blogLinkWrap : String -> Element Msg -> Element Msg
blogLinkWrap link icon =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.fill
        , Element.pointer
        , Element.Events.onClick (HttpRequest link)
        , Element.mouseOver [ Font.color Colour.gray ]
        ]
        icon


description : Project -> Element Msg
description project =
    Element.paragraph
        [ Font.size 20
        , Element.alignBottom
        ]
        [ Element.text project.blurb ]
