module PersonSelect exposing (..)

import Html exposing (Html, div, select, option, text)
import Messages exposing (Msg(..))
import Models exposing (Model, People, Person, PersonId)
import Material.Icon as Icon
import Material.Menu as Menu
import Material.Options as Options exposing (css)


personMenuItem : Maybe PersonId -> (Maybe PersonId -> Msg) -> Person -> Menu.Item Msg
personMenuItem initialValue message person =
    let
        checkmark x =
            if x then
                Icon.view "check" [ css "width" "40px" ]
            else
                Options.span [ css "width" "40px" ] []

        selected =
            person.id == (Maybe.withDefault 0 initialValue)
    in
        Menu.item
            [ Menu.onSelect (message (Just person.id)) ]
            [ checkmark selected
            , text person.name
            ]


peopleSelect : List Int -> (People -> People) -> Model -> Maybe PersonId -> (Maybe PersonId -> Msg) -> Html Msg
peopleSelect indexes peopleFilter model selectedPersonId message =
    Menu.render Mdl
        indexes
        model.mdl
        [ Menu.ripple, Menu.bottomLeft ]
        (model.people
            |> peopleFilter
            |> List.map (personMenuItem selectedPersonId message)
        )
