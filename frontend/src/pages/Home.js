import React from 'react';

const Home = () => {
  return (
    <div className="bg-white p-4 rounded-lg shadow-md">
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-lg font-bold">Daftar Jadwal</h2>
        <div className="flex space-x-2">
        </div>
      </div>
      <h3 className="text-md font-bold mb-2">Semester Genap 2023/2024</h3>
      <div className="grid grid-cols-2 gap-4">
        <div className="bg-purple-600 text-white p-4 rounded-md">
          <h4 className="text-lg font-bold">Intern Safe</h4>
          <p>Dibuat pada 13/1/2024</p>
        </div>
        
      </div>
    </div>
  );
};

export default Home;