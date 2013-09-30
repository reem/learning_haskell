boomBang :: Integral a => [a] -> [[Char]]
boomBang xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x ]
