module Players.Update exposing (..)

import Navigation
import Players.Messages exposing (Msg(..))
import Players.Models exposing (PlayerId,Player)
import Players.Commands exposing (save)


update : Msg -> List Player -> ( List Player, Cmd Msg )
update message players =
    case message of
        OnFetchAll (Ok newPlayers) ->
            ( newPlayers, Cmd.none )
        
        OnFetchAll (Err error) ->
            ( players, Cmd.none )

        ShowPlayers ->
            ( players, Navigation.newUrl "#players" )
        
        ShowPlayer id ->
            ( players, Navigation.newUrl ("#players/" ++ id) )

        ChangeLevel playerId howMuch ->
            ( players, changeLevelCommands playerId howMuch players |> Cmd.batch )

        OnSave (Ok updatedPlayer) ->
            ( updatePlayer updatedPlayer players, Cmd.none )

        OnSave (Err error) ->
            ( players, Cmd.none )



updatePlayer : Player -> List Player -> List Player
updatePlayer updatedPlayer players =
    let
        select existingPlayer =
            if existingPlayer.id == updatedPlayer.id then
                updatedPlayer
            else
                existingPlayer
    in
        List.map select players



changeLevelCommands : PlayerId -> Int -> List Player -> List (Cmd Msg)
changeLevelCommands playerId howMuch players =
    let
        cmdForPlayer existingPlayer =
            if existingPlayer.id == playerId then
                save { existingPlayer | level = existingPlayer.level + howMuch }
            else
                Cmd.none
    in
        List.map cmdForPlayer players