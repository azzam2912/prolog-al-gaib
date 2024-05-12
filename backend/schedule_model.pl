:- module(schedule_model, [
    jadwal/2, matakuliah/3, kelas/2, jadwal_harian/4, timestamp/4, dosen/2, 
    matakuliah_list/2, kelas_list/2, jadwal_harian_list/2, dosen_list/2, user/5
]).
:- dynamic jadwal/2, matakuliah/3, kelas/2, jadwal_harian/4, timestamp/4, dosen/2,
    matakuliah_list/2, kelas_list/2, jadwal_harian_list/2, dosen_list/2, user/5.

% Fakta untuk tabel jadwal
% jadwal(namaJadwal, userEmail).
jadwal('', '').

% Fakta untuk tabel matakuliah
% matakuliah(id, name, sks).
matakuliah('', '', 0).

% Fakta untuk tabel kelas
% kelas(id, matakuliahID).
kelas('', '').

% Fakta untuk tabel jadwal_harian
% jadwal_harian(id, startAtID, endAtID, updatedAtID).
jadwal_harian('', '', '', '').

% Fakta untuk tabel timestamp
% timestamp(id, hari, jam, menit).
timestamp('', '', 0, 0).

% Fakta untuk tabel dosen
% dosen(id, name).
dosen('', '').

% Fakta untuk tabel matakuliah_list
% matakuliah_list(namaJadwal, matakuliahID).
matakuliah_list('', '').

% Fakta untuk tabel kelas_list
% kelas_list(matakuliahID, kelasID).
kelas_list('', '').

% Fakta untuk tabel jadwal_harian_list
% jadwal_harian_list(kelasID, jadwalHarianID).
jadwal_harian_list('', '').

% Fakta untuk tabel dosen_list
% dosen_list(kelasID, dosenID).
dosen_list('', '').

% Fakta untuk tabel user
% user(email, name, password, roleId, avatar, createdAt, updatedAt).
user('', '', '', '', '').