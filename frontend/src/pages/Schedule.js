import React, { useState } from 'react';
import { addSchedule, editSchedule, getSchedule, checkConflict } from '../api/api';

const ScheduleEdit = () => {
  const [userId, setUserId] = useState('');
  const [courseId, setCourseId] = useState('');
  const [day, setDay] = useState('');
  const [startTime, setStartTime] = useState('');
  const [endTime, setEndTime] = useState('');
  const [newDay, setNewDay] = useState('');
  const [newStartTime, setNewStartTime] = useState('');
  const [newEndTime, setNewEndTime] = useState('');
  const [class1, setClass1] = useState('');
  const [class2, setClass2] = useState('');
  const [schedule, setSchedule] = useState([]);
  const [conflictResult, setConflictResult] = useState('');

  const handleAddSchedule = async () => {
    try {
      const result = await addSchedule(userId, courseId, day, startTime, endTime);
      console.log(result);
    } catch (error) {
      console.error(error);
    }
  };

  const handleEditSchedule = async () => {
    try {
      const result = await editSchedule(userId, courseId, newDay, newStartTime, newEndTime);
      console.log(result);
    } catch (error) {
      console.error(error);
    }
  };

  const handleGetSchedule = async () => {
    try {
      const result = await getSchedule(userId);
      setSchedule(result);
    } catch (error) {
      console.error(error);
    }
  };

  const handleCheckConflict = async () => {
    try {
      const result = await checkConflict(class1, class2);
      setConflictResult(result);
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-8">
      <h1 className="text-3xl font-bold mb-8">SusunJadwal</h1>

      <div className="mb-8">
        <h2 className="text-xl font-bold mb-4">Add Schedule</h2>
        <div className="flex space-x-4">
          <input
            type="text"
            placeholder="User ID"
            value={userId}
            onChange={(e) => setUserId(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <input
            type="text"
            placeholder="Course ID"
            value={courseId}
            onChange={(e) => setCourseId(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <input
            type="text"
            placeholder="Day"
            value={day}
            onChange={(e) => setDay(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <input
            type="text"
            placeholder="Start Time"
            value={startTime}
            onChange={(e) => setStartTime(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <input
            type="text"
            placeholder="End Time"
            value={endTime}
            onChange={(e) => setEndTime(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <button
            onClick={handleAddSchedule}
            className="bg-purple-600 text-white rounded-md px-4 py-2 hover:bg-purple-700"
          >
            Add Schedule
          </button>
        </div>
      </div>

      <div className="mb-8">
        <h2 className="text-xl font-bold mb-4">Edit Schedule</h2>
        <div className="flex space-x-4">
          <input
            type="text"
            placeholder="New Day"
            value={newDay}
            onChange={(e) => setNewDay(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <input
            type="text"
            placeholder="New Start Time"
            value={newStartTime}
            onChange={(e) => setNewStartTime(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <input
            type="text"
            placeholder="New End Time"
            value={newEndTime}
            onChange={(e) => setNewEndTime(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <button
            onClick={handleEditSchedule}
            className="bg-purple-600 text-white rounded-md px-4 py-2 hover:bg-purple-700"
          >
            Edit Schedule
          </button>
        </div>
      </div>

      <div className="mb-8">
        <h2 className="text-xl font-bold mb-4">Get Schedule</h2>
        <div className="flex space-x-4">
          <button
            onClick={handleGetSchedule}
            className="bg-purple-600 text-white rounded-md px-4 py-2 hover:bg-purple-700"
          >
            Get Schedule
          </button>
        </div>
        <ul className="mt-4 list-disc pl-4">
          {schedule.map((item, index) => (
            <li key={index}>{item}</li>
          ))}
        </ul>
      </div>

      <div>
        <h2 className="text-xl font-bold mb-4">Check Conflict</h2>
        <div className="flex space-x-4">
          <input
            type="text"
            placeholder="Class 1"
            value={class1}
            onChange={(e) => setClass1(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <input
            type="text"
            placeholder="Class 2"
            value={class2}
            onChange={(e) => setClass2(e.target.value)}
            className="border border-gray-300 rounded-md px-3 py-2 w-full"
          />
          <button
            onClick={handleCheckConflict}
            className="bg-purple-600 text-white rounded-md px-4 py-2 hover:bg-purple-700"
          >
            Check Conflict
          </button>
        </div>
        <p className="mt-4">{conflictResult}</p>
      </div>
    </div>
  );
};

export default ScheduleEdit;