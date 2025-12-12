nsIonly n = map (* n) [0..]

nsRonly = nonly [0..]
nonly (x:xs) n = x*n : nonly xs n 
