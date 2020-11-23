match(X, [X|T], T).

% <Z> -> t <Z> | t 
nz(XO, X) :- match(t, XO, X).
nz(XO, X) :- match(t, XO, X1), nz(X1, X).

/* <Y> -> q r */
ny(XO, X) :- match(q, XO, X1), match(r, X1, X).

% <X> -> p <X> | p 
nx(XO, X) :- match(p, XO, X).
nx(XO, X) :- match(p, XO, X1), nx(X1, X).

% <S> -> <X> <Y> <Z>
ns(XO, X) :- nx(XO, X1), ny(X1, X2), nz(X2, X).