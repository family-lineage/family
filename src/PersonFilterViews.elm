module PersonFilterViews exposing (filterView)

import Html exposing (Html, div, input, text, span)
import Html.Events exposing (onInput, onClick)
import Material.Textfield as Textfield
import Material.Button as Button
import Material.List as List
import Material.Elevation as Elevation
import Material.Options as Options
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
        if String.length cleanName > 0 then
            List.filter
                (\person ->
                    person.name
                        |> String.toLower
                        |> String.contains cleanName
                )
                people
        else
            people


addButton : Model -> List Int -> String -> Msg -> Html Msg
addButton model indexes labelText msg =
    Button.render Mdl
        indexes
        model.mdl
        [ Button.ripple, Options.onClick msg ]
        [ text labelText ]


nameField : Model -> Html Msg
nameField model =
    Textfield.render
        Mdl
        [ 9, 0 ]
        model.mdl
        [ Textfield.label "Type to search"
        , Textfield.text_
        , Textfield.value model.filterPersonName
        , Options.onInput ChangeFilterPersonName
        ]
        []


personView : Model -> Person -> Html Msg
personView model person =
    let
        itemOptions =
            if Just person.id == model.personId then
                [ Elevation.e2 ]
            else
                []

        familyButtons =
            if Just person.id == model.personId then
                []
            else
                [ addButton model [ 9 + person.id, 0 ] "+Father" (ChangePersonFather (Just person.id))
                , addButton model [ 9 + person.id, 1 ] "+Mother" (ChangePersonMother (Just person.id))
                , addButton model [ 9 + person.id, 2 ] "+Spouse" (ChangePersonSpouse (Just person.id))
                ]
    in
        List.li itemOptions
            ([ List.content
                [ Options.attribute <| onClick (UpdatePerson person) ]
                [ text person.name ]
             ]
                ++ familyButtons
            )


filterView : Model -> Html Msg
filterView model =
    div []
        [ div []
            [ nameField model ]
        , List.ul []
            (model.people
                |> filteredPeople model.filterPersonName
                |> List.map (personView model)
            )
        ]
