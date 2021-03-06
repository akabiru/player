module Players.Messages exposing (..)

{- All messages related to Players will go here -}
import Http
import Players.Models exposing (PlayerId, Player)

{- OnFetchAll will be called when we get the response from the server.
    This message will either be Http.Error or List of Players
 - ChangeLevel will trigger when the user wants to chane the level
-}
type Msg
    = OnFetchAll (Result Http.Error (List Player))
    | ShowPlayers
    | ShowPlayer PlayerId
    | ChangeLevel PlayerId Int
    | OnSave (Result Http.Error Player)
