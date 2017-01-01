module Messages exposing (..)

import Models exposing (Gender)
import Material

type Msg
    = NoOp
    | ChangePersonName String
    | ChangePersonGender Gender
    | ToggleIsYourself
    | Save
    | Mdl (Material.Msg Msg)
