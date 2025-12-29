{- 
A Unix directory d contains other directories as well as files. Every directory has a name and a finite list of arbitrarily many directories, which are the subdirectories of d (d may have no subdirectories at all). A directory can contain zero or more files. Every file has a name, which is a string, and a size, which is a whole number.

a) Define an algebraic datatype Directory that describes this.

b) In your datatype definition, give an example of a value of type Directory

c) Define a totalsize function that computes the sum of the sizes of files found in a directory and in its subdirectories.
-}
newtype File = File (String, Int) deriving Show
data Directory = Dir String [File] [Directory] deriving Show

d = Dir "etc" fs sd 
  where 
    fs = [File ("f.txt", 5), File ("m.md", 7)]
    sd = [s1, s2]
    s1 = Dir "sub1" [File ("a.txt", 3)] [s11]
    s2 = Dir "sub2" [] []
    s11 = Dir "subsub1" [File ("b.txt", 6)] []

computesizeFiles [] = 0
computesizeFiles ((File(_, n)):xs) = n + computesizeFiles xs

totalsize (Dir _ fs ds) = (computesizeFiles fs) + computesize ds
  where
    computesize [] = 0
    computesize ((Dir _ files dirs):xs) = (computesizeFiles files) + computesize dirs + computesize xs 
