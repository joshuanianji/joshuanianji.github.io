module Modules.NotFound.View exposing (view)

-- I'm pretty sure we can't make our file names with numbers so I just called this 404 page "NotFound"

import Element exposing (Element)
import Model exposing (Msg)


view : Element Msg
view =
    "Looks like your page wasn't found!"
        |> Element.text
