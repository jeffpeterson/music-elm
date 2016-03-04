module Music where

import Html exposing (Html, text, div)
import Html.Attributes exposing (style)
import Signal exposing (Signal)
import StartApp.Simple exposing (start)
import Dict exposing (Dict, union)
import Wheel exposing (delta)

type alias ID = String
type alias Table v = Dict ID v

type alias Track =
  { id : ID
  }

type alias Model =
  { tracks : Table Track
  }

type Action = TracksReceived (Table Track)
            | Init

model : Model
model =
  { tracks = Dict.empty
  }

update : Action Model
update action model =
  case action of
    TracksReceived tracks ->
      { model | tracks = union model.tracks tracks}
    Init -> 
      model

view : Signal.Address Action -> Model -> Html
view address model =
  div [ style [ ("width", "100%")
    
              ]
      ]
      []

main : Signal Html
main =
 start { model = model
       , view = view
       , update = update
       }
