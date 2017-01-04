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
    , mdl : Material.Model
    }


initialModel : Model
initialModel =
    { people = []
    , personId = Nothing
    , personName = ""
    , personGender = Male
    , personFather = Nothing
    , personMother = Nothing
    , personSpouse = Nothing
    , isPersonSelf = False
    , isFormValid = False
    , mdl = Material.model
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
