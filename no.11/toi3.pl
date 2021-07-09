members(X, [X | _]).
members(X, [_ | X1]) :- members(X, X1).
nth(1,  [X | _], X).
nth(N, [_ |L], X) :-
    N > 1, M is N - 1, nth(M, L, X).
reverse([], []).
reverse([A | X], Y) :- reverse(X, Y1), append(Y1, [A], Y).
my_length([], 0).
my_length([_ | Y], N) :- my_length(Y, M), N is M + 1.
append([], Y, Y).
append([A|X], Y, [A|Z]) :- append(X, Y, Z).
take(_, 0, []).
take([], N, []) :- N > 0.
take([X | Y], N, [X | Z]) :-
    N > 0, M is N - 1, take(Y, M, Z).
remove_nth(N, L, A) :- my_length(L, LEN), M is N - 1, take(L, M, B), reverse(L, R), 
                       K is LEN - N, take(R, K, C), reverse(C, D), append(B, D, A).
insert_nth(N, X, L, A) :- my_length(L, LEN), take(L, N, B), reverse(L, R), 
                          K is LEN - N, take(R, K, C), reverse(C, D), append(B, [X], E), append(E, D, A).
next_turn(x, o). 
next_turn(o, x).
equal(X, X).
check1(P, [P, _, _, P, _, _, P, _, _]).
check2(P, [_, P, _, _, P, _, _, P, _]).
check3(P, [_, _, P, _, _, P, _, _, P]).
check4(P, [P, P, P, _, _, _, _, _, _]).
check5(P, [_, _, _, P, P, P, _, _, _]).
check6(P, [_, _, _, _, _, _, P, P, P]).
check7(P, [P, _, _, _, P, _, _, _, P]).
check8(P, [_, _, P, _, P, _, P, _, _]).

check(P, B) :-  check1(P, B); check2(P, B); check3(P, B); check4(P, B); check5(P, B); 
                check6(P, B); check7(P, B); check8(P, B).
notcheck(P, B) :- \+ check(P, B).

move1(P, B, A, E) :- nth(1, B, X), equal(X, E), remove_nth(1, B, C), insert_nth(0, P, C, A).
move2(P, B, A, E) :- nth(2, B, X), equal(X, E), remove_nth(2, B, C), insert_nth(1, P, C, A).
move3(P, B, A, E) :- nth(3, B, X), equal(X, E), remove_nth(3, B, C), insert_nth(2, P, C, A).
move4(P, B, A, E) :- nth(4, B, X), equal(X, E), remove_nth(4, B, C), insert_nth(3, P, C, A).
move5(P, B, A, E) :- nth(5, B, X), equal(X, E), remove_nth(5, B, C), insert_nth(4, P, C, A).
move6(P, B, A, E) :- nth(6, B, X), equal(X, E), remove_nth(6, B, C), insert_nth(5, P, C, A).
move7(P, B, A, E) :- nth(7, B, X), equal(X, E), remove_nth(7, B, C), insert_nth(6, P, C, A).
move8(P, B, A, E) :- nth(8, B, X), equal(X, E), remove_nth(8, B, C), insert_nth(7, P, C, A).
move9(P, B, A, E) :- nth(9, B, X), equal(X, E), remove_nth(9, B, C), insert_nth(8, P, C, A).
move(P, B, A, E) :- move1(P, B, A, E); move2(P, B, A, E); move3(P, B, A, E); move4(P, B, A, E); move5(P, B, A, E); move6(P, B, A, E); move7(P, B, A, E); 
                    move8(P, B, A, E); move9(P, B, A, E). 
notend(B, E) :- members(E, B).

win(P, B, _) :- check(P, B).
win(P, B, E) :- next_turn(P, Q), notcheck(Q, B), !, (move(P, B, A, E), lose(Q, A, E)).

lose(P, B, _) :- next_turn(P, Q), check(Q, B).
lose(P, B, E) :- next_turn(P, Q), notend(B, E), !, (\+ (move(P, B, A, E), (\+ win(Q, A, E)))).

judge :- \+ (win(o, [em, em, em, em, em, em, em, em, em], em); lose(o, [em, em, em, em, em, em, em, em, em], em)).
judge1 :- win(o, [o, em, em, x, em, em, em, em, em], em).
judge2 :- win(o, [em, em, em, x, o, em, em, em, em], em).
judge3 :- win(o, [em, o, em, x, em, em, em, em, em], em).
