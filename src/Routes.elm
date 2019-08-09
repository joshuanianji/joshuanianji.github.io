module Routes exposing (Route(..), fromUrl, getFileName, toEmuUrl, toUrlString, urlParser)

{-
   This module is mainly for defining the types and functions used by the Router module. It's like the younger and prettier sister of the Router but at the same time dumber and more useless
-}

import Parser exposing ((|.))
import Url
import Url.Parser as Url exposing ((</>))



-- ROUTING


type Route
    = Home
    | Resume
    | Projects
    | PostOverview
    | Post String -- String is the name of the .emu file (without the .emu)
    | NotFound


urlParser : Url.Parser (Route -> a) a
urlParser =
    Url.oneOf
        [ Url.map Home Url.top
        , Url.map Resume (Url.s "resume")
        , Url.map Projects (Url.s "projects")
        , Url.map PostOverview (Url.s "post")
        , Url.map Post (Url.s "post" </> Url.string)
        ]



-- PUBLIC HELPERS


fromUrl : Url.Url -> Route
fromUrl url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> Url.parse urlParser
        |> Maybe.withDefault NotFound



-- convert the emu filename to the url


toEmuUrl : String -> String
toEmuUrl string =
    "https://joshuaji.com/src/post/" ++ string ++ ".emu"



-- Should be able to use the URL parser for this...


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



-- INTERNAL


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
