module PersonFilterViews exposing (filterView)

import Html exposing (Html, div, input, text)
import Html.Events exposing (onInput)
import Messages exposing (Msg(..))
import Models exposing (Model, People, Person, PersonId)


filteredPeople : String -> People -> People
filteredPeople name people =
    let
        cleanName =
            name
                |> String.trim
                |> String.toLower
    in
        if String.length cleanName > 1 then
            List.filter
                (\person -> String.contains cleanName (String.toLower person.name))
                people
        else
            []


personView : Person -> Html Msg
personView person =
    div [] [ text person.name ]


filterView : Model -> Html Msg
filterView model =
    div []
        [ div []
            [ input [ onInput ChangeFilterPersonName ] [] ]
        , div []
            (model.people
                |> filteredPeople model.filterPersonName
                |> List.map personView
            )
        ]
