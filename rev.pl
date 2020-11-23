append([],L,L).           
append([H|T1],L,[H|T2]):- 
        append(T1,L,T2).

rev([],[]).
rev([H|T],R):- rev(T,RL),append(RL,[H],R).

head([H|T],H).

finalelem(L,E):- rev(L,R),head(R,E).
