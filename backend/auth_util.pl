:- module(auth_util, [
    authenticate/3, register_user/3
]).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
% Fakta untuk tabel user
% user(Email, Name, Password, RoleId, Avatar, CreatedAt, UpdatedAt).
:- dynamic user/7.

% Predikat untuk autentikasi
authenticate(Email, Password, User) :-
    user(Email, Name, Password, CreatedAt, UpdatedAt),
    User = user(Email, Name, Password, CreatedAt, UpdatedAt).

% Predikat untuk registrasi user baru
register_user(Email, Name, Password) :-
    \+ user(Email, _, _, _, _), % Pastikan email belum digunakan
    assert(user(Email, Name, Password, '', '')).

% Endpoint untuk login
:- http_handler(root(login), handle_login, []).

handle_login(Request) :-
    catch(
        (
            http_read_json_dict(Request, JsonDict),
            JsonDict = _{username: Username, password: Password},
            (authenticate(Username, Password, User) ->
                reply_json(_{token: 'dummy_token', user: User})
            ;
                reply_json(_{status: 'error', message: 'Invalid username or password'}, [status(401)])
            )
        ),
        Error,
        (
            ErrorDict = _{status: 'error', message: Error},
            reply_json(ErrorDict, [status(500)])
        )
    ).

% Endpoint untuk autentikasi
:- http_handler(root(auth), handle_auth, []).

handle_auth(Request) :-
    http_read_json_dict(Request, JsonDict),
    JsonDict.get(email, Email),
    JsonDict.get(password, Password),
    (authenticate(Email, Password, User) ->
        reply_json_dict(User)
    ;
        reply_json_dict(_{status: 'failure', message: 'Authentication failed'})
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