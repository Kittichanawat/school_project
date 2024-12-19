-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 19, 2024 at 04:07 PM
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
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `sch_admins`
--

CREATE TABLE `sch_admins` (
  `adm_id` smallint(6) NOT NULL,
  `adm_fname` varchar(20) NOT NULL,
  `adm_lname` varchar(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `adm_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_attendance`
--

CREATE TABLE `sch_attendance` (
  `atd_id` smallint(6) NOT NULL,
  `std_id` smallint(6) DEFAULT NULL,
  `class_id` int(11) DEFAULT NULL,
  `tea_id` tinyint(6) NOT NULL,
  `term_id` int(11) NOT NULL,
  `atd_date` date NOT NULL,
  `atd_status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_behaviors`
--

CREATE TABLE `sch_behaviors` (
  `bhv_id` smallint(6) NOT NULL,
  `std_id` smallint(6) NOT NULL,
  `bhv_type` varchar(255) NOT NULL,
  `bhv_desc` text DEFAULT NULL,
  `reported_date` date NOT NULL,
  `tea_id` smallint(6) NOT NULL,
  `bhv_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_classes`
--

CREATE TABLE `sch_classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(50) NOT NULL,
  `class_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_grades`
--

CREATE TABLE `sch_grades` (
  `grd_id` tinyint(6) NOT NULL,
  `std_id` smallint(11) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `uploaded_date` date NOT NULL,
  `term_id` int(11) DEFAULT NULL,
  `grd_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_login_users`
--

CREATE TABLE `sch_login_users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_parents`
--

CREATE TABLE `sch_parents` (
  `par_id` tinyint(6) NOT NULL,
  `par_fname` varchar(60) NOT NULL,
  `par_lastname` varchar(60) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_parent_student`
--

CREATE TABLE `sch_parent_student` (
  `parstd_id` smallint(6) NOT NULL,
  `par_id` smallint(6) NOT NULL,
  `std_id` smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_roles`
--

CREATE TABLE `sch_roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_students`
--

CREATE TABLE `sch_students` (
  `std_id` smallint(6) NOT NULL,
  `std_fname` varchar(60) NOT NULL,
  `std_lname` varchar(60) NOT NULL,
  `gender` enum('male','female') NOT NULL,
  `dob` date NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_teachers`
--

CREATE TABLE `sch_teachers` (
  `tea_id` smallint(6) NOT NULL,
  `tea_fname` varchar(60) NOT NULL,
  `tea_lname` varchar(60) NOT NULL,
  `tea_email` varchar(255) DEFAULT NULL,
  `tea_phone` varchar(15) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tea_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_teacher_class`
--

CREATE TABLE `sch_teacher_class` (
  `teaclas_id` smallint(6) NOT NULL,
  `tea_id` smallint(6) NOT NULL,
  `class_id` int(11) DEFAULT NULL,
  `term_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sch_terms`
--

CREATE TABLE `sch_terms` (
  `term_id` int(11) NOT NULL,
  `term_name` varchar(50) NOT NULL,
  `academic_year` varchar(4) NOT NULL,
  `term_status` enum('active','inactive') NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sch_admins`
--
ALTER TABLE `sch_admins`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `sch_attendance`
--
ALTER TABLE `sch_attendance`
  ADD PRIMARY KEY (`atd_id`);

--
-- Indexes for table `sch_behaviors`
--
ALTER TABLE `sch_behaviors`
  ADD PRIMARY KEY (`bhv_id`);

--
-- Indexes for table `sch_classes`
--
ALTER TABLE `sch_classes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `sch_grades`
--
ALTER TABLE `sch_grades`
  ADD PRIMARY KEY (`grd_id`);

--
-- Indexes for table `sch_login_users`
--
ALTER TABLE `sch_login_users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`) USING HASH;

--
-- Indexes for table `sch_parents`
--
ALTER TABLE `sch_parents`
  ADD PRIMARY KEY (`par_id`);

--
-- Indexes for table `sch_parent_student`
--
ALTER TABLE `sch_parent_student`
  ADD PRIMARY KEY (`parstd_id`);

--
-- Indexes for table `sch_roles`
--
ALTER TABLE `sch_roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `sch_students`
--
ALTER TABLE `sch_students`
  ADD PRIMARY KEY (`std_id`);

--
-- Indexes for table `sch_teachers`
--
ALTER TABLE `sch_teachers`
  ADD PRIMARY KEY (`tea_id`);

--
-- Indexes for table `sch_teacher_class`
--
ALTER TABLE `sch_teacher_class`
  ADD PRIMARY KEY (`teaclas_id`);

--
-- Indexes for table `sch_terms`
--
ALTER TABLE `sch_terms`
  ADD PRIMARY KEY (`term_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sch_admins`
--
ALTER TABLE `sch_admins`
  MODIFY `adm_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_attendance`
--
ALTER TABLE `sch_attendance`
  MODIFY `atd_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_behaviors`
--
ALTER TABLE `sch_behaviors`
  MODIFY `bhv_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_classes`
--
ALTER TABLE `sch_classes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_grades`
--
ALTER TABLE `sch_grades`
  MODIFY `grd_id` tinyint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_login_users`
--
ALTER TABLE `sch_login_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_parents`
--
ALTER TABLE `sch_parents`
  MODIFY `par_id` tinyint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_parent_student`
--
ALTER TABLE `sch_parent_student`
  MODIFY `parstd_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_roles`
--
ALTER TABLE `sch_roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_students`
--
ALTER TABLE `sch_students`
  MODIFY `std_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_teachers`
--
ALTER TABLE `sch_teachers`
  MODIFY `tea_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_teacher_class`
--
ALTER TABLE `sch_teacher_class`
  MODIFY `teaclas_id` smallint(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sch_terms`
--
ALTER TABLE `sch_terms`
  MODIFY `term_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
