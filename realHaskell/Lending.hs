-- file: ch03/Lending.hs
lend amount balance = let reserve    = 100
                          newBalance = balance - amount
                      in if balance < reserve
                          then Nothing
                          else Just newBalance

lend2 amount balance = if amount < reserve
                       then Just newBalance
                       else Nothing
    where reserve    = 100
          newBalance = balance - amount
