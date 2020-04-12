-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2020 at 07:25 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ems`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_accounts`
--

CREATE TABLE `accounts_accounts` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `fullname` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_ec` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts_accounts`
--

INSERT INTO `accounts_accounts` (`id`, `password`, `last_login`, `email`, `username`, `phone_number`, `fullname`, `is_active`, `is_admin`, `is_superuser`, `is_ec`) VALUES
(1, 'pbkdf2_sha256$180000$aFV7hiJ6xyi2$JxaHmszcy9plVmkcSP+sKZeKYLQZqzZDRJnytOLq/K4=', '2020-04-12 14:42:39.131476', '2017-1-60-134@std.ewubd.edu', 'Jugal', '01712345678', 'Jugal Kishore Chanda', 1, 0, 0, 1),
(2, 'pbkdf2_sha256$180000$YSjMWOysp0yn$30m1b19L75BEMsKUHoAsWt07MW9cpYhBqul8hkb/n48=', '2020-04-12 14:42:29.157029', 'admin@ems.com', 'Admin', '01712345678', 'Admin', 1, 1, 0, 0),
(3, 'pbkdf2_sha256$180000$bbHYqzTz1CiW$fscApYEdoH46QEhmOs6+EQFyoi0Nd/JYS1/KQY//te0=', NULL, '2017-1-60-135@std.edubd.edu', 'Anik', '01712345678', 'Mehfuj Ahmed Anik', 1, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(21, 'Can add accounts', 6, 'add_accounts'),
(22, 'Can change accounts', 6, 'change_accounts'),
(23, 'Can delete accounts', 6, 'delete_accounts'),
(24, 'Can view accounts', 6, 'view_accounts'),
(25, 'Can add clubs', 7, 'add_clubs'),
(26, 'Can change clubs', 7, 'change_clubs'),
(27, 'Can delete clubs', 7, 'delete_clubs'),
(28, 'Can view clubs', 7, 'view_clubs'),
(29, 'Can add club_ ec', 8, 'add_club_ec'),
(30, 'Can change club_ ec', 8, 'change_club_ec'),
(31, 'Can delete club_ ec', 8, 'delete_club_ec'),
(32, 'Can view club_ ec', 8, 'view_club_ec'),
(33, 'Can add academic_calendar', 9, 'add_academic_calendar'),
(34, 'Can change academic_calendar', 9, 'change_academic_calendar'),
(35, 'Can delete academic_calendar', 9, 'delete_academic_calendar'),
(36, 'Can view academic_calendar', 9, 'view_academic_calendar'),
(37, 'Can add events', 10, 'add_events'),
(38, 'Can change events', 10, 'change_events'),
(39, 'Can delete events', 10, 'delete_events'),
(40, 'Can view events', 10, 'view_events'),
(41, 'Can add perticipants_details', 11, 'add_perticipants_details'),
(42, 'Can change perticipants_details', 11, 'change_perticipants_details'),
(43, 'Can delete perticipants_details', 11, 'delete_perticipants_details'),
(44, 'Can view perticipants_details', 11, 'view_perticipants_details'),
(45, 'Can add news', 12, 'add_news'),
(46, 'Can change news', 12, 'change_news'),
(47, 'Can delete news', 12, 'delete_news'),
(48, 'Can view news', 12, 'view_news'),
(49, 'Can add notices', 13, 'add_notices'),
(50, 'Can change notices', 13, 'change_notices'),
(51, 'Can delete notices', 13, 'delete_notices'),
(52, 'Can view notices', 13, 'view_notices');

-- --------------------------------------------------------

--
-- Table structure for table `club_clubs`
--

CREATE TABLE `club_clubs` (
  `id` int(11) NOT NULL,
  `clubname` varchar(255) NOT NULL,
  `shortname` varchar(10) NOT NULL,
  `clubemail` varchar(255) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `form` date NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club_clubs`
--

INSERT INTO `club_clubs` (`id`, `clubname`, `shortname`, `clubemail`, `logo`, `is_active`, `form`, `password`) VALUES
(1, 'EWU Robotics Club', 'EWURC', '', 'club_logo/EWU_Robotics_Club_Logo_Transparent.png', 1, '2020-04-12', 'jugal105488jugal');

-- --------------------------------------------------------

--
-- Table structure for table `club_club_ec`
--

CREATE TABLE `club_club_ec` (
  `id` int(11) NOT NULL,
  `date_joined` date NOT NULL,
  `designation` varchar(64) NOT NULL,
  `club_id` int(11) NOT NULL,
  `ec_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club_club_ec`
--

INSERT INTO `club_club_ec` (`id`, `date_joined`, `designation`, `club_id`, `ec_id`) VALUES
(2, '2020-04-12', 'President', 1, 1),
(3, '2020-04-12', 'General Secretary', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(6, 'accounts', 'accounts'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(7, 'club', 'clubs'),
(8, 'club', 'club_ec'),
(4, 'contenttypes', 'contenttype'),
(10, 'eventapp', 'events'),
(11, 'eventapp', 'perticipants_details'),
(9, 'mainadmin', 'academic_calendar'),
(12, 'newAndNotices', 'news'),
(13, 'newAndNotices', 'notices'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'accounts', '0001_initial', '2020-04-12 13:14:08.689096'),
(2, 'contenttypes', '0001_initial', '2020-04-12 13:14:09.266803'),
(3, 'admin', '0001_initial', '2020-04-12 13:14:09.598997'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-04-12 13:14:11.735451'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-04-12 13:14:11.800134'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-04-12 13:14:12.618244'),
(7, 'auth', '0001_initial', '2020-04-12 13:14:13.540744'),
(8, 'auth', '0002_alter_permission_name_max_length', '2020-04-12 13:14:15.873975'),
(9, 'auth', '0003_alter_user_email_max_length', '2020-04-12 13:14:15.914346'),
(10, 'auth', '0004_alter_user_username_opts', '2020-04-12 13:14:15.965009'),
(11, 'auth', '0005_alter_user_last_login_null', '2020-04-12 13:14:15.999837'),
(12, 'auth', '0006_require_contenttypes_0002', '2020-04-12 13:14:16.027916'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2020-04-12 13:14:16.066463'),
(14, 'auth', '0008_alter_user_username_max_length', '2020-04-12 13:14:16.108442'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2020-04-12 13:14:16.140827'),
(16, 'auth', '0010_alter_group_name_max_length', '2020-04-12 13:14:16.230338'),
(17, 'auth', '0011_update_proxy_permissions', '2020-04-12 13:14:16.263494'),
(18, 'club', '0001_initial', '2020-04-12 13:14:16.487753'),
(19, 'club', '0002_auto_20200412_1913', '2020-04-12 13:14:20.613913'),
(20, 'eventapp', '0001_initial', '2020-04-12 13:14:22.738856'),
(21, 'mainadmin', '0001_initial', '2020-04-12 13:14:25.974395'),
(22, 'newAndNotices', '0001_initial', '2020-04-12 13:14:26.609602'),
(23, 'sessions', '0001_initial', '2020-04-12 13:14:26.960613');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('lxf3x1r2s4efrbci3m3i3w79pl884fz6', 'ODc3M2JkOGExYWEyYTMwZGQ1ZmU0MGFhMDE2YTk4NjBjNWFhYTY2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIzYWE4MWRjOGNjMTFlMjJhMTk5ZDIyYWQ0OGE3OWE2YmQ4ODgyNGJhIn0=', '2020-04-26 14:42:39.158545');

-- --------------------------------------------------------

--
-- Table structure for table `eventapp_events`
--

CREATE TABLE `eventapp_events` (
  `id` int(11) NOT NULL,
  `event_cover_photo` varchar(100) NOT NULL,
  `eventname` varchar(255) NOT NULL,
  `eventlocation` longtext NOT NULL,
  `description` longtext NOT NULL,
  `startdate` datetime(6) NOT NULL,
  `enddate` datetime(6) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `created_by_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventapp_events`
--

INSERT INTO `eventapp_events` (`id`, `event_cover_photo`, `eventname`, `eventlocation`, `description`, `startdate`, `enddate`, `created_at`, `created_by_id`) VALUES
(1, 'event_cover/87554444_2266679740301410_3069193963412914176_o.jpg', 'Workshop on Basic Robosoccer and Line Follower Robot', 'East West University', '<p>Workshop on Basic Robosoccer and Line Follower Robot will be arranged&nbsp;</p>', '2020-04-12 14:04:00.000000', '2020-04-22 14:04:00.000000', '2020-04-12 14:36:13.524878', 1);

-- --------------------------------------------------------

--
-- Table structure for table `eventapp_perticipants_details`
--

CREATE TABLE `eventapp_perticipants_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `std_id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `club_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `eventapp_perticipants_details`
--

INSERT INTO `eventapp_perticipants_details` (`id`, `name`, `std_id`, `email`, `phone`, `club_id`, `event_id`) VALUES
(1, 'Jugal Kishore Chanda', '2017-1-60-134', '2017-1-60-134@std.ewubd.edu', '09666775577', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mainadmin_academic_calendar`
--

CREATE TABLE `mainadmin_academic_calendar` (
  `id` int(11) NOT NULL,
  `calendar_label` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `uploaded_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mainadmin_academic_calendar`
--

INSERT INTO `mainadmin_academic_calendar` (`id`, `calendar_label`, `file`, `uploaded_at`) VALUES
(1, 'Spring 2020', 'academic_calendar/academic.pdf', '2020-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `newandnotices_news`
--

CREATE TABLE `newandnotices_news` (
  `id` int(11) NOT NULL,
  `newstitle` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newandnotices_news`
--

INSERT INTO `newandnotices_news` (`id`, `newstitle`, `description`, `created_at`) VALUES
(1, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-04-12'),
(2, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2020-04-12'),
(3, 'Where does it come from?', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '2020-04-12'),
(4, 'Where can I get some?', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2020-04-12');

-- --------------------------------------------------------

--
-- Table structure for table `newandnotices_notices`
--

CREATE TABLE `newandnotices_notices` (
  `id` int(11) NOT NULL,
  `noticetitle` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `newandnotices_notices`
--

INSERT INTO `newandnotices_notices` (`id`, `noticetitle`, `description`, `created_at`) VALUES
(1, 'Where does it come from?', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '2020-04-12'),
(2, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-04-12'),
(3, 'Why do we use it?', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2020-04-12'),
(4, 'Where can I get some?', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2020-04-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_accounts`
--
ALTER TABLE `accounts_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

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
-- Indexes for table `club_clubs`
--
ALTER TABLE `club_clubs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clubname` (`clubname`);

--
-- Indexes for table `club_club_ec`
--
ALTER TABLE `club_club_ec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_club_ec_club_id_72d50398_fk_club_clubs_id` (`club_id`),
  ADD KEY `club_club_ec_ec_id_d7f96265_fk_accounts_accounts_id` (`ec_id`);

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
-- Indexes for table `eventapp_events`
--
ALTER TABLE `eventapp_events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `eventname` (`eventname`),
  ADD KEY `eventapp_events_created_by_id_bb97ff3a_fk_club_clubs_id` (`created_by_id`);

--
-- Indexes for table `eventapp_perticipants_details`
--
ALTER TABLE `eventapp_perticipants_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eventapp_perticipants_details_club_id_d7597494_fk_club_clubs_id` (`club_id`),
  ADD KEY `eventapp_perticipant_event_id_ef162a10_fk_eventapp_` (`event_id`);

--
-- Indexes for table `mainadmin_academic_calendar`
--
ALTER TABLE `mainadmin_academic_calendar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `calendar_label` (`calendar_label`);

--
-- Indexes for table `newandnotices_news`
--
ALTER TABLE `newandnotices_news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newstitle` (`newstitle`);

--
-- Indexes for table `newandnotices_notices`
--
ALTER TABLE `newandnotices_notices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `noticetitle` (`noticetitle`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_accounts`
--
ALTER TABLE `accounts_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `club_clubs`
--
ALTER TABLE `club_clubs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `club_club_ec`
--
ALTER TABLE `club_club_ec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `eventapp_events`
--
ALTER TABLE `eventapp_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `eventapp_perticipants_details`
--
ALTER TABLE `eventapp_perticipants_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mainadmin_academic_calendar`
--
ALTER TABLE `mainadmin_academic_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `newandnotices_news`
--
ALTER TABLE `newandnotices_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `newandnotices_notices`
--
ALTER TABLE `newandnotices_notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

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
-- Constraints for table `club_club_ec`
--
ALTER TABLE `club_club_ec`
  ADD CONSTRAINT `club_club_ec_club_id_72d50398_fk_club_clubs_id` FOREIGN KEY (`club_id`) REFERENCES `club_clubs` (`id`),
  ADD CONSTRAINT `club_club_ec_ec_id_d7f96265_fk_accounts_accounts_id` FOREIGN KEY (`ec_id`) REFERENCES `accounts_accounts` (`id`);

--
-- Constraints for table `eventapp_events`
--
ALTER TABLE `eventapp_events`
  ADD CONSTRAINT `eventapp_events_created_by_id_bb97ff3a_fk_club_clubs_id` FOREIGN KEY (`created_by_id`) REFERENCES `club_clubs` (`id`);

--
-- Constraints for table `eventapp_perticipants_details`
--
ALTER TABLE `eventapp_perticipants_details`
  ADD CONSTRAINT `eventapp_perticipant_event_id_ef162a10_fk_eventapp_` FOREIGN KEY (`event_id`) REFERENCES `eventapp_events` (`id`),
  ADD CONSTRAINT `eventapp_perticipants_details_club_id_d7597494_fk_club_clubs_id` FOREIGN KEY (`club_id`) REFERENCES `club_clubs` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
