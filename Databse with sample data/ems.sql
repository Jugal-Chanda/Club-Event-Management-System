-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2020 at 11:24 PM
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
  `image` varchar(100) NOT NULL,
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

INSERT INTO `accounts_accounts` (`id`, `password`, `last_login`, `email`, `username`, `image`, `phone_number`, `fullname`, `is_active`, `is_admin`, `is_superuser`, `is_ec`) VALUES
(1, 'pbkdf2_sha256$180000$NrtMzaBRcZE0$dag9OQavpsHcmvtNhTOCaJ3PYjxM5j4JuFit1XiVu6w=', '2020-05-08 03:29:49.829804', '2017-1-60-134@std.ewubd.edu', 'jugal', 'accounts/img_low_size.jpg', '01521461643', 'Jugal Kishore Chanda', 1, 0, 0, 1),
(2, 'pbkdf2_sha256$180000$iAfO22kVIIx3$IylNdukxYQwDZomdI1c5Fu1yIuEzsXCkDo0T3AqNfrg=', '2020-05-08 03:00:27.615527', 'faizur@gmail.com', 'faizur', 'accounts/fai.jpg', '01512345678', 'Md. Faizur Rahman', 1, 0, 0, 1),
(3, 'pbkdf2_sha256$180000$riLIuI3SJDrY$BGJip9snT0ryvIcgJjEEfIX4oLCEBuXwgItxvqp13ko=', '2020-05-08 02:45:16.887568', '2017-1-60-149@std.ewubd.edu', 'rimi', 'accounts/u.jpg', '01512345678', 'Umme Hani Rimi', 1, 0, 0, 1),
(4, 'pbkdf2_sha256$180000$t6BnXWvxRl9R$KR77IvtU63iDtmxx0hwhrl5MAu2/WAPdVt9pu3RO7JQ=', '2020-05-08 04:20:08.607965', 'admin@admin.com', 'admin', 'accounts/blank.png', '443003030266', 'Admin', 1, 1, 0, 0),
(5, 'pbkdf2_sha256$180000$Lp8YDbf3voE0$PGdToudqxk/Ica2oCHxIZ9Mx13sSrRq87IMu6sz9jwE=', '2020-05-08 04:08:35.422045', '2017-1-60-138@std.ewubd.edu', 'Monir', 'accounts/monir.jpg', '0152146165', 'Monir Hossain', 1, 0, 0, 1),
(6, 'pbkdf2_sha256$180000$jsoZRXEBtDes$F5LqrY4GOJMmqNmPScEOMNLLbkz7LtI1xeEfm13DiEQ=', NULL, '2017-1-60-129@std.edubd.edu', 'monira', 'accounts/mo.jpg', '01521461643', 'Monira Azad', 1, 0, 0, 0),
(7, 'pbkdf2_sha256$180000$XJAX3uz6nf8H$+4Wj1us5wjhunfGPxRL2+0VzqZxtRjwgEt4m9sH1nMI=', '2020-05-08 04:23:36.428422', 'jugalchanda7@gmail.com', 'jugalchanda', 'accounts/img_low_size_hb2T2hq.jpg', '01521461643', 'Jugal Kishore Chanda', 1, 0, 0, 1);

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
(25, 'Can add club_ ec', 7, 'add_club_ec'),
(26, 'Can change club_ ec', 7, 'change_club_ec'),
(27, 'Can delete club_ ec', 7, 'delete_club_ec'),
(28, 'Can view club_ ec', 7, 'view_club_ec'),
(29, 'Can add clubs', 8, 'add_clubs'),
(30, 'Can change clubs', 8, 'change_clubs'),
(31, 'Can delete clubs', 8, 'delete_clubs'),
(32, 'Can view clubs', 8, 'view_clubs'),
(33, 'Can add member', 9, 'add_member'),
(34, 'Can change member', 9, 'change_member'),
(35, 'Can delete member', 9, 'delete_member'),
(36, 'Can view member', 9, 'view_member'),
(37, 'Can add gallery', 10, 'add_gallery'),
(38, 'Can change gallery', 10, 'change_gallery'),
(39, 'Can delete gallery', 10, 'delete_gallery'),
(40, 'Can view gallery', 10, 'view_gallery'),
(41, 'Can add academic_calendar', 11, 'add_academic_calendar'),
(42, 'Can change academic_calendar', 11, 'change_academic_calendar'),
(43, 'Can delete academic_calendar', 11, 'delete_academic_calendar'),
(44, 'Can view academic_calendar', 11, 'view_academic_calendar'),
(45, 'Can add events', 12, 'add_events'),
(46, 'Can change events', 12, 'change_events'),
(47, 'Can delete events', 12, 'delete_events'),
(48, 'Can view events', 12, 'view_events'),
(49, 'Can add perticipants_details', 13, 'add_perticipants_details'),
(50, 'Can change perticipants_details', 13, 'change_perticipants_details'),
(51, 'Can delete perticipants_details', 13, 'delete_perticipants_details'),
(52, 'Can view perticipants_details', 13, 'view_perticipants_details'),
(53, 'Can add news', 14, 'add_news'),
(54, 'Can change news', 14, 'change_news'),
(55, 'Can delete news', 14, 'delete_news'),
(56, 'Can view news', 14, 'view_news'),
(57, 'Can add notices', 15, 'add_notices'),
(58, 'Can change notices', 15, 'change_notices'),
(59, 'Can delete notices', 15, 'delete_notices'),
(60, 'Can view notices', 15, 'view_notices');

