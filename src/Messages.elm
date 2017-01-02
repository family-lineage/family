module Messages exposing (..)

import Material
import Models exposing (Gender, PersonId)


type Msg
    = NoOp
    | ChangePersonId (Maybe PersonId)
    | ChangePersonName String
    | ChangePersonGender Gender
    | ToggleIsPersonSelf
    | Save
    | Mdl (Material.Msg Msg)
