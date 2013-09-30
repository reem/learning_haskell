numDigits b n = 1 + fst (ilog b n) where
    ilog b n
            | n < b     = (0, n)
                    | otherwise = let (e, r) = ilog (b*b) n
                                          in  if r < b then (2*e, r) else (2*e+1, r `div` b)

digsum base = f 0
    where f a 0 = a
          f a n = f (a+r) q
              where (q,r) = n `divMod` base
