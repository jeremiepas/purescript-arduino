module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log, logShow)

foreign import echo :: String -> String

loop :: Int -> Effect Unit
loop 0 = logShow 0

loop x = do
  logShow x
  loop $ x - 1

main :: Effect Unit
main = do
  log (echo "a")
  loop 10
  log "🍝"