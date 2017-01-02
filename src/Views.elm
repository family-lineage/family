module Views exposing (..)

import Html exposing (Html, div, text, label, input, span, button, h2, p, hr)
import Html.Attributes exposing (type_, name, placeholder, value, checked, style)
import Html.Events exposing (onClick, onSubmit, onInput)

import Material.Grid exposing (grid, cell, size, Device(..))
import Material.Layout as Layout
import Material.Textfield as Textfield
import Material.Toggles as Toggles
import Material.Options as Options
import Material.Scheme

import Messages exposing (Msg(..))
import Models exposing (Model, Gender, Person)


formView : Model -> Html Msg
formView model =
    grid []
        [ cell
            [ size Tablet 6
            , size Desktop 12
            , size Phone 2
            ]
            [ personForm model
            , hr [] []
            , peopleView model.people
            , hr [] []
            , p [] [ text (toString model) ]
            ]
        ]


personForm : Model -> Html Msg
personForm model =
    Html.form [ onSubmit Save ]
        [ div []
            [ name model
            , div []
                [ label [] [ text "Gender" ]
                , div []
                    [ radio "Male" model.personGender Models.Male
                    , radio "Female" model.personGender Models.Female
                    ]
                ]
            , div []
                [ checkbox ToggleIsPersonSelf model "Is this you?" ]
            , div []
                [ button [] [ text "Save" ]
                ]
            ]
        ]


name : Model -> Html Msg
name model =
    Textfield.render Mdl [2] model.mdl
        [ Textfield.label "Name"
        , Textfield.floatingLabel
        , Textfield.text_
        , Textfield.value model.personName
        , Options.onInput ChangePersonName
        ]
        []


checkbox : Msg -> Model -> String -> Html Msg
checkbox msg model name =
    Toggles.checkbox Mdl [0] model.mdl
        [ Options.onToggle msg
        , Toggles.ripple
        , Toggles.value model.isPersonSelf
        ]
        [ text name ]


radio : String -> Gender -> Gender -> Html Msg
radio fieldLabel personGender gender =
    label []
        [ input
            [ type_ "radio"
            , onClick (ChangePersonGender gender)
            , checked (personGender == gender)
            ]
            []
        , span [] [ text fieldLabel ]
        ]


personView : Person -> Html Msg
personView person =
    div [ onClick (UpdatePerson person) ]
        [ text (person.name ++ " (click to edit)")
        ]


peopleView : List Person -> Html Msg
peopleView people =
    div []
        (List.map personView people)


view : Model -> Html Msg
view model =
    Layout.render Mdl
        model.mdl
        [ Layout.fixedHeader
        ]
        { header = [ h2 [ style [ ( "padding", "2rem" ) ] ] [ text "Family Tree" ] ]
        , drawer = []
        , tabs = ( [], [] )
        , main = [ formView model ]
        }
        |> Material.Scheme.top
