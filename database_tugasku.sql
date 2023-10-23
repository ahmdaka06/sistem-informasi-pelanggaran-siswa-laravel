-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for project__sistem-informasi-pelanggaran-siswa-laravel
CREATE DATABASE IF NOT EXISTS `project__sistem-informasi-pelanggaran-siswa-laravel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `project__sistem-informasi-pelanggaran-siswa-laravel`;

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('super-admin','admin') COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admins_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.admins: ~0 rows (approximately)
DELETE FROM `admins`;
INSERT INTO `admins` (`id`, `full_name`, `username`, `password`, `role`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'Super Admin1999', 'superadmin1999', '$2y$10$Ie5yBamqJ40wt72pIqwtP.ymd7g0rXYXz9j7ocLioKq7W7U4EXVpa', 'super-admin', NULL, 1, '2023-10-23 10:39:50', '2023-10-23 10:39:50');

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.class_lists
CREATE TABLE IF NOT EXISTS `class_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint unsigned DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.class_lists: ~0 rows (approximately)
DELETE FROM `class_lists`;
INSERT INTO `class_lists` (`id`, `teacher_id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, NULL, '10 RPL 1', 1, NULL, NULL),
	(2, NULL, '10 RPL 2', 1, NULL, NULL),
	(3, NULL, '11 RPL 1', 1, NULL, NULL),
	(4, NULL, '11 RPL 2', 1, NULL, NULL),
	(5, NULL, '12 RPL 1', 1, NULL, NULL),
	(6, NULL, '12 RPL 2', 1, NULL, NULL);

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.failed_jobs: ~0 rows (approximately)
DELETE FROM `failed_jobs`;

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.migrations: ~0 rows (approximately)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2021_01_24_083237_create_sessions_table', 1),
	(7, '2022_01_15_055523_create_admins_table', 1),
	(8, '2022_01_15_060144_create_students_table', 1),
	(9, '2022_01_15_061109_create_class_lists_table', 1),
	(10, '2022_01_15_061306_create_teachers_table', 1),
	(11, '2022_01_15_071747_create_violation_categories_table', 1),
	(12, '2022_01_15_071803_create_violation_lists_table', 1),
	(13, '2022_01_15_073014_create_student_parents_table', 1),
	(14, '2022_02_14_072542_create_website_configs_table', 1);

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.personal_access_tokens: ~0 rows (approximately)
DELETE FROM `personal_access_tokens`;

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.sessions: ~0 rows (approximately)
DELETE FROM `sessions`;

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.students
CREATE TABLE IF NOT EXISTS `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` bigint unsigned DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('l','p') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8mb4_unicode_ci,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `students_email_unique` (`email`),
  UNIQUE KEY `students_identity_number_unique` (`identity_number`),
  UNIQUE KEY `students_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.students: ~0 rows (approximately)
DELETE FROM `students`;
INSERT INTO `students` (`id`, `class_id`, `email`, `identity_number`, `full_name`, `username`, `password`, `gender`, `address`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 1, 'student@gmail.com', '1', 'siswa1', 'siswa1', 'siswa1', 'l', NULL, NULL, NULL, 1, NULL, NULL),
	(2, 1, 'studen2@gmail.com', '2', 'siswa2', 'siswa2', 'siswa2', 'p', NULL, NULL, NULL, 1, NULL, NULL),
	(3, 2, 'student3@gmail.com', '3', 'siswa3', 'siswa3', 'siswa3', 'l', NULL, NULL, NULL, 1, NULL, NULL);

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.student_parents
CREATE TABLE IF NOT EXISTS `student_parents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.student_parents: ~0 rows (approximately)
DELETE FROM `student_parents`;

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.teachers
CREATE TABLE IF NOT EXISTS `teachers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identity_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teachers_email_unique` (`email`),
  UNIQUE KEY `teachers_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.teachers: ~0 rows (approximately)
DELETE FROM `teachers`;
INSERT INTO `teachers` (`id`, `full_name`, `identity_number`, `email`, `username`, `password`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'guru1', '72684', 'guru1@gmail.com', 'guru1', '$2y$10$7c5WN2Q/tejf68N0qotkP.Ybt5Mle3BkdQcClRWpEhTe6mOd/4nmu', '08976655', NULL, 1, '2023-10-23 12:43:46', '2023-10-23 12:43:46');

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.users: ~0 rows (approximately)
DELETE FROM `users`;

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.violation_categories
CREATE TABLE IF NOT EXISTS `violation_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.violation_categories: ~0 rows (approximately)
DELETE FROM `violation_categories`;
INSERT INTO `violation_categories` (`id`, `name`, `point`, `created_at`, `updated_at`) VALUES
	(1, 'merokok', 10, '2023-10-23 12:49:47', '2023-10-23 12:49:48'),
	(2, 'terlambat datang', 5, '2023-10-23 12:50:04', '2023-10-23 12:50:04'),
	(3, 'bolos sekolah', 20, '2023-10-23 12:50:25', '2023-10-23 12:50:26');

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.violation_lists
CREATE TABLE IF NOT EXISTS `violation_lists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `violation_category_id` bigint unsigned NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `class_id` bigint unsigned DEFAULT NULL,
  `student_parent_id` bigint unsigned DEFAULT NULL,
  `report_by` enum('student','teacher') COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_at` timestamp NULL DEFAULT NULL,
  `note` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_proof` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` enum('pending','confirm','reject') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.violation_lists: ~0 rows (approximately)
DELETE FROM `violation_lists`;
INSERT INTO `violation_lists` (`id`, `violation_category_id`, `student_id`, `class_id`, `student_parent_id`, `report_by`, `report_at`, `note`, `photo_proof`, `status`, `created_at`, `updated_at`) VALUES
	(1, 1, 1, 1, NULL, 'teacher', NULL, 'harus diingatkan', NULL, 'pending', NULL, NULL);

-- Dumping structure for table project__sistem-informasi-pelanggaran-siswa-laravel.website_configs
CREATE TABLE IF NOT EXISTS `website_configs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table project__sistem-informasi-pelanggaran-siswa-laravel.website_configs: ~0 rows (approximately)
DELETE FROM `website_configs`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
