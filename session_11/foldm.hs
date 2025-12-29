{- 
Define a foldM function whose type should be

foldM : : Monad m => ( t 1 −> t 2 −> m t 2 ) −> [ t 1 ] −> t 2 −> m t 2

The idea is that the function works like foldl but folds over a monad.
Here is an example that shows what will happen if we fold over the IO monad. If we let

dingo x = do
  putStrLn ( show x )
  return x
then we should see the following behaviour.

ghci> foldM ( \ x y −> ( dingo ( x+y ) ) ) [ 1 , 2 , 3 , 4 ] 0
1
3
6
10
-}

dingo x = do
  putStrLn ( show x )
  return x 


-- foldM :: Monad m => (t1 -> t2 -> m t2) -> [t1] -> t2 -> m t2
foldM _ [] acc = return acc
foldM f (x:xs) acc = do 
                      acc' <- f x acc
                      foldM f xs acc'
                     
