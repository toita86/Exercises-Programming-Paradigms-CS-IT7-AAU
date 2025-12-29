{- 
We can represent arithmetic expressions S over atoms (that are strings), addition, multiplication and bracketing by the formation rules

S ::= a | S + S | S ∗ S | (S)

a) Define a Term that describes arithmetic expressions. Give a term of type Terms that corresponds to the arithmetic expression

two ∗ (six + four)

b) An expression S is plain if all atoms in it are the same atom. 
Define a function plain that can tell us if an arithmetic expression is plain. What should the type of plain be? Is plain a polymorphic function? Justify your answer.

c) Define a function pretty that can convert any value of the type Term to an arithmetic expression in the form of a string. What should the type of pretty be? Is pretty a polymorphic function?
Justify your answer.
-
