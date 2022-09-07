-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 18, 2022 at 01:48 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(5) NOT NULL,
  `user_id` int(5) NOT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `class_schedule`
--

CREATE TABLE `class_schedule` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `day` varchar(10) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class_schedule`
--

INSERT INTO `class_schedule` (`id`, `employee_id`, `product_id`, `day`, `start_time`, `end_time`, `created_at`, `update_at`) VALUES
(1, 1, 1, 'rabu', '13:00:00', '15:00:00', '2022-08-15 21:45:36', '2022-08-15 21:45:36'),
(2, 2, 1, 'senin', '13:30:00', '15:30:00', '2022-08-15 22:13:34', '2022-08-15 22:13:34');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `user_id` varchar(11) NOT NULL,
  `name_employee` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `departement` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `user_id`, `name_employee`, `address`, `gender`, `phone`, `departement`, `created_at`, `update_at`) VALUES
(1, '1', 'Yudi', 'Singaraja', 'Male', '089123123123', 'IT', '2022-08-15 16:29:10', '2022-08-15 16:29:10'),
(2, '2', 'Alvin', 'Karangasem', 'Male', '08978678678', 'IT', '2022-08-15 21:53:00', '2022-08-15 21:53:00'),
(3, '3', 'Wahyu', 'Singaraja', 'Male', '07612312312', 'Sales', '2022-08-15 21:53:40', '2022-08-15 21:53:40');

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp(),
  `creator_id` int(11) NOT NULL,
  `student_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `schedule_id`, `title`, `description`, `created_at`, `update_at`, `creator_id`, `student_id`) VALUES
