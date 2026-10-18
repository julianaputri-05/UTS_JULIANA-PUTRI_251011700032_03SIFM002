-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 17, 2026 at 03:38 PM
-- Server version: 8.4.3
-- PHP Version: 8.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_uts_251011700032`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instruments`
--

CREATE TABLE `instruments` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(12,2) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instruments`
--

INSERT INTO `instruments` (`id`, `name`, `brand`, `price`, `description`, `image`, `type`, `created_at`, `updated_at`) VALUES
(1, 'F310', 'Yamaha', 1950000.00, 'Gitar akustik bergaya dreadnought dengan suara seimbang dan neck yang nyaman. Pilihan yang pas untuk mulai belajar atau menemani sesi akustik.', 'yamaha-f310.svg', 'Gitar Akustik', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(2, 'Stratocaster Player II', 'Fender', 13900000.00, 'Gitar elektrik dengan tiga pickup single-coil dan karakter nada yang jernih, fleksibel untuk blues, funk, pop, hingga reggae.', 'fender-stratocaster.svg', 'Gitar Elektrik', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(3, 'GSR200', 'Ibanez', 3950000.00, 'Bass elektrik empat senar dengan neck ramping dan pickup aktif, memberikan kontrol nada yang mudah untuk pemain pemula maupun berpengalaman.', 'ibanez-gsr200.svg', 'Gitar Bass', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(4, 'P-125a', 'Yamaha', 10900000.00, 'Piano digital 88 tuts dengan aksi berbobot dan respons suara yang ekspresif. Desain ringkasnya cocok untuk latihan di rumah maupun panggung kecil.', 'yamaha-p125.svg', 'Piano Digital', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(5, 'E-X10', 'Roland', 3750000.00, 'Keyboard portabel dengan pilihan suara beragam, iringan otomatis, dan fitur latihan praktis untuk membantu membangun kebiasaan bermusik.', 'roland-ex10.svg', 'Keyboard', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(6, 'Nitro Mesh Kit', 'Alesis', 8990000.00, 'Set drum elektronik dengan pad mesh yang responsif, pedal bass, dan suara drum siap dimainkan tanpa mengganggu sekitar.', 'alesis-nitro-mesh.svg', 'Drum Elektronik', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(7, 'Stage Custom Birch', 'Yamaha', 17900000.00, 'Drum akustik berbahan birch dengan proyeksi suara kuat dan artikulasi jelas, sesuai untuk kebutuhan latihan band dan panggung.', 'yamaha-stage-custom.svg', 'Drum Akustik', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(8, 'Concert', 'Mahalo', 990000.00, 'Ukulele concert dengan badan kayu ringan dan suara hangat. Ukurannya nyaman untuk latihan akor, bernyanyi bersama, dan dibawa bepergian.', 'mahalo-concert.svg', 'Ukulele', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(9, 'V5 Student Violin', 'Yamaha', 4950000.00, 'Biola ukuran penuh yang dibuat dengan konstruksi rapi untuk pelajar. Paketnya siap mendukung latihan teknik dasar dengan tone yang lembut.', 'yamaha-v5.svg', 'Biola', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(10, 'YAS-280', 'Yamaha', 14900000.00, 'Saxophone alto untuk pelajar dengan intonasi stabil dan tata letak key yang nyaman, membantu pemain fokus mengembangkan embouchure dan musikalitas.', 'yamaha-yas280.svg', 'Saxophone', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(11, 'TR200 Bb', 'Bach', 8900000.00, 'Trumpet nada Bb dengan respons ringan dan proyeksi suara seimbang, cocok untuk pemain yang mulai serius mengembangkan teknik tiup.', 'bach-tr200.svg', 'Trumpet', '2026-10-17 13:03:19', '2026-10-17 13:03:19'),
(12, 'Headliner Cajon', 'Meinl', 1850000.00, 'Cajon ringkas dengan karakter bass yang dalam dan slap yang tajam. Satu instrumen praktis untuk mengisi ritme pada pertunjukan akustik.', 'meinl-cajon.svg', 'Perkusi', '2026-10-17 13:03:19', '2026-10-17 13:03:19');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_10_17_130020_create_instruments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('3l8FwA66B4okzV52Kyv88Hdfrexg91R6yr7OaJaJ', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Microsoft Windows 10.0.26200; en-ID) PowerShell/7.6.5', 'eyJfdG9rZW4iOiJ2YnczQXJxTmw3Yk85RmtmS2U5YXQwRnhrSTZSVVkwU3ZTeldDUnpjIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9pbnN0cnVtZW50cz9xPXlhbWFoYSIsInJvdXRlIjoiaW5zdHJ1bWVudHMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1792242475),
('8tiDSlnzcY7lrG8n0DgfTWPMijOdrN24C24bgwrw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36', 'eyJfdG9rZW4iOiJ5ejczS0JLQ0piMXRWeURqSmMzWUpVc3ZMR3kxcDZYU0MxTkNXbTJ6IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9pbnN0cnVtZW50c1wvOSIsInJvdXRlIjoiaW5zdHJ1bWVudHMuc2hvdyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1792242571),
('CjBv2snmCfy0zbrF35NNqvunOkf2bTnHzinepzVx', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Microsoft Windows 10.0.26200; en-ID) PowerShell/7.6.5', 'eyJfdG9rZW4iOiI2ZnNXZlhnbHRORTZpaVZnc2w1U05abVRDSzExNjZZV3liTHNadEpBIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9pbnN0cnVtZW50cyIsInJvdXRlIjoiaW5zdHJ1bWVudHMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1792242475),
('SV0CAT5MOrGGmyceHgOE1dL60cdyR58WMmy3dInV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Microsoft Windows 10.0.26200; en-ID) PowerShell/7.6.5', 'eyJfdG9rZW4iOiJZSlplSHpYUnliVFRBUnZMejZuVHJ1cVNsVG5lRkdJM0EycjJ1U3d0IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9pbnN0cnVtZW50cz90eXBlPUtleWJvYXJkIiwicm91dGUiOiJpbnN0cnVtZW50cy5pbmRleCJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1792242476),
('wtKeknHJAfKPyExoaOHmEMRrGKlu0JrAbNslumGO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Microsoft Windows 10.0.26200; en-ID) PowerShell/7.6.5', 'eyJfdG9rZW4iOiIzazhDSmdWY2ZySTN5Mzl6UGw3d3ZqRXJBTDg5dHg1Sm9qWVdwUFM4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9pbnN0cnVtZW50c1wvMSIsInJvdXRlIjoiaW5zdHJ1bWVudHMuc2hvdyJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19', 1792242476),
('YIvyfOINF9jwzwDTveRquglpA1FJlQLDbTGoeGSV', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Microsoft Windows 10.0.26200; en-ID) PowerShell/7.6.5', 'eyJfdG9rZW4iOiJ5bVFQdnozellWTndmeEVoYWFwTkZqQzlJeEFNdTh6bkQxcFBNcEpuIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hYm91dCIsInJvdXRlIjoiYWJvdXQifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==', 1792242477);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

--
-- Indexes for table `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `instruments_type_index` (`type`);

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
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
