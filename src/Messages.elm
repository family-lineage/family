module Messages exposing (..)

import Material
import Models exposing (Gender)


type Msg
    = NoOp
    | ChangePersonName String
    | ChangePersonGender Gender
    | ToggleIsYourself
    | Save
    | Mdl (Material.Msg Msg)
