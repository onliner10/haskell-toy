module MyLenses where

import Control.Applicative
import Data.Functor.Identity

type Lens' a b = forall f . Functor f => (b -> f b) -> a -> f a

-- 'lens' :: 'Functor' f => (a -> b) -> (a -> b -> a) -> (b -> f b) -> a -> f a
lens :: (a -> b) -> (a -> b -> a) -> Lens' a b
lens ab aba bfb a = aba a <$> bfb (ab a)

view :: Lens' a b -> a -> b
view ls a = getConst $ ls Const a

set  :: Lens' a b -> b -> a -> a
set ls b a = runIdentity $ ls Identity a

over :: Lens' a b -> (b -> b) -> a -> a
over ls f a = runIdentity (ls (Identity . f) a)
