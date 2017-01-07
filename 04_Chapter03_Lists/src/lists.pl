% X belongs to List
member(X, [X|_]).

member(X, [_Y|Other]) :-
	member(X, Other).
	
% Concatenation of two lists
conc([], X, X).

conc([X|L1], L2, [X|L3]) :-
	conc(L1, L2, L3).
	
% Other variant of member via conc
member1(X, L) :-
	conc(_, [X|_], L).
	
% remove 3 last elements of list	
remove_3_last(L1, L2) :-
	conc(L2, [_, _, _], L1).
	
	
% remove 3 first and 3 last elements of list	
remove_3_first_and_last(L1, L2) :-
	conc([_, _, _], L3, L1),
	conc(L2, [_, _, _], L3).
	
% Last element of list via conc
last1(X, L) :-
	conc(_L1, [X], L).

% Last element of list
last2(X, [X]).

last2(X, [_|Y]) :-
	last2(X, Y).
	
% Add element to list
add(X, L, [X|L]).

% Remove element from list
del(X, [X|L], L).

del(X, [Y|L1], [Y|L2]) :-
	del(X, L1, L2).
	
% One more variant of member via del
member2(X, L) :-
	del(X, L, _).
	
% Sublist
sublist(S, L) :-
	conc(_, L2, L),
	conc(S, _, L2).
	
% Insert into list
insert(X, L, L1) :-
	del(X, L1, L).
	
% Permutation of list
permutation([], []).

permutation([X|List1], List2) :-
	permutation(List1, List3),
	insert(X, List3, List2).

% Another variant of permutation
permutation2([], []).

permutation2(L, [X|P]) :-
	del(X, L, L1),
	permutation(L1, P).
	
	