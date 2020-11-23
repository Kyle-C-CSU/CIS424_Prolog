/*S -> SS
* S -> ab
* S -> ac
*/

match(X,[X|T],T).

ns(X0,X):- match(a,X0,X1), match(b,X1,X).
ns(X0,X):- match(a,X0,X1), match(c,X1,X).
ns(X0,X):- ns(X0,X1),ns(X1,X).


