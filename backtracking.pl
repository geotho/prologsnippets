take([H|T], H, T). % You can take the head of a list and return the tail.
take([H|T], R, [H|S]) :- take(T,R,S). % Or you can take a different element of the list.

perm([],[]). % The only permutation of an empty list is an empty list.
perm(L, [H|T]) :- take(L,H,R), perm(R,T). % 

% Generate and test pattern. Perm generates a solution Out, checkColours checks the solution.
flag(In, Out) :- perm(In,Out), checkColours(Out).

% 
checkRed([red|T]) :- checkRed(T).
checkRed(L) :- checkWhite(L).

checkWhite([white|T]) :- checkWhite(T).
checkWhite(L) :- checkBlue(L).

checkBlue([blue|T]) :- checkBlue(T).
checkBlue([blue]).

checkColours(Out) :- length(Out, 5), checkRed(Out).