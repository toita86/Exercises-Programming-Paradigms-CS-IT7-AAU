{- 
The function `sumsq` takes an integer `n` as its argument and returns the sum of the squares of the first `n` integers.  
So `sumsq n` returns the sum:
1² + 2² + ... + n²

**Examples:**
```haskell
sumsq 4
> 30
sumsq 9 
> 285
```

Use `foldr` to define `sumsq` — and do **not** use `map`.
-}

-- sumsq 0 = 0
-- sumsq n = n^2 + sumsq (n-1)

sumsq n = foldr (\x xs-> x^2 + xs) 0 [1..n]

sumsq' n = foldr ((+).(^2)) 0 [1..n]

sumsq'' n = foldl (\xs x -> x^2 + xs) 0 [1..n]

sumsq''' = foldr ((+).(^2)) 0 . enumFromTo 1

