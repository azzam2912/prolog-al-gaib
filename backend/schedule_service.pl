:- module(schedule_service, [add_schedule/5, edit_schedule/5, get_schedule/2, conflict/2]).
:- dynamic class/5.

% Menambahkan jadwal baru
add_schedule(UserID, CourseID, Day, StartTime, EndTime) :-
    assertz(class(UserID, CourseID, Day, StartTime, EndTime)).

% Mengedit jadwal yang sudah ada
edit_schedule(UserID, CourseID, NewDay, NewStartTime, NewEndTime) :-
    retract(class(UserID, CourseID, _, _, _)),
    assertz(class(UserID, CourseID, NewDay, NewStartTime, NewEndTime)).

% Membaca semua jadwal untuk user tertentu
get_schedule(UserID, Schedules) :-
    findall([CourseID, Day, StartTime, EndTime], class(UserID, CourseID, Day, StartTime, EndTime), Schedules).

% Mendeteksi konflik antara dua kelas
conflict(Class1, Class2) :-
    class(_, Class1, Day, Start1, End1),
    class(_, Class2, Day, Start2, End2),
    Class1 \= Class2,
    (Start1 < End2, End1 > Start2).
