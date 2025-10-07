# Programming Paradigms — Haskell Exercises

This repository contains my exercises and assignments for the **Programming Paradigms** course at AAU for the Master CS-IT7, focusing on the **functional programming paradigm** using **Haskell**.

## Overview

The goal of this repository is to document and organize my progress through the course — exploring key Haskell concepts such as:

- Pure functions and immutability  
- Recursion and higher-order functions  
- Algebraic data types and pattern matching  
- Type classes and polymorphism  
- Lazy evaluation and infinite data structures  
- Functional composition and monads 

## Requirements

To run the exercises, make sure you have:

- [GHC (The Glasgow Haskell Compiler)](https://www.haskell.org/ghc/)
- [GHCup](https://www.haskell.org/ghcup/) — recommended tool to install and manage Haskell

## Running the Code

To load and test a file in GHCi (the Haskell interactive environment):

```bash
ghci exercises/filename.hs
````

Then inside GHCi:

```haskell
:l filename.hs   -- load the file
main              -- or any function you want to test
```

Or, to compile a file:

```bash
ghc exercises/filename.hs -o output
./output
```

## Learning Focus

This course emphasizes:

* Understanding *why* functional programming works the way it does
* Writing clean, expressive, and type-safe code
* Comparing Haskell’s model to other paradigms (imperative, object-oriented, logical)

## Resources

* [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/)
* [Haskell Wiki](https://wiki.haskell.org/Haskell)
* [Hoogle](https://hoogle.haskell.org/) — search engine for Haskell functions

