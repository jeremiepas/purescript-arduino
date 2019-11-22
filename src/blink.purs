module Main where

import Prelude
import Effect (Effect)

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n - 2) + fib (n - 1)

-- Blink the built-in LED n times
foreign import blink :: Int -> Effect Unit

main :: Effect Unit
main = do
    blink (fib 6)