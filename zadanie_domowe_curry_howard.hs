{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification #-}


data Void                                     --typ pusty
                                             
type Falsum = Void                            --czyli Falsum

type Verum  = Falsum -> Falsum                --Verum, czyli prawda

type Neg a  = a -> Falsum                     -- negacja a, jako implikacja od a do fałszu

type Equiv a b = (a -> b, b -> a)             -- równoważność

{-
data Either a b = Left a | Right b            -- alternatywna a i b, zakomentowana, bo jest wbudowana
-}

-- Proszę napisać funkcję zamieszkujące następujące intuicjonistyczne tautologie.

podwojna_negacja :: Neg a -> Neg (Neg (Neg a)) -- ~a -> ~~~a

tertium_non_datur_neg :: Neg (Neg (Either a (Neg a))) -- ~~(a v ~a) 

kon_alt :: Either a (b, c) -> (Either (a, b), Either (a, c)) -- (a v (b & c)) -> ((a v b) & (a v c))

przemiennosc_equiv :: Equiv a b -> Equiv b a  -- (a <-> b) -> (b <-> a)



