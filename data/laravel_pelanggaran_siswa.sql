-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2023 at 11:03 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_pelanggaran_siswa`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` mediumtext NOT NULL,
  `role` enum('super-admin','admin') NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `full_name`, `username`, `password`, `role`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin0', 'superadmin0', '$2y$10$ylghpwdyK.Ak6NNx66gRYejzRMscT3fULlpLP0hlHPJ.UHiqrtK.m', 'super-admin', NULL, 1, '2023-11-09 09:02:00', '2023-11-09 09:02:00'),
(2, 'Super Admin1', 'superadmin1', '$2y$10$sD3gDqaOGvUlu53eKWv2a.cHubXUlLSYIIyaAg9zZD9XdmfeWd6du', 'super-admin', NULL, 1, '2023-11-09 09:02:00', '2023-11-09 09:02:00');

-- --------------------------------------------------------

--
-- Table structure for table `class_lists`
--

CREATE TABLE `class_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `kelas` varchar(255) NOT NULL,
  `jurusan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `class_lists`
--

INSERT INTO `class_lists` (`id`, `teacher_id`, `name`, `is_active`, `created_at`, `updated_at`, `kelas`, `jurusan`) VALUES
(1, NULL, '10 RPL 1', 1, NULL, NULL, '', ''),
(2, NULL, '10 RPL 2', 1, NULL, NULL, '', ''),
(3, NULL, '11 RPL 1', 1, NULL, NULL, '', ''),
(4, NULL, '11 RPL 2', 1, NULL, NULL, '', ''),
(5, NULL, '12 RPL 1', 1, NULL, NULL, '', ''),
(6, NULL, '12 RPL 2', 1, NULL, NULL, '', '');

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
(14, '2022_02_14_072542_create_website_configs_table', 1),
(15, '2023_10_26_144702_add_col_table_class_lists', 1),
(16, '2023_10_26_203031_add_coloumn_clas_to_violation_list', 1),
(17, '2023_10_26_215046_nullable_col_sementara_table_students', 1),
(18, '2023_10_28_054934_add_coloumn_jenis_pelanggaran_to_violation_categories', 1),
(19, '2023_11_01_223733_add_column_soft_delete_to_violation_category', 1),
(20, '2023_11_06_220652_create_jobs_table', 1),
(21, '2023_11_07_143643_add_col_clas_violation_lists', 1),
(22, '2023_11_07_143804_remove_class_id_viol_lists', 1),
(23, '2023_11_09_152034_add_column_teacher_id_etc_to_violation_list', 1),
(24, '2023_11_10_142753_create_tatib_bab_table', 2),
(26, '2023_11_10_145515_crete_tatib_butir_pasal', 2),
(27, '2023_11_10_142822_create_tatib_pasal_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `identity_number` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('l','p') NOT NULL,
  `address` text DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `class_id`, `email`, `identity_number`, `full_name`, `username`, `password`, `gender`, `address`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(6, 1, 'yuliana19@example.net', '93841', 'Olivia Siti Andriani', 'Olivia Siti Andriani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Ekonomi No. 586, Sungai Penuh 28270, KalSel', '(+62) 443 8170 9945', NULL, 1, '2023-11-02 00:44:55', '2023-11-02 00:44:55'),
(7, 1, 'novitasari.queen@example.org', '9605', 'Violet Tiara Pratiwi', 'Violet Tiara Pratiwi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Daan No. 692, Subulussalam 84337, Bengkulu', '0345 0546 688', NULL, 1, '2023-11-02 00:44:55', '2023-11-02 00:44:55'),
(8, 1, 'andriani.ozy@example.com', '49010', 'Tiara Usamah S.IP', 'Tiara Usamah S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bah Jaya No. 432, Kotamobagu 85730, SumBar', '0944 3063 097', NULL, 1, '2023-11-02 00:44:55', '2023-11-02 00:44:55'),
(9, 1, 'maryadi.lamar@example.com', '19252', 'Fathonah Susanti', 'Fathonah Susanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Babadak No. 530, Pekanbaru 69979, SulSel', '0565 5918 5351', NULL, 1, '2023-11-02 00:44:55', '2023-11-02 00:44:55'),
(10, 1, 'busamah@example.net', '51151', 'Kamaria Nova Hasanah', 'Kamaria Nova Hasanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Babadak No. 88, Gorontalo 13406, KalTim', '0286 3190 999', NULL, 1, '2023-11-02 00:44:55', '2023-11-02 00:44:55'),
(11, 1, 'zelaya.astuti@example.org', '17856', 'Hilda Rahayu', 'Hilda Rahayu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Umalas No. 818, Gorontalo 45692, MalUt', '(+62) 824 745 538', NULL, 1, '2023-11-02 00:44:55', '2023-11-02 00:44:55'),
(12, 1, 'putri99@example.net', '79417', 'Ratih Nasyiah', 'Ratih Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Baranang Siang Indah No. 285, Tomohon 43923, Riau', '(+62) 339 8586 7831', NULL, 1, '2023-11-02 00:44:55', '2023-11-02 00:44:55'),
(13, 1, 'ami.suartini@example.net', '49547', 'Galang Ramadan', 'Galang Ramadan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Baranang Siang No. 416, Denpasar 87018, Riau', '0549 1249 8217', NULL, 1, '2023-11-02 00:44:55', '2023-11-02 00:44:55'),
(14, 1, 'utami.dalima@example.net', '64036', 'Hari Ade Thamrin S.IP', 'Hari Ade Thamrin S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Wahid Hasyim No. 766, Administrasi Jakarta Utara 98242, BaBel', '(+62) 966 9248 7446', NULL, 1, '2023-11-02 00:45:29', '2023-11-02 00:45:29'),
(15, 1, 'bpuspasari@example.net', '70497', 'Eka Waskita', 'Eka Waskita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Baladewa No. 699, Pasuruan 77524, SulBar', '(+62) 573 6233 2682', NULL, 1, '2023-11-02 00:45:29', '2023-11-02 00:45:29'),
(16, 1, 'laksana10@example.net', '85013', 'Maria Wijayanti', 'Maria Wijayanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Raden No. 806, Batam 16348, JaTeng', '0812 0775 882', NULL, 1, '2023-11-02 00:45:29', '2023-11-02 00:45:29'),
(17, 1, 'ganjaran.lazuardi@example.com', '37078', 'Nasrullah Garan Budiyanto', 'Nasrullah Garan Budiyanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baha No. 905, Sukabumi 86013, Maluku', '(+62) 27 3697 2844', NULL, 1, '2023-11-02 00:45:29', '2023-11-02 00:45:29'),
(18, 1, 'saadat.laksita@example.net', '51331', 'Karya Adriansyah', 'Karya Adriansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ujung No. 925, Administrasi Jakarta Pusat 79198, Lampung', '(+62) 783 9391 365', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(19, 1, 'ipuspasari@example.com', '69475', 'Agnes Halimah', 'Agnes Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bagis Utama No. 255, Palembang 75318, Papua', '(+62) 599 4191 870', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(20, 1, 'amaryati@example.com', '13790', 'Septi Melani', 'Septi Melani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Yos No. 629, Magelang 76849, Gorontalo', '(+62) 791 5333 8192', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(21, 1, 'adiarja.simanjuntak@example.org', '27835', 'Eka Uwais', 'Eka Uwais', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Raya Setiabudhi No. 946, Pontianak 58681, Riau', '0796 1860 927', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(22, 1, 'zkuswandari@example.net', '13310', 'Febi Namaga', 'Febi Namaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Hang No. 706, Medan 95060, JaTeng', '(+62) 487 4957 1824', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(23, 1, 'nhakim@example.net', '81999', 'Jasmin Putri Padmasari', 'Jasmin Putri Padmasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bawal No. 470, Banda Aceh 93301, Gorontalo', '0504 5032 3672', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(24, 1, 'natsir.eko@example.com', '48898', 'Surya Hutasoit S.IP', 'Surya Hutasoit S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. K.H. Wahid Hasyim (Kopo) No. 968, Bitung 86136, BaBel', '(+62) 660 3069 293', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(25, 1, 'ewidiastuti@example.net', '67464', 'Tari Yuni Sudiati S.T.', 'Tari Yuni Sudiati S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Soekarno Hatta No. 307, Solok 86313, BaBel', '(+62) 786 4756 247', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(26, 1, 'vino.suwarno@example.net', '52056', 'Aditya Satya Firmansyah', 'Aditya Satya Firmansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Mahakam No. 282, Jambi 29990, SumUt', '0611 8394 8545', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(27, 1, 'heru82@example.com', '30634', 'Legawa Firgantoro', 'Legawa Firgantoro', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Gegerkalong Hilir No. 665, Metro 23107, Lampung', '(+62) 200 7673 297', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(28, 1, 'hani19@example.org', '79088', 'Hasna Tina Melani S.T.', 'Hasna Tina Melani S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. S. Parman No. 71, Pekalongan 36642, Lampung', '(+62) 291 8833 8934', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(29, 1, 'eva79@example.com', '35003', 'Vero Prasetyo', 'Vero Prasetyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Lada No. 120, Sungai Penuh 50835, BaBel', '0332 0460 073', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(30, 1, 'utampubolon@example.org', '52041', 'Dalimin Martaka Prasetyo S.Kom', 'Dalimin Martaka Prasetyo S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Babadan No. 853, Binjai 75648, Aceh', '(+62) 22 6950 831', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(31, 1, 'kariman.laksita@example.net', '43687', 'Jaeman Pangestu', 'Jaeman Pangestu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ki Hajar Dewantara No. 342, Administrasi Jakarta Timur 98003, Gorontalo', '(+62) 28 0082 4615', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(32, 1, 'rahmi.putra@example.net', '42749', 'Kani Kamaria Safitri S.E.I', 'Kani Kamaria Safitri S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Untung Suropati No. 355, Langsa 85907, SulUt', '0482 0297 0838', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(33, 1, 'tina71@example.org', '46566', 'Mariadi Saputra', 'Mariadi Saputra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Babadak No. 459, Banjarmasin 50803, SulTra', '(+62) 595 4349 955', NULL, 1, '2023-11-02 00:45:30', '2023-11-02 00:45:30'),
(34, 2, 'laksita.farah@example.com', '34996', 'Putri Laksmiwati', 'Putri Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. K.H. Wahid Hasyim (Kopo) No. 52, Bukittinggi 90951, Bengkulu', '(+62) 838 861 735', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(35, 2, 'hamzah.saputra@example.com', '6188', 'Darmana Mangunsong S.E.I', 'Darmana Mangunsong S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Katamso No. 67, Depok 38923, PapBar', '0449 5571 8010', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(36, 2, 'widodo.hardi@example.net', '92131', 'Rusman Dongoran', 'Rusman Dongoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Tubagus Ismail No. 996, Pekanbaru 75018, BaBel', '(+62) 27 7343 680', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(37, 2, 'lalita.purnawati@example.org', '29194', 'Olivia Farhunnisa Puspasari S.Psi', 'Olivia Farhunnisa Puspasari S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Lada No. 356, Banda Aceh 67458, SulBar', '0882 2547 172', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(38, 2, 'kasiyah.anggriawan@example.org', '79751', 'Ade Waskita', 'Ade Waskita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Sutan Syahrir No. 649, Padangsidempuan 21790, NTT', '020 0032 4860', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(39, 2, 'bahuwarna.laksita@example.com', '34237', 'Ina Yuniar', 'Ina Yuniar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Padma No. 239, Bontang 49619, DIY', '0966 7061 578', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(40, 2, 'tarihoran.yani@example.net', '71807', 'Utama Kala Kuswoyo', 'Utama Kala Kuswoyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Jend. Sudirman No. 517, Tomohon 70770, DKI', '(+62) 332 3671 5353', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(41, 2, 'balijan54@example.net', '39646', 'Cahyo Martaka Latupono', 'Cahyo Martaka Latupono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Zamrud No. 963, Bekasi 93431, KalTim', '(+62) 22 2998 0266', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(42, 2, 'msetiawan@example.net', '68588', 'Bahuwarna Anggriawan', 'Bahuwarna Anggriawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Pelajar Pejuang 45 No. 391, Bau-Bau 77314, SumUt', '021 9259 5155', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(43, 2, 'cengkal.mulyani@example.org', '81326', 'Zelda Haryanti S.T.', 'Zelda Haryanti S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Salak No. 839, Depok 65375, Bali', '(+62) 401 9100 1956', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(44, 2, 'asihotang@example.org', '31032', 'Suci Wahyuni', 'Suci Wahyuni', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Banal No. 512, Sawahlunto 35062, KepR', '(+62) 272 2974 590', NULL, 1, '2023-11-02 00:45:46', '2023-11-02 00:45:46'),
(45, 2, 'npadmasari@example.org', '14779', 'Intan Puspasari', 'Intan Puspasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Kebonjati No. 389, Banda Aceh 95297, KalTim', '(+62) 870 4593 406', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(46, 2, 'samiah39@example.net', '16116', 'Lanang Siregar M.Farm', 'Lanang Siregar M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Ir. H. Juanda No. 917, Lhokseumawe 10554, MalUt', '(+62) 838 7735 0869', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(47, 2, 'ppalastri@example.org', '44886', 'Oni Anastasia Farida S.I.Kom', 'Oni Anastasia Farida S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bass No. 128, Pekanbaru 52353, BaBel', '(+62) 666 6245 4070', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(48, 2, 'mulyani.sarah@example.net', '69389', 'Eli Yuniar M.Farm', 'Eli Yuniar M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Hang No. 826, Langsa 88760, Jambi', '(+62) 20 1041 1484', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(49, 2, 'wastuti.nabila@example.com', '62801', 'Farhunnisa Yuliarti', 'Farhunnisa Yuliarti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Padang No. 783, Palembang 17288, Lampung', '0895 9633 284', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(50, 2, 'yjailani@example.com', '2755', 'Salimah Widiastuti', 'Salimah Widiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Pasteur No. 753, Langsa 56970, JaTim', '(+62) 29 7856 698', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(51, 2, 'lsirait@example.com', '800', 'Betania Laksmiwati', 'Betania Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Acordion No. 22, Mataram 86936, JaBar', '0574 2223 4852', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(52, 2, 'ksaptono@example.com', '9943', 'Warsita Utama', 'Warsita Utama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Kebonjati No. 443, Depok 72338, KalBar', '(+62) 306 2961 0539', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(53, 2, 'harjasa85@example.net', '58659', 'Ulya Mandasari', 'Ulya Mandasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Sudirman No. 566, Jambi 71918, KepR', '(+62) 944 5871 231', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(54, 2, 'daruna38@example.org', '66208', 'Novi Wahyuni S.E.', 'Novi Wahyuni S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Lumban Tobing No. 755, Bekasi 28915, SumUt', '0342 6241 6115', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(55, 2, 'hidayat.nyoman@example.net', '31229', 'Pranata Wahyudin M.Kom.', 'Pranata Wahyudin M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Casablanca No. 315, Gorontalo 63906, NTB', '0765 9716 6771', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(56, 2, 'vivi.mayasari@example.com', '47743', 'Agnes Keisha Haryanti', 'Agnes Keisha Haryanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Sugiyopranoto No. 352, Tegal 72921, Jambi', '0966 6837 866', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(57, 2, 'tamba.limar@example.net', '52247', 'Ghaliyati Oktaviani', 'Ghaliyati Oktaviani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Gardujati No. 972, Bandung 76769, DIY', '(+62) 910 8683 1826', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(58, 2, 'dipa.tamba@example.net', '90240', 'Wage Cager Pradana', 'Wage Cager Pradana', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Yos Sudarso No. 408, Bontang 20656, Jambi', '(+62) 558 7295 2715', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(59, 2, 'putra.mila@example.org', '28517', 'Ajeng Rahayu Winarsih M.TI.', 'Ajeng Rahayu Winarsih M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Adisumarmo No. 498, Sungai Penuh 96474, Riau', '027 7554 9727', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(60, 2, 'violet82@example.org', '19813', 'Alambana Putra S.Pd', 'Alambana Putra S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bagonwoto  No. 521, Magelang 20620, SulUt', '029 5219 1363', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(61, 2, 'gunarto.hasta@example.org', '20810', 'Gadang Dartono Maryadi S.H.', 'Gadang Dartono Maryadi S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Basoka No. 993, Palopo 60765, SulTra', '(+62) 260 2475 577', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(62, 2, 'talia24@example.net', '23838', 'Fathonah Nasyiah', 'Fathonah Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Muwardi No. 973, Banjarmasin 82700, DKI', '(+62) 26 2611 0202', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(63, 2, 'xrahayu@example.org', '49248', 'Jaeman Pangestu Ramadan', 'Jaeman Pangestu Ramadan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Agus Salim No. 969, Cimahi 49486, JaTim', '0941 7894 0457', NULL, 1, '2023-11-02 00:45:47', '2023-11-02 00:45:47'),
(64, 2, 'karsa00@example.com', '75799', 'Endah Nasyidah M.M.', 'Endah Nasyidah M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bak Air No. 398, Bogor 57699, SumSel', '0463 2600 180', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(65, 2, 'nasrullah.wijayanti@example.net', '54069', 'Anastasia Zulaika M.Ak', 'Anastasia Zulaika M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bakin No. 943, Tangerang 44324, JaBar', '(+62) 214 4832 977', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(66, 2, 'laras81@example.org', '21828', 'Maman Sihombing', 'Maman Sihombing', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Peta No. 786, Serang 35138, Jambi', '0957 8289 5659', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(67, 2, 'vinsen31@example.net', '98350', 'Hafshah Laksmiwati S.Kom', 'Hafshah Laksmiwati S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Yohanes No. 326, Administrasi Jakarta Utara 15945, SumUt', '(+62) 810 291 737', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(68, 2, 'utami.alika@example.net', '2711', 'Yunita Andriani S.I.Kom', 'Yunita Andriani S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Asia Afrika No. 672, Balikpapan 43182, SulUt', '(+62) 435 4286 681', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(69, 2, 'jessica08@example.net', '29310', 'Pardi Dongoran', 'Pardi Dongoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ki Hajar Dewantara No. 684, Surakarta 42933, MalUt', '0320 2367 0820', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(70, 2, 'syahrini.adriansyah@example.com', '26826', 'Pia Lailasari', 'Pia Lailasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bass No. 232, Jambi 30346, Gorontalo', '(+62) 494 9996 371', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(71, 2, 'jpermata@example.net', '76616', 'Umi Lintang Mardhiyah', 'Umi Lintang Mardhiyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Juanda No. 552, Banjarbaru 46637, MalUt', '0909 7394 5871', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(72, 2, 'citra87@example.net', '24574', 'Lasmanto Kusumo S.E.I', 'Lasmanto Kusumo S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Suryo Pranoto No. 950, Batam 19814, KalSel', '(+62) 823 5051 062', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(73, 2, 'teguh.usamah@example.com', '43796', 'Halima Mandasari S.Farm', 'Halima Mandasari S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Thamrin No. 99, Cirebon 76374, Jambi', '0545 4902 892', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(74, 2, 'rlaksita@example.com', '54721', 'Yoga Jailani', 'Yoga Jailani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Gremet No. 72, Denpasar 32024, Bengkulu', '0242 3724 622', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(75, 2, 'dodo32@example.org', '34615', 'Wulan Ira Halimah S.I.Kom', 'Wulan Ira Halimah S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sutarto No. 542, Mojokerto 48461, Riau', '0619 1750 765', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(76, 2, 'carla.rajasa@example.net', '5244', 'Darmaji Prasetyo', 'Darmaji Prasetyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Banal No. 425, Sukabumi 90836, Jambi', '0342 4766 1291', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(77, 2, 'smandala@example.net', '49654', 'Uli Haryanti', 'Uli Haryanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ters. Jakarta No. 665, Banjarmasin 69216, Riau', '0860 7812 4865', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(78, 2, 'shania99@example.org', '56358', 'Aurora Rahmawati', 'Aurora Rahmawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Suryo No. 485, Madiun 46821, JaTim', '(+62) 20 3261 5315', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(79, 2, 'vanya.kusmawati@example.org', '33719', 'Tedi Kemal Januar', 'Tedi Kemal Januar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sudirman No. 657, Pasuruan 96846, Maluku', '0804 0070 073', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(80, 2, 'ghani.puspasari@example.org', '56836', 'Michelle Pratiwi S.I.Kom', 'Michelle Pratiwi S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baranang Siang No. 317, Singkawang 78179, SumBar', '(+62) 554 5293 1716', NULL, 1, '2023-11-02 00:46:34', '2023-11-02 00:46:34'),
(81, 2, 'mahesa11@example.org', '42430', 'Manah Marbun', 'Manah Marbun', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Adisucipto No. 514, Tangerang Selatan 45888, KepR', '0421 9584 0703', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(82, 2, 'edi.hutagalung@example.org', '15605', 'Vera Laksmiwati', 'Vera Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Veteran No. 671, Sungai Penuh 62775, MalUt', '0559 9446 6605', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(83, 2, 'ckurniawan@example.net', '51949', 'Vera Jessica Nasyiah S.Farm', 'Vera Jessica Nasyiah S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Monginsidi No. 461, Tangerang 27364, Jambi', '(+62) 27 1753 541', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(84, 2, 'usamah.ganjaran@example.org', '26303', 'Diah Kayla Suryatmi S.I.Kom', 'Diah Kayla Suryatmi S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Halim No. 658, Pagar Alam 77676, Maluku', '0553 2836 987', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(85, 2, 'hhandayani@example.org', '44849', 'Kasim Simbolon', 'Kasim Simbolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Siliwangi No. 227, Serang 55611, BaBel', '0845 978 890', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(86, 2, 'sitorus.sari@example.com', '89028', 'Halima Pratiwi S.Ked', 'Halima Pratiwi S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sukajadi No. 409, Makassar 25209, Gorontalo', '(+62) 24 3079 649', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(87, 2, 'dewi34@example.com', '74946', 'Kamaria Hartati M.Pd', 'Kamaria Hartati M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Taman No. 508, Pekalongan 56879, Lampung', '0651 8501 981', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(88, 2, 'karsa13@example.net', '44116', 'Queen Pertiwi S.E.', 'Queen Pertiwi S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Yap Tjwan Bing No. 327, Prabumulih 90008, Papua', '0965 2746 3932', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(89, 2, 'warji09@example.net', '53530', 'Vicky Puti Rahimah', 'Vicky Puti Rahimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bagonwoto  No. 145, Makassar 23166, NTT', '0717 2512 737', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(90, 2, 'prayogo80@example.org', '67105', 'Wirda Mandasari', 'Wirda Mandasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Acordion No. 152, Cimahi 56546, MalUt', '0968 6454 671', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(91, 2, 'galih61@example.com', '44913', 'Laila Susanti', 'Laila Susanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Yap Tjwan Bing No. 658, Kendari 45966, BaBel', '0313 6144 378', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(92, 2, 'dinda79@example.net', '24934', 'Victoria Jane Laksmiwati S.H.', 'Victoria Jane Laksmiwati S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Moch. Yamin No. 384, Administrasi Jakarta Selatan 65434, Bali', '(+62) 524 0629 3684', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(93, 2, 'nurdiyanti.margana@example.net', '25922', 'Hafshah Sudiati', 'Hafshah Sudiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Sam Ratulangi No. 770, Sukabumi 92689, DKI', '(+62) 493 0969 8263', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(94, 2, 'yhartati@example.net', '99713', 'Bagya Mahendra', 'Bagya Mahendra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Jaksa No. 252, Jambi 31337, Bali', '0729 4443 232', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(95, 2, 'purwanti.maman@example.com', '26712', 'Yuni Rahmawati', 'Yuni Rahmawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bambon No. 595, Mojokerto 95668, JaBar', '0593 4746 0775', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(96, 2, 'gatra.salahudin@example.com', '42806', 'Paramita Puspita S.Psi', 'Paramita Puspita S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Lumban Tobing No. 191, Solok 54029, SumBar', '0509 6425 106', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(97, 2, 'jefri.widiastuti@example.org', '24785', 'Tantri Raina Winarsih', 'Tantri Raina Winarsih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Gegerkalong Hilir No. 299, Padang 15488, KalTim', '0216 9770 980', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(98, 2, 'anom51@example.net', '73859', 'Pia Safitri', 'Pia Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Jambu No. 62, Bima 94536, SulTra', '(+62) 567 5653 3975', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(99, 2, 'gading19@example.com', '12038', 'Rahman Waluyo', 'Rahman Waluyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Yap Tjwan Bing No. 865, Tarakan 20143, Lampung', '(+62) 356 8469 198', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(100, 2, 'fitria.novitasari@example.org', '58945', 'Radika Kusuma Wibisono S.Gz', 'Radika Kusuma Wibisono S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Abdul Muis No. 932, Tual 64708, Bengkulu', '0706 3590 347', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(101, 2, 'nyana.utama@example.net', '46912', 'Puput Oktaviani S.Pd', 'Puput Oktaviani S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Barat No. 776, Blitar 95150, SulUt', '(+62) 23 5493 208', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(102, 2, 'carla25@example.com', '97411', 'Danuja Kadir Saefullah S.H.', 'Danuja Kadir Saefullah S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Muwardi No. 358, Administrasi Jakarta Barat 98393, Jambi', '(+62) 266 3325 8565', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(103, 2, 'nsaputra@example.net', '34811', 'Puspa Padma Suryatmi M.Ak', 'Puspa Padma Suryatmi M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Supono No. 481, Sungai Penuh 44397, Riau', '(+62) 302 7889 6314', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(104, 2, 'hardana96@example.net', '59763', 'Irma Sarah Laksmiwati', 'Irma Sarah Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Elang No. 728, Kendari 39659, KalSel', '(+62) 431 6288 207', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(105, 2, 'whasanah@example.net', '8723', 'Rudi Sihotang S.Psi', 'Rudi Sihotang S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bakin No. 345, Palembang 55817, Maluku', '0398 8528 1927', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(106, 2, 'sakti97@example.com', '33656', 'Uli Palastri', 'Uli Palastri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Setiabudhi No. 776, Tarakan 12747, SulTra', '(+62) 575 1345 244', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(107, 2, 'usada.belinda@example.com', '83830', 'Najwa Mulyani', 'Najwa Mulyani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bass No. 234, Serang 51034, KalSel', '0404 2859 965', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(108, 2, 'wnasyidah@example.org', '34209', 'Utama Emil Hutapea S.Sos', 'Utama Emil Hutapea S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bakhita No. 874, Sorong 78374, Gorontalo', '0558 2558 273', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(109, 2, 'xrajata@example.net', '96111', 'Mila Mandasari', 'Mila Mandasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Raden No. 1, Kupang 66815, JaTeng', '(+62) 414 2651 9923', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(110, 2, 'endah38@example.org', '95133', 'Ivan Akarsana Dongoran', 'Ivan Akarsana Dongoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Moch. Yamin No. 502, Cirebon 17923, NTB', '0701 2216 014', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(111, 2, 'dian.agustina@example.org', '42320', 'Kasiran Maulana', 'Kasiran Maulana', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Teuku Umar No. 399, Kediri 14510, SulTra', '(+62) 776 9979 5611', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(112, 2, 'latika.palastri@example.org', '94722', 'Adika Utama', 'Adika Utama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Suryo No. 3, Bitung 59861, SulTeng', '0289 2203 4973', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(113, 2, 'mulyono.nurdiyanti@example.net', '70230', 'Zelda Paramita Nasyidah', 'Zelda Paramita Nasyidah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Yoga No. 336, Administrasi Jakarta Barat 64607, JaTim', '(+62) 20 9715 189', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(114, 2, 'banawa70@example.com', '43235', 'Dagel Lazuardi', 'Dagel Lazuardi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sutoyo No. 347, Bekasi 74197, JaBar', '(+62) 488 5095 8524', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(115, 2, 'juli45@example.com', '77385', 'Anom Natsir', 'Anom Natsir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sutami No. 817, Bau-Bau 69619, KalTeng', '(+62) 897 4754 837', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(116, 2, 'padmi.suryatmi@example.net', '35237', 'Betania Maryati', 'Betania Maryati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Veteran No. 308, Banjarmasin 81414, Papua', '0950 2437 8359', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(117, 2, 'emil.firgantoro@example.net', '68241', 'Lantar Simanjuntak', 'Lantar Simanjuntak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bakau Griya Utama No. 673, Blitar 54337, SulSel', '(+62) 749 4934 347', NULL, 1, '2023-11-02 00:46:35', '2023-11-02 00:46:35'),
(118, 2, 'loktaviani@example.org', '73806', 'Nilam Permata', 'Nilam Permata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Antapani Lama No. 641, Bukittinggi 52628, Jambi', '0981 0001 2165', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(119, 2, 'jelita32@example.net', '24311', 'Kunthara Winarno', 'Kunthara Winarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Ujung No. 761, Batu 29032, Papua', '0372 7849 496', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(120, 2, 'raditya.laksita@example.org', '41395', 'Uda Jono Firgantoro M.Kom.', 'Uda Jono Firgantoro M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bagonwoto  No. 879, Cimahi 22784, JaTim', '0671 0662 4193', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(121, 2, 'dariati.anggraini@example.org', '5835', 'Ilyas Ajiman Pradipta', 'Ilyas Ajiman Pradipta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Kartini No. 51, Banjarbaru 82563, SumUt', '(+62) 737 6509 0141', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(122, 2, 'cahyadi10@example.com', '9308', 'Asmuni Pratama', 'Asmuni Pratama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Gegerkalong Hilir No. 254, Jayapura 11114, KalUt', '(+62) 784 1558 3569', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(123, 2, 'dewi23@example.net', '60436', 'Sidiq Firgantoro S.T.', 'Sidiq Firgantoro S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Baranang Siang Indah No. 687, Balikpapan 94999, JaTeng', '(+62) 832 6355 0007', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(124, 2, 'olaksmiwati@example.net', '59684', 'Kamila Indah Yuliarti', 'Kamila Indah Yuliarti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Hang No. 994, Administrasi Jakarta Selatan 55099, Bali', '0288 1349 117', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(125, 2, 'safitri.jumadi@example.com', '92610', 'Vinsen Cakrabuana Widodo', 'Vinsen Cakrabuana Widodo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sutan Syahrir No. 615, Langsa 64799, SulUt', '(+62) 884 240 948', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(126, 2, 'uwais.muni@example.com', '61052', 'Heryanto Mustofa', 'Heryanto Mustofa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Barat No. 291, Padang 52043, SumUt', '(+62) 212 7191 3379', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(127, 2, 'lanjar.rahimah@example.net', '73754', 'Kuncara Bakda Sitompul', 'Kuncara Bakda Sitompul', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Yogyakarta No. 825, Jayapura 92456, PapBar', '0941 5511 0697', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(128, 2, 'tugiman.ardianto@example.com', '98843', 'Amalia Handayani', 'Amalia Handayani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sukabumi No. 874, Kotamobagu 46752, PapBar', '0614 2137 513', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(129, 2, 'yuniar.gatra@example.com', '52384', 'Kemba Anggabaya Santoso', 'Kemba Anggabaya Santoso', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Urip Sumoharjo No. 836, Kendari 20124, Banten', '0810 8498 1896', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(130, 2, 'orahmawati@example.net', '68941', 'Novi Safitri', 'Novi Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Rajawali Barat No. 95, Tasikmalaya 64598, Riau', '(+62) 425 1450 9268', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(131, 2, 'bpratiwi@example.net', '53101', 'Gangsar Pradana S.I.Kom', 'Gangsar Pradana S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Ters. Pasir Koja No. 956, Surakarta 29858, DIY', '0589 3375 015', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(132, 2, 'prayoga13@example.org', '46702', 'Eli Permata S.Psi', 'Eli Permata S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Kiaracondong No. 526, Surakarta 84375, JaBar', '0591 0942 605', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(133, 2, 'nardi.hardiansyah@example.com', '3109', 'Tri Iswahyudi', 'Tri Iswahyudi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Taman No. 631, Palu 23096, Maluku', '0705 0800 881', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(134, 2, 'megantara.hari@example.net', '66053', 'Hana Hafshah Wahyuni S.IP', 'Hana Hafshah Wahyuni S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Monginsidi No. 898, Manado 57383, PapBar', '(+62) 762 0763 7512', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(135, 2, 'budi64@example.net', '20346', 'Bella Lestari S.Kom', 'Bella Lestari S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Cikutra Timur No. 317, Pekalongan 54235, Bengkulu', '0439 5148 4342', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(136, 2, 'melani.tari@example.net', '21671', 'Legawa Sihombing S.T.', 'Legawa Sihombing S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Nanas No. 61, Palu 46196, SulTeng', '(+62) 862 110 216', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(137, 2, 'putri89@example.net', '35769', 'Tiara Melani', 'Tiara Melani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Laswi No. 946, Bau-Bau 74863, KalSel', '(+62) 255 4128 2162', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(138, 2, 'halimah.diana@example.org', '26967', 'Sakura Salwa Puspasari S.Sos', 'Sakura Salwa Puspasari S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sumpah Pemuda No. 656, Banjarmasin 12307, SulBar', '0626 5892 116', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(139, 2, 'ikin.purwanti@example.net', '99499', 'Tania Kuswandari S.Psi', 'Tania Kuswandari S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Samanhudi No. 992, Pekalongan 52559, SulBar', '0303 9261 206', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(140, 2, 'edi.lestari@example.com', '6075', 'Ajiman Adriansyah', 'Ajiman Adriansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Kali No. 190, Yogyakarta 80901, Banten', '0852 559 716', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(141, 2, 'eli.rahmawati@example.com', '56400', 'Restu Kezia Halimah S.I.Kom', 'Restu Kezia Halimah S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. S. Parman No. 740, Batu 46941, NTT', '0244 6218 1025', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(142, 2, 'clara.laksmiwati@example.com', '40999', 'Luhung Muni Dabukke', 'Luhung Muni Dabukke', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Gremet No. 683, Subulussalam 87943, KepR', '(+62) 576 2808 6509', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(143, 2, 'qmelani@example.net', '65141', 'Titi Utami', 'Titi Utami', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Cikutra Barat No. 200, Pematangsiantar 49144, Bengkulu', '(+62) 506 1001 249', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(144, 2, 'puspasari.laila@example.net', '67770', 'Lintang Anggraini', 'Lintang Anggraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sugiono No. 634, Palembang 65620, KalTeng', '(+62) 351 8329 950', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(145, 2, 'simon.wasita@example.com', '59956', 'Irma Astuti M.Pd', 'Irma Astuti M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Baha No. 579, Prabumulih 66062, DIY', '022 8072 8536', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(146, 2, 'siregar.emil@example.com', '1921', 'Aurora Nuraini', 'Aurora Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Suprapto No. 827, Batu 85583, JaTeng', '(+62) 763 4974 2880', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(147, 2, 'tiara.winarsih@example.org', '81059', 'Radit Rajasa', 'Radit Rajasa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Baranangsiang No. 955, Makassar 86593, DKI', '(+62) 790 0194 2229', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(148, 2, 'nanggriawan@example.net', '14512', 'Bahuraksa Arsipatra Mustofa', 'Bahuraksa Arsipatra Mustofa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. B.Agam Dlm No. 876, Ambon 12016, Maluku', '0823 2082 313', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(149, 2, 'farah55@example.net', '9635', 'Umi Nurdiyanti', 'Umi Nurdiyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Barasak No. 308, Surakarta 26859, SulBar', '0227 5976 1734', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(150, 2, 'rahayu.dian@example.com', '28836', 'Ami Hariyah M.TI.', 'Ami Hariyah M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bambu No. 946, Payakumbuh 37738, KalTim', '(+62) 440 7132 0911', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(151, 2, 'vicky.budiman@example.com', '71843', 'Rahmi Kayla Yuliarti S.Sos', 'Rahmi Kayla Yuliarti S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Gedebage Selatan No. 728, Parepare 81856, SulTra', '(+62) 477 8231 664', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(152, 2, 'gnugroho@example.org', '27899', 'Prayoga Hutasoit', 'Prayoga Hutasoit', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Suharso No. 723, Malang 87012, KalTim', '0752 0099 348', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(153, 2, 'nmarbun@example.org', '42112', 'Asman Kemba Mahendra', 'Asman Kemba Mahendra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sumpah Pemuda No. 359, Subulussalam 14861, KalSel', '029 6000 9125', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(154, 2, 'titi.prasasta@example.net', '96245', 'Ayu Bella Yuliarti', 'Ayu Bella Yuliarti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Wora Wari No. 726, Bau-Bau 15748, NTT', '(+62) 764 7413 688', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(155, 2, 'tri89@example.com', '56302', 'Candra Napitupulu', 'Candra Napitupulu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Gedebage Selatan No. 875, Batu 60704, Papua', '0702 9256 084', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(156, 2, 'marpaung.siska@example.com', '35344', 'Mulyono Winarno', 'Mulyono Winarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Gedebage Selatan No. 729, Tegal 34935, JaTeng', '0232 7321 4951', NULL, 1, '2023-11-02 00:46:36', '2023-11-02 00:46:36'),
(157, 2, 'vrajata@example.net', '36099', 'Cinthia Sadina Suryatmi', 'Cinthia Sadina Suryatmi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Ciwastra No. 169, Serang 53622, Bengkulu', '0261 6309 9694', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(158, 2, 'nuraini.dasa@example.com', '26799', 'Victoria Safitri S.Pd', 'Victoria Safitri S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Veteran No. 377, Denpasar 72301, JaTim', '0745 3526 4315', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(159, 2, 'gawati.prakasa@example.com', '26296', 'Langgeng Prakasa', 'Langgeng Prakasa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Qrisdoren No. 389, Yogyakarta 54668, MalUt', '(+62) 773 2685 1316', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(160, 2, 'snainggolan@example.org', '11398', 'Pandu Sitorus', 'Pandu Sitorus', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Daan No. 273, Administrasi Jakarta Selatan 96677, BaBel', '(+62) 673 1191 476', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(161, 2, 'hidayat.ida@example.com', '49174', 'Bahuraksa Ibun Ramadan', 'Bahuraksa Ibun Ramadan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Ikan No. 763, Tasikmalaya 74424, MalUt', '(+62) 952 0502 0391', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(162, 2, 'talia.tarihoran@example.net', '57638', 'Amelia Susanti', 'Amelia Susanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. K.H. Maskur No. 599, Solok 88972, BaBel', '0391 3104 596', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(163, 2, 'padmasari.daliono@example.com', '24383', 'Sabar Maheswara S.Pt', 'Sabar Maheswara S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bappenas No. 252, Sukabumi 32098, SumBar', '0240 8640 9724', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(164, 2, 'zelda85@example.com', '39758', 'Kalim Hidayat', 'Kalim Hidayat', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Baranang Siang No. 727, Tegal 99386, DIY', '(+62) 840 755 461', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(165, 2, 'aswani70@example.org', '92066', 'Hasan Timbul Haryanto M.Farm', 'Hasan Timbul Haryanto M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Mulyadi No. 221, Balikpapan 54672, Maluku', '0452 3360 8740', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(166, 2, 'dwijaya@example.org', '31663', 'Soleh Aswani Kusumo S.Pd', 'Soleh Aswani Kusumo S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. BKR No. 284, Kotamobagu 75934, DKI', '(+62) 24 6239 903', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(167, 2, 'harjo59@example.org', '85817', 'Adinata Prasasta', 'Adinata Prasasta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Ters. Pasir Koja No. 159, Bekasi 81523, Jambi', '0894 0995 1140', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(168, 2, 'yolanda.kardi@example.com', '61752', 'Maimunah Hariyah', 'Maimunah Hariyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Imam Bonjol No. 18, Mataram 75024, SumSel', '028 9807 808', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(169, 2, 'cinta.prastuti@example.net', '51145', 'Ian Adriansyah', 'Ian Adriansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baung No. 682, Kendari 45337, SumBar', '(+62) 276 8636 8904', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(170, 2, 'susanti.mala@example.org', '42001', 'Genta Namaga M.M.', 'Genta Namaga M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Basket No. 273, Palembang 62954, PapBar', '(+62) 27 2038 014', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(171, 2, 'karen.hidayat@example.org', '98599', 'Jagapati Pradana', 'Jagapati Pradana', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Raden No. 965, Palu 72625, KalUt', '0277 1173 1883', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(172, 2, 'elvina.haryanti@example.net', '84581', 'Zizi Puput Yulianti', 'Zizi Puput Yulianti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baiduri No. 489, Pekanbaru 38961, KalTim', '(+62) 622 8763 2531', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(173, 2, 'cutama@example.net', '3204', 'Kusuma Harjo Saragih', 'Kusuma Harjo Saragih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Untung Suropati No. 409, Medan 55105, JaBar', '(+62) 20 6734 471', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(174, 2, 'sirait.lasmono@example.net', '26947', 'Harimurti Siregar S.Ked', 'Harimurti Siregar S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Cut Nyak Dien No. 493, Tangerang Selatan 33028, MalUt', '(+62) 289 5247 612', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(175, 2, 'uyolanda@example.org', '70699', 'Lembah Haryanto', 'Lembah Haryanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Basoka Raya No. 710, Bukittinggi 21336, NTB', '0461 6394 3325', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(176, 2, 'kania.tarihoran@example.org', '17177', 'Dina Haryanti S.Gz', 'Dina Haryanti S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Merdeka No. 132, Magelang 34712, NTT', '0779 3846 499', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(177, 2, 'fitriani19@example.net', '97925', 'Ana Ajeng Puspita S.E.', 'Ana Ajeng Puspita S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Nangka No. 126, Ternate 55072, Maluku', '(+62) 622 0433 3643', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(178, 2, 'phandayani@example.org', '64406', 'Galuh Samosir', 'Galuh Samosir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bata Putih No. 277, Tarakan 15419, SulTeng', '(+62) 907 1117 8995', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(179, 2, 'dinda25@example.org', '57905', 'Karimah Ika Rahmawati M.Pd', 'Karimah Ika Rahmawati M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Padang No. 544, Banda Aceh 53941, MalUt', '0522 6157 8528', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(180, 2, 'mpermadi@example.org', '26624', 'Jamalia Nasyiah', 'Jamalia Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Gotong Royong No. 533, Pangkal Pinang 45800, JaTeng', '0652 0965 0596', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(181, 2, 'rizki.nainggolan@example.org', '13032', 'Leo Pangestu', 'Leo Pangestu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Achmad Yani No. 841, Kendari 75219, NTB', '(+62) 598 3275 075', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37');
INSERT INTO `students` (`id`, `class_id`, `email`, `identity_number`, `full_name`, `username`, `password`, `gender`, `address`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(182, 2, 'xpermadi@example.org', '21783', 'Harimurti Dasa Dongoran', 'Harimurti Dasa Dongoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Gajah Mada No. 734, Bima 29056, Jambi', '0482 7165 409', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(183, 2, 'wani.marpaung@example.net', '65182', 'Irma Lestari', 'Irma Lestari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Ki Hajar Dewantara No. 971, Gorontalo 82616, PapBar', '(+62) 632 0961 714', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(184, 2, 'kawaya.uwais@example.net', '78204', 'Ciaobella Usamah S.Pt', 'Ciaobella Usamah S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Baung No. 261, Banjarbaru 31220, PapBar', '(+62) 318 3340 7063', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(185, 2, 'slailasari@example.org', '38778', 'Caket Mandala', 'Caket Mandala', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Basoka No. 802, Jayapura 46463, SulTeng', '(+62) 345 2964 158', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(186, 2, 'wahyudin.zaenab@example.org', '72176', 'Belinda Riyanti', 'Belinda Riyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Jend. A. Yani No. 901, Parepare 42533, KepR', '(+62) 855 4741 8798', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(187, 2, 'olga.andriani@example.org', '3107', 'Rusman Gamani Waluyo', 'Rusman Gamani Waluyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Nangka No. 861, Payakumbuh 57120, Jambi', '0445 3112 488', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(188, 2, 'humaira99@example.net', '81890', 'Bella Mandasari S.T.', 'Bella Mandasari S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Achmad No. 453, Surabaya 33372, SumSel', '(+62) 483 0014 0879', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(189, 2, 'xsinaga@example.org', '14074', 'Elma Pratiwi', 'Elma Pratiwi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Honggowongso No. 326, Administrasi Jakarta Utara 25961, Bengkulu', '(+62) 285 1843 138', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(190, 2, 'ganda17@example.net', '61269', 'Rahmi Usada S.I.Kom', 'Rahmi Usada S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bakin No. 505, Tarakan 40394, SulSel', '0329 2771 377', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(191, 2, 'cindy.mangunsong@example.com', '15888', 'Ella Qori Laksmiwati', 'Ella Qori Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Baranangsiang No. 15, Malang 69891, SulBar', '(+62) 204 2892 510', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(192, 2, 'qnovitasari@example.org', '2541', 'Estiawan Erik Widodo', 'Estiawan Erik Widodo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Gotong Royong No. 403, Tual 39662, PapBar', '0892 8150 323', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(193, 2, 'utama34@example.org', '53059', 'Kuncara Sinaga', 'Kuncara Sinaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Moch. Toha No. 542, Sungai Penuh 94806, KalTeng', '(+62) 852 1286 6589', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(194, 2, 'psihombing@example.org', '86314', 'Zulfa Widiastuti', 'Zulfa Widiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Gajah No. 658, Bandar Lampung 63327, JaTeng', '0406 4458 7237', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(195, 2, 'ssihombing@example.net', '77743', 'Cahyo Permadi', 'Cahyo Permadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baja Raya No. 313, Sawahlunto 98207, Riau', '(+62) 625 4989 3753', NULL, 1, '2023-11-02 00:46:37', '2023-11-02 00:46:37'),
(196, 2, 'sabrina.riyanti@example.com', '11762', 'Gilang Edward Pangestu', 'Gilang Edward Pangestu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Suryo No. 155, Tanjung Pinang 11723, Bali', '0229 8054 0986', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(197, 2, 'wasita.kania@example.com', '4205', 'Jamal Upik Pangestu S.Ked', 'Jamal Upik Pangestu S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Padma No. 965, Lubuklinggau 59592, Aceh', '0748 4376 924', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(198, 2, 'utami.wasis@example.org', '20948', 'Waluyo Sihombing', 'Waluyo Sihombing', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Rajiman No. 84, Sabang 73417, DKI', '0900 4276 474', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(199, 2, 'handayani.winda@example.com', '64791', 'Taufan Hardiansyah', 'Taufan Hardiansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Abang No. 494, Jayapura 18857, NTB', '(+62) 240 8625 148', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(200, 2, 'sinaga.calista@example.net', '63500', 'Marsudi Mandala', 'Marsudi Mandala', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Lada No. 679, Banjarmasin 52071, NTT', '(+62) 389 5094 5746', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(201, 2, 'jelita19@example.org', '55019', 'Vanya Mayasari M.M.', 'Vanya Mayasari M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Samanhudi No. 762, Sabang 12257, Gorontalo', '(+62) 403 1641 4814', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(202, 2, 'nsitumorang@example.net', '8669', 'Ghani Wadi Situmorang S.Gz', 'Ghani Wadi Situmorang S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Kali No. 153, Semarang 23618, JaBar', '(+62) 371 0576 3205', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(203, 2, 'wadi73@example.com', '36029', 'Dian Kamila Kusmawati S.Kom', 'Dian Kamila Kusmawati S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Wahid Hasyim No. 399, Pontianak 52992, NTB', '0890 7400 081', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(204, 2, 'wulan39@example.net', '28136', 'Zizi Namaga', 'Zizi Namaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Labu No. 438, Serang 54457, BaBel', '0976 0024 3105', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(205, 2, 'haryanti.kamila@example.org', '65813', 'Digdaya Ardianto', 'Digdaya Ardianto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sumpah Pemuda No. 321, Palangka Raya 31235, KalTeng', '(+62) 330 1798 206', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(206, 2, 'vanya49@example.org', '7909', 'Galar Winarno', 'Galar Winarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bawal No. 802, Padangpanjang 88446, SulTra', '029 5263 418', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(207, 2, 'mulyani.shania@example.net', '9659', 'Wage Hidayat', 'Wage Hidayat', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Raya Ujungberung No. 570, Binjai 39113, SulTeng', '(+62) 832 342 926', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(208, 2, 'purnawati.wulan@example.com', '47898', 'Anom Lazuardi', 'Anom Lazuardi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bagas Pati No. 595, Administrasi Jakarta Timur 45421, Papua', '0244 5602 957', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(209, 2, 'sihombing.raisa@example.org', '27592', 'Zamira Halimah', 'Zamira Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Merdeka No. 565, Tanjungbalai 50595, Maluku', '(+62) 23 2130 073', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(210, 2, 'zutami@example.com', '13654', 'Karna Jono Halim S.Farm', 'Karna Jono Halim S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Banda No. 116, Ternate 94394, NTB', '(+62) 829 4466 598', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(211, 2, 'malika89@example.org', '80591', 'Kenes Ajiono Ardianto S.IP', 'Kenes Ajiono Ardianto S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Jend. A. Yani No. 775, Tarakan 28965, JaTim', '0454 7401 639', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(212, 2, 'bpradipta@example.net', '98179', 'Almira Lestari S.Pd', 'Almira Lestari S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Padang No. 381, Jayapura 65113, JaBar', '0921 3406 9378', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(213, 2, 'lnashiruddin@example.net', '29624', 'Sarah Intan Mardhiyah', 'Sarah Intan Mardhiyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Yos No. 227, Palu 31359, Riau', '0349 7170 475', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(214, 2, 'irfan.hartati@example.org', '83565', 'Rini Padmi Rahimah', 'Rini Padmi Rahimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Cut Nyak Dien No. 640, Bima 81587, Riau', '(+62) 639 2041 263', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(215, 2, 'leo24@example.org', '52339', 'Ani Agustina', 'Ani Agustina', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Badak No. 991, Manado 35252, KalTeng', '0414 9719 0376', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(216, 2, 'laswi58@example.org', '90392', 'Hani Kusmawati', 'Hani Kusmawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Lada No. 759, Administrasi Jakarta Barat 44193, SumSel', '0281 0611 052', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(217, 2, 'clara28@example.org', '80242', 'Ida Wani Yuniar M.Pd', 'Ida Wani Yuniar M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Industri No. 814, Pekalongan 49735, JaTeng', '(+62) 27 4979 619', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(218, 2, 'icha.pradana@example.com', '84717', 'Paulin Wulandari', 'Paulin Wulandari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bahagia  No. 279, Prabumulih 97065, KalTeng', '0368 6119 448', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(219, 2, 'paramita.nasyidah@example.org', '18651', 'Jaiman Saptono', 'Jaiman Saptono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Eka No. 608, Cilegon 21613, Bali', '0407 5335 5225', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(220, 2, 'hafshah15@example.com', '29151', 'Jatmiko Rajata', 'Jatmiko Rajata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baranang No. 563, Gunungsitoli 14181, BaBel', '0531 1977 804', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(221, 2, 'fujiati.artanto@example.org', '21441', 'Kasiyah Bella Anggraini S.H.', 'Kasiyah Bella Anggraini S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Gardujati No. 391, Surakarta 51451, SulUt', '0276 5870 615', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(222, 2, 'ajeng.maryadi@example.org', '98850', 'Mulya Nasab Maheswara S.IP', 'Mulya Nasab Maheswara S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Adisucipto No. 468, Tanjungbalai 73292, PapBar', '(+62) 718 3374 8161', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(223, 2, 'joko14@example.net', '41565', 'Vanya Widiastuti', 'Vanya Widiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Dr. Junjunan No. 633, Tomohon 12231, KalTeng', '(+62) 306 4172 315', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(224, 2, 'halimah.kunthara@example.org', '54707', 'Himawan Pranowo', 'Himawan Pranowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Abdul No. 368, Ambon 80250, Riau', '(+62) 911 5522 466', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(225, 2, 'baktiadi.hastuti@example.net', '56127', 'Bancar Dasa Saefullah M.Farm', 'Bancar Dasa Saefullah M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Muwardi No. 493, Gorontalo 80461, SumBar', '(+62) 29 7249 973', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(226, 2, 'hastuti.salsabila@example.net', '43559', 'Kamaria Yulianti', 'Kamaria Yulianti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Honggowongso No. 2, Kediri 50010, Bali', '(+62) 534 0882 5863', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(227, 2, 'rgunawan@example.com', '85335', 'Hana Rahayu Zulaika', 'Hana Rahayu Zulaika', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Imam No. 202, Pariaman 63750, SulBar', '(+62) 411 0627 7236', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(228, 2, 'edward.pangestu@example.net', '50174', 'Mumpuni Atma Pangestu S.Psi', 'Mumpuni Atma Pangestu S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Pelajar Pejuang 45 No. 658, Bogor 83610, Papua', '0766 4138 9018', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(229, 2, 'nyana.hasanah@example.net', '41187', 'Rahmi Zelaya Mayasari S.E.I', 'Rahmi Zelaya Mayasari S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Abdul. Muis No. 555, Administrasi Jakarta Selatan 75017, JaTeng', '0303 2893 5035', NULL, 1, '2023-11-02 00:46:38', '2023-11-02 00:46:38'),
(230, 2, 'bagas96@example.com', '15677', 'Cawisono Maryadi', 'Cawisono Maryadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Abdullah No. 764, Tanjungbalai 16500, KalTim', '(+62) 614 7251 459', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(231, 2, 'lega.laksita@example.com', '73860', 'Catur Bagus Putra', 'Catur Bagus Putra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Flora No. 169, Palu 74274, SumSel', '0806 537 938', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(232, 2, 'okto.riyanti@example.com', '99641', 'Lutfan Saptono S.I.Kom', 'Lutfan Saptono S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. BKR No. 836, Batu 80760, DIY', '(+62) 533 8559 9084', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(233, 2, 'caraka.nugroho@example.org', '62892', 'Galih Rajata', 'Galih Rajata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Nanas No. 245, Sabang 15287, Papua', '(+62) 28 8543 9551', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(234, 2, 'cemplunk91@example.net', '17512', 'Embuh Latupono S.Ked', 'Embuh Latupono S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Otista No. 93, Palopo 95485, SulBar', '(+62) 918 4395 140', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(235, 2, 'hasta.susanti@example.com', '34455', 'Diah Wijayanti', 'Diah Wijayanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baja Raya No. 305, Ternate 52674, KalSel', '0634 3627 8983', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(236, 2, 'ikin43@example.org', '72156', 'Vivi Farida', 'Vivi Farida', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Abdul No. 167, Bukittinggi 54109, KalBar', '027 4761 1519', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(237, 2, 'jagaraga95@example.org', '1856', 'Ganep Leo Irawan S.T.', 'Ganep Leo Irawan S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bah Jaya No. 417, Pariaman 67521, JaTim', '(+62) 473 9695 971', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(238, 2, 'oskar.hardiansyah@example.com', '68883', 'Banawa Cakrajiya Rajasa S.Farm', 'Banawa Cakrajiya Rajasa S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Sudiarto No. 585, Bukittinggi 69556, SulUt', '(+62) 810 748 128', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(239, 2, 'mandala.nadia@example.org', '90741', 'Violet Kuswandari', 'Violet Kuswandari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Asia Afrika No. 478, Ambon 70456, JaTeng', '0682 1985 7463', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(240, 2, 'nsiregar@example.net', '26983', 'Panji Adriansyah M.Ak', 'Panji Adriansyah M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Thamrin No. 460, Pariaman 67041, Maluku', '0757 1853 2209', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(241, 2, 'rika16@example.net', '24565', 'Restu Oktaviani', 'Restu Oktaviani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sutoyo No. 204, Banjarbaru 29531, SulTeng', '0752 1043 015', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(242, 2, 'jumadi.lestari@example.org', '9187', 'Bakda Perkasa Jailani', 'Bakda Perkasa Jailani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Ciumbuleuit No. 545, Administrasi Jakarta Pusat 76303, DIY', '0518 0824 503', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(243, 2, 'karna59@example.com', '6665', 'Icha Uyainah M.Pd', 'Icha Uyainah M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Mulyadi No. 562, Binjai 91774, Bengkulu', '0289 6573 193', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(244, 2, 'rajasa.jaya@example.com', '31889', 'Adikara Prasasta', 'Adikara Prasasta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Ikan No. 242, Bandung 85988, SulSel', '(+62) 398 2618 7656', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(245, 2, 'manah53@example.org', '81593', 'Yance Puspasari', 'Yance Puspasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baing No. 680, Batam 75772, SumBar', '0426 1499 609', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(246, 2, 'tania94@example.net', '37591', 'Hari Sihombing', 'Hari Sihombing', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Cihampelas No. 419, Cimahi 45829, DIY', '0249 1483 4705', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(247, 2, 'ida.mangunsong@example.net', '82601', 'Uchita Janet Yuliarti', 'Uchita Janet Yuliarti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sam Ratulangi No. 683, Salatiga 34957, JaBar', '(+62) 779 2961 103', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(248, 2, 'maria.hassanah@example.org', '6112', 'Johan Hidayanto S.Pt', 'Johan Hidayanto S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. BKR No. 438, Sungai Penuh 92682, Banten', '0726 1912 450', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(249, 2, 'tmansur@example.net', '28452', 'Uli Utami', 'Uli Utami', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Cikutra Barat No. 803, Administrasi Jakarta Pusat 53281, DIY', '(+62) 621 9870 4446', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(250, 2, 'usman.hutapea@example.org', '43260', 'Ade Melani', 'Ade Melani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Ahmad Dahlan No. 296, Padang 96848, NTB', '026 5649 4518', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(251, 2, 'galur.yolanda@example.com', '73417', 'Eli Palastri S.Pt', 'Eli Palastri S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Ronggowarsito No. 1, Semarang 60588, Banten', '0652 5645 5263', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(252, 2, 'damanik.himawan@example.com', '48607', 'Emin Permadi', 'Emin Permadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Baranang No. 249, Administrasi Jakarta Barat 82438, JaBar', '(+62) 554 0350 6087', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(253, 2, 'pkuswandari@example.com', '62967', 'Fathonah Safitri', 'Fathonah Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Panjaitan No. 601, Dumai 14690, Lampung', '(+62) 542 8366 724', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(254, 2, 'usada.legawa@example.com', '77371', 'Langgeng Sirait', 'Langgeng Sirait', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Arifin No. 567, Surabaya 63294, JaTim', '(+62) 929 4125 2015', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(255, 2, 'halim.tasdik@example.net', '80110', 'Farah Permata', 'Farah Permata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bakin No. 60, Ambon 47641, Bali', '0629 1991 163', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(256, 2, 'anggriawan.putri@example.com', '53942', 'Ratna Ophelia Hartati', 'Ratna Ophelia Hartati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Ikan No. 940, Bontang 15649, Riau', '(+62) 354 5553 2438', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(257, 2, 'humaira59@example.com', '23486', 'Lasmanto Januar', 'Lasmanto Januar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Cikutra Timur No. 227, Tasikmalaya 27310, SulTeng', '0215 7854 849', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(258, 2, 'marbun.caturangga@example.com', '15692', 'Azalea Usamah', 'Azalea Usamah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Nanas No. 470, Bogor 95723, KepR', '(+62) 653 3103 970', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(259, 2, 'jlestari@example.net', '77231', 'Hafshah Lidya Mayasari S.Psi', 'Hafshah Lidya Mayasari S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Rajawali No. 412, Balikpapan 31542, Aceh', '0829 001 202', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(260, 2, 'mariadi.januar@example.net', '1622', 'Rendy Manullang M.Ak', 'Rendy Manullang M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bambu No. 225, Tarakan 63020, JaBar', '(+62) 338 5047 9239', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(261, 2, 'kuswandari.tari@example.com', '71678', 'Galuh Candrakanta Kuswoyo M.TI.', 'Galuh Candrakanta Kuswoyo M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Cikapayang No. 593, Tebing Tinggi 52795, KalUt', '(+62) 27 3173 4959', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(262, 2, 'marsudi.megantara@example.org', '91505', 'Jaiman Parman Simbolon', 'Jaiman Parman Simbolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Untung Suropati No. 377, Tanjung Pinang 48979, KalTim', '0955 8902 8945', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(263, 2, 'prabowo.cahya@example.org', '39026', 'Jefri Pangestu', 'Jefri Pangestu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sugiyopranoto No. 229, Sukabumi 24814, Banten', '0549 3353 6300', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(264, 2, 'hwahyuni@example.com', '77033', 'Gawati Yulia Astuti', 'Gawati Yulia Astuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bakau Griya Utama No. 923, Surakarta 96518, JaTeng', '(+62) 319 0624 2027', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(265, 2, 'jaeman.santoso@example.com', '77492', 'Kunthara Permadi', 'Kunthara Permadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. PHH. Mustofa No. 349, Pematangsiantar 55974, DIY', '0779 6526 285', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(266, 2, 'yriyanti@example.net', '92928', 'Asman Winarno', 'Asman Winarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sutarto No. 574, Semarang 21963, MalUt', '0352 0251 606', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(267, 2, 'sudiati.darimin@example.net', '50177', 'Malika Purwanti', 'Malika Purwanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Abdul No. 113, Banjarmasin 77606, Banten', '(+62) 224 5863 6418', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(268, 2, 'maryadi87@example.net', '29596', 'Ajiono Nainggolan', 'Ajiono Nainggolan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baja No. 195, Balikpapan 31993, Gorontalo', '(+62) 319 0366 855', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(269, 2, 'ggunawan@example.com', '11935', 'Cemani Asirwanda Mangunsong S.Kom', 'Cemani Asirwanda Mangunsong S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Honggowongso No. 497, Kendari 35951, Lampung', '0859 0450 416', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(270, 2, 'napitupulu.sakura@example.org', '17058', 'Prasetyo Prakosa Anggriawan', 'Prasetyo Prakosa Anggriawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bass No. 348, Bogor 37268, Aceh', '0753 5349 0064', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(271, 2, 'yuliarti.cindy@example.com', '58575', 'Cemani Lazuardi', 'Cemani Lazuardi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bak Mandi No. 677, Administrasi Jakarta Selatan 97139, JaBar', '(+62) 703 5207 810', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(272, 2, 'balijan.oktaviani@example.org', '73389', 'Xanana Lamar Prasasta', 'Xanana Lamar Prasasta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Suharso No. 644, Tebing Tinggi 57272, NTB', '021 4144 938', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(273, 2, 'wacana.rahmi@example.org', '76975', 'Paiman Gunarto', 'Paiman Gunarto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Muwardi No. 364, Langsa 24612, Papua', '0494 5700 484', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(274, 2, 'gamanto69@example.com', '44209', 'Diah Nasyiah', 'Diah Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Daan No. 781, Kupang 65466, Bali', '(+62) 765 0228 220', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(275, 2, 'laksita.warji@example.com', '78426', 'Nurul Rahayu', 'Nurul Rahayu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Casablanca No. 715, Pariaman 77403, Lampung', '0836 9897 318', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(276, 2, 'gasti84@example.org', '53349', 'Maya Laksmiwati', 'Maya Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Industri No. 858, Palu 38405, SulUt', '(+62) 630 0039 126', NULL, 1, '2023-11-02 00:46:39', '2023-11-02 00:46:39'),
(277, 2, 'safitri.zelda@example.com', '69614', 'Emil Bakti Saragih', 'Emil Bakti Saragih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Jagakarsa No. 907, Gorontalo 72220, KalUt', '022 1198 870', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(278, 2, 'unjani.pradipta@example.com', '33357', 'Bancar Xanana Nainggolan M.M.', 'Bancar Xanana Nainggolan M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Babah No. 731, Madiun 87735, DIY', '(+62) 620 0723 001', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(279, 2, 'pratiwi.makuta@example.com', '87349', 'Patricia Salimah Melani', 'Patricia Salimah Melani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bambu No. 599, Administrasi Jakarta Barat 70348, SumUt', '0679 7591 7802', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(280, 2, 'baktiadi39@example.org', '49812', 'Harsanto Labuh Mansur', 'Harsanto Labuh Mansur', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Panjaitan No. 196, Administrasi Jakarta Timur 94067, Gorontalo', '(+62) 275 7988 7871', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(281, 2, 'jaeman.melani@example.org', '33760', 'Ade Haryanto S.Kom', 'Ade Haryanto S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Rumah Sakit No. 193, Administrasi Jakarta Barat 60933, SulTeng', '0812 0910 360', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(282, 2, 'bsetiawan@example.net', '37316', 'Luthfi Ardianto', 'Luthfi Ardianto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Nakula No. 942, Prabumulih 39536, KepR', '(+62) 262 9619 5909', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(283, 2, 'knajmudin@example.org', '7398', 'Oliva Paramita Yolanda', 'Oliva Paramita Yolanda', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Barat No. 252, Magelang 14580, KalTim', '023 8386 238', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(284, 2, 'vivi.hartati@example.org', '79531', 'Suci Zulaika', 'Suci Zulaika', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baranangsiang No. 311, Tidore Kepulauan 74971, JaTeng', '0489 5494 5268', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(285, 2, 'mila08@example.org', '29648', 'Kanda Maulana', 'Kanda Maulana', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bakti No. 920, Bogor 89253, SulUt', '(+62) 346 3990 235', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(286, 2, 'utama.vanya@example.org', '77876', 'Teddy Budiyanto', 'Teddy Budiyanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Achmad Yani No. 519, Cirebon 51283, JaTeng', '0939 4479 829', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(287, 2, 'qhutapea@example.com', '72693', 'Cahyanto Prasetyo', 'Cahyanto Prasetyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Rajiman No. 565, Tual 59600, SulUt', '(+62) 853 5417 9265', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(288, 2, 'ratna.wijayanti@example.org', '67457', 'Ratih Puspasari', 'Ratih Puspasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. R.E. Martadinata No. 16, Tarakan 47148, MalUt', '(+62) 867 781 031', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(289, 2, 'puspasari.puspa@example.net', '60665', 'Lili Usyi Lestari S.Kom', 'Lili Usyi Lestari S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Nanas No. 151, Denpasar 74548, KalSel', '(+62) 724 4481 463', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(290, 2, 'vyuliarti@example.net', '30479', 'Iriana Umi Kuswandari S.I.Kom', 'Iriana Umi Kuswandari S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Hasanuddin No. 35, Blitar 66524, PapBar', '0554 6052 974', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(291, 2, 'banara.rahayu@example.org', '51548', 'Jaka Permadi', 'Jaka Permadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sutarto No. 549, Sabang 47473, NTB', '(+62) 299 6007 6968', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(292, 2, 'aslijan11@example.net', '6256', 'Belinda Handayani', 'Belinda Handayani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baung No. 956, Singkawang 65052, BaBel', '0819 8412 718', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(293, 2, 'talia.marpaung@example.com', '72622', 'Jessica Usada', 'Jessica Usada', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Jakarta No. 20, Bogor 94606, Gorontalo', '(+62) 739 0139 5276', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(294, 2, 'zulfa54@example.org', '99688', 'Anastasia Amalia Hasanah S.Sos', 'Anastasia Amalia Hasanah S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bakau Griya Utama No. 79, Ternate 16272, Jambi', '(+62) 777 0291 604', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(295, 2, 'bmaheswara@example.net', '86389', 'Irwan Catur Simbolon', 'Irwan Catur Simbolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Umalas No. 540, Tidore Kepulauan 68729, Bali', '(+62) 440 5783 033', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(296, 2, 'kani92@example.net', '51018', 'Bakiman Tamba', 'Bakiman Tamba', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Jagakarsa No. 732, Parepare 62293, KalSel', '0477 0374 1859', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(297, 2, 'qwacana@example.net', '41946', 'Ani Yulianti S.T.', 'Ani Yulianti S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sukabumi No. 497, Tegal 95966, KalBar', '0608 8004 671', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(298, 2, 'imulyani@example.com', '89067', 'Kacung Jailani S.E.', 'Kacung Jailani S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Baabur Royan No. 443, Banjar 15329, Gorontalo', '023 1636 951', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(299, 2, 'jamal49@example.net', '42659', 'Clara Pertiwi', 'Clara Pertiwi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Gajah Mada No. 395, Padangsidempuan 21810, SumBar', '0293 6937 704', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(300, 2, 'lestari.prabowo@example.com', '44447', 'Halima Mardhiyah', 'Halima Mardhiyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Wora Wari No. 204, Pariaman 12442, PapBar', '(+62) 404 3905 0736', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(301, 2, 'grajasa@example.com', '69898', 'Karma Ramadan', 'Karma Ramadan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bhayangkara No. 290, Balikpapan 15152, SulSel', '(+62) 256 7811 885', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(302, 2, 'titi03@example.net', '38065', 'Labuh Maryadi', 'Labuh Maryadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Moch. Yamin No. 277, Balikpapan 62596, SulSel', '0441 9161 5687', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(303, 2, 'hlatupono@example.net', '48702', 'Tiara Wulandari', 'Tiara Wulandari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Suniaraja No. 161, Medan 60659, JaBar', '(+62) 350 0450 1143', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(304, 2, 'iwibowo@example.org', '66646', 'Gasti Wijayanti', 'Gasti Wijayanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bakau Griya Utama No. 4, Bengkulu 95876, SulUt', '0857 740 598', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(305, 2, 'hardana.najmudin@example.org', '98533', 'Maya Fujiati', 'Maya Fujiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Peta No. 82, Palembang 99343, NTB', '0862 624 417', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(306, 2, 'luwes.wacana@example.com', '19661', 'Puput Pia Nasyidah S.Kom', 'Puput Pia Nasyidah S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Dago No. 199, Lubuklinggau 99861, Aceh', '(+62) 711 0448 723', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(307, 2, 'kamila.maryati@example.com', '91301', 'Puspa Eva Agustina M.Pd', 'Puspa Eva Agustina M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Perintis Kemerdekaan No. 795, Langsa 45983, SumSel', '022 4882 905', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(308, 2, 'rahmi.lestari@example.org', '48307', 'Dimaz Pradana', 'Dimaz Pradana', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Pasirkoja No. 269, Administrasi Jakarta Pusat 69524, KalSel', '0514 0847 857', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(309, 2, 'kuswoyo.raharja@example.org', '44487', 'Putri Purnawati M.Ak', 'Putri Purnawati M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Untung Suropati No. 307, Dumai 84667, SumUt', '0859 5463 510', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(310, 2, 'yosef.uwais@example.net', '64917', 'Darijan Nashiruddin', 'Darijan Nashiruddin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Baranang No. 731, Langsa 13069, KalSel', '(+62) 479 9576 066', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(311, 2, 'yuniar.garda@example.com', '83906', 'Diah Lailasari', 'Diah Lailasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Honggowongso No. 694, Banjarmasin 29214, DKI', '(+62) 914 6964 3434', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(312, 2, 'ana.tamba@example.net', '17383', 'Gambira Waluyo S.Psi', 'Gambira Waluyo S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Merdeka No. 326, Subulussalam 56487, NTB', '0730 2631 679', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(313, 2, 'suryatmi.cakrabirawa@example.org', '53056', 'Yunita Rahmawati', 'Yunita Rahmawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. BKR No. 968, Tasikmalaya 90435, SulSel', '0289 1425 166', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(314, 2, 'jasmin00@example.org', '41747', 'Umi Hartati', 'Umi Hartati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bakau Griya Utama No. 245, Parepare 73125, PapBar', '0359 1120 897', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(315, 2, 'tiara.halimah@example.org', '26657', 'Zizi Yolanda M.Pd', 'Zizi Yolanda M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Raya Ujungberung No. 96, Administrasi Jakarta Timur 70285, Riau', '(+62) 542 4540 141', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(316, 2, 'nadine.farida@example.net', '69048', 'Marsito Simbolon', 'Marsito Simbolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Setiabudhi No. 784, Bitung 49924, Bali', '0272 6669 481', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(317, 2, 'fhardiansyah@example.net', '8012', 'Jasmin Suryatmi', 'Jasmin Suryatmi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Baabur Royan No. 957, Bukittinggi 11347, JaBar', '0810 668 385', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(318, 2, 'rachel.simanjuntak@example.net', '58967', 'Melinda Carla Utami', 'Melinda Carla Utami', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Rumah Sakit No. 960, Pontianak 99560, Jambi', '(+62) 393 1788 1327', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(319, 2, 'mursita.samosir@example.com', '2405', 'Yono Irfan Pratama', 'Yono Irfan Pratama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Pasir Koja No. 508, Padang 81779, KalSel', '(+62) 633 4519 174', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(320, 2, 'osuwarno@example.com', '21246', 'Shakila Widya Hartati', 'Shakila Widya Hartati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Basuki No. 696, Samarinda 19149, SulSel', '(+62) 945 2838 782', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(321, 2, 'kajen34@example.com', '56503', 'Darmaji Pratama', 'Darmaji Pratama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Soekarno Hatta No. 95, Medan 25577, KepR', '0917 6704 982', NULL, 1, '2023-11-02 00:46:40', '2023-11-02 00:46:40'),
(322, 2, 'vdabukke@example.org', '45549', 'Melinda Purwanti S.E.', 'Melinda Purwanti S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Pahlawan No. 361, Padang 34432, Gorontalo', '0802 951 960', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(323, 2, 'inamaga@example.net', '60163', 'Dinda Utami S.H.', 'Dinda Utami S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Suniaraja No. 393, Pekalongan 28864, SumBar', '(+62) 708 1190 0297', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(324, 2, 'purnawati.sakti@example.com', '32497', 'Baktianto Sihotang', 'Baktianto Sihotang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. BKR No. 760, Administrasi Jakarta Utara 41652, JaBar', '0678 5841 463', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(325, 2, 'padma.prayoga@example.net', '73847', 'Olivia Namaga', 'Olivia Namaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baabur Royan No. 143, Tebing Tinggi 74661, Bengkulu', '(+62) 623 2921 8428', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(326, 2, 'blaksita@example.org', '10301', 'Vera Palastri', 'Vera Palastri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Padma No. 315, Magelang 91985, SumSel', '(+62) 621 6079 4729', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(327, 2, 'qsudiati@example.com', '35022', 'Sari Winarsih S.T.', 'Sari Winarsih S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Madiun No. 712, Sawahlunto 65750, KepR', '(+62) 449 2849 0907', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(328, 2, 'manah40@example.com', '74615', 'Indah Ellis Lestari', 'Indah Ellis Lestari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Untung Suropati No. 525, Tangerang 39468, Lampung', '0538 5140 5839', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(329, 2, 'kayla.budiyanto@example.net', '30984', 'Eja Makuta Hutapea S.E.', 'Eja Makuta Hutapea S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Baranang Siang Indah No. 299, Tomohon 51947, KalBar', '(+62) 359 2409 543', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(330, 2, 'tlestari@example.org', '4459', 'Prabawa Saefullah', 'Prabawa Saefullah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bank Dagang Negara No. 330, Surabaya 84919, SumUt', '0397 8591 4874', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(331, 2, 'fpertiwi@example.org', '78732', 'Rahmat Mansur', 'Rahmat Mansur', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Gremet No. 123, Probolinggo 50164, SulBar', '0885 4933 202', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(332, 2, 'betania48@example.net', '12271', 'Pandu Nababan S.E.', 'Pandu Nababan S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bakit  No. 408, Pekanbaru 62308, BaBel', '(+62) 495 9279 6915', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(333, 2, 'siregar.jamal@example.net', '38674', 'Keisha Wani Hartati', 'Keisha Wani Hartati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bah Jaya No. 733, Singkawang 38013, KalBar', '0382 3489 530', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(334, 2, 'ani81@example.com', '82362', 'Leo Pratama', 'Leo Pratama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Padang No. 248, Payakumbuh 83247, KalTim', '(+62) 675 9489 6741', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(335, 2, 'padma.manullang@example.net', '7986', 'Genta Suryatmi', 'Genta Suryatmi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ujung No. 119, Lhokseumawe 39159, NTB', '(+62) 429 7717 097', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(336, 2, 'adika.waskita@example.com', '5017', 'Damu Simbolon', 'Damu Simbolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Dahlia No. 367, Bukittinggi 65227, NTT', '(+62) 734 4022 860', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(337, 2, 'nova43@example.net', '47732', 'Paulin Lestari', 'Paulin Lestari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Wahid Hasyim No. 71, Kediri 69016, SumBar', '(+62) 879 658 675', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(338, 2, 'anastasia21@example.net', '2518', 'Intan Yuliarti', 'Intan Yuliarti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bawal No. 55, Sukabumi 69252, SumSel', '(+62) 29 4215 097', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(339, 2, 'dprayoga@example.org', '58827', 'Laila Pertiwi', 'Laila Pertiwi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. K.H. Maskur No. 727, Bau-Bau 97128, SumSel', '(+62) 644 3431 309', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(340, 2, 'mnurdiyanti@example.net', '30251', 'Galih Saefullah', 'Galih Saefullah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sentot Alibasa No. 238, Kendari 18714, SulBar', '(+62) 868 0268 7490', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(341, 2, 'galiono93@example.com', '54317', 'Siska Suryatmi', 'Siska Suryatmi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Baladewa No. 444, Magelang 70594, Jambi', '0220 3490 003', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(342, 2, 'dewi.mangunsong@example.org', '86285', 'Carub Tasnim Budiyanto', 'Carub Tasnim Budiyanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bank Dagang Negara No. 889, Pariaman 49161, NTB', '(+62) 292 2865 171', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(343, 2, 'intan02@example.com', '79523', 'Karta Wacana', 'Karta Wacana', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Uluwatu No. 866, Surabaya 33743, Bali', '(+62) 580 0718 7466', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(344, 2, 'agustina.victoria@example.org', '58953', 'Gilang Nainggolan S.T.', 'Gilang Nainggolan S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Kebonjati No. 785, Makassar 81313, Gorontalo', '0407 7389 9776', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(345, 2, 'rmanullang@example.org', '19292', 'Ganep Prasetyo S.Gz', 'Ganep Prasetyo S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Ujung No. 428, Pekanbaru 78211, JaTim', '0484 3849 442', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(346, 2, 'lwijaya@example.org', '38045', 'Zelaya Uyainah', 'Zelaya Uyainah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Pacuan Kuda No. 890, Jayapura 41941, SumBar', '(+62) 472 5456 401', NULL, 1, '2023-11-02 00:46:41', '2023-11-02 00:46:41'),
(348, 2, 'kani.riyanti@example.net', '31136340', 'Cahyo Budiyanto', 'Cahyo Budiyanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Batako No. 742, Magelang 39444, Papua', '0330 8839 1419', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(349, 2, 'indra.nasyidah@example.com', '91743914', 'Daniswara Wahyudin', 'Daniswara Wahyudin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Juanda No. 438, Palembang 26267, Maluku', '0880 255 004', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(350, 2, 'xhassanah@example.net', '38987972', 'Oliva Nuraini', 'Oliva Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Achmad Yani No. 639, Binjai 47994, SulBar', '0895 7181 635', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(351, 2, 'tiara63@example.org', '90773309', 'Perkasa Ramadan', 'Perkasa Ramadan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Yap Tjwan Bing No. 813, Tanjungbalai 23589, KalSel', '(+62) 20 3819 5016', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(352, 2, 'galar28@example.org', '77643794', 'Samiah Usada', 'Samiah Usada', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sunaryo No. 888, Bontang 88417, NTT', '0882 3456 3146', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(353, 2, 'maryati.umar@example.org', '61719261', 'Ciaobella Halimah', 'Ciaobella Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Haji No. 815, Tual 70322, JaBar', '0628 3606 6579', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(354, 2, 'lailasari.zulaikha@example.org', '64416439', 'Wage Maryadi', 'Wage Maryadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Suharso No. 195, Bandar Lampung 93390, Maluku', '(+62) 22 4548 106', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(355, 2, 'hasanah.elvina@example.com', '61427671', 'Nalar Hadi Damanik S.Kom', 'Nalar Hadi Damanik S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Basmol Raya No. 492, Samarinda 34953, SulTeng', '0765 3631 4134', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(356, 2, 'kdamanik@example.net', '56145951', 'Manah Mangunsong S.Gz', 'Manah Mangunsong S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Baung No. 677, Surakarta 55588, KalUt', '0805 9055 7952', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(357, 2, 'mardhiyah.galih@example.com', '33149609', 'Jati Praba Januar', 'Jati Praba Januar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Nakula No. 788, Salatiga 78829, KalBar', '0284 7379 2407', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(358, 2, 'agustina.alambana@example.com', '54713718', 'Raden Thamrin', 'Raden Thamrin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Tambun No. 795, Bengkulu 88220, SulSel', '0660 4976 0079', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(359, 2, 'tampubolon.vivi@example.org', '57970208', 'Melinda Puspasari', 'Melinda Puspasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baladewa No. 368, Tangerang 96242, SulTra', '0954 6687 2947', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20');
INSERT INTO `students` (`id`, `class_id`, `email`, `identity_number`, `full_name`, `username`, `password`, `gender`, `address`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(360, 2, 'ikin.permadi@example.com', '40899060', 'Cahya Firmansyah', 'Cahya Firmansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Gremet No. 185, Tanjung Pinang 54620, Bengkulu', '(+62) 786 9421 3451', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(361, 2, 'wsitumorang@example.com', '12697761', 'Joko Darman Anggriawan', 'Joko Darman Anggriawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Ujung No. 905, Malang 88739, BaBel', '0233 6836 0033', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(362, 2, 'suryatmi.putu@example.net', '66559090', 'Lukita Saefullah S.T.', 'Lukita Saefullah S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Sugiyopranoto No. 544, Tasikmalaya 52790, Bali', '0349 6625 4967', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(363, 2, 'faizah05@example.com', '5731686', 'Mariadi Salahudin', 'Mariadi Salahudin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Ujung No. 908, Langsa 12139, KalBar', '(+62) 865 526 875', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(364, 2, 'eman.tampubolon@example.com', '9345017', 'Yoga Lazuardi S.IP', 'Yoga Lazuardi S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Moch. Yamin No. 759, Bitung 49799, KalTim', '(+62) 300 5818 6557', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(365, 2, 'betania.wijayanti@example.org', '94710967', 'Ciaobella Mulyani', 'Ciaobella Mulyani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Padang No. 945, Gunungsitoli 65069, KalTim', '(+62) 859 3559 951', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(366, 2, 'mustika53@example.net', '30205803', 'Raden Waskita', 'Raden Waskita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Cokroaminoto No. 904, Mataram 66556, Lampung', '(+62) 439 2086 0446', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(367, 2, 'balamantri.siregar@example.org', '52492314', 'Eko Harsana Mansur', 'Eko Harsana Mansur', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Rajiman No. 376, Langsa 23415, Jambi', '0501 7624 827', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(368, 2, 'wastuti.cawisono@example.net', '55928240', 'Rahmi Haryanti', 'Rahmi Haryanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Juanda No. 438, Pasuruan 91271, Riau', '(+62) 728 5019 460', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(369, 2, 'jamalia08@example.com', '73203800', 'Rendy Prabowo', 'Rendy Prabowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Radio No. 825, Padangsidempuan 76834, Gorontalo', '0910 7678 482', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(370, 2, 'virman69@example.org', '99008269', 'Dono Simbolon S.Ked', 'Dono Simbolon S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Baiduri No. 464, Bau-Bau 34268, BaBel', '(+62) 555 7047 974', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(371, 2, 'zulaika.luhung@example.com', '67829760', 'Cahyo Damanik', 'Cahyo Damanik', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Warga No. 392, Padang 44268, Jambi', '0450 5962 788', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(372, 2, 'wijayanti.daniswara@example.com', '48481056', 'Lega Luluh Budiyanto', 'Lega Luluh Budiyanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Gading No. 67, Manado 52881, Maluku', '0247 4306 613', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(373, 2, 'janet59@example.net', '79784856', 'Ani Zulaika', 'Ani Zulaika', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baranang Siang Indah No. 924, Tangerang 84551, SulUt', '0576 8649 5036', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(374, 2, 'unggul.permata@example.org', '80695907', 'Cici Mardhiyah', 'Cici Mardhiyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Jagakarsa No. 444, Pagar Alam 74209, Riau', '0917 4313 792', NULL, 1, '2023-11-02 00:48:20', '2023-11-02 00:48:20'),
(375, 2, 'karja28@example.com', '31459874', 'Calista Susanti S.Sos', 'Calista Susanti S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Achmad No. 223, Gorontalo 62826, DKI', '0286 6010 014', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(376, 2, 'lhardiansyah@example.com', '68664454', 'Janet Farhunnisa Yuniar M.Kom.', 'Janet Farhunnisa Yuniar M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Flores No. 753, Tanjungbalai 20041, SulBar', '0270 8223 8475', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(377, 2, 'lanang37@example.net', '45915032', 'Sari Ratih Yuniar', 'Sari Ratih Yuniar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Cut Nyak Dien No. 684, Tomohon 40394, Aceh', '0952 8991 749', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(378, 2, 'warji.melani@example.org', '5377744', 'Wardi Iswahyudi', 'Wardi Iswahyudi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sutarto No. 656, Yogyakarta 81447, NTB', '(+62) 381 1633 701', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(379, 2, 'haryanto.chelsea@example.com', '97926235', 'Ika Mulyani', 'Ika Mulyani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Orang No. 696, Palu 47705, Papua', '0682 4929 132', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(380, 2, 'asirwanda04@example.net', '23623955', 'Reksa Simbolon', 'Reksa Simbolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Rumah Sakit No. 709, Padangsidempuan 45751, Bali', '(+62) 850 3724 4829', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(381, 2, 'pradana.gaman@example.org', '85471205', 'Aurora Queen Pertiwi S.Farm', 'Aurora Queen Pertiwi S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Tentara Pelajar No. 149, Yogyakarta 89502, SumSel', '(+62) 26 4431 445', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(382, 2, 'radit.samosir@example.net', '28799426', 'Bagiya Manullang', 'Bagiya Manullang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Dr. Junjunan No. 11, Bandar Lampung 38355, SumBar', '(+62) 606 4202 410', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(383, 2, 'bakiadi82@example.org', '71349924', 'Cengkir Utama', 'Cengkir Utama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Yohanes No. 970, Tarakan 50193, KalTim', '0897 3351 709', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(384, 2, 'maman46@example.net', '14691859', 'Limar Tarihoran', 'Limar Tarihoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Ters. Pasir Koja No. 717, Tual 73788, KepR', '028 9038 4869', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(385, 2, 'chandra.melani@example.com', '30329080', 'Johan Utama', 'Johan Utama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Yap Tjwan Bing No. 656, Administrasi Jakarta Utara 30913, DKI', '(+62) 445 9708 5070', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(386, 2, 'puspa.lailasari@example.org', '23575367', 'Caraka Cawisadi Suwarno', 'Caraka Cawisadi Suwarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Baja No. 626, Prabumulih 62042, DKI', '0860 2261 6559', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(387, 2, 'sbudiyanto@example.com', '93902203', 'Mala Hariyah', 'Mala Hariyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Kebonjati No. 803, Kotamobagu 39641, Riau', '0636 5181 070', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(388, 2, 'vera50@example.com', '3428752', 'Putri Pudjiastuti', 'Putri Pudjiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Kiaracondong No. 261, Cimahi 24570, Bali', '(+62) 941 0149 4212', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(389, 2, 'firgantoro.yuliana@example.net', '43122875', 'Gawati Victoria Suartini', 'Gawati Victoria Suartini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Untung Suropati No. 713, Tomohon 93296, MalUt', '(+62) 314 0020 0927', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(390, 2, 'lala.hassanah@example.net', '17881945', 'Setya Waskita', 'Setya Waskita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Achmad No. 92, Palu 63261, DKI', '(+62) 576 1868 9421', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(391, 2, 'mujur02@example.com', '41710254', 'Taufik Dabukke', 'Taufik Dabukke', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Otto No. 761, Manado 17054, JaBar', '(+62) 825 664 174', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(392, 2, 'yance31@example.net', '39169235', 'Nilam Mayasari S.Sos', 'Nilam Mayasari S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Babakan No. 724, Administrasi Jakarta Utara 95594, Maluku', '0391 7486 4484', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(393, 2, 'rahayu74@example.com', '73245861', 'Umay Sihombing', 'Umay Sihombing', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bahagia No. 35, Depok 76754, KalSel', '0391 1338 2787', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(394, 2, 'eka31@example.net', '94593120', 'Nadia Palastri', 'Nadia Palastri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Padang No. 738, Pekanbaru 67838, SumSel', '(+62) 668 8558 411', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(395, 2, 'huyainah@example.org', '64391680', 'Hasna Endah Mardhiyah M.M.', 'Hasna Endah Mardhiyah M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Mahakam No. 32, Batam 38093, Banten', '0851 2349 494', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(396, 2, 'galiono64@example.org', '39480257', 'Ayu Wijayanti', 'Ayu Wijayanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bak Air No. 660, Semarang 95604, JaTim', '0702 6351 0844', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(397, 2, 'usyi68@example.net', '32586306', 'Waluyo Mansur', 'Waluyo Mansur', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Kalimantan No. 84, Sorong 77951, DKI', '027 7587 2844', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(398, 2, 'lembah25@example.org', '82941554', 'Wardi Sinaga S.H.', 'Wardi Sinaga S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Gotong Royong No. 142, Sibolga 74266, Bengkulu', '(+62) 297 9122 477', NULL, 1, '2023-11-02 00:48:21', '2023-11-02 00:48:21'),
(399, 2, 'maimunah.manullang@example.org', '27243854', 'Paiman Adriansyah', 'Paiman Adriansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Peta No. 599, Langsa 98541, Lampung', '0898 8951 9986', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(400, 2, 'damanik.padmi@example.org', '82077055', 'Empluk Radit Mansur', 'Empluk Radit Mansur', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Elang No. 507, Gorontalo 81292, BaBel', '(+62) 847 5539 8366', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(401, 2, 'wakiman.andriani@example.org', '68978256', 'Irma Maimunah Utami M.TI.', 'Irma Maimunah Utami M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Banal No. 776, Cilegon 58383, SulUt', '(+62) 955 0337 4815', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(402, 2, 'oktaviani.lili@example.com', '46123174', 'Abyasa Napitupulu', 'Abyasa Napitupulu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Basmol Raya No. 520, Tidore Kepulauan 69898, SulUt', '(+62) 567 4310 155', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(403, 2, 'tamba.mulyanto@example.org', '92077676', 'Lili Fitriani Fujiati S.Gz', 'Lili Fitriani Fujiati S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Wahid No. 432, Kotamobagu 71232, KalTeng', '0870 957 378', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(404, 2, 'nrima82@example.net', '23353867', 'Zulaikha Handayani', 'Zulaikha Handayani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Pasteur No. 99, Tomohon 45695, Papua', '027 2297 929', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(405, 2, 'gangsa92@example.com', '15184208', 'Eva Padma Astuti S.Ked', 'Eva Padma Astuti S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. HOS. Cjokroaminoto (Pasirkaliki) No. 914, Jayapura 73830, KalTeng', '(+62) 821 0771 118', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(406, 2, 'maheswara.kenari@example.com', '32681055', 'Ida Mardhiyah S.Pd', 'Ida Mardhiyah S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Laswi No. 767, Sabang 90037, KalTim', '0302 7445 276', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(407, 2, 'margana95@example.net', '6109170', 'Gaduh Hidayat S.IP', 'Gaduh Hidayat S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Sudiarto No. 69, Bekasi 93844, SulTra', '0983 4239 5123', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(408, 2, 'yulianti.ami@example.net', '87654471', 'Parman Haryanto', 'Parman Haryanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Agus Salim No. 358, Sukabumi 40584, Lampung', '0379 4332 990', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(409, 2, 'kuswandari.ibrani@example.org', '82937642', 'Balamantri Prayoga', 'Balamantri Prayoga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Lumban Tobing No. 935, Denpasar 26772, SulUt', '(+62) 640 6273 459', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(410, 2, 'eva92@example.net', '85536953', 'Putri Yulianti', 'Putri Yulianti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Hasanuddin No. 100, Tanjung Pinang 27311, KepR', '(+62) 295 4819 629', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(411, 2, 'damar01@example.org', '28319716', 'Putri Winarsih', 'Putri Winarsih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. PHH. Mustofa No. 664, Pontianak 53149, KepR', '(+62) 346 3168 852', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(412, 2, 'margana46@example.com', '41672139', 'Maida Rahmawati M.Farm', 'Maida Rahmawati M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Astana Anyar No. 500, Dumai 72869, NTB', '0656 5594 088', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(413, 2, 'uandriani@example.com', '52987995', 'Wahyu Dipa Waskita M.M.', 'Wahyu Dipa Waskita M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Barasak No. 333, Sorong 71565, KalTeng', '0787 8328 971', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(414, 2, 'kasim81@example.com', '13202360', 'Karimah Widiastuti', 'Karimah Widiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Gading No. 919, Sabang 40188, Bali', '0365 5055 4552', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(415, 2, 'omar.namaga@example.net', '99539284', 'Amelia Hani Novitasari S.Pt', 'Amelia Hani Novitasari S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Cokroaminoto No. 326, Surabaya 16688, JaBar', '(+62) 464 5862 7866', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(416, 2, 'rnapitupulu@example.com', '5362605', 'Ajeng Suartini', 'Ajeng Suartini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Kebangkitan Nasional No. 581, Singkawang 42039, PapBar', '0500 0874 7676', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(417, 2, 'ismail41@example.net', '75862688', 'Novi Diah Nuraini S.E.I', 'Novi Diah Nuraini S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Raden No. 956, Tarakan 65099, KepR', '(+62) 21 7164 977', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(418, 2, 'wardaya.hakim@example.com', '92565456', 'Ibrahim Saptono', 'Ibrahim Saptono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Flora No. 35, Tomohon 28602, KalUt', '0954 9247 349', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(419, 2, 'pertiwi.ayu@example.net', '70454623', 'Ajeng Natalia Suartini', 'Ajeng Natalia Suartini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Rajawali Timur No. 52, Medan 69799, KalTeng', '0644 3531 394', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(420, 2, 'halim.drajat@example.com', '64456678', 'Alambana Mangunsong S.E.', 'Alambana Mangunsong S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Sam Ratulangi No. 357, Binjai 95226, DKI', '0636 9819 7300', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(421, 2, 'pudjiastuti.kani@example.net', '97196904', 'Lamar Jabal Jailani', 'Lamar Jabal Jailani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bakaru No. 145, Pangkal Pinang 17094, SumUt', '0594 4567 917', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(422, 2, 'kuswandari.maria@example.org', '46142217', 'Among Rajasa', 'Among Rajasa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Ters. Jakarta No. 542, Serang 59212, DKI', '(+62) 205 5131 865', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(423, 2, 'cinta.wijaya@example.net', '63582313', 'Rizki Mustofa', 'Rizki Mustofa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Juanda No. 822, Sungai Penuh 50921, Bengkulu', '(+62) 490 4009 3737', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(424, 2, 'tlazuardi@example.net', '61782914', 'Putri Rini Nasyidah S.I.Kom', 'Putri Rini Nasyidah S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Madiun No. 702, Yogyakarta 32773, DIY', '(+62) 673 3393 179', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(425, 2, 'wacana.padmi@example.net', '89965578', 'Jessica Usamah', 'Jessica Usamah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bawal No. 346, Bau-Bau 57498, MalUt', '(+62) 523 0133 018', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(426, 2, 'yulia.rahmawati@example.com', '44278737', 'Laila Najwa Utami', 'Laila Najwa Utami', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ters. Jakarta No. 4, Palopo 53428, KalTim', '0845 321 231', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(427, 2, 'jinawi04@example.net', '3027381', 'Siska Hassanah M.Pd', 'Siska Hassanah M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Diponegoro No. 499, Padang 31356, SumUt', '0908 2535 9388', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(428, 2, 'farhunnisa.adriansyah@example.org', '7605179', 'Jelita Palastri M.Pd', 'Jelita Palastri M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Raden Saleh No. 870, Palopo 93172, Riau', '(+62) 21 6286 159', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(429, 2, 'rajata.martani@example.com', '23742974', 'Ida Zulfa Pertiwi', 'Ida Zulfa Pertiwi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Banda No. 280, Administrasi Jakarta Utara 27778, JaTim', '(+62) 313 8440 9268', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(430, 2, 'fitriani02@example.org', '59011115', 'Melinda Nova Rahmawati S.Ked', 'Melinda Nova Rahmawati S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Jakarta No. 316, Kendari 77218, SulSel', '026 4669 3682', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(431, 2, 'hastuti.nabila@example.net', '96960296', 'Titin Prastuti', 'Titin Prastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Kyai Mojo No. 646, Banjarbaru 38738, SumUt', '(+62) 384 1942 624', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(432, 2, 'kusmawati.daliman@example.com', '41902859', 'Rusman Nababan', 'Rusman Nababan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Gotong Royong No. 335, Mataram 53170, SulTeng', '0792 5501 162', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(433, 2, 'imaryati@example.org', '52852472', 'Rafid Ramadan', 'Rafid Ramadan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Camar No. 89, Bitung 49571, KalTeng', '0588 4674 662', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(434, 2, 'ciaobella29@example.com', '96747823', 'Banawi Samosir', 'Banawi Samosir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Baranangsiang No. 17, Jambi 43768, NTB', '(+62) 244 7579 3795', NULL, 1, '2023-11-02 00:48:22', '2023-11-02 00:48:22'),
(435, 2, 'mustofa.paiman@example.com', '70578137', 'Tami Karen Puspita', 'Tami Karen Puspita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Ki Hajar Dewantara No. 381, Batam 72417, SulUt', '(+62) 728 5624 6405', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(436, 2, 'pangestu.amalia@example.net', '8991627', 'Sari Rahayu', 'Sari Rahayu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. S. Parman No. 365, Tomohon 67492, SumUt', '(+62) 590 6267 982', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(437, 2, 'ajimin.siregar@example.org', '25207498', 'Gasti Aisyah Nasyiah', 'Gasti Aisyah Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Diponegoro No. 713, Dumai 31404, KalBar', '0885 714 219', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(438, 2, 'indra.lailasari@example.com', '49974549', 'Vera Zulaikha Prastuti S.E.I', 'Vera Zulaikha Prastuti S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Muwardi No. 560, Palu 47890, Banten', '(+62) 621 9572 406', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(439, 2, 'cyolanda@example.org', '90777120', 'Mustofa Waskita', 'Mustofa Waskita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Dago No. 190, Langsa 47887, JaBar', '0609 7807 6510', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(440, 2, 'oktaviani.karen@example.org', '28273829', 'Dewi Nurdiyanti S.E.', 'Dewi Nurdiyanti S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Jayawijaya No. 142, Solok 76747, NTB', '(+62) 491 3401 941', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(441, 2, 'laksmiwati.almira@example.org', '83018085', 'Zizi Hariyah', 'Zizi Hariyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Yap Tjwan Bing No. 12, Balikpapan 71095, KalSel', '(+62) 26 6756 090', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(442, 2, 'ganda.susanti@example.org', '36556772', 'Agnes Wahyuni S.Pd', 'Agnes Wahyuni S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Jend. A. Yani No. 706, Sungai Penuh 50387, NTB', '0727 7691 0869', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(443, 2, 'vrahimah@example.net', '71601252', 'Yance Winarsih', 'Yance Winarsih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Abdul No. 927, Pekalongan 98826, SulTeng', '(+62) 543 7621 680', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(444, 2, 'maryati.karma@example.org', '30647789', 'Praba Wijaya', 'Praba Wijaya', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ters. Buah Batu No. 953, Yogyakarta 73897, Lampung', '(+62) 289 5336 6799', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(445, 2, 'darmaji73@example.net', '37054742', 'Betania Padmasari', 'Betania Padmasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Cikutra Barat No. 418, Blitar 55166, Bengkulu', '(+62) 577 4284 734', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(446, 2, 'otampubolon@example.com', '92184095', 'Diana Wijayanti S.E.', 'Diana Wijayanti S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sugiyopranoto No. 276, Tarakan 69927, JaBar', '(+62) 811 9591 992', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(447, 2, 'wadi.hartati@example.com', '3276728', 'Bella Melani', 'Bella Melani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Supomo No. 66, Balikpapan 71238, PapBar', '(+62) 529 0457 184', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(448, 2, 'aramadan@example.org', '24951541', 'Gandewa Wibowo', 'Gandewa Wibowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Wahidin No. 353, Blitar 39655, SumUt', '0563 4151 3518', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(449, 2, 'santoso.lasmanto@example.net', '6366319', 'Mulya Cecep Ardianto', 'Mulya Cecep Ardianto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Yoga No. 100, Parepare 50590, KalUt', '0405 5039 660', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(450, 2, 'cakrabuana.januar@example.org', '55157190', 'Raina Michelle Oktaviani', 'Raina Michelle Oktaviani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bayan No. 650, Bitung 72069, Aceh', '0838 3216 472', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(451, 2, 'widiastuti.maria@example.com', '6129336', 'Cornelia Nurdiyanti', 'Cornelia Nurdiyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bakit  No. 348, Pekalongan 69215, KalBar', '0523 3055 2945', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(452, 2, 'spadmasari@example.com', '45947346', 'Estiono Mustofa', 'Estiono Mustofa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Pacuan Kuda No. 397, Sorong 49490, KalSel', '0704 3687 271', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(453, 2, 'rajata.mitra@example.net', '71873628', 'Wulan Ghaliyati Usada', 'Wulan Ghaliyati Usada', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Honggowongso No. 206, Solok 13044, JaTim', '0919 6980 778', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(454, 2, 'prabowo.gaman@example.org', '20794284', 'Eka Wibisono S.Gz', 'Eka Wibisono S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Honggowongso No. 43, Surabaya 33957, Jambi', '0497 2270 9773', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(455, 2, 'sabrina.nababan@example.com', '89248548', 'Jatmiko Wacana', 'Jatmiko Wacana', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Basmol Raya No. 718, Pagar Alam 42863, KepR', '(+62) 788 4007 176', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(456, 2, 'mandasari.talia@example.net', '12404721', 'Reksa Pradana', 'Reksa Pradana', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bakit  No. 44, Semarang 12597, Bengkulu', '0228 4728 234', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(457, 2, 'xmelani@example.org', '82277294', 'Calista Laksita M.M.', 'Calista Laksita M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Moch. Yamin No. 904, Batu 99876, MalUt', '(+62) 881 8511 947', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(458, 2, 'tampubolon.raden@example.net', '19293986', 'Okto Harjo Samosir S.E.I', 'Okto Harjo Samosir S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Wahidin No. 511, Administrasi Jakarta Utara 23247, Jambi', '0715 6661 1512', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(459, 2, 'alika.permata@example.com', '96933595', 'Sakura Nuraini', 'Sakura Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Cikutra Timur No. 788, Banjar 45523, Lampung', '(+62) 999 5612 9299', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(460, 2, 'zhidayanto@example.com', '32713204', 'Kusuma Bakiman Hutasoit S.Pd', 'Kusuma Bakiman Hutasoit S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Camar No. 412, Administrasi Jakarta Utara 33765, Lampung', '(+62) 528 9933 6902', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(461, 2, 'pangestu.budi@example.com', '75830264', 'Gawati Usyi Suartini', 'Gawati Usyi Suartini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sutan Syahrir No. 262, Yogyakarta 53132, KalTeng', '(+62) 23 9859 8201', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(462, 2, 'yosef.maheswara@example.org', '72590338', 'Arta Anggriawan S.E.I', 'Arta Anggriawan S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Monginsidi No. 831, Payakumbuh 95183, MalUt', '0932 0950 0185', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(463, 2, 'maryadi.daru@example.net', '93854548', 'Suci Zahra Susanti S.E.', 'Suci Zahra Susanti S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Basoka No. 337, Tidore Kepulauan 24158, SumBar', '020 6808 9221', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(464, 2, 'ajimat.yuniar@example.com', '48922327', 'Samiah Tira Yolanda', 'Samiah Tira Yolanda', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bakau Griya Utama No. 959, Administrasi Jakarta Pusat 94280, PapBar', '(+62) 214 1988 1377', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(465, 2, 'xzulaika@example.org', '81957284', 'Silvia Rahimah', 'Silvia Rahimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Jaksa No. 737, Bandar Lampung 59883, NTT', '0441 8927 9540', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(466, 2, 'nadine.utama@example.org', '68605595', 'Ibrahim Caket Tampubolon', 'Ibrahim Caket Tampubolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Yohanes No. 279, Sungai Penuh 77527, NTT', '0385 1652 601', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(467, 2, 'martana98@example.net', '25713157', 'Utama Jailani', 'Utama Jailani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. M.T. Haryono No. 350, Singkawang 34988, Jambi', '0447 4140 243', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(468, 2, 'prasasta.muhammad@example.net', '60350726', 'Irwan Zulkarnain', 'Irwan Zulkarnain', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Padang No. 810, Tasikmalaya 79588, SulBar', '(+62) 936 6569 672', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(469, 2, 'laksita.yulia@example.com', '84478045', 'Martana Maryadi S.Psi', 'Martana Maryadi S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Labu No. 584, Tanjungbalai 79932, SulTeng', '(+62) 27 8406 336', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(470, 2, 'tasnim27@example.com', '80918358', 'Rafid Capa Haryanto S.Pd', 'Rafid Capa Haryanto S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Kalimantan No. 991, Tangerang Selatan 10275, SulTeng', '(+62) 748 5327 314', NULL, 1, '2023-11-02 00:48:23', '2023-11-02 00:48:23'),
(471, 2, 'zusada@example.net', '97428667', 'Ifa Lalita Prastuti S.Farm', 'Ifa Lalita Prastuti S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Thamrin No. 895, Bengkulu 31028, Lampung', '(+62) 994 2403 1220', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(472, 2, 'upuspasari@example.org', '48596226', 'Winda Anastasia Nasyidah M.TI.', 'Winda Anastasia Nasyidah M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Baranangsiang No. 649, Sungai Penuh 87820, Aceh', '(+62) 819 488 618', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(473, 2, 'puput.nasyidah@example.com', '55050411', 'Dirja Kasim Pradipta S.E.I', 'Dirja Kasim Pradipta S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bahagia No. 575, Singkawang 84681, SulTra', '(+62) 598 3870 182', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(474, 2, 'jayadi.handayani@example.net', '29954247', 'Diana Septi Zulaika', 'Diana Septi Zulaika', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Ki Hajar Dewantara No. 483, Dumai 96186, KalSel', '(+62) 232 9197 2376', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(475, 2, 'gandi.najmudin@example.com', '44459129', 'Ida Suartini S.Pd', 'Ida Suartini S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Teuku Umar No. 524, Samarinda 87195, Papua', '(+62) 791 7707 6427', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(476, 2, 'ghidayanto@example.org', '9938634', 'Balidin Simanjuntak S.E.', 'Balidin Simanjuntak S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Astana Anyar No. 168, Dumai 33355, Riau', '0658 4647 2095', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(477, 2, 'wardi.utami@example.net', '79338397', 'Oman Utama', 'Oman Utama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Abdul Rahmat No. 826, Depok 89071, KalTeng', '(+62) 770 1176 2496', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(478, 2, 'cemplunk65@example.org', '35270805', 'Jarwi Rajasa', 'Jarwi Rajasa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Mulyadi No. 99, Kendari 33434, KalTim', '(+62) 673 9874 446', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(479, 2, 'wahyuni.eluh@example.org', '22110122', 'Indra Dartono Pradana S.Pd', 'Indra Dartono Pradana S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Jakarta No. 227, Pontianak 23834, BaBel', '(+62) 856 445 548', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(480, 2, 'heryanto72@example.org', '18547864', 'Prayogo Samosir', 'Prayogo Samosir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Rajawali Timur No. 76, Dumai 25848, JaTim', '023 0075 484', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(481, 2, 'pangestu63@example.net', '37971650', 'Latif Saefullah', 'Latif Saefullah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. M.T. Haryono No. 650, Subulussalam 58624, DIY', '(+62) 546 4745 467', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(482, 2, 'ghassanah@example.org', '80251641', 'Kuncara Caturangga Firmansyah', 'Kuncara Caturangga Firmansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sutoyo No. 163, Pagar Alam 47542, JaBar', '(+62) 448 5228 2504', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(483, 2, 'usaputra@example.org', '83259373', 'Ikhsan Najmudin', 'Ikhsan Najmudin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Taman No. 198, Gorontalo 97345, SumBar', '(+62) 504 8476 269', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(484, 2, 'hasanah.kayla@example.org', '85681383', 'Nasim Hardiansyah S.Sos', 'Nasim Hardiansyah S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Kali No. 623, Makassar 22707, KalSel', '0680 6328 4235', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(485, 2, 'jfujiati@example.com', '11676328', 'Icha Puti Rahimah', 'Icha Puti Rahimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Camar No. 857, Gorontalo 67961, Gorontalo', '0295 6145 7763', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(486, 2, 'jindra85@example.com', '89537042', 'Akarsana Permadi', 'Akarsana Permadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Kiaracondong No. 355, Sukabumi 34858, JaTim', '0983 0354 1465', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(487, 2, 'caturangga.dongoran@example.org', '85545464', 'Septi Nuraini', 'Septi Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Imam No. 637, Administrasi Jakarta Pusat 75729, SulTeng', '0678 5724 717', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(488, 2, 'hastuti.najwa@example.com', '46788130', 'Kamidin Hutapea', 'Kamidin Hutapea', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Baik No. 364, Banda Aceh 60341, Riau', '0520 0693 826', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(489, 2, 'asmadi77@example.org', '60426737', 'Galuh Situmorang', 'Galuh Situmorang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Gardujati No. 314, Mataram 24229, SumUt', '(+62) 835 285 208', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(490, 2, 'hhalim@example.org', '53012186', 'Ami Silvia Handayani S.E.I', 'Ami Silvia Handayani S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Yosodipuro No. 14, Pematangsiantar 75708, KalTeng', '0380 6474 0589', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(491, 2, 'yulia.januar@example.net', '32780292', 'Endah Rahayu', 'Endah Rahayu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bara Tambar No. 137, Administrasi Jakarta Pusat 67668, Banten', '0304 4794 800', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(492, 2, 'zulaika.hartana@example.net', '46039334', 'Melinda Maryati S.IP', 'Melinda Maryati S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sudirman No. 263, Malang 69539, SulBar', '(+62) 26 5696 907', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(493, 2, 'whidayanto@example.com', '74669391', 'Paiman Tarihoran S.Pd', 'Paiman Tarihoran S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Tambun No. 600, Banjar 73223, NTT', '0448 1709 990', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(494, 2, 'hafshah.haryanto@example.com', '36819450', 'Janet Nasyidah S.E.', 'Janet Nasyidah S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Katamso No. 849, Ternate 13139, KalSel', '(+62) 411 5905 3435', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(495, 2, 'syahrini.manullang@example.org', '50486085', 'Lidya Indah Nasyidah', 'Lidya Indah Nasyidah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sukajadi No. 978, Tidore Kepulauan 21003, BaBel', '(+62) 861 1564 117', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(496, 2, 'prasetyo.anita@example.net', '31314821', 'Mila Novitasari', 'Mila Novitasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bass No. 140, Cilegon 33045, Gorontalo', '(+62) 855 1021 738', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(497, 2, 'tiara.nugroho@example.org', '12043159', 'Keisha Sabrina Prastuti M.TI.', 'Keisha Sabrina Prastuti M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Sutarto No. 600, Prabumulih 26782, SumBar', '(+62) 28 4763 123', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(498, 2, 'yuliana10@example.net', '46241406', 'Irfan Narpati', 'Irfan Narpati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bass No. 347, Kupang 37727, Jambi', '(+62) 387 1220 1702', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(499, 2, 'novi29@example.com', '65876162', 'Paris Safitri', 'Paris Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Basuki Rahmat  No. 430, Binjai 32038, Gorontalo', '0333 4969 2690', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(500, 2, 'ulya52@example.org', '13332144', 'Marwata Haryanto M.Kom.', 'Marwata Haryanto M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Nakula No. 940, Sukabumi 62307, KepR', '(+62) 20 7379 1267', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(501, 2, 'sihombing.bancar@example.net', '74963492', 'Cahya Gunawan', 'Cahya Gunawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Ters. Pasir Koja No. 705, Palu 70769, SulBar', '0976 2175 815', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(502, 2, 'ana.irawan@example.org', '84309643', 'Kasiyah Wulandari', 'Kasiyah Wulandari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Baranangsiang No. 156, Medan 87875, Papua', '(+62) 780 4084 6977', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(503, 2, 'puspasari.mahesa@example.com', '10117110', 'Karimah Rahmawati', 'Karimah Rahmawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. R.M. Said No. 799, Prabumulih 71932, SumBar', '(+62) 836 0880 751', NULL, 1, '2023-11-02 00:48:24', '2023-11-02 00:48:24'),
(504, 2, 'lyulianti@example.org', '39128990', 'Warta Tampubolon', 'Warta Tampubolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. K.H. Maskur No. 797, Depok 13157, KalTeng', '0324 7841 8111', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(505, 2, 'januar.hairyanto@example.net', '31508037', 'Adikara Taswir Sitorus S.Sos', 'Adikara Taswir Sitorus S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Lembong No. 295, Administrasi Jakarta Utara 74604, DKI', '020 5238 989', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(506, 2, 'putami@example.net', '29240924', 'Tami Zaenab Padmasari', 'Tami Zaenab Padmasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Gotong Royong No. 706, Kediri 45884, KalTim', '0786 7816 4522', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(507, 2, 'prasasta.atma@example.org', '7610686', 'Salimah Humaira Hartati S.H.', 'Salimah Humaira Hartati S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ters. Jakarta No. 780, Mojokerto 76768, Gorontalo', '(+62) 325 2858 351', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(508, 2, 'najmudin.erik@example.org', '78800003', 'Anita Halimah', 'Anita Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Cokroaminoto No. 866, Parepare 78672, DKI', '(+62) 306 5182 4180', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(509, 2, 'dpangestu@example.org', '91842156', 'Zahra Kasiyah Andriani', 'Zahra Kasiyah Andriani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Industri No. 836, Bogor 92058, SulTra', '0801 132 477', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(510, 2, 'nrima87@example.com', '8388292', 'Jayeng Drajat Anggriawan', 'Jayeng Drajat Anggriawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Basudewo No. 38, Langsa 37560, Bengkulu', '0456 1349 5754', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(511, 2, 'nabila58@example.com', '67497111', 'Adinata Omar Hutagalung S.E.', 'Adinata Omar Hutagalung S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Yogyakarta No. 29, Surabaya 34852, SulBar', '(+62) 24 2646 765', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(512, 2, 'ratna47@example.com', '25856833', 'Mustika Nababan', 'Mustika Nababan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bazuka Raya No. 792, Pekanbaru 77549, Bengkulu', '0654 4480 5673', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(513, 2, 'sudiati.estiawan@example.org', '43701419', 'Endah Gilda Lailasari', 'Endah Gilda Lailasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Supomo No. 410, Palopo 62560, Banten', '(+62) 25 0195 6989', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(514, 2, 'yuliana87@example.org', '5310236', 'Luwar Kusumo', 'Luwar Kusumo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Ciwastra No. 679, Administrasi Jakarta Timur 15005, Bengkulu', '0234 0762 8445', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(515, 2, 'lsimanjuntak@example.org', '83577451', 'Raditya Mahmud Siregar M.M.', 'Raditya Mahmud Siregar M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Tentara Pelajar No. 289, Payakumbuh 80962, SulBar', '0775 2227 6594', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(516, 2, 'putu.narpati@example.org', '72797391', 'Caturangga Sinaga', 'Caturangga Sinaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Arifin No. 87, Bima 28916, Gorontalo', '(+62) 27 8752 971', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(517, 2, 'manullang.michelle@example.com', '80253624', 'Qori Aisyah Purnawati S.I.Kom', 'Qori Aisyah Purnawati S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Banda No. 537, Palopo 61847, JaTeng', '(+62) 795 7367 0718', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(518, 2, 'marbun.salsabila@example.com', '42661293', 'Padmi Rahmawati', 'Padmi Rahmawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Mulyadi No. 530, Tangerang 11001, SulBar', '(+62) 526 7434 7327', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(519, 2, 'asiregar@example.org', '97176402', 'Maya Vera Handayani', 'Maya Vera Handayani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Mulyadi No. 828, Tangerang 36171, JaTim', '(+62) 940 2777 970', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(520, 2, 'puspasari.zizi@example.com', '42587666', 'Mustika Wahyu Uwais M.TI.', 'Mustika Wahyu Uwais M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Industri No. 598, Dumai 97327, PapBar', '0312 5135 968', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(521, 2, 'atma.setiawan@example.com', '86381942', 'Ana Lestari S.Gz', 'Ana Lestari S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Basmol Raya No. 812, Sungai Penuh 60057, Papua', '0457 7180 826', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(522, 2, 'xpudjiastuti@example.net', '11237504', 'Elma Handayani', 'Elma Handayani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Abang No. 302, Administrasi Jakarta Timur 64133, Lampung', '(+62) 920 9480 799', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(523, 2, 'daryani64@example.net', '62721337', 'Johan Nrima Sinaga S.Farm', 'Johan Nrima Sinaga S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Baranang Siang Indah No. 740, Dumai 79325, Riau', '021 2895 6958', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(524, 2, 'oni.laksita@example.com', '22750576', 'Olivia Jamalia Zulaika', 'Olivia Jamalia Zulaika', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Baranang Siang Indah No. 628, Bogor 12874, JaTeng', '0224 3818 655', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(525, 2, 'kwahyuni@example.com', '47413664', 'Salimah Sakura Mulyani M.Farm', 'Salimah Sakura Mulyani M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Gambang No. 120, Singkawang 84854, SulUt', '(+62) 375 8499 064', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(526, 2, 'fiswahyudi@example.org', '45612275', 'Paiman Natsir', 'Paiman Natsir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Aceh No. 605, Bandung 57530, SumSel', '(+62) 473 6165 4262', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(527, 2, 'pradana.kiandra@example.com', '64516728', 'Pranawa Bahuwirya Damanik M.Farm', 'Pranawa Bahuwirya Damanik M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Jagakarsa No. 519, Pematangsiantar 89847, JaBar', '(+62) 446 1525 768', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(528, 2, 'mandala.purwanto@example.com', '23559218', 'Wawan Vero Pratama S.Farm', 'Wawan Vero Pratama S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sampangan No. 927, Padangpanjang 43168, DKI', '0304 9004 867', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(529, 2, 'tiara.wasita@example.com', '67572223', 'Eva Yulia Safitri S.E.I', 'Eva Yulia Safitri S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Juanda No. 529, Padang 27500, SumUt', '0844 4981 9383', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(530, 2, 'mandasari.luhung@example.org', '14498983', 'Harsana Irawan', 'Harsana Irawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Abdul Muis No. 164, Bogor 95732, Gorontalo', '(+62) 781 1722 167', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(531, 2, 'phidayat@example.net', '70054976', 'Paiman Habibi', 'Paiman Habibi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Monginsidi No. 34, Bitung 76427, SulSel', '(+62) 890 6300 385', NULL, 1, '2023-11-02 00:48:25', '2023-11-02 00:48:25'),
(532, 2, 'banawa.hakim@example.org', '58144981', 'Maria Astuti', 'Maria Astuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Raya Ujungberung No. 193, Sukabumi 55438, KalTeng', '0807 138 617', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26');
INSERT INTO `students` (`id`, `class_id`, `email`, `identity_number`, `full_name`, `username`, `password`, `gender`, `address`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(533, 2, 'jaka66@example.net', '83042955', 'Dasa Marpaung S.T.', 'Dasa Marpaung S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Cemara No. 362, Kendari 25132, JaBar', '(+62) 940 7579 494', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(534, 2, 'ciaobella06@example.org', '25995628', 'Hartaka Megantara', 'Hartaka Megantara', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bagis Utama No. 767, Bekasi 71055, Banten', '(+62) 609 4313 2249', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(535, 2, 'twibisono@example.org', '25314831', 'Kasim Prasetya', 'Kasim Prasetya', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bagonwoto  No. 206, Depok 96117, SulTeng', '(+62) 359 3035 255', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(536, 2, 'zlaksita@example.net', '95990896', 'Koko Pratama', 'Koko Pratama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Barat No. 604, Surakarta 40075, Maluku', '(+62) 345 0324 157', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(537, 2, 'qwibisono@example.net', '68034971', 'Nasrullah Jailani', 'Nasrullah Jailani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Ki Hajar Dewantara No. 105, Pagar Alam 65798, Banten', '(+62) 996 6140 945', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(538, 2, 'lkuswandari@example.org', '40869390', 'Banawa Daliman Pradipta S.H.', 'Banawa Daliman Pradipta S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Kiaracondong No. 83, Cirebon 42879, SumSel', '0860 402 275', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(539, 2, 'irawan.enteng@example.com', '39686244', 'Nrima Siregar S.Pt', 'Nrima Siregar S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Achmad No. 510, Pekanbaru 49494, Papua', '(+62) 381 5592 549', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(540, 2, 'pratama.yunita@example.com', '25853300', 'Dasa Tedi Prasasta', 'Dasa Tedi Prasasta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baranang Siang Indah No. 848, Samarinda 83559, KalTim', '(+62) 331 9369 7905', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(541, 2, 'parman32@example.net', '64628600', 'Radika Mustofa', 'Radika Mustofa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Flora No. 669, Padang 74927, SumUt', '(+62) 654 7713 1611', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(542, 2, 'lantar51@example.com', '86048008', 'Tira Farida', 'Tira Farida', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sudiarto No. 567, Kotamobagu 19328, SulUt', '(+62) 874 937 204', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(543, 2, 'mursinin.lailasari@example.net', '26045154', 'Gamani Saptono', 'Gamani Saptono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baing No. 203, Semarang 84960, Jambi', '0778 3098 3668', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(544, 2, 'marpaung.violet@example.net', '19217636', 'Laras Azalea Yuliarti M.M.', 'Laras Azalea Yuliarti M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ronggowarsito No. 146, Payakumbuh 41384, MalUt', '0842 201 782', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(545, 2, 'perkasa93@example.org', '42653751', 'Budi Manullang', 'Budi Manullang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Yosodipuro No. 177, Metro 65367, Papua', '0841 7997 8998', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(546, 2, 'icha.halimah@example.org', '66816124', 'Cornelia Mandasari', 'Cornelia Mandasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Yosodipuro No. 517, Palembang 68228, KalUt', '0572 9905 893', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(547, 2, 'bakiadi60@example.com', '27585145', 'Uchita Laksmiwati', 'Uchita Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Gading No. 294, Kediri 87811, NTT', '(+62) 250 8342 586', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(548, 2, 'ophelia.purnawati@example.org', '18919979', 'Olivia Wijayanti', 'Olivia Wijayanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Basuki No. 762, Tebing Tinggi 12763, NTB', '(+62) 816 9823 448', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(549, 2, 'akarsana.nashiruddin@example.com', '37947638', 'Aris Kusumo', 'Aris Kusumo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Haji No. 932, Sabang 34615, MalUt', '(+62) 312 0180 9596', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(550, 2, 'hhasanah@example.com', '43138818', 'Omar Hartaka Budiyanto S.Psi', 'Omar Hartaka Budiyanto S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Pasirkoja No. 706, Tual 48898, JaTim', '(+62) 22 4786 658', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(551, 2, 'whabibi@example.net', '5710598', 'Garang Pranowo', 'Garang Pranowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Pasir Koja No. 347, Magelang 20600, JaBar', '0671 2768 9152', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(552, 2, 'olga90@example.com', '15951192', 'Nadine Elisa Kuswandari M.Pd', 'Nadine Elisa Kuswandari M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Kyai Gede No. 450, Medan 41239, Aceh', '(+62) 788 9701 818', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(553, 2, 'lasmono.mulyani@example.net', '26410178', 'Pia Ifa Haryanti S.E.', 'Pia Ifa Haryanti S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bawal No. 777, Administrasi Jakarta Pusat 75961, DKI', '0816 3127 5935', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(554, 2, 'labuh.marpaung@example.com', '29155822', 'Legawa Rendy Kusumo S.Pt', 'Legawa Rendy Kusumo S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Barasak No. 737, Palu 28193, SumBar', '(+62) 846 5403 441', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(555, 2, 'gyolanda@example.com', '78418614', 'Dimas Prayoga', 'Dimas Prayoga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Padang No. 429, Batam 76820, JaTim', '0856 585 530', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(556, 2, 'among.nuraini@example.com', '55675402', 'Laras Suartini S.I.Kom', 'Laras Suartini S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Adisucipto No. 123, Serang 68432, JaTim', '(+62) 22 7453 161', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(557, 2, 'nhastuti@example.net', '35214578', 'Lintang Wastuti', 'Lintang Wastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sentot Alibasa No. 902, Tomohon 75359, Banten', '0805 497 046', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(558, 2, 'mila31@example.org', '46935089', 'Karma Nainggolan M.Kom.', 'Karma Nainggolan M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bakau Griya Utama No. 63, Palopo 19374, KepR', '0365 4410 937', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(559, 2, 'laksmiwati.jagapati@example.org', '33690343', 'Safina Hastuti S.Sos', 'Safina Hastuti S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Baranang Siang Indah No. 459, Tomohon 21911, SulTra', '0939 8306 588', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(560, 2, 'rnashiruddin@example.org', '30176577', 'Gasti Ellis Nasyiah S.Farm', 'Gasti Ellis Nasyiah S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. K.H. Maskur No. 931, Subulussalam 37498, SumBar', '0919 6453 2861', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(561, 2, 'rafid35@example.com', '40537307', 'Unjani Nasyiah', 'Unjani Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sukajadi No. 696, Sorong 19448, JaTim', '(+62) 487 3588 158', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(562, 2, 'suryono.elon@example.org', '94945168', 'Nadia Mulyani S.Pt', 'Nadia Mulyani S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Banceng Pondok No. 151, Mojokerto 78704, Maluku', '0830 352 964', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(563, 2, 'fitriani.thamrin@example.com', '80707458', 'Wardaya Tasnim Natsir M.TI.', 'Wardaya Tasnim Natsir M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bayam No. 26, Manado 19960, DIY', '(+62) 887 423 329', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(564, 2, 'hesti.marbun@example.net', '26058717', 'Arsipatra Pradipta', 'Arsipatra Pradipta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Rumah Sakit No. 757, Dumai 78718, NTB', '0507 3073 548', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(565, 2, 'xbudiman@example.com', '51906005', 'Darsirah Hutasoit', 'Darsirah Hutasoit', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sutarto No. 880, Bontang 33161, Banten', '(+62) 717 5705 8739', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(566, 2, 'najwa68@example.com', '87400886', 'Jagapati Rajata', 'Jagapati Rajata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Suryo No. 758, Depok 56732, NTT', '0898 653 899', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(567, 2, 'tira30@example.org', '21153938', 'Nadine Pertiwi S.Gz', 'Nadine Pertiwi S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Cikapayang No. 415, Banda Aceh 35832, JaTim', '(+62) 516 7412 516', NULL, 1, '2023-11-02 00:48:26', '2023-11-02 00:48:26'),
(568, 2, 'nurul71@example.net', '77379003', 'Siska Pudjiastuti', 'Siska Pudjiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Jend. A. Yani No. 679, Tangerang 52673, BaBel', '(+62) 454 4369 751', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(569, 2, 'tomi27@example.org', '40320746', 'Wardaya Dariati Sitorus S.Kom', 'Wardaya Dariati Sitorus S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Camar No. 658, Banjarmasin 37794, Maluku', '(+62) 231 5287 613', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(570, 2, 'hpurnawati@example.org', '29428971', 'Cecep Wibowo', 'Cecep Wibowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. K.H. Maskur No. 614, Sibolga 63889, Lampung', '0705 1601 2508', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(571, 2, 'wibisono.kiandra@example.org', '58475372', 'Arta Dongoran', 'Arta Dongoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Wahid Hasyim No. 721, Manado 18161, BaBel', '(+62) 231 5278 415', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(572, 2, 'ymandasari@example.org', '54851791', 'Siti Prastuti', 'Siti Prastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Babadan No. 477, Probolinggo 48956, NTB', '(+62) 692 7635 8623', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(573, 2, 'gaman.maheswara@example.com', '42923882', 'Caket Rafi Simbolon', 'Caket Rafi Simbolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Madrasah No. 661, Bima 48270, KalUt', '(+62) 625 6239 716', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(574, 2, 'nadine97@example.org', '93476169', 'Ayu Purwanti S.Psi', 'Ayu Purwanti S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Pacuan Kuda No. 182, Batam 84904, SulSel', '(+62) 762 6115 218', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(575, 2, 'tri00@example.net', '74608802', 'Cindy Yuliarti', 'Cindy Yuliarti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Pacuan Kuda No. 401, Semarang 31177, SulTeng', '0867 419 228', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(576, 2, 'elma29@example.org', '76845762', 'Vanesa Samiah Wulandari S.Sos', 'Vanesa Samiah Wulandari S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Abdul Muis No. 789, Jayapura 95471, Jambi', '(+62) 495 5942 7301', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(577, 2, 'nasab.uwais@example.org', '7373191', 'Kasim Elvin Winarno', 'Kasim Elvin Winarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bakau No. 428, Samarinda 40872, Lampung', '0545 5602 4982', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(578, 2, 'mala49@example.com', '27361108', 'Jamil Mandala', 'Jamil Mandala', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. W.R. Supratman No. 55, Semarang 88200, SulSel', '0806 3612 965', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(579, 2, 'edi30@example.org', '66344055', 'Hardi Nashiruddin S.Psi', 'Hardi Nashiruddin S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Surapati No. 731, Administrasi Jakarta Selatan 45751, BaBel', '(+62) 232 0051 369', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(580, 2, 'ridwan50@example.com', '98356413', 'Kanda Nainggolan S.I.Kom', 'Kanda Nainggolan S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Flores No. 14, Depok 14036, Lampung', '(+62) 596 6320 037', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(581, 2, 'santoso.safina@example.org', '44350930', 'Kartika Melani S.E.I', 'Kartika Melani S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Peta No. 598, Dumai 63713, KalTim', '(+62) 21 4919 809', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(582, 2, 'maulana.darsirah@example.org', '83217135', 'Kamila Suci Palastri', 'Kamila Suci Palastri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Daan No. 326, Banda Aceh 77771, KalTeng', '(+62) 744 8366 916', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(583, 2, 'gilda.utami@example.com', '89571427', 'Violet Nurdiyanti', 'Violet Nurdiyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Padang No. 52, Bandar Lampung 73288, Lampung', '0777 3817 9941', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(584, 2, 'fitria.wijayanti@example.com', '31593434', 'Azalea Novitasari', 'Azalea Novitasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Qrisdoren No. 502, Bukittinggi 23298, KalTeng', '(+62) 415 0787 7159', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(585, 2, 'wyuliarti@example.com', '72198063', 'Tira Yolanda M.M.', 'Tira Yolanda M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. HOS. Cjokroaminoto (Pasirkaliki) No. 527, Sorong 86449, SulUt', '(+62) 766 6039 071', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(586, 2, 'jayeng95@example.com', '54525696', 'Alika Chelsea Susanti M.Ak', 'Alika Chelsea Susanti M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sukabumi No. 433, Bogor 30661, KalTeng', '(+62) 20 9789 8412', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(587, 2, 'yuniar.uda@example.org', '93842254', 'Ami Yulia Mardhiyah', 'Ami Yulia Mardhiyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Suniaraja No. 119, Ambon 67396, SumUt', '0737 4992 2272', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(588, 2, 'icha42@example.net', '8975262', 'Ajiono Januar', 'Ajiono Januar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Labu No. 940, Palangka Raya 89102, SulTra', '(+62) 577 6315 364', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(589, 2, 'andriani.zelaya@example.org', '54670441', 'Lurhur Mustofa', 'Lurhur Mustofa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bara Tambar No. 20, Lhokseumawe 21589, BaBel', '(+62) 653 8389 685', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(590, 2, 'malika62@example.com', '56225728', 'Farhunnisa Nova Nurdiyanti S.IP', 'Farhunnisa Nova Nurdiyanti S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Setia Budi No. 215, Salatiga 54913, KalTeng', '(+62) 723 7216 940', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(591, 2, 'kasiyah85@example.org', '19640866', 'Jasmin Rahayu', 'Jasmin Rahayu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sam Ratulangi No. 506, Palembang 19687, KalTim', '0598 9781 050', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(592, 2, 'zulaikha70@example.com', '61161941', 'Among Hutasoit M.Pd', 'Among Hutasoit M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Krakatau No. 686, Pariaman 53314, SulBar', '022 6341 008', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(593, 2, 'driyanti@example.org', '37433555', 'Gambira Sitompul', 'Gambira Sitompul', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Rajawali Timur No. 574, Tanjungbalai 47449, KepR', '0466 5035 003', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(594, 2, 'gilda.sihombing@example.net', '68042908', 'Yono Mandala S.Ked', 'Yono Mandala S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Baja No. 306, Bau-Bau 11080, KalTeng', '(+62) 208 3146 696', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(595, 2, 'ihariyah@example.net', '73145723', 'Pia Tami Wijayanti S.H.', 'Pia Tami Wijayanti S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Banceng Pondok No. 493, Mojokerto 39795, KalTim', '(+62) 307 9063 808', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(596, 2, 'cpermata@example.net', '47357814', 'Darmaji Gading Winarno', 'Darmaji Gading Winarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ters. Jakarta No. 979, Banjarbaru 64027, JaBar', '0650 1177 5191', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(597, 2, 'yunita40@example.org', '76471177', 'Fitria Laksita', 'Fitria Laksita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Basuki No. 408, Administrasi Jakarta Selatan 63619, Riau', '(+62) 893 184 969', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(598, 2, 'permata.sari@example.org', '54945769', 'Diana Gabriella Mandasari', 'Diana Gabriella Mandasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Nakula No. 956, Banjar 45146, MalUt', '(+62) 631 8207 7193', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(599, 2, 'harja.laksmiwati@example.org', '17128043', 'Samiah Pratiwi S.Sos', 'Samiah Pratiwi S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Gajah No. 286, Madiun 64591, KalTim', '0767 7870 4930', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(600, 2, 'bakda21@example.net', '6880281', 'Nasim Marsito Saefullah', 'Nasim Marsito Saefullah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Samanhudi No. 85, Administrasi Jakarta Barat 73210, Bengkulu', '0851 2185 7398', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(601, 2, 'violet.sihotang@example.org', '83349310', 'Jessica Nurdiyanti', 'Jessica Nurdiyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Dipenogoro No. 230, Bekasi 66031, Riau', '0272 1687 171', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(602, 2, 'tania.wahyudin@example.net', '96762477', 'Jayadi Nardi Napitupulu', 'Jayadi Nardi Napitupulu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Basket No. 551, Palu 17283, Jambi', '(+62) 597 6664 437', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(603, 2, 'maras.wulandari@example.org', '11739749', 'Surya Malik Prasasta', 'Surya Malik Prasasta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bank Dagang Negara No. 820, Surakarta 43915, Aceh', '(+62) 891 4504 750', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(604, 2, 'chandayani@example.net', '82788721', 'Zelda Paulin Susanti S.E.I', 'Zelda Paulin Susanti S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Otista No. 932, Subulussalam 93592, DKI', '(+62) 364 7303 2947', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(605, 2, 'viman98@example.com', '72350663', 'Wulan Pratiwi', 'Wulan Pratiwi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. M.T. Haryono No. 995, Sukabumi 52478, Gorontalo', '0241 8497 5767', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(606, 2, 'efarida@example.org', '98916568', 'Tira Ade Anggraini', 'Tira Ade Anggraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. BKR No. 136, Salatiga 28369, Maluku', '(+62) 726 9742 973', NULL, 1, '2023-11-02 00:48:27', '2023-11-02 00:48:27'),
(607, 2, 'agnes59@example.net', '79855788', 'Irwan Ibrani Siregar', 'Irwan Ibrani Siregar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sutarto No. 421, Padangsidempuan 74788, KepR', '0447 9669 057', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(608, 2, 'kuswandari.puspa@example.net', '76766850', 'Prima Pradipta', 'Prima Pradipta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Raya Ujungberung No. 750, Prabumulih 88711, Jambi', '(+62) 867 520 987', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(609, 2, 'ajiman09@example.net', '3036110', 'Parman Cager Tampubolon', 'Parman Cager Tampubolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Moch. Ramdan No. 639, Surakarta 54691, KalUt', '0796 3504 806', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(610, 2, 'belinda.oktaviani@example.org', '63776373', 'Cakrabirawa Mansur', 'Cakrabirawa Mansur', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Baranang No. 783, Bukittinggi 97306, SulSel', '(+62) 361 6660 0436', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(611, 2, 'wpuspasari@example.org', '63869876', 'Ika Purnawati', 'Ika Purnawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Warga No. 160, Palopo 71382, KalBar', '0756 6029 805', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(612, 2, 'fathonah87@example.com', '38156609', 'Jane Suryatmi S.I.Kom', 'Jane Suryatmi S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Salak No. 773, Kediri 77165, Maluku', '(+62) 855 719 558', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(613, 2, 'ghalimah@example.org', '1226513', 'Tirtayasa Zulkarnain', 'Tirtayasa Zulkarnain', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Warga No. 758, Salatiga 12035, Jambi', '0822 8646 9825', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(614, 2, 'pnainggolan@example.com', '67968084', 'Clara Wulandari', 'Clara Wulandari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sutarto No. 542, Palu 39476, Bengkulu', '0830 0930 3898', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(615, 2, 'prastuti.jane@example.org', '74544679', 'Caket Sinaga', 'Caket Sinaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Abdul Rahmat No. 606, Surakarta 54737, SumUt', '0819 9544 464', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(616, 2, 'agustina.restu@example.net', '50309842', 'Irma Yulianti', 'Irma Yulianti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Padma No. 382, Sawahlunto 46191, Gorontalo', '0920 2374 227', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(617, 2, 'embuh27@example.net', '24473662', 'Umaya Sihotang', 'Umaya Sihotang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Basoka Raya No. 123, Metro 88040, NTT', '(+62) 649 7879 1936', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(618, 2, 'citra22@example.com', '21245567', 'Uchita Widiastuti', 'Uchita Widiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Padang No. 34, Kediri 27471, Lampung', '(+62) 544 1640 991', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(619, 2, 'kusumo.tari@example.org', '88411779', 'Banara Aslijan Ardianto', 'Banara Aslijan Ardianto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Kalimantan No. 211, Kendari 90721, SumUt', '(+62) 956 1033 1590', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(620, 2, 'wira.purwanti@example.org', '93913706', 'Heru Sihotang', 'Heru Sihotang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Gegerkalong Hilir No. 12, Samarinda 53857, Aceh', '0546 3576 7312', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(621, 2, 'nainggolan.estiono@example.net', '10376633', 'Harsana Arta Nainggolan S.T.', 'Harsana Arta Nainggolan S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Surapati No. 975, Tarakan 81943, Banten', '(+62) 855 3960 4264', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(622, 2, 'kuswandari.kawaca@example.com', '82048004', 'Janet Pudjiastuti M.M.', 'Janet Pudjiastuti M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Suniaraja No. 2, Balikpapan 19728, SumBar', '(+62) 767 7456 961', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(623, 2, 'agustina.ami@example.net', '76722298', 'Raina Chelsea Zulaika', 'Raina Chelsea Zulaika', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Casablanca No. 445, Sabang 15842, KalBar', '0969 2560 3461', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(624, 2, 'vicky.wulandari@example.net', '49350669', 'Yessi Nasyidah', 'Yessi Nasyidah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Basmol Raya No. 225, Pontianak 16606, KepR', '0435 8365 8247', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(625, 2, 'megantara.dagel@example.net', '73575584', 'Rizki Damanik', 'Rizki Damanik', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. M.T. Haryono No. 612, Medan 92111, KalUt', '025 2933 413', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(626, 2, 'natsir.padmi@example.net', '21252435', 'Titin Nuraini', 'Titin Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sutami No. 916, Pagar Alam 21649, SulTeng', '024 0000 100', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(627, 2, 'kardianto@example.org', '26101736', 'Elvin Saputra', 'Elvin Saputra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Zamrud No. 813, Pekalongan 87341, SumSel', '(+62) 24 8198 8281', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(628, 2, 'ade38@example.net', '53442133', 'Wasis Okto Uwais S.Pt', 'Wasis Okto Uwais S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Gremet No. 262, Denpasar 30426, Bengkulu', '(+62) 800 633 400', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(629, 2, 'hariyah.hasta@example.com', '93866213', 'Nadia Shakila Suartini', 'Nadia Shakila Suartini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Jaksa No. 280, Bandung 64285, JaBar', '(+62) 657 6014 548', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(630, 2, 'johan.samosir@example.org', '66507469', 'Usman Wijaya S.Farm', 'Usman Wijaya S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Kusmanto No. 200, Bandung 48836, Aceh', '(+62) 761 4081 125', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(631, 2, 'luluh.riyanti@example.net', '55612888', 'Jarwa Harsaya Habibi S.Kom', 'Jarwa Harsaya Habibi S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Flores No. 119, Tomohon 79288, SulUt', '0509 5222 647', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(632, 2, 'permata.gada@example.net', '24217133', 'Michelle Unjani Handayani', 'Michelle Unjani Handayani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Jend. Sudirman No. 273, Balikpapan 15987, SulBar', '(+62) 784 6409 576', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(633, 2, 'among50@example.com', '93267241', 'Bajragin Viman Simanjuntak S.Pd', 'Bajragin Viman Simanjuntak S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Jayawijaya No. 458, Parepare 45900, Maluku', '(+62) 22 5338 024', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(634, 2, 'nurdiyanti.tantri@example.net', '79303119', 'Rika Anggraini', 'Rika Anggraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bakau Griya Utama No. 395, Yogyakarta 39056, Banten', '0414 2326 764', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(635, 2, 'dabukke.kani@example.com', '27875586', 'Jabal Artanto Uwais S.Ked', 'Jabal Artanto Uwais S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bakau Griya Utama No. 362, Depok 10295, MalUt', '(+62) 841 1603 219', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(636, 2, 'damanik.aisyah@example.com', '22826802', 'Lukita Jailani', 'Lukita Jailani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baranangsiang No. 975, Bekasi 30599, MalUt', '(+62) 22 6406 348', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(637, 2, 'ramadan.prayoga@example.com', '33929302', 'Parman Siregar', 'Parman Siregar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Yos Sudarso No. 372, Tomohon 36580, SumBar', '0515 0738 6613', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(638, 2, 'ihsan28@example.net', '31385408', 'Tiara Novitasari', 'Tiara Novitasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Tentara Pelajar No. 29, Metro 13937, Bengkulu', '0834 3530 3097', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(639, 2, 'virman.winarsih@example.net', '49578845', 'Pandu Wibowo M.Pd', 'Pandu Wibowo M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bara No. 484, Binjai 78376, SulSel', '(+62) 284 1653 6108', NULL, 1, '2023-11-02 00:48:28', '2023-11-02 00:48:28'),
(640, 2, 'septi.kusumo@example.com', '8371345', 'Slamet Rajasa', 'Slamet Rajasa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Jagakarsa No. 860, Prabumulih 36868, PapBar', '(+62) 492 5937 389', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(641, 2, 'npratiwi@example.org', '46277930', 'Hasna Hastuti', 'Hasna Hastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Baranang Siang No. 251, Prabumulih 75841, Papua', '(+62) 571 8054 731', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(642, 2, 'ajeng.nasyidah@example.org', '94839591', 'Cinthia Ciaobella Hartati S.I.Kom', 'Cinthia Ciaobella Hartati S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Mahakam No. 232, Cilegon 24073, SumBar', '0468 8922 202', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(643, 2, 'opung52@example.com', '29633088', 'Warji Adhiarja Sihotang', 'Warji Adhiarja Sihotang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Tambak No. 947, Pariaman 27723, SumBar', '(+62) 25 4858 109', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(644, 2, 'budiyanto.lanang@example.org', '87597605', 'Dina Tina Mulyani S.Sos', 'Dina Tina Mulyani S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Cikutra Timur No. 385, Blitar 16504, SumBar', '(+62) 536 4131 4643', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(645, 2, 'hari.palastri@example.org', '1665801', 'Winda Prastuti', 'Winda Prastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Muwardi No. 690, Bontang 29992, JaBar', '0633 3623 340', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(646, 2, 'tampubolon.icha@example.org', '35566187', 'Dasa Wijaya', 'Dasa Wijaya', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Jambu No. 99, Parepare 58676, Lampung', '0826 4091 6656', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(647, 2, 'ksafitri@example.net', '33535248', 'Adinata Maryadi M.TI.', 'Adinata Maryadi M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Cemara No. 755, Gunungsitoli 85331, Banten', '(+62) 349 6044 700', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(648, 2, 'ulaksmiwati@example.org', '23789424', 'Anita Nurdiyanti M.Farm', 'Anita Nurdiyanti M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. PHH. Mustofa No. 695, Serang 56403, SulTra', '(+62) 942 6636 111', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(649, 2, 'qwahyuni@example.org', '40961751', 'Prima Rudi Pradana S.H.', 'Prima Rudi Pradana S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sutan Syahrir No. 127, Ambon 58049, KalTeng', '023 7579 170', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(650, 2, 'rfirgantoro@example.net', '44178570', 'Cakrawangsa Salahudin', 'Cakrawangsa Salahudin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Warga No. 809, Surabaya 25040, Bali', '0735 0838 552', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(651, 2, 'gantar73@example.net', '15682671', 'Ida Kusmawati', 'Ida Kusmawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Cut Nyak Dien No. 627, Prabumulih 72330, DKI', '0812 3725 523', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(652, 2, 'anggraini.ani@example.net', '80333232', 'Alambana Samsul Maryadi', 'Alambana Samsul Maryadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bakit  No. 641, Pangkal Pinang 50683, SumBar', '024 6119 201', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(653, 2, 'muni90@example.com', '36049008', 'Ibun Prasasta M.Ak', 'Ibun Prasasta M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bawal No. 415, Padang 79887, Jambi', '0858 2485 200', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(654, 2, 'gamblang.simanjuntak@example.org', '12056024', 'Luhung Prayoga', 'Luhung Prayoga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Kebonjati No. 960, Tangerang Selatan 91727, SumSel', '0263 5107 642', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(655, 2, 'mayasari.aurora@example.org', '72295643', 'Aditya Vega Firgantoro S.Ked', 'Aditya Vega Firgantoro S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Krakatau No. 717, Gunungsitoli 38046, SulSel', '(+62) 438 0297 808', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(656, 2, 'pratiwi.aisyah@example.com', '51313917', 'Karen Mayasari S.T.', 'Karen Mayasari S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sutoyo No. 729, Tangerang Selatan 31601, Bengkulu', '0807 1504 425', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(657, 2, 'nsinaga@example.com', '71103578', 'Michelle Fitriani Purwanti S.Kom', 'Michelle Fitriani Purwanti S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Katamso No. 672, Tanjungbalai 12823, SulTra', '0692 6109 010', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(658, 2, 'budiman.maria@example.org', '43200369', 'Taufik Mansur', 'Taufik Mansur', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Haji No. 183, Bau-Bau 42181, NTT', '0911 5620 962', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(659, 2, 'sudiati.purwadi@example.com', '38233656', 'Salwa Widya Laksmiwati', 'Salwa Widya Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Supomo No. 258, Bima 10657, NTT', '0482 7240 271', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(660, 2, 'oliva83@example.org', '20673623', 'Taufik Mahendra S.I.Kom', 'Taufik Mahendra S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bahagia No. 29, Cimahi 82761, Bengkulu', '(+62) 625 4259 295', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(661, 2, 'emas01@example.net', '34737803', 'Karman Budiyanto', 'Karman Budiyanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Baya Kali Bungur No. 609, Pasuruan 16467, JaBar', '0245 2398 745', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(662, 2, 'galuh.zulaika@example.com', '61391414', 'Dalima Rahayu', 'Dalima Rahayu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Dago No. 935, Bontang 73737, DKI', '0495 4304 296', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(663, 2, 'lhartati@example.net', '24073923', 'Jatmiko Narpati', 'Jatmiko Narpati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baan No. 632, Kotamobagu 29929, NTB', '0533 2744 0400', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(664, 2, 'farida.himawan@example.org', '85633235', 'Slamet Cakrabirawa Lazuardi', 'Slamet Cakrabirawa Lazuardi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bacang No. 223, Banjarbaru 58883, NTB', '0485 7007 8636', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(665, 2, 'xsihombing@example.org', '34779545', 'Galiono Hutagalung S.E.', 'Galiono Hutagalung S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Babadak No. 706, Gorontalo 89871, Banten', '(+62) 844 301 672', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(666, 2, 'humaira69@example.net', '77655479', 'Hani Ajeng Nurdiyanti', 'Hani Ajeng Nurdiyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Babadan No. 477, Pekalongan 27827, SumSel', '029 7444 983', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(667, 2, 'utama.simanjuntak@example.net', '10174266', 'Zulfa Irma Safitri', 'Zulfa Irma Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Madrasah No. 513, Bandung 45103, Maluku', '(+62) 879 8855 3065', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(668, 2, 'dimas10@example.com', '90300695', 'Jaya Saefullah', 'Jaya Saefullah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Basket No. 966, Depok 28014, KalUt', '0512 5986 929', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(669, 2, 'hasanah.cahyono@example.com', '99088034', 'Kani Haryanti S.Pt', 'Kani Haryanti S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Batako No. 755, Payakumbuh 85267, KalUt', '0361 4595 965', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(670, 2, 'marpaung.kemba@example.com', '9429554', 'Kalim Natsir S.Pt', 'Kalim Natsir S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Moch. Toha No. 71, Depok 73922, Riau', '(+62) 854 5875 945', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(671, 2, 'sabar71@example.org', '57024172', 'Jarwadi Dabukke', 'Jarwadi Dabukke', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bahagia  No. 580, Medan 25820, KalTim', '0509 8173 4888', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(672, 2, 'fitria.purwanti@example.org', '84167807', 'Vinsen Budiyanto', 'Vinsen Budiyanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. M.T. Haryono No. 408, Subulussalam 38803, SulUt', '0930 2817 613', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(673, 2, 'suryatmi.ihsan@example.org', '56971256', 'Paramita Shakila Novitasari', 'Paramita Shakila Novitasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Gajah No. 767, Pasuruan 72282, Riau', '0281 4792 0854', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(674, 2, 'smustofa@example.org', '45962848', 'Ibun Wasita S.I.Kom', 'Ibun Wasita S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Rajawali No. 458, Tangerang Selatan 81546, JaBar', '0412 0050 857', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(675, 2, 'hassanah.laras@example.org', '65544216', 'Wardaya Sitorus S.Sos', 'Wardaya Sitorus S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Monginsidi No. 275, Payakumbuh 33272, SumSel', '(+62) 672 0762 4925', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(676, 2, 'yono.suryatmi@example.com', '69700003', 'Padma Purwanti', 'Padma Purwanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Veteran No. 649, Banjarmasin 28331, Riau', '0497 1259 801', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(677, 2, 'nusamah@example.net', '42535921', 'Latika Ade Mulyani', 'Latika Ade Mulyani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Laksamana No. 323, Pekanbaru 60802, KalBar', '(+62) 758 4516 051', NULL, 1, '2023-11-02 00:48:29', '2023-11-02 00:48:29'),
(678, 2, 'hutagalung.ade@example.net', '30588961', 'Asmuni Samosir', 'Asmuni Samosir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Madrasah No. 767, Yogyakarta 58230, SulSel', '0715 6074 965', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(679, 2, 'citra81@example.com', '14293801', 'Asmianto Latupono', 'Asmianto Latupono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Sukajadi No. 926, Bontang 40311, KepR', '(+62) 348 9086 3595', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(680, 2, 'ffarida@example.net', '16298159', 'Anggabaya Januar', 'Anggabaya Januar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sukajadi No. 462, Sungai Penuh 80516, MalUt', '0841 0369 018', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(681, 2, 'laila.jailani@example.org', '32821953', 'Warsa Ibrahim Prasetyo', 'Warsa Ibrahim Prasetyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Kusmanto No. 276, Solok 51720, PapBar', '(+62) 915 6439 575', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(682, 2, 'hamima83@example.com', '52255474', 'Teguh Kalim Sihombing', 'Teguh Kalim Sihombing', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Gardujati No. 854, Bandung 62243, Jambi', '(+62) 560 4109 706', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(683, 2, 'alambana.sihombing@example.org', '86394066', 'Natalia Anggraini', 'Natalia Anggraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Gajah No. 462, Pekanbaru 41010, NTT', '0334 0667 0302', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(684, 2, 'inovitasari@example.org', '25014746', 'Muhammad Kuswoyo S.E.', 'Muhammad Kuswoyo S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Kebangkitan Nasional No. 24, Pontianak 32267, Bali', '021 8421 452', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(685, 2, 'saputra.pandu@example.org', '23710318', 'Anastasia Oliva Prastuti M.Ak', 'Anastasia Oliva Prastuti M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bakhita No. 141, Palopo 87753, Bengkulu', '(+62) 300 5741 998', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(686, 2, 'wahyudin.tania@example.com', '23306400', 'Adika Mustofa S.E.', 'Adika Mustofa S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Raya Ujungberung No. 499, Binjai 99584, Papua', '(+62) 647 7164 213', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(687, 2, 'cuyainah@example.com', '87229621', 'Umay Situmorang', 'Umay Situmorang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Madiun No. 765, Palangka Raya 50904, PapBar', '(+62) 923 6409 5548', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(688, 2, 'padmasari.dina@example.com', '7010725', 'Dina Hamima Suartini', 'Dina Hamima Suartini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Rajawali Barat No. 887, Salatiga 50976, MalUt', '027 9057 135', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(689, 2, 'oastuti@example.org', '8728638', 'Saadat Santoso', 'Saadat Santoso', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Basmol Raya No. 564, Sorong 53722, KepR', '0803 4496 2060', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(690, 2, 'kamaria.saefullah@example.org', '80089426', 'Vivi Raina Hassanah', 'Vivi Raina Hassanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Cihampelas No. 400, Padang 57246, SulBar', '0807 108 099', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(691, 2, 'kpadmasari@example.net', '16068945', 'Aurora Utami', 'Aurora Utami', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Abdul No. 753, Medan 94729, DIY', '(+62) 245 6330 3244', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(692, 2, 'ulva.pradana@example.com', '88596267', 'Galang Natsir', 'Galang Natsir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Rumah Sakit No. 840, Batu 80446, DKI', '(+62) 632 0795 8136', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(693, 2, 'kurniawan.farhunnisa@example.com', '45967779', 'Maimunah Laras Susanti', 'Maimunah Laras Susanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Kyai Gede No. 38, Surabaya 47030, SumUt', '0402 3347 7811', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(694, 2, 'wsimanjuntak@example.org', '51079068', 'Ayu Halimah', 'Ayu Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Setia Budi No. 388, Blitar 54880, Bali', '0540 6164 1035', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(695, 2, 'budiyanto.puti@example.net', '83290883', 'Zulaikha Maryati', 'Zulaikha Maryati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. R.E. Martadinata No. 41, Batam 50566, Lampung', '(+62) 371 0616 268', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(696, 2, 'salimah.nainggolan@example.org', '85857094', 'Kadir Pranata Sirait', 'Kadir Pranata Sirait', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Ciwastra No. 309, Solok 36096, KalTeng', '(+62) 850 3826 899', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(697, 2, 'wulandari.kiandra@example.com', '90370511', 'Silvia Clara Safitri', 'Silvia Clara Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Moch. Toha No. 273, Parepare 13157, Jambi', '0288 7434 374', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(698, 2, 'qsusanti@example.net', '30280841', 'Wira Hardiansyah', 'Wira Hardiansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Katamso No. 822, Probolinggo 73900, Maluku', '(+62) 978 5306 840', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(699, 2, 'qjailani@example.org', '70415062', 'Salsabila Melani', 'Salsabila Melani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Tentara Pelajar No. 646, Pariaman 51797, DKI', '(+62) 924 0984 203', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(700, 2, 'enasyidah@example.com', '30314754', 'Paramita Maryati S.Pt', 'Paramita Maryati S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Padang No. 516, Pariaman 95110, BaBel', '0989 4383 9366', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(701, 2, 'ulya.yuniar@example.org', '76598243', 'Estiono Rajata', 'Estiono Rajata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Otto No. 820, Pekalongan 71626, KalBar', '(+62) 583 8067 733', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(702, 2, 'ryolanda@example.com', '75136761', 'Virman Napitupulu', 'Virman Napitupulu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Achmad Yani No. 775, Denpasar 31386, SulTra', '0785 7771 579', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(703, 2, 'aisyah.laksita@example.net', '9523375', 'Ella Puspa Nurdiyanti', 'Ella Puspa Nurdiyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Radio No. 107, Tasikmalaya 14434, Bali', '(+62) 710 2958 2639', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(704, 2, 'purwanti.harjo@example.com', '83634259', 'Eka Permata', 'Eka Permata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Acordion No. 731, Probolinggo 87465, JaTeng', '(+62) 246 1399 8492', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(705, 2, 'cinta.pratiwi@example.com', '39897963', 'Vivi Suartini', 'Vivi Suartini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Villa No. 290, Singkawang 13690, KalBar', '0653 6864 9792', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(706, 2, 'jlaksita@example.net', '56160462', 'Galih Suwarno', 'Galih Suwarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sugiyopranoto No. 837, Pekalongan 82493, PapBar', '(+62) 881 7615 364', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30');
INSERT INTO `students` (`id`, `class_id`, `email`, `identity_number`, `full_name`, `username`, `password`, `gender`, `address`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(707, 2, 'ade.astuti@example.net', '8742144', 'Dalimin Prakasa', 'Dalimin Prakasa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Aceh No. 961, Gunungsitoli 50518, SulUt', '(+62) 25 1629 2693', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(708, 2, 'shania52@example.org', '69925607', 'Marsudi Balangga Haryanto M.M.', 'Marsudi Balangga Haryanto M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Jend. Sudirman No. 541, Pangkal Pinang 37635, Jambi', '0411 6245 704', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(709, 2, 'lailasari.ridwan@example.com', '60815479', 'Capa Ajiono Anggriawan M.Farm', 'Capa Ajiono Anggriawan M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Uluwatu No. 643, Tangerang 62032, JaTeng', '(+62) 982 1135 463', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(710, 2, 'wadi96@example.net', '42617850', 'Wardaya Santoso M.Pd', 'Wardaya Santoso M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bah Jaya No. 980, Cilegon 74069, PapBar', '0283 9989 574', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(711, 2, 'megantara.ida@example.org', '89590918', 'Rangga Permadi', 'Rangga Permadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Laswi No. 271, Administrasi Jakarta Selatan 94353, MalUt', '(+62) 382 1998 132', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(712, 2, 'lala.lestari@example.net', '73272904', 'Alika Zulaikha Purwanti M.Pd', 'Alika Zulaikha Purwanti M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bank Dagang Negara No. 450, Bitung 49143, Aceh', '(+62) 878 1850 3514', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(713, 2, 'dfujiati@example.org', '75887016', 'Edi Budiyanto', 'Edi Budiyanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Ters. Jakarta No. 127, Banjarmasin 34862, SulTra', '0200 5057 243', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(714, 2, 'siregar.yuni@example.net', '47353579', 'Martana Nasim Nababan M.TI.', 'Martana Nasim Nababan M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Teuku Umar No. 735, Administrasi Jakarta Barat 87950, NTB', '0700 3672 395', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(715, 2, 'rahayu.sadina@example.net', '74983721', 'Ratna Pratiwi', 'Ratna Pratiwi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Gading No. 653, Samarinda 21781, SulTeng', '(+62) 735 0812 5773', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(716, 2, 'daliman28@example.com', '63443863', 'Makara Winarno S.Pd', 'Makara Winarno S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Labu No. 327, Padangpanjang 82082, Bengkulu', '0356 7760 4623', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(717, 2, 'nrahmawati@example.com', '29465664', 'Wardi Warsa Sihombing S.Gz', 'Wardi Warsa Sihombing S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Banda No. 456, Serang 32548, KalTeng', '0242 4968 0810', NULL, 1, '2023-11-02 00:48:30', '2023-11-02 00:48:30'),
(718, 2, 'rajasa.eja@example.com', '47128129', 'Ulva Susanti', 'Ulva Susanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Tambak No. 819, Palu 65619, DIY', '(+62) 674 0242 739', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(719, 2, 'salman94@example.com', '41621665', 'Bagiya Mansur', 'Bagiya Mansur', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Wahidin No. 330, Subulussalam 45821, SulBar', '(+62) 28 2730 8525', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(720, 2, 'dalima37@example.net', '35559266', 'Michelle Michelle Laksmiwati', 'Michelle Michelle Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Kebonjati No. 928, Banjarbaru 46813, DIY', '(+62) 285 0472 271', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(721, 2, 'padmasari.taufik@example.com', '30727680', 'Edward Saptono', 'Edward Saptono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bhayangkara No. 111, Gunungsitoli 71547, Bengkulu', '(+62) 907 2645 6578', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(722, 2, 'kayun.tampubolon@example.net', '44033979', 'Cemani Kusumo', 'Cemani Kusumo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Ters. Pasir Koja No. 878, Surabaya 74941, DKI', '0249 9503 085', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(723, 2, 'gnovitasari@example.net', '89848196', 'Malika Melani', 'Malika Melani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Salak No. 542, Bau-Bau 63109, Bali', '(+62) 946 6366 112', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(724, 2, 'nurdiyanti.unggul@example.com', '31852661', 'Unjani Astuti', 'Unjani Astuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Antapani Lama No. 208, Mojokerto 60530, Aceh', '(+62) 638 8194 6640', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(725, 2, 'lailasari.tania@example.net', '27068562', 'Jefri Alambana Adriansyah M.Ak', 'Jefri Alambana Adriansyah M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Fajar No. 208, Balikpapan 54858, Jambi', '(+62) 386 9806 9369', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(726, 2, 'gilda87@example.org', '92009484', 'Ana Oni Utami M.Farm', 'Ana Oni Utami M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Abdullah No. 939, Padangsidempuan 63607, PapBar', '0353 2801 334', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(727, 2, 'nwahyudin@example.org', '21586942', 'Nasab Laksana Maryadi S.IP', 'Nasab Laksana Maryadi S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Ahmad Dahlan No. 421, Parepare 23442, KalSel', '0828 3781 5384', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(728, 2, 'kenari93@example.net', '76770265', 'Betania Tami Widiastuti S.Pd', 'Betania Tami Widiastuti S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Ronggowarsito No. 775, Bandung 68231, KalBar', '(+62) 22 9827 0135', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(729, 2, 'sabrina62@example.org', '24783341', 'Zizi Ophelia Mulyani S.H.', 'Zizi Ophelia Mulyani S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sudirman No. 742, Prabumulih 64001, JaBar', '0848 0564 165', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(730, 2, 'lazuardi.rachel@example.net', '12211825', 'Restu Usada', 'Restu Usada', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Basket No. 63, Pasuruan 56144, BaBel', '0848 148 914', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(731, 2, 'putri20@example.net', '6588523', 'Saadat Putra', 'Saadat Putra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baan No. 562, Medan 93745, KalUt', '0675 6633 930', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(732, 2, 'gaduh.widiastuti@example.com', '21422424', 'Ulya Rahayu', 'Ulya Rahayu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Moch. Yamin No. 355, Padangpanjang 67884, KalTeng', '0872 5813 4268', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(733, 2, 'alambana08@example.net', '97044615', 'Surya Prayoga', 'Surya Prayoga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Otto No. 404, Binjai 72784, KalTeng', '(+62) 454 0386 772', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(734, 2, 'unjani.nababan@example.com', '52431811', 'Usyi Wahyuni', 'Usyi Wahyuni', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Abang No. 737, Bima 77185, SulBar', '0794 4377 139', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(735, 2, 'kpratiwi@example.org', '65042459', 'Raharja Tirtayasa Salahudin', 'Raharja Tirtayasa Salahudin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Tangkuban Perahu No. 46, Ambon 22117, Gorontalo', '(+62) 234 5696 278', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(736, 2, 'xmelani@example.net', '66092544', 'Azalea Yuliana Novitasari S.Gz', 'Azalea Yuliana Novitasari S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bank Dagang Negara No. 340, Cirebon 76660, SulSel', '028 0318 6474', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(737, 2, 'wacana.wawan@example.com', '34025051', 'Kasiyah Tania Palastri S.Kom', 'Kasiyah Tania Palastri S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Antapani Lama No. 108, Padangsidempuan 27674, KalSel', '(+62) 21 4760 813', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(738, 2, 'cahya.prastuti@example.org', '26809729', 'Zahra Mardhiyah', 'Zahra Mardhiyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Babah No. 355, Magelang 69893, JaBar', '0360 2641 456', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(739, 2, 'ynasyidah@example.net', '54739622', 'Lasmanto Nashiruddin S.T.', 'Lasmanto Nashiruddin S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Ronggowarsito No. 545, Surabaya 63738, SulSel', '(+62) 24 8143 4291', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(740, 2, 'rharyanti@example.org', '2004986', 'Garda Prasasta M.Pd', 'Garda Prasasta M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Tambak No. 352, Sukabumi 11888, Lampung', '0310 1493 6715', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(741, 2, 'zamira80@example.com', '21450370', 'Hesti Pertiwi', 'Hesti Pertiwi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Badak No. 620, Pagar Alam 76910, Lampung', '0336 3882 615', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(742, 2, 'rini35@example.org', '23180595', 'Mitra Rajata', 'Mitra Rajata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Abang No. 34, Jayapura 13124, Maluku', '0897 8956 2579', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(743, 2, 'iagustina@example.com', '15130874', 'Adikara Sihombing S.Ked', 'Adikara Sihombing S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Urip Sumoharjo No. 320, Prabumulih 61890, SulUt', '0971 2307 1292', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(744, 2, 'suryono.devi@example.com', '56532154', 'Jessica Oktaviani', 'Jessica Oktaviani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. W.R. Supratman No. 519, Banjarmasin 10419, KalSel', '029 6281 187', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(745, 2, 'zahra.suartini@example.org', '80170630', 'Harja Vino Saragih S.Psi', 'Harja Vino Saragih S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Tambun No. 935, Bengkulu 39198, KalUt', '0997 0631 8133', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(746, 2, 'karja.prastuti@example.org', '33369057', 'Eka Usamah', 'Eka Usamah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Flores No. 171, Kediri 90319, Jambi', '0305 4324 2789', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(747, 2, 'dongoran.ian@example.net', '27662373', 'Opung Marwata Mangunsong', 'Opung Marwata Mangunsong', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ujung No. 813, Tidore Kepulauan 84339, Lampung', '(+62) 484 7185 3401', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(748, 2, 'fpranowo@example.org', '47838246', 'Almira Usamah', 'Almira Usamah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Babah No. 906, Banjarmasin 86083, SumUt', '(+62) 422 4770 2194', NULL, 1, '2023-11-02 00:48:31', '2023-11-02 00:48:31'),
(749, 2, 'mlaksita@example.com', '32907831', 'Cahya Xanana Saputra', 'Cahya Xanana Saputra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Ekonomi No. 97, Bogor 54523, Bengkulu', '0522 4246 7980', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(750, 2, 'betania06@example.net', '88685068', 'Elma Siti Mandasari', 'Elma Siti Mandasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Pahlawan No. 151, Makassar 27756, KalSel', '0974 2099 9740', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(751, 2, 'wibowo.mutia@example.org', '88097967', 'Azalea Farah Padmasari', 'Azalea Farah Padmasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Gading No. 688, Madiun 66361, MalUt', '(+62) 263 3917 6517', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(752, 2, 'vivi.hasanah@example.org', '64577688', 'Jumari Eko Firgantoro', 'Jumari Eko Firgantoro', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Ki Hajar Dewantara No. 293, Gorontalo 53451, NTB', '(+62) 549 8908 926', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(753, 2, 'tasdik47@example.com', '3445662', 'Hafshah Jane Maryati S.E.I', 'Hafshah Jane Maryati S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Kartini No. 597, Kendari 73940, Jambi', '(+62) 820 155 886', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(754, 2, 'iprastuti@example.com', '4478635', 'Digdaya Siregar', 'Digdaya Siregar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Dahlia No. 380, Bitung 17704, SumBar', '0854 659 526', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(755, 2, 'kutama@example.net', '41156169', 'Zizi Irma Susanti', 'Zizi Irma Susanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. K.H. Maskur No. 237, Gunungsitoli 80106, NTT', '(+62) 858 823 326', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(756, 2, 'zahra58@example.net', '74117424', 'Estiawan Marpaung', 'Estiawan Marpaung', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Babah No. 352, Yogyakarta 60118, KalTim', '0230 0396 580', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(757, 2, 'manullang.balamantri@example.com', '33339968', 'Aisyah Calista Riyanti M.Kom.', 'Aisyah Calista Riyanti M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Babakan No. 905, Palembang 34478, Gorontalo', '0441 0503 3329', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(758, 2, 'hassanah.prayoga@example.net', '53039726', 'Cornelia Hasanah', 'Cornelia Hasanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sudiarto No. 234, Palangka Raya 49667, MalUt', '0450 5811 7992', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(759, 2, 'rmegantara@example.org', '89340114', 'Kartika Jelita Nasyiah M.TI.', 'Kartika Jelita Nasyiah M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Basoka No. 63, Sukabumi 69315, SumUt', '(+62) 454 5836 420', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(760, 2, 'putri.pangestu@example.com', '51621293', 'Violet Hasanah', 'Violet Hasanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. R.M. Said No. 272, Surabaya 29846, Bengkulu', '0910 0308 4334', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(761, 2, 'mandasari.margana@example.com', '50638963', 'Vanesa Vanya Laksita S.Pd', 'Vanesa Vanya Laksita S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Arifin No. 856, Tangerang 64584, DKI', '(+62) 268 6512 1461', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(762, 2, 'anggraini.oni@example.com', '97249578', 'Harsana Mahendra', 'Harsana Mahendra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Madrasah No. 761, Blitar 89079, SumUt', '0698 4108 2047', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(763, 2, 'cici62@example.net', '44430535', 'Banawi Sitompul', 'Banawi Sitompul', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Elang No. 731, Sorong 31869, NTB', '0306 9399 757', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(764, 2, 'tsaragih@example.org', '25266282', 'Febi Paulin Widiastuti M.Farm', 'Febi Paulin Widiastuti M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sukabumi No. 257, Tomohon 95612, SumBar', '(+62) 865 5699 542', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(765, 2, 'bmansur@example.org', '64329486', 'Ophelia Humaira Purnawati', 'Ophelia Humaira Purnawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ronggowarsito No. 394, Bitung 46704, KepR', '(+62) 546 6341 300', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(766, 2, 'karen52@example.org', '69840407', 'Jessica Gabriella Yuliarti', 'Jessica Gabriella Yuliarti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Kebangkitan Nasional No. 905, Bogor 81524, MalUt', '0632 0993 831', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(767, 2, 'ridwan38@example.net', '21554041', 'Artawan Simanjuntak', 'Artawan Simanjuntak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Honggowongso No. 899, Denpasar 91926, Maluku', '0549 7540 2429', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(768, 2, 'rtarihoran@example.net', '76956995', 'Nadine Hassanah', 'Nadine Hassanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Elang No. 63, Sabang 52596, Maluku', '(+62) 522 3600 397', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(769, 2, 'hasim22@example.com', '11940819', 'Gandewa Cagak Kurniawan M.TI.', 'Gandewa Cagak Kurniawan M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Suprapto No. 412, Padangpanjang 19466, JaTim', '0742 9031 6989', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(770, 2, 'koko.pradana@example.org', '73389494', 'Anggabaya Hardiansyah', 'Anggabaya Hardiansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Babadan No. 412, Gorontalo 51087, SumUt', '(+62) 411 5329 233', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(771, 2, 'iutami@example.com', '24541344', 'Hardana Jayeng Pradipta S.IP', 'Hardana Jayeng Pradipta S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Setiabudhi No. 949, Solok 60026, KalUt', '0865 964 103', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(772, 2, 'sihombing.putri@example.org', '56885429', 'Jumadi Adriansyah', 'Jumadi Adriansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Baha No. 947, Dumai 58818, DKI', '(+62) 307 3177 283', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(773, 2, 'pudjiastuti.malik@example.net', '45682516', 'Lantar Waskita S.Pd', 'Lantar Waskita S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Abdul No. 100, Tegal 69260, Bali', '(+62) 927 3396 361', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(774, 2, 'tpudjiastuti@example.com', '75345263', 'Tirtayasa Suwarno', 'Tirtayasa Suwarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Sukabumi No. 278, Payakumbuh 63341, Aceh', '(+62) 201 9670 8561', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(775, 2, 'haryanto.halima@example.net', '11326153', 'Cahyo Hutapea', 'Cahyo Hutapea', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Batako No. 418, Metro 27960, Aceh', '(+62) 368 5472 130', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(776, 2, 'himawan.mangunsong@example.org', '99418366', 'Edi Bakidin Wibowo S.Gz', 'Edi Bakidin Wibowo S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Wahid No. 487, Sabang 33249, SulTra', '(+62) 614 1221 2139', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(777, 2, 'budiman.rosman@example.net', '35719067', 'Cindy Yolanda', 'Cindy Yolanda', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Lumban Tobing No. 32, Pariaman 90234, JaTeng', '0566 1413 2197', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(778, 2, 'laksmiwati.ani@example.net', '45615106', 'Ani Mila Yulianti S.Psi', 'Ani Mila Yulianti S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Abang No. 631, Probolinggo 64100, SumUt', '0496 9029 008', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(779, 2, 'hpratama@example.org', '84630415', 'Maman Uwais', 'Maman Uwais', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bak Air No. 227, Tidore Kepulauan 88657, KepR', '025 8748 359', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(780, 2, 'lembah35@example.net', '95118692', 'Mila Jane Mayasari', 'Mila Jane Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Wahidin No. 19, Administrasi Jakarta Barat 20293, Jambi', '0297 8441 0680', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(781, 2, 'kenzie.yulianti@example.com', '86680081', 'Latika Zulaika S.Farm', 'Latika Zulaika S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Asia Afrika No. 908, Surabaya 58048, SumUt', '(+62) 896 1494 404', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(782, 2, 'samiah.hidayat@example.com', '49330611', 'Lili Paramita Hassanah', 'Lili Paramita Hassanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Wahidin No. 866, Kendari 74245, SumBar', '(+62) 292 1369 2855', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(783, 2, 'suartini.ilsa@example.net', '43967459', 'Lutfan Widodo', 'Lutfan Widodo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bakau No. 113, Lhokseumawe 52660, DKI', '(+62) 549 5195 304', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(784, 2, 'qsaptono@example.com', '55695188', 'Ira Nasyidah', 'Ira Nasyidah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Rajawali Barat No. 198, Administrasi Jakarta Pusat 88236, SulSel', '(+62) 217 8289 9442', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(785, 2, 'rahayu.hariyah@example.org', '24876313', 'Ani Mayasari', 'Ani Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Wahid Hasyim No. 854, Sibolga 41346, BaBel', '(+62) 986 7334 0943', NULL, 1, '2023-11-02 00:48:32', '2023-11-02 00:48:32'),
(786, 2, 'mardhiyah.gilang@example.com', '8600353', 'Olivia Anggraini S.IP', 'Olivia Anggraini S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Madrasah No. 592, Balikpapan 65504, Gorontalo', '0564 5696 1001', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(787, 2, 'indah33@example.net', '91902275', 'Cakrajiya Mulya Manullang S.Sos', 'Cakrajiya Mulya Manullang S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Cikutra Timur No. 130, Kupang 91106, Bali', '0803 2283 4195', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(788, 2, 'balangga25@example.net', '7538953', 'Melinda Oktaviani S.H.', 'Melinda Oktaviani S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bakaru No. 817, Semarang 11027, NTT', '(+62) 573 7453 5833', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(789, 2, 'ardianto.bajragin@example.com', '70772597', 'Mahdi Jamil Adriansyah', 'Mahdi Jamil Adriansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ters. Pasir Koja No. 271, Lubuklinggau 45406, SulBar', '0614 6552 4145', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(790, 2, 'qori78@example.net', '77151880', 'Umi Maryati', 'Umi Maryati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Radio No. 389, Administrasi Jakarta Selatan 15121, Jambi', '(+62) 512 6587 6068', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(791, 2, 'ilyas.wibowo@example.com', '52041517', 'Jasmani Prasetyo', 'Jasmani Prasetyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Kiaracondong No. 953, Bengkulu 47887, SulSel', '(+62) 858 148 723', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(792, 2, 'safina.nasyidah@example.net', '14805804', 'Reksa Galar Tampubolon S.Farm', 'Reksa Galar Tampubolon S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Wahid No. 896, Tanjungbalai 71886, SumSel', '0959 3736 7413', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(793, 2, 'uwaluyo@example.net', '4348524', 'Ida Nurdiyanti S.E.', 'Ida Nurdiyanti S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Babah No. 566, Palembang 11999, SulTra', '0310 2152 7158', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(794, 2, 'rahayu.makuta@example.org', '46922427', 'Cawuk Dongoran', 'Cawuk Dongoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Tangkuban Perahu No. 754, Administrasi Jakarta Timur 29287, Bengkulu', '(+62) 234 9347 2967', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(795, 2, 'reksa98@example.com', '99118547', 'Edward Prayoga S.E.I', 'Edward Prayoga S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Nanas No. 137, Dumai 78454, Papua', '(+62) 418 0899 216', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(796, 2, 'marpaung.cakrabuana@example.org', '1904973', 'Maida Hamima Purnawati S.H.', 'Maida Hamima Purnawati S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Raya Ujungberung No. 795, Banjarbaru 53258, NTT', '0229 6483 310', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(797, 2, 'puspa20@example.org', '73140418', 'Artanto Nugroho', 'Artanto Nugroho', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Jambu No. 604, Pariaman 68769, SumUt', '0329 2279 0082', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(798, 2, 'mariadi.hakim@example.com', '89281966', 'Nardi Prayoga', 'Nardi Prayoga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Rajawali Timur No. 8, Tebing Tinggi 42728, NTT', '(+62) 231 8833 9034', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(799, 2, 'prayoga.vivi@example.com', '52525240', 'Pia Lestari', 'Pia Lestari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Industri No. 875, Malang 94568, SulBar', '(+62) 528 8731 9643', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(800, 2, 'puput67@example.net', '54913734', 'Harjo Heru Mandala', 'Harjo Heru Mandala', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Baik No. 830, Bengkulu 41958, SulTeng', '0253 7111 7672', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(801, 2, 'maheswara.dwi@example.net', '74170420', 'Ifa Yolanda', 'Ifa Yolanda', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Villa No. 236, Semarang 24763, KalTeng', '029 6523 789', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(802, 2, 'mardhiyah.rafid@example.net', '32236366', 'Yusuf Sinaga', 'Yusuf Sinaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bappenas No. 61, Palangka Raya 25634, Gorontalo', '(+62) 897 0827 7709', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(803, 2, 'widodo.latika@example.com', '1159433', 'Cinta Nilam Usamah', 'Cinta Nilam Usamah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ters. Kiaracondong No. 317, Tegal 86725, JaTeng', '0861 6614 8215', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(804, 2, 'tania.suartini@example.net', '51859241', 'Genta Agustina S.Pd', 'Genta Agustina S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Ronggowarsito No. 347, Pekalongan 80846, MalUt', '0815 9764 8989', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(805, 2, 'prabu85@example.com', '54506199', 'Legawa Wahyudin', 'Legawa Wahyudin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Wahid Hasyim No. 416, Palopo 70063, SulTeng', '0916 8557 9179', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(806, 2, 'uli96@example.net', '30253827', 'Ami Puspasari', 'Ami Puspasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Suharso No. 266, Padang 41998, Aceh', '(+62) 201 2718 3283', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(807, 2, 'jmaulana@example.com', '59858384', 'Emas Zulkarnain', 'Emas Zulkarnain', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Cikutra Timur No. 156, Bontang 43390, Bali', '0895 6976 606', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(808, 2, 'kdongoran@example.net', '44636579', 'Mala Talia Permata', 'Mala Talia Permata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Hang No. 24, Semarang 84823, Bali', '(+62) 564 5768 904', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(809, 2, 'chelsea84@example.net', '76542990', 'Tiara Farida', 'Tiara Farida', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bass No. 281, Bontang 27195, Gorontalo', '(+62) 829 0648 5698', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(810, 2, 'kiandra.pranowo@example.net', '70166003', 'Hilda Palastri', 'Hilda Palastri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Uluwatu No. 448, Dumai 23493, SulTra', '029 9574 0316', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(811, 2, 'mangunsong.yunita@example.com', '87281431', 'Natalia Padma Farida', 'Natalia Padma Farida', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Padang No. 305, Tegal 68919, SulTra', '020 7089 8583', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(812, 2, 'irma.santoso@example.org', '75782588', 'Eka Rachel Uyainah M.Farm', 'Eka Rachel Uyainah M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Zamrud No. 184, Palopo 92525, SumBar', '(+62) 28 9409 6395', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(813, 2, 'nfarida@example.org', '47833470', 'Erik Nababan', 'Erik Nababan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Gedebage Selatan No. 396, Medan 26660, JaTim', '0465 6829 044', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(814, 2, 'karimah.namaga@example.com', '67202110', 'Prabowo Firgantoro', 'Prabowo Firgantoro', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bakhita No. 679, Bima 32783, PapBar', '026 4729 399', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(815, 2, 'paris.waskita@example.net', '81396077', 'Putri Hana Prastuti', 'Putri Hana Prastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bawal No. 848, Probolinggo 32399, KepR', '0216 5852 461', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(816, 2, 'caket.aryani@example.com', '31911001', 'Lili Zelaya Palastri', 'Lili Zelaya Palastri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Wahidin No. 250, Padangsidempuan 64481, KepR', '(+62) 508 8356 0639', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(817, 2, 'samosir.radika@example.com', '67110478', 'Widya Irma Halimah', 'Widya Irma Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Baiduri No. 414, Gorontalo 13685, JaTim', '0383 6954 414', NULL, 1, '2023-11-02 00:48:33', '2023-11-02 00:48:33'),
(818, 2, 'silvia.suryono@example.net', '543672', 'Balamantri Wacana S.Ked', 'Balamantri Wacana S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Villa No. 364, Sukabumi 76687, NTB', '0838 3903 6922', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(819, 2, 'ghaliyati18@example.net', '87538505', 'Dalima Puspita', 'Dalima Puspita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Gading No. 888, Administrasi Jakarta Timur 85348, DKI', '0850 567 602', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(820, 2, 'margana.thamrin@example.com', '14677666', 'Eka Samiah Halimah M.Pd', 'Eka Samiah Halimah M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Imam No. 405, Mataram 47263, Riau', '(+62) 951 6774 076', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(821, 2, 'rajasa.jarwadi@example.net', '10955251', 'Garan Drajat Irawan', 'Garan Drajat Irawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bazuka Raya No. 191, Administrasi Jakarta Utara 97578, JaTeng', '0322 1853 720', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(822, 2, 'widiastuti.wirda@example.net', '83102613', 'Virman Haryanto', 'Virman Haryanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bakaru No. 372, Banjarbaru 77047, Jambi', '0413 4223 883', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(823, 2, 'nalar.susanti@example.org', '54316815', 'Ulya Belinda Pudjiastuti M.Pd', 'Ulya Belinda Pudjiastuti M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Samanhudi No. 989, Makassar 29056, Jambi', '(+62) 838 1597 5757', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(824, 2, 'yastuti@example.org', '100630', 'Widya Rahayu Nasyiah', 'Widya Rahayu Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sunaryo No. 639, Parepare 32285, KalTeng', '(+62) 972 9373 7316', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(825, 2, 'irnanto.siregar@example.com', '40203014', 'Fathonah Clara Prastuti', 'Fathonah Clara Prastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Tambak No. 326, Gorontalo 46787, SulTra', '(+62) 21 0732 7747', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(826, 2, 'clara.marpaung@example.net', '58622849', 'Wirda Laksmiwati', 'Wirda Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Basuki Rahmat  No. 398, Parepare 61536, NTT', '0928 3554 489', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(827, 2, 'rahmi.rajasa@example.com', '62325079', 'Carla Mutia Rahimah', 'Carla Mutia Rahimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Umalas No. 537, Kupang 29768, Gorontalo', '0564 7154 257', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(828, 2, 'galih78@example.net', '28883386', 'Waluyo Narpati', 'Waluyo Narpati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Dago No. 896, Gorontalo 91047, SulUt', '0605 2560 8829', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(829, 2, 'jelita65@example.com', '52291821', 'Samiah Susanti', 'Samiah Susanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Adisucipto No. 81, Pekanbaru 31040, SulTeng', '(+62) 624 6890 1326', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(830, 2, 'jatmiko35@example.org', '6806526', 'Septi Ilsa Haryanti M.M.', 'Septi Ilsa Haryanti M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sugiyopranoto No. 737, Jambi 29709, Bengkulu', '(+62) 633 9704 6050', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(831, 2, 'maryati.edward@example.org', '50149174', 'Hardi Narpati', 'Hardi Narpati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baranangsiang No. 624, Mojokerto 75859, Maluku', '(+62) 389 1322 310', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(832, 2, 'nabila80@example.org', '37363336', 'Karta Pradipta', 'Karta Pradipta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bakaru No. 446, Balikpapan 31943, JaTim', '(+62) 351 4992 168', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(833, 2, 'paramita02@example.com', '25710791', 'Mala Novitasari S.Farm', 'Mala Novitasari S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Raya Setiabudhi No. 897, Cirebon 85635, Riau', '(+62) 844 2921 2776', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(834, 2, 'adika99@example.net', '80081054', 'Narji Haryanto', 'Narji Haryanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sugiono No. 378, Banjarmasin 14475, Bengkulu', '025 0702 058', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(835, 2, 'tsuartini@example.org', '27197983', 'Harsanto Sihotang', 'Harsanto Sihotang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Gajah No. 342, Sibolga 88057, NTT', '0455 9762 432', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(836, 2, 'iramadan@example.com', '84248102', 'Sakura Permata', 'Sakura Permata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Padang No. 866, Palu 45159, Riau', '(+62) 933 3002 7473', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(837, 2, 'yono63@example.com', '37895934', 'Gamblang Iswahyudi', 'Gamblang Iswahyudi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Mulyadi No. 863, Tasikmalaya 17693, NTT', '023 1109 231', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(838, 2, 'tkuswoyo@example.com', '16411595', 'Rachel Suartini S.IP', 'Rachel Suartini S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sunaryo No. 570, Lhokseumawe 21950, Gorontalo', '023 3267 9043', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(839, 2, 'kariman.situmorang@example.org', '31499506', 'Wawan Prakasa S.H.', 'Wawan Prakasa S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bahagia No. 774, Pekalongan 13334, JaTim', '(+62) 489 3172 548', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(840, 2, 'darijan08@example.com', '32867491', 'Usyi Melani', 'Usyi Melani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Peta No. 317, Serang 32730, KepR', '0843 973 036', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(841, 2, 'nilam.utami@example.com', '96484520', 'Ayu Anggraini', 'Ayu Anggraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Salatiga No. 780, Gunungsitoli 18238, Bengkulu', '(+62) 827 6339 007', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(842, 2, 'emong.hassanah@example.com', '29432951', 'Darsirah Pangestu', 'Darsirah Pangestu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Antapani Lama No. 823, Administrasi Jakarta Selatan 61027, BaBel', '(+62) 795 9035 6340', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(843, 2, 'jelita.agustina@example.com', '49734172', 'Jagaraga Caturangga Pradipta S.Psi', 'Jagaraga Caturangga Pradipta S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sampangan No. 612, Sabang 37195, Bengkulu', '(+62) 602 9160 004', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(844, 2, 'ulaksita@example.net', '59054313', 'Wulan Maria Hartati', 'Wulan Maria Hartati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Gegerkalong Hilir No. 318, Salatiga 36048, MalUt', '0792 8811 058', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(845, 2, 'hafshah87@example.net', '53797509', 'Uda Wibowo', 'Uda Wibowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Jaksa No. 816, Kupang 61620, Aceh', '(+62) 471 8330 1613', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(846, 2, 'sidiq89@example.net', '38984239', 'Wani Nasyiah', 'Wani Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Wahid No. 425, Tomohon 25248, DKI', '0510 3680 305', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(847, 2, 'frajata@example.com', '63622049', 'Azalea Mandasari', 'Azalea Mandasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bacang No. 936, Palopo 82087, JaBar', '0395 7845 559', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(848, 2, 'endah.hasanah@example.org', '11228770', 'Clara Mala Haryanti', 'Clara Mala Haryanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Kebonjati No. 540, Tebing Tinggi 49737, BaBel', '0367 3660 4468', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(849, 2, 'fsihombing@example.com', '15156014', 'Fitria Namaga', 'Fitria Namaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Kusmanto No. 818, Depok 58575, Bali', '(+62) 816 4238 5922', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(850, 2, 'salman01@example.org', '40914880', 'Hesti Nuraini', 'Hesti Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Jend. Sudirman No. 668, Administrasi Jakarta Barat 68884, JaTim', '0242 5314 9466', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(851, 2, 'mardhiyah.aswani@example.org', '88894606', 'Prasetya Dagel Najmudin', 'Prasetya Dagel Najmudin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Orang No. 415, Lhokseumawe 23643, Papua', '(+62) 874 827 896', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(852, 2, 'gadang.widodo@example.net', '130023', 'Cinthia Maryati', 'Cinthia Maryati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Diponegoro No. 968, Cirebon 57907, Gorontalo', '0523 5664 5350', NULL, 1, '2023-11-02 00:48:34', '2023-11-02 00:48:34'),
(853, 2, 'hmustofa@example.org', '12356484', 'Jelita Wahyuni S.Sos', 'Jelita Wahyuni S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. B.Agam Dlm No. 570, Padangsidempuan 63100, Lampung', '0370 2170 4296', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(854, 2, 'puspasari.ganjaran@example.org', '44258485', 'Wirda Mayasari M.Pd', 'Wirda Mayasari M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Cikutra Barat No. 509, Pekalongan 33680, KalBar', '0326 6525 1333', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(855, 2, 'daryani15@example.com', '905139', 'Dipa Baktiono Damanik', 'Dipa Baktiono Damanik', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Raden No. 625, Gunungsitoli 66373, Maluku', '0420 7762 0350', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(856, 2, 'indra14@example.org', '18382149', 'Jaga Hidayanto S.T.', 'Jaga Hidayanto S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Ahmad Dahlan No. 341, Singkawang 64175, JaBar', '(+62) 369 2012 850', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(857, 2, 'bakiono19@example.net', '6703125', 'Dacin Budiyanto', 'Dacin Budiyanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Labu No. 79, Kupang 88641, JaBar', '(+62) 676 3409 3305', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(858, 2, 'hassanah.jumadi@example.org', '24582402', 'Daryani Ajimat Hardiansyah', 'Daryani Ajimat Hardiansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sugiono No. 843, Samarinda 36977, JaBar', '0262 4339 345', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(859, 2, 'jindra20@example.org', '59381934', 'Jaswadi Halim', 'Jaswadi Halim', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. R.M. Said No. 930, Banda Aceh 10628, Maluku', '0587 2262 391', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(860, 2, 'smaheswara@example.net', '53928536', 'Michelle Yuliarti', 'Michelle Yuliarti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sugiono No. 138, Pariaman 98390, SulTeng', '0282 7065 2015', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(861, 2, 'pusamah@example.org', '87491345', 'Emil Hardiansyah M.Kom.', 'Emil Hardiansyah M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Suryo No. 930, Singkawang 31902, SumBar', '023 9454 5478', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(862, 2, 'situmorang.ilsa@example.org', '42116654', 'Lili Sakura Aryani M.Pd', 'Lili Sakura Aryani M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Otista No. 131, Palangka Raya 28319, Bali', '0705 9098 0816', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(863, 2, 'paramita97@example.net', '1137531', 'Cagak Marpaung', 'Cagak Marpaung', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sugiono No. 924, Langsa 20262, SulTra', '(+62) 494 2943 825', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(864, 2, 'astuti.lili@example.com', '45831595', 'Oni Novitasari', 'Oni Novitasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Perintis Kemerdekaan No. 483, Tanjung Pinang 49719, PapBar', '(+62) 751 6820 493', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(865, 2, 'kusmawati.zulaikha@example.com', '88349552', 'Elon Mansur', 'Elon Mansur', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. W.R. Supratman No. 439, Pagar Alam 60606, DIY', '(+62) 701 4591 268', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(866, 2, 'kacung.maryadi@example.org', '24556579', 'Wasis Suwarno', 'Wasis Suwarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Camar No. 709, Pekalongan 39572, NTT', '(+62) 737 4662 4389', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(867, 2, 'kezia61@example.com', '21846162', 'Ghaliyati Usamah', 'Ghaliyati Usamah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Ciumbuleuit No. 573, Administrasi Jakarta Utara 24970, SulTra', '(+62) 29 8484 099', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(868, 2, 'mahendra.naradi@example.com', '60909504', 'Lembah Gunarto S.T.', 'Lembah Gunarto S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Adisumarmo No. 291, Metro 49490, JaBar', '(+62) 934 8664 134', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(869, 2, 'elisa.novitasari@example.com', '79040810', 'Vanya Nuraini M.Pd', 'Vanya Nuraini M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. M.T. Haryono No. 704, Balikpapan 78703, SulBar', '(+62) 27 0920 4126', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(870, 2, 'hasna40@example.org', '2943175', 'Johan Damanik', 'Johan Damanik', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Camar No. 82, Padang 21374, SumBar', '(+62) 27 7639 4647', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(871, 2, 'iaryani@example.com', '23850142', 'Vicky Riyanti', 'Vicky Riyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Elang No. 63, Probolinggo 68955, SumUt', '0269 0570 520', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(872, 2, 'iriana99@example.net', '1329539', 'Sadina Ana Safitri S.I.Kom', 'Sadina Ana Safitri S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Hasanuddin No. 373, Bengkulu 50768, KalBar', '(+62) 475 0098 113', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(873, 2, 'prahimah@example.net', '81307567', 'Reza Mandala', 'Reza Mandala', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Sadang Serang No. 869, Samarinda 37830, Banten', '0819 657 183', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(874, 2, 'qsuwarno@example.com', '51860252', 'Malika Suryatmi S.Pt', 'Malika Suryatmi S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bagas Pati No. 102, Banjarbaru 20809, SumSel', '(+62) 304 1123 4562', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(875, 2, 'alika.santoso@example.org', '76880795', 'Ina Nasyiah', 'Ina Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Nakula No. 525, Pekalongan 75161, Aceh', '0673 7137 3139', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(876, 2, 'mala.puspasari@example.net', '38879788', 'Eka Prabowo', 'Eka Prabowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Cokroaminoto No. 122, Bukittinggi 33602, JaTim', '0641 6638 6339', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(877, 2, 'yolanda.jane@example.org', '26830473', 'Gandewa Waluyo', 'Gandewa Waluyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Labu No. 639, Tasikmalaya 10832, Papua', '0918 4980 7470', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(878, 2, 'bnasyiah@example.com', '64972361', 'Natalia Padma Pertiwi S.IP', 'Natalia Padma Pertiwi S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Dahlia No. 31, Kediri 15982, SulBar', '0907 5214 7809', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(879, 2, 'fsiregar@example.org', '60058592', 'Hani Fujiati', 'Hani Fujiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Mahakam No. 142, Yogyakarta 15549, Lampung', '(+62) 537 4986 928', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(880, 2, 'riyanti.ibrahim@example.org', '22838102', 'Wahyu Saputra M.Pd', 'Wahyu Saputra M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Basuki No. 177, Tidore Kepulauan 56980, BaBel', '0709 1067 051', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35');
INSERT INTO `students` (`id`, `class_id`, `email`, `identity_number`, `full_name`, `username`, `password`, `gender`, `address`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(881, 2, 'wahyuni.harsaya@example.net', '65134032', 'Pia Sudiati M.Pd', 'Pia Sudiati M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Orang No. 645, Pekalongan 26757, Gorontalo', '(+62) 607 4037 2601', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(882, 2, 'asirwanda.salahudin@example.com', '28388215', 'Harimurti Sitorus', 'Harimurti Sitorus', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Kiaracondong No. 360, Padangpanjang 65585, BaBel', '(+62) 334 4468 4411', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(883, 2, 'galuh02@example.com', '19047946', 'Garang Pradana M.Kom.', 'Garang Pradana M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Jend. A. Yani No. 260, Banjar 76713, DKI', '0816 514 663', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(884, 2, 'sitompul.devi@example.com', '48817859', 'Latif Narpati', 'Latif Narpati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Kalimalang No. 898, Pasuruan 27202, SulTra', '0732 3052 5688', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(885, 2, 'handayani.nova@example.org', '36013497', 'Tiara Fujiati', 'Tiara Fujiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bacang No. 994, Banjarmasin 50475, SulTeng', '0914 7635 347', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(886, 2, 'lukita44@example.com', '79696903', 'Chelsea Jessica Wijayanti S.H.', 'Chelsea Jessica Wijayanti S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Nakula No. 447, Padang 21699, Lampung', '0568 1613 914', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(887, 2, 'gjanuar@example.org', '67794870', 'Hilda Patricia Nasyiah', 'Hilda Patricia Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Adisucipto No. 739, Bima 42833, Bengkulu', '0790 7995 663', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(888, 2, 'radika.hassanah@example.com', '32573165', 'Dina Tania Zulaika', 'Dina Tania Zulaika', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Veteran No. 882, Solok 82144, JaBar', '0885 866 711', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(889, 2, 'cmarpaung@example.net', '75272530', 'Hartana Waluyo Maulana S.Sos', 'Hartana Waluyo Maulana S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Moch. Toha No. 866, Pekalongan 81115, KalUt', '(+62) 538 4332 310', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(890, 2, 'fyolanda@example.org', '82505646', 'Setya Santoso', 'Setya Santoso', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Basuki Rahmat  No. 416, Pariaman 89988, Lampung', '0533 1722 238', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(891, 2, 'dodo.sitompul@example.com', '9583278', 'Lala Aryani S.Kom', 'Lala Aryani S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sudiarto No. 288, Bogor 53439, DIY', '0316 4231 5584', NULL, 1, '2023-11-02 00:48:35', '2023-11-02 00:48:35'),
(892, 2, 'fujiati.bella@example.com', '47356111', 'Banawa Prasasta S.Sos', 'Banawa Prasasta S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bahagia No. 534, Bukittinggi 80901, Banten', '0892 435 834', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(893, 2, 'ayulianti@example.net', '66935651', 'Alika Nasyiah', 'Alika Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bayam No. 431, Pontianak 18287, Papua', '0633 4039 9133', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(894, 2, 'hana66@example.net', '69953112', 'Ophelia Pudjiastuti', 'Ophelia Pudjiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Kyai Gede No. 39, Padangsidempuan 21333, Aceh', '(+62) 355 4900 417', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(895, 2, 'narpati.dirja@example.net', '53920885', 'Warji Thamrin S.Kom', 'Warji Thamrin S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Moch. Toha No. 603, Palangka Raya 97095, SulUt', '(+62) 973 3658 755', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(896, 2, 'twaskita@example.net', '80806177', 'Cinta Safitri', 'Cinta Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Aceh No. 660, Denpasar 24535, SumUt', '(+62) 28 6791 7541', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(897, 2, 'teguh26@example.com', '52420351', 'Ismail Sitorus', 'Ismail Sitorus', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Moch. Toha No. 235, Sorong 88284, SulSel', '(+62) 387 1016 7985', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(898, 2, 'dinda.mayasari@example.com', '21275610', 'Sadina Riyanti', 'Sadina Riyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Yohanes No. 29, Yogyakarta 17934, KalTeng', '0526 9323 247', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(899, 2, 'shakila57@example.net', '4834921', 'Cakrawala Kamidin Halim S.E.', 'Cakrawala Kamidin Halim S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Hang No. 579, Tarakan 10416, KalUt', '(+62) 573 1047 4119', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(900, 2, 'lnatsir@example.com', '57718321', 'Tugiman Langgeng Setiawan', 'Tugiman Langgeng Setiawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Zamrud No. 645, Tanjungbalai 46981, KalTeng', '(+62) 934 8617 479', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(901, 2, 'uyuniar@example.com', '77376863', 'Okta Opan Nashiruddin S.I.Kom', 'Okta Opan Nashiruddin S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Untung Suropati No. 986, Tanjung Pinang 82139, DKI', '0570 7005 9107', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(902, 2, 'omandasari@example.com', '95684311', 'Wira Hutasoit', 'Wira Hutasoit', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Qrisdoren No. 419, Subulussalam 50306, Papua', '0383 7491 9991', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(903, 2, 'rahayu.elisa@example.org', '87652875', 'Padmi Hassanah', 'Padmi Hassanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bagonwoto  No. 377, Yogyakarta 39348, SulTeng', '(+62) 772 9091 3838', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(904, 2, 'anggabaya.saptono@example.net', '47121992', 'Farah Usyi Agustina', 'Farah Usyi Agustina', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bawal No. 250, Banjar 72505, SulSel', '0265 0496 281', NULL, 1, '2023-11-02 00:48:36', '2023-11-02 00:48:36'),
(906, 2, 'tira51@example.org', '55677740', 'Amelia Hasanah', 'Amelia Hasanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ciumbuleuit No. 718, Lubuklinggau 28299, JaTim', '(+62) 228 9346 938', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(907, 2, 'prasasta.keisha@example.com', '7601061', 'Maryanto Maulana', 'Maryanto Maulana', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Basoka Raya No. 968, Manado 68471, MalUt', '(+62) 388 4233 391', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(908, 2, 'laksita.azalea@example.net', '76438652', 'Fitriani Novitasari S.Psi', 'Fitriani Novitasari S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Kebonjati No. 723, Magelang 27947, MalUt', '(+62) 223 0303 9786', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(909, 2, 'titi31@example.com', '15425315', 'Caraka Rajasa', 'Caraka Rajasa', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baranang Siang No. 710, Salatiga 38238, SulTra', '0360 8369 558', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(910, 2, 'gnurdiyanti@example.net', '49234391', 'Gamanto Emil Waluyo', 'Gamanto Emil Waluyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Yoga No. 882, Pekanbaru 58894, Bali', '0478 0331 2536', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(911, 2, 'pmaulana@example.net', '90778501', 'Ghani Kurniawan', 'Ghani Kurniawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Imam No. 689, Administrasi Jakarta Selatan 91883, JaTeng', '022 7716 1477', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(912, 2, 'adika10@example.org', '9572850', 'Citra Mardhiyah', 'Citra Mardhiyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Ters. Jakarta No. 337, Surakarta 67831, Bengkulu', '0481 3287 9116', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(913, 2, 'restu01@example.net', '87341110', 'Wardi Darmaji Pradipta S.Pt', 'Wardi Darmaji Pradipta S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bayan No. 61, Bontang 93654, JaTim', '(+62) 25 1926 5140', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(914, 2, 'ssinaga@example.com', '52649350', 'Paris Oktaviani', 'Paris Oktaviani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ciwastra No. 863, Solok 34332, SumBar', '0299 4289 3270', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(915, 2, 'sriyanti@example.com', '85354928', 'Hesti Kartika Halimah', 'Hesti Kartika Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Yosodipuro No. 109, Lubuklinggau 52589, Jambi', '(+62) 567 1471 0750', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(916, 2, 'tampubolon.asman@example.com', '35306728', 'Shania Pudjiastuti', 'Shania Pudjiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Jayawijaya No. 161, Mojokerto 86099, SumBar', '(+62) 889 4786 815', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(917, 2, 'opangestu@example.com', '27809424', 'Ade Nuraini', 'Ade Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sutarjo No. 439, Banjar 66691, Papua', '0414 2454 2830', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(918, 2, 'halimah.tari@example.com', '955716', 'Diana Usamah', 'Diana Usamah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Untung Suropati No. 137, Solok 73378, Jambi', '0475 0964 3694', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(919, 2, 'dartono.utama@example.com', '12575700', 'Umar Maryadi S.Sos', 'Umar Maryadi S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Jaksa No. 487, Yogyakarta 71337, JaTim', '0811 7920 804', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(920, 2, 'karsana.suryatmi@example.com', '55499225', 'Febi Zulfa Halimah', 'Febi Zulfa Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Fajar No. 152, Sibolga 69519, Bengkulu', '0696 2744 0321', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(921, 2, 'jarwa02@example.com', '5244745', 'Jarwa Sirait', 'Jarwa Sirait', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Urip Sumoharjo No. 562, Pekalongan 33583, JaTeng', '(+62) 750 8638 2336', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(922, 2, 'ani.simanjuntak@example.net', '70488245', 'Almira Suartini S.Ked', 'Almira Suartini S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Aceh No. 602, Subulussalam 15206, JaTim', '(+62) 897 527 704', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(923, 2, 'putri03@example.net', '90678289', 'Harja Nainggolan', 'Harja Nainggolan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bakin No. 638, Payakumbuh 93225, Lampung', '(+62) 970 1842 4405', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(924, 2, 'vpermadi@example.com', '96513677', 'Bella Usada', 'Bella Usada', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Untung Suropati No. 464, Tegal 15231, BaBel', '(+62) 852 691 968', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(925, 2, 'anggraini.rahayu@example.com', '56691484', 'Karman Iswahyudi', 'Karman Iswahyudi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Basmol Raya No. 402, Administrasi Jakarta Barat 47314, BaBel', '(+62) 992 3323 970', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(926, 2, 'muni40@example.com', '31198531', 'Arsipatra Cawisadi Nainggolan', 'Arsipatra Cawisadi Nainggolan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Basuki No. 929, Parepare 18390, Banten', '(+62) 927 1035 5855', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(927, 2, 'mnarpati@example.org', '63603379', 'Tira Rahayu S.Psi', 'Tira Rahayu S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Tangkuban Perahu No. 597, Pagar Alam 78187, SumUt', '0970 0430 2839', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(928, 2, 'zamira74@example.com', '20548500', 'Yunita Dewi Laksita', 'Yunita Dewi Laksita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ters. Pasir Koja No. 976, Ternate 24658, NTB', '0587 2051 103', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(929, 2, 'lmulyani@example.com', '28113716', 'Harto Arta Prabowo M.Ak', 'Harto Arta Prabowo M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Ikan No. 140, Payakumbuh 42966, Bengkulu', '0553 1369 732', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(930, 2, 'zulaikha42@example.net', '53268191', 'Danu Hutapea', 'Danu Hutapea', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Muwardi No. 330, Tarakan 70066, SulSel', '0865 7489 3751', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(931, 2, 'nashiruddin.jayadi@example.net', '8316183', 'Warsa Mulyanto Pradipta', 'Warsa Mulyanto Pradipta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Kalimalang No. 278, Padang 87912, Gorontalo', '0409 3914 7183', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(932, 2, 'nilam62@example.net', '55633566', 'Yuliana Mayasari', 'Yuliana Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Laksamana No. 912, Pagar Alam 62186, BaBel', '0268 2851 4929', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(933, 2, 'pratiwi.putri@example.org', '45665610', 'Yessi Olivia Hartati M.M.', 'Yessi Olivia Hartati M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Baranang Siang Indah No. 522, Palangka Raya 48897, SulTeng', '0857 3546 847', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(934, 2, 'jarwadi.suryono@example.org', '68211740', 'Vicky Mayasari', 'Vicky Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Flores No. 103, Padangsidempuan 69831, PapBar', '(+62) 804 9831 7337', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(935, 2, 'ikusmawati@example.org', '31622491', 'Wardaya Natsir M.Ak', 'Wardaya Natsir M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Madrasah No. 856, Pariaman 86308, JaBar', '0605 4251 351', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(936, 2, 'shastuti@example.com', '65571924', 'Eli Hastuti', 'Eli Hastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bagonwoto  No. 306, Bitung 63978, MalUt', '026 5963 1327', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(937, 2, 'cpadmasari@example.net', '88291702', 'Cayadi Kurniawan', 'Cayadi Kurniawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bayam No. 613, Gorontalo 54602, KalTim', '(+62) 803 4335 0299', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(938, 2, 'wkusmawati@example.net', '99146183', 'Daliono Suwarno', 'Daliono Suwarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Supono No. 503, Payakumbuh 25416, SumSel', '0254 1002 008', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(939, 2, 'swahyudin@example.net', '35352146', 'Diah Astuti', 'Diah Astuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Basuki No. 442, Payakumbuh 83068, Maluku', '(+62) 789 3259 2317', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(940, 2, 'dipa21@example.net', '32583450', 'Oliva Pertiwi M.Ak', 'Oliva Pertiwi M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Tambak No. 902, Bukittinggi 93981, Riau', '0321 0883 6638', NULL, 1, '2023-11-02 00:49:11', '2023-11-02 00:49:11'),
(941, 2, 'iriana13@example.com', '78518233', 'Marsudi Nashiruddin', 'Marsudi Nashiruddin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Abdul No. 79, Bandar Lampung 25730, Papua', '0382 8969 029', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(942, 2, 'citra.suryono@example.org', '49796071', 'Mila Diah Widiastuti S.Ked', 'Mila Diah Widiastuti S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Cikutra Barat No. 445, Palembang 75133, Jambi', '(+62) 262 7389 2150', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(943, 2, 'kurniawan.maria@example.net', '7994988', 'Edi Hidayanto', 'Edi Hidayanto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Merdeka No. 488, Palu 14441, Jambi', '(+62) 217 5590 159', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(944, 2, 'adika.manullang@example.org', '1020247', 'Hani Palastri', 'Hani Palastri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Cikutra Barat No. 578, Cirebon 57141, KalTeng', '0353 9596 878', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(945, 2, 'almira41@example.org', '15143729', 'Prayitna Saptono S.Farm', 'Prayitna Saptono S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Taman No. 75, Sungai Penuh 57037, KalTeng', '0343 9799 605', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(946, 2, 'anastasia.yuniar@example.org', '58163417', 'Balapati Tampubolon', 'Balapati Tampubolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Krakatau No. 802, Tasikmalaya 57536, JaBar', '0836 694 111', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(947, 2, 'oktaviani.puput@example.net', '67095019', 'Adika Simanjuntak', 'Adika Simanjuntak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Baranangsiang No. 865, Cimahi 56704, SulUt', '(+62) 29 3388 816', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(948, 2, 'ksusanti@example.com', '8665746', 'Ami Wijayanti', 'Ami Wijayanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Baiduri No. 813, Administrasi Jakarta Selatan 14121, JaTeng', '0299 0410 833', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(949, 2, 'najwa.kusmawati@example.org', '56114797', 'Asirwada Vega Wijaya M.Ak', 'Asirwada Vega Wijaya M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Jamika No. 143, Lhokseumawe 53485, Bali', '(+62) 23 0125 973', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(950, 2, 'estiono80@example.net', '24018698', 'Jabal Jumadi Santoso', 'Jabal Jumadi Santoso', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Banda No. 876, Pagar Alam 31963, SumBar', '0611 9071 4341', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(951, 2, 'mangunsong.wakiman@example.com', '12000850', 'Nadine Maria Winarsih', 'Nadine Maria Winarsih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Pahlawan No. 91, Pariaman 92922, Aceh', '0636 3680 6021', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(952, 2, 'vicky70@example.net', '94105425', 'Oskar Johan Nainggolan M.M.', 'Oskar Johan Nainggolan M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Setia Budi No. 664, Padang 88862, SumBar', '0303 9957 8855', NULL, 1, '2023-11-02 00:49:12', '2023-11-02 00:49:12'),
(953, 2, 'yuliana.puspita@example.com', '33359989', 'Galuh Prabowo', 'Galuh Prabowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bhayangkara No. 132, Surabaya 94407, Banten', '0721 4154 7971', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(954, 2, 'raina54@example.org', '5274068', 'Chandra Napitupulu', 'Chandra Napitupulu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Lembong No. 32, Pontianak 98314, SumUt', '0663 0230 8822', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(955, 2, 'hnasyiah@example.com', '83839104', 'Yuni Laksmiwati M.Ak', 'Yuni Laksmiwati M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sudirman No. 514, Cilegon 89014, Banten', '0928 3267 6617', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(956, 2, 'umi.purnawati@example.net', '66832661', 'Zaenab Maryati', 'Zaenab Maryati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Umalas No. 654, Kendari 95593, KepR', '(+62) 24 3230 234', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(957, 2, 'gatot46@example.net', '36147390', 'Hari Kusumo', 'Hari Kusumo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. R.E. Martadinata No. 847, Ambon 72892, KalUt', '(+62) 304 2685 0782', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(958, 2, 'zahra.hartati@example.com', '82142096', 'Janet Fujiati', 'Janet Fujiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Babakan No. 3, Administrasi Jakarta Barat 54139, Papua', '(+62) 279 6730 1272', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(959, 2, 'yuniar.sidiq@example.com', '10727796', 'Uli Prastuti', 'Uli Prastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sadang Serang No. 227, Semarang 48888, SulTra', '0224 0498 689', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(960, 2, 'nashiruddin.asmianto@example.org', '59679005', 'Novi Wastuti', 'Novi Wastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bakau No. 706, Kendari 13602, SumUt', '028 2690 7958', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(961, 2, 'puspita.rama@example.com', '21469005', 'Ajimat Pangestu', 'Ajimat Pangestu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Ciwastra No. 321, Lubuklinggau 23674, SulBar', '(+62) 857 3842 793', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(962, 2, 'mlailasari@example.org', '46205451', 'Zulfa Genta Yuniar', 'Zulfa Genta Yuniar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Baik No. 697, Mojokerto 16534, SulSel', '(+62) 930 5621 001', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(963, 2, 'megantara.lili@example.net', '13280428', 'Ivan Gunawan', 'Ivan Gunawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Yoga No. 487, Blitar 45035, KalBar', '0496 7869 3471', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(964, 2, 'utami.pandu@example.com', '5041922', 'Ophelia Tami Rahmawati M.Kom.', 'Ophelia Tami Rahmawati M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Rajawali Barat No. 7, Padangpanjang 17165, SulUt', '(+62) 792 5042 2688', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(965, 2, 'adikara39@example.net', '9895456', 'Jais Jamal Wacana S.Sos', 'Jais Jamal Wacana S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Umalas No. 251, Banda Aceh 95031, DKI', '(+62) 757 5976 5043', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(966, 2, 'kusmawati.mila@example.org', '90946257', 'Ani Wahyuni', 'Ani Wahyuni', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Ronggowarsito No. 240, Salatiga 91416, KalBar', '0946 1891 3289', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(967, 2, 'titin.suryono@example.com', '54618749', 'Ulya Aryani', 'Ulya Aryani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. M.T. Haryono No. 801, Mataram 39881, JaBar', '(+62) 971 0582 100', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(968, 2, 'winarno.kairav@example.org', '70348931', 'Zizi Laksmiwati', 'Zizi Laksmiwati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Jaksa No. 439, Batam 58115, SulSel', '0904 3334 2755', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(969, 2, 'daruna14@example.com', '59337093', 'Rika Rika Nasyiah M.Kom.', 'Rika Rika Nasyiah M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bazuka Raya No. 75, Sorong 33189, MalUt', '0825 6623 3152', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(970, 2, 'mustofa.ghaliyati@example.com', '78966759', 'Enteng Hari Dongoran', 'Enteng Hari Dongoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Peta No. 497, Padang 40164, SulTra', '(+62) 568 0311 247', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(971, 2, 'lhabibi@example.net', '77894017', 'Makuta Siregar', 'Makuta Siregar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bak Mandi No. 277, Magelang 78254, JaTeng', '(+62) 293 9687 2027', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(972, 2, 'mursinin57@example.org', '59406672', 'Rusman Pranowo', 'Rusman Pranowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Wora Wari No. 774, Jayapura 86382, Riau', '0284 5244 2675', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(973, 2, 'vtamba@example.net', '17306549', 'Fitria Safitri S.IP', 'Fitria Safitri S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baik No. 603, Yogyakarta 22112, Papua', '0938 6414 4231', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(974, 2, 'msaefullah@example.org', '154311', 'Lega Winarno S.H.', 'Lega Winarno S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bata Putih No. 960, Administrasi Jakarta Barat 96976, KalTim', '(+62) 688 7089 585', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(975, 2, 'yulianti.victoria@example.net', '82562212', 'Lanjar Nrima Haryanto M.TI.', 'Lanjar Nrima Haryanto M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Lembong No. 856, Kendari 79673, JaBar', '0209 2308 858', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(976, 2, 'bagas17@example.com', '69023060', 'Zalindra Purwanti', 'Zalindra Purwanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Ters. Pasir Koja No. 229, Bekasi 81689, PapBar', '0830 3587 1284', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(977, 2, 'damar.mardhiyah@example.net', '34984062', 'Tira Anggraini', 'Tira Anggraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Lada No. 309, Binjai 44496, NTB', '(+62) 720 8598 9071', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(978, 2, 'qagustina@example.org', '84834362', 'Rahmi Ophelia Fujiati S.E.I', 'Rahmi Ophelia Fujiati S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Pacuan Kuda No. 586, Denpasar 58126, KalUt', '(+62) 582 1599 8207', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(979, 2, 'halimah.syahrini@example.net', '48093811', 'Fathonah Zulaikha Yuniar S.E.I', 'Fathonah Zulaikha Yuniar S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Laswi No. 951, Balikpapan 17015, JaTeng', '0800 0824 419', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(980, 2, 'queen.zulaika@example.org', '69910913', 'Sadina Utami M.M.', 'Sadina Utami M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Acordion No. 223, Jambi 84725, JaTeng', '0734 2155 573', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(981, 2, 'daruna.puspasari@example.com', '91578121', 'Tari Pudjiastuti', 'Tari Pudjiastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. W.R. Supratman No. 542, Gorontalo 98698, BaBel', '0595 9035 995', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(982, 2, 'nsamosir@example.net', '72526561', 'Eli Kani Nuraini', 'Eli Kani Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Rajawali No. 597, Pekalongan 22565, JaTim', '(+62) 329 1915 9172', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(983, 2, 'xnasyiah@example.com', '20002410', 'Kala Daliono Simbolon M.Pd', 'Kala Daliono Simbolon M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Salak No. 361, Blitar 23494, KepR', '(+62) 722 7532 287', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(984, 2, 'jnainggolan@example.net', '2779877', 'Rahmi Melani', 'Rahmi Melani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Kebonjati No. 246, Ambon 32499, Gorontalo', '(+62) 640 2837 5823', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(985, 2, 'zulaikha.kuswoyo@example.com', '55307177', 'Anita Hartati', 'Anita Hartati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Dipenogoro No. 104, Subulussalam 20573, SumUt', '(+62) 913 7206 0999', NULL, 1, '2023-11-02 00:49:13', '2023-11-02 00:49:13'),
(986, 2, 'kusumo.almira@example.org', '84138925', 'Laras Novitasari', 'Laras Novitasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sugiono No. 380, Surabaya 69841, Jambi', '(+62) 889 400 990', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(987, 2, 'susanti.kasim@example.com', '36231336', 'Yuni Cinthia Sudiati', 'Yuni Cinthia Sudiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bank Dagang Negara No. 171, Bima 26370, DIY', '(+62) 23 5806 915', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(988, 2, 'maida12@example.org', '701715', 'Daruna Ismail Uwais', 'Daruna Ismail Uwais', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Pahlawan No. 712, Tomohon 16094, SumSel', '0994 8167 820', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(989, 2, 'tirta.putra@example.org', '76167230', 'Emong Samosir', 'Emong Samosir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ikan No. 608, Administrasi Jakarta Timur 42391, BaBel', '(+62) 202 7580 5692', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(990, 2, 'cahyanto65@example.net', '36064611', 'Kairav Irwan Mangunsong', 'Kairav Irwan Mangunsong', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Kyai Gede No. 551, Palopo 68832, Jambi', '0411 5475 0761', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(991, 2, 'aoktaviani@example.com', '19328006', 'Amalia Usyi Oktaviani', 'Amalia Usyi Oktaviani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Gajah Mada No. 315, Madiun 84403, Papua', '(+62) 20 6195 923', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(992, 2, 'kamila.sihombing@example.com', '97304647', 'Cinta Zelaya Mulyani S.Pt', 'Cinta Zelaya Mulyani S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Basmol Raya No. 955, Makassar 37501, Lampung', '(+62) 566 6141 006', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(993, 2, 'wulandari.saiful@example.net', '38767204', 'Iriana Nadine Hariyah', 'Iriana Nadine Hariyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Tambun No. 479, Tegal 18723, DIY', '0756 4472 369', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(994, 2, 'ikhsan62@example.com', '37989518', 'Zulfa Fujiati', 'Zulfa Fujiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Madiun No. 669, Serang 63650, SulBar', '0683 1740 546', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(995, 2, 'hana84@example.net', '38146480', 'Irnanto Ardianto', 'Irnanto Ardianto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Lembong No. 799, Samarinda 12363, SulUt', '0215 0808 631', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(996, 2, 'vicky92@example.net', '72061360', 'Najwa Nasyiah', 'Najwa Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Cokroaminoto No. 536, Depok 87703, DKI', '(+62) 293 4532 8314', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(997, 2, 'hpadmasari@example.net', '50038983', 'Juli Mandasari', 'Juli Mandasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Merdeka No. 243, Dumai 56912, DKI', '(+62) 23 4501 9337', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(998, 2, 'yuliarti.kanda@example.net', '17285856', 'Joko Baktiono Halim M.TI.', 'Joko Baktiono Halim M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Moch. Ramdan No. 321, Bontang 65694, SulSel', '0815 702 008', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(999, 2, 'oni.suwarno@example.com', '34137614', 'Pangeran Hidayanto S.H.', 'Pangeran Hidayanto S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Yos No. 895, Sibolga 23001, MalUt', '(+62) 844 7866 711', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1000, 2, 'djailani@example.com', '68417315', 'Ade Sudiati', 'Ade Sudiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. K.H. Wahid Hasyim (Kopo) No. 330, Bima 26942, Gorontalo', '(+62) 311 7614 953', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1001, 2, 'bahuwirya.maryadi@example.net', '84074853', 'Cakrawangsa Prayoga', 'Cakrawangsa Prayoga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ekonomi No. 207, Gunungsitoli 42270, KalBar', '0942 6189 1902', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1002, 2, 'shakila.natsir@example.net', '12146094', 'Ami Lailasari S.Farm', 'Ami Lailasari S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Untung Suropati No. 971, Metro 87687, SumUt', '(+62) 741 0217 8865', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1003, 2, 'icha.prastuti@example.net', '80363707', 'Febi Mardhiyah', 'Febi Mardhiyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Gegerkalong Hilir No. 859, Surakarta 94031, JaBar', '(+62) 485 9266 2947', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1004, 2, 'dewi.narpati@example.org', '85238792', 'Septi Mulyani', 'Septi Mulyani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Cokroaminoto No. 571, Makassar 32035, JaTeng', '(+62) 351 0321 6684', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1005, 2, 'reza42@example.org', '53804634', 'Dadap Firmansyah M.M.', 'Dadap Firmansyah M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Qrisdoren No. 93, Batam 97453, KalSel', '0726 1426 475', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1006, 2, 'cemplunk61@example.com', '17829377', 'Himawan Luhung Sitorus', 'Himawan Luhung Sitorus', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Ekonomi No. 697, Lhokseumawe 16216, Papua', '0837 6575 514', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1007, 2, 'qbudiman@example.com', '96517328', 'Putri Citra Halimah', 'Putri Citra Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Monginsidi No. 696, Jayapura 57272, Papua', '(+62) 981 4198 4516', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1008, 2, 'iyulianti@example.org', '95213241', 'Carla Wijayanti', 'Carla Wijayanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sumpah Pemuda No. 453, Kendari 25728, BaBel', '0629 4770 442', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1009, 2, 'dzulaika@example.com', '12924534', 'Ghaliyati Suryatmi', 'Ghaliyati Suryatmi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Baing No. 129, Denpasar 87614, Bali', '(+62) 886 5966 978', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1010, 2, 'yuniar.mulya@example.org', '12475148', 'Asmadi Prabowo', 'Asmadi Prabowo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bakin No. 48, Administrasi Jakarta Barat 79075, JaTim', '0513 7650 6118', NULL, 1, '2023-11-02 00:49:14', '2023-11-02 00:49:14'),
(1012, 2, 'samosir.dadap@example.net', '30572102', 'Pangestu Tasdik Latupono M.Farm', 'Pangestu Tasdik Latupono M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baiduri No. 800, Tual 84019, SumSel', '0961 6093 085', NULL, 1, '2023-11-02 00:49:32', '2023-11-02 00:49:32'),
(1013, 2, 'aryani.putu@example.net', '39646353', 'Devi Mardhiyah', 'Devi Mardhiyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Basket No. 652, Samarinda 19459, KalSel', '(+62) 419 5241 4127', NULL, 1, '2023-11-02 00:49:32', '2023-11-02 00:49:32'),
(1014, 2, 'cakrajiya21@example.com', '70724142', 'Ian Kusumo S.Psi', 'Ian Kusumo S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Madrasah No. 551, Magelang 17490, JaTeng', '(+62) 539 6226 616', NULL, 1, '2023-11-02 00:49:32', '2023-11-02 00:49:32'),
(1015, 2, 'bsiregar@example.org', '92491684', 'Salimah Hartati', 'Salimah Hartati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bayan No. 614, Tomohon 38249, MalUt', '0902 1447 724', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1016, 2, 'samosir.bakiadi@example.com', '8958317', 'Rina Mayasari', 'Rina Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sutoyo No. 287, Tangerang 77290, Maluku', '(+62) 563 3267 396', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1017, 2, 'nasyiah.kamila@example.com', '75024816', 'Ayu Samiah Winarsih S.I.Kom', 'Ayu Samiah Winarsih S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Flora No. 117, Kendari 80051, DKI', '(+62) 817 1827 775', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1018, 2, 'hmelani@example.com', '33898435', 'Hani Wastuti', 'Hani Wastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baiduri No. 539, Bontang 97716, Papua', '0605 8288 890', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1019, 2, 'pnovitasari@example.com', '7111408', 'Karimah Puspasari', 'Karimah Puspasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Urip Sumoharjo No. 496, Bitung 24713, NTB', '0439 3695 1875', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1020, 2, 'nyoman.kuswoyo@example.net', '6113813', 'Lutfan Sabri Widodo S.T.', 'Lutfan Sabri Widodo S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Baranang Siang Indah No. 419, Tomohon 50547, DKI', '0259 6275 006', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1021, 2, 'zulaikha.haryanti@example.net', '52371361', 'Putri Fujiati', 'Putri Fujiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Adisumarmo No. 765, Surabaya 98851, Bengkulu', '0459 1664 961', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1022, 2, 'tari45@example.org', '5449076', 'Carub Anggriawan', 'Carub Anggriawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Basoka Raya No. 753, Tidore Kepulauan 94308, Bali', '(+62) 741 7044 707', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1023, 2, 'ami.hutapea@example.net', '93981309', 'Ajimat Jailani', 'Ajimat Jailani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Wahidin No. 540, Ternate 75302, Jambi', '(+62) 350 1521 9176', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1024, 2, 'oman.waluyo@example.org', '55767737', 'Teddy Simanjuntak M.TI.', 'Teddy Simanjuntak M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Abdul No. 920, Pangkal Pinang 39026, Bali', '(+62) 28 6104 5893', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1025, 2, 'qlestari@example.com', '35631807', 'Nugraha Marbun', 'Nugraha Marbun', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. W.R. Supratman No. 363, Depok 74267, KalTim', '(+62) 546 7640 7956', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1026, 2, 'sirait.diana@example.com', '18142286', 'Irwan Hutasoit', 'Irwan Hutasoit', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Baranang Siang Indah No. 938, Administrasi Jakarta Barat 25980, SulUt', '0855 9328 2228', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1027, 2, 'cakrabirawa67@example.org', '58942423', 'Kasiran Kambali Thamrin S.Gz', 'Kasiran Kambali Thamrin S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Babakan No. 295, Bengkulu 95846, SumSel', '(+62) 297 5151 342', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1028, 2, 'atmaja18@example.net', '35454058', 'Karsa Sihombing', 'Karsa Sihombing', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Gegerkalong Hilir No. 647, Parepare 81522, Riau', '(+62) 27 7903 2006', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1029, 2, 'timbul.kusmawati@example.org', '84029678', 'Anggabaya Firmansyah', 'Anggabaya Firmansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Kyai Gede No. 986, Palangka Raya 46702, Maluku', '(+62) 970 6075 0515', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1030, 2, 'ikhsan72@example.org', '48201426', 'Malik Wibowo S.Sos', 'Malik Wibowo S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Gardujati No. 72, Administrasi Jakarta Pusat 80112, Maluku', '0617 1006 9866', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1031, 2, 'lidya07@example.org', '80541718', 'Gangsar Hardiansyah', 'Gangsar Hardiansyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Tambun No. 977, Jayapura 53485, KalBar', '(+62) 698 8469 4794', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1032, 2, 'sarah.wahyudin@example.com', '11584583', 'Raihan Sihombing', 'Raihan Sihombing', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Tambak No. 265, Padangpanjang 87814, Maluku', '(+62) 815 4194 370', NULL, 1, '2023-11-02 00:49:33', '2023-11-02 00:49:33'),
(1033, 2, 'guwais@example.net', '44614250', 'Setya Hidayat', 'Setya Hidayat', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Diponegoro No. 361, Samarinda 17756, SumUt', '(+62) 504 2987 124', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1034, 2, 'kania21@example.org', '18611646', 'Gadang Thamrin M.Farm', 'Gadang Thamrin M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bagis Utama No. 53, Parepare 69875, Maluku', '0557 4042 0482', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1035, 2, 'namaga.wulan@example.org', '84929838', 'Liman Ega Mansur S.Ked', 'Liman Ega Mansur S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. B.Agam 1 No. 457, Solok 15353, KepR', '0341 2122 475', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1036, 2, 'utami.mala@example.com', '5688768', 'Putri Andriani', 'Putri Andriani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Basudewo No. 6, Payakumbuh 77883, JaBar', '0700 2572 286', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1037, 2, 'anita.maulana@example.net', '9586798', 'Genta Betania Pertiwi M.M.', 'Genta Betania Pertiwi M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Pacuan Kuda No. 650, Pasuruan 74761, NTT', '(+62) 844 1015 153', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1038, 2, 'mangunsong.kamal@example.org', '56768583', 'Liman Ivan Thamrin M.Ak', 'Liman Ivan Thamrin M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Karel S. Tubun No. 961, Langsa 55303, Riau', '(+62) 815 9004 7087', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1039, 2, 'mila.tamba@example.com', '70341452', 'Elvina Winarsih', 'Elvina Winarsih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Banda No. 566, Tarakan 46326, KalTeng', '0845 3782 0492', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1040, 2, 'halimah.karya@example.org', '30052949', 'Eman Salahudin', 'Eman Salahudin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bayan No. 852, Palangka Raya 91136, JaTim', '0249 6874 2163', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1041, 2, 'ahartati@example.net', '27684070', 'Cici Puspita', 'Cici Puspita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Tangkuban Perahu No. 426, Bengkulu 11353, JaTim', '(+62) 899 5252 5460', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1042, 2, 'ssaputra@example.net', '96113833', 'Martani Tamba', 'Martani Tamba', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. PHH. Mustofa No. 251, Administrasi Jakarta Utara 97872, KalSel', '022 3215 7956', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1043, 2, 'halim.kanda@example.org', '66640238', 'Reksa Gunawan', 'Reksa Gunawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Juanda No. 650, Tanjungbalai 46370, SumSel', '0230 0761 912', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1044, 2, 'hairyanto19@example.net', '35886533', 'Adikara Makara Saptono M.Farm', 'Adikara Makara Saptono M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Asia Afrika No. 85, Batu 46193, NTT', '0208 5776 674', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1045, 2, 'mulyani.nardi@example.net', '46906419', 'Putri Zamira Suartini S.T.', 'Putri Zamira Suartini S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Suryo Pranoto No. 490, Ambon 43704, SumSel', '(+62) 359 0865 5705', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1046, 2, 'rina.permata@example.com', '32259935', 'Kemba Hutapea', 'Kemba Hutapea', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bakti No. 895, Gorontalo 88204, SulSel', '(+62) 542 3863 5787', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1047, 2, 'mandasari.asman@example.net', '66136021', 'Putri Hartati', 'Putri Hartati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Banal No. 974, Tual 93204, SumBar', '(+62) 977 4692 213', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1048, 2, 'ghani.aryani@example.net', '5401504', 'Violet Utami', 'Violet Utami', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Basmol Raya No. 792, Tarakan 15259, BaBel', '(+62) 215 9686 0749', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1049, 2, 'pertiwi.lalita@example.org', '77305412', 'Kenes Kambali Damanik M.M.', 'Kenes Kambali Damanik M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Babakan No. 905, Administrasi Jakarta Selatan 60912, JaTim', '(+62) 652 5815 903', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1050, 2, 'asiregar@example.com', '18943677', 'Taufik Muni Sitorus M.TI.', 'Taufik Muni Sitorus M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Kebonjati No. 864, Pekalongan 98408, KalSel', '(+62) 26 5929 016', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1051, 2, 'hafshah42@example.net', '73956707', 'Yulia Padma Wulandari M.Pd', 'Yulia Padma Wulandari M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sumpah Pemuda No. 906, Palu 95723, Riau', '(+62) 29 4755 474', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1052, 2, 'akarsana29@example.net', '69705991', 'Salsabila Nuraini M.Pd', 'Salsabila Nuraini M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bahagia  No. 499, Yogyakarta 15143, Riau', '028 1394 7547', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1053, 2, 'kemal28@example.net', '34162407', 'Septi Nurdiyanti', 'Septi Nurdiyanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bata Putih No. 167, Tangerang Selatan 92535, Bengkulu', '(+62) 655 3914 089', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1054, 2, 'manullang.zulaikha@example.net', '22837945', 'Shania Yuniar', 'Shania Yuniar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ciumbuleuit No. 216, Sawahlunto 90918, KepR', '025 1193 565', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1055, 2, 'saragih.rusman@example.com', '64781433', 'Tantri Wijayanti S.Kom', 'Tantri Wijayanti S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Raya Ujungberung No. 138, Tarakan 47547, Riau', '(+62) 228 2902 8159', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1056, 2, 'ilyas41@example.com', '84078987', 'Lala Widiastuti S.Kom', 'Lala Widiastuti S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Wahid No. 113, Sukabumi 46543, DKI', '0885 5291 6276', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34');
INSERT INTO `students` (`id`, `class_id`, `email`, `identity_number`, `full_name`, `username`, `password`, `gender`, `address`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(1057, 2, 'tampubolon.sari@example.com', '76657904', 'Tri Sitorus', 'Tri Sitorus', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Astana Anyar No. 611, Tegal 43864, KepR', '(+62) 781 9264 536', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1058, 2, 'hyuliarti@example.org', '86535638', 'Kamal Siregar', 'Kamal Siregar', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Asia Afrika No. 549, Bukittinggi 74546, Aceh', '0281 6299 599', NULL, 1, '2023-11-02 00:49:34', '2023-11-02 00:49:34'),
(1060, 2, 'ykurniawan@example.org', '6435251', 'Septi Rahmawati S.Gz', 'Septi Rahmawati S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Casablanca No. 869, Palu 87234, NTT', '(+62) 753 9592 811', NULL, 1, '2023-11-02 00:49:47', '2023-11-02 00:49:47'),
(1061, 2, 'wahyuni.kemba@example.com', '652221', 'Clara Wijayanti', 'Clara Wijayanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Cemara No. 91, Surakarta 28023, Gorontalo', '(+62) 20 3360 1535', NULL, 1, '2023-11-02 00:49:47', '2023-11-02 00:49:47'),
(1062, 2, 'ragustina@example.net', '46796176', 'Ajimin Aswani Zulkarnain', 'Ajimin Aswani Zulkarnain', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Lumban Tobing No. 592, Bandar Lampung 48199, SulTra', '0644 0333 2971', NULL, 1, '2023-11-02 00:49:47', '2023-11-02 00:49:47'),
(1063, 2, 'mustofa.bella@example.com', '60787945', 'Cakrabuana Natsir S.Pd', 'Cakrabuana Natsir S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Abdul Muis No. 159, Pagar Alam 90955, Bali', '0557 1337 6091', NULL, 1, '2023-11-02 00:49:47', '2023-11-02 00:49:47'),
(1064, 2, 'simon.astuti@example.net', '27274475', 'Vivi Vicky Sudiati', 'Vivi Vicky Sudiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Baha No. 181, Administrasi Jakarta Selatan 89579, DIY', '023 3959 285', NULL, 1, '2023-11-02 00:49:47', '2023-11-02 00:49:47'),
(1065, 2, 'sinaga.lala@example.org', '10714811', 'Gangsar Radit Mansur S.E.I', 'Gangsar Radit Mansur S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Pacuan Kuda No. 475, Tasikmalaya 41946, BaBel', '(+62) 927 2797 165', NULL, 1, '2023-11-02 00:49:47', '2023-11-02 00:49:47'),
(1066, 2, 'lili10@example.net', '38506195', 'Agus Santoso', 'Agus Santoso', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. B.Agam 1 No. 373, Malang 80815, Maluku', '(+62) 667 6815 143', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1067, 2, 'sihombing.hamima@example.org', '96255155', 'Daru Prasasta S.Ked', 'Daru Prasasta S.Ked', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Tambun No. 808, Bitung 33245, DIY', '0602 2554 9437', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1068, 2, 'latika.kuswandari@example.net', '62470769', 'Ozy Irnanto Kuswoyo S.Psi', 'Ozy Irnanto Kuswoyo S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Urip Sumoharjo No. 592, Bima 93406, NTB', '(+62) 465 5938 604', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1069, 2, 'okta.suartini@example.com', '38889217', 'Budi Gilang Pranowo M.TI.', 'Budi Gilang Pranowo M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Ciumbuleuit No. 601, Surabaya 64858, SulUt', '(+62) 963 2428 3992', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1070, 2, 'lailasari.gawati@example.net', '1376349', 'Praba Kawaca Winarno', 'Praba Kawaca Winarno', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bakhita No. 232, Surakarta 74316, Gorontalo', '0304 3470 473', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1071, 2, 'upudjiastuti@example.com', '47563650', 'Maya Jamalia Lestari', 'Maya Jamalia Lestari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Ki Hajar Dewantara No. 234, Madiun 71451, SumSel', '(+62) 902 3697 2000', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1072, 2, 'tina10@example.org', '37042318', 'Maryanto Pratama', 'Maryanto Pratama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Suryo No. 334, Sukabumi 73314, JaTeng', '(+62) 531 6888 0812', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1073, 2, 'ypuspita@example.org', '24824824', 'Maimunah Safitri', 'Maimunah Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Arifin No. 672, Banjarmasin 53607, KalTim', '0310 0443 582', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1074, 2, 'bahuraksa29@example.net', '52009652', 'Tina Mayasari', 'Tina Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Dr. Junjunan No. 471, Serang 39841, Maluku', '0849 0912 7439', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1075, 2, 'karsa.kurniawan@example.org', '42114320', 'Satya Ardianto M.Ak', 'Satya Ardianto M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ujung No. 472, Administrasi Jakarta Selatan 97701, DIY', '0891 6021 493', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1076, 2, 'pranawa79@example.com', '22208308', 'Vanesa Ira Safitri M.Pd', 'Vanesa Ira Safitri M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Abdul. Muis No. 914, Tangerang 46522, Maluku', '0609 4662 212', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1077, 2, 'yulianti.prasetya@example.com', '28864936', 'Tiara Purnawati', 'Tiara Purnawati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. S. Parman No. 62, Administrasi Jakarta Barat 96803, Banten', '0759 4507 342', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1078, 2, 'permata.lanjar@example.org', '42369317', 'Jarwa Luluh Ramadan S.Pt', 'Jarwa Luluh Ramadan S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Abang No. 920, Pangkal Pinang 57190, NTT', '0613 9581 182', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1079, 2, 'hesti.hassanah@example.net', '4264056', 'Zaenab Riyanti S.T.', 'Zaenab Riyanti S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bass No. 491, Batu 62546, KalTim', '0220 9834 111', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1080, 2, 'kayun13@example.org', '63040625', 'Laila Rahimah', 'Laila Rahimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baabur Royan No. 155, Madiun 11344, KalTim', '0467 4012 1392', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1081, 2, 'laila67@example.org', '19603460', 'Zaenab Wahyuni', 'Zaenab Wahyuni', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Gajah No. 938, Probolinggo 15312, Banten', '(+62) 789 8753 9782', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1082, 2, 'iriana78@example.net', '88038763', 'Ulya Nasyidah', 'Ulya Nasyidah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Tubagus Ismail No. 517, Dumai 42167, SumUt', '0604 9367 7923', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1083, 2, 'purnawati.raisa@example.org', '52863334', 'Kemba Sinaga S.E.', 'Kemba Sinaga S.E.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Gedebage Selatan No. 745, Batu 67706, KalTeng', '(+62) 876 9402 416', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1084, 2, 'suartini.vanesa@example.net', '42877018', 'Yani Anggraini', 'Yani Anggraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bak Air No. 281, Solok 44538, Maluku', '(+62) 817 4061 6834', NULL, 1, '2023-11-02 00:49:48', '2023-11-02 00:49:48'),
(1085, 2, 'hastuti.hani@example.org', '5445312', 'Baktiadi Thamrin', 'Baktiadi Thamrin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Baranang Siang No. 312, Tomohon 93658, Lampung', '028 8783 5098', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1086, 2, 'cinthia.mustofa@example.org', '45752505', 'Safina Yuliarti', 'Safina Yuliarti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ters. Kiaracondong No. 517, Bukittinggi 54019, SulBar', '(+62) 364 4573 463', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1087, 2, 'indra86@example.org', '51995842', 'Diah Hani Yuliarti S.Pd', 'Diah Hani Yuliarti S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Gambang No. 793, Tidore Kepulauan 74781, Bengkulu', '0245 9876 411', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1088, 2, 'yiswahyudi@example.com', '94528060', 'Zelda Handayani', 'Zelda Handayani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Basket No. 934, Kupang 19670, Papua', '021 0609 545', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1089, 2, 'gmandasari@example.org', '9828584', 'Daniswara Pranawa Suryono S.I.Kom', 'Daniswara Pranawa Suryono S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Panjaitan No. 614, Parepare 66602, Aceh', '(+62) 549 3592 9495', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1090, 2, 'vharyanto@example.com', '73362710', 'Vivi Keisha Nuraini', 'Vivi Keisha Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Salatiga No. 818, Cilegon 48461, Bengkulu', '(+62) 803 1924 1513', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1091, 2, 'adinata87@example.com', '27553369', 'Hani Halimah', 'Hani Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Nanas No. 756, Yogyakarta 48062, KalBar', '0800 3268 619', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1092, 2, 'farida.jessica@example.com', '75170074', 'Lutfan Akarsana Uwais', 'Lutfan Akarsana Uwais', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Agus Salim No. 388, Makassar 11534, JaBar', '0858 9327 786', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1093, 2, 'astuti.cemeti@example.com', '97684103', 'Galih Dabukke', 'Galih Dabukke', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Halim No. 776, Mataram 55728, SumBar', '024 6276 256', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1094, 2, 'iswahyudi.marwata@example.com', '41270142', 'Kunthara Bakti Sihombing S.Pd', 'Kunthara Bakti Sihombing S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Yap Tjwan Bing No. 912, Banda Aceh 80898, KalTeng', '0867 1180 007', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1095, 2, 'ksaptono@example.net', '74559935', 'Cakrawangsa Simbolon', 'Cakrawangsa Simbolon', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Pelajar Pejuang 45 No. 881, Jayapura 16261, Jambi', '0696 8941 1418', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1096, 2, 'hsaptono@example.net', '54008463', 'Hana Puspita', 'Hana Puspita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Ciumbuleuit No. 202, Pekanbaru 93869, Banten', '022 3455 112', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1097, 2, 'victoria.situmorang@example.org', '57721099', 'Tantri Fujiati', 'Tantri Fujiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sutarto No. 820, Sibolga 37459, BaBel', '0670 7053 631', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1098, 2, 'apradana@example.org', '51177590', 'Citra Mayasari', 'Citra Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Ekonomi No. 497, Pasuruan 89373, Bali', '(+62) 295 8623 381', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1099, 2, 'pertiwi.jagapati@example.com', '64437807', 'Jarwadi Jagaraga Gunarto S.I.Kom', 'Jarwadi Jagaraga Gunarto S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Monginsidi No. 210, Sorong 50333, Bengkulu', '0719 4330 7670', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1100, 2, 'cecep95@example.org', '48925596', 'Hardi Kusumo', 'Hardi Kusumo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Rajiman No. 66, Tangerang Selatan 72359, KalUt', '(+62) 787 8608 951', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1101, 2, 'upangestu@example.org', '64471276', 'Harto Rendy Firgantoro', 'Harto Rendy Firgantoro', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Cikutra Timur No. 968, Tidore Kepulauan 91619, JaTim', '023 9819 442', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1102, 2, 'hidayanto.gaman@example.net', '41642936', 'Karna Zulkarnain S.Sos', 'Karna Zulkarnain S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Pahlawan No. 568, Administrasi Jakarta Utara 24798, SulTra', '(+62) 646 0663 1531', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1103, 2, 'jagaraga64@example.net', '34198937', 'Gawati Azalea Wulandari M.Pd', 'Gawati Azalea Wulandari M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. R.M. Said No. 823, Padangsidempuan 57920, JaTim', '(+62) 865 715 878', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1104, 2, 'pratiwi.wawan@example.com', '14512098', 'Legawa Saefullah S.IP', 'Legawa Saefullah S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Jagakarsa No. 256, Bontang 55286, Jambi', '0502 1190 937', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1105, 2, 'cwinarno@example.net', '98958329', 'Harja Adriansyah M.TI.', 'Harja Adriansyah M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Yap Tjwan Bing No. 267, Jayapura 84150, SulTeng', '(+62) 345 2394 462', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1106, 2, 'situmorang.wasis@example.net', '49861988', 'Bala Tugiman Natsir S.Gz', 'Bala Tugiman Natsir S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Thamrin No. 382, Jayapura 20661, BaBel', '0405 7506 9682', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1107, 2, 'lutfan.suwarno@example.net', '6416209', 'Aisyah Rahimah', 'Aisyah Rahimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Salatiga No. 371, Semarang 76372, Banten', '(+62) 347 0394 329', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1108, 2, 'nprasetyo@example.com', '19723723', 'Maryadi Utama', 'Maryadi Utama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Rumah Sakit No. 587, Bandung 79879, Bali', '0990 6282 1065', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1109, 2, 'fitriani67@example.com', '96849543', 'Vega Prasetya M.Ak', 'Vega Prasetya M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Suniaraja No. 407, Banjarmasin 59608, Gorontalo', '(+62) 392 3702 0856', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1110, 2, 'ozulaika@example.org', '93942385', 'Iriana Maryati', 'Iriana Maryati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bakit  No. 483, Administrasi Jakarta Selatan 75835, SumUt', '0900 3293 820', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1111, 2, 'fitria17@example.com', '16073587', 'Najam Gunawan M.Pd', 'Najam Gunawan M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Lembong No. 124, Tasikmalaya 52210, SumUt', '(+62) 629 2332 860', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1112, 2, 'jumadi36@example.net', '5316356', 'Koko Samosir', 'Koko Samosir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Siliwangi No. 198, Administrasi Jakarta Utara 83462, SumBar', '0657 4801 068', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1113, 2, 'ade83@example.com', '76463778', 'Hani Usyi Safitri', 'Hani Usyi Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. B.Agam 1 No. 691, Magelang 68673, SumSel', '(+62) 442 5263 3513', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1114, 2, 'ariyanti@example.com', '65483067', 'Mahesa Lutfan Gunawan', 'Mahesa Lutfan Gunawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Pacuan Kuda No. 485, Bitung 89157, SumSel', '(+62) 21 9079 6970', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1115, 2, 'hani20@example.net', '81589343', 'Elma Ami Nuraini', 'Elma Ami Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Baranang No. 520, Bima 44046, KalSel', '0278 2678 8659', NULL, 1, '2023-11-02 00:49:49', '2023-11-02 00:49:49'),
(1116, 2, 'victoria.sirait@example.net', '29822739', 'Himawan Cakrawangsa Sihotang S.IP', 'Himawan Cakrawangsa Sihotang S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. B.Agam Dlm No. 448, Tomohon 76045, Aceh', '0943 2882 6866', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1117, 2, 'vyolanda@example.org', '98677250', 'Nardi Iswahyudi', 'Nardi Iswahyudi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Cemara No. 105, Tual 12945, SumSel', '(+62) 464 2203 430', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1118, 2, 'nuraini.elma@example.org', '6816427', 'Yani Mayasari', 'Yani Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Salam No. 653, Tual 19869, Banten', '0388 6073 526', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1119, 2, 'qdabukke@example.net', '8238999', 'Jatmiko Dongoran S.IP', 'Jatmiko Dongoran S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Tambak No. 25, Jambi 30229, SulTra', '(+62) 513 5915 093', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1120, 2, 'gunarto.rudi@example.org', '8020829', 'Jaka Jamil Saptono M.Farm', 'Jaka Jamil Saptono M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Baik No. 76, Makassar 14010, KalTeng', '(+62) 250 4171 377', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1121, 2, 'xfarida@example.com', '44978115', 'Yulia Zahra Utami S.H.', 'Yulia Zahra Utami S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Kalimantan No. 613, Langsa 42116, SumBar', '0646 6370 456', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1122, 2, 'ade.hasanah@example.com', '88732439', 'Puspa Yulianti M.Kom.', 'Puspa Yulianti M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Daan No. 405, Sawahlunto 20012, SumSel', '028 6619 8202', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1123, 2, 'vanesa.melani@example.com', '76847015', 'Belinda Usada', 'Belinda Usada', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Peta No. 174, Bandar Lampung 10139, Bengkulu', '027 5499 921', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1124, 2, 'hidayat.cakrawangsa@example.org', '51019621', 'Ihsan Sihombing', 'Ihsan Sihombing', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Diponegoro No. 242, Pematangsiantar 74090, Riau', '(+62) 980 3801 757', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1125, 2, 'tampubolon.ira@example.com', '59605154', 'Jaga Santoso', 'Jaga Santoso', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Flores No. 387, Padang 22872, NTT', '0344 6338 6779', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1126, 2, 'ghaliyati59@example.com', '17427714', 'Hartaka Umar Maheswara M.M.', 'Hartaka Umar Maheswara M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Krakatau No. 793, Jayapura 36058, Aceh', '(+62) 729 1343 599', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1127, 2, 'maya69@example.com', '49112052', 'Latika Zulaika M.M.', 'Latika Zulaika M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Pasir Koja No. 6, Bau-Bau 55998, Riau', '0228 6189 033', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1128, 2, 'fpurnawati@example.com', '88533105', 'Slamet Sihombing', 'Slamet Sihombing', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Babah No. 499, Dumai 86091, SumSel', '(+62) 24 2477 6780', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1129, 2, 'ophelia.prasasta@example.com', '90496046', 'Mitra Tarihoran', 'Mitra Tarihoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Yos No. 144, Jambi 72365, Papua', '022 3707 223', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1130, 2, 'mulya.nashiruddin@example.org', '8778464', 'Restu Nuraini', 'Restu Nuraini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Gotong Royong No. 902, Banda Aceh 67949, SumUt', '(+62) 360 0723 6079', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1131, 2, 'wage21@example.org', '65091967', 'Zulfa Fitria Nuraini S.Gz', 'Zulfa Fitria Nuraini S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Barasak No. 737, Magelang 86087, NTT', '0723 5206 862', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1132, 2, 'hyuliarti@example.com', '69097110', 'Rahmi Winarsih', 'Rahmi Winarsih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bah Jaya No. 685, Tarakan 67801, MalUt', '023 9517 839', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1133, 2, 'saefullah.rendy@example.com', '47080580', 'Kamila Irma Zulaika S.Pt', 'Kamila Irma Zulaika S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Tentara Pelajar No. 940, Padang 85776, MalUt', '0597 4815 1482', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1134, 2, 'tira48@example.org', '1937265', 'Qori Kuswandari', 'Qori Kuswandari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Babadan No. 889, Bau-Bau 79421, NTB', '0882 5144 931', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1135, 2, 'hariyah.marsito@example.org', '99338663', 'Tania Mayasari', 'Tania Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Abdul. Muis No. 454, Pagar Alam 43776, DIY', '(+62) 849 1860 570', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1136, 2, 'pfujiati@example.org', '11743713', 'Rachel Puspita', 'Rachel Puspita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Hang No. 229, Administrasi Jakarta Barat 21887, SumSel', '(+62) 288 7774 6606', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1137, 2, 'mulyani.atmaja@example.net', '98244528', 'Ina Karimah Puspasari', 'Ina Karimah Puspasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Juanda No. 709, Pematangsiantar 59013, KalTeng', '0434 1098 2473', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1138, 2, 'wlestari@example.org', '23885007', 'Cengkal Ibrahim Tarihoran S.H.', 'Cengkal Ibrahim Tarihoran S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Bambon No. 63, Langsa 61171, JaTim', '(+62) 326 4931 1205', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1139, 2, 'rahayu62@example.org', '60928591', 'Capa Sihotang', 'Capa Sihotang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Lada No. 806, Pariaman 48967, Lampung', '0898 621 481', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1140, 2, 'kawaca.riyanti@example.com', '86946504', 'Hasta Raden Sihotang S.Pt', 'Hasta Raden Sihotang S.Pt', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Laswi No. 466, Pagar Alam 72075, SulTeng', '(+62) 460 0917 0218', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1141, 2, 'vivi24@example.org', '59241462', 'Salsabila Zalindra Uyainah S.Sos', 'Salsabila Zalindra Uyainah S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Baranang Siang Indah No. 33, Tarakan 63732, Banten', '(+62) 792 9745 6913', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1142, 2, 'samsul44@example.org', '8555538', 'Padmi Violet Rahimah S.H.', 'Padmi Violet Rahimah S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bacang No. 546, Payakumbuh 27234, KepR', '0692 9872 767', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1143, 2, 'usada.najwa@example.com', '92110629', 'Bakianto Cayadi Megantara', 'Bakianto Cayadi Megantara', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Suryo Pranoto No. 702, Sorong 28386, DKI', '(+62) 547 6193 2334', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1144, 2, 'yulia25@example.net', '1016011', 'Leo Permadi S.Gz', 'Leo Permadi S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Dipatiukur No. 932, Ternate 66046, DIY', '(+62) 267 4932 993', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1145, 2, 'jayadi.nashiruddin@example.com', '62828096', 'Cornelia Gawati Oktaviani', 'Cornelia Gawati Oktaviani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Rajawali Barat No. 628, Semarang 58132, SulSel', '(+62) 481 6031 332', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1146, 2, 'ira.novitasari@example.net', '17377161', 'Jaya Bakiman Situmorang', 'Jaya Bakiman Situmorang', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Pelajar Pejuang 45 No. 501, Ternate 33872, SulTeng', '(+62) 482 6534 160', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1147, 2, 'siti.uwais@example.com', '75654989', 'Cemeti Hutasoit', 'Cemeti Hutasoit', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Nanas No. 181, Tanjung Pinang 99547, JaBar', '0882 5118 4541', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1148, 2, 'mutia.handayani@example.org', '1653926', 'Bancar Harjasa Wasita M.Ak', 'Bancar Harjasa Wasita M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Kusmanto No. 30, Surabaya 73920, Riau', '0582 7625 764', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1149, 2, 'mala48@example.org', '88488295', 'Aslijan Hidayat S.IP', 'Aslijan Hidayat S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Ketandan No. 110, Pariaman 33081, NTB', '0791 5249 9606', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1150, 2, 'jono05@example.net', '39249741', 'Raisa Putri Suartini S.I.Kom', 'Raisa Putri Suartini S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Wahidin No. 259, Padang 90331, Bengkulu', '(+62) 522 6621 5130', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1151, 2, 'ilsa.kusmawati@example.org', '33873576', 'Titin Jamalia Uyainah', 'Titin Jamalia Uyainah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Basuki Rahmat  No. 480, Serang 97343, Lampung', '0337 0736 999', NULL, 1, '2023-11-02 00:49:50', '2023-11-02 00:49:50'),
(1152, 2, 'saputra.padma@example.com', '62068623', 'Emin Prayoga', 'Emin Prayoga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Padang No. 93, Batam 31902, Lampung', '0327 0931 860', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1153, 2, 'karma73@example.net', '12162598', 'Pia Yolanda', 'Pia Yolanda', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Sumpah Pemuda No. 258, Yogyakarta 88702, SulTeng', '0685 8147 3923', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1154, 2, 'hakim.yunita@example.net', '49174254', 'Ilsa Usamah', 'Ilsa Usamah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Acordion No. 947, Palopo 67799, KalUt', '(+62) 577 8287 6735', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1155, 2, 'pardi64@example.net', '11048862', 'Harsaya Bahuwarna Hidayat', 'Harsaya Bahuwarna Hidayat', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Madrasah No. 113, Ternate 92261, PapBar', '027 0206 5134', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1156, 2, 'jnugroho@example.com', '9418558', 'Yance Lili Nasyiah', 'Yance Lili Nasyiah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Ronggowarsito No. 437, Batu 71592, Aceh', '(+62) 339 1773 2259', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1157, 2, 'usamah.natalia@example.org', '9588708', 'Zulaikha Permata', 'Zulaikha Permata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Basoka Raya No. 42, Bandung 40720, SulTra', '(+62) 974 4048 297', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1158, 2, 'daryani.zulaika@example.net', '22385569', 'Rahmat Hidayat M.Farm', 'Rahmat Hidayat M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Mulyadi No. 50, Prabumulih 34259, SulSel', '(+62) 511 7303 2846', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1159, 2, 'puti12@example.com', '25712940', 'Yosef Narpati', 'Yosef Narpati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Banda No. 802, Binjai 34220, Papua', '0250 1035 624', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1160, 2, 'putra.aisyah@example.org', '37751826', 'Salwa Hassanah', 'Salwa Hassanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. R.E. Martadinata No. 262, Padangsidempuan 83655, SumBar', '(+62) 446 9633 9093', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1161, 2, 'dabukke.ifa@example.com', '39634499', 'Unggul Widodo', 'Unggul Widodo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Gajah Mada No. 894, Tegal 54301, JaBar', '(+62) 23 2385 5037', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1162, 2, 'banara.siregar@example.com', '85658966', 'Kuncara Sitompul', 'Kuncara Sitompul', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Imam No. 702, Langsa 87885, SulTeng', '(+62) 448 6768 1932', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1163, 2, 'nasab.kusmawati@example.org', '9545457', 'Lili Mayasari', 'Lili Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Sutan Syahrir No. 366, Blitar 70142, BaBel', '0224 3414 9311', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1164, 2, 'tira09@example.com', '74646669', 'Endah Paulin Mandasari M.Kom.', 'Endah Paulin Mandasari M.Kom.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Pelajar Pejuang 45 No. 469, Ternate 81980, KalBar', '0813 1657 5576', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1165, 2, 'rahayu.novitasari@example.com', '97174997', 'Zulfa Usamah M.TI.', 'Zulfa Usamah M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Gardujati No. 575, Solok 73705, Aceh', '0440 1013 814', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1166, 2, 'pudjiastuti.okta@example.net', '51818957', 'Kemba Marpaung', 'Kemba Marpaung', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sunaryo No. 286, Batam 76969, SulBar', '(+62) 706 0769 0415', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1167, 2, 'astuti.najam@example.com', '17997243', 'Kawaca Mangunsong S.IP', 'Kawaca Mangunsong S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Banda No. 159, Bitung 60189, NTT', '021 1270 8905', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1168, 2, 'qnuraini@example.com', '82991077', 'Warta Hidayat', 'Warta Hidayat', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sutarjo No. 984, Pangkal Pinang 56664, JaTeng', '(+62) 858 776 125', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1169, 2, 'chelsea69@example.net', '6501422', 'Kenes Bahuraksa Permadi', 'Kenes Bahuraksa Permadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Tubagus Ismail No. 174, Administrasi Jakarta Pusat 48788, KalBar', '0471 0393 4449', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1170, 2, 'jasmani.permata@example.org', '25467375', 'Ellis Mayasari', 'Ellis Mayasari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Flores No. 815, Kendari 63089, Lampung', '0971 4596 2999', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1171, 2, 'rahayu.ciaobella@example.com', '65317214', 'Harjasa Prayoga', 'Harjasa Prayoga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Sugiono No. 838, Dumai 15485, Aceh', '0714 6357 145', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1172, 2, 'nugroho.ganda@example.com', '41092898', 'Irma Lidya Laksmiwati M.TI.', 'Irma Lidya Laksmiwati M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Barat No. 888, Palopo 48914, SulTra', '0972 7005 043', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1173, 2, 'puti.budiyanto@example.com', '47026642', 'Patricia Halimah', 'Patricia Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Reksoninten No. 409, Sabang 40331, SumSel', '(+62) 476 5970 0126', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1174, 2, 'gada.mulyani@example.net', '26186987', 'Erik Rajata', 'Erik Rajata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Bank Dagang Negara No. 235, Padang 52888, SulTra', '0328 8107 6844', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1175, 2, 'dartono.haryanto@example.org', '45110341', 'Raden Adikara Hutagalung', 'Raden Adikara Hutagalung', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Salak No. 527, Cilegon 20797, PapBar', '(+62) 703 1006 0898', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1176, 2, 'putu33@example.net', '1224588', 'Hasna Winarsih', 'Hasna Winarsih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Halim No. 627, Madiun 93176, KalTim', '(+62) 696 0091 6890', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1177, 2, 'melinda.widiastuti@example.net', '29013931', 'Lintang Ana Pudjiastuti M.TI.', 'Lintang Ana Pudjiastuti M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Umalas No. 934, Sawahlunto 24347, Maluku', '(+62) 622 0975 8373', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1178, 2, 'edi53@example.com', '92215717', 'Praba Sinaga', 'Praba Sinaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Kartini No. 783, Bogor 15381, JaBar', '(+62) 740 5841 000', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1179, 2, 'gina33@example.net', '48104528', 'Slamet Budiyanto S.IP', 'Slamet Budiyanto S.IP', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Jakarta No. 306, Langsa 83920, KalUt', '0278 1375 088', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1180, 2, 'manullang.kiandra@example.net', '15780403', 'Ellis Dian Puspita', 'Ellis Dian Puspita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Madrasah No. 518, Cirebon 40402, DKI', '0865 1686 568', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1181, 2, 'halimah.siti@example.com', '49199711', 'Asirwanda Pradipta', 'Asirwanda Pradipta', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Baya Kali Bungur No. 664, Bogor 28308, SumBar', '(+62) 837 7955 364', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1182, 2, 'iswahyudi.okto@example.net', '97121014', 'Keisha Astuti', 'Keisha Astuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Kusmanto No. 422, Sawahlunto 41645, KalTeng', '0660 2938 6712', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1183, 2, 'vino.suryono@example.com', '30084596', 'Eman Maryadi', 'Eman Maryadi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Barasak No. 781, Pangkal Pinang 53768, Banten', '(+62) 773 7290 024', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1184, 2, 'irfan29@example.com', '22713320', 'Lili Zelaya Riyanti S.Gz', 'Lili Zelaya Riyanti S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Tubagus Ismail No. 610, Sukabumi 81477, Aceh', '0895 114 859', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1185, 2, 'namaga.cahyadi@example.net', '90593331', 'Jane Indah Halimah M.Ak', 'Jane Indah Halimah M.Ak', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Jayawijaya No. 530, Padangsidempuan 96300, Jambi', '0642 6291 6753', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1186, 2, 'jprakasa@example.net', '68005894', 'Kayla Hariyah', 'Kayla Hariyah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Wahid No. 45, Sukabumi 28094, KalSel', '(+62) 432 6627 713', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1187, 2, 'silvia.saptono@example.com', '47726234', 'Gamblang Sinaga', 'Gamblang Sinaga', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Bahagia No. 580, Pekalongan 78692, Bengkulu', '(+62) 23 5600 144', NULL, 1, '2023-11-02 00:49:51', '2023-11-02 00:49:51'),
(1188, 2, 'shania.megantara@example.com', '87514023', 'Ghani Pratama', 'Ghani Pratama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bappenas No. 226, Padangpanjang 13581, BaBel', '0485 0734 9910', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1189, 2, 'wasita.laswi@example.org', '74353025', 'Oskar Prasetya', 'Oskar Prasetya', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Tambun No. 721, Sorong 78918, Maluku', '(+62) 879 3760 7773', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1190, 2, 'padmasari.salwa@example.net', '37874218', 'Hardi Leo Thamrin S.Kom', 'Hardi Leo Thamrin S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Pelajar Pejuang 45 No. 900, Mataram 45300, SumBar', '(+62) 948 4768 2553', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1191, 2, 'estiono75@example.com', '37174238', 'Ira Hasanah', 'Ira Hasanah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Yohanes No. 682, Padang 61262, Papua', '(+62) 209 0302 2331', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1192, 2, 'hartana.kuswandari@example.org', '3548902', 'Harsaya Prasetya', 'Harsaya Prasetya', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Batako No. 849, Samarinda 38732, KalTeng', '0826 7092 2727', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1193, 2, 'vicky.haryanto@example.net', '22750840', 'Gamblang Galiono Jailani', 'Gamblang Galiono Jailani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Industri No. 794, Parepare 15506, SumUt', '0974 2356 199', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1194, 2, 'njailani@example.com', '60151056', 'Jail Santoso', 'Jail Santoso', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bayan No. 948, Prabumulih 83054, SulTeng', '0765 3669 406', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1195, 2, 'hsitompul@example.org', '39075102', 'Prasetya Budiman', 'Prasetya Budiman', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Peta No. 645, Kendari 52730, PapBar', '0454 3186 1808', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1196, 2, 'paiman80@example.org', '54568163', 'Malika Almira Padmasari S.H.', 'Malika Almira Padmasari S.H.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Camar No. 823, Sawahlunto 74797, NTB', '0224 0232 4105', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1197, 2, 'mandasari.genta@example.org', '41142600', 'Ida Suartini M.Pd', 'Ida Suartini M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Basket No. 31, Tidore Kepulauan 76688, JaTeng', '0710 4943 8747', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1198, 2, 'natalia79@example.net', '69935379', 'Danang Adinata Wibisono S.Gz', 'Danang Adinata Wibisono S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Acordion No. 436, Sorong 33464, Banten', '(+62) 261 6598 5179', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1199, 2, 'luhung.hartati@example.net', '5707664', 'Jane Rahayu', 'Jane Rahayu', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Abdul. Muis No. 652, Sabang 73366, BaBel', '(+62) 505 9277 9412', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1200, 2, 'lintang14@example.com', '34442945', 'Warsa Ardianto', 'Warsa Ardianto', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Gajah Mada No. 210, Cirebon 42050, NTT', '0452 3586 0365', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1201, 2, 'nadine22@example.org', '42876098', 'Radika Irawan', 'Radika Irawan', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bappenas No. 51, Denpasar 44240, JaTeng', '(+62) 388 1392 973', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1202, 2, 'cengkal.thamrin@example.org', '17882732', 'Shakila Usamah M.TI.', 'Shakila Usamah M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Flores No. 418, Lubuklinggau 34247, KalUt', '(+62) 858 569 717', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1203, 2, 'yessi24@example.net', '47334842', 'Najib Maryadi Saputra S.Sos', 'Najib Maryadi Saputra S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Pasirkoja No. 223, Pekalongan 97905, SumBar', '0458 4270 0664', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1204, 2, 'simbolon.saadat@example.org', '32899066', 'Cici Susanti', 'Cici Susanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Reksoninten No. 125, Bengkulu 87571, KepR', '0472 9247 3816', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1205, 2, 'rachel.megantara@example.net', '48885806', 'Ajiman Paiman Mandala', 'Ajiman Paiman Mandala', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Basket No. 576, Serang 63875, Bali', '0711 7217 3407', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1206, 2, 'ilyas02@example.com', '9606214', 'Titin Devi Purwanti', 'Titin Devi Purwanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Padma No. 132, Administrasi Jakarta Timur 79513, SulBar', '0735 0598 049', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1207, 2, 'haryanti.humaira@example.com', '96109507', 'Hafshah Gawati Susanti S.Pd', 'Hafshah Gawati Susanti S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Suprapto No. 985, Pasuruan 65853, SumBar', '0333 5393 206', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1208, 2, 'kiandra56@example.net', '32724711', 'Kayla Permata S.T.', 'Kayla Permata S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Banda No. 180, Administrasi Jakarta Pusat 42313, KalTeng', '(+62) 586 9144 4301', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1209, 2, 'salsabila.sinaga@example.net', '15548307', 'Puti Farida S.Psi', 'Puti Farida S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Barasak No. 714, Sawahlunto 40976, Gorontalo', '0822 7714 410', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1210, 2, 'adriansyah.vanya@example.net', '20214101', 'Warta Jais Latupono', 'Warta Jais Latupono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Antapani Lama No. 779, Tebing Tinggi 11125, KalTim', '(+62) 421 1032 2006', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1211, 2, 'maheswara.vicky@example.com', '82449859', 'Garan Utama', 'Garan Utama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Ters. Kiaracondong No. 6, Surakarta 75266, DIY', '0897 9834 789', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1212, 2, 'hassanah.irfan@example.org', '73148063', 'Bajragin Asirwada Tarihoran', 'Bajragin Asirwada Tarihoran', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bass No. 673, Batam 90740, Banten', '0498 0378 295', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1213, 2, 'puti82@example.com', '90321604', 'Raihan Utama', 'Raihan Utama', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Padma No. 390, Pontianak 68138, DKI', '0557 2746 4236', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1214, 2, 'prabowo.vanya@example.com', '53275655', 'Utama Ardianto S.Kom', 'Utama Ardianto S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Abdul. Muis No. 78, Administrasi Jakarta Pusat 33899, SumBar', '(+62) 278 7280 0271', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1215, 2, 'kania48@example.net', '84635386', 'Vanya Laksita', 'Vanya Laksita', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Baranangsiang No. 300, Pagar Alam 32559, Riau', '(+62) 657 9027 925', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1216, 2, 'galuh04@example.com', '98131895', 'Cahya Mandala S.T.', 'Cahya Mandala S.T.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Asia Afrika No. 13, Lhokseumawe 72071, SulSel', '0981 1899 356', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1217, 2, 'sadina67@example.net', '40574228', 'Bagus Samosir', 'Bagus Samosir', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Yoga No. 997, Sabang 43537, SumSel', '0972 1917 8044', NULL, 1, '2023-11-02 00:49:52', '2023-11-02 00:49:52'),
(1218, 2, 'widodo.salsabila@example.org', '7147653', 'Hesti Prastuti', 'Hesti Prastuti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Orang No. 825, Manado 10920, SumSel', '0765 3553 1217', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1219, 2, 'cinthia03@example.net', '35809317', 'Adhiarja Laswi Jailani S.Farm', 'Adhiarja Laswi Jailani S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Haji No. 640, Tegal 72786, BaBel', '(+62) 769 8432 345', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1220, 2, 'omar.yuliarti@example.org', '47817966', 'Nalar Raihan Adriansyah M.Farm', 'Nalar Raihan Adriansyah M.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Sukajadi No. 115, Administrasi Jakarta Selatan 36847, SulTeng', '0537 5637 866', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1221, 2, 'jailani.nasrullah@example.net', '98687394', 'Zalindra Uyainah M.TI.', 'Zalindra Uyainah M.TI.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Veteran No. 646, Bitung 24769, SulTeng', '0679 5545 620', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1222, 2, 'sinaga.nasab@example.org', '74371276', 'Tira Ayu Safitri', 'Tira Ayu Safitri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Radio No. 713, Banda Aceh 73091, SumSel', '(+62) 302 6103 176', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1223, 2, 'setya.wijayanti@example.org', '19947620', 'Argono Saefullah', 'Argono Saefullah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Salatiga No. 370, Jambi 66246, KalTeng', '(+62) 291 3786 139', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1224, 2, 'siska94@example.net', '37821154', 'Karman Saputra', 'Karman Saputra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Sutarjo No. 10, Surakarta 86402, NTT', '(+62) 767 2491 7537', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1225, 2, 'raharja82@example.com', '32210689', 'Kezia Palastri', 'Kezia Palastri', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Ahmad Dahlan No. 93, Bogor 32974, NTT', '0800 834 668', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1226, 2, 'shakila66@example.org', '4532401', 'Baktiono Danang Suryono', 'Baktiono Danang Suryono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Kali No. 499, Bukittinggi 72967, SumSel', '0543 6847 923', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1227, 2, 'uardianto@example.net', '98886396', 'Maimunah Fitriani Sudiati S.Gz', 'Maimunah Fitriani Sudiati S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Raden Saleh No. 648, Solok 25666, NTB', '(+62) 369 9446 042', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1228, 2, 'mala17@example.org', '33687543', 'Umi Farida', 'Umi Farida', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Bambu No. 221, Metro 73309, JaTeng', '(+62) 981 1661 752', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1229, 2, 'zwijayanti@example.org', '22384205', 'Jabal Marpaung', 'Jabal Marpaung', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Nangka No. 578, Langsa 65098, Lampung', '(+62) 398 6624 404', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1230, 2, 'rajasa.asman@example.org', '82155247', 'Prabowo Tirtayasa Santoso M.Pd', 'Prabowo Tirtayasa Santoso M.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Salak No. 570, Cimahi 55610, PapBar', '0793 6922 6448', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53');
INSERT INTO `students` (`id`, `class_id`, `email`, `identity_number`, `full_name`, `username`, `password`, `gender`, `address`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(1231, 2, 'halima.hutapea@example.com', '7992098', 'Wira Widodo', 'Wira Widodo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Dewi Sartika No. 656, Administrasi Jakarta Barat 51018, KalUt', '(+62) 480 9381 424', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1232, 2, 'zkusmawati@example.net', '40330394', 'Maya Dewi Handayani', 'Maya Dewi Handayani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Ki Hajar Dewantara No. 706, Subulussalam 99417, Lampung', '(+62) 894 8325 986', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1233, 2, 'habibi.caket@example.org', '67390672', 'Raharja Najmudin', 'Raharja Najmudin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Camar No. 684, Payakumbuh 30524, Aceh', '022 1717 873', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1234, 2, 'thutasoit@example.com', '11481966', 'Shakila Wulandari', 'Shakila Wulandari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Samanhudi No. 961, Cirebon 11395, KalTim', '(+62) 925 7674 466', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1235, 2, 'hidayat.mustofa@example.com', '33248896', 'Praba Halim', 'Praba Halim', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Padang No. 516, Bau-Bau 21042, SulTra', '(+62) 541 8529 8980', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1236, 2, 'rhastuti@example.net', '99070825', 'Sakura Kiandra Padmasari S.Psi', 'Sakura Kiandra Padmasari S.Psi', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Cikapayang No. 195, Administrasi Jakarta Barat 75621, Riau', '0383 1780 440', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1237, 2, 'xfirgantoro@example.org', '64949757', 'Rahayu Icha Winarsih', 'Rahayu Icha Winarsih', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Gg. Setiabudhi No. 306, Bima 87805, KalTeng', '(+62) 714 0514 940', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1238, 2, 'reksa.andriani@example.org', '41104029', 'Anita Palastri M.M.', 'Anita Palastri M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. S. Parman No. 724, Administrasi Jakarta Selatan 43562, KalSel', '(+62) 435 2839 442', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1239, 2, 'lazuardi.intan@example.com', '88852523', 'Marsito Hutapea S.Pd', 'Marsito Hutapea S.Pd', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Bakti No. 147, Tomohon 14142, SumSel', '(+62) 344 9942 9507', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1240, 2, 'lukita11@example.net', '8863495', 'Marwata Prabowo S.Gz', 'Marwata Prabowo S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Dr. Junjunan No. 426, Singkawang 20446, SulTeng', '0827 877 906', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1241, 2, 'jamal32@example.net', '6267962', 'Najwa Hasna Yuliarti M.M.', 'Najwa Hasna Yuliarti M.M.', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Mulyadi No. 195, Gunungsitoli 63622, JaTeng', '0864 9831 663', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1242, 2, 'paramita11@example.org', '10119792', 'Zaenab Utami', 'Zaenab Utami', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Baranang Siang No. 969, Blitar 17730, SulBar', '029 6058 135', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1243, 2, 'kani80@example.net', '43914204', 'Gawati Suartini', 'Gawati Suartini', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sukabumi No. 31, Metro 63739, Bali', '0246 7902 495', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1244, 2, 'wijaya.lidya@example.org', '78454046', 'Jaiman Sitorus', 'Jaiman Sitorus', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Kalimantan No. 927, Denpasar 35564, Banten', '0812 2619 092', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1245, 2, 'nfujiati@example.org', '80675055', 'Yuni Fujiati', 'Yuni Fujiati', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Ciumbuleuit No. 420, Salatiga 18628, BaBel', '(+62) 265 7489 008', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1246, 2, 'maria.utama@example.org', '31723839', 'Gatra Saefullah', 'Gatra Saefullah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Sam Ratulangi No. 129, Banjarmasin 11529, Lampung', '(+62) 296 1155 1701', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1247, 2, 'jdabukke@example.net', '79424682', 'Nova Nasyidah', 'Nova Nasyidah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Basuki Rahmat  No. 422, Solok 87078, SumUt', '(+62) 924 0962 4914', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1248, 2, 'maryati.silvia@example.com', '94831994', 'Najwa Halimah', 'Najwa Halimah', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sukabumi No. 305, Tanjungbalai 32944, SumUt', '(+62) 579 3326 1073', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1249, 2, 'susanti.kania@example.com', '59012280', 'Warji Siregar S.E.I', 'Warji Siregar S.E.I', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Moch. Ramdan No. 474, Manado 68543, Bali', '(+62) 936 3425 2559', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1250, 2, 'thamrin.maya@example.org', '58729321', 'Cornelia Permata', 'Cornelia Permata', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bakau No. 314, Ambon 10306, Lampung', '(+62) 884 2986 2782', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1251, 2, 'anashiruddin@example.com', '41019853', 'Jati Suryono', 'Jati Suryono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Radio No. 45, Manado 11663, Jambi', '(+62) 269 6359 1229', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1252, 2, 'hnuraini@example.com', '10558334', 'Jayeng Cemplunk Waluyo', 'Jayeng Cemplunk Waluyo', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Kyai Mojo No. 951, Tarakan 84922, DIY', '(+62) 543 0336 200', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1253, 2, 'khartati@example.org', '81065292', 'Cinta Wulandari', 'Cinta Wulandari', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Bak Mandi No. 157, Palembang 34463, SulTeng', '(+62) 617 4963 066', NULL, 1, '2023-11-02 00:49:53', '2023-11-02 00:49:53'),
(1254, 2, 'nardianto@example.org', '47629019', 'Cinthia Cinta Mulyani', 'Cinthia Cinta Mulyani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Gajah No. 919, Bau-Bau 39607, Riau', '(+62) 413 2552 7378', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1255, 2, 'irsad.tarihoran@example.com', '53163464', 'Vino Wibisono', 'Vino Wibisono', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ki. Sutarjo No. 52, Administrasi Jakarta Selatan 99873, NTB', '026 3363 6097', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1256, 2, 'suci79@example.com', '48015068', 'Bagas Artawan Jailani', 'Bagas Artawan Jailani', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Bara No. 610, Medan 50929, Jambi', '0934 8639 0425', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1257, 2, 'qjanuar@example.net', '7012044', 'Tugiman Saka Nashiruddin', 'Tugiman Saka Nashiruddin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jr. Sugiyopranoto No. 318, Magelang 54463, PapBar', '(+62) 986 2171 188', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1258, 2, 'uyainah.kardi@example.org', '63894870', 'Rahayu Permata S.Sos', 'Rahayu Permata S.Sos', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Psr. Siliwangi No. 816, Kendari 73713, JaTeng', '0225 8863 858', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1259, 2, 'lwastuti@example.net', '8809738', 'Jasmin Suartini S.I.Kom', 'Jasmin Suartini S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Kpg. Yap Tjwan Bing No. 71, Bima 92924, SulTra', '0255 4957 553', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1260, 2, 'sandriani@example.org', '55911203', 'Kemal Galuh Najmudin S.I.Kom', 'Kemal Galuh Najmudin S.I.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Babah No. 372, Padangpanjang 85362, JaTeng', '(+62) 452 6748 441', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1261, 2, 'zelaya70@example.com', '71410652', 'Karen Susanti', 'Karen Susanti', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Fajar No. 544, Batu 32611, SumBar', '(+62) 594 5949 6195', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1262, 2, 'keisha98@example.com', '19257646', 'Mila Sudiati S.Kom', 'Mila Sudiati S.Kom', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Jln. Bambon No. 323, Sawahlunto 13769, BaBel', '(+62) 236 4142 2017', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1263, 2, 'zamira.purwanti@example.com', '38383459', 'Aisyah Violet Hasanah S.Gz', 'Aisyah Violet Hasanah S.Gz', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Dk. Peta No. 688, Lhokseumawe 17746, SumUt', '(+62) 218 0799 8066', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1264, 2, 'faizah.halim@example.net', '31082934', 'Laras Rina Maryati S.Farm', 'Laras Rina Maryati S.Farm', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Antapani Lama No. 100, Malang 94860, Bali', '0285 0858 0444', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54'),
(1265, 2, 'dina.sirait@example.net', '19244924', 'Gaiman Putra', 'Gaiman Putra', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'l', 'Ds. Batako No. 692, Parepare 90726, SumBar', '(+62) 404 5134 7774', NULL, 1, '2023-11-02 00:49:54', '2023-11-02 00:49:54');

-- --------------------------------------------------------

--
-- Table structure for table `student_parents`
--

CREATE TABLE `student_parents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tatib_bab`
--

CREATE TABLE `tatib_bab` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomor_bab` varchar(255) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tatib_bab`
--

INSERT INTO `tatib_bab` (`id`, `nomor_bab`, `judul`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '1', 'KETENTUAN UMUM', '2023-11-15 07:39:33', '2023-11-15 07:39:33', NULL),
(2, '2', 'DASAR DAN TUJUAN', '2023-11-15 07:39:44', '2023-11-15 07:39:44', NULL),
(3, '3', 'HAK SISWA', '2023-11-15 07:39:54', '2023-11-15 07:39:54', NULL),
(4, '4', 'BERANGKAT & PULANG SEKOLAH, KEHADIRAN DAN PERIJINAN', '2023-11-15 07:40:09', '2023-11-15 07:40:09', NULL),
(5, '5', 'KEWAJIBAN SISWA', '2023-11-15 07:40:19', '2023-11-15 07:40:19', NULL),
(6, '6', 'INFORMASI DAN ADMISTRASI', '2023-11-15 07:40:28', '2023-11-15 07:40:28', NULL),
(7, '7', 'SERAGAM SEKOLAH', '2023-11-15 07:40:42', '2023-11-15 07:40:42', NULL),
(8, '8', 'KEGIATAN BELAJAR MENGAJAR', '2023-11-15 07:41:00', '2023-11-15 07:41:00', NULL),
(9, '9', 'PULANG SEKOLAH', '2023-11-15 07:41:10', '2023-11-15 07:41:10', NULL),
(10, '10', 'BERIBADAH', '2023-11-15 07:41:29', '2023-11-15 07:41:29', NULL),
(11, '11', 'UPACARA BENDERA DAN OLAHRAGA', '2023-11-15 07:41:45', '2023-11-15 07:41:45', NULL),
(12, '12', 'ORGANISASI PESERTA DIDIK', '2023-11-15 07:41:53', '2023-11-15 07:41:53', NULL),
(13, '14', 'PENAMPILAN PERSONAL', '2023-11-15 07:42:40', '2023-11-15 07:42:40', NULL),
(14, '15', 'ETIKA DAN TATA KRAMA', '2023-11-15 07:42:53', '2023-11-15 07:42:53', NULL),
(15, '16', 'KEBERSIHAN KEINDAHAN KETERTIBAN DAN KEAMANAN', '2023-11-15 07:43:04', '2023-11-15 07:43:04', NULL),
(16, '17', 'PENGHARGAAN DAN REWARD', '2023-11-15 07:43:28', '2023-11-15 07:43:28', NULL),
(17, '17', 'KENAIKAN KELAS DAN KELULUSAN', '2023-11-15 07:43:50', '2023-11-15 07:43:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tatib_pasal`
--

CREATE TABLE `tatib_pasal` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bab_id` bigint(20) NOT NULL,
  `nomor_pasal` varchar(255) NOT NULL,
  `judul_pasal` varchar(255) NOT NULL,
  `isi_pasal` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tatib_pasal`
--

INSERT INTO `tatib_pasal` (`id`, `bab_id`, `nomor_pasal`, `judul_pasal`, `isi_pasal`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 2, '1', 'aa', 'ccc', NULL, NULL, NULL),
(2, 2, '2', 'bb', 'ddd', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `identity_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `full_name`, `identity_number`, `email`, `username`, `password`, `phone_number`, `remember_token`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'guru', '423423', 'guru@guru.com', 'guru', '$2y$10$ylghpwdyK.Ak6NNx66gRYejzRMscT3fULlpLP0hlHPJ.UHiqrtK.m', '089775444', NULL, 1, NULL, NULL);

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
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `violation_categories`
--

CREATE TABLE `violation_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `jenis_pelanggaran` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `point` bigint(20) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `violation_categories`
--

INSERT INTO `violation_categories` (`id`, `jenis_pelanggaran`, `name`, `point`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'pelanggaran ringan', 'Terlambat', 10, NULL, NULL, NULL),
(2, 'pelanggaran ringan', 'Seragam tidak sesuai hari', 10, NULL, NULL, NULL),
(3, 'pelanggaran ringan', 'Memakai seragam /atribut sekolah yang coret coret', 10, NULL, NULL, NULL),
(4, 'pelanggaran ringan', 'Memakai yang tidak sesuai ketentuan sekolah', 10, NULL, NULL, NULL),
(5, 'pelanggaran ringan', 'Berpakaian tidak rapi', 10, NULL, NULL, NULL),
(6, 'pelanggaran ringan', 'Tidak Pakai Sepatu Hitam', 10, NULL, NULL, NULL),
(7, 'pelanggaran ringan', 'Memakai sandal', 10, NULL, NULL, NULL),
(8, 'pelanggaran ringan', 'Tidak menyelesaikan tugas', 10, NULL, NULL, NULL),
(9, 'pelanggaran ringan', 'Main Hp saat KBM', 10, NULL, NULL, NULL),
(10, 'pelanggaran ringan', 'Kekantin jam KBM', 10, NULL, NULL, NULL),
(11, 'pelanggaran ringan', 'Tidak ikut Upacara/Senam', 10, NULL, NULL, NULL),
(12, 'pelanggaran ringan', 'Bikin Gaduh /Ribut', 10, NULL, NULL, NULL),
(13, 'pelanggaran ringan', 'Berkuku Panjang', 10, NULL, NULL, NULL),
(14, 'pelanggaran ringan', 'Rambut Gondrong', 10, NULL, NULL, NULL),
(15, 'pelanggaran ringan', 'Makeup berlebihan', 10, NULL, NULL, NULL),
(16, 'pelanggaran ringan', 'Berkata kasar/kotor', 10, NULL, NULL, NULL),
(17, 'pelanggaran ringan', 'Buang sampah sembarangan', 10, NULL, NULL, NULL),
(18, 'pelanggaran sedang', 'Tidak melaksanakan Sholat', 25, NULL, NULL, NULL),
(19, 'pelanggaran sedang', 'Membawa dan menghisap Merokok', 25, NULL, NULL, NULL),
(20, 'pelanggaran sedang', 'Berbohong', 25, NULL, NULL, NULL),
(21, 'pelanggaran sedang', 'Rambut di cat', 25, NULL, NULL, NULL),
(22, 'pelanggaran sedang', 'Memalsukan tanda tangan', 25, NULL, NULL, NULL),
(23, 'pelanggaran sedang', 'Nongkrong tempat Umum dengan seragam sekolah', 25, NULL, NULL, NULL),
(24, 'pelanggaran sedang', 'Menyimpan/Menonton Video Porno', 25, NULL, NULL, NULL),
(25, 'pelanggaran sedang', 'Mencoret fasilitas sekolah', 25, NULL, NULL, NULL),
(26, 'pelanggaran sedang', 'Bolos jam KBM', 25, NULL, NULL, NULL),
(27, 'pelanggaran sedang', 'Tidak menyelesaikan KBM', 25, NULL, NULL, NULL),
(28, 'pelanggaran sedang', 'Tidak mengikuti (PTS,PAS.PAT dan Ujian lainnya)', 25, NULL, NULL, NULL),
(29, 'pelanggaran sedang', 'Alfa dua kali berturut-turut', 25, NULL, NULL, NULL),
(30, 'pelanggaran sedang', 'Tidak menyampaikan Informasi dari sekolah ke orang tua', 25, NULL, NULL, NULL),
(31, 'pelanggaran sedang', 'Bertindik', 25, NULL, NULL, NULL),
(32, 'pelanggaran berat', 'Bertato', 100, NULL, NULL, NULL),
(33, 'pelanggaran berat', 'Merusak sarana dan prasarana sekolah', 100, NULL, NULL, NULL),
(34, 'pelanggaran berat', 'Mengambil barang milik orang lain', 100, NULL, NULL, NULL),
(35, 'pelanggaran berat', 'Membawa/mengedarkan,mengkonsumsi,( minuman keras,obat-obatan terlarang dan atau sejenisnya dalam bentuk apapun ) baik dalam lingkungan sekolah maupun diluar lingkungan sekolah', 100, NULL, NULL, NULL),
(36, 'pelanggaran berat', 'Melakukan tindak kekerasan dan atau berkelahi sesama teman baik dalam kelas,antar kelas baik dalam lingkungan Sekolah maupun di luar Sekolah (Tawuran)', 100, NULL, NULL, NULL),
(37, 'pelanggaran berat', 'Melecehkan,mengancam dan atau lainya kepada guru,karyawan sekolah,dan sesama siswa', 100, NULL, NULL, NULL),
(38, 'pelanggaran berat', 'Memiliki,mengedarkan menonton(vidio porno)dan sejenisnya', 100, NULL, NULL, NULL),
(39, 'pelanggaran berat', 'Membawa menyimpan senjata tajam / api', 100, NULL, NULL, NULL),
(40, 'pelanggaran berat', 'Melakukan pelanggaran hukum dan atau yang berhubungan dengan hukum (ke-Polisian)', 100, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `violation_lists`
--

CREATE TABLE `violation_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `violation_category_id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `report_by` enum('student','teacher','admin') NOT NULL,
  `teacher_id` bigint(20) DEFAULT NULL,
  `admin_id` bigint(20) DEFAULT NULL,
  `report_at` timestamp NULL DEFAULT NULL,
  `note` longtext NOT NULL,
  `photo_proof` mediumtext DEFAULT NULL,
  `status` enum('pending','confirm','reject') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `clas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `violation_lists`
--

INSERT INTO `violation_lists` (`id`, `violation_category_id`, `student_id`, `class_id`, `student_parent_id`, `report_by`, `teacher_id`, `admin_id`, `report_at`, `note`, `photo_proof`, `status`, `created_at`, `updated_at`, `clas`) VALUES
(3, 11, 22, NULL, NULL, 'admin', NULL, 1, NULL, 'aaaaa', NULL, 'confirm', '2023-11-09 10:04:10', '2023-11-09 10:04:10', '10 RPL 1'),
(4, 2, 15, NULL, NULL, 'teacher', 1, NULL, NULL, 'dasa', NULL, 'confirm', '2023-11-09 10:07:36', '2023-11-09 10:07:36', '10 RPL 1'),
(5, 2, 8, NULL, NULL, 'admin', NULL, 1, NULL, 'aaadasda', NULL, 'confirm', '2023-11-09 10:19:01', '2023-11-09 10:19:01', '10 RPL 1'),
(6, 3, 9, NULL, NULL, 'teacher', 1, NULL, NULL, 'adsadsad', NULL, 'confirm', '2023-11-09 10:19:21', '2023-11-09 10:19:21', '10 RPL 1'),
(8, 10, 34, NULL, NULL, 'teacher', 1, NULL, NULL, 'dddd', NULL, 'confirm', '2023-11-10 06:17:45', '2023-11-10 06:17:45', '10 RPL 2'),
(9, 10, 37, NULL, NULL, 'teacher', 1, NULL, NULL, 'wwww', NULL, 'confirm', '2023-11-10 06:17:52', '2023-11-10 06:17:52', '10 RPL 2');

-- --------------------------------------------------------

--
-- Table structure for table `website_configs`
--

CREATE TABLE `website_configs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_username_unique` (`username`);

--
-- Indexes for table `class_lists`
--
ALTER TABLE `class_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD UNIQUE KEY `students_identity_number_unique` (`identity_number`),
  ADD UNIQUE KEY `students_username_unique` (`username`);

--
-- Indexes for table `student_parents`
--
ALTER TABLE `student_parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tatib_bab`
--
ALTER TABLE `tatib_bab`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tatib_pasal`
--
ALTER TABLE `tatib_pasal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_email_unique` (`email`),
  ADD UNIQUE KEY `teachers_username_unique` (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `violation_categories`
--
ALTER TABLE `violation_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `violation_lists`
--
ALTER TABLE `violation_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `website_configs`
--
ALTER TABLE `website_configs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `class_lists`
--
ALTER TABLE `class_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1266;

--
-- AUTO_INCREMENT for table `student_parents`
--
ALTER TABLE `student_parents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tatib_bab`
--
ALTER TABLE `tatib_bab`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tatib_pasal`
--
ALTER TABLE `tatib_pasal`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `violation_categories`
--
ALTER TABLE `violation_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `violation_lists`
--
ALTER TABLE `violation_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `website_configs`
--
ALTER TABLE `website_configs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
