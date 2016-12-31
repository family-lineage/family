module Models exposing (..)

type alias Person =
    { id : Int
    , name : String
    , gender : Gender
    }

type alias Gender = Male | Female
