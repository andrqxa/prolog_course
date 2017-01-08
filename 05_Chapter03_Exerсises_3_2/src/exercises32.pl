% Even and odd length of list
evenlength([_X, _Y]).

evenlength([_X, _Y | Z]) :-
	evenlength(Z).
	
oddlength([_]).

oddlength([_|Y]) :-
	oddlength(Y).
	
evenlength1([]).

evenlength1([_|L]) :-
	oddlength1(L).
	
oddlength1([_]).

oddlength1([_|Y]) :-
	oddlength1(Y).

% Concatenation of two lists
conc([], X, X).

conc([X|L1], L2, [X|L3]) :-
	conc(L1, L2, L3).

% Reverse of list
reverse([], []).

reverse([X|Y], Z) :-
	reverse(Y, Y1),
	conc(Y1, [X], Z).

palindrome([], []).

palindrome([X | Y], ).