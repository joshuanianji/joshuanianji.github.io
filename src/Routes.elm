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



{- converts URL into a Route

       THANKS FOR https://github.com/rtfeldman/elm-spa-example/blob/master/src/Route.elm#L59-L65 FOR THE CODE! AND [THIS](https://www.reddit.com/r/elm/comments/b4ao63/trouble_with_extracting_parsing_url_fragment/) REDDIT POST

   the fragment in the URL type, or everything after the hashtag, is actually treated as another field entirely, so we just moved it all to the path, then parse it. I think Url.parse only looks at the path or something, and the fragment parser is kinda complicated tbh.
-}


fromUrl : Url.Url -> Route
fromUrl url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Url.parse urlParser
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

                -- I have a suspiction that this doesn't get used
                NotFound ->
                    [ "oops" ]
    in
    "#/" ++ String.join "/" pieces



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
