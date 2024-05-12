:- module(user_service, [add_user/5, edit_user/5, get_user/2]).
:- use_module(schedule_model).

% Menambahkan user baru
add_user(Email, Name, Password, RoleId, Avatar) :-
    \+ check_existence_from_database(user(Email, _, _, _, _, _, _)), % Pastikan email belum digunakan
    get_time(CreatedAt),
    NewUser = user(Email, Name, Password, CreatedAt, CreatedAt),
    write_to_database(NewUser).

% Mengedit data user yang sudah ada
edit_user(Email, NewName, NewPassword, NewRoleId, NewAvatar) :-
    get_time(UpdatedAt),
    NewUser = user(Email, NewName, NewPassword, _, UpdatedAt),
    retractall(user(Email, _, _, _, _)),
    write_to_database(NewUser).

% Membaca data user
get_user(Email, User) :-
    read_all_from_database(user(Email, _, _, _, _), [User]).

% Mendapatkan waktu saat ini
get_time(Time) :-
    get_time(Atom),
    atom_string(Atom, Time).

% Konversi atom ke string
atom_string(Atom, String) :-
    atom_codes(Atom, Codes),
    string_codes(String, Codes).