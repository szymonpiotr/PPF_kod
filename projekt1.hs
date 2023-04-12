{-
Zad 1.
Określ typ następującej funkcji.
transform f []     = []
transform f (x:xs) = (f x):mapped f xs
-}

{-
Zad 2.
Ciagiem Fibonacciego jest następujący ciąg liczb:
1,1,2,3,5,8,13,21,34...
w którym każdy wyraz, z wyjątkiem dwóch początkowych, jest
sumą dwóch wyrazów bezpośrednio go poprzedzających.

Zdefinuj funkcję "fibo", która dla zadanego argumentu 'n'
zwraca n-ty wyraz ciągu Fibonacciego:

fibo 1 = 1
fibo 6 = 8
-}

{-
Zad 3.
Zdefiniuj funkcję "rem_duplicates", która z podanej listy liczb tworzy listę nie zawierającą powtórzeń.
Jako funkcję pomocniczą zdefiniuj funkcję "is_element", która dla danej liczby i listy, sprawdza
czy dana liczba znajduje sie na liście.

Przykładowe działanie:
rem_duplicates [1,2,3,4] = [1,2,3,4]
rem_duplicates [1,1,2,3,4,4,5] = [1,2,3,4,5]
-}

{-
Zad 4.
Uogólnij typ zdefiniowanej wyżej funkcji tak, aby działała róznież na listach zawierających
inne porównywalne ze sobą obiekty.

Przykładowe działanie:
general_rem_duplicates ['a', 'a', 'b'] = ['a', 'b']
general_rem_duplicates [(1,2), (1,2), (1,4)] = [(1,2), (1,4)]
-}

{-
Zad 5.
Stosując dowolną technikę oraz korzystając z wbudowanego typu Bool, zdefiniuj (najkróćej jak potrafisz) implikację. 
-}
