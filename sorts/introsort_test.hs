import System.Random
import Data.Vector.Algorithms.Intro
import Data.List

randomlist :: Int -> StdGen -> [Int]
randomlist n = take n . unfoldr (Just . random)

main = do
    seed <- newStdGen
    let rs = randomlist 10000000 seed
    print "Sorting."
    let ss = Data.Vector.Algorithms.Intro.sort rs
    print (take 2 ss)
    print "Done."