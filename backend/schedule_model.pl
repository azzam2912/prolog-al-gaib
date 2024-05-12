:- module(schedule_model, [
    jadwal/2, matakuliah/3, kelas/2, jadwal_harian/4, timestamp/4, dosen/2, 
    matakuliah_list/2, kelas_list/2, jadwal_harian_list/2, dosen_list/2, user/7
]).
:- dynamic jadwal/2, matakuliah/3, kelas/2, jadwal_harian/4, timestamp/4, dosen/2,
    matakuliah_list/2, kelas_list/2, jadwal_harian_list/2, dosen_list/2, user/7.

% Fakta untuk tabel jadwal
% jadwal(namaJadwal, userEmail).

% Fakta untuk tabel matakuliah
% matakuliah(id, name, sks).

% Fakta untuk tabel kelas
% kelas(id, matakuliahID).

% Fakta untuk tabel jadwal_harian
% jadwal_harian(id, startAtID, endAtID, updatedAtID).

% Fakta untuk tabel timestamp
% timestamp(id, hari, jam, menit).

% Fakta untuk tabel dosen
% dosen(id, name).

% Fakta untuk tabel matakuliah_list
% matakuliah_list(namaJadwal, matakuliahID).

% Fakta untuk tabel kelas_list
% kelas_list(matakuliahID, kelasID).

% Fakta untuk tabel jadwal_harian_list
% jadwal_harian_list(kelasID, jadwalHarianID).

% Fakta untuk tabel dosen_list
% dosen_list(kelasID, dosenID).

% Fakta untuk tabel user
% user(email, name, password, roleId, avatar, createdAt, updatedAt).
