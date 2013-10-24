eval(plus(A,B),C) :- eval(A,A1), eval(B,B1), C is A1 + B1.
eval(mult(A,B),C) :- eval(A,A1), eval(B,B1), C is A1 * B1.
eval(A,A).

eval(plus(1,mult(4,5)),X).