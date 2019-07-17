module Modules.Projects.Types exposing (Project)

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
