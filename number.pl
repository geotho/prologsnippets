% Add the numbers from A to B inclusive.
sigma(B, B, B).
sigma(A, B, N) :- B > A, A1 is A + 1, sigma(A1, B, N1), N1 is N - A.

% One has a successor.
s(i).
% Every number has a successor.
s(s(X)) :- s(X).

% 1 is represented primitively as i.
prim(1, i).
% A is represented primitively by B if...
prim(A, B) :-
	prim(A1, B1), % A1 is represented primitively by B1, where...
	A is A1 + 1, % A is one more than A1, and...
	B = s(B1). % B is the successor of B1...

plus(A,B,C) :- prim(N, A), prim(M, B), prim(P, C), P is N + M.
mult(A,B,C) :- prim(N, A), prim(M, B), prim(P, C), P is N * M.