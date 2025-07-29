module Problem01Spec (spec) where

import Control.Exception (evaluate)
import Problem01 (myLast, myLastProp)
import Test.Hspec
import Test.QuickCheck

spec :: Spec
spec = do
  describe "myLast" $ do
    it "returns the last element of [1,2,3,4]" $ do
      myLast [1, 2, 3, 4] `shouldBe` 4

    it "returns the last element of ['x','y','z']" $ do
      myLast ['x', 'y', 'z'] `shouldBe` 'z'

    it "returns the single element of a singleton list" $ do
      myLast [42] `shouldBe` 42

    it "throws an error for empty list" $ do
      evaluate (myLast ([] :: [Int])) `shouldThrow` errorCall "empty list"

    it "works with different data types" $ do
      myLast ["hello", "world"] `shouldBe` "world"
      myLast [True, False, True] `shouldBe` True

    it "satisfies the QuickCheck property for Int lists" $
      property (myLastProp :: [Int] -> Bool)

    it "satisfies the QuickCheck property for Char lists" $
      property (myLastProp :: [Char] -> Bool)

    it "satisfies the QuickCheck property for String lists" $
      property (myLastProp :: [String] -> Bool)
