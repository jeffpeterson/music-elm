import Wheel exposing (delta)
import Graphics.Element exposing (show)
import Signal exposing (Signal)

main =
  Signal.map show delta
