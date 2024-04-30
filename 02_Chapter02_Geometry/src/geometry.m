point(X, Y) :-
	number(X),
	number(Y).

segment(point(_X1, _Y1), point(_X2, _Y2)).

triangle(point(_X1, _Y1), point(_X2, _Y2), point(_X3, _Y3)).

vertical_segment(point(X, _Y1), point(X, _Y2)).

horizontal_segment(point(_X1, Y), point(_X2, Y)).

circle(point(_, _), R) :-
	number(R).
	
retangle(point(X1, Y1), point(X1, Y2), point(X2, Y1), point(X2, Y2)).

regular_rectangle(P1, P2, P3, P4) :-
	horizontal_segment(P2, P3),
	horizontal_segment(P1, P4),
	vertical_segment(P1, P2),
	vertical_segment(P3, P4).

