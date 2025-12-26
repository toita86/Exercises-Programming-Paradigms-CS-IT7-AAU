data SWComponent = Primitive String Int | Subcomponent String Int [SWComponent]

c1 = Subcomponent "Mango" 20 [s1, s2]
  where 
    s1 = Subcomponent "Bingo" 12 [b1,b2,b3]
    s2 = Primitive "Dingo" 8
    b1 = Primitive "Plip" 5
    b2 = Primitive "Plop" 5
    b3 = Primitive "Mango" 2

c2 = Subcomponent "Tralalala" 40 [s1,s2,s3]
  where 
    s1 = Primitive "Boom" 10
    s2 = Subcomponent "Boom" 20 [b1,b2]
    s3 = Subcomponent "Boom" 10 [b3]
    b1 = Primitive "Zoom" 4
    b2 = Primitive "Zoom" 12
    b3 = Primitive "Zoom" 5


subVal ((Primitive _ rv):[]) = [rv]
subVal ((Subcomponent _ rv _):[]) = [rv] 
subVal ((Primitive _ rv):xs) = rv:subVal xs 
subVal ((Subcomponent _ rv _):xs) = rv:subVal xs 

valid (Primitive _ rv) = rv >= 0
valid (Subcomponent _ rv (x:xs)) = (rv == (sum (subVal (x:xs)))) && validAll x xs
  where 
    validAll x [] = valid x
    validAll x (y:xs) = valid x && validAll y xs
