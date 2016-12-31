module Models exposing (..)


type alias PersonId =
    Int


type alias Person =
    { id : PersonId
    , name : String
    , gender : Gender
    , fatherId : Maybe PersonId
    , motherId : Maybe PersonId
    , spouseId : Maybe PersonId
    }


type Gender
    = Male
    | Female


type alias Model =
    { people : List Person
    , personName : String
    , personGender : Gender
    }


initialModel : Model
initialModel =
    { people = []
    , personName = ""
    , personGender = Male
    }


newPerson : Model -> Person
newPerson model =
    { id = List.length model.people
    , name = model.personName
    , gender = model.personGender
    , fatherId = Nothing
    , motherId = Nothing
    , spouseId = Nothing
    }
