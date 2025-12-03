-- Something is wrong in the following tiny piece of code. But what is wrong? Explain. Then repair the code such that it works.

-- N = a `div` length xs
--   where
--     a = 10
--     xs = [ 1 , 2 , 3 , 4 , 5 ]

-- The snipper provided has one error in the name of the function:
--    The name of the function can not start with a capital letter. Names that start with capital letters are reserved for types


n = a `div` length xs
  where
    a = 10
    xs = [ 1 , 2 , 3 , 4 , 5 ]