(4, 1, 'Coding', 'berlatih computational thinking', '2022-08-15 22:44:40', '2022-08-15 22:53:13', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `note_users`
--

CREATE TABLE `note_users` (
  `id` int(11) NOT NULL,
  `note_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `note_users`
--

INSERT INTO `note_users` (`id`, `note_id`, `user_id`, `create_at`, `update_at`) VALUES
(3, 4, 2, '2022-08-16 06:09:32', '2022-08-16 06:09:32');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` varchar(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `price` bigint(25) NOT NULL,
  `period` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `period`, `created_at`, `update_at`) VALUES
(1, '2', 'Animation and Game Coding Explore', 'programming in a fun and enjoyable way', 570000, '32 hari', '2022-08-15 16:33:59', '2022-08-15 16:33:59'),
(2, '2', '3D Game Programming Unity 2.0', 'Mulailah membuat game 2D dan 3D pertama...', 800000, '30 hari', '2022-08-15 21:58:27', '2022-08-15 21:58:27'),
(4, '1', 'Arduino Beginner 1.0', 'Untuk kamu yang ingin belajar Arduino', 2400000, '24 hari', '2022-08-15 22:01:21', '2022-08-15 22:01:21');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `created_at`, `update_at`) VALUES
(1, 'ROBOTIC', '2022-08-15 23:05:51', '2022-08-15 23:05:51'),
(2, 'CODING', '2022-08-15 23:07:06', '2022-08-15 23:07:06'),
(3, 'APP PROGRAMMING', '2022-08-15 23:07:35', '2022-08-15 23:07:35'),
(4, 'ENGINEERING', '2022-08-15 23:07:48', '2022-08-15 23:07:48'),
(5, 'PROGRAM BOOTCAMP', '2022-08-15 23:08:07', '2022-08-15 23:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `product_units`
--

CREATE TABLE `product_units` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `order_unit` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `create_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `create_at`, `update_at`) VALUES
(1, 'test', '2022-08-02 04:10:19', '2022-08-02 04:10:19'),
(2, 'test2', '2022-08-02 04:11:14', '2022-08-02 04:11:14');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name_student` varchar(50) NOT NULL,
  `phone_parent` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `age` int(2) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `name_student`, `phone_parent`, `address`, `age`, `gender`, `created_at`, `update_at`) VALUES
(1, 1, 'Alvin', '89123123', 'Denpasar', 15, 'Male', '2022-08-16 02:50:48', '2022-08-16 02:50:48'),
(3, 3, 'Yudi', '+6287123123123', 'Singaraja', 13, 'Male', '2022-08-16 03:00:21', '2022-08-16 03:00:21');

-- --------------------------------------------------------

--
-- Table structure for table `student_bookings`
--

CREATE TABLE `student_bookings` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `status_book` varchar(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_bookings`
--

INSERT INTO `student_bookings` (`id`, `student_id`, `schedule_id`, `status_book`, `created_at`, `update_at`) VALUES
(3, 3, 1, 'success', '2022-08-16 03:15:24', '2022-08-16 03:15:57');

-- --------------------------------------------------------

--
-- Table structure for table `student_reports`
--

CREATE TABLE `student_reports` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `score` varchar(5) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `video` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `update_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_reports`
--

INSERT INTO `student_reports` (`id`, `unit_id`, `student_id`, `schedule_id`, `description`, `score`, `photo`, `video`, `created_at`, `update_at`) VALUES
(3, 1, 2, 0, 'test', '90', 'https://drive.google.com/file/d/1WgbOAlqaPQhsxh8KzmUK3kcke57osWC9/view?usp=sharing', 'https://drive.google.com/file/d/11h_QnV48wGU-Wz0Zp1Y6vwSso5eMjm8u/view?usp=sharing', '2022-08-16 04:22:58', '2022-08-16 04:22:58'),
(4, 1, 3, 0, 'test', '90', 'https://drive.google.com/file/d/1WgbOAlqaPQhsxh8KzmUK3kcke57osWC9/view?usp=sharing', 'https://drive.google.com/file/d/11h_QnV48wGU-Wz0Zp1Y6vwSso5eMjm8u/view?usp=sharing', '2022-08-16 04:23:05', '2022-08-16 04:23:05');

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `published` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `title`, `description`, `published`, `createdAt`, `updatedAt`) VALUES
(1, 'qweqwe', 'qweqwe', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'qwe', 'qwe', NULL, '2022-08-09 13:51:16', '2022-08-09 13:51:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp(),
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `created_at`, `updated_at`, `role`) VALUES
(1, 'test@gmail.com', '12123', '2022-08-10 04:27:56', '2022-08-10 04:27:56', 'Admin'),
(2, 'alvin@gmail.com', 'Qwe12', '2022-08-16 02:56:46', '2022-08-16 02:56:46', ''),
(3, 'yudi@gmail.com', 'Ewq321', '2022-08-16 02:57:07', '2022-08-16 02:57:07', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_schedule`
--
ALTER TABLE `class_schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `class_schedule_ibfk_1` (`employee_id`),
  ADD KEY `class_schedule_ibfk_2` (`product_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notes_ibfk_1` (`schedule_id`);

--
-- Indexes for table `note_users`
--
ALTER TABLE `note_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `note_id` (`note_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_units`
--
ALTER TABLE `product_units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `student_bookings`
--
ALTER TABLE `student_bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule_id` (`schedule_id`),
  ADD KEY `student_id` (`student_id`);

--
-- Indexes for table `student_reports`
--
ALTER TABLE `student_reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class_schedule`
--
ALTER TABLE `class_schedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `note_users`
--
ALTER TABLE `note_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_units`
--
ALTER TABLE `product_units`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `student_bookings`
--
ALTER TABLE `student_bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `student_reports`
--
ALTER TABLE `student_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `class_schedule`
--
ALTER TABLE `class_schedule`
  ADD CONSTRAINT `class_schedule_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `class_schedule_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `class_schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `note_users`
--
ALTER TABLE `note_users`
  ADD CONSTRAINT `note_users_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `note_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `student_bookings`
--
ALTER TABLE `student_bookings`
  ADD CONSTRAINT `student_bookings_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `class_schedule` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_bookings_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
