module Wheel (delta) where

import Native.Wheel


delta : Signal Int
delta = 
  Native.Wheel.delta
