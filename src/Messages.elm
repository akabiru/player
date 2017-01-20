module Messages exposing (..)

import Navigation exposing (Location)
import Players.Messages

type Msg
    = PlayerMsg Players.Messages.Msg
    | OnLocationChange Location
