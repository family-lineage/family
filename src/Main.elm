module Main exposing (..)

import Html exposing (Html, beginnerProgram)
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Updates exposing (update)
import Views exposing (view)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
