last([H],H).
last([_|T],H) :- last(T,H).  

append([],A,A).
append([H|T],A,[H|R]) :- append(T,A,R).

search([H|T],S) :- H = S ; search(T,S).

listLength([],0).
listLength([H|T], X):- listLength(T, X1), X is X1 + 1.