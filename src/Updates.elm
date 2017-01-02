module Updates exposing (update)

import Material
import Messages exposing (Msg(..))
import Models exposing (Model, Person, newPerson)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Save ->
            savePerson model

        ChangePersonName name ->
            ( { model | personName = name }
            , Cmd.none
            )

        ChangePersonGender gender ->
            ( { model | personGender = gender }
            , Cmd.none
            )

        ToggleIsYourself ->
            ( { model | isYourself = not model.isYourself }
            , Cmd.none
            )

        Mdl msg_ ->
            Material.update Mdl msg_ model

        _ ->
            ( model, Cmd.none )


savePerson : Model -> ( Model, Cmd Msg )
savePerson model =
    let
        person =
            newPerson model

        newPeople =
            person :: model.people
    in
        ( { model
            | people = newPeople
            , personName = ""
          }
        , Cmd.none
        )
