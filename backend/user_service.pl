:- module(user_service, [add_user/5, edit_user/5, get_user/2]).
:- use_module(schedule_model).
:- use_module(database_service).

% Menambahkan user baru
add_user(UserID, Name, Password, RoleId, Avatar) :-
    \+ check_existence_from_database(user(UserID, _, _, _, _, _, _)), % Pastikan UserID belum digunakan
    get_time(CreatedAt),
    NewUser = user(UserID, Name, Password, CreatedAt, CreatedAt),
    write_to_database(NewUser).

% Mengedit data user yang sudah ada
edit_user(UserID, NewName, NewPassword, NewRoleId, NewAvatar) :-
    get_time(UpdatedAt),
    NewUser = user(UserID, NewName, NewPassword, _, UpdatedAt),
    retractall(user(UserID, _, _, _, _)),
    write_to_database(NewUser).

% Membaca data user
get_user(UserID, User) :-
    read_all_from_database(user(UserID, _, _, _, _), [User]).