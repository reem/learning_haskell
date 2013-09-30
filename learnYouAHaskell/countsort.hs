import Data.Array
import System.Random
import Data.List

countsort :: (Ix n) => [n] -> n -> n -> [n]
countsort l lo hi = concatMap (uncurry $ flip replicate) count
    where count = assocs . accumArray (+) 0 (lo, hi) . map (\i -> (i, 1)) $ l

randomlist :: Int -> StdGen -> [Int]
randomlist n = take n . unfoldr (Just . random)

main = do
    seed <- newStdGen
    let rs = randomlist 10000000 seed
    print "Sorting"
    let ss = countsort rs (minimum rs) (maximum rs)
    print (take 1 ss)
    print "Done."
