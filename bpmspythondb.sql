-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2024 at 11:44 AM
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
-- Database: `bpmspythondb`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_category`
--

CREATE TABLE `app_category` (
  `id` bigint(20) NOT NULL,
  `categoryname` varchar(200) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_category`
--

INSERT INTO `app_category` (`id`, `categoryname`, `created_at`, `updated_at`) VALUES
(1, 'Delux Bus', '2024-02-05 05:07:39.151822', '2024-02-05 05:07:39.151822'),
(2, 'AC Bus', '2024-02-05 05:07:47.920653', '2024-02-05 05:07:47.920653'),
(3, 'Non AC Bus', '2024-02-05 05:07:59.240819', '2024-02-05 05:07:59.240819'),
(4, 'Volvo Buses', '2024-02-05 05:08:26.487218', '2024-02-25 03:48:22.060363');

-- --------------------------------------------------------

--
-- Table structure for table `app_customuser`
--

CREATE TABLE `app_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `profile_pic` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_customuser`
--

INSERT INTO `app_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `profile_pic`) VALUES
(1, 'pbkdf2_sha256$390000$BhfNk7YSJzx57DCjgZm2wC$+4eTLIf+ghUHUyDrEFd7ACoD8sKQE2K/7MPv53y98Lo=', '2024-02-25 04:03:15.123021', 1, 'admin', 'Admin', 'User', 'admin@gmail.com', 1, 1, '2024-02-05 05:00:22.626894', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_customuser_groups`
--

CREATE TABLE `app_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_customuser_user_permissions`
--

CREATE TABLE `app_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `app_page`
--

CREATE TABLE `app_page` (
  `id` bigint(20) NOT NULL,
  `pagetitle` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `aboutus` longtext NOT NULL,
  `email` varchar(200) NOT NULL,
  `mobilenumber` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_page`
--

INSERT INTO `app_page` (`id`, `pagetitle`, `address`, `aboutus`, `email`, `mobilenumber`, `created_at`, `updated_at`) VALUES
(1, 'aboutus', 'J-908, Ajanta Building, Gurugram', ' Bus Pass Management System project is helpful to bus administration by reducing the paperwork, time consumption and makes the process of getting bus passes as simple and fast', 'abc@gmail.com', 1234567890, '0000-00-00 00:00:00.000000', '2024-02-25 04:01:44.993137');

-- --------------------------------------------------------

--
-- Table structure for table `app_passes`
--

