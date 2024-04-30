% allowed moves
move(state(middle, on_box, middle, dont_have), 
	seize, 
	state(middle, on_box, middle, have)).
move(state(P, on_floor, P, H), 
	climb, 
	state(P, on_box, P, H)).
move(state(P1, on_floor, P1, H), 
	push(P1, P2), 
	state(P2, on_floor, P2, H)).
move(state(P1, on_floor, B, H), 
	go_to(P1, P2), 
	state(P2, on_floor, B, H)).

can_have(state(_, _, _, have)).

can_have(P1) :-
	move(P1, _Move, P2),
	can_have(P2).
	