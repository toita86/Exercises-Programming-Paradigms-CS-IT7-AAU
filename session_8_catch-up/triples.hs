-- triples :: [(a,b,c)] -> ([a],[b],[c])

triples [] = ([],[],[])
triples ((x,y,z):ts) = (x:a, y:b, z:c)
                  where (a,b,c) = triples ts

