module Routes exposing (Route(..), fromUrl, toUrlString, urlParser)

{-
   This module is mainly for defining the types and functions used by the Router module. It's like the younger and prettier sister of the Router but at the same time dumber and more useless
-}

import Url
import Url.Parser as Url exposing ((</>), Parser)



-- used for routing and managing the url and stuff


type Route
    = Home
    | Resume
    | Projects
    | Post
    | NotFound



-- converts URL into a Route


fromUrl : Url.Url -> Route
fromUrl url =
    Url.parse urlParser url
        |> Maybe.withDefault NotFound



-- converts a route to a URL string


toUrlString : Route -> String
toUrlString route =
    let
        pieces =
            case route of
                Home ->
                    []

                Resume ->
                    [ "resume" ]

                Projects ->
                    [ "projects" ]

                Post ->
                    [ "post" ]

                NotFound ->
                    [ "404" ]
    in
    "/" ++ String.join "/" pieces



-- parses URL into a route


urlParser : Parser (Route -> a) a
urlParser =
    -- We try to match one of the following URLs
    Url.oneOf
        -- Url.top matches root (i.e. there is nothing after 'https://example.com')
        [ Url.map Home Url.top

        -- Url.s matches URLs ending with some string, in our case '/cats'
        , Url.map Resume (Url.s "resume")

        -- Again, Url.s matches a string. </> matches a '/' in the URL, and Url.int matches any integer and "returns" it, so that the user page value gets the user ID
        , Url.map Projects (Url.s "projects")
        , Url.map Post (Url.s "post")
        ]



{-
   HINT FOR LATER USE
   -- Again, Url.s matches a string. </> matches a '/' in the URL, and Url.int matches any integer and "returns" it, so that the user page value gets the user ID
       , Url.map Projects (Url.s "user" </> Url.int)
-}
