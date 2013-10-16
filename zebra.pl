exists(A, [H|T]) :- H = A ; exists(A, T).

rightOf(A, B, [X,Y|T]) :- A = Y, B = X ; rightOf(A, B, T).

% exists(A, (A,_,_,_,_)).
% exists(A, (_,A,_,_,_)).
% exists(A, (_,_,A,_,_)).
% exists(A, (_,_,_,A,_)).
% exists(A, (_,_,_,_,A)).

% rightOf(A, B, (B,A,_,_,_)).
% rightOf(A, B, (_,B,A,_,_)).
% rightOf(A, B, (_,_,B,A,_)).
% rightOf(A, B, (_,_,_,B,A)).

middleHouse(A, [_,_,A,_,_]).

firstHouse(A, [A,_,_,_,_]).

nextTo(A, B, [X,Y|T]) :- rightOf(A, B, [X,Y|T]) ; rightOf(B, A, [X,Y|T]).


listLength([],0).
listLength([H|T], X):- listLength(T, X1), X is X1 + 1.

% nextTo(A, B, (A,B,_,_,_)).
% nextTo(A, B, (_,A,B,_,_)).
% nextTo(A, B, (_,_,A,B,_)).
% nextTo(A, B, (_,_,_,A,B)).
% nextTo(A, B, (B,A,_,_,_)).
% nextTo(A, B, (_,B,A,_,_)).
% nextTo(A, B, (_,_,B,A,_)).
% nextTo(A, B, (_,_,_,B,A)).

  % There are five houses.
:-listLength(Houses, 5),

	% The Englishman lives in the red house.
	exists(house(british,_,_,_,red),Houses),
	
	% The Spaniard owns the dog.
	exists(house(spanish,dog,_,_,_),Houses),
	
	% Coffee is drunk in the green house. 
	exists(house(_,_,_,coffee,green),Houses),
	
	% The Ukrainian drinks tea.
  exists(house(ukranian,_,_,tea,_),Houses),

	% The green house is immediately to the right of the ivory house.
	rightOf(house(_,_,_,_,green),house(_,_,_,_,ivory),Houses),

	% The Old Gold smoker owns snails.
	exists(house(_,snail,oldgold,_,_),Houses),

  % Kools are smoked in the yellow house.
	exists(house(_,_,kools,_,yellow),Houses),

	% Milk is drunk in the middle house.
	middleHouse(house(_,_,_,milk,_),Houses),

	% The Norwegian lives in the first house.
	firstHouse(house(norwegian,_,_,_,_),Houses),

	% The man who smokes Chesterfields lives in the house next to the man with the fox.
	nextTo(house(_,_,chesterfields,_,_),house(_,fox,_,_,_),Houses),

	% Kools are smoked in the house next to the house where the horse is kept.
	nextTo(house(_,_,kools,_,_),house(_,horse,_,_,_),Houses),

  % The Lucky Strike smoker drinks orange juice.
	exists(house(_,_,luckystrike,orangejuice,_),Houses),

	% The Japanese smokes Parliaments.
	exists(house(japanese,_,parliaments,_,_),Houses),

	% The Norwegian lives next to the blue house.
	nextTo(house(norwegian,_,_,_,_),house(_,_,_,_,blue),Houses),

	% Create a variable WaterDrinker to store the nationality of the water drinker.
	exists(house(WaterDrinker,_,_,water,_),Houses),

	% Create a variable ZebraOwner to store the nationality of the zebra owner.
	exists(house(ZebraOwner,zebra,_,_,_),Houses),
	
	print(WaterDrinker), print('\n'),
	print(ZebraOwner), print('\n').