-- Version 10
import Data.List (foldl')

sum' :: (Num a) => [a] -> a
sum' = foldl' (+) 0

evenSum :: Integral a => [a] -> a
evenSum = (sum' . (filter even))

main = print (sum' [1..100000000])
