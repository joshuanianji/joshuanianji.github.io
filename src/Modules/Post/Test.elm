module Modules.Post.Test exposing (main)

{-
   Markup test
-}

import Browser
import Element exposing (Element)
import Element.Events as Events
import Html exposing (Html)
import Mark
import Mark.Edit as Edit


type alias Model =
    { parsed : Maybe Mark.Parsed }


document : Mark.Document (Element Msg)
document =
    Mark.document
        (\html -> Element.el [] html)
        (Mark.block "Title"
            (\( id, s ) ->
                Element.el [ Events.onClick (Click id) ] (Element.text s)
            )
            editableText
        )


editableText =
    Mark.withId Tuple.pair Mark.string


initialModel : Model
initialModel =
    { parsed =
        case Mark.parse document "|> Title \n    some text" of
            Mark.Success parsed ->
                Just parsed

            _ ->
                Nothing
    }


type Msg
    = Click Edit.Id


update : Msg -> Model -> Model
update (Click id) model =
    case model.parsed of
        Just parsed ->
            case Edit.update document (Edit.deleteText id 0 5) parsed of
                Ok newParsed ->
                    { model | parsed = Just newParsed }

                Err errors ->
                    let
                        e =
                            Debug.log "errors" errors
                    in
                    model

        _ ->
            model


view : Model -> Html Msg
view model =
    Element.layout [] <|
        case model.parsed of
            Nothing ->
                Element.none

            Just parsed ->
                case Mark.render document parsed of
                    Mark.Success element ->
                        element

                    _ ->
                        Element.none


main : Program () Model Msg
main =
    Browser.sandbox
        { init = initialModel
        , view = view
        , update = update
        }
