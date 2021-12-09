module Routes exposing (Route(..), fromUrl, toId, toStrCapitals, toUrlString)

import Url
import Url.Parser as Parser exposing (Parser)


type Route
    = Home
    | About
    | Projects
    | Contact


toStrCapitals : Route -> String
toStrCapitals r =
    case r of
        Home ->
            "Home"

        About ->
            "About"

        Projects ->
            "Projects"

        Contact ->
            "Contact"


toId : Route -> String
toId =
    toStrCapitals >> String.toLower



-- Parser


fromUrl : Url.Url -> Route
fromUrl url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Parser.parse urlParser
        |> Maybe.withDefault Home


toUrlString : Route -> String
toUrlString route =
    let
        name =
            case route of
                Home ->
                    "home"

                About ->
                    "about"

                Projects ->
                    "projects"

                Contact ->
                    "contact"
    in
    "#/" ++ name



-- INTERNAL


urlParser : Parser (Route -> a) a
urlParser =
    Parser.oneOf
        [ Parser.map Home Parser.top
        , Parser.map Projects (Parser.s "projects")
        , Parser.map About (Parser.s "about")
        , Parser.map Contact (Parser.s "contact")
        ]
