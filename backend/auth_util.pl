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