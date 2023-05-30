double :: Int -> Int 
double x = x + x 

product1 :: [Int] -> Int
product1 []      = 1
product1 (n:ns)  = n * product1 ns  

qsort :: [Int] -> [Int]
qsort []        = []
qsort (x:xs)    = qsort smaller ++ [x] ++ qsort larger
    where
        smaller = [a | a <- xs, a <= x]
        larger  = [b | b <- xs, b > x]
{-
qsort [2,2,3,1,1] = qsort [1,1] ++ [2] ++ qsort [3]
                 = qsort [] ++ [1] ++ qsort [] ++ [2] ++ qsort [3]
                 = [1,2,3]  
-} 

last1 :: [a] -> a 
last1 lista = head (drop ((length lista) - 1) lista)
--last1 x = (drop ((length x) - 1) x) !! 0

last2 :: [a] -> a
last2 x = head (reverse x)
--last2 x = head (reverse x)

init1 :: [a] -> [a]
init1 x = take ((length x) - 1) x

init2 :: [a] -> [a]
init2 x = reverse $ tail $ reverse x
-- init2 x = reverse (tail (reverse x))



--dodaj(pomnóż(2,2), 3)     

plus :: Int -> Int -> Int 
plus x y = x+y*100   

--glowa :: [a] -> a
--glowa (x:xs)   = x

glowa :: [a] -> Maybe a 
glowa []       = Nothing
glowa (x:xs)   = Just x

--x:[] = [x]

nty :: [a] -> Int -> a
nty (x:xs) 0 = x
nty (x:xs) n = nty xs (n-1)

{-
nty1 :: [a] -> Int -> a
nty1 x 0 = head x
nty1 x n = nty1 (tail x) (n-1)

nty2 :: [a] -> Int -> a
nty2 (x:xs) 0 = head x
nty2 (x:xs) n = nty2 small (n-1)
    where
        small = [a | a <- xs]
-}
--nty3 :: [a] -> Int -> a
--nty3 x 0 = head x
--nty3 x n = nty3 (drop 1 x) (n-1)    

{-
nty [1,2,3,4,5] 2   = nty [2,3,4,5] 1 =       
                    = nty [3,4,5] 0 =
                    = 3    
-}


take1 :: [a] -> Int -> [a]
take1 (x:xs) 0 = []
take1 (x:xs) n = [x] ++ take1 xs (n-1)   

drop1 :: Int -> [a] -> [a]
drop1 0 x = x
drop1 n (x:xs) = drop1 (n-1) xs   
--drop1 n x = drop1 (n-1) (tail x)


-- drop 2 [1,2,3,4] = drop 1 [2,3,4]
--                  = drop 0 [3,4]
--                  = [3,4] 

length1 :: [a] -> Int 
length1 [] = 0
length1 (x:xs) = 1 + length1 xs      

length21 :: [a] -> Int 
length21 x = length2 x 0
   where 
        length2 :: [a] -> Int -> Int 
        length2 [] n     = n    
        length2 (x:xs) n = length2 xs (n+1)

--len :: [a] -> Integer
--len x = sum $ map (\_ -> 1)     

dodaj_listy :: [a] -> [a] -> [a]   
dodaj_listy [] x       = x 
dodaj_listy (x:xs) y   = x:dodaj_listy xs y

reverse1 :: [a] -> [a]
reverse1 []     = []
reverse1 (x:xs) = reverse1 xs ++ [x]

reverse2 :: [a] -> [a]
reverse2 x = dodaj_listy [] x
    where
        dodaj_listy :: [a] -> [a] -> [a]   
        dodaj_listy x []      = x 
        dodaj_listy x (y:ys)   = dodaj_listy (y:x) (ys)

 --[tail, reverse] :: [[a] -> [a]]       

copy :: a -> (a,a)
copy x = (x,x)

apply :: (a -> b) -> a -> b
apply f x = f x 

silnia :: Integer -> Integer
silnia 0 = 1
silnia n = n * silnia (n-1)

silnia2 :: Integer -> Integer
silnia2 x = silnia_ogon x 1
    where
        silnia_ogon :: Integer -> Integer -> Integer
        silnia_ogon 0 acc = acc 
        silnia_ogon n acc = silnia_ogon (n-1) (acc*n)





--double :: Num a => a -> a
--double x = x*2

palindrome :: Eq a => [a] -> Bool 
palindrome = \xs -> reverse xs == xs

nrazy :: Int -> (a -> a) -> a -> a
nrazy n f | n==0 = \x -> x
          | otherwise = \x -> nrazy (n-1) f (f x)
          

data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show)

leaves :: Tree a -> Int
leaves (Leaf _) = 1
leaves (Node l r) = leaves l + leaves r

balanced :: Tree a -> Bool
balanced (Leaf _) = True
balanced (Node l r) = abs (leaves l - leaves r) <= 1 && balanced l && balanced r

splitt :: [Int] -> ([Int],[Int])
splitt xs = splitAt k xs
   where
     k = (length xs) `div` 2

balance :: [Int] -> Tree Int
balance [x] = Leaf x
balance xs = Node left right
  where
    left = balance (fst lista)
    right = balance (snd lista)
    lista = splitt xs

treemap :: Tree a -> (a -> b) -> Tree b
treemap (Leaf x) f = Leaf (f x)
treemap (Node l r) f = Node left right
    where
      left = treemap l f
      right = treemap r f

data RoseTree a = NodeR a [RoseTree a] 

treemapR ::  (a -> b) -> RoseTree a -> RoseTree b
treemapR f (NodeR x list) = NodeR (f x) [treemapR f tree | tree <- list]
          
