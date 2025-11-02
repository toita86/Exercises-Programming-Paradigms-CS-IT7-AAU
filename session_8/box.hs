data Box a = Blue a | Red (Box a, Box a) deriving Show

fromTheSheet = Red (
  Red (Blue True, Blue False), Red (
    Red (Blue True, Blue True), Red(
        Red (Blue True, Blue True), 
        Red (Blue True, Blue True)
      )
    )
  )

samey :: Eq a => Box a -> Bool
samey (Red (Blue a, Blue b)) = a == b
samey (Red (a, b)) = samey a == samey b
