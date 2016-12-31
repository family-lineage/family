module Views exposing (..)

import Html exposing (Html, div, text, label, input, span, button)
import Html.Attributes exposing (type_, name)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Models exposing (Model)


formView : Html Msg
formView =
    div []
        [ div []
            [ label [] [ text "Name" ]
            , input [] []
            ]
        , div []
            [ label [] [ text "Gender" ]
            , div []
                [ radio "Male" NoOp
                , radio "Female" NoOp
                ]
            ]
        , div []
            [ button [] [ text "Save" ]
            ]
        ]


radio : String -> Msg -> Html Msg
radio fieldLabel message =
    label []
        [ input
            [ type_ "radio"
            , name "gender"
            , onClick message
            ]
            []
        , span [] [ text fieldLabel ]
        ]


view : Model -> Html Msg
view model =
    formView
