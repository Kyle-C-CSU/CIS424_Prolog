alive([biden, clinton, barack, bernie, bill]).
dems([biden, clinton, barack, bernie, bill]). 
formerPres([barack, bill]).
tests(Candidate) :- (alive(NotDeadList), member(Candidate, NotDeadList)), (formerPres(FPList), member(Candidate, FPList)).
% member(Elm, [Elm | _]) :- !.
member(Elm, [_ | List]) :- member(Elm, List).
dem_candidate(Candidate) :- dems(DemocratList), member(Candidate, DemocratList), tests(Candidate). 