-- --------------------------------------------------------

--
-- Table structure for table `club_clubs`
--

CREATE TABLE `club_clubs` (
  `id` int(11) NOT NULL,
  `clubname` varchar(255) NOT NULL,
  `shortname` varchar(10) NOT NULL,
  `clubemail` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `form` date NOT NULL,
  `is_active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club_clubs`
--

INSERT INTO `club_clubs` (`id`, `clubname`, `shortname`, `clubemail`, `password`, `logo`, `description`, `form`, `is_active`) VALUES
(1, 'East West University Robotics Club', 'EWURC', '', '', 'club_logo/EWU_Robotics_Club_Logo.png', 'EWU Robotics Club is the robotics platform of East West University. Every member of this club is called \"EWU Robotor\". In 2014 this was founded by Abdullah Al Mamun (A student of EWU, EEE).With the all effort of all students from all the department of EWU,now it is the biggest Robotics platform for EWU. From the beginning of this platform some students of EWU give their enormous efforts. They are Punnag Shadhu Khan(EWU,EEE),Shihab Shuvro(EWU,ETE),Sayeem Bin Kutub(EWU,EEE),A S Fardin Ahmed(EWU,CSE),Sunjida Nova(EWU,EEE),?????? ???? ???(EWU,EEE) and so many other students  from different department.Also the faculty members from EEE, ETE and CSE help this community a lot. Abdullah Al Mamun started this community through training up the students of EWU. After that, this training program is a part of this community.Throughout this training program we try to introduce new technology and inspire students to work with this technology.This community is open for all the students from all the department.We believe knowledge has no boundaries.\r\nFacebook Group:\r\nhttps://www.facebook.com/groups/ewuRoboticsClub/\r\n\r\n', '2020-05-08', 1),
(2, 'East West University Business Club', 'EWUBC', '', '', 'club_logo/BC-logo-696x458.png', 'East West University Business Club(EWUBC) is the first club of the university with the aim to promote leadership and entrepreneurship of dexterous students. The club works with the all phases of business to practice and determine management skills under the intellectual supervision of spotlessly competent moderators. Since 1999, EWUBC has been putting efforts for students to practice creativity, teamwork, leadership, idea sharing and so much more.EWUBC functions on grooming programs for students about presentation skill development, Microsoft Excel, career talk, business competitions etc. EWUBC appreciates students by organizing many events, seminars and competitions.\r\n\r\nThe significant events of East West University Business Club are Inter University Business Plan Competition 2017, Power Presenter, Microsoft Excel Training Program, Career Clinic, Competition Courses, BriefCase (an Intra University Business Sales Competition). EWUBC also set up yearly expeditions for its members and university students.', '2020-05-08', 1),
(3, 'Rotaract Club', 'RACEWU', '', '', 'club_logo/RACEWU_Logo.png', 'Rotaract Club of East West University (RaCEWU) is a well-known and reputed social service club which activities are not only bounded within university campus but also countrywide. Rotaract focuses on the development of young men and women as leaders in their communities and workplaces. RaCEWU also takes part in international service projects, in a global effort to bring peace and international understanding to the world. RaCEWU is emphasizing respect for the rights of others, and to promote ethical standards. RaCEWU is a place which not only performs social activities but also helps to make people more responsible to society.', '2020-05-08', 1),
(4, 'Club For Performing Arts', 'ECPA', 'amibest50@gmail.com', 'jugal105488jugal', 'club_logo/EWU_Logo_Converted.png', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', '2020-05-08', 1),
(5, 'East West University Computer Programming Club', 'EWUCoPC', 'amibest50@gmail.com', 'jugal105488jugal', 'club_logo/download.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nWhere can I get some?\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.\r\n\r\n5\r\n	paragraphs\r\n	words\r\n	bytes\r\n	lists\r\n	Start with \'Lorem\r\nipsum dolor sit amet...\'\r\n', '2020-05-08', 1);

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
(2, '2020-05-08', 'Vice President', 1, 1),
(3, '2020-05-08', 'Presidant', 2, 3),
(4, '2020-05-08', 'Presidant', 3, 2),
(5, '2020-05-08', 'Presidant', 4, 5),
(6, '2020-05-08', 'Vice President', 5, 7);

-- --------------------------------------------------------

--
-- Table structure for table `club_gallery`
--

CREATE TABLE `club_gallery` (
  `id` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `upload_date` date NOT NULL,
  `club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club_gallery`
--

INSERT INTO `club_gallery` (`id`, `image`, `upload_date`, `club_id`) VALUES
(1, 'gallery/1.JPG', '2020-05-08', 1),
(2, 'gallery/7.JPG', '2020-05-08', 1),
(3, 'gallery/64909170_571899289883454_7905591871903105024_n.jpg', '2020-05-08', 1),
(4, 'gallery/64914761_900993236900100_6337363200324927488_n.jpg', '2020-05-08', 1),
(5, 'gallery/3.JPG', '2020-05-08', 1),
(6, 'gallery/1_j5PVt1Q.JPG', '2020-05-08', 1),
(7, 'gallery/1._Info_Talk_On_Satellite.JPG', '2020-05-08', 1),
(8, 'gallery/7._Robo_Quiz_Contest_Summer_2018.JPG', '2020-05-08', 1),
(9, 'gallery/5._Workshop_on_Graphics_Design.jpeg', '2020-05-08', 1),
(10, 'gallery/1_u95hiYY.jpg', '2020-05-08', 2),
(11, 'gallery/2.jpg', '2020-05-08', 2),
(12, 'gallery/3_iYCzFxR.jpg', '2020-05-08', 2),
(13, 'gallery/34.jpg', '2020-05-08', 2),
(14, 'gallery/16.jpg', '2020-05-08', 2),
(15, 'gallery/15.jpg', '2020-05-08', 2),
(16, 'gallery/7_lgWfDyK.jpg', '2020-05-08', 2),
(17, 'gallery/91182927_2608643029263530_4039699818887512064_n.jpg', '2020-05-08', 3),
(19, 'gallery/91513567_2608643235930176_4516232728210833408_n.jpg', '2020-05-08', 3),
(20, 'gallery/91513567_2608643235930176_4516232728210833408_n_iG6sTor.jpg', '2020-05-08', 3),
(21, 'gallery/91577391_2608643165930183_1806409888318881792_n.jpg', '2020-05-08', 3),
(22, 'gallery/91577391_2608643165930183_1806409888318881792_n_TljI5um.jpg', '2020-05-08', 3),
(23, 'gallery/91787611_2608643095930190_7392299385465339904_n.jpg', '2020-05-08', 3),
(25, 'gallery/91908183_2608643345930165_1295176014065827840_n.jpg', '2020-05-08', 3),
(26, 'gallery/43.jpg', '2020-05-08', 4),
(27, 'gallery/12.jpg', '2020-05-08', 4),
(28, 'gallery/13.jpg', '2020-05-08', 4),
(29, 'gallery/9.JPG', '2020-05-08', 5),
(30, 'gallery/2_sIQoH56.JPG', '2020-05-08', 5);

-- --------------------------------------------------------

--
-- Table structure for table `club_member`
--

CREATE TABLE `club_member` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `std_id` varchar(13) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `semister` int(11) NOT NULL,
  `completed_credit` int(11) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `club_member`
--

INSERT INTO `club_member` (`id`, `name`, `std_id`, `email`, `phone_number`, `semister`, `completed_credit`, `approved`, `club_id`) VALUES
(1, 'Jugal Kishore Chanda', '2017-1-60-134', 'jugalchanda7@gmail.com', '01521461643', 10, 110, 1, 1),
(2, 'Jugal Kishore Chanda', '2017-1-60-134', '2017-1-60-134@std.ewubd.edu', '01521461643', 10, 110, 0, 4),
(3, 'Jugal Kishore Chanda', '2017-1-60-134', '2017-1-60-134@std.ewubd.edu', '443003030266', 10, 110, 1, 5);

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
(8, 'club', 'clubs'),
(7, 'club', 'club_ec'),
(10, 'club', 'gallery'),
(9, 'club', 'member'),
(4, 'contenttypes', 'contenttype'),
(12, 'eventapp', 'events'),
(13, 'eventapp', 'perticipants_details'),
(11, 'mainadmin', 'academic_calendar'),
(14, 'newAndNotices', 'news'),
(15, 'newAndNotices', 'notices'),
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
(1, 'accounts', '0001_initial', '2020-05-07 19:20:54.662765'),
(2, 'contenttypes', '0001_initial', '2020-05-07 19:20:55.036312'),
(3, 'admin', '0001_initial', '2020-05-07 19:20:55.279326'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-05-07 19:20:56.666632'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-05-07 19:20:56.745223'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-05-07 19:20:57.844829'),
(7, 'auth', '0001_initial', '2020-05-07 19:20:58.592310'),
(8, 'auth', '0002_alter_permission_name_max_length', '2020-05-07 19:21:00.932475'),
(9, 'auth', '0003_alter_user_email_max_length', '2020-05-07 19:21:00.960400'),
(10, 'auth', '0004_alter_user_username_opts', '2020-05-07 19:21:00.983396'),
(11, 'auth', '0005_alter_user_last_login_null', '2020-05-07 19:21:01.012360'),
(12, 'auth', '0006_require_contenttypes_0002', '2020-05-07 19:21:01.039173'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2020-05-07 19:21:01.097127'),
(14, 'auth', '0008_alter_user_username_max_length', '2020-05-07 19:21:01.126048'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2020-05-07 19:21:01.150285'),
(16, 'auth', '0010_alter_group_name_max_length', '2020-05-07 19:21:01.242417'),
(17, 'auth', '0011_update_proxy_permissions', '2020-05-07 19:21:01.290831'),
(18, 'club', '0001_initial', '2020-05-07 19:21:04.630134'),
(19, 'eventapp', '0001_initial', '2020-05-07 19:21:06.688686'),
(20, 'mainadmin', '0001_initial', '2020-05-07 19:21:10.737012'),
(21, 'newAndNotices', '0001_initial', '2020-05-07 19:21:11.638680'),
(22, 'sessions', '0001_initial', '2020-05-07 19:21:12.108280');

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
('7gz8yynxb3zch3w4gf624cvypimzj6ke', 'YWNlODIzNDVhMTNlMTU2ZjNiMzhmZGY0YTYzMzM1MzNjYmU0Y2ExODp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0M2VhNjRjNmZmMDNmNjUyOGMxMDkwNjY3NDEzMmIyYmVmMjUzZWY5In0=', '2020-05-22 04:23:36.506096');

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
(1, 'event_cover/e1.jpg', 'Workshop on Robo Soccer and Basic Line Follower Robot', 'East West University', '<p>&ldquo;Robosoccer and Basic Line Follower Robot&rdquo; is a three-day workshop on 19, 20, 21 March 2020, a workshop on making robotic cars.&nbsp;</p>\r\n<p>Robosoccer is a robotic car that can be controlled remotely. This car can be used for playing football against another robotic car of same specs. On the other hand, the line follower robot is also a robotic car that moves along a colored track. Recently, the enthusiasm around the robotic contests involving robosoccer and line follower has hyped up in most of the universities of Bangladesh. We also want to make our marks on these competitions. For this purpose, East West University Robotics Club is organizing &lsquo;Robosoccer and Line Follower Robot&rsquo; to train the club members and prepare them for these contests. As a part of the workshop, there will be a &ldquo;Robosoccer and Line follower contest&rdquo; to give attendees of the experience and inspire them for the future contests.</p>\r\n<p>------------------------------------------------------------------</p>\r\n<p>Participants will get:</p>\r\n<p>1. Certificate&nbsp;</p>\r\n<p>2. Lunch</p>\r\n<p>3. Free Entree for \"Robosoccer &amp; LFR Contest \".</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;-----------------------------------------------------------</p>\r\n<p>&nbsp;</p>\r\n<p>Registration Fee: 200 TK.</p>\r\n<p>&nbsp;</p>\r\n<p>Room: TBA</p>\r\n<p>&nbsp;</p>\r\n<p>TIME:&nbsp;</p>\r\n<p>?19march(4.50-6.50pm)</p>\r\n<p>Topic: Basic Arduino</p>\r\n<p>&nbsp;</p>\r\n<p>?20march(10am-4.50pm)(including Break)</p>\r\n<p>Topic: robosoccer</p>\r\n<p>&nbsp;</p>\r\n<p>?21march(10am-4.50pm)(including Break)</p>\r\n<p>Topic: Line Follower Robot</p>\r\n<p>&nbsp;</p>\r\n<p>Booth will be held in the ground on&nbsp; 4,5,16,18march 2020</p>\r\n<p>time: 10.10am - 4.30pm</p>', '2020-05-07 19:05:00.000000', '2020-05-08 19:05:00.000000', '2020-05-07 19:56:51.523874', 1),
(2, 'event_cover/e2.jpg', 'Traning Session On Robotics and IoT', 'East West University', '<p><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">EWU Robotics Club will be going to arrange a training session on robotics and IoT.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">In this course we will cover the major parts of robotics. The prerequisite of this course is to be a member of EWU Robotics Club. To be a member of this club please register yourselves.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Course Duration: 32 Hour</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Viva Date: 27 October,2019 (Sunday)</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Time: 4.50 PM</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Room: 372</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Registration Link : </span><a style=\"color: #385898; cursor: pointer; text-decoration-line: none; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" href=\"https://l.facebook.com/l.php?u=https%3A%2F%2Fforms.gle%2FaNJoDpXQUn7DuJTU9%3Ffbclid%3DIwAR3y6953-wvRwlu266L_LeItQrZn-ftvVaTMw05ZhgpgeRXZIBGFx1Zgc24&amp;h=AT1Z0LrT-NEBZFlsnXq1cc7ApjlxsXDpTtAsDBgWKb-pyf0BIorn6CBoQxVnYMpsa5RpvpoFUIq-EgZrC9on_vUuG0oMVvyJ1cz7Trag21BlWcYq-maXnW8aHiBRahpqxeXt\" target=\"_blank\" rel=\"nofollow noopener\" data-lynx-mode=\"hover\">https://forms.gle/aNJoDpXQUn7DuJTU9</a><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Topics to be Covered:</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">1. Introduction to Arduino IDE</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> a) How to install</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> b) Board manager</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> c) Port</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> d) Baud rate</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> e) Serial Monitor</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> f) Compile and Upload code</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> g) Library adding</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">2. Arduino </span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> a) Hello world</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> b) Analog Input and output pins applications</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> c) Digital input and output pins applications</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> d) LED blinking</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">3. Sensor integration</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">4. Commutation System</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">5. IoT</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">6. MIT app inventor</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">7. Bluetooth Communication</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">8. Real Life Project</span></p>', '2020-05-07 19:05:00.000000', '2020-05-07 19:05:00.000000', '2020-05-07 19:57:54.640947', 1),
(3, 'event_cover/e3.jpg', 'Workshop on Computer Vision', 'East West University', '<p><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Summary</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Have you ever wondered how self-driving cars work? Have you ever wanted to land a highly paid job in Computer Vision industry? </span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">We have compiled this workshop so you seize your opportunity to get noticed by building awesome Computer Vision applications.This course kicks-off with Introduction to OpenCV and familiarizes you with the advancements in this version. We&rsquo;ll educate you on how to handle images, enhance and transform them. We&rsquo;ll also develop some cool applications including Face and Eyes detection, Emotion recognition and Fast QR code detection &amp; decoding that you can deploy anywhere. We&rsquo;ll also share some tips &amp; tricks to make you more productive.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">By the end of the workshop, you will have profound knowledge on what Computer Vision is and how we can leverage OpenCV to build real-world applications without much effort.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">You will learn</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> 1. How to build real-world Computer Vision applications.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> 2. Deploy Face and Eyes Detection with HAAR Cascade </span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> Classifiers.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> 3. Recognize Age, Gender and Emotions .</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> 4. Develop Fast QR Code Detection and Decoding application.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> 5. Create your own Image Classifier.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> 6. Train an Object Detection Model and Detect Persons, and </span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\"> Vehicles.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Course Length : Full day long.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Certificate will be provided. </span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">:-) :-) :-) Surprised gifts are always there :-) :-) :-)</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Instructor: </span><a style=\"color: #385898; cursor: pointer; text-decoration-line: none; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" href=\"https://web.facebook.com/akash.bangla\" target=\"_blank\" rel=\"noopener\">Salah Uddin</a><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Place: East West University, Aftabnagar, Dhaka, Bangladesh.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Registration link: </span><a style=\"color: #385898; cursor: pointer; text-decoration-line: none; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" href=\"http://shorturl.at/cJO28?fbclid=IwAR3RLPCbeQWKAGg0pDRmmupXYiyS4npgRdW4hpYWZvwwXLNshlIL5LxF0M4\" target=\"_blank\" rel=\"nofollow noopener\" data-lynx-mode=\"hover\" data-lynx-uri=\"https://l.facebook.com/l.php?u=http%3A%2F%2Fshorturl.at%2FcJO28%3Ffbclid%3DIwAR3RLPCbeQWKAGg0pDRmmupXYiyS4npgRdW4hpYWZvwwXLNshlIL5LxF0M4&amp;h=AT1MtYhXnr_02GOFN5am0tsKwdqDgh_kCzl1uCkDVJB5Qs1zVDk70EzQp8Baw_gLZHjgTKU1VIsex0Hb9Sc3Pff6NcEXSBPi6dW1rj7lmMD5qeevcrX5kSIq9ZRkEZWOv3Ze\">shorturl.at/cJO28</a><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Registration fees: 200 BDT only.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">!!!!!!!!!!!!!!!!!!!!!!SEATS ARE LIMITED!!!!!!!!!!!!!!!!!!!!!!!!</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">ONLY FOR EWUIANS (East West University students,regardless the Department)</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">For query: akash.bangla@gmail.com</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Organized by East West University Robotics Club</span></p>', '2020-05-07 19:05:00.000000', '2020-05-07 19:05:00.000000', '2020-05-07 19:58:48.126471', 1),
(4, 'event_cover/87018623_2188129737957325_7139877337071353856_o.jpg', 'EWUBC Presents Brand Aid 2020 Powered By Speed', 'East West University', '<p>Any brand is a risky endeavor with an uncertain life expectancy. The risk is even higher when the brand is facing a crisis. A Brand in crisis is like a sinking ship and in order to get through the crisis, a brand must manage, thrive and survive.</p>\r\n<p>&nbsp;</p>\r\n<p>To introduce the undergraduate students of East West University to real world business problems, East West University Business Club has come up with Brand Aid 2020 - An Intra University Business Strategy Competition Powered by Speed.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Brand Aid 2020 is based on strategy management of Business Organization in a competitive platform. It is designed in a unique way where students of East West University will get the opportunity to deal with critical business problems of an organization and present effective solutions.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Tentative Schedule:</p>\r\n<p>&nbsp;</p>\r\n<p>Initial Round - Online Screening:</p>\r\n<p>25th February</p>\r\n<p>&nbsp;</p>\r\n<p>Workshop: 1st March</p>\r\n<p>&nbsp;</p>\r\n<p>Second Round - Crack the Crisis:</p>\r\n<p>3rd March</p>\r\n<p>&nbsp;</p>\r\n<p>Semi Finale - On Spot Round: 7th March</p>\r\n<p>&nbsp;</p>\r\n<p>Grand Finale - The Business Pitch:</p>\r\n<p>9th March</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Rules &amp; Regulation:</p>\r\n<p>&nbsp;</p>\r\n<p>1. Teams must be comprised of three members.</p>\r\n<p>2. Students from any department of EWU can participate and must be enrolled in undergraduate program.</p>\r\n<p>&nbsp;</p>\r\n<p>People say good things take money but Brand Aid ain\'t! NO REGISTRATION FEE IS REQUIRED TO PARTICIPATE IN Brand Aid!</p>\r\n<p>&nbsp;</p>\r\n<p>But, will the best team only going to get experiences by presenting their effective solutions in Brand Aid 2020? Well, obviously not!</p>\r\n<p>&nbsp;</p>\r\n<p>THE CHAMPION TEAM WILL GET A FULLY FUNDED TRIP TO ONE OF THE MOST EXCITING PLACES IN BANGLADESH FOR ONE NIGHT, TWO DAYS.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Do you need anymore reason to participate in Brand Aid?</p>\r\n<p>&nbsp;</p>\r\n<p>Registration Deadline: 25th February, 2020</p>\r\n<p>&nbsp;</p>\r\n<p>Booth will be available from 23rd February on campus premises. Get registered with your team &amp; be prepared to Revive The Brand!</p>\r\n<p>&nbsp;</p>\r\n<p>Follow us on:</p>\r\n<p>fb.com/BrandAidOfficial</p>\r\n<p>fb.com/EWUBC</p>', '2020-05-08 02:05:00.000000', '2020-05-08 02:05:00.000000', '2020-05-08 02:55:39.881338', 2),
(5, 'event_cover/83989488_2507628392890897_1827826502222217216_o.jpg', 'Blood Donation Camp Spring-2020', 'East West University', '<p><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Hello altruistic people of EWU! We, RaCEWU family, are proud to announce that, the first Blood donation camp for the year 2020 is going to be held on this month.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">This time, Rotaract club of East West University is going to organize a blood donation camp associating with Police Blood Bank in our own Campus.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Police Blood Bank, Dhaka Metropolitan is a voluntary organization. This organization collects bloods for the general people and for the people who work in police force. They have worked with many universities and other community based voluntary organizations and this time they are coming to our campus for collecting blood to serve the society.</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">We, RaCEWU family, are going to work with them for serving the community and we are also opening a door for all EWUIANS to be a part of this benevolent work. So guys, please come, donate blood and be a part of a noble deed. </span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Moreover, the donor will get a t-shirt &amp; 5 free tests:</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">1.Hepatitis B </span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">2.Hepatitis C </span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">3.HIV</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">4.Malaria and</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">5.Syphilis</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Date: 20 January 2020</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Time: 10 am to 5 pm</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">Place: WiFi Zone of EWU</span><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><br style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\" /><span style=\"color: #1d2129; font-family: Helvetica, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #ffffff;\">LET\'S DONATE, BECAUSE OUR BLOODS CAN SAVE LIVES. </span></p>', '2020-05-09 03:05:00.000000', '2020-05-15 03:05:00.000000', '2020-05-08 03:06:20.105378', 3),
(6, 'event_cover/Certificate_of_Completion-01.png', 'Workshop on Computer Vision1', 'East West University', '<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; text-align: justify; background-color: #ffffff;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', '2020-05-08 04:05:00.000000', '2020-05-09 04:05:00.000000', '2020-05-08 04:10:31.356801', 4),
(7, 'event_cover/83196455_2955046751193197_369510312946171904_n.jpg', 'Career Guideline and Job preparation for Graduating students', 'East West University', '<p>&nbsp;</p>\r\n<p>Proposal:&nbsp;</p>\r\n<p>&nbsp; &nbsp; &nbsp;\"Career Guideline and job preparation for Graduating Students\"</p>\r\n<p>Agenda:&nbsp;</p>\r\n<p>Sharing and Exchanging knowledge on Software Technology and different language.</p>\r\n<p>What are the current trends on technological sectors and how students should prepare.</p>\r\n<p>What is about Nascenia and what it is doing to make a difference.</p>\r\n<p>Prospects of future job placement at Nascenia.&nbsp;</p>\r\n<p>Target Audience:&nbsp; We are mainly interested in Senior/ Final Year students (9th - 12th semester). We will collect CV from interested student and from that Nascenia will send interview offer. We are looking to have at least 50+ participants in the seminar.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Time: We are looking to arrange this seminar in between 28th January it will&nbsp; start from 4:30PM at Room 354.&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>Speaker: Currently we know, Mr. Fattahul Alam, CTO, Nascenia Limited will give a speech on the seminar. We will let you know for any other speaker.&nbsp;</p>', '2020-05-08 04:05:00.000000', '2020-05-09 04:05:00.000000', '2020-05-08 04:25:08.067551', 5);

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
(1, 'Jugal Kishore Chanda', '2017-1-60-134', 'jugalchanda7@gmail.com', '01521461643', 1, 1),
(2, 'Jugal Kishore Chanda', '2017-1-60-134', '2017-1-60-134@std.ewubd.edu', '015214614', 4, 6),
(3, 'Jugal Kishore Chanda', '2017-1-60-134', '2017-1-60-134@std.ewubd.edu', '015214614', 5, 7);

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
(1, 'Fall 2019', 'academic_calendar/fall2019.pdf', '2020-05-08'),
(2, 'Spring 2020', 'academic_calendar/spring2020.pdf', '2020-05-08');

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
(1, 'INFORMATION STUDIES AND LIBRARY MANAGEMENT DEPARTMENT OF EAST WEST UNIVERSITY CELEBRATE PAHELA BAISHAKH ONLINE', 'Information Studies and Library Management Department of East West University celebrated Pahela Baishakh online amid the spread of novel coronavirus in the country.\r\n\r\nTeachers and Students of the department joined a video conference using the online platform Zoom to celebrate this year’s Pahela Baisakh. \r\n\r\nUnder the directions of the department’s Chairperson Dr. Dilara Begum, the students participated in different activities such as dancing, singing, reciting and quiz competition while staying safe inside their home. \r\n\r\nDuring this time the chairperson and the faculty members of the department provide notitiae statement about the coronavirus to the students. At this point, it should be mentioned that faculty members and students of the department have jointly worked to collect fund for the helpless people around the university. \r\n\r\nThis exceptional celebration of the department has been an unprecedented response among the students.\r\n\r\n “We all will celebrate Pahela Baishakh together next year with new dreams and possibilities in a Bangladesh free from coronavirus,” Dr Dilara Begum said to the students at the video conference.', '2020-05-08'),
(2, 'CRACKING BRAND CRISIS THROUGH ‘BRAND AID’', 'East West University Business Club has inaugurated, for the second time, \'Brand Aid- an intra university business strategy competition\' powered by SPEED. The club has singed partnership, as well, with many companies to make this event a blast! Brand Aid\'s theme is based on how a company should proceed while facing a brand crisis. Students who have participated in this competition will have a pellucid idea how a brand can have the proper aid required to beat other brands in the market. Every team, consisting of three members, will work to solve variety of branding crisis as they get going onto next rounds.  Around 107 teams have registered initially in \'Brand Aid\'; a breakthrough number of teams for an intra university competition and only 30 teams passed through the online screening with their masterly ideas where they had to solve a case based on a telecommunication company. These 30 teams got to attend the second round workshop on 1st March which was arranged to prepare the teams for the upcoming rounds. At the end of this workshop, teams were provided with second round case which had to be presented by their teams on campus at 3rd March. Professional corporate personnel from prominent companies had judged those 30 teams and only 16 teams had been qualified to move on-to the next round, semi-finale which was held on 7th March. Out of 107 teams only 6 teams made their way to the grand finale. A grand gala took place on that very day. On behalf of Akij Food and Beverage Limited, as the chief guest, Khondoker Golam Azam; Cheif People Officer and as the guest of honour, MD. Maidul Islam; Head of Marketing attended the gala and enhanced its significance. At the end of the program top 3 winning teams were honored with trophies. The champion team \'Last Picks\' will also be prized with an exciting trip for their refreshment by our trip partner, \'The Paradise Tourism\'. The other partners of this event are the photography partner, \'Studio Velvet\' and attire partner, \'Formal Point\'.\r\n\r\nEast West University Business Club is hoping to set precedence for business competitions in the students whilst making \'Brand Aid\' a real brand.', '2020-05-08'),
(4, 'What is Lorem Ipsum?', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2020-05-08'),
(5, 'Where can I get some?', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2020-05-08');

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
(2, 'Payment of Tuition Fees', 'In order to pay the outstanding tuition fees for Spring Semester 2020, the students need to present the Advising Slip of Spring Semester 2020 to any of the above three Banks. If the Advising Slip of Spring Semester 2020 is not available to the students, they can fill in the Deposit Slip (available on the webpage of EWU) and pay the outstanding tuition fee or any other arrears to any one of the above three banks.\r\n\r\nSimilarly, in order to pay the tuition fees of Summer Semester 2020, the students have to present the Advising Slip or the Deposit Slip of Summer Semester 2020 to any of the above three banks.\r\n\r\nIf any student wants to know the amount due, they can Email to the following address mentioning the student’s name, EWU ID number and mobile number:   Mr. Md. Abdul Kadir, Sr. Accounts Officer, Email: kadir@ewubd.edu   \r\n\r\nThis notice has been issued with the kind approval of the Vice Chancellor.  \r\n\r\nMashfiqur Rahman\r\n\r\nRegistrar\r\n\r\nEast West University', '2020-05-08'),
(3, 'Spring Semester 2020: Withdrawal of Courses', 'Due to the closure of the university caused by the COVID-19 from 17 March 2020, many students could not withdraw the course/s within the period mentioned in the Spring Semester 2020 Academic Calendar. However, the students (Except Pharmacy) who want to withdraw course/s may do so by10 May 2020 using the Online Advising portal http://portal.ewubd.edu/ following the guidelines outlined below: \r\n\r\n\r\n\r\nRequests for withdrawal will not be accepted for students who do not follow the above guidelines.\r\n\r\nStudents (Except Pharmacy) who have registered for Spring Semester 2020 and wish to withdraw the entire Spring Semester 2020, should mail to: withdrawspring2020@ewubd.edu, providing the following information:\r\n\r\nSubject: Withdrawal of Spring 2020, Student’s EWU ID:\r\n\r\nAlso need to provide the following information on the body of Email:\r\n\r\na. Name of the Student:\r\n\r\nb. EWU ID of the student:\r\n\r\nc. Withdrawal of Spring Semester 2020.\r\n\r\nThis notice has been issued with the kind approval of the Vice Chancellor.  \r\n\r\nMashfiqur Rahman\r\n\r\nRegistrar\r\n\r\nEast West University', '2020-05-08'),
(4, 'Load Test for Online Advising Portal', 'The Online Advising portal http://portal.ewubd.edu/ has been up and running for test. It is important that all students conduct a load test to see how the software performs at its peak before putting software on live.\r\n\r\nWith that in mind all students are hereby requested to conduct the course advising on test basis as per the following schedule to simulate a surge into the system:\r\n\r\n\r\n\r\nWe will greatly appreciate your active participation in the load test to make it a success. \r\n\r\nShould you encounter any issue, please send an email along with problem description, screen-shot and your contact number to helpdesk.swd@ewubd.edu.\r\n\r\nWith the kind approval of the Vice Chancellor this is for information and necessary action by all concerned.\r\n\r\nMashfiqur Rahman\r\n\r\nRegistrar\r\n\r\nEast West University', '2020-05-08');

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
-- Indexes for table `club_gallery`
--
ALTER TABLE `club_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_gallery_club_id_a07f735a_fk_club_clubs_id` (`club_id`);

--
-- Indexes for table `club_member`
--
ALTER TABLE `club_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_member_club_id_a1892159_fk_club_clubs_id` (`club_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `club_clubs`
--
ALTER TABLE `club_clubs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `club_club_ec`
--
ALTER TABLE `club_club_ec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `club_gallery`
--
ALTER TABLE `club_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `club_member`
--
ALTER TABLE `club_member`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `eventapp_events`
--
ALTER TABLE `eventapp_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `eventapp_perticipants_details`
--
ALTER TABLE `eventapp_perticipants_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mainadmin_academic_calendar`
--
ALTER TABLE `mainadmin_academic_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `newandnotices_news`
--
ALTER TABLE `newandnotices_news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `club_gallery`
--
ALTER TABLE `club_gallery`
  ADD CONSTRAINT `club_gallery_club_id_a07f735a_fk_club_clubs_id` FOREIGN KEY (`club_id`) REFERENCES `club_clubs` (`id`);

--
-- Constraints for table `club_member`
--
ALTER TABLE `club_member`
  ADD CONSTRAINT `club_member_club_id_a1892159_fk_club_clubs_id` FOREIGN KEY (`club_id`) REFERENCES `club_clubs` (`id`);

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
