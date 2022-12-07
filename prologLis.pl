%elemento pertenece a una lista
pertenece(E,[E|_]).
pertenece(E,[_|F]) :- pertenece(E,F).

%obtener el tamaño de una lista
size([], 0).
size([_|S], F):-
    size(S, L),
     F is L + 1.

%concatenar dos listas 
concatenar(A,B,C) :- A=[], C=B.
concatenar(A,B,C) :- A=[X|D], concatenar(D,B,E), C=[X|E].

%eliminar un elemento de las lista
eliminar([],_,[]).
eliminar([Z|L],Y,L2) :-Z=Y,eliminar(L,Y,L2).
eliminar([Z|L],Y,[Z|L2]) :-not(Z=Y),eliminar(L,Y,L2).

%Agregar un elemento a la lista
agregar([],X,[X]).
agregar([H|T],X,[H|L]):-agregar(T,X,L).

%listas de numeros impares e impares
separar([ ],[ ],[ ]).
separar([X|XS],[X|PA],IM):-A is X mod 2,A=0,separar(XS,PA,IM).
separar([X|XS],PA,[X|IM]):-B is X mod 2,B>0,separar(XS,PA,IM).

%verificar que una lista este de forma ascendente
ascendente([]).
ascendente([X,Y|XS]):- X<Y;Y=:=nil,ascendente(XS).

%verificar que una lista este de forma descendente 
descendente([]). 
descendente([X,Y|XS]):- X>Y;Y=:=nil,descendente(XS).

%aplanar
aplanar([],[]).
aplanar([X|L],S):-is_list(X),
aplanar(X,S1),
aplanar(L,S2),
append(S1,S2,S),!.
aplanar([X|L],S):-not(is_list(X)),
aplanar(L,S1),
S=[X|S1].

%obtener valores mayores a head 
menorHead([],[]).
menorHead([_],[]).
menorHead([X1,X2|XS],[X2|L]):- X1>X2, menorHead([X1|XS],L). 
menorHead([X1,X2|XS],L):-X1<X2,menorHead([X1|XS],L). 

%obtener valores mayores a head
mayorHead([],[]).
mayorHead([_],[]).
mayorHead([X1,X2|XS],[X2|X]):- X1<X2, mayorHead([X1|XS],X). 
mayorHead([X1,X2|XS],X):-X1>X2,mayorHead([X1|XS],X). 

%obtener la lista invertida 
invertir([],[]).
invertir([X|XS],Z):-invertir(XS,T),append(T,[X],Z).
