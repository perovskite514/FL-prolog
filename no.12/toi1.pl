eq(a, b).
eq(c, b).
eq(X, Y) :- eq(Y, X).
eq(X, Z) :- eq(X, Y), eq(Y, Z).
