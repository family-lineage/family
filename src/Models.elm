module Models exposing (..)


type alias Person =
    { id : Int
    , name : String
    , gender : Gender
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
