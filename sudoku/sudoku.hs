-- Solve every Sudoku Puzzle

-- Haskell translation of http://norvig.com/sudoku.html

-- Throughout this program:
--     r is a row,    e.g. 'A'
--     c is a column, e.g. '3'
--     s is a square, e.g. 'A3'
--     d is a digit,  e.g. '9'
--     u is a unit,   e.g. ['A1','B1','C1','D1','E1','F1','G1','H1','I1']
--     grid is a grid, e.g. 81 non-blank chars, 
--                     e.g. starting with '18...7...
--     values is a Map of possible values, e.g. ("A1","12349","A2","8",...)

import qualified Data.Map as Map
import qualified Data.Set as Set

cross :: (Num a) => [a] -> [a] -> [a]
cross a b = [i + j | i <- a, j <- b]

digits   = "123456789"
rows     = "ABCDEFGHI"
cols     = digits
squares  = cross rows cols
unitlist = (   [cross rows c | c  <- cols]
			++ [cross r cols | r  <- rows]
			++ [cross rs cs  | rs <- ["ABC", "DEF", "GHI"]
							 , cs <- ["123", "456", "789"]]
		   )
units = Map.fromList $ [(s, u) | u <- unitlist, s `elem` u]
peers = Map.fromList $ [(s, )]