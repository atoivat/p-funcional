fizzbuzz :: Integer -> [String]
fizzbuzz 1 = ["No"]
fizzbuzz n
  | mod n 2 == 0 && mod n 3 == 0 = fizzbuzz (n-1) ++ ["FizzBuzz"]
  | mod n 2 == 0 = fizzbuzz (n-1) ++ ["Fizz"]
  | mod n 3 == 0 = fizzbuzz (n-1) ++ ["Buzz"]
  | otherwise = fizzbuzz (n-1) ++ ["No"]