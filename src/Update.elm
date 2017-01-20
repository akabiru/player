module Update exposing (..)

import Routing exposing (parseLocation)
import Messages exposing (Msg(..))
import Models exposing (Model)
import Players.Update


{- Here we follow the Elm architecture:
   All PlayersMsg are routed to Players.Update.
   We extract the result for Players.Update using pattern matching
   Return the model with the updated player list and any command that needs to run.
-}


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        PlayerMsg subMsg ->
            let
                ( updatedPlayers, cmd ) =
                    Players.Update.update subMsg model.players
            in
                ( { model | players = updatedPlayers }, Cmd.map PlayerMsg cmd )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )
