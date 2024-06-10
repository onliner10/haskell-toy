main = putStrLn "Aello"

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum xs

sumCps :: [Int] -> (Int -> Int) -> Int
sumCps [] k = k 0
sumCps (x:xs) k = sumCps xs (\y -> k $ x + y)
 
-- sumCps [1,2,3] (\x -> x) -> sumCps [2,3] (\y -> 1 + (\y -> y)) -> sumCps [3] (\y -> 2 + (1 ))
--
-- sumCps [1,2,3] (\x -> x) => sumCps [2,3] (\y -> 1 + y) -> sumCps [3] (\y -> 2 + (1 + y)) => sumCps [] (\y -> 3 + (\y -> 2 + (1 + y))) => (\y -> 3 + 2 + (1 + y)) 0 
--

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)

factCps :: Int -> (Int -> Int) -> Int
factCps 0 k = k 1
factCps n k = factCps (n - 1) (\y -> n * k y)

fib :: Int -> Int
fib n 
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fib (n-2) + fib (n - 1)

fibCps :: Int -> (Int -> Int) -> Int
fibCps n k 
  | n <= 0    = k 0
  | n == 1    = k 1
  | otherwise = fibCps (n - 2) (\x -> fibCps (n - 1) (\y -> k (x + y)))

cpsLen :: [a] -> (Int -> Int) -> Int
cpsLen [] k = k 0
cpsLen (x:xs) k = cpsLen xs (\y -> k (1 + y))

