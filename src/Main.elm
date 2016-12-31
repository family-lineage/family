module Main exposing (..)

import Html exposing (Html, program)
import Messages exposing (Msg(..))
import Models exposing (Model, initialModel)
import Updates exposing (update)
import Views exposing (view)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
