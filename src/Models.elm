module Models exposing (..)

import Material


type alias PersonId =
    Int


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
    { people : List Person
    , personId : Maybe Int
    , personName : String
    , personNameError : Maybe String
    , personGender : Gender
    , isPersonSelf : Bool
    , isFormValid : Bool
    , mdl : Material.Model
    }


initialModel : Model
initialModel =
    { people = []
    , personId = Nothing
    , personName = ""
    , personNameError = Nothing
    , personGender = Male
    , isPersonSelf = False
    , isFormValid = False
    , mdl = Material.model
    }


newPerson : Model -> Person
newPerson model =
    { id = (List.length model.people) + 1
    , name = model.personName
    , gender = model.personGender
    , fatherId = Nothing
    , motherId = Nothing
    , spouseId = Nothing
    , isPersonSelf = model.isPersonSelf
    }
