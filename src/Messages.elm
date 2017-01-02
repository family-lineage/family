module Messages exposing (..)

import Material
import Models exposing (Gender)


type Msg
    = NoOp
    | ChangePersonName String
    | ChangePersonGender Gender
    | ToggleIsPersonSelf
    | Save
    | Mdl (Material.Msg Msg)
