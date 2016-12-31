module Messages exposing (..)

import Models exposing (Gender)


type Msg
    = NoOp
    | ChangePersonName String
    | ChangePersonGender Gender
    | Save
