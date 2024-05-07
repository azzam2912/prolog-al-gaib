import React from 'react';

const ScheduleBuilder = () => {
  return (
    <div className="bg-white p-4 rounded-lg shadow-md">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-lg font-bold">Buat Jadwal</h2>
        <div className="flex space-x-2">
          <div className="text-sm">Jadwal terisi diperbarui pada 22/2/2024 8:18:10 PM</div>
        </div>
      </div>
      <div className="flex mb-4">
        <div className="mr-4">
          <label htmlFor="fakultas" className="block font-medium mb-1">
            Fakultas
          </label>
          <select id="fakultas" className="border border-gray-300 rounded-md px-2 py-1">
            <option>Pilih Fakultas</option>
            {/* Add more options as needed */}
          </select>
        </div>
        <div className="mr-4">
          <label htmlFor="programStudi" className="block font-medium mb-1">
            Program Studi
          </label>
          <select id="programStudi" className="border border-gray-300 rounded-md px-2 py-1">
            <option>Pilih Program Studi</option>
            {/* Add more options as needed */}
          </select>
        </div>
      </div>
      <div className="mb-4">
        <input
          type="text"
          placeholder="Cari Mata Kuliah"
          className="w-full px-4 py-2 border border-gray-300 rounded-md"
        />
      </div>
      <div>
        <h3 className="text-md font-bold mb-2">Aljabar Linier (3 sks, Term 3)</h3>
        <table className="w-full border-collapse">
          <thead>
            <tr className="bg-purple-600 text-white">
              <th className="py-2 px-4">Pilih</th>
              <th className="py-2 px-4">Nama Kelas</th>
              <th className="py-2 px-4">Waktu</th>
              <th className="py-2 px-4">Ruang</th>
              <th className="py-2 px-4">Pengajar</th>
            </tr>
          </thead>
          <tbody>
            {/* Add rows for each class here */}
          </tbody>
        </table>
      </div>
      {/* Add more sections for other courses as needed */}
    </div>
  );
};

export default ScheduleBuilder;