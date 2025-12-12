# Programming Paradigms — Haskell Exercises

This repository contains my exercises for the **Programming Paradigms** course at AAU for the Master CS-IT7, focusing on the **functional programming paradigm** using **Haskell**. 

> [!IMPORTANT]
> All the exercises and are created by the professor [Hans Hüttel](https://vbn.aau.dk/en/persons/hans/) except the ones that ones with the filename that follow this format `FP??_exs.hs`. This exercises are from the YouTube series made by [Graham Hutton](https://www.youtube.com/watch?v=qThX0aoW9YI&list=PLF1Z-APd9zK7usPMx3LGMZEHrECUGodd3).

## Overview

The goal of this repository is to document and organize my progress through the course — exploring key Haskell concepts such as:

- Pure functions and immutability  
- Recursion and higher-order functions  
- Algebraic data types and pattern matching  
- Type classes and polymorphism  
- Functional composition and monads 
- Lazy evaluation and infinite data structures  

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

* [Learn You a Haskell for Great Good!](https://learnyouahaskell.github.io)
* [Haskell Wiki](https://wiki.haskell.org/Haskell)
* [Hoogle](https://hoogle.haskell.org/) search engine for Haskell functions

## How to use
The environment for the exercises is generated with [Forgeon](https://github.com/toita86/Forgeon.git) and its configured to work with the same nvim configuration as in the host machine.

To start the container use:
```bash
docker compose up -d
```
and to access the shell inside the container use:
```bash
docker exec -it <name_of_the_container> bash --login
```
to turn everything off use:
```bash
docker compose down
```

## Use of AI

AI(LLMs like ChatGPT and Gemini) was used for the formatting and improving the explanations for the variuos subject. The use was as a practical tool for streamlining the structure of the notes.
