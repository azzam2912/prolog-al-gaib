:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).

% Inisialisasi server
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Menjalankan server pada port 5000
:- initialization(server(5000)).

:- dynamic class/5.

% Representasi kelas: class(UserID, CourseID, Day, StartTime, EndTime).
% Contoh: class(1, 'CS101', monday, 9, 11).

% Aturan untuk mendeteksi konflik
conflict(Class1, Class2) :-
    class(_, Class1, Day, Start1, End1),
    class(_, Class2, Day, Start2, End2),
    Class1 \= Class2,
    (Start1 < End2, End1 > Start2).

% Endpoint untuk mendeteksi konflik
:- http_handler(root(conflict), handle_conflict, []).

handle_conflict(Request) :-
    http_parameters(Request,
        [ class1(Class1, []),
          class2(Class2, [])
        ]),
    (   conflict(Class1, Class2)
    ->  reply_json_dict(_{status: 'conflict'})
    ;   reply_json_dict(_{status: 'no conflict'})).

% Menambahkan jadwal baru
add_schedule(UserID, CourseID, Day, StartTime, EndTime) :-
    assertz(class(UserID, CourseID, Day, StartTime, EndTime)).

% Mengedit jadwal yang sudah ada
edit_schedule(UserID, CourseID, NewDay, NewStartTime, NewEndTime) :-
    retract(class(UserID, CourseID, _, _, _)),
    assertz(class(UserID, CourseID, NewDay, NewStartTime, NewEndTime)).

% Endpoint untuk menambah jadwal
:- http_handler(root(add_schedule), handle_add_schedule, []).

handle_add_schedule(Request) :-
    http_parameters(Request,
        [ userid(UserID, [integer]),
            courseid(CourseID, []),
            day(Day, []),
            starttime(StartTime, [integer]),
            endtime(EndTime, [integer])
        ]),
    (   add_schedule(UserID, CourseID, Day, StartTime, EndTime)
    ->  reply_json_dict(_{status: 'success'})
    ;   reply_json_dict(_{status: 'failure'})).

% Endpoint untuk mengedit jadwal
:- http_handler(root(edit_schedule), handle_edit_schedule, []).

handle_edit_schedule(Request) :-
    http_parameters(Request,
        [ userid(UserID, [integer]),
            courseid(CourseID, []),
            newday(NewDay, []),
            newstarttime(NewStartTime, [integer]),
            newendtime(NewEndTime, [integer])
        ]),
    (   edit_schedule(UserID, CourseID, NewDay, NewStartTime, NewEndTime)
    ->  reply_json_dict(_{status: 'success'})
    ;   reply_json_dict(_{status: 'failure'})).

% Membaca semua jadwal untuk user tertentu
get_schedule(UserID, Schedules) :-
    findall([CourseID, Day, StartTime, EndTime], class(UserID, CourseID, Day, StartTime, EndTime), Schedules).

% Endpoint untuk membaca jadwal
:- http_handler(root(get_schedule), handle_get_schedule, []).

handle_get_schedule(Request) :-
    http_parameters(Request, [userid(UserID, [integer])]),
    get_schedule(UserID, Schedules),
    reply_json_dict(Schedules).

:- initialization(server(5000)).
