module MarkdownRenderer exposing (renderer)

import Css exposing (..)
import Html.Styled as Html
import Html.Styled.Attributes as Attr exposing (css)
import Markdown.Block as Block
import Markdown.Html
import Markdown.Renderer
import SyntaxHighlight
import Util


renderer : Markdown.Renderer.Renderer (Html.Html msg)
renderer =
    { heading = heading
    , paragraph = Html.p []
    , thematicBreak = Html.hr [] []
    , text = Html.text
    , strong = \content -> Html.strong [ css [ fontWeight bold ] ] content
    , emphasis = \content -> Html.em [ css [ fontStyle italic ] ] content
    , blockQuote = Html.blockquote []
    , codeSpan =
        \content ->
            Html.code
                [ css
                    [ fontWeight (int 600)
                    , Css.color (Css.rgb 226 0 124) |> Css.important
                    ]
                ]
                [ Html.text content ]

    --, codeSpan = code
    , link =
        \{ destination } body ->
            Util.htmlLink destination body
    , hardLineBreak = Html.br [] []
    , image =
        \image ->
            case image.title of
                Just _ ->
                    Html.img [ Attr.src image.src, Attr.alt image.alt ] []

                Nothing ->
                    Html.img [ Attr.src image.src, Attr.alt image.alt ] []
    , unorderedList =
        \items ->
            Html.ul []
                (items
                    |> List.map
                        (\item ->
                            case item of
                                Block.ListItem task children ->
                                    let
                                        checkbox =
                                            case task of
                                                Block.NoTask ->
                                                    Html.text ""

                                                Block.IncompleteTask ->
                                                    Html.input
                                                        [ Attr.disabled True
                                                        , Attr.checked False
                                                        , Attr.type_ "checkbox"
                                                        ]
                                                        []

                                                Block.CompletedTask ->
                                                    Html.input
                                                        [ Attr.disabled True
                                                        , Attr.checked True
                                                        , Attr.type_ "checkbox"
                                                        ]
                                                        []
                                    in
                                    Html.li [] (checkbox :: children)
                        )
                )
    , orderedList =
        \startingIndex items ->
            Html.ol
                (case startingIndex of
                    1 ->
                        [ Attr.start startingIndex ]

                    _ ->
                        []
                )
                (items
                    |> List.map
                        (\itemBlocks ->
                            Html.li []
                                itemBlocks
                        )
                )
    , html =
        Markdown.Html.oneOf
            []
    , codeBlock = codeBlock
    , table =
        Html.table
            [ {-
                 table-layout: auto;
                     text-align: left;
                     width: 100%;
                     margin-top: 2em;
                     margin-bottom: 2em;
              -}
              css
                [--Tw.table_auto
                 --, Tw.w_full
                 --, Tw.mt_4
                 --, Tw.mb_4
                ]
            ]
    , tableHeader = Html.thead []
    , tableBody = Html.tbody []
    , tableRow = Html.tr []
    , strikethrough =
        \children -> Html.del [] children
    , tableHeaderCell =
        \maybeAlignment ->
            let
                attrs =
                    maybeAlignment
                        |> Maybe.map
                            (\alignment ->
                                case alignment of
                                    Block.AlignLeft ->
                                        "left"

                                    Block.AlignCenter ->
                                        "center"

                                    Block.AlignRight ->
                                        "right"
                            )
                        |> Maybe.map Attr.align
                        |> Maybe.map List.singleton
                        |> Maybe.withDefault []
            in
            Html.th attrs
    , tableCell =
        \maybeAlignment ->
            let
                attrs =
                    maybeAlignment
                        |> Maybe.map
                            (\alignment ->
                                case alignment of
                                    Block.AlignLeft ->
                                        "left"

                                    Block.AlignCenter ->
                                        "center"

                                    Block.AlignRight ->
                                        "right"
                            )
                        |> Maybe.map Attr.align
                        |> Maybe.map List.singleton
                        |> Maybe.withDefault []
            in
            Html.td attrs
    }


rawTextToId : String -> String
rawTextToId rawText =
    rawText
        |> String.split " "
        |> String.join "-"
        |> String.toLower


heading : { level : Block.HeadingLevel, rawText : String, children : List (Html.Html msg) } -> Html.Html msg
heading { level, rawText, children } =
    case level of
        Block.H1 ->
            Html.h1
                [ css
                    [ fontSize (rem 2.5)
                    , fontWeight bold
                    ]
                ]
                children

        Block.H2 ->
            Html.h2
                [ Attr.id (rawTextToId rawText)
                , Attr.attribute "name" (rawTextToId rawText)
                , css
                    [ fontSize (rem 2)
                    , fontWeight bold
                    ]
                ]
                [ Html.a
                    [ Attr.href <| "#" ++ rawTextToId rawText
                    , css
                        []
                    ]
                    (children
                        ++ [ Html.span
                                [ Attr.class "anchor-icon"
                                , css
                                    []
                                ]
                                [ Html.text "#" ]
                           ]
                    )
                ]

        _ ->
            (case level of
                Block.H1 ->
                    Html.h1

                Block.H2 ->
                    Html.h2

                Block.H3 ->
                    Html.h3

                Block.H4 ->
                    Html.h4

                Block.H5 ->
                    Html.h5

                Block.H6 ->
                    Html.h6
            )
                [ css
                    [ fontSize (rem 1.5)
                    , fontWeight bold
                    ]
                ]
                children


codeBlock : { body : String, language : Maybe String } -> Html.Html msg
codeBlock details =
    let
        lang =
            details.language
                |> Maybe.map (\l -> "lang-" ++ String.toLower l)
                |> Maybe.withDefault "nohighlight"
    in
    Html.pre []
        [ Html.code
            [ Attr.class lang
            , css
                [ borderRadius (em 0.5)
                , fontSize (em 0.75)
                ]
            ]
            [ Html.text details.body ]
        ]
