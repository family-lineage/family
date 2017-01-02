module Messages exposing (..)

import Material
import Models exposing (Gender, PersonId, Person)


type Msg
    = NoOp
    | UpdatePerson Person
    | ChangePersonName String
    | ChangePersonGender Gender
    | ToggleIsPersonSelf
    | Save
    | Mdl (Material.Msg Msg)
