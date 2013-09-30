import System.Random
import Data.List

quicksort :: (Ord a) => [a] -> [a]
quicksort (x:xs) = quicksort(lesser) ++ [x] ++ quicksort(greater)
      where greater = [num | num <- xs, num <  x]
            lesser  = [num | num <- xs, num >= x]
quicksort [] = []

randomlist :: Int -> StdGen -> [Int]
randomlist n = take n . unfoldr (Just . random)

main = do
    seed <- newStdGen
    let rs = randomlist 10000000 seed
    print "Sorting."
    let ss = quicksort rs
    print (take 2 ss)
    print "Done."
