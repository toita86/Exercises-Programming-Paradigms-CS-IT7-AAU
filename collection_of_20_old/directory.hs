{- 
A Unix directory d contains other directories as well as files. Every directory has a name and a finite list of arbitrarily many directories, which are the subdirectories of d (d may have no subdirectories at all). A directory can contain zero or more files. Every file has a name, which is a string, and a size, which is a whole number.

a) Define an algebraic datatype Directory that describes this.

b) In your datatype definition, give an example of a value of type Directory

c) Define a totalsize function that computes the sum of the sizes of files found in a directory
and in its subdirectories.
-}
type File = (String, Int) 
data Directory = Dir String [File] [Directory] deriving Show

d = Dir "d" 
         [("file1", 1),("file2", 1)] 
         [
           (Dir "d_d" 
            [("file3", 1),("file4", 1)] 
            []),
           (Dir "d_f"
            [("file5", 1),("file6", 1)] 
            [])
         ] 

totalsize (Dir name files subDir) = (currDirSize files) + (sum (map totalsize subDir))
  where 
    currDirSize [] = 0
    currDirSize ((_, s):xs) = s + currDirSize xs

