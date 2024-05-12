import { BrowserRouter, Routes, Route } from "react-router-dom";
import ScheduleComponent from './Schedule/ScheduleComponent';
import ScheduleBuilder from './Schedule/ScheduleBuilder';
import Home from './pages/Home';
import Navbar from "./layout/Navbar";
import ScheduleEdit from "./pages/Schedule";
import LoginPage from "./pages/Login";

export default function App() {
  return (
    <BrowserRouter>
      <Navbar />
      <Routes>
        <Route path="/">
          <Route path="" element={<Home />} />
          <Route path="lihat-jadwal" element={<ScheduleComponent />} />
          <Route path="susun-jadwal" element={<ScheduleBuilder />} />
          <Route path="buat-jadwal" element={<ScheduleEdit />} />
          <Route path="login" element={<LoginPage />} />
        </Route>
      </Routes>
    </BrowserRouter>
  );
}
