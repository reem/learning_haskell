fizzbuzzsum limit divisors = sum $ filter (divisible divisors) [1..limit]

divisible :: [Int] -> Int -> Bool
divisible divisors n = any (\d -> (mod n d) == 0) divisors
