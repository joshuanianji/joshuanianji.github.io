{-
   Constructs Elm-Ui from Elm Markup strings

   Completely separate from other model-view-msg! Notice the type signatures.
-}


module Modules.Post.Constructor exposing (fromMarkup, main)

import Element exposing (Attribute, Element)
import Element.Font as Font
import Html exposing (Html)
import Html.Attributes
import Mark exposing (Block)
import Mark.Error exposing (Error)



-- this is used to test the markup parser from the string at the bottom of the file


main =
    markupText
        |> fromMarkup
        |> Element.layout []



-- converting from markup


fromMarkup : String -> Element msg
fromMarkup markupString =
    case Mark.compile document markupString of
        Mark.Success element ->
            element

        Mark.Almost { result, errors } ->
            -- This is the case where there has been an error,
            -- but it has been caught by `Mark.onError` and is still rendereable.
            Element.column []
                [ Element.column [] (viewErrors errors)
                , Element.el [] result
                ]

        Mark.Failure errors ->
            Element.column []
                (viewErrors errors)


viewErrors : List Error -> List (Element msg)
viewErrors errors =
    List.map
        (Mark.Error.toHtml Mark.Error.Light >> Element.html)
        errors



-- DEFINING


document : Mark.Document (Element msg)
document =
    Mark.document
        (\elements -> Element.column [ Element.width Element.fill ] elements)
        (Mark.manyOf
            [ header
            , readmeBlock
            , Mark.map (Element.paragraph []) text
            ]
        )



{- Handle Text -}


text : Block (List (Element msg))
text =
    Mark.textWith
        { view =
            \styles string ->
                viewText styles string
        , replacements = Mark.commonReplacements
        , inlines =
            [ Mark.annotation "link"
                (\texts url ->
                    Element.link []
                        { url = url
                        , label = Element.paragraph [] (List.map (applyTuple viewText) texts)
                        }
                )
                |> Mark.field "url" Mark.string
            ]
        }


applyTuple fn ( one, two ) =
    fn one two


viewText styles string =
    if styles.bold || styles.italic || styles.strike then
        Element.el
            ([ ( Font.bold, styles.bold )
             , ( Font.italic, styles.italic )
             , ( Font.strike, styles.strike )
             ]
                |> toAttributes
            )
            (Element.text string)

    else
        Element.text string



-- converts a list of tuples to a list of attributes


toAttributes : List ( Attribute msg, Bool ) -> List (Attribute msg)
toAttributes list =
    list
        |> List.filterMap
            (\( attribute, bool ) ->
                if bool then
                    Just attribute

                else
                    Nothing
            )



{- Handles Blocks -}


header : Block (Element msg)
header =
    Mark.record "Header"
        (\title subtitle date ->
            Element.column
                [ Element.width Element.fill
                , Element.spacing 20
                ]
                [ blogTitle title
                , blogSubtitle subtitle
                , blogDate date
                ]
        )
        |> Mark.field "title" Mark.string
        |> Mark.field "subtitle" text
        |> Mark.field "date" text
        |> Mark.toBlock


blogTitle : String -> Element msg
blogTitle title =
    Element.el
        [ Element.centerX
        , Font.size 40
        ]
        (Element.text title)



{- the `text` block is a Blog (List (Element msg)) so the inputs for these next 2 following functions have to be List(Element msg)

   Also soe paragraphs I have to use Font.Center not Element.centerX
-}


blogSubtitle : List (Element msg) -> Element msg
blogSubtitle subtitle =
    Element.paragraph
        [ Font.center
        , Font.italic
        , Font.size 25
        ]
        subtitle


blogDate : List (Element msg) -> Element msg
blogDate dateStr =
    Element.paragraph
        [ Font.center
        , Font.size 15
        ]
        ([ Element.text "Published on "
         ]
            ++ dateStr
        )



-- everything underneath will be styled like a README


readmeBlock : Block (Element msg)
readmeBlock =
    Mark.block "ReadmeTitle"
        (\str ->
            Element.column
                []
                [ readmeTitle
                , codeText str
                ]
        )
        Mark.string


readmeTitle : Element msg
readmeTitle =
    Element.text "Readme.md"



-- Rip i have to use html attributes rn but hopefully I can change that


codeText : String -> Element msg
codeText str =
    Html.pre
        [ Html.Attributes.style "padding" "12px"
        , Html.Attributes.style "background-color" "#eee"
        ]
        [ Html.text str ]
        |> Element.html


markupText : String
markupText =
    """

|> Header
    title = Test
    subtitle = Can this even work?
    date = July 2, 2019


|> ReadmeTitle
    This block of text should be formatted as code


Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id pellentesque elit, id sollicitudin felis. Morbi eu risus molestie enim suscipit auctor. Morbi pharetra, nisl ut finibus ornare, dolor tortor aliquet est, quis feugiat odio sem ut sem. Nullam eu bibendum ligula. Nunc mollis tortor ac rutrum interdum. Nunc ultrices risus eu pretium interdum. Nullam maximus convallis quam vitae ullamcorper. Praesent sapien nulla, hendrerit quis tincidunt a, placerat et felis. Nullam consectetur magna nec lacinia egestas. Aenean rutrum nunc diam.
Morbi ut porta justo. Integer ac eleifend sem. Fusce sed auctor velit, et condimentum quam. Vivamus id mollis libero, mattis commodo mauris. In hac habitasse platea dictumst. Duis eu lobortis arcu, ac volutpat ante. Duis sapien enim, auctor vitae semper vitae, tincidunt et justo. Cras aliquet turpis nec enim mattis finibus. Nulla diam urna, semper ut elementum at, porttitor ut sapien. Pellentesque et dui neque. In eget lectus odio. Fusce nulla velit, eleifend sit amet malesuada ac, hendrerit id neque. Curabitur blandit elit et urna fringilla, id commodo quam fermentum. 
But for real, here's a kitten.



"""
