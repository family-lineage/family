module Updates exposing (update)

import Material
import Messages exposing (Msg(..))
import Models exposing (Model, Person, newPerson, PersonId)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Save ->
            savePerson model

        UpdatePerson person ->
            ( { model
                | personId = Just person.id
                , personName = person.name
                , personGender = person.gender
                , isPersonSelf = person.isPersonSelf
              }
            , Cmd.none
            )

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
    case model.personId of
        Just personId ->
            let
                updatePerson existingPerson =
                    if personId == existingPerson.id then
                        { existingPerson
                            | name = model.personName
                            , gender = model.personGender
                            , isPersonSelf = model.isPersonSelf
                        }
                    else
                        existingPerson
            in
                ( { model
                    | people = List.map updatePerson model.people
                    , personId = Nothing
                    , personName = ""
                    , isPersonSelf = False
                  }
                , Cmd.none
                )

        Nothing ->
            ( { model
                | people = newPerson model :: model.people
                , personId = Nothing
                , personName = ""
                , isPersonSelf = False
              }
            , Cmd.none
            )
