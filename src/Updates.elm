module Updates exposing (update)

import Messages exposing (Msg(..))
import Models exposing (Model, Person, newPerson)


update : Msg -> Model -> Model
update msg model =
    case msg of
        Save ->
            savePerson model

        ChangePersonName name ->
            { model | personName = name }

        ChangePersonGender gender ->
            { model | personGender = gender }

        ToggleIsYourself ->
            { model | isYourself = not model.isYourself }

        _ ->
            model


savePerson : Model -> Model
savePerson model =
    let
        person =
            newPerson model

        newPeople =
            person :: model.people
    in
        { model
            | people = newPeople
            , personName = ""
        }
