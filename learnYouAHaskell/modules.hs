import qualified Data.List     as L
import qualified Data.Function as F
import qualified Data.Char     as C

numUniques :: (Eq a) => [a] -> Int
numUniques = length . L.nub

encode :: Int -> String -> String
encode shift msg = map C.chr shifted
    where ords = map C.ord msg
          shifted = map (+ shift) ords

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg
