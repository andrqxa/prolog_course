%-----------------------------------------------------------------------------%
% vim: ft=mercury ts=4 sw=4 et
%-----------------------------------------------------------------------------%
% Copyright (C) 2024 Andrii Puhachenko.
% See the file COPYING for license details.
%-----------------------------------------------------------------------------%

:- module family.
:- interface.

:- import_module io.

%-----------------------------------------------------------------------------%

:- pred main(io::di, io::uo) is det.

:- pred parent(string, string).
:- mode parent(in, out) is nondet.
:- mode parent(out, in) is nondet.

:- pred sister(string, string).
:- mode sister(in, out) is nondet.
:- mode sister(out, in) is nondet.

:- pred woman(string::in) is semidet.
:- pred man(string::in) is semidet.
:- pred child(string::in, string::in) is semidet.
:- pred mother(string::in, string::in) is semidet.
:- pred parent_of_parent(string::in, string::in) is semidet.

:- pred happy(string::in) is semidet.
:- pred has_2_child(string::in) is semidet.
:- pred grandson(string::in, string::in) is semidet.
:- pred aunt(string::in, string::in) is semidet.

%-----------------------------------------------------------------------------%
%-----------------------------------------------------------------------------%

:- implementation.

%-----------------------------------------------------------------------------%

% Family facts
parent("pam", "bob").
parent("tom", "bob").
parent("tom", "liz").
parent("bob", "ann").
parent("bob", "pat").
parent("pat", "jim").

woman("pam").
woman("liz").
woman("pat").
woman("ann").
man("jim").
man("tom").
man("bob").

% Family rules
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
	woman(X),
	X \= Y.

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

%-----------------------------------------------------------------------------%

% Main function for running
main(!IO) :-
	( if sister("pam", "ann") then
        io.write_string("Pam is a sister of Ann.\n", !IO)
    else
        io.write_string("Pam is not a sister of Ann.\n", !IO)
    ).

%-----------------------------------------------------------------------------%
:- end_module family.
%-----------------------------------------------------------------------------%