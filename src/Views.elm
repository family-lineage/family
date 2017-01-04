module Views exposing (..)

import Html exposing (Html, div, text, label, h2, p, hr, span)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick, onSubmit)
import Material.Grid exposing (grid, cell, size, Device(..))
import Material.Layout as Layout
import Material.Textfield as Textfield
import Material.Button as Button
import Material.Toggles as Toggles
import Material.Options as Options
import Material.Scheme
import Messages exposing (Msg(..))
import Models exposing (Model, Gender, Person)
import PersonViews exposing (peopleView)


row : List (Options.Style a)
row =
    [ size Desktop 12, size Tablet 6, size Phone 2 ]


formView : Model -> Html Msg
formView model =
    grid []
        [ cell row
            [ personForm model
            , hr [] []
            , peopleView model.people
            , hr [] []
            , p [] [ text (toString model) ]
            ]
        ]


personForm : Model -> Html Msg
personForm model =
    Html.form []
        [ grid []
            [ cell row
                [ label [] [ text "Name" ] ]
            , cell row
                [ namePerson model ]
            , cell row
                [ label [] [ text "Gender" ] ]
            , cell row
                [ radio "Gender" "Male" 2 model Models.Male
                , span [ style [ ( "margin-left", "2rem" ) ] ] []
                , radio "Gender" "Female" 3 model Models.Female
                ]
            , cell row
                [ checkbox ToggleIsPersonSelf model "Is this you?" ]
            , cell row
                [ Button.render
                    Mdl
                    [ 5 ]
                    model.mdl
                    ((buttonAttributes
                        (not model.isFormValid)
                     )
                        ++ [ Options.onClick Save ]
                    )
                    [ text "Save" ]
                ]
            ]
        ]


buttonAttributes : Bool -> List (Button.Property m)
buttonAttributes isDisabled =
    if isDisabled then
        defaultButtonAttributes
            ++ [ Button.disabled ]
    else
        defaultButtonAttributes


defaultButtonAttributes : List (Button.Property m)
defaultButtonAttributes =
    [ Button.raised
    , Button.colored
    , Button.raised
    ]


namePerson : Model -> Html Msg
namePerson model =
    Textfield.render
        Mdl
        [ 0 ]
        model.mdl
        [ Textfield.label "e.g. Telolet"
        , Textfield.text_
        , Textfield.value model.personName
        , Options.onInput ChangePersonName
        ]
        []


checkbox : Msg -> Model -> String -> Html Msg
checkbox msg model name =
    Toggles.checkbox Mdl
        [ 4 ]
        model.mdl
        [ Options.onToggle msg
        , Toggles.ripple
        , Toggles.value model.isPersonSelf
        ]
        [ text name ]


radio : String -> String -> Int -> Model -> Gender -> Html Msg
radio radioGroup fieldLabel counter model gender =
    Toggles.radio Mdl
        [ counter ]
        model.mdl
        [ Toggles.value (model.personGender == gender)
        , Toggles.group radioGroup
        , Toggles.ripple
        , Options.onToggle (ChangePersonGender gender)
        ]
        [ text fieldLabel ]






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
