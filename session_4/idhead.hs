idhead :: Eq a => [(a,a)] -> Bool

idhead ((x,y):_) = x == y                  
idhead [] = False

