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
                , personMother = person.motherId
                , personFather = person.fatherId
                , personSpouse = person.spouseId
                , isPersonSelf = person.isPersonSelf
              }
            , Cmd.none
            )

        ChangePersonName name ->
            ( { model
                | personName = name
                , isFormValid = not (String.isEmpty name)
              }
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
                            , motherId = model.personMother
                            , fatherId = model.personFather
                            , spouseId = model.personSpouse
                        }
                    else
                        existingPerson
            in
                ( { model
                    | people = List.map updatePerson model.people
                    , personId = Nothing
                    , personName = ""
                    , personMother = Nothing
                    , personFather = Nothing
                    , personSpouse = Nothing
                    , isPersonSelf = False
                  }
                , Cmd.none
                )

        Nothing ->
            ( { model
                | people = newPerson model :: model.people
                , personId = Nothing
                , personName = ""
                , personMother = Nothing
                , personFather = Nothing
                , personSpouse = Nothing
                , isPersonSelf = False
              }
            , Cmd.none
            )
