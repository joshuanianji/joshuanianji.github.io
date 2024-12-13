module Article exposing (BlogPost, Metadata, allMetadata, blogPostsGlob, frontmatterDecoder, view)

import BackendTask
import BackendTask.File as File
import BackendTask.Glob as Glob
import Colours
import Css exposing (..)
import Date exposing (Date)
import FatalError exposing (FatalError)
import Html
import Html.Styled
import Html.Styled.Attributes exposing (css, fromUnstyled)
import Json.Decode as Decode exposing (Decoder)
import Json.Decode.Pipeline as Pipeline
import Route exposing (Route)
import Util


type alias BlogPost =
    { filePath : String
    , slug : String
    }


blogPostsGlob : BackendTask.BackendTask error (List { filePath : String, slug : String })
blogPostsGlob =
    Glob.succeed BlogPost
        |> Glob.captureFilePath
        |> Glob.match (Glob.literal "blog/")
        |> Glob.capture Glob.wildcard
        |> Glob.match (Glob.literal ".md")
        |> Glob.toBackendTask


allMetadata :
    BackendTask.BackendTask
        { fatal : FatalError, recoverable : File.FileReadError Decode.Error }
        (List ( Route.Route, Metadata ))
allMetadata =
    blogPostsGlob
        |> BackendTask.map
            (\paths ->
                paths
                    |> List.map
                        (\{ filePath, slug } ->
                            BackendTask.map2 Tuple.pair
                                (BackendTask.succeed <| Route.Blog__Slug_ { slug = slug })
                                (File.onlyFrontmatter frontmatterDecoder filePath)
                        )
            )
        |> BackendTask.resolve
        |> BackendTask.map
            (\articles ->
                articles
                    |> List.filterMap
                        (\( route, metadata ) ->
                            if metadata.draft then
                                Nothing

                            else
                                Just ( route, metadata )
                        )
            )
        |> BackendTask.map
            (List.sortBy
                (\( route, metadata ) -> -(Date.toRataDie metadata.published))
            )


type alias Metadata =
    { title : String
    , description : String
    , published : Date
    , draft : Bool
    }


frontmatterDecoder : Decoder Metadata
frontmatterDecoder =
    Decode.succeed Metadata
        |> Pipeline.required "title" Decode.string
        |> Pipeline.required "description" Decode.string
        |> Pipeline.required "published"
            (Decode.string
                |> Decode.andThen
                    (\isoString ->
                        case Date.fromIsoString isoString of
                            Ok date ->
                                Decode.succeed date

                            Err error ->
                                Decode.fail error
                    )
            )
        |> Pipeline.optional "draft" Decode.bool False



-- VIEW


view : ( Route, Metadata ) -> Html.Styled.Html msg
view ( route_, metadata ) =
    Html.Styled.div
        [ css
            [ Util.flexDirection Util.Column
            , width (pct 100)
            , padding (em 1.5)
            , border3 (px 1) solid (Colours.toCss Colours.gray)
            , borderRadius (em 0.5)
            , hover
                [ borderColor (Colours.toCss Colours.black) ]
            , property "gap" "0.5em"
            ]
        ]
        [ Route.toLink (blogPostTitle metadata) route_
        , blogDate metadata.published
        , blogDescription metadata.description
        ]


blogPostTitle : Metadata -> List (Html.Attribute msg) -> Html.Styled.Html msg
blogPostTitle metadata attrs =
    Html.Styled.a
        (css
            [ fontSize (em 1.25)
            , fontWeight bold
            , textDecoration none
            , color (Colours.toCss Colours.black)
            , hover
                [ color (Colours.toCss Colours.themeBlue) ]
            ]
            :: List.map fromUnstyled attrs
        )
        [ Html.Styled.text metadata.title ]


blogDate : Date -> Html.Styled.Html msg
blogDate date =
    Html.Styled.p
        [ css
            [ fontSize (em 0.75) ]
        ]
        [ Html.Styled.text <| Date.format "MMMM d, yyyy" date ]


blogDescription : String -> Html.Styled.Html msg
blogDescription description =
    Html.Styled.p [] [ Html.Styled.text description ]
