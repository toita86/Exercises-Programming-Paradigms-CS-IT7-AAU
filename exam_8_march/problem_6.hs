{- 
The harmonic sequence is the infinite sequence

1, 1/2, 1/3, 1/4 ...

1. Define the harmonic sequence using recursion.

2. Define the harmonic sequence using map

3. A partial sum to level n of the harmonic sequence is the sum

sum^n_{i=1} 1/i

Give two different ways of defining the function psum, one using recursion and one not using recursion, that will both, given an n, compute the partial sum to level n of the harmonic sequence. As an example, both implementations of psum 5 should return 2.2833333333333
-}

harmonic = harmo 1
  where 
    harmo i = (1/i):harmo (i+1)

harmonic' = map (\i -> 1/i) [1..]

psum 0 = 0
psum n = 1/n + psum (n - 1)

psum' n = sum (take n harmonic)
