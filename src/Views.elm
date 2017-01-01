module Views exposing (..)

import Html exposing (Html, div, text, label, input, span, button, h1, p)
import Html.Attributes exposing (type_, name, placeholder, value, checked, style)
import Html.Events exposing (onClick, onSubmit, onInput)
import Material.Layout as Layout

import Messages exposing (Msg(..))
import Models exposing (Model, Gender)


formView : Model -> Html Msg
formView model =
    div []
        [ personForm model
        , p [] [ text (toString model) ]
        ]


personForm : Model -> Html Msg
personForm model =
    Html.form [ onSubmit Save ]
        [ div []
            [ div []
                [ label [] [ text "Name" ]
                , input
                    [ type_ "text"
                    , placeholder "Input name here"
                    , value model.personName
                    , onInput ChangePersonName
                    ]
                    []
                ]
            , div []
                [ label [] [ text "Gender" ]
                , div []
                    [ radio "Male" model.personGender Models.Male
                    , radio "Female" model.personGender Models.Female
                    ]
                ]
            , div []
                [ checkbox ToggleIsYourself "Is this you?" ]
            , div []
                [ button [] [ text "Save" ]
                ]
            ]
        ]

checkbox : Msg -> String -> Html Msg
checkbox msg name =
  label []
    [ input [ type_ "checkbox", onClick msg ] []
    , text name
    ]


radio : String -> Gender -> Gender -> Html Msg
radio fieldLabel personGender gender =
    label []
        [ input
            [ type_ "radio"
            , name "gender"
            , onClick (ChangePersonGender gender)
            , checked (personGender == gender)
            ]
            []
        , span [] [ text fieldLabel ]
        ]


view : Model -> Html Msg
view model =
    Layout.render Mdl
        model.mdl
        [ Layout.fixedHeader
        ]
        { header = [ h1 [ style [ ( "padding", "2rem" ) ] ] [ text "Family Tree" ] ]
        , drawer = []
        , tabs = ( [], [] )
        , main = [ formView model ]
        }
