-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jan 16, 2020 at 06:32 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `du_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `maingroups`
--

CREATE TABLE `maingroups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maingroups`
--

INSERT INTO `maingroups` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'College A', '2020-01-15 11:19:15', '2020-01-15 13:25:24', NULL),
(2, 'College B', '2020-01-15 11:38:24', '2020-01-15 11:38:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL,
  `menu_type` int(11) NOT NULL DEFAULT 1,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `position`, `menu_type`, `icon`, `name`, `title`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, NULL, 0, NULL, 'User', 'User', NULL, NULL, NULL),
(2, NULL, 0, NULL, 'Role', 'Role', NULL, NULL, NULL),
(3, 0, 1, 'fa-database', 'MainGroups', 'Main Groups', NULL, '2020-01-15 11:15:57', '2020-01-15 11:15:57'),
(4, 0, 1, 'fa-database', 'StudentGroups', 'Student Groups', NULL, '2020-01-15 11:17:14', '2020-01-15 11:17:14'),
(5, 0, 1, 'fa-database', 'Students', 'Students', NULL, '2020-01-15 11:18:18', '2020-01-15 11:18:18');

-- --------------------------------------------------------

--
-- Table structure for table `menu_role`
--

CREATE TABLE `menu_role` (
  `menu_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_role`
--

INSERT INTO `menu_role` (`menu_id`, `role_id`) VALUES
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(5, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2015_10_10_000000_create_menus_table', 1),
(4, '2015_10_10_000000_create_roles_table', 1),
(5, '2015_10_10_000000_update_users_table', 1),
(6, '2015_12_11_000000_create_users_logs_table', 1),
(7, '2016_03_14_000000_update_menus_table', 1),
(8, '2020_01_15_164558_create_main_groups_table', 2),
(9, '2020_01_15_164715_create_student_groups_table', 3),
(10, '2020_01_15_164818_create_students_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', '2020-01-15 11:04:36', '2020-01-15 11:04:36'),
(2, 'User', '2020-01-15 11:04:36', '2020-01-15 11:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `studentgroups`
--

CREATE TABLE `studentgroups` (
  `id` int(10) UNSIGNED NOT NULL,
  `maingroups_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `studentgroups`
--

INSERT INTO `studentgroups` (`id`, `maingroups_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Course A', '2020-01-15 11:38:37', '2020-01-15 11:38:37', NULL),
(2, 2, 'Course B', '2020-01-15 11:39:11', '2020-01-15 11:39:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `studentgroups_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `studentgroups_id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, 'Akash Kumar', '2020-01-15 11:39:24', '2020-01-15 11:39:24', NULL),
(2, 2, 'Mayank Pathak', '2020-01-15 12:23:54', '2020-01-15 12:23:54', NULL),
(3, 1, 'abc', '2020-01-15 12:28:04', '2020-01-15 12:28:04', NULL),
(4, 1, 'test', '2020-01-15 13:18:02', '2020-01-15 13:18:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 1, 'admin', 'mayankkv1@gmail.com', '$2y$10$qxHdWrY8WmVZwzy6x4fjROIuOiV3aL7.p/q4U.R.Jch0iSUH13ezu', NULL, '2020-01-15 11:05:16', '2020-01-15 11:05:16');

-- --------------------------------------------------------

--
-- Table structure for table `users_logs`
--

CREATE TABLE `users_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_logs`
--

INSERT INTO `users_logs` (`id`, `user_id`, `action`, `action_model`, `action_id`, `created_at`, `updated_at`) VALUES
(1, 1, 'updated', 'users', 1, '2020-01-09 12:49:56', '2020-01-09 12:49:56'),
(2, 1, 'updated', 'users', 1, '2020-01-09 12:52:29', '2020-01-09 12:52:29'),
(3, 1, 'updated', 'users', 1, '2020-01-09 12:53:05', '2020-01-09 12:53:05'),
(4, 1, 'updated', 'users', 1, '2020-01-09 13:21:41', '2020-01-09 13:21:41'),
(5, 1, 'updated', 'users', 1, '2020-01-15 11:02:30', '2020-01-15 11:02:30'),
(6, 3, 'created', 'maingroups', 1, '2020-01-15 11:19:15', '2020-01-15 11:19:15'),
(7, 3, 'created', 'maingroups', 2, '2020-01-15 11:38:24', '2020-01-15 11:38:24'),
(8, 3, 'created', 'studentgroups', 1, '2020-01-15 11:38:37', '2020-01-15 11:38:37'),
(9, 3, 'created', 'studentgroups', 2, '2020-01-15 11:39:12', '2020-01-15 11:39:12'),
(10, 3, 'created', 'students', 1, '2020-01-15 11:39:24', '2020-01-15 11:39:24'),
(11, 3, 'created', 'students', 2, '2020-01-15 12:23:55', '2020-01-15 12:23:55'),
(12, 3, 'created', 'students', 3, '2020-01-15 12:28:04', '2020-01-15 12:28:04'),
(13, 3, 'created', 'students', 4, '2020-01-15 13:18:03', '2020-01-15 13:18:03'),
(14, 3, 'updated', 'maingroups', 1, '2020-01-15 13:23:02', '2020-01-15 13:23:02'),
(15, 3, 'updated', 'maingroups', 1, '2020-01-15 13:25:25', '2020-01-15 13:25:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `maingroups`
--
ALTER TABLE `maingroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_role`
--
ALTER TABLE `menu_role`
  ADD UNIQUE KEY `menu_role_menu_id_role_id_unique` (`menu_id`,`role_id`),
  ADD KEY `menu_role_menu_id_index` (`menu_id`),
  ADD KEY `menu_role_role_id_index` (`role_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `studentgroups`
--
ALTER TABLE `studentgroups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `users_logs`
--
ALTER TABLE `users_logs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `maingroups`
--
ALTER TABLE `maingroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `studentgroups`
--
ALTER TABLE `studentgroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_logs`
--
ALTER TABLE `users_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_role`
--
ALTER TABLE `menu_role`
  ADD CONSTRAINT `menu_role_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menu_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
