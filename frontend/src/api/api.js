// api.js
const BASE_URL = 'http://localhost:3001';

export const addSchedule = async (userId, courseId, day, startTime, endTime) => {
  try {
    const response = await fetch(`${BASE_URL}/add_schedule?userid=${userId}&courseid=${courseId}&day=${day}&starttime=${startTime}&endtime=${endTime}`, {
      method: 'POST',
    });
    const data = await response.text();
    return data;
  } catch (error) {
    console.error(error);
    throw error;
  }
};

export const editSchedule = async (userId, courseId, newDay, newStartTime, newEndTime) => {
  try {
    const response = await fetch(`${BASE_URL}/edit_schedule?userid=${userId}&courseid=${courseId}&newday=${newDay}&newstarttime=${newStartTime}&newendtime=${newEndTime}`, {
      method: 'POST',
    });
    const data = await response.text();
    return data;
  } catch (error) {
    console.error(error);
    throw error;
  }
};

export const getSchedule = async (userId) => {
  try {
    const response = await fetch(`${BASE_URL}/get_schedule?userid=${userId}`);
    const data = await response.text();
    return data.split(',');
  } catch (error) {
    console.error(error);
    throw error;
  }
};

export const checkConflict = async (class1, class2) => {
  try {
    const response = await fetch(`${BASE_URL}/conflict?class1=${class1}&class2=${class2}`);
    const data = await response.text();
    return data;
  } catch (error) {
    console.error(error);
    throw error;
  }
};

export const login = async (username, password) => {
  try {
    const response = await fetch(`${BASE_URL}/login`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify({ username, password }),
    });
    const data = await response.json();
    return data;
  } catch (error) {
    console.error(error);
    throw error;
  }
};