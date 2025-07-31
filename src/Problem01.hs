module Problem01 (myLast, myLastProp) where

myLast :: [a] -> a
myLast [] = error "empty list"
myLast [x] = x
myLast (_ : xs) = myLast xs

myLastProp :: (Eq a) => [a] -> Bool
myLastProp list = null list || myLast list == last list
