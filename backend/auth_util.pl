:- module(auth_util, [
    user/7
]).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
% Fakta untuk tabel user
% user(Email, Name, Password, RoleId, Avatar, CreatedAt, UpdatedAt).
:- dynamic user/7.

% Contoh data user
user('user1@example.com', 'User 1', 'password1', 1, '', '', '').
user('user2@example.com', 'User 2', 'password2', 2, '', '', '').

% Predikat untuk autentikasi
authenticate(Email, Password, User) :-
    user(Email, Name, Password, RoleId, Avatar, CreatedAt, UpdatedAt),
    User = user(Email, Name, RoleId, Avatar).

% Predikat untuk registrasi user baru
register_user(Email, Name, Password, RoleId) :-
    \+ user(Email, _, _, _, _, _, _), % Pastikan email belum digunakan
    assert(user(Email, Name, Password, RoleId, '', '', '')).

% Endpoint untuk login
:- http_handler(root(login), handle_login, []).

handle_login(Request) :-
    catch(
        (
            http_read_json_dict(Request, JsonDict),
            JsonDict.get(username, Username),
            JsonDict.get(password, Password),
            (authenticate(Username, Password, User) ->
                reply_json_dict(_{token: 'dummy_token', user: User})
            ;
                reply_json_dict(_{status: 'error', message: 'Invalid username or password'}, Status=401)
            )
        ),
        Error,
        (
            reply_json_dict(_{status: 'error', message: Error}, Status=500)
        )
    ).
% Endpoint untuk registrasi
:- http_handler(root(register), handle_register, []).

handle_register(Request) :-
    http_read_json_dict(Request, JsonDict),
    JsonDict.get(email, Email),
    JsonDict.get(name, Name),
    JsonDict.get(password, Password),
    JsonDict.get(roleId, RoleId),
    (register_user(Email, Name, Password, RoleId) ->
        reply_json_dict(_{status: 'success', message: 'Registration successful'})
    ;
        reply_json_dict(_{status: 'failure', message: 'Registration failed'})
    ).