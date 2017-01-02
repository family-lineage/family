module Updates exposing (update)

import Material
import Messages exposing (Msg(..))
import Models exposing (Model, Person, newPerson, PersonId)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Save ->
            savePerson model

        ChangePersonId personId ->
            ( { model | personId = personId }
            , Cmd.none
            )

        ChangePersonName name ->
            ( { model | personName = name }
            , Cmd.none
            )

        ChangePersonGender gender ->
            ( { model | personGender = gender }
            , Cmd.none
            )

        ToggleIsPersonSelf ->
            ( { model | isPersonSelf = not model.isPersonSelf }
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
            , personId = Nothing
            , personName = ""
          }
        , Cmd.none
        )
