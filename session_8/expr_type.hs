-- fun a b c = if a + b > sum [1 | lc <- c, i <- lc, i] then True else False
fun' x y [[True]] = x + y < y + x


g (f,x) y = f x + y

{- how we can be sure that two function arguments are of the same type 
fun h x y = 345677890
            where z = [x,y] -- the list ensures the same type for x and y

-}

