module Main exposing (..)

import Views exposing (formView)
import Html exposing (Html)
import Messages exposing (Msg(..))


main : Html Msg
main =
    formView
