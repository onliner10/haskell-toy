{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE InstanceSigs #-}
module Lenses where

import Control.Lens
import Control.Applicative 
import Data.Char
import qualified Data.Map as M
import qualified Data.Set as S
import qualified Data.Text as T

data Ship =
  Ship { _name :: String
       , _numCrew :: Int
       }
  deriving (Show)

makeLenses ''Ship

someShip :: Ship
someShip = Ship "test" 12

-- Breaking the laws
-- * You get back what you set (set-get)
-- Setting back what you got doesn’t do anything (get-set)
-- Setting twice is the same as setting once (set-set)
--
getSetBraking :: Lens' Ship Int
getSetBraking = lens _numCrew (\s a -> s {_numCrew = a * 2})

setGetBraking :: Lens' Ship Int
setGetBraking = lens (\s -> (_numCrew s) * 2) (\s a -> s {_numCrew = a})

main :: IO ()
main = putStrLn $ show someShip
