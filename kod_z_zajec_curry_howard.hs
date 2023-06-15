{-# LANGUAGE EmptyDataDecls, EmptyCase, ExistentialQuantification #-}

data Void                                    
                                              
type Falsum = Void                           

type Verum  = Falsum -> Falsum                -

type Neg a  = a -> Falsum   

type Equiv a b = (a -> b, b -> a)            

prawo_tosamosci :: a -> a -- p -> p
prawo_tosamosci = \x -> x

przemiennosc_kon :: (a,b) -> (b,a)
--przemiennosc_kon = \(x,y) -> (y,x) 
przemiennosc_kon = \x -> (snd x, fst x)

--eliminacja_kon :: (a,b) -> a  -- p&q -> p

--kon_dodaj :: a -> (a,a) -- p -> p&p

implikcaja_elim :: (a -> b) -> a -> b -- (p -> q) & p -> q
implikcaja_elim = \f -> \x -> f x 

implikacja_elim1 :: ((a -> b), a) -> b 
implikacja_elim1 = \(f,x) -> f x
--implikacja_elim1 = \x -> (fst x) (snd x)

kon_intro :: a -> (b -> (a,b)) -- p -> (q -> (p&q))
kon_intro = \x -> \y -> (x,y)

--niesprzecznosc :: Neg (a, Neg a) 
niesprzecznosc :: (a, a -> Falsum) -> Falsum
niesprzecznosc = \(x,f) -> f x 

niesprzecznosc1 :: Neg Falsum
niesprzecznosc1 = id 

duns_scott :: a -> Neg a -> Falsum
duns_scott = \x -> \f -> f x

podwojna_negacja :: a -> Neg (Neg a)
podwojna_negacja = \x -> \f -> f x

przemiennosc_alt :: Either a b -> Either b a 
przemiennosc_alt = \x -> case x of 
        Left y -> Right y 
        Right y -> Left y 

alt_into :: a -> Either a b  
alt_into = \x -> Left x

kon_do_alt :: (a,b) -> Either a b 
kon_do_alt = \(x,y) -> Right y

de_morgan :: Neg (Either a b) -> (Neg a, Neg b)
--de_morgan :: ((Either a b) -> Falsum) -> (a -> Falsum, b -> Falsum)
de_morgan = \f -> (\x -> f (Left x), \y -> f (Right y))
