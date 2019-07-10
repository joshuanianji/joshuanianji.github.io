module View.Projects exposing (view)

import Element exposing (Device, DeviceClass(..), Element, Orientation(..))
import Model exposing (Model, Msg)
import View.Project as Project exposing (Project)



{-
      Elm-ui does not have a "percent padding" attribute which would be really useful here. For example, I can't get a 50% padding because I have to use pixels. Thus, I am going to use fillPortion, which works a bit like bootstrap where they will designate a specified ratio of the width of each element with the fillPortion.

      Hypothetically, let's say I have (fillPadding, fillContent) as (1, 2) because the padding is symmetrical on both sides.
      The Element.fillPortion will be 1 for the padding,
      and the Element.fillPortion will be 2 for the content
   This means:

      | -- padding -- | --         content         --| -- padding -- |
      The padding will be half the length of the content, and will use `Element.none` to display nothing.

      In the case of the Phone, I use 0 because I dont want padding at all.
-}


view : Model -> Element Msg
view model =
    let
        ( fillPadding, fillContent ) =
            case model.device.class of
                BigDesktop ->
                    ( 1, 4 )

                Desktop ->
                    ( 1, 6 )

                Tablet ->
                    case model.device.orientation of
                        Portrait ->
                            ( 1, 8 )

                        Landscape ->
                            ( 0, 1 )

                Phone ->
                    ( 0, 1 )

        -- basically squish the content between two Element.none
        addPadding content =
            Element.row
                [ Element.width Element.fill ]
                [ Element.el [ Element.width <| Element.fillPortion fillPadding ] Element.none
                , Element.el [ Element.width <| Element.fillPortion fillContent ] content
                , Element.el [ Element.width <| Element.fillPortion fillPadding ] Element.none
                ]
    in
    Element.column
        [ Element.spacing 50 ]
        [ text, projectView model ]
        |> addPadding



-- the little blurb with lots of vertical padding lelll


text : Element Msg
text =
    Element.paragraph
        [ Element.paddingXY 0 30 ]
        [ Element.text "Welcome to my projects page! Here are my projects from the past year, created in my Computer Science Class. Stay tuned as I add in more!" ]


projectView : Model -> Element Msg
projectView model =
    let
        projectsPerRow =
            case model.device.class of
                BigDesktop ->
                    2

                Desktop ->
                    2

                Tablet ->
                    case model.device.orientation of
                        Portrait ->
                            1

                        Landscape ->
                            2

                Phone ->
                    1
    in
    if projectsPerRow == 1 then
        -- single list of projects
        projectList
            |> List.map Project.view
            --creating the content
            |> Element.column
                [ Element.width Element.fill
                ]

    else
        -- a row of pairs of projects
        projectList
            |> toPairs
            |> List.map
                (\( p, maybeP ) ->
                    Element.row
                        [ Element.width Element.fill ]
                        [ p |> Project.view
                        , maybeP |> Maybe.map Project.view |> Maybe.withDefault Element.none |> Element.el [ Element.width Element.fill ]
                        ]
                )
            -- create content
            |> Element.column
                [ Element.width Element.fill
                , Element.height Element.shrink
                ]



-- ordered by "newest first" because I'm too bad of a programmer to want to learn the Elm Time library oops


projectList : List Project
projectList =
    [ { name = "Periodic Table"
      , imgLink = "src/img/ptable_ss.png"
      , blurb = "A colour-coded periodic table app with a molar mass calculator."
      , aboutLink = "https://joshuaji.com/src/post/ptable.emu"
      , link = "https://joshuaji.com/projects/ptable"
      , githubLink = "https://github.com/joshuanianji/Compsci-IA"
      , year = 2019
      }
    , { name = "Country Fact Finder"
      , imgLink = "src/img/country_fact_finder.png"
      , blurb = "An application that parses and displays information from 5 text files."
      , aboutLink = "https://joshuaji.com/src/post/factFinder.emu"
      , githubLink = "https://github.com/joshuanianji/Country-Fact-Finder"
      , link = "https://joshuaji.com/projects/fact-finder"
      , year = 2019
      }
    , { name = "WordRank"
      , imgLink = "src/img/word_rank_ss.png"
      , blurb = "An application that ranks words based on usage from a string input or a text file."
      , aboutLink = "https://joshuaji.com/src/post/factFinder.emu"
      , githubLink = "https://github.com/joshuanianji/Wordrank"
      , link = "https://joshuaji.com/projects/word-rank"
      , year = 2019
      }
    , { name = "Cryptography"
      , imgLink = "src/img/cryptography.png"
      , blurb = "An app that deals with Caesar and Viginere cyphers, and can calculate hashes."
      , aboutLink = "https://joshuaji.com/src/post/cryptography.emu"
      , githubLink = "https://github.com/joshuanianji/Cryptography"
      , link = "https://joshuaji.com/projects/cryptography"
      , year = 2018
      }
    ]



-- pair up everything in the list. If there are an odd amount of objects return (a, Nothing) in the last element


toPairs : List a -> List ( a, Maybe a )
toPairs list =
    case list of
        [] ->
            []

        [ a ] ->
            [ ( a, Nothing ) ]

        a :: b :: c ->
            ( a, Just b ) :: toPairs c
