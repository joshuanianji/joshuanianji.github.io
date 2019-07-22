module Modules.Projects.View exposing (view)

import Browser.Navigation as Navigation
import Element exposing (Device, DeviceClass(..), Element, Orientation(..))
import Modules.Projects.Group as Group
import Modules.Projects.Types exposing (Model, Msg(..), Project)
import SharedState exposing (SharedState)
import UiFramework.Padding



-- VIEW --


view : Model -> SharedState -> Element Msg
view model sharedState =
    Element.column
        [ Element.spacing 50 ]
        [ text
        , Group.view model sharedState compsciProjects
        ]
        |> UiFramework.Padding.responsive sharedState.device



-- the little blurb with lots of vertical padding lelll


text : Element Msg
text =
    Element.paragraph
        [ Element.paddingXY 0 30 ]
        [ Element.text "Welcome to my projects page! Here are my projects from the past year, created in my Computer Science Class. Stay tuned as I add in more!" ]



-- ordered by "newest first" because I'm too bad of a programmer to want to learn the Elm Time library oops


compsciProjects : List Project
compsciProjects =
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
      , aboutLink = "https://joshuaji.com/src/post/fact-finder.emu"
      , githubLink = "https://github.com/joshuanianji/Country-Fact-Finder"
      , link = "https://joshuaji.com/projects/fact-finder"
      , year = 2019
      }
    , { name = "WordRank"
      , imgLink = "src/img/word_rank_ss.png"
      , blurb = "An application that ranks words based on usage from a string input or a text file."
      , aboutLink = "https://joshuaji.com/src/post/word-rank.emu"
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
