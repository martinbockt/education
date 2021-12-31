grenze(X,Y) :- 0 < X, X < 8, 0 < Y, Y < 8.

springer([X,Y],[X1,Y1]) :- X1 is X+2, Y1 is Y+1,grenze(X1,Y1).
springer([X,Y],[X1,Y1]) :- X1 is X+2, Y1 is Y-1,grenze(X1,Y1).
springer([X,Y],[X1,Y1]) :- X1 is X-2, Y1 is Y+1,grenze(X1,Y1).
springer([X,Y],[X1,Y1]) :- X1 is X-2, Y1 is Y-1,grenze(X1,Y1).
springer([X,Y],[X1,Y1]) :- X1 is X+1, Y1 is Y+2,grenze(X1,Y1).
springer([X,Y],[X1,Y1]) :- X1 is X+1, Y1 is Y-2,grenze(X1,Y1).
springer([X,Y],[X1,Y1]) :- X1 is X-1, Y1 is Y+2,grenze(X1,Y1).
springer([X,Y],[X1,Y1]) :- X1 is X-1, Y1 is Y-2,grenze(X1,Y1).

element(X,[X|Rs]).
element(X,[Y|Rs]):- element(X,Rs).

zugfolge([H|X],Z) :- Z == 42, write(X),nl,!.
zugfolge([X,Y|Rest],A) :- springer(X,Y),append([Y],Rest,NRest),not(element(Y,Rest)),A1 is A + 1,zugfolge([Y,Z|NRest],A1).

solution([[1,1]|X]) :- zugfolge([[1,1],Y|[[1,1]]],1).

?- solution([H|X]).