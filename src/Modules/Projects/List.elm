module Modules.Projects.List exposing (filter, projects)

{-| The List of Projects
-}

import Modules.Projects.Types exposing (Language(..), Project, Purpose(..))



-- filter a list of projects based on their language


filter : Language -> List Project -> List Project
filter language projs =
    List.filter
        (\project -> project.language == language)
        projs



-- ordered by "newest first" because I'm too bad of a programmer to want to learn the Elm Time library oops


projects : List Project
projects =
    [ { name = "Ui Bootstrap Elm Demo"
      , imgLink = "src/img/ui-bootstrap-demo.png"
      , blurb = "A demo application for the Elm Ui Bootstrap project."
      , aboutLink = "https://joshuaji.com/src/post/ui-bootstrap-demo.emu"
      , link = "https://joshuaji.com/projects/ui-bootstrap-demo"
      , githubLink = "https://github.com/joshuanianji/ui-bootstrap-demo"
      , year = 2019
      , language = Elm
      , purpose = Fancy
      }
    , { name = "Periodic Table"
      , imgLink = "src/img/ptable_ss.png"
      , blurb = "A colour-coded periodic table app with a molar mass calculator."
      , aboutLink = "https://joshuaji.com/src/post/ptable.emu"
      , link = "https://joshuaji.com/projects/ptable"
      , githubLink = "https://github.com/joshuanianji/Compsci-IA"
      , year = 2019
      , language = Elm
      , purpose = School
      }
    , { name = "Country Fact Finder"
      , imgLink = "src/img/country_fact_finder.png"
      , blurb = "An application that parses and displays information from 5 text files."
      , aboutLink = "https://joshuaji.com/src/post/fact-finder.emu"
      , githubLink = "https://github.com/joshuanianji/Country-Fact-Finder"
      , link = "https://joshuaji.com/projects/fact-finder"
      , year = 2019
      , language = Elm
      , purpose = School
      }
    , { name = "WordRank"
      , imgLink = "src/img/word_rank_ss.png"
      , blurb = "An application that ranks words based on usage from a string input or a text file."
      , aboutLink = "https://joshuaji.com/src/post/word-rank.emu"
      , githubLink = "https://github.com/joshuanianji/Wordrank"
      , link = "https://joshuaji.com/projects/word-rank"
      , year = 2019
      , language = Elm
      , purpose = School
      }
    , { name = "Cryptography"
      , imgLink = "src/img/cryptography.png"
      , blurb = "An app that deals with Caesar and Viginere cyphers, and can calculate hashes."
      , aboutLink = "https://joshuaji.com/src/post/cryptography.emu"
      , githubLink = "https://github.com/joshuanianji/Cryptography"
      , link = "https://joshuaji.com/projects/cryptography"
      , year = 2018
      , language = Elm
      , purpose = School
      }
    ]
