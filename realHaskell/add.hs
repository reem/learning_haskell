add a b = a + b

sumList (x:xs) = x + sumlist xs
sumList [] = 0

myNot True = False
myNot False = True
