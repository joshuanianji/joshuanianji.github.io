module WebsiteVersion exposing (DateRange, Status(..), TechStack(..), Website, getWebsites, statusColour, statusToString, techStackToID, techStackToString)

import BackendTask exposing (BackendTask)
import BackendTask.File
import Color exposing (Color)
import Colours
import Date exposing (Date)
import FatalError exposing (FatalError)
import Iso8601
import Time exposing (Posix)
import Yaml.Decode



-- Backend Task to get all the websites
-- we only read from website-versions.yml


getWebsites : BackendTask FatalError (List Website)
getWebsites =
    BackendTask.File.rawFile "website-versions.yml"
        |> BackendTask.allowFatal
        |> BackendTask.andThen decodeWebsites


decodeWebsites : String -> BackendTask FatalError (List Website)
decodeWebsites s =
    case Yaml.Decode.fromString (Yaml.Decode.list decodeWebsite) s of
        Ok websites ->
            BackendTask.succeed websites

        Err e ->
            BackendTask.fail <| FatalError.fromString ("Failed to decode websites: " ++ Yaml.Decode.errorToString e)


decodeWebsite : Yaml.Decode.Decoder Website
decodeWebsite =
    Yaml.Decode.succeed Website
        |> Yaml.Decode.andMap (Yaml.Decode.field "version" Yaml.Decode.int)
        |> Yaml.Decode.andMap (Yaml.Decode.field "tech-stack" (Yaml.Decode.list decodeTechStack))
        |> Yaml.Decode.andMap (Yaml.Decode.field "url" Yaml.Decode.string)
        |> Yaml.Decode.andMap (Yaml.Decode.field "state" decodeState)
        |> Yaml.Decode.andMap (Yaml.Decode.field "comments" Yaml.Decode.string)


decodeTechStack : Yaml.Decode.Decoder TechStack
decodeTechStack =
    Yaml.Decode.string
        |> Yaml.Decode.andThen
            (\s ->
                case s of
                    "Elm" ->
                        Yaml.Decode.succeed Elm

                    "HCJ" ->
                        Yaml.Decode.succeed HCJ

                    "Webpack" ->
                        Yaml.Decode.succeed Webpack

                    "AngularJS" ->
                        Yaml.Decode.succeed AngularJS

                    "Bootstrap" ->
                        Yaml.Decode.succeed Bootstrap

                    "JQuery" ->
                        Yaml.Decode.succeed JQuery

                    _ ->
                        Yaml.Decode.fail ("Unknown tech stack: " ++ s)
            )


decodeState : Yaml.Decode.Decoder Status
decodeState =
    Yaml.Decode.field "status" Yaml.Decode.string
        |> Yaml.Decode.andThen
            (\s ->
                case s of
                    "deprecated" ->
                        Yaml.Decode.map2 DateRange
                            (Yaml.Decode.field "started" dateDecoder)
                            (Yaml.Decode.field "ended" dateDecoder)
                            |> Yaml.Decode.map Deprecated

                    "unreleased" ->
                        Yaml.Decode.map2 DateRange
                            (Yaml.Decode.field "started" dateDecoder)
                            (Yaml.Decode.field "ended" dateDecoder)
                            |> Yaml.Decode.map Unreleased

                    "online" ->
                        Yaml.Decode.field "started" dateDecoder
                            |> Yaml.Decode.map Online

                    _ ->
                        Yaml.Decode.fail ("Unknown status: " ++ s)
            )


dateDecoder : Yaml.Decode.Decoder Date
dateDecoder =
    let
        dateParser : String -> Yaml.Decode.Decoder Posix
        dateParser s =
            case Iso8601.toTime s of
                Ok date ->
                    Yaml.Decode.succeed date

                Err _ ->
                    Yaml.Decode.fail ("Invalid date: " ++ s)
    in
    Yaml.Decode.string
        |> Yaml.Decode.andThen dateParser
        |> Yaml.Decode.map (Date.fromPosix Time.utc)



-- TYPES


type alias Website =
    { version : Int
    , techStack : List TechStack
    , url : String
    , status : Status
    , comments : String
    }


type TechStack
    = Elm
    | HCJ
    | Webpack
    | AngularJS
    | Bootstrap
    | JQuery


type Status
    = Deprecated DateRange
    | Unreleased DateRange
    | Online Date


type alias DateRange =
    { start : Date
    , end : Date
    }



-- HELPERS


techStackToString : TechStack -> String
techStackToString t =
    case t of
        Elm ->
            "Elm"

        HCJ ->
            "HTML, CSS & JS"

        Webpack ->
            "Webpack"

        AngularJS ->
            "AngularJS"

        Bootstrap ->
            "Bootstrap"

        JQuery ->
            "JQuery"



-- name of the file inside public/assets/{ID}.png
-- this will be validated at build time (that they exist)


techStackToID : TechStack -> String
techStackToID t =
    case t of
        Elm ->
            "elm"

        HCJ ->
            "hcj"

        Webpack ->
            "webpack"

        AngularJS ->
            "angularjs"

        Bootstrap ->
            "bootstrap"

        JQuery ->
            "jquery"


statusToString : Status -> String
statusToString s =
    case s of
        Deprecated _ ->
            "Deprecated"

        Unreleased _ ->
            "Unreleased"

        Online _ ->
            "Online"


statusColour : Status -> Color
statusColour s =
    case s of
        Deprecated _ ->
            Colours.errorRed

        Unreleased _ ->
            Colours.gray

        Online _ ->
            Colours.green
