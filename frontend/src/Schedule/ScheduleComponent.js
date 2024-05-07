import React from 'react';

const ScheduleComponent = () => {
  return (
    <div className="bg-white p-4 rounded-lg shadow-md">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-lg font-bold">Daftar Jadwal</h2>
        <div className="flex space-x-2">
          <button className="px-3 py-2 bg-purple-600 text-white rounded-md">Buat Jadwal</button>
          <button className="px-3 py-2 bg-purple-600 text-white rounded-md">Update Matkul</button>
          <button className="px-3 py-2 bg-purple-600 text-white rounded-md">Kontributor</button>
          <button className="px-3 py-2 bg-purple-600 text-white rounded-md">Sign Out</button>
        </div>
      </div>
      <div className="mb-4">
        <input
          type="text"
          placeholder="Cari Jadwal Kuliah"
          className="w-full px-4 py-2 border border-gray-300 rounded-md"
        />
      </div>
      <h3 className="text-md font-bold mb-2">Semester Genap 2023/2024</h3>
      <div className="grid grid-cols-2 gap-4">
        <div className="bg-purple-600 text-white p-4 rounded-md">
          <h4 className="text-lg font-bold">Intern Safe</h4>
          <p>Dibuat pada 13/1/2024</p>
        </div>
        <div className="bg-purple-600 text-white p-4 rounded-md">
          <h4 className="text-lg font-bold">Komnas 5 - Komputer & Assessment</h4>
          <p>23:00</p>
        </div>
        <div className="bg-purple-600 text-white p-4 rounded-md">
          <h4 className="text-lg font-bold">Komnas 5 - Komputer & Assessment</h4>
          <p>23:00</p>
        </div>
        <div className="bg-purple-600 text-white p-4 rounded-md">
          <h4 className="text-lg font-bold">Pengemban Kompsis - Pengembangan Komputer & Sistem Informasi</h4>
          <p>23:00 - 02:00</p>
        </div>
        <div className="bg-purple-600 text-white p-4 rounded-md">
          <h4 className="text-lg font-bold">Krinsproj - Kristografi & Keamanan Informasi</h4>
          <p>13:00 - 14:40</p>
        </div>
        <div className="bg-purple-600 text-white p-4 rounded-md">
          <h4 className="text-lg font-bold">Pemrograman Paralel</h4>
          <p>14:00</p>
        </div>
        <div className="bg-purple-600 text-white p-4 rounded-md">
          <h4 className="text-lg font-bold">Pemrograman Paralel</h4>
          <p>14:00 - 16:40</p>
        </div>
        <div className="bg-purple-600 text-white p-4 rounded-md">
          <h4 className="text-lg font-bold">Kristografi - Kristografi & Keamanan Informasi</h4>
          <p>12:00</p>
        </div>
      </div>
    </div>
  );
};

export default ScheduleComponent;