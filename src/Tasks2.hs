module Tasks2 where

-- Здесь уже можно пользоваться стандартными функциями из Prelude,
-- но нельзя подключать другие модули (Data.Numbers.Primes и т.п.).
--
-- Все функции необходимо реализовать в бесточечном стиле, то есть без использования аргументов в определении.


-- 11. sumOfLists принимает на вход непустой список списков чисел и возвращает сумму этих списков,
-- обрезанную по длине самого короткого списка,
-- то есть если на входе был список [[x1, x2, x3, x4], [y1, y2, y3], [z1, z2, z3, z4, z5]],
-- то итоговым результатом должен быть сисок [x1 + y1 + z1, x2 + y2 + z2, x2 + y3 + z3].
sum_of_lists :: Num a => [[a]] -> [a]
sum_of_lists = foldr (zipWith (+)) (repeat 0)

-- 12. n'thPrime принимает на вход число n >= 0 и возвращает n-е простое число.

n'th_prime :: Int -> Int
n'th_prime = (primes !!)
             where primes = [x | x <- [2..], [y | y <- takeWhile ((x >=) . (^ 2)) [2..], (mod x y == 0)] == []]

-- 13. tails' возвращает все хвосты входного списка,
-- то есть если на входе был список [1, 2, 3],
-- то итоговым результатом должен быть список [[1, 2, 3], [2, 3], [3], []]
-- Необходимо реализовать функцию при помощи foldr.
tails' :: [a] -> [[a]]
tails' = foldr push_front [[]]
         where
             push_front x y = (x:head y):y

-- 14. inits' возвращает все префиксы входного списка,
-- то есть если на входе был список [1, 2, 3],
-- то итоговым результатом должен быть список [[], [1], [1, 2], [1, 2, 3]]
-- Необходимо реализовать функцию при помощи foldr.
inits' :: [a] -> [[a]]
inits' = foldr push_front [[]]
         where 
             push_front x ys = []:map (x:) ys

-- 15. reverse' переворачивает список, который был дан на входе.
-- Необходимо реализовать функцию при помощи foldr.
reverse' :: [a] -> [a]
reverse' = (foldr (flip (++)) []) . (fmap (:[]))
-- reverse' = foldr (flip (++) . return) ([])

-- 16. reverse'' переворачивает список, который был дан на входе.
-- Необходимо реализовать функцию при помощи foldl.
reverse'' :: [a] -> [a]
reverse'' = foldl (flip (:)) []
