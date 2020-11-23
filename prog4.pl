
% q1: From the copied family tree, define relations for sibling, brother, aunt, grandson, and descendant
male(mushu).
male(tangdee).
male(X):-father(X,_).	%(father X, of _)
female(mulan).
female(beumei).
female(gugu).
female(X):-mother(X,_).

father(baba,mushu).	
father(baba,mulan).
father(yeye,baba).
father(yeye,gugu).
father(yeye,susu).
father(susu,tangdee).
father(zengzufu,yeye).
father(jojo,beumei).

mother(mama,mushu).
mother(mama,mulan).
mother(popo,mama).
mother(popo,jojo).

/*
Operations: 
and ,
or ;
if :-
not equivalent /=
*/



/*
sibling: same mother 
brother: male and  same mother
aunt: 	 female and sibling of mother
grandson: male descendant of fathers father
descendant: mother or father 
*/

/*rules*/
parent(X,Y):- father(X,Y).

parent(X,Y):- mother(X,Y).

grandparent(X,Z):-
	parent(X,Y),  /*define relationship that grandparent is the parent of a parent*/
	parent(Y,Z).
  
sibling(X,Y):- 
	parent(Z,X),
	parent(Z,Y),
	not(X=Y).
	
brother(X,Y):-
	sibling(X,Y),  /*brother is a sibling*/
	male(X).       /*brother is male*/

aunt(X,Y):- 
	parent(Z,Y),  /*niece parent is defined here*/
	sibling(X,Z), /*aunt is sister with neice mother*/
	female(X).    /*aunt is female*/

grandson(X,Y):-
	grandparent(Y,X), /*links relationship between grandparent*/
	male(X).     	  /*grandson is male*/

% if person has relationship with parent then they are descendants of those parents

descendant(X,Y):- parent(Y,X).
 
% q2: rules that find the final element of a list
append([],L,L).
append([H|T1],L,[H|T2]):-
        append(T1,L,T2).

rev([],[]).
rev([H|T],R):- rev(T,RL),append(RL,[H],R).

head([H|T],H).

final(L,E):- rev(L,R),head(R,E).

% q3: parser program based on given grammar
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

% q4: Complete dem_candidate textbook example using trace to show that the number of backtracking can be reduced if cut is used
alive([biden, clinton, barack, bernie, bill]).
dems([biden, clinton, barack, bernie, bill]). 
formerPres([barack, bill]).
tests(Candidate) :- (alive(NotDeadList), member(Candidate, NotDeadList)), (formerPres(FPList), member(Candidate, FPList)).
% member(Elm, [Elm | _]) :- !.
member(Elm, [_ | List]) :- member(Elm, List).
dem_candidate(Candidate) :- dems(DemocratList), member(Candidate, DemocratList), tests(Candidate). 
