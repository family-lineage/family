-- temp views, delete this after proper views are implemented


module PersonViews exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Models exposing (..)
import Messages exposing (Msg(..))


peopleView : People -> Html Msg
peopleView people =
    table []
        ([ peopleViewHeader ]
            ++ (List.map (personView people) people)
        )


peopleViewHeader : Html Msg
peopleViewHeader =
    tr []
        (List.map
            (\header -> th [] [ text header ])
            [ "Person", "Father", "Mother", "Spouse", "edit" ]
        )


personView : People -> Person -> Html Msg
personView people person =
    tr []
        [ td [ style tableStyles ] [ text person.name ]
        , relationCell people person.fatherId
        , relationCell people person.motherId
        , relationCell people person.spouseId
        , td
            [ style tableStyles
            , onClick (UpdatePerson person)
            ]
            [ text "edit" ]
        ]


relationCell : People -> Maybe PersonId -> Html Msg
relationCell people parentId =
    case parentId of
        Just personId ->
            td [ style tableStyles ]
                [ personId
                    |> Just
                    |> getPersonName people
                    |> text
                ]

        Nothing ->
            td [] []


tableStyles : List ( String, String )
tableStyles =
    [ ( "border", "1px solid #000" )
    ]
