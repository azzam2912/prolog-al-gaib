:- module(schedule_service, [
    add_schedule/5, edit_schedule/5, get_schedule/2, conflict/2
]).
:- use_module(schedule_model).

% Menambahkan jadwal baru
add_schedule(UserID, CourseID, Day, StartTime, EndTime) :-
    assertz(jadwal_harian(UserID, CourseID, Day, StartTime, EndTime)).

% Mengedit jadwal yang sudah ada
edit_schedule(UserID, CourseID, NewDay, NewStartTime, NewEndTime) :-
    retractall(jadwal_harian(UserID, CourseID, _, _, _)),
    assertz(jadwal_harian(UserID, CourseID, NewDay, NewStartTime, NewEndTime)).

% Membaca semua jadwal untuk user tertentu
get_schedule(UserID, Schedules) :-
    (   findall([CourseID, Day, StartTime, EndTime], jadwal_harian(UserID, CourseID, Day, StartTime, EndTime), Schedules),
        Schedules \= []
    ->  true
    ;   Schedules = []).

% Mendeteksi konflik antara dua kelas
conflict(Class1, Class2) :-
    jadwal_harian(_, Class1, Day1, Start1, End1),
    jadwal_harian(_, Class2, Day2, Start2, End2),
    Day1 = Day2,
    Class1 \= Class2,
    (Start1 < End2, End1 > Start2).