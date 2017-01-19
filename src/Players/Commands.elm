module Players.Commands exposing (..)

{- Tasks and Commands to fetch the players from the server -}

import Http
import Json.Decode as Decode exposing (field)
import Players.Models exposing (PlayerId, Player)
import Players.Messages exposing (..)


{- Create a command to run:
  - `Http.get` creates a `Request`
  - We send this request to `Http.send` which wraps into a command
-}
fetchAll : Cmd Msg
fetchAll =
    Http.get fetchAllUrl collectionDecoder
        |> Http.send OnFetchAll


fetchAllUrl : String
fetchAllUrl =
    "http://localhost:4000/players"


{- Delegate decoding of each member of a list to `memberDecoder`
-}
collectionDecoder : Decode.Decoder (List Player)
collectionDecoder =
    Decode.list memberDecoder


{- Create a JSON decoder that returns a `Player` record
-}
memberDecoder : Decode.Decoder Player
memberDecoder =
  Decode.map3 Player
    (field "id" Decode.string)
    (field "name" Decode.string)
    (field "level" Decode.int)