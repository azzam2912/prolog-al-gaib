:- module(database_service, [
    read_all_from_database/2, ra_read_until_eof/3, ra_check_eof/3, ra_check_same/2,
    check_existence_from_database/1, ce_read_until_eof/3, ce_check_eof/3,
    ce_check_same/2, write_to_database/1
]).
% Convert row to term
% exp f(a, b) jadi f(A, B)
%[TO DO]

% Read all row that matches from database
% Pake term yang GENERAL misal user(A, B), bukan user(haikal, rahman)
read_all_from_database(RowToMatch, Result) :- 
    see(database), 
    read(Row),
    ra_read_until_eof(Row, RowToMatch, Result), 
    seen.

ra_read_until_eof(Row, RowToMatch, Result) :-
    ra_check_same(Row, RowToMatch),
    !,
    ra_check_eof(Row, RowToMatch, Result).

ra_read_until_eof(_, RowToMatch, Result) :-
    read(Next),
    ra_read_until_eof(Next, RowToMatch, Result). %skips line

ra_check_eof(end_of_file, _, []) :- !.
ra_check_eof(Row, RowToMatch, [Row|Res]) :-
    read(Next),
    ra_read_until_eof(Next, RowToMatch, Res).

ra_check_same(end_of_file, _) :- !. %pass eof to be checked later
ra_check_same(Row, RowToMatch) :-
    copy_term(RowToMatch, Tmp),
    Row = Tmp.

% Check existence of a specific row from database
% Pake term yang SPESIFK misal user(haikal, rahman), bukan user(A, B)
check_existence_from_database(RowToMatch) :- 
    see(database), 
    read(Row),
    ce_read_until_eof(Row, RowToMatch, _), 
    seen.

ce_read_until_eof(Row, RowToMatch, Result) :-
    \+ce_check_same(Row, RowToMatch), %ga sama, lanjut
    !,
    ce_check_eof(Row, RowToMatch, Result).

ce_read_until_eof(_, _, _). %sama, berhenti.

ce_check_eof(end_of_file, _, []) :- !, seen, false.
ce_check_eof(Row, RowToMatch, [Row|Res]) :-
    read(Next),
    ce_read_until_eof(Next, RowToMatch, Res).

ce_check_same(Row, RowToMatch) :-
    copy_term(RowToMatch, Tmp),
    Row = Tmp.

% Write to database
% Pake term yang SPESIFK misal user(haikal, rahman), bukan user(A, B)
write_to_database(Row) :- 
    \+ check_existence_from_database(Row), % if exists, ignore
    append(database), 
    write(Row),
    put(46),
    nl,
    told.

% Write to database
% Pake term yang SPESIFK misal user(haikal, rahman), bukan user(A, B)
delete_from_database(RowToMatch, Found) :- 
    see(database), 
    tell(database),
    read(Row),
    del_read_until_eof(Row, RowToMatch, Found).

del_read_until_eof(Row, RowToMatch, Found) :-
    \+del_check_same(Row, RowToMatch), %ga sama, lanjut
    !,
    del_check_eof(Row, RowToMatch, Found).

del_read_until_eof(_, RowToMatch, _) :- 
    read(Next),
    del_read_until_eof(Next, RowToMatch, true). %sama, skip line, set found to true.

del_check_eof(end_of_file, _, Found) :- !, seen, told, \+check_found(Found).

del_check_eof(Row, RowToMatch, Found) :-
    write(Row),
    nl,
    read(Next),
    del_read_until_eof(Next, RowToMatch, Found).

check_found(Found) :- Found = false.

del_check_same(Row, RowToMatch) :-
    copy_term(RowToMatch, Tmp),
    Row = Tmp.