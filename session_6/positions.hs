{- 
Every letter in the lowercase English alphabet has a position.  
`"a"` has position 1, `"c"` has position 3 and `"h"` has position 8.

In Haskell, every string is a list of characters. So `[Char]` is the same type as `[Char]`.  
We can define a function `positions` that, given a string of lowercase letters `str`, gives us the list of positions of the characters in `str`.

**Example:**
```haskell
> positions "abba"
> [1,2,2,1]
````

Use the higher-order functions in Chapter 7 to define `positions`.

It is useful to remember that the ordinal value of a character can be computed using the function `fromEnum` found in the Prelude.  
We have that `fromEnum 'a'` is 97 and that `fromEnum 'b'` is 98. 
-}

positions :: [Char] -> [Int]
positions = map (\x -> fromEnum x - 96)


positions' :: [Char] -> [Int]
positions' = map ((\n -> n - 96) . fromEnum)

positions'' :: [Char] -> [Int]
-- positions'' = foldr (\x xs -> (fromEnum x - 96) : xs) [] 
positions'' = foldr ((:) . (\x -> (fromEnum x - 96))) [] 
