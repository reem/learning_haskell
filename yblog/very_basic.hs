-- We declare the type using ::
f :: Num a => a -> a -> a
f x y = x*x + y*y

main = print (f 2 4.2)
