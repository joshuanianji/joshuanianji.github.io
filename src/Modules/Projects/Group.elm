module Modules.Projects.Group exposing (view)

{-| Displays a group of projects
-}

import Element exposing (Device, DeviceClass(..), Element, Orientation(..))
import Modules.Projects.Single as Single
import Modules.Projects.Types exposing (Model, Msg, Project)
import SharedState exposing (SharedState)
import Util


view : Model -> SharedState -> List Project -> Element Msg
view model sharedState projects =
    let
        projectsPerRow =
            case sharedState.device.class of
                BigDesktop ->
                    2

                Desktop ->
                    2

                Tablet ->
                    case sharedState.device.orientation of
                        Portrait ->
                            1

                        Landscape ->
                            2

                Phone ->
                    1
    in
    if projectsPerRow == 1 then
        -- single list of projects
        projects
            |> List.map (Single.view sharedState)
            --creating the content
            |> Element.column
                [ Element.width Element.fill
                ]

    else
        -- a row of pairs of projects
        projects
            |> Util.toPairs
            |> List.map
                (\( project, maybeProject ) ->
                    Element.row
                        [ Element.width Element.fill ]
                        [ project |> Single.view sharedState
                        , maybeProject |> Maybe.map (Single.view sharedState) |> Maybe.withDefault Element.none |> Element.el [ Element.width Element.fill ]
                        ]
                )
            -- create content
            |> Element.column
                [ Element.width Element.fill
                , Element.height Element.shrink
                ]
