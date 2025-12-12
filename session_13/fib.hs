-- old implementation

fib 1 = 1 
fib 2 = 2 
fib n = fib (n-1) + fib (n-2)

-- taking lazy evalutation in to account
fibfrom n1 n2 =  n1 : fibfrom n2 (n1 + n2)

