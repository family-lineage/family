module Messages exposing (..)

import Material
import Models exposing (Gender, PersonId, Person)


type Msg
    = NoOp
    | ChangePersonId (Maybe PersonId)
    | UpdatePerson Person
    | ChangePersonName String
    | ChangePersonGender Gender
    | ToggleIsPersonSelf
    | Save
    | Mdl (Material.Msg Msg)
