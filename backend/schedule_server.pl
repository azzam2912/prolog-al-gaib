:- module(schedule_controller, [
    start_server/1
]).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- use_module(schedule_service).

% Inisialisasi server
start_server(Port) :-
    http_server(http_dispatch, [port(Port)]).

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

% Endpoint untuk membaca jadwal
:- http_handler(root(get_schedule), handle_get_schedule, []).

handle_get_schedule(Request) :-
    http_parameters(Request, [userid(UserID, [integer])]),
    get_schedule(UserID, Schedules),
    reply_json_dict(Schedules).

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

% Memulai server pada port 5000
:- initialization(start_server(5000)).
