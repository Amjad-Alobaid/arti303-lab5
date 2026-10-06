% Lab 5 - Simpsons Family Tree
% Amjad Alobaid

% ===== FACTS: gender =====
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% ===== FACTS: parent(Parent, Child) =====
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).
parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).

parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).
% ===== RULES =====
father(X, Y) :-
    parent(X, Y),
    male(X).

mother(X, Y) :-
    parent(X, Y),
    female(X).

son(X, Y) :-
    parent(Y, X),
    male(X).

daughter(X, Y) :-
    parent(Y, X),
    female(X).

sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.

brother(X, Y) :-
    sibling(X, Y),
    male(X).

sister(X, Y) :-
    sibling(X, Y),
    female(X).
grandfather(X, Z) :-
    father(X, Y),
    parent(Y, Z).

uncle(X, Y) :-
    parent(P, Y),
    brother(X, P).

aunt(X, Y) :-
    parent(P, Y),
    sister(X, P).

cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    sibling(P1, P2),
    X \= Y.

% ancestor - recursive
ancestor(X, Z) :-
    parent(X, Z).

ancestor(X, Z) :-
    parent(X, Y),
    ancestor(Y, Z).



% ?- father(X, bart).
% X = homer .

% ?- father(homer, X).
% X = bart ;
% X = lisa ;
% X = maggie.
%
% ?- mother(X, lisa).
% X = marge.

% ?- mother(selma, X).
% X = ling.

% ?- son(X, homer).
% X = bart .

% ?- son(homer, X).
% X = abraham .

% ?- son(homer, abraham).
% true.

% ?- son(bart, homer).
% true.

% ?- daughter(X, marge).
% X = lisa ;
% X = maggie.

% ?- daughter(X, clancy).
% X = marge ;
% X = patty ;
% X = selma.

% ?- brother(X, homer).
% X = herb .

% ?- brother(bart, lisa).
% true .

% ?- sister(patty, selma).
% true .

% ?- setof(X, sister(X, bart), L).
% L = [lisa, maggie].

% ?- grandfather(X, bart).
% X = abraham ;
% X = clancy .

% ?- grandfather(clancy, X).
% X = bart ;
% X = lisa ;
% X = maggie ;
% X = ling.

% ?- uncle(X, bart).
% X = herb .

% ?- uncle(herb, X).
% X = bart .

% ?- uncle(herb, bart).
% true .

% ?- setof(X, aunt(X, bart), L).
% L = [patty, selma].

% ?- setof(X, aunt(X, ling), L).
% L = [marge, patty].

% ?- cousin(bart, ling).
% true .

% ?- setof(X, cousin(X, ling), L).
% L = [bart, lisa, maggie].

% ?- setof(X, ancestor(X, bart), L).
% L = [abraham, clancy, homer, jackie, marge, mona].

% ?- setof(X, ancestor(abraham, X), L).
% L = [bart, herb, homer, lisa, maggie].

