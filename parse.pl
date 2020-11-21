match(X, [X|T], T).

z([],[]).
s(X0, X) :- match(x,X0, X1), xs(X1, X).
xs(X0, X) :-  match(x,X0, X1), xs(X1, X).
xs(X0, X) :- ys(X0, X).
ys(X0, X) :- match(y, X0, X1), zs(X1, X).
zs(X0, X) :- z(X0,X).
zs(X0, X) :- match(y, X0, X1), zs(X1, X).
