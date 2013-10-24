last([H],H).
last([_|T],H) :- last(T,H).  

append([],A,A).
append([H|T],A,[H|R]) :- append(T,A,R).

search(S, [S|T]).
search(S, [_|T]) :- search(S,T).

% Uses O(n) space.
listLength([],0).
listLength([_|T], X):- listLength(T, X1), X is X1 + 1.

% Uses O(1) space because of accumulator.
listLengthAcc([],Acc,Acc).
listLengthAcc([_|T], Acc, R) :- B is Acc + 1, listLengthAcc(T, B, R).
listLengthAcc(List, R) :- listLengthAcc(List, 0, R).

bigList(0, []).
bigList(N, [_,T]) :- bigList(M, T), N is M + 1.