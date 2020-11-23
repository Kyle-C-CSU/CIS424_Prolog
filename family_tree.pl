
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

%if person has relationship with parent then they are descendants of those parents

descendant(X,Y):- parent(Y,X).
 