CREATE TABLE `app_passes` (
  `id` bigint(20) NOT NULL,
  `fullname` varchar(250) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `profile_pic1` varchar(100) NOT NULL,
  `mobilenumber` bigint(12) NOT NULL,
  `email` varchar(200) NOT NULL,
  `identitytype` varchar(200) NOT NULL,
  `identitycardnumber` varchar(250) NOT NULL,
  `source` varchar(250) NOT NULL,
  `destinations` varchar(250) NOT NULL,
  `fromdate` varchar(250) NOT NULL,
  `todate` varchar(250) NOT NULL,
  `cost` int(11) NOT NULL,
  `passcreated_at` datetime(6) NOT NULL,
  `category_id_id` bigint(20) NOT NULL,
  `passnumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `app_passes`
--

INSERT INTO `app_passes` (`id`, `fullname`, `gender`, `profile_pic1`, `mobilenumber`, `email`, `identitytype`, `identitycardnumber`, `source`, `destinations`, `fromdate`, `todate`, `cost`, `passcreated_at`, `category_id_id`, `passnumber`) VALUES
(5, 'Neeru', 'Female', 'media/avatar-4.jpg', 2147483647, 'neeru@gmail.com', 'Voter Card', 'yu55656767', 'Hari Nagar', 'vdh pvt ltd', '2024-02-05', '2024-03-05', 250, '2024-02-05 05:36:10.556951', 3, 467828489),
(6, 'Seema', 'Female', 'media/avatar-2.jpg', 2147483647, 'seeam@gmail.com', 'Student Card', '465456kjhkjh', 'Gauri kunj', 'vdh pvt ltd', '2024-02-05', '2024-04-05', 500, '2024-02-05 05:49:34.119681', 4, 523276197),
(7, 'Rakesh Mishra', 'Male', 'media/faq_man.png', 2147483647, 'rakesh@gmail.com', 'Voter Card', 'hjkhjk7998789', 'vanupuram', 'Vasant Vihar', '2024-02-06', '2024-07-18', 1000, '2024-02-05 05:50:30.929409', 1, 773376836),
(8, 'Anuj kumar', 'Male', 'media/travel-agent.png', 1233321233, 'ak@gmail.com', 'PAN Card', 'HGHG67VBV', 'Ghaziabad', 'New Delhi', '2024-03-01', '2024-07-31', 45632, '2024-02-25 04:00:50.834371', 1, 724155648);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add passes', 8, 'add_passes'),
(30, 'Can change passes', 8, 'change_passes'),
(31, 'Can delete passes', 8, 'delete_passes'),
(32, 'Can view passes', 8, 'view_passes'),
(33, 'Can add page', 9, 'add_page'),
(34, 'Can change page', 9, 'change_page'),
(35, 'Can delete page', 9, 'delete_page'),
(36, 'Can view page', 9, 'view_page');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'app', 'category'),
(6, 'app', 'customuser'),
(9, 'app', 'page'),
(8, 'app', 'passes'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-02-05 04:58:28.292464'),
(2, 'contenttypes', '0002_remove_content_type_name', '2024-02-05 04:58:28.363774'),
(3, 'auth', '0001_initial', '2024-02-05 04:58:28.609041'),
(4, 'auth', '0002_alter_permission_name_max_length', '2024-02-05 04:58:28.671468'),
(5, 'auth', '0003_alter_user_email_max_length', '2024-02-05 04:58:28.681478'),
(6, 'auth', '0004_alter_user_username_opts', '2024-02-05 04:58:28.690419'),
(7, 'auth', '0005_alter_user_last_login_null', '2024-02-05 04:58:28.699429'),
(8, 'auth', '0006_require_contenttypes_0002', '2024-02-05 04:58:28.705376'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2024-02-05 04:58:28.714352'),
(10, 'auth', '0008_alter_user_username_max_length', '2024-02-05 04:58:28.722631'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2024-02-05 04:58:28.729166'),
(12, 'auth', '0010_alter_group_name_max_length', '2024-02-05 04:58:28.742012'),
(13, 'auth', '0011_update_proxy_permissions', '2024-02-05 04:58:28.752916'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2024-02-05 04:58:28.760757'),
(15, 'app', '0001_initial', '2024-02-05 04:58:29.121755'),
(16, 'admin', '0001_initial', '2024-02-05 04:58:29.270683'),
(17, 'admin', '0002_logentry_remove_auto_add', '2024-02-05 04:58:29.282654'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2024-02-05 04:58:29.294619'),
(19, 'app', '0002_category', '2024-02-05 04:58:29.306796'),
(20, 'app', '0003_passes', '2024-02-05 04:58:29.369064'),
(21, 'app', '0004_passes_passnumber_alter_passes_mobilenumber', '2024-02-05 04:58:29.390009'),
(22, 'app', '0005_page', '2024-02-05 04:58:29.402345'),
(23, 'app', '0006_rename_profile_pic_customuser_profile_pic1', '2024-02-05 04:58:29.418303'),
(24, 'app', '0007_customuser_mobilenumber', '2024-02-05 04:58:29.437522'),
(25, 'app', '0008_remove_customuser_mobilenumber', '2024-02-05 04:58:29.454355'),
(26, 'app', '0009_rename_profile_pic1_customuser_profile_pic_and_more', '2024-02-05 04:58:29.472193'),
(27, 'app', '0010_rename_profile_pic_passes_profile_pic1', '2024-02-05 04:58:29.482761'),
(28, 'sessions', '0001_initial', '2024-02-05 04:58:29.519089'),
(29, 'app', '0011_alter_passes_profile_pic1', '2024-02-05 05:31:24.468437');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('t82kn172fwmqriy2rh5ova1tsd80ir95', '.eJxVjEEOwiAQRe_C2pCADC0u3XsGMswMUjWQlHZlvLsh6UK3_7333yrivpW4d1njwuqijDr9bgnpKXUAfmC9N02tbuuS9FD0Qbu-NZbX9XD_Dgr2MmojJlDykJl5YhGcMiBjkNkkwECzdRnFivUQPJ1JCNAyOETjwFv1-QIuYDlT:1rWyez:xnFOIBHpBFQZkBnOF6HxYSkBrJnfbCOOkRRLH5yMS6s', '2024-02-19 13:05:17.897492');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_category`
--
ALTER TABLE `app_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_customuser`
--
ALTER TABLE `app_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `app_customuser_groups`
--
ALTER TABLE `app_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_customuser_groups_customuser_id_group_id_a5a0ca22_uniq` (`customuser_id`,`group_id`),
  ADD KEY `app_customuser_groups_group_id_47e49ebd_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `app_customuser_user_permissions`
--
ALTER TABLE `app_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_customuser_user_perm_customuser_id_permission_22e31019_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `app_customuser_user__permission_id_c5920c75_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `app_page`
--
ALTER TABLE `app_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_passes`
--
ALTER TABLE `app_passes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_passes_category_id_id_e48fef17_fk_app_category_id` (`category_id_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_app_customuser_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_category`
--
ALTER TABLE `app_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `app_customuser`
--
ALTER TABLE `app_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_customuser_groups`
--
ALTER TABLE `app_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_customuser_user_permissions`
--
ALTER TABLE `app_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `app_page`
--
ALTER TABLE `app_page`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `app_passes`
--
ALTER TABLE `app_passes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_customuser_groups`
--
ALTER TABLE `app_customuser_groups`
  ADD CONSTRAINT `app_customuser_group_customuser_id_164d073f_fk_app_custo` FOREIGN KEY (`customuser_id`) REFERENCES `app_customuser` (`id`),
  ADD CONSTRAINT `app_customuser_groups_group_id_47e49ebd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `app_customuser_user_permissions`
--
ALTER TABLE `app_customuser_user_permissions`
  ADD CONSTRAINT `app_customuser_user__customuser_id_4bcbaafb_fk_app_custo` FOREIGN KEY (`customuser_id`) REFERENCES `app_customuser` (`id`),
  ADD CONSTRAINT `app_customuser_user__permission_id_c5920c75_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `app_passes`
--
ALTER TABLE `app_passes`
  ADD CONSTRAINT `app_passes_category_id_id_e48fef17_fk_app_category_id` FOREIGN KEY (`category_id_id`) REFERENCES `app_category` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `app_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
