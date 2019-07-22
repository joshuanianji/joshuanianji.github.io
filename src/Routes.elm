module Routes exposing (Route(..), fromUrl, getFileName, toEmuUrl, toUrlString, urlParser)

{-
   This module is mainly for defining the types and functions used by the Router module. It's like the younger and prettier sister of the Router but at the same time dumber and more useless
-}

import Parser exposing ((|.))
import Url
import Url.Parser as Url exposing ((</>))



-- used for routing and managing the url and stuff


type Route
    = Home
    | Resume
    | Projects
    | PostOverview
    | Post String -- String is the name of the .emu file (without the .emu)
    | NotFound



-- convert the emu filename to the url


toEmuUrl : String -> String
toEmuUrl string =
    "https://joshuaji.com/src/post/" ++ string ++ ".emu"



-- get file name from the EmuLink (e.g. https://joshuaji.com/src/post/cryptography.emu -> Just cryptography). I think I should be able to do this with just the Url parser but I'll fix it later.


getFileName : String -> Maybe String
getFileName link =
    -- convert to URL record
    Url.fromString link
        -- get the emu file name
        |> Maybe.andThen emuPathParser
        -- strip off the .emu at the end of the file
        |> Maybe.andThen emuFileParser
        |> Debug.log "routing to:"



-- from the Url -> cryptography.emu


emuPathParser : Url.Url -> Maybe String
emuPathParser =
    Url.parse (Url.s "src" </> Url.s "post" </> Url.string)



-- from cryptography.emu -> cryptography


emuFileParser : String -> Maybe String
emuFileParser file =
    Parser.succeed ()
        |. Parser.chompWhile (\c -> not (c == '.'))
        |> Parser.getChompedString
        |> (\parser ->
                Parser.run parser file
           )
        |> Result.toMaybe



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

                PostOverview ->
                    [ "post" ]

                Post link ->
                    [ "post", link ]

                -- I have a suspiction that this doesn't get used
                NotFound ->
                    [ "oops" ]
    in
    "#/" ++ String.join "/" pieces



-- parses URL into a route


urlParser : Url.Parser (Route -> a) a
urlParser =
    -- We try to match one of the following URLs
    Url.oneOf
        -- Url.top matches root (i.e. there is nothing after 'https://example.com')
        [ Url.map Home Url.top

        -- Url.s matches URLs ending with some string, in our case '/cats'
        , Url.map Resume (Url.s "resume")
        , Url.map Projects (Url.s "projects")
        , Url.map PostOverview (Url.s "post")

        -- Again, Url.s matches a string. </> matches a '/' in the URL, and Url.string matches any string and "returns" it, so out Post page matched the Url.String
        , Url.map Post (Url.s "post" </> Url.string)
        ]
