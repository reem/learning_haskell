listLength :: [a] -> Int
listLength (x:xs) = 1 + length xs
listLength [] = 0

listSum (x:xs) = x + listSum xs
listSum [] = 0


-- We need this above to prevent 0 / 0
listMeam [] = 0
listMean xList = 
         sumList / lengthList
    where
         sumList    = fromIntegral (listSum xList)
         lengthList = fromIntegral (listLength xList)

listPalindrome :: [a] -> [a]
listPalindrome (x:xs) = [x] ++ (listPalindrome xs) ++ [x]
listPalindrome [] = []
