import React, { useState } from 'react';
import ScheduleBuilder from '../Schedule/ScheduleBuilder';

const HomePage = () => {
  const [selectedCourse, setSelectedCourse] = useState(null);
  const [showSchedule, setShowSchedule] = useState(false);

  const courses = [
    'Aljabar Linier',
    'Analisis Numerik',
    'Basis Data',
    // Add more courses as needed
  ];

  const handleCourseSelect = (course) => {
    setSelectedCourse(course);
    setShowSchedule(true);
  };

  return (
    <div className="bg-white p-4 rounded-lg shadow-md">
      <h2 className="text-lg font-bold mb-4">Pilih Mata Kuliah</h2>
      <div className="grid grid-cols-3 gap-4">
        {courses.map((course) => (
          <button
            key={course}
            className="bg-purple-600 text-white p-4 rounded-md hover:bg-purple-700"
            onClick={() => handleCourseSelect(course)}
          >
            {course}
          </button>
        ))}
      </div>
      {showSchedule && (
        <div className="mt-8">
          <h3 className="text-md font-bold mb-4">Jadwal Terpilih</h3>
          <ScheduleBuilder selectedCourse={selectedCourse} />
        </div>
      )}
    </div>
  );
};

export default HomePage;