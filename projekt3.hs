{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification #-}

data Void                                     --empty type
                                              --"A Haskell logically uninhabited data type"
type Falsum = Void                            --Falsum constant "There is no proof of Falsum"

type Verum  = Falsum -> Falsum                --Verum constant

type Neg a  = a -> Falsum

type Equiv a b = (a -> b, b -> a)             --intuitionistic equivalence

-- Zadanie 1. (10 pkt) Udowodnij następujące tautologie logiki intuicjonistycznej:

kon_imp :: (a -> Neg b) -> Neg (a,b) -- (p -> ~q) -> ~(p&q)

d_intro3 :: Either a b -> (a -> c) -> (b -> c) -> c -- (p v q) -> ((p -> r) -> ((q -> r) -> r)) 

proofid22 :: a -> Verum                       -- p -> Verum

proofvoid4 :: a -> b -> (a -> Neg b) -> Neg a -- (p -> q) -> ((p -> ~q) -> ~p)

proofexport :: ((a,b) -> c) -> a -> b -> c    -- ((p & q) -> r) -> (p -> (q -> r))

proofor2 :: (a, Either b c) -> Either (a,b) (a,c) -- (p & (q v r)) -> (p & q) v (p & r)

proofor3 :: Either a (b,c) -> (Either a b, Either a c)  -- (p v (q & r)) -> (p v q) & (p v r)

-- Zadanie 2. (5 pkt) Wyjasnij dlaczego nie jest możliwe udowodnienie
-- następującej formuły.

podwojna_negacja :: Neg (Neg a) -> a -- ~~a -> a
