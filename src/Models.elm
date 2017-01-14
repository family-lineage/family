module Models exposing (..)

import Material


type alias PersonId =
    Int


type alias People =
    List Person


type alias Person =
    { id : PersonId
    , name : String
    , gender : Gender
    , fatherId : Maybe PersonId
    , motherId : Maybe PersonId
    , spouseId : Maybe PersonId
    , isPersonSelf : Bool
    }


type Gender
    = Male
    | Female


type alias Model =
    { people : People
    , personId : Maybe PersonId
    , personName : String
    , personGender : Gender
    , personFather : Maybe PersonId
    , personMother : Maybe PersonId
    , personSpouse : Maybe PersonId
    , isPersonSelf : Bool
    , isFormValid : Bool
    , filterPersonName : String
    , mdl : Material.Model
    }


initialModel : Model
initialModel =
    { people =
        [ newSimplePerson 1 "Person One" Male
        , newSimplePerson 2 "Person Two" Female
        , newSimplePerson 3 "Person Three" Male
        , newSimplePerson 4 "Person Four" Male
        ]
    , personId = Nothing
    , personName = ""
    , personGender = Male
    , personFather = Nothing
    , personMother = Nothing
    , personSpouse = Nothing
    , isPersonSelf = False
    , isFormValid = False
    , filterPersonName = ""
    , mdl = Material.model
    }


newSimplePerson : PersonId -> String -> Gender -> Person
newSimplePerson personId name gender =
    { id = personId
    , name = name
    , gender = gender
    , fatherId = Nothing
    , motherId = Nothing
    , spouseId = Nothing
    , isPersonSelf = False
    }


newPerson : Model -> Person
newPerson model =
    { id = (List.length model.people) + 1
    , name = model.personName
    , gender = model.personGender
    , fatherId = model.personFather
    , motherId = model.personMother
    , spouseId = model.personSpouse
    , isPersonSelf = model.isPersonSelf
    }


genderPeople : Maybe PersonId -> Gender -> People -> People
genderPeople personId gender people =
    let
        personFilter person =
            case personId of
                Just pId ->
                    person.gender == gender && person.id /= pId

                Nothing ->
                    person.gender == gender
    in
        List.filter personFilter people


malePeople : Maybe PersonId -> People -> People
malePeople personId people =
    genderPeople personId Male people


femalePeople : Maybe PersonId -> People -> People
femalePeople personId people =
    genderPeople personId Female people


getPerson : People -> Maybe PersonId -> Maybe Person
getPerson people maybePersonId =
    case maybePersonId of
        Just personId ->
            people
                |> List.filter (\person -> person.id == personId)
                |> List.head

        Nothing ->
            Nothing


personName : Maybe Person -> String
personName maybePerson =
    case maybePerson of
        Just person ->
            person.name

        Nothing ->
            ""


getPersonName : People -> Maybe PersonId -> String
getPersonName people maybePersonId =
    maybePersonId
        |> getPerson people
        |> personName
