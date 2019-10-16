parent( pam, bob).       % Pam is a parent of Bob
parent( tom, bob).
parent( tom, liz).
parent( bob, ann).
parent( bob, pat).
parent( pat, jim).

female( pam).    % Pam is female
female( liz).
female( ann).
female( pat).
male( tom).        % Tom is male
male( bob).
male( jim).

child( Y, X) :- parent( X, Y).

mother(X,Y) :- parent(X,Y), female(X).

mother(X) :- parent(X,_), female(X).

grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

sister(X,Y) :- female(X), parent(Z,X), parent(Z,Y).

% only recursive rule doesn't work: ancestor(X,Z) :- parent(X,Y), ancestor(Y,Z).

ancestor(X,Z) :- parent(X,Z).
ancestor(X,Z) :- parent(X,Y), ancestor(Y,Z).
% doesn't work: ancestor(X,Z) :- ancestor(Y,Z), parent(X,Y).

color(cherry, red).
color(banana, yellow).
color(apple, red).
color(apple, green).
color(orange, orange).


max(X, Y, X) :- X >= Y, ! .
max(X, Y, Y).


animal(cat).
animal(dog).
animal(snake).
reptile(snake).
likes(mary, X) :- reptile(X),!, fail.
likes(mary,X) :- animal(X).

