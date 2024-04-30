%===============================================================================
% Family facts
%===============================================================================
parent(pam, bob).
parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).
parent(pat, jim).

woman(pam).
woman(liz).
woman(pat).
woman(ann).
man(jim).
man(tom).
man(bob).

%===============================================================================
% Family rules
%===============================================================================
child(X, Y) :- 
	parent(Y, X).

mother(X, Y) :-	
	parent(X, Y),
	woman(X).
	
parent_of_parent(X, Y) :-
	parent(X, Z),
	parent(Z, Y).

sister(X, Y) :-	
	parent(Z, X),
	parent(Z, Y),
	woman(X).
	
happy(X) :-
	parent(X, _).

has_2_child(X) :-
	parent(X, Y),
	sister(_, Y).

grandson(X, Y) :-
	parent(Y, Z),
	parent(Z, X),
	man(X).

aunt(X, Y) :-
	parent(Z, Y),
	sister(X, Z).
