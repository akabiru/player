module Players.Edit exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, value, href)
import Html.Events exposing (onClick)
import Players.Messages exposing (..)
import Players.Models exposing (..)


view : Player -> Html Msg
view player =
    div []
        [ nav
        , playerForm player
        ]


nav : Html Msg
nav =
    div [ class "clearfix mb2 white bg-black p1" ]
        [ listBtn ]


playerForm : Player -> Html Msg
playerForm player =
    div [ class "m3" ]
        [ h1 [] [ text player.name ]
        , formLevel player
        ]


formLevel : Player -> Html Msg
formLevel player =
    div [ class "clearfix py1" ]
        [ div [ class "col col-5" ] [ text "Level" ]
        , div [ class "col col-7" ]
            [ span [ class "h2 bold" ] [ text (toString player.level) ]
            , btnLevelDecrease player
            , btnLevelIncrease player
            ]
        ]


btnLevelDecrease : Player -> Html Msg
btnLevelDecrease player =
    btnLevel "minus" (ChangeLevel player.id -1) player


btnLevelIncrease : Player -> Html Msg
btnLevelIncrease player =
    btnLevel "plus" (ChangeLevel player.id 1) player


btnLevel : String -> Msg -> Player -> Html Msg
btnLevel cirlceClass msg player =
    let
        pickedCircleClass =
            "fa fa-" ++ cirlceClass ++ "-circle"
    in
        a [ class "btn ml1 h1", onClick msg ]
            [ i [ class pickedCircleClass ] [] ]


listBtn : Html Msg
listBtn =
    button
        [ class "btn regular"
        , onClick ShowPlayers
        ]
        [ i [ class "fa fa-chevron-left mr1" ] []
        , text "List"
        ]