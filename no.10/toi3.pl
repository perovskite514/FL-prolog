append([], Y, Y).
append([A | X], Y, [A | Z]) :- append(X, Y, Z).
reverse([], []).
reverse([A | X], Y) :- reverse(X, Y1), append(Y1, [A], Y).
concat([], []).
concat([A | X], Y) :- concat(X, Y1), append(A, Y1, Y).