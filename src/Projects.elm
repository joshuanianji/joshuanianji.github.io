module Projects exposing (Language(..), Project, Purpose(..), filterLanguage, languageList, projects, purposeList)

{-| interface for the Project data structure
-}


type alias Project =
    { name : String
    , imgLink : String
    , blurb : String
    , aboutLink : String
    , link : String
    , githubLink : String
    , year : Int
    , language : Language
    , purpose : Purpose
    }


type Language
    = Elm
    | Python


type Purpose
    = School
    | Fancy
    | Personal


purposeList : List Purpose
purposeList =
    [ School, Fancy, Personal ]


languageList : List Language
languageList =
    [ Elm, Python ]



-- Helpers


filterLanguage : Language -> List Project -> List Project
filterLanguage language projs =
    List.filter
        (\project -> project.language == language)
        projs



-- DATA


{-| This is ordered by newest first but I want to add in a time field one day
-}
projects : List Project
projects =
    [ { name = "HIIT-Timer"
      , imgLink = "src/img/hiit-timer.png"
      , blurb = "A customizable PWA that times your workouts."
      , aboutLink = "https://joshuaji.com/src/post/ui-bootstrap-demo.emu"
      , link = "https://joshuaji.com/projects/hiit-timer"
      , githubLink = "https://github.com/joshuanianji/HIIT-Timer"
      , year = 2020
      , language = Elm
      , purpose = Personal
      }
    , { name = "Derivatives"
      , imgLink = "src/img/derivatives.png"
      , blurb = "An application to calculate derivatives, using intuitive LaTeX and output."
      , aboutLink = "https://joshuaji.com/src/post/ui-bootstrap-demo.emu"
      , link = "https://joshuaji.com/projects/derivative"
      , githubLink = "https://github.com/joshuanianji/Derivative"
      , year = 2020
      , language = Elm
      , purpose = Personal
      }
    , { name = "Ui Bootstrap Elm Demo"
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
