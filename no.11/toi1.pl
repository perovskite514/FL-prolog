male(kobo).
male(koji).
male(iwao).
female(sanae).
female(mine).
female(miho).
parent(kobo, koji).
parent(kobo, sanae).
parent(sanae, iwao).
parent(sanae, mine).
parent(miho, koji).
parent(miho, sanae).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- ancestor(Z, Y), parent(X, Z).
