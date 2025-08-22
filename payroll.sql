-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 22, 2025 at 08:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apsystem`
--
CREATE DATABASE IF NOT EXISTS `apsystem` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `apsystem`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'serbermz', '$2y$10$U4/qPW2j25anqXV55md94uA07ZZ/lECSQPvaDYalJIX9Oxj7H4INy', 'Lyndon', 'Bermoy', 'profile youtube.jpg', '2018-04-30'),
(2, 'Admin', '$2y$12$vzMkSvfqrch38RyVBp4ABeKFqbe4XXGPrQ5xmLV9d5bZWG8IqIVw6', 'Ope', 'Opeyemi', 'profile youtube.jpg', '2025-08-05');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time_in` time NOT NULL,
  `status` int(1) NOT NULL,
  `time_out` time NOT NULL,
  `num_hr` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `time_in`, `status`, `time_out`, `num_hr`) VALUES
(87, 1, '2020-05-08', '01:40:51', 1, '00:00:00', 0),
(88, 3, '2025-08-10', '14:46:14', 0, '00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `cashadvance`
--

CREATE TABLE `cashadvance` (
  `id` int(11) NOT NULL,
  `date_advance` date NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cashadvance`
--

INSERT INTO `cashadvance` (`id`, `date_advance`, `employee_id`, `amount`) VALUES
(2, '2018-05-02', '1', 1000),
(3, '2018-05-02', '1', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` int(11) NOT NULL,
  `description` varchar(100) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `description`, `amount`) VALUES
(1, 'SSS', 100),
(2, 'Pagibig', 150),
(3, 'PhilHealth', 150);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `birthdate` date NOT NULL,
  `contact_info` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `position_id` int(11) NOT NULL,
  `schedule_id` int(11) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `employee_id`, `firstname`, `lastname`, `address`, `birthdate`, `contact_info`, `gender`, `position_id`, `schedule_id`, `photo`, `created_on`) VALUES
(1, 'ABC123456789', 'Lyndon', 'Bermoy', 'Surigao City', '2018-04-02', '09079373999', 'Male', 1, 2, 'profile youtube1.jpg', '2018-04-28'),
(3, 'DYE473869250', 'Jonah', 'Juarez', 'Surigao City', '1992-05-02', '09123456789', 'Female', 2, 2, 'IMG20231202120332_01.jpg', '2018-04-30');

-- --------------------------------------------------------

--
-- Table structure for table `overtime`
--

CREATE TABLE `overtime` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(15) NOT NULL,
  `hours` double NOT NULL,
  `rate` double NOT NULL,
  `date_overtime` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `overtime`
--

