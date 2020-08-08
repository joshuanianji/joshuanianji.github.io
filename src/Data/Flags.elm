module Data.Flags exposing (Flags, WindowSize)


type alias Flags =
    { windowSize : WindowSize }


type alias WindowSize =
    { width : Int
    , height : Int
    }
