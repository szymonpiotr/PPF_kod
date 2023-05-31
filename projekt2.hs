data Drzewo a = Lisc a | Wezel (Drzewo a) a (Drzewo a)
  deriving(Eq,Read,Show)

{-
Zad 1. 10pkt
Korzystając z podanej wyżej definicji drzewa, zdefiniuj funkcję "drzewo_parzyste",
która bierze jako argument drzewo etykietowane liczbami
i zwraca drzewo, w którym każda etykieta zmieniona jest na wartość boolowską:
jeśli wcześniej etykieta była liczbą parzystą, teraz zamiast tej liczby
etykieta to True; jeśli zaś była nieparzysta, w jej miejsce pojawia się False.
Działanie:

drzewo_0 = Wezel (Lisc 4) 3 (Wezel (Lisc 2) 5 (Lisc 6))

drzewo_parzyste drzewo_0 = Wezel (Lisc True) False (Wezel (Lisc True) False (Lisc True))
-}

{-
Zad 2. 10pkt
Korzystając z podanej wyżej definicji drzewa zdefinuj funkcję "czy_prawdy",
która dla danego drzewa etykietowanego wartościami boolowskimi sprawdzi,
czy wszystkie etykiety to True.
Działanie:

drzewo_1 = Wezel (Lisc True) False (Wezel (Lisc True) False (Lisc True))

czy_prawdy drzewo_1 = False
-}

{-
Zad 3. 10pkt
Korzystając z podanej wyżej definicji drzewa zdefinuj funkcję "ile_razy", która
dla danego drzewa etykietowanego wartościami boolowskimi oraz pewnej wartości
boolowskiej zwróci informację ile razy dana wartośc wystąpiła na drzewie.
Działanie:

drzewo_2 = Wezel (Lisc True) False (Wezel (Lisc True) False (Lisc True))

ile_razy True drzewo_2 = 3

ile_razy False drzewo_2 = 2
-}

{-
Zad 4. 5pkt
Nazwijmy drzewo etykietowane wartościami boolowskimi symetrycznym, kiedy
róznica pomiędzy ilością etykiet z True różni się od ilości etykiet z False
co najwyżej o jeden. Zdefinuj funkcję "symetria",
która sprawdzi symetrycznośc danego drzewa.
Działanie:

drzewo_3 = Wezel (Wezel (True) False (False)) False (Wezel (Lisc True) False (Lisc True))

symetria drzewo_3 = True

drzewo_4 = Wezel (Wezel (False) False (False)) False (Wezel (Lisc True) False (Lisc False))

symetria drzewo_4 = False
-}
