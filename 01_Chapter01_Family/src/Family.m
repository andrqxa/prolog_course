%-----------------------------------------------------------------------------%
% vim: ft=mercury ts=4 sw=4 et
%-----------------------------------------------------------------------------%
% Copyright (C) 2024 Andrii Puhachenko.
% See the file COPYING for license details.
%-----------------------------------------------------------------------------%

:- module family.
:- interface.

:- import_module io, string.

%-----------------------------------------------------------------------------%

:- pred main(io::di, io::uo) is cc_multi.

:- pred parent(string::in, string::in) is semidet.

:- pred handle_input(string::in, io::di, io::uo) is cc_multi.

:- pred write_output(string::in, io::di, io::uo) is det.

:- pred repl(io::di, io::uo) is cc_multi.
%-----------------------------------------------------------------------------%
%-----------------------------------------------------------------------------%

:- implementation.

:- import_module list.
%-----------------------------------------------------------------------------%

% Family facts
parent("pam", "bob").
parent("tom", "bob").
parent("tom", "liz").
parent("bob", "ann").
parent("bob", "pat").
parent("pat", "jim").



%-----------------------------------------------------------------------------%

% Main function for running
main(!IO) :-
	io.write_string("Enter a query or press Ctrl-Z to exit:\n", !IO),
	repl(!IO).

%:- pred repl(io::di, io::uo) is det.

write_output(Message, !IO) :-
    io.write_string(Message, !IO).

repl(!IO) :-
	io.read_line_as_string(ReadResult, !IO),
	(
		ReadResult = ok(Query),
		handle_input(Query, !IO),
		repl(!IO)
	;
		ReadResult = eof,
		write_output("Goodbye!\n", !IO)
	;
		ReadResult = error(Error),
		write_output(string.format("Error reading input: %s\n", [s(io.error_message(Error))]), !IO)
	).

handle_input(Query, !IO) :-
	Words = string.words(Query),
	(
		Words = [Parent, Child],
		(
			parent(Parent, Child) ->
				write_output(string.format("%s is a parent of %s.\n", [s(Parent), s(Child)]), !IO)
			;
				write_output(string.format("%s is not a parent of %s.\n", [s(Parent), s(Child)]), !IO)
		)
	;
		Words = [],
		write_output("Please enter a valid query.\n", !IO)
	;
		Words = _,
		write_output("Unsupported query format.\n", !IO)
	).

%-----------------------------------------------------------------------------%
:- end_module family.
%-----------------------------------------------------------------------------%







