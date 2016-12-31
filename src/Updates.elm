module Updates exposing (update)

import Messages exposing (Msg(..))
import Models exposing (Model, Person)


update : Msg -> Model -> Model
update msg model =
    case msg of
        Save ->
            savePerson model

        _ ->
            model


savePerson : Model -> Model
savePerson model =
    let
        person =
            Person (List.length model.people) model.personName model.personGender Nothing Nothing Nothing

        newPeople =
            person :: model.people
    in
        { model
            | people = newPeople
            , personName = ""
        }