INSERT INTO `overtime` (`id`, `employee_id`, `hours`, `rate`, `date_overtime`) VALUES
(4, '3', 20, 100, '2025-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `description` varchar(150) NOT NULL,
  `rate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `description`, `rate`) VALUES
(1, 'Programmer', 100),
(2, 'Writer', 50),
(3, 'Admin Officer', 100);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `time_in` time NOT NULL,
  `time_out` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`id`, `time_in`, `time_out`) VALUES
(1, '07:00:00', '16:00:00'),
(2, '08:00:00', '17:00:00'),
(3, '09:00:00', '18:00:00'),
(4, '10:00:00', '19:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cashadvance`
--
ALTER TABLE `cashadvance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `overtime`
--
ALTER TABLE `overtime`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `cashadvance`
--
ALTER TABLE `cashadvance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `overtime`
--
ALTER TABLE `overtime`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `coopapp`
--
CREATE DATABASE IF NOT EXISTS `coopapp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `coopapp`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dividends`
--

CREATE TABLE `dividends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `distribution_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Testing', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `loan_type_id` bigint(20) UNSIGNED NOT NULL,
  `principal_amount` decimal(12,2) NOT NULL,
  `interest_amount` decimal(12,2) NOT NULL,
  `total_payable` decimal(12,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `application_date` date NOT NULL,
  `approval_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_repayment`
--

CREATE TABLE `loan_repayment` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `loan_id` bigint(20) UNSIGNED NOT NULL,
  `amount_paid` decimal(12,2) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--

CREATE TABLE `loan_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `interest_rate` decimal(5,2) NOT NULL,
  `max_duration_months` int(11) NOT NULL,
  `max_amount` decimal(12,2) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `othername` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `date_joined` date NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `photo_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_savings` decimal(15,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `member_id`, `surname`, `othername`, `email`, `phone`, `address`, `date_joined`, `status`, `photo_url`, `created_at`, `updated_at`, `total_savings`) VALUES
(1, 'MEM-0001', 'OLAYIWOLA', 'AKEEM OPEYEMI', 'talktohakeem@gmail.com', '0807636345', 'ABAT CENTRE ALAUSA SECRETARIAT IKEJA', '2025-08-02', 'Active', 'photo_url/ziF4w5ttESCHQFr3bcGe5NWkrPX4VkB9KDyFBQbc.jpg', '2025-07-19 17:12:12', '2025-08-04 09:32:59', 201800.00),
(3, 'MEM-0002', 'Adeleke', 'Adekunle', 'talktohakeem2@gmail.com', '08030670812', 'ABAT CENTRE ALAUSA SECRETARIAT IKEJA', '1970-01-01', 'Active', 'photo_url/T8bevMIWGQeO72txIZi13gypgSUNdq0iaTln35lW.jpg', '2025-07-21 15:15:39', '2025-08-02 16:57:02', 100000.00),
(5, 'MEM-0005', 'Ajelogun', 'Adekunle', 'aje@yahoo.com', '080272728282', 'Testing', '2017-11-04', 'Active', 'members/1753460025.jpg', '2025-07-25 15:13:45', '2025-07-25 15:13:45', 0.00),
(6, 'MEM-0006', 'Olaleye', 'kunle', 'test@yahoo.com', '07045983314', 'Testing', '2025-07-25', 'Active', 'members/1753462308.jpg', '2025-07-25 15:51:48', '2025-07-25 16:18:11', 0.00),
(7, 'MEM-0007', 'Olawale', 'Saraki Bukola', 'testre@yahoo.com', '08030670812', 'Address 2', '2025-07-25', 'Active', 'members/1753463242.jpg', '2025-07-25 16:07:22', '2025-07-25 16:07:22', 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_05_02_190057_create_members_table', 1),
(5, '2025_05_02_190612_create_savings_table', 1),
(6, '2025_05_02_190803_create_loan_types_table', 1),
(7, '2025_05_02_192415_create_loan_table', 1),
(8, '2025_05_02_192538_create_loan_repayment_table', 2),
(9, '2025_05_02_195713_create_dividends_table', 2),
(10, '2025_05_02_195818_create_transactions_log_table', 2),
(11, '2025_05_03_123127_modify_full_name_column_in_members_table', 2),
(12, '2025_05_03_123608_modify_full_name_column_in_members_table', 2),
(13, '2025_05_03_124049_drop_full_name_column_from_members_table', 2),
(14, '2025_05_03_125408_add_surname_to_members_table', 3),
(15, '2025_05_03_141547_add_othername_to_members_table', 3),
(16, '2025_05_17_122938_add_bank_reference_no_to_savings_table', 3),
(17, '2025_05_20_164650_alter_transaction_type_in_savings_table', 3),
(18, '2025_05_20_170904_alter_transaction_date_in_savings_table', 3),
(19, '2025_07_16_170142_add_status_to_savings_table', 3),
(20, '2025_07_18_201727_add_default_to_role_in_users_table', 3),
(21, '2025_07_24_151848_add_total_savinds_to_members_table', 4),
(22, '2025_07_27_144554_create_items_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `savings`
--

CREATE TABLE `savings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `bank_reference_no` varchar(255) DEFAULT NULL,
  `transaction_date` date NOT NULL,
  `remarks` text DEFAULT NULL,
  `status` enum('pending','success','reverse') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `savings`
--

INSERT INTO `savings` (`id`, `member_id`, `amount`, `transaction_type`, `bank_reference_no`, `transaction_date`, `remarks`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 600.00, 'Deposit', NULL, '1970-01-01', 'Monthly savings', 'success', '2025-07-20 06:03:02', '2025-08-04 09:32:58'),
(3, 1, 600.00, 'Deposit', NULL, '2025-07-20', 'Monthly savings', 'success', '2025-07-20 06:07:39', '2025-08-02 16:56:38'),
(4, 3, 1000000.00, 'Withdrawal', NULL, '2025-07-21', 'Monthly savings', 'reverse', '2025-07-21 15:16:43', '2025-08-02 16:57:02'),
(5, 1, 600.00, 'Withdrawal', NULL, '2025-07-24', 'Monthly savings', 'success', '2025-07-24 15:49:25', '2025-07-24 15:50:18'),
(6, 3, 100000.00, 'Deposit', NULL, '2025-07-24', 'Monthly savings', 'success', '2025-07-24 15:50:10', '2025-07-24 15:52:59'),
(7, 1, 200000.00, 'Deposit', NULL, '2025-07-24', 'Monthly savings', 'success', '2025-07-24 15:55:25', '2025-07-24 15:55:32'),
(8, 1, 1000.00, 'Deposit', NULL, '2025-07-25', 'Monthly savings', 'pending', '2025-07-24 16:20:01', '2025-07-24 16:20:01');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('au9w75vSnV0wJEMd9YPWNwlBeelQWOE1HQxLhAJ8', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid1loZ2ZYMzYzSjJINW1oRE9pY1d4MW1MazY3V3pnQVoxUElQT3h0eCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9zYXZpbmdzIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1754243940),
('XGAhmmJvUeiaVhQkQ3GlgdTKZwzgGJn4Kw1W2HDT', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRnVrZjFIS1FidEI4S2xRT1FzOTMzV3M4STRBdmZaNkFOOEVDSk1uZCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvbWVtYmVycyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1754306927);

-- --------------------------------------------------------

--
-- Table structure for table `transactions_log`
--

CREATE TABLE `transactions_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_type` varchar(255) NOT NULL,
  `reference_id` bigint(20) UNSIGNED DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `transaction_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL DEFAULT 'admin',
  `last_login` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `last_login`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Adesola', 'test@yahoo.com', NULL, '$2y$12$vzMkSvfqrch38RyVBp4ABeKFqbe4XXGPrQ5xmLV9d5bZWG8IqIVw6', 'admin', NULL, NULL, '2025-07-19 16:41:13', '2025-07-19 16:41:13');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `dividends`
--
ALTER TABLE `dividends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dividends_member_id_foreign` (`member_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `loan_member_id_foreign` (`member_id`),
  ADD KEY `loan_loan_type_id_foreign` (`loan_type_id`);

--
-- Indexes for table `loan_repayment`
--
ALTER TABLE `loan_repayment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `loan_types`
--
ALTER TABLE `loan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_member_id_unique` (`member_id`),
  ADD UNIQUE KEY `members_email_unique` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `savings`
--
ALTER TABLE `savings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `savings_member_id_foreign` (`member_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `transactions_log`
--
ALTER TABLE `transactions_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_log_member_id_foreign` (`member_id`),
  ADD KEY `transactions_log_created_by_foreign` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dividends`
--
ALTER TABLE `dividends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan`
--
ALTER TABLE `loan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_repayment`
--
ALTER TABLE `loan_repayment`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loan_types`
--
ALTER TABLE `loan_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `savings`
--
ALTER TABLE `savings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transactions_log`
--
ALTER TABLE `transactions_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dividends`
--
ALTER TABLE `dividends`
  ADD CONSTRAINT `dividends_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_loan_type_id_foreign` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `loan_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `savings`
--
ALTER TABLE `savings`
  ADD CONSTRAINT `savings_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions_log`
--
ALTER TABLE `transactions_log`
  ADD CONSTRAINT `transactions_log_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `transactions_log_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE;
--
-- Database: `emis`
--
CREATE DATABASE IF NOT EXISTS `emis` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `emis`;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--
-- Error reading structure for table emis.cache: #1932 - Table &#039;emis.cache&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.cache: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`cache`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--
-- Error reading structure for table emis.cache_locks: #1932 - Table &#039;emis.cache_locks&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.cache_locks: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`cache_locks`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `centres`
--
-- Error reading structure for table emis.centres: #1932 - Table &#039;emis.centres&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.centres: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`centres`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--
-- Error reading structure for table emis.failed_jobs: #1932 - Table &#039;emis.failed_jobs&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.failed_jobs: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`failed_jobs`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--
-- Error reading structure for table emis.jobs: #1932 - Table &#039;emis.jobs&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.jobs: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`jobs`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--
-- Error reading structure for table emis.job_batches: #1932 - Table &#039;emis.job_batches&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.job_batches: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`job_batches`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--
-- Error reading structure for table emis.migrations: #1932 - Table &#039;emis.migrations&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.migrations: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`migrations`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--
-- Error reading structure for table emis.password_reset_tokens: #1932 - Table &#039;emis.password_reset_tokens&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.password_reset_tokens: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`password_reset_tokens`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `products`
--
-- Error reading structure for table emis.products: #1932 - Table &#039;emis.products&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.products: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`products`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--
-- Error reading structure for table emis.sessions: #1932 - Table &#039;emis.sessions&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.sessions: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`sessions`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Error reading structure for table emis.users: #1932 - Table &#039;emis.users&#039; doesn&#039;t exist in engine
-- Error reading data for table emis.users: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `emis`.`users`&#039; at line 1
--
-- Database: `lasconpay`
--
CREATE DATABASE IF NOT EXISTS `lasconpay` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `lasconpay`;
--
-- Database: `loan_db`
--
CREATE DATABASE IF NOT EXISTS `loan_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `loan_db`;

-- --------------------------------------------------------

--
-- Table structure for table `borrowers`
--
-- Error reading structure for table loan_db.borrowers: #1932 - Table &#039;loan_db.borrowers&#039; doesn&#039;t exist in engine
-- Error reading data for table loan_db.borrowers: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `loan_db`.`borrowers`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `loan_list`
--
-- Error reading structure for table loan_db.loan_list: #1932 - Table &#039;loan_db.loan_list&#039; doesn&#039;t exist in engine
-- Error reading data for table loan_db.loan_list: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `loan_db`.`loan_list`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `loan_plan`
--
-- Error reading structure for table loan_db.loan_plan: #1932 - Table &#039;loan_db.loan_plan&#039; doesn&#039;t exist in engine
-- Error reading data for table loan_db.loan_plan: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `loan_db`.`loan_plan`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `loan_schedules`
--
-- Error reading structure for table loan_db.loan_schedules: #1932 - Table &#039;loan_db.loan_schedules&#039; doesn&#039;t exist in engine
-- Error reading data for table loan_db.loan_schedules: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `loan_db`.`loan_schedules`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `loan_types`
--
-- Error reading structure for table loan_db.loan_types: #1932 - Table &#039;loan_db.loan_types&#039; doesn&#039;t exist in engine
-- Error reading data for table loan_db.loan_types: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `loan_db`.`loan_types`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--
-- Error reading structure for table loan_db.payments: #1932 - Table &#039;loan_db.payments&#039; doesn&#039;t exist in engine
-- Error reading data for table loan_db.payments: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `loan_db`.`payments`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `users`
--
-- Error reading structure for table loan_db.users: #1932 - Table &#039;loan_db.users&#039; doesn&#039;t exist in engine
-- Error reading data for table loan_db.users: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `loan_db`.`users`&#039; at line 1
--
-- Database: `med-funddb`
--
CREATE DATABASE IF NOT EXISTS `med-funddb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `med-funddb`;

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_actions`
--
-- Error reading structure for table med-funddb.wp_actionscheduler_actions: #1932 - Table &#039;med-funddb.wp_actionscheduler_actions&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_actionscheduler_actions: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_actionscheduler_actions`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_claims`
--
-- Error reading structure for table med-funddb.wp_actionscheduler_claims: #1932 - Table &#039;med-funddb.wp_actionscheduler_claims&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_actionscheduler_claims: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_actionscheduler_claims`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_groups`
--
-- Error reading structure for table med-funddb.wp_actionscheduler_groups: #1932 - Table &#039;med-funddb.wp_actionscheduler_groups&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_actionscheduler_groups: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_actionscheduler_groups`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_actionscheduler_logs`
--
-- Error reading structure for table med-funddb.wp_actionscheduler_logs: #1932 - Table &#039;med-funddb.wp_actionscheduler_logs&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_actionscheduler_logs: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_actionscheduler_logs`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_charitable_campaign_activities`
--
-- Error reading structure for table med-funddb.wp_charitable_campaign_activities: #1932 - Table &#039;med-funddb.wp_charitable_campaign_activities&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_charitable_campaign_activities: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_charitable_campaign_activities`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_charitable_campaign_donations`
--
-- Error reading structure for table med-funddb.wp_charitable_campaign_donations: #1932 - Table &#039;med-funddb.wp_charitable_campaign_donations&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_charitable_campaign_donations: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_charitable_campaign_donations`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_charitable_donation_activities`
--
-- Error reading structure for table med-funddb.wp_charitable_donation_activities: #1932 - Table &#039;med-funddb.wp_charitable_donation_activities&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_charitable_donation_activities: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_charitable_donation_activities`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_charitable_donormeta`
--
-- Error reading structure for table med-funddb.wp_charitable_donormeta: #1932 - Table &#039;med-funddb.wp_charitable_donormeta&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_charitable_donormeta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_charitable_donormeta`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_charitable_donors`
--
-- Error reading structure for table med-funddb.wp_charitable_donors: #1932 - Table &#039;med-funddb.wp_charitable_donors&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_charitable_donors: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_charitable_donors`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_commentmeta`
--
-- Error reading structure for table med-funddb.wp_commentmeta: #1932 - Table &#039;med-funddb.wp_commentmeta&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_commentmeta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_commentmeta`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_comments`
--
-- Error reading structure for table med-funddb.wp_comments: #1932 - Table &#039;med-funddb.wp_comments&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_comments: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_comments`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_duplicator_packages`
--
-- Error reading structure for table med-funddb.wp_duplicator_packages: #1932 - Table &#039;med-funddb.wp_duplicator_packages&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_duplicator_packages: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_duplicator_packages`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_e_events`
--
-- Error reading structure for table med-funddb.wp_e_events: #1932 - Table &#039;med-funddb.wp_e_events&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_e_events: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_e_events`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_links`
--
-- Error reading structure for table med-funddb.wp_links: #1932 - Table &#039;med-funddb.wp_links&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_links: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_links`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_options`
--
-- Error reading structure for table med-funddb.wp_options: #1932 - Table &#039;med-funddb.wp_options&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_options: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_options`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_postmeta`
--
-- Error reading structure for table med-funddb.wp_postmeta: #1932 - Table &#039;med-funddb.wp_postmeta&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_postmeta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_postmeta`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_posts`
--
-- Error reading structure for table med-funddb.wp_posts: #1932 - Table &#039;med-funddb.wp_posts&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_posts: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_posts`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_tec_events`
--
-- Error reading structure for table med-funddb.wp_tec_events: #1932 - Table &#039;med-funddb.wp_tec_events&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_tec_events: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_tec_events`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_tec_occurrences`
--
-- Error reading structure for table med-funddb.wp_tec_occurrences: #1932 - Table &#039;med-funddb.wp_tec_occurrences&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_tec_occurrences: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_tec_occurrences`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_termmeta`
--
-- Error reading structure for table med-funddb.wp_termmeta: #1932 - Table &#039;med-funddb.wp_termmeta&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_termmeta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_termmeta`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_terms`
--
-- Error reading structure for table med-funddb.wp_terms: #1932 - Table &#039;med-funddb.wp_terms&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_terms: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_terms`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_relationships`
--
-- Error reading structure for table med-funddb.wp_term_relationships: #1932 - Table &#039;med-funddb.wp_term_relationships&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_term_relationships: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_term_relationships`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_term_taxonomy`
--
-- Error reading structure for table med-funddb.wp_term_taxonomy: #1932 - Table &#039;med-funddb.wp_term_taxonomy&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_term_taxonomy: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_term_taxonomy`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_usermeta`
--
-- Error reading structure for table med-funddb.wp_usermeta: #1932 - Table &#039;med-funddb.wp_usermeta&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_usermeta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_usermeta`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_users`
--
-- Error reading structure for table med-funddb.wp_users: #1932 - Table &#039;med-funddb.wp_users&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_users: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_users`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_admin_notes`
--
-- Error reading structure for table med-funddb.wp_wc_admin_notes: #1932 - Table &#039;med-funddb.wp_wc_admin_notes&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_admin_notes: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_admin_notes`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_admin_note_actions`
--
-- Error reading structure for table med-funddb.wp_wc_admin_note_actions: #1932 - Table &#039;med-funddb.wp_wc_admin_note_actions&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_admin_note_actions: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_admin_note_actions`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_category_lookup`
--
-- Error reading structure for table med-funddb.wp_wc_category_lookup: #1932 - Table &#039;med-funddb.wp_wc_category_lookup&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_category_lookup: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_category_lookup`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_customer_lookup`
--
-- Error reading structure for table med-funddb.wp_wc_customer_lookup: #1932 - Table &#039;med-funddb.wp_wc_customer_lookup&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_customer_lookup: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_customer_lookup`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_download_log`
--
-- Error reading structure for table med-funddb.wp_wc_download_log: #1932 - Table &#039;med-funddb.wp_wc_download_log&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_download_log: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_download_log`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_orders`
--
-- Error reading structure for table med-funddb.wp_wc_orders: #1932 - Table &#039;med-funddb.wp_wc_orders&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_orders: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_orders`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_orders_meta`
--
-- Error reading structure for table med-funddb.wp_wc_orders_meta: #1932 - Table &#039;med-funddb.wp_wc_orders_meta&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_orders_meta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_orders_meta`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_addresses`
--
-- Error reading structure for table med-funddb.wp_wc_order_addresses: #1932 - Table &#039;med-funddb.wp_wc_order_addresses&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_order_addresses: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_order_addresses`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_coupon_lookup`
--
-- Error reading structure for table med-funddb.wp_wc_order_coupon_lookup: #1932 - Table &#039;med-funddb.wp_wc_order_coupon_lookup&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_order_coupon_lookup: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_order_coupon_lookup`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_operational_data`
--
-- Error reading structure for table med-funddb.wp_wc_order_operational_data: #1932 - Table &#039;med-funddb.wp_wc_order_operational_data&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_order_operational_data: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_order_operational_data`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_product_lookup`
--
-- Error reading structure for table med-funddb.wp_wc_order_product_lookup: #1932 - Table &#039;med-funddb.wp_wc_order_product_lookup&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_order_product_lookup: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_order_product_lookup`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_stats`
--
-- Error reading structure for table med-funddb.wp_wc_order_stats: #1932 - Table &#039;med-funddb.wp_wc_order_stats&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_order_stats: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_order_stats`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_order_tax_lookup`
--
-- Error reading structure for table med-funddb.wp_wc_order_tax_lookup: #1932 - Table &#039;med-funddb.wp_wc_order_tax_lookup&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_order_tax_lookup: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_order_tax_lookup`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_product_attributes_lookup`
--
-- Error reading structure for table med-funddb.wp_wc_product_attributes_lookup: #1932 - Table &#039;med-funddb.wp_wc_product_attributes_lookup&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_product_attributes_lookup: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_product_attributes_lookup`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_product_download_directories`
--
-- Error reading structure for table med-funddb.wp_wc_product_download_directories: #1932 - Table &#039;med-funddb.wp_wc_product_download_directories&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_product_download_directories: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_product_download_directories`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_product_meta_lookup`
--
-- Error reading structure for table med-funddb.wp_wc_product_meta_lookup: #1932 - Table &#039;med-funddb.wp_wc_product_meta_lookup&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_product_meta_lookup: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_product_meta_lookup`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_rate_limits`
--
-- Error reading structure for table med-funddb.wp_wc_rate_limits: #1932 - Table &#039;med-funddb.wp_wc_rate_limits&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_rate_limits: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_rate_limits`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_reserved_stock`
--
-- Error reading structure for table med-funddb.wp_wc_reserved_stock: #1932 - Table &#039;med-funddb.wp_wc_reserved_stock&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_reserved_stock: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_reserved_stock`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_tax_rate_classes`
--
-- Error reading structure for table med-funddb.wp_wc_tax_rate_classes: #1932 - Table &#039;med-funddb.wp_wc_tax_rate_classes&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_tax_rate_classes: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_tax_rate_classes`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_wc_webhooks`
--
-- Error reading structure for table med-funddb.wp_wc_webhooks: #1932 - Table &#039;med-funddb.wp_wc_webhooks&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_wc_webhooks: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_wc_webhooks`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_api_keys`
--
-- Error reading structure for table med-funddb.wp_woocommerce_api_keys: #1932 - Table &#039;med-funddb.wp_woocommerce_api_keys&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_api_keys: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_api_keys`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_attribute_taxonomies`
--
-- Error reading structure for table med-funddb.wp_woocommerce_attribute_taxonomies: #1932 - Table &#039;med-funddb.wp_woocommerce_attribute_taxonomies&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_attribute_taxonomies: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_attribute_taxonomies`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_downloadable_product_permissions`
--
-- Error reading structure for table med-funddb.wp_woocommerce_downloadable_product_permissions: #1932 - Table &#039;med-funddb.wp_woocommerce_downloadable_product_permissions&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_downloadable_product_permissions: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_downloadable_product_permissions`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_log`
--
-- Error reading structure for table med-funddb.wp_woocommerce_log: #1932 - Table &#039;med-funddb.wp_woocommerce_log&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_log: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_log`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_itemmeta`
--
-- Error reading structure for table med-funddb.wp_woocommerce_order_itemmeta: #1932 - Table &#039;med-funddb.wp_woocommerce_order_itemmeta&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_order_itemmeta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_order_itemmeta`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_order_items`
--
-- Error reading structure for table med-funddb.wp_woocommerce_order_items: #1932 - Table &#039;med-funddb.wp_woocommerce_order_items&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_order_items: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_order_items`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_payment_tokenmeta`
--
-- Error reading structure for table med-funddb.wp_woocommerce_payment_tokenmeta: #1932 - Table &#039;med-funddb.wp_woocommerce_payment_tokenmeta&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_payment_tokenmeta: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_payment_tokenmeta`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_payment_tokens`
--
-- Error reading structure for table med-funddb.wp_woocommerce_payment_tokens: #1932 - Table &#039;med-funddb.wp_woocommerce_payment_tokens&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_payment_tokens: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_payment_tokens`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_sessions`
--
-- Error reading structure for table med-funddb.wp_woocommerce_sessions: #1932 - Table &#039;med-funddb.wp_woocommerce_sessions&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_sessions: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_sessions`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zones`
--
-- Error reading structure for table med-funddb.wp_woocommerce_shipping_zones: #1932 - Table &#039;med-funddb.wp_woocommerce_shipping_zones&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_shipping_zones: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_shipping_zones`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zone_locations`
--
-- Error reading structure for table med-funddb.wp_woocommerce_shipping_zone_locations: #1932 - Table &#039;med-funddb.wp_woocommerce_shipping_zone_locations&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_shipping_zone_locations: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_shipping_zone_locations`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_shipping_zone_methods`
--
-- Error reading structure for table med-funddb.wp_woocommerce_shipping_zone_methods: #1932 - Table &#039;med-funddb.wp_woocommerce_shipping_zone_methods&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_shipping_zone_methods: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_shipping_zone_methods`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rates`
--
-- Error reading structure for table med-funddb.wp_woocommerce_tax_rates: #1932 - Table &#039;med-funddb.wp_woocommerce_tax_rates&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_tax_rates: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_tax_rates`&#039; at line 1

-- --------------------------------------------------------

--
-- Table structure for table `wp_woocommerce_tax_rate_locations`
--
-- Error reading structure for table med-funddb.wp_woocommerce_tax_rate_locations: #1932 - Table &#039;med-funddb.wp_woocommerce_tax_rate_locations&#039; doesn&#039;t exist in engine
-- Error reading data for table med-funddb.wp_woocommerce_tax_rate_locations: #1064 - You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near &#039;FROM `med-funddb`.`wp_woocommerce_tax_rate_locations`&#039; at line 1
--
-- Database: `payroll`
--
CREATE DATABASE IF NOT EXISTS `payroll` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `payroll`;

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `id` int(30) NOT NULL,
  `allowance` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`id`, `allowance`, `description`) VALUES
(1, 'Book Reading', 'Book Reading Allowance'),
(2, 'Phone', 'Phone Allowance'),
(3, 'Hazard', 'Hazard Allowance'),
(4, 'House', 'House Allowance'),
(5, 'Transport', 'Transport Allowance'),
(6, 'Leave Bonus', 'Leave Bonus');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(20) NOT NULL,
  `log_type` tinyint(1) NOT NULL COMMENT '1 = AM IN,2 = AM out, 3= PM IN, 4= PM out\r\n',
  `datetime_log` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `log_type`, `datetime_log`, `date_updated`) VALUES
(10, 9, 1, '2020-09-16 08:00:00', '2020-09-29 16:16:57'),
(11, 9, 2, '2020-09-16 12:00:00', '2020-09-29 16:16:57'),
(12, 9, 3, '2020-09-16 13:00:00', '2020-09-29 16:16:57'),
(16, 9, 4, '2020-09-16 17:00:00', '2020-09-29 16:16:57'),
(17, 10, 1, '2025-07-01 07:00:00', '2025-08-06 18:02:41'),
(18, 10, 4, '2025-07-01 04:00:00', '2025-08-06 18:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `id` int(30) NOT NULL,
  `deduction` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`id`, `deduction`, `description`) VALUES
(1, 'Cash Advance', 'Cash Advance'),
(3, 'Union', 'Union Due Deduction');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'IT Department'),
(2, 'HR Department'),
(3, 'Accounting and Finance Department'),
(4, 'Infrastructure');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(20) NOT NULL,
  `employee_no` varchar(100) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `middlename` varchar(20) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `department_id` int(30) NOT NULL,
  `position_id` int(30) NOT NULL,
  `salary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `employee_no`, `firstname`, `middlename`, `lastname`, `gender`, `department_id`, `position_id`, `salary`) VALUES
(9, '2020-9838', 'John', 'Adewale', 'Smith', 'Male', 1, 1, 50000),
(10, '2025-7315', 'Olusola', 'Opeyemi', 'Adeleke', 'Male', 4, 6, 50000),
(11, '2025-5984', 'Olawale', 'Soji', 'Adekunle', 'Male', 4, 6, 60000),
(12, '2025-3844', 'OLAYIWOLA', 'AKEEM', 'OPEYEMI', 'Male', 1, 1, 70000),
(13, '2025-2106', 'Gabriel ', 'Ola', 'Samuel', 'Female', 3, 4, 70000),
(14, '2025-7325', 'Adeeko', 'Lukuman', 'Fola', 'Male', 2, 2, 50000),
(15, '2025-1334', 'Akinsola', 'Fatima', 'Ajoke', 'Female', 1, 1, 100000),
(16, '2025-6923', 'Adesola', 'Ajoke', 'Tola', 'Female', 4, 6, 60000);

-- --------------------------------------------------------

--
-- Table structure for table `employee_allowances`
--

CREATE TABLE `employee_allowances` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `allowance_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_allowances`
--

INSERT INTO `employee_allowances` (`id`, `employee_id`, `allowance_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(1, 9, 4, 1, 1000, '0000-00-00', '2020-09-29 11:20:04'),
(3, 9, 3, 2, 300, '0000-00-00', '2020-09-29 11:37:31'),
(5, 9, 1, 3, 1000, '2020-09-16', '2020-09-29 11:38:31'),
(6, 10, 1, 1, 5000, '0000-00-00', '2025-08-06 18:07:23'),
(7, 10, 3, 1, 10000, '0000-00-00', '2025-08-06 18:07:24'),
(8, 10, 4, 1, 5000, '0000-00-00', '2025-08-06 18:07:24'),
(9, 10, 5, 1, 5000, '0000-00-00', '2025-08-06 18:07:24'),
(10, 10, 2, 1, 2000, '0000-00-00', '2025-08-06 18:08:53'),
(11, 10, 6, 3, 10000, '2025-08-20', '2025-08-19 17:35:40'),
(12, 11, 6, 3, 10000, '2025-08-20', '2025-08-19 17:37:14'),
(13, 11, 3, 1, 5000, '0000-00-00', '2025-08-19 17:38:06'),
(14, 12, 3, 1, 5000, '0000-00-00', '2025-08-19 17:39:27'),
(16, 11, 4, 1, 3000, '0000-00-00', '2025-08-19 18:06:05'),
(17, 12, 1, 1, 2000, '0000-00-00', '2025-08-19 18:11:31'),
(20, 11, 5, 1, 5000, '0000-00-00', '2025-08-20 15:36:59'),
(21, 12, 6, 3, 20000, '2025-08-21', '2025-08-21 17:23:33'),
(22, 13, 1, 1, 5000, '0000-00-00', '2025-08-21 18:51:08'),
(23, 13, 3, 1, 6000, '0000-00-00', '2025-08-21 18:51:08'),
(24, 13, 6, 3, 20000, '2025-08-21', '2025-08-21 18:51:09'),
(25, 15, 3, 1, 5000, '0000-00-00', '2025-08-22 18:23:05'),
(26, 15, 6, 3, 10000, '2025-08-22', '2025-08-22 18:23:05'),
(27, 14, 3, 1, 5000, '0000-00-00', '2025-08-22 18:23:42'),
(28, 16, 3, 1, 5000, '0000-00-00', '2025-08-22 18:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `employee_deductions`
--

CREATE TABLE `employee_deductions` (
  `id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `deduction_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = Monthly, 2= Semi-Montly, 3 = once',
  `amount` float NOT NULL,
  `effective_date` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employee_deductions`
--

INSERT INTO `employee_deductions` (`id`, `employee_id`, `deduction_id`, `type`, `amount`, `effective_date`, `date_created`) VALUES
(3, 9, 1, 3, 1500, '2020-09-16', '2020-09-29 11:53:27'),
(4, 9, 3, 1, 200, '0000-00-00', '2025-08-06 17:53:46'),
(5, 10, 3, 1, 2000, '0000-00-00', '2025-08-06 18:07:43'),
(6, 10, 1, 1, 1000, '0000-00-00', '2025-08-06 18:08:32'),
(7, 11, 3, 1, 2000, '0000-00-00', '2025-08-19 17:37:43'),
(8, 12, 3, 1, 2000, '0000-00-00', '2025-08-19 17:42:01'),
(9, 13, 3, 1, 2000, '0000-00-00', '2025-08-21 18:51:29'),
(10, 14, 3, 1, 2000, '0000-00-00', '2025-08-22 18:23:54'),
(11, 16, 3, 1, 2000, '0000-00-00', '2025-08-22 18:25:30');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `id` int(11) NOT NULL,
  `gender` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`id`, `gender`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1 = monthly ,2 semi-monthly',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 =New,1 = computed',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll`
--

INSERT INTO `payroll` (`id`, `ref_no`, `date_from`, `date_to`, `type`, `status`, `date_created`) VALUES
(1, '2020-3543', '2020-09-16', '2020-09-30', 2, 1, '2020-09-29 15:04:13'),
(2, '2025-6991', '2025-07-01', '2025-07-31', 1, 1, '2025-08-06 17:46:04'),
(3, '2025-4101', '2025-06-01', '2025-06-30', 1, 1, '2025-08-08 17:47:07'),
(4, '2025-1826', '2025-05-01', '2025-05-31', 1, 1, '2025-08-14 16:00:49'),
(7, '2025-1820', '2025-08-01', '2025-08-31', 1, 1, '2025-08-21 17:24:56'),
(8, '2025-5954', '2025-08-22', '2025-08-31', 1, 1, '2025-08-22 18:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `payroll_items`
--

CREATE TABLE `payroll_items` (
  `id` int(30) NOT NULL,
  `payroll_id` int(30) NOT NULL,
  `employee_id` int(30) NOT NULL,
  `present` int(30) NOT NULL,
  `absent` int(10) NOT NULL,
  `late` text NOT NULL,
  `salary` double NOT NULL,
  `allowance_amount` double NOT NULL,
  `allowances` text NOT NULL,
  `deduction_amount` double NOT NULL,
  `deductions` text NOT NULL,
  `net` int(11) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payroll_items`
--

INSERT INTO `payroll_items` (`id`, `payroll_id`, `employee_id`, `present`, `absent`, `late`, `salary`, `allowance_amount`, `allowances`, `deduction_amount`, `deductions`, `net`, `date_created`) VALUES
(23, 2, 9, 0, 22, '0', 50000, 1000, '[{\"aid\":\"4\",\"amount\":\"1000\"}]', 200, '[{\"did\":\"3\",\"amount\":\"200\"}]', 50800, '2025-08-14 15:54:05'),
(25, 4, 9, 0, 22, '0', 50000, 1000, '[{\"aid\":\"4\",\"amount\":\"1000\"}]', 200, '[{\"did\":\"3\",\"amount\":\"200\"}]', 50800, '2025-08-14 16:01:28'),
(47, 5, 9, 0, 22, '0', 50000, 1000, '[{\"aid\":\"4\",\"amount\":\"1000\"}]', 200, '[{\"did\":\"3\",\"amount\":\"200\"}]', 50800, '2025-08-20 13:09:40'),
(49, 5, 11, 0, 22, '0', 60000, 8000, '[{\"aid\":\"3\",\"amount\":\"5000\"},{\"aid\":\"4\",\"amount\":\"3000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 66000, '2025-08-20 13:09:40'),
(50, 5, 12, 0, 22, '0', 70000, 12000, '[{\"aid\":\"3\",\"amount\":\"5000\"},{\"aid\":\"1\",\"amount\":\"2000\"},{\"aid\":\"6\",\"amount\":\"5000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 80000, '2025-08-20 13:09:40'),
(55, 6, 9, 0, 22, '0', 50000, 1000, '[{\"aid\":\"4\",\"amount\":\"1000\"}]', 200, '[{\"did\":\"3\",\"amount\":\"200\"}]', 50800, '2025-08-21 16:09:27'),
(57, 6, 11, 0, 22, '0', 60000, 23000, '[{\"aid\":\"6\",\"amount\":\"10000\"},{\"aid\":\"3\",\"amount\":\"5000\"},{\"aid\":\"4\",\"amount\":\"3000\"},{\"aid\":\"5\",\"amount\":\"5000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 81000, '2025-08-21 16:09:27'),
(58, 6, 12, 0, 22, '0', 70000, 13000, '[{\"aid\":\"3\",\"amount\":\"5000\"},{\"aid\":\"1\",\"amount\":\"2000\"},{\"aid\":\"5\",\"amount\":\"1000\"},{\"aid\":\"6\",\"amount\":\"5000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 81000, '2025-08-21 16:09:27'),
(63, 7, 9, 0, 22, '0', 50000, 1000, '[{\"aid\":\"4\",\"amount\":\"1000\"}]', 200, '[{\"did\":\"3\",\"amount\":\"200\"}]', 50800, '2025-08-21 18:52:11'),
(64, 7, 10, 0, 22, '0', 50000, 37000, '[{\"aid\":\"1\",\"amount\":\"5000\"},{\"aid\":\"3\",\"amount\":\"10000\"},{\"aid\":\"4\",\"amount\":\"5000\"},{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"2\",\"amount\":\"2000\"},{\"aid\":\"6\",\"amount\":\"10000\"}]', 3000, '[{\"did\":\"3\",\"amount\":\"2000\"},{\"did\":\"1\",\"amount\":\"1000\"}]', 84000, '2025-08-21 18:52:11'),
(65, 7, 11, 0, 22, '0', 60000, 23000, '[{\"aid\":\"6\",\"amount\":\"10000\"},{\"aid\":\"3\",\"amount\":\"5000\"},{\"aid\":\"4\",\"amount\":\"3000\"},{\"aid\":\"5\",\"amount\":\"5000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 81000, '2025-08-21 18:52:11'),
(66, 7, 12, 0, 22, '0', 70000, 27000, '[{\"aid\":\"3\",\"amount\":\"5000\"},{\"aid\":\"1\",\"amount\":\"2000\"},{\"aid\":\"6\",\"amount\":\"20000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 95000, '2025-08-21 18:52:11'),
(67, 7, 13, 0, 22, '0', 70000, 31000, '[{\"aid\":\"1\",\"amount\":\"5000\"},{\"aid\":\"3\",\"amount\":\"6000\"},{\"aid\":\"6\",\"amount\":\"20000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 99000, '2025-08-21 18:52:11'),
(68, 8, 9, 0, 22, '0', 50000, 1000, '[{\"aid\":\"4\",\"amount\":\"1000\"}]', 200, '[{\"did\":\"3\",\"amount\":\"200\"}]', 50800, '2025-08-22 18:26:11'),
(69, 8, 10, 0, 22, '0', 50000, 27000, '[{\"aid\":\"1\",\"amount\":\"5000\"},{\"aid\":\"3\",\"amount\":\"10000\"},{\"aid\":\"4\",\"amount\":\"5000\"},{\"aid\":\"5\",\"amount\":\"5000\"},{\"aid\":\"2\",\"amount\":\"2000\"}]', 3000, '[{\"did\":\"3\",\"amount\":\"2000\"},{\"did\":\"1\",\"amount\":\"1000\"}]', 74000, '2025-08-22 18:26:11'),
(70, 8, 11, 0, 22, '0', 60000, 13000, '[{\"aid\":\"3\",\"amount\":\"5000\"},{\"aid\":\"4\",\"amount\":\"3000\"},{\"aid\":\"5\",\"amount\":\"5000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 71000, '2025-08-22 18:26:11'),
(71, 8, 12, 0, 22, '0', 70000, 7000, '[{\"aid\":\"3\",\"amount\":\"5000\"},{\"aid\":\"1\",\"amount\":\"2000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 75000, '2025-08-22 18:26:11'),
(72, 8, 13, 0, 22, '0', 70000, 11000, '[{\"aid\":\"1\",\"amount\":\"5000\"},{\"aid\":\"3\",\"amount\":\"6000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 79000, '2025-08-22 18:26:12'),
(73, 8, 14, 0, 22, '0', 50000, 5000, '[{\"aid\":\"3\",\"amount\":\"5000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 53000, '2025-08-22 18:26:12'),
(74, 8, 15, 0, 22, '0', 100000, 15000, '[{\"aid\":\"3\",\"amount\":\"5000\"},{\"aid\":\"6\",\"amount\":\"10000\"}]', 0, '[]', 115000, '2025-08-22 18:26:12'),
(75, 8, 16, 0, 22, '0', 60000, 5000, '[{\"aid\":\"3\",\"amount\":\"5000\"}]', 2000, '[{\"did\":\"3\",\"amount\":\"2000\"}]', 63000, '2025-08-22 18:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(30) NOT NULL,
  `department_id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `department_id`, `name`) VALUES
(1, 1, 'Programmer'),
(2, 2, 'HR Supervisor'),
(4, 3, 'Accounting Clerk'),
(6, 4, 'Computer Engineer');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `doctor_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `address` text NOT NULL,
  `contact` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `doctor_id`, `name`, `address`, `contact`, `username`, `password`, `type`) VALUES
(1, 0, 'Administrator', '', '', 'admin', 'admin123', 1),
(2, 0, 'Ade', '', '', 'Tester', 'Test1', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
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
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employee_allowances`
--
ALTER TABLE `employee_allowances`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `employee_deductions`
--
ALTER TABLE `employee_deductions`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `gender`
--
ALTER TABLE `gender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payroll_items`
--
ALTER TABLE `payroll_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"payroll\",\"table\":\"gender\"},{\"db\":\"payroll\",\"table\":\"employee\"},{\"db\":\"payroll\",\"table\":\"payroll_items\"},{\"db\":\"payroll\",\"table\":\"payroll\"},{\"db\":\"payroll\",\"table\":\"employee_allowances\"},{\"db\":\"payroll\",\"table\":\"deductions\"},{\"db\":\"payroll\",\"table\":\"allowances\"},{\"db\":\"payroll\",\"table\":\"attendance\"},{\"db\":\"payroll\",\"table\":\"users\"},{\"db\":\"apsystem\",\"table\":\"admin\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2025-08-22 18:35:35', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
