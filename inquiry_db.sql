-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 14, 2025 at 10:42 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inquiry_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `inquiries`
--

CREATE TABLE `inquiries` (
  `id` int(11) NOT NULL,
  `question_keywords` text DEFAULT NULL,
  `answer` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquiries`
--

INSERT INTO `inquiries` (`id`, `question_keywords`, `answer`) VALUES
(21, 'enroll, enrollment process, registration, how to enroll', 'To enroll, visit the Registrar\'s Office with your Form 138, PSA birth certificate, good moral certificate, and 2x2 ID picture.'),
(22, 'tuition, fees, payment, how much, cost', 'The tuition fee starts at ₱15,000 per semester for senior high. Payment can be made in full or installment via the Accounting Office.'),
(23, 'requirements, documents needed, needed papers, what to bring', 'Requirements include Form 138, PSA birth certificate, certificate of good moral, medical certificate, and 2x2 photo.'),
(24, 'scholarship, financial aid, grant, discount, free tuition', 'The school offers academic, athletic, and need-based scholarships. Apply at the Scholarship Office with your latest grades.'),
(25, 'class schedule, class hours, time, what time are classes', 'Classes usually start at 7:30 AM and end at 5:00 PM. Schedule depends on year level and section.'),
(26, 'uniform, dress code, what to wear, school uniform', 'Wear the official school uniform from Monday to Thursday, and P.E. uniform on Friday. ID must be worn at all times.'),
(27, 'late enrollment, can I still enroll, enrollment deadline', 'Late enrollment is accepted until the second week of the semester with an approved request form and penalty fee.'),
(28, 'transfer, transferee, requirements for transfer, transfer student', 'Transferees must submit their Honorable Dismissal, TOR/Report Card, and Certificate of Good Moral Character.'),
(29, 'login, account, student portal, how to login', 'You can access the student portal using your student ID number and default password. Change your password after first login.'),
(30, 'lost id, id replacement, new id', 'To replace a lost ID, go to the Student Affairs Office and pay ₱150 for ID reprinting. Bring an affidavit of loss if needed.'),
(31, 'library, borrowing books, library schedule, how to borrow books', 'The library is open from 8:00 AM to 6:00 PM on weekdays. Present your ID and log your borrowing in the system.'),
(32, 'graduation, requirements for graduation, clearance, grad', 'Graduating students must accomplish clearance forms, complete academic requirements, and attend rehearsal to join graduation.'),
(33, 'location, where is the school, how to go to school', 'The school is located at Barangay Sampaguita, San Jose City, Nueva Ecija. You can reach it via jeep from the city terminal.'),
(34, 'no classes, class suspension, cancelled classes', 'Class suspensions are announced via the official school Facebook page and SMS alerts. Always stay updated during bad weather.'),
(35, 'clinic, medical, health office, first aid', 'The school clinic is at the ground floor beside the Guidance Office. Medical assistance is available from 8:00 AM to 5:00 PM.'),
(36, 'org, organizations, join clubs, student groups', 'You can join student organizations during the Student Org Fair in August. Visit the Student Affairs Office for more info.'),
(37, 'ojt, internship, practicum, on the job training', 'OJT is required for 4th year students. Coordination is done through the Office of Student Internships at least one semester before deployment.'),
(38, 'modules, download modules, learning materials', 'Modules are available through the LMS or can be picked up at the school. Contact your adviser for printed copies.'),
(39, 'entrance exam, admission test, test schedule', 'The entrance exam is scheduled every Friday at 9:00 AM. Register online or at the Admission Office for a test slot.'),
(40, 'school calendar, holidays, semester dates, school year', 'The school calendar is posted on the website and bulletin boards. It includes start/end of semesters, holidays, and exam weeks.'),
(41, '', ''),
(42, 'location', 'isulan');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, '1', '1', '$2y$10$S8ZQZxaS00pMBNQV8pRPyO.N5Nq78nJRgMIb/ynfUBA4eo0GUnCMu', 'user'),
(2, '', '', '$2y$10$Kp739PWfnmBMQeSOQfcrPefXyWuZcqfXcEJXqOK6gQH/2jlevh1AO', 'user'),
(4, '4', '4', '$2y$10$IvuiwO7WXrJNqQsPkN0zM.YnnaK5KaQGeiKAHCpnQsrhmoTHqjCga', 'user'),
(5, '5', '5', '$2y$10$XF5RNkk7Z9w.bIs4dnIGhe2AjieP/POMr88ulbiAKH1n.3mbClEQS', 'user'),
(9, '6', '6', '$2y$10$PPS83N9120hVc0A6JOAYGecy4HAGo8NCgdnUDtWIpiZ02Z7RBHrPu', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `inquiries`
--
ALTER TABLE `inquiries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `inquiries`
--
ALTER TABLE `inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
