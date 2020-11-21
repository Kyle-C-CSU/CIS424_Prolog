final(H, [ H ]).
final(H, [ _ | T ]) :- final(H,T).