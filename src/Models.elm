module Models exposing (..)


type alias PersonId =
    Int


type alias Person =
    { id : PersonId
    , name : String
    , gender : Gender
    , parentId : Maybe PersonId
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
