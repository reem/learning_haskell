multThree :: (Num a) => a -> a -> a -> a
multThree x y z = x * y * z

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

compareWithHundred :: (Num a, Ord a) => a -> Ordering
compareWithHundred = compare 100

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = \x y -> f y x

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
    | p x       = x : filter p xs
    | otherwise = filter p xs

quicksort' :: (Ord a) => [a] -> [a]
quicksort' [] = []
quicksort' (x:xs) =
    let smallerSorted = quicksort' (filter (<=x) xs)
        biggerSorted  = quicksort' (filter (>x)  xs)
    in smallerSorted ++ [x] ++ biggerSorted

largestDivisble :: (Integral a) => a
largestDivisble = head (filter p [100000, 99999..])
    where p x = x `mod` 3829 == 0

collatzchain :: (Integral a) => a -> [a]
collatzchain 1 = [1]
collatzchain n
    | even n = n:collatzchain (n `div` 2)
    | odd n  = n:collatzchain (n*3 + 1)

numLongChains :: Integral a => a -> Int -> Int
numLongChains n m = length (filter isLong (map collatzchain [1..n]))
    where isLong xs = length xs > m

numLongChains' :: Int
numLongChains' n m = length (filter (\xs -> length xs > m) (map chain [1..n]))

sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

sum'' :: (Num a) => [a] -> a
sum'' = foldl (+) 0

elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldl (\acc x -> if x == y then True else acc) False ys

map'' :: (a -> b) -> [a] -> [b]
map'' f xs = foldr (\x acc -> f x : acc) [] xs

maximum' :: (Ord a) => [a] -> a
maximum' = foldr1 (\x acc -> if x > acc then x else acc)

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

product' :: (Num a) => [a] -> a
product' = foldr1 (*)

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

head' :: [a] -> a
head' = foldr1 (\x _ -> x)

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

($') :: (a -> b) -> a -> b
f $ x = f x

(.') :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)

sum''' :: (Num a) => [a] -> a
sum''' = foldl1 (+)
