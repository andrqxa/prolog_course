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
	
% Last element of list
last1(X, L) :-
	conc(_L1, [X], L).
	
% Palindrome
palindrome([]).

palindrome([_]).

palindrome([X|Y]) :-
	conc(Z, [X], Y),
	palindrome(Z).
	
% Palindrome via reverse
palindrome1(X) :-
	reverse(X, X).
	
% Shilt list to left by one element
shift([], []).

shift([X|Y], L) :-
	conc(Y, [X], L).

% Translate numbers to words
means(0, zero).
means(1, one).
means(2, two).
means(3, three).
means(4, four).
means(5, five).
means(6, six).
means(7, seven).
means(8, eight).
means(9, nine).

translate([], []).

translate([X|Y], L) :-	
	translate(Y, Y1),
	means(X, W),
	conc([W], Y1, L).
	