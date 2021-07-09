edge(e1, a, b).
edge(e2, a, c).
edge(e3, a, d).
edge(e4, a, e).
edge(e5, b, c).
edge(e6, b, d).
edge(e7, b, e).
edge(e8, c, d).
edge(e9, d, e).
edge(e10, b, a).

members(X, [X | _]).
members(X, [_ | X1]) :- members(X, X1).
append([], Y, Y).
append([A|X], Y, [A|Z]) :- append(X, Y, Z).
remove(X, [X | Y], Y).  
remove(X, [Y | Z], R) :- remove(X, Z, A), append([Y], A, R).
hamilton1(_, _, []). 
hamilton1(V, E, R) :- edge(E1, V, W), members(E1, E), members(W, R), remove(W, R, A), hamilton1(W, E, A).
hamilton(V, E) :- members(W, V), remove(W, V, R), hamilton1(W, E, R).
