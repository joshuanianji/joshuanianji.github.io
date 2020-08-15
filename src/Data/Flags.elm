module Data.Flags exposing (Flags, WindowSize)


type alias Flags =
    { windowSize : WindowSize
    , projectsJson : String
    }


type alias WindowSize =
    { width : Int
    , height : Int
    }
