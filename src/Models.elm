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
    , isYourself : Bool
    }


type Gender
    = Male
    | Female


type alias Model =
    { people : List Person
    , personName : String
    , personGender : Gender
    , isYourself : Bool
    , mdl : Material.Model
    }


initialModel : Model
initialModel =
    { people = []
    , personName = ""
    , personGender = Male
    , isYourself = False
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
    , isYourself = model.isYourself
    }
