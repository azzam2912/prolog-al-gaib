# SusunJadwal Prolog Version Backend

Proyek ini adalah versi backend dari SusunJadwal Prolog Version yang dibuat menggunakan SWI-Prolog untuk menangani penjadwalan kelas. Backend server ini mendukung operasi untuk menambahkan, mengedit, melihat, dan mendeteksi konflik pada jadwal.

## Fitur

- Menambah jadwal
- Mengedit jadwal
- Mendapatkan jadwal
- Mendeteksi konflik antar jadwal

## Pengaturan

Pastikan Anda memiliki SWI-Prolog terinstal di sistem Anda. Anda bisa mengunduhnya dari [situs resmi SWI-Prolog](https://www.swi-prolog.org/Download.html).

## Struktur File

Proyek ini terdiri dari dua file utama:

- `schedule_server.pl`: File ini mengatur server HTTP dan endpoint.
- `schedule_service.pl`: File ini mengandung logika bisnis untuk operasi yang berhubungan dengan jadwal.
- `schedule_model.pl`: File ini mendefinisikan model data dan inisialisasi data awal.

## Menjalankan Server

Untuk menjalankan server, ikuti langkah-langkah berikut:

1. Buka terminal.
2. Navigasikan ke direktori `backend`.
3. Jalankan perintah berikut di terminal:
    ``` 
    swipl
    ```
4. Setelah masuk ke dalam swipl terminal, jalankan server:
    ```
    [server].
    ```

## API Endpoints

### Menambah Jadwal

- URL: `/add_schedule`
- Metode: POST
- Parameter URL:
  - userid: ID pengguna
  - courseid: ID kursus
  - day: Hari
  - starttime: Waktu mulai
  - endtime: Waktu selesai
- Contoh Penggunaan:
    ``` 
    curl -X POST "http://localhost:5000/add_schedule" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "userid=1&courseid=CS101&day=monday&starttime=9&endtime=11"
    
    ```

### Mengedit Jadwal

- URL: /edit_schedule
- Metode: POST
- Parameter URL:
  - userid: ID pengguna
  - courseid: ID kursus
  - newday: Hari baru
  - newstarttime: Waktu mulai baru
  - newendtime: Waktu selesai baru
- Contoh Penggunaan:
  ```
  curl -X POST "http://localhost:5000/edit_schedule" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "userid=1&courseid=CS101&newday=tuesday&newstarttime=10&newendtime=12"
  ```

### Mendapatkan Jadwal

- URL: /get_schedule
- Metode: GET
- Parameter URL:
  - userid: ID pengguna
- Contoh Penggunaan:
    ```
    curl "http://localhost:5000/get_schedule?userid=1"
    ```


### Mendeteksi Konflik Jadwal

- URL: /conflict
- Metode: GET
- Parameter URL:
  - class1: ID kelas pertama
  - class2: ID kelas kedua
- Contoh Penggunaan:
    ```
    curl "http://localhost:5000/conflict?class1=CS101&class2=CS102"
    ```
