main = putStrLn "Aello"

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = x + sum xs

sumCps :: [Int] -> (Int -> Int) -> Int
sumCps [] k = k 0
sumCps (x:xs) k = sumCps xs (\y -> x + k y)
 
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

