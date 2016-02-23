-- phpMyAdmin SQL Dump
-- version 4.5.0.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 23, 2016 at 12:38 AM
-- Server version: 5.6.27
-- PHP Version: 5.5.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tolawork`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add permission', 1, 'add_permission'),
(2, 'Can change permission', 1, 'change_permission'),
(3, 'Can delete permission', 1, 'delete_permission'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add user', 3, 'add_user'),
(8, 'Can change user', 3, 'change_user'),
(9, 'Can delete user', 3, 'delete_user'),
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add site', 6, 'add_site'),
(17, 'Can change site', 6, 'change_site'),
(18, 'Can delete site', 6, 'delete_site'),
(19, 'Can add log entry', 7, 'add_logentry'),
(20, 'Can change log entry', 7, 'change_logentry'),
(21, 'Can delete log entry', 7, 'delete_logentry'),
(22, 'Can add user social auth', 8, 'add_usersocialauth'),
(23, 'Can change user social auth', 8, 'change_usersocialauth'),
(24, 'Can delete user social auth', 8, 'delete_usersocialauth'),
(25, 'Can add nonce', 9, 'add_nonce'),
(26, 'Can change nonce', 9, 'change_nonce'),
(27, 'Can delete nonce', 9, 'delete_nonce'),
(28, 'Can add association', 10, 'add_association'),
(29, 'Can change association', 10, 'change_association'),
(30, 'Can delete association', 10, 'delete_association'),
(31, 'Can add code', 11, 'add_code'),
(32, 'Can change code', 11, 'change_code'),
(33, 'Can delete code', 11, 'delete_code'),
(34, 'Can add report', 12, 'add_report'),
(35, 'Can change report', 12, 'change_report'),
(36, 'Can delete report', 12, 'delete_report'),
(37, 'Can add format', 13, 'add_format'),
(38, 'Can change format', 13, 'change_format'),
(39, 'Can delete format', 13, 'delete_format'),
(40, 'Can add display field', 14, 'add_displayfield'),
(41, 'Can change display field', 14, 'change_displayfield'),
(42, 'Can delete display field', 14, 'delete_displayfield'),
(43, 'Can add filter field', 15, 'add_filterfield'),
(44, 'Can change filter field', 15, 'change_filterfield'),
(45, 'Can delete filter field', 15, 'delete_filterfield'),
(46, 'Can add documentation app', 16, 'add_documentationapp'),
(47, 'Can change documentation app', 16, 'change_documentationapp'),
(48, 'Can delete documentation app', 16, 'delete_documentationapp'),
(49, 'Can add feedback', 17, 'add_feedback'),
(50, 'Can change feedback', 17, 'change_feedback'),
(51, 'Can delete feedback', 17, 'delete_feedback'),
(52, 'Can add faq', 18, 'add_faq'),
(53, 'Can change faq', 18, 'change_faq'),
(54, 'Can delete faq', 18, 'delete_faq'),
(55, 'Can add Queue', 19, 'add_queue'),
(56, 'Can change Queue', 19, 'change_queue'),
(57, 'Can delete Queue', 19, 'delete_queue'),
(58, 'Can add Ticket', 20, 'add_ticket'),
(59, 'Can change Ticket', 20, 'change_ticket'),
(60, 'Can delete Ticket', 20, 'delete_ticket'),
(61, 'Can add Follow-up', 21, 'add_followup'),
(62, 'Can change Follow-up', 21, 'change_followup'),
(63, 'Can delete Follow-up', 21, 'delete_followup'),
(64, 'Can add Ticket change', 22, 'add_ticketchange'),
(65, 'Can change Ticket change', 22, 'change_ticketchange'),
(66, 'Can delete Ticket change', 22, 'delete_ticketchange'),
(67, 'Can add Attachment', 23, 'add_attachment'),
(68, 'Can change Attachment', 23, 'change_attachment'),
(69, 'Can delete Attachment', 23, 'delete_attachment'),
(70, 'Can add Pre-set reply', 24, 'add_presetreply'),
(71, 'Can change Pre-set reply', 24, 'change_presetreply'),
(72, 'Can delete Pre-set reply', 24, 'delete_presetreply'),
(73, 'Can add Escalation exclusion', 25, 'add_escalationexclusion'),
(74, 'Can change Escalation exclusion', 25, 'change_escalationexclusion'),
(75, 'Can delete Escalation exclusion', 25, 'delete_escalationexclusion'),
(76, 'Can add e-mail template', 26, 'add_emailtemplate'),
(77, 'Can change e-mail template', 26, 'change_emailtemplate'),
(78, 'Can delete e-mail template', 26, 'delete_emailtemplate'),
(79, 'Can add Knowledge base category', 27, 'add_kbcategory'),
(80, 'Can change Knowledge base category', 27, 'change_kbcategory'),
(81, 'Can delete Knowledge base category', 27, 'delete_kbcategory'),
(82, 'Can add Knowledge base item', 28, 'add_kbitem'),
(83, 'Can change Knowledge base item', 28, 'change_kbitem'),
(84, 'Can delete Knowledge base item', 28, 'delete_kbitem'),
(85, 'Can add Saved search', 29, 'add_savedsearch'),
(86, 'Can change Saved search', 29, 'change_savedsearch'),
(87, 'Can delete Saved search', 29, 'delete_savedsearch'),
(88, 'Can add User Setting', 30, 'add_usersettings'),
(89, 'Can change User Setting', 30, 'change_usersettings'),
(90, 'Can delete User Setting', 30, 'delete_usersettings'),
(91, 'Can add Ignored e-mail address', 31, 'add_ignoreemail'),
(92, 'Can change Ignored e-mail address', 31, 'change_ignoreemail'),
(93, 'Can delete Ignored e-mail address', 31, 'delete_ignoreemail'),
(94, 'Can add ticket cc', 32, 'add_ticketcc'),
(95, 'Can change ticket cc', 32, 'change_ticketcc'),
(96, 'Can delete ticket cc', 32, 'delete_ticketcc'),
(97, 'Can add Custom field', 33, 'add_customfield'),
(98, 'Can change Custom field', 33, 'change_customfield'),
(99, 'Can delete Custom field', 33, 'delete_customfield'),
(100, 'Can add Ticket custom field value', 34, 'add_ticketcustomfieldvalue'),
(101, 'Can change Ticket custom field value', 34, 'change_ticketcustomfieldvalue'),
(102, 'Can delete Ticket custom field value', 34, 'delete_ticketcustomfieldvalue'),
(103, 'Can add Ticket dependency', 35, 'add_ticketdependency'),
(104, 'Can change Ticket dependency', 35, 'change_ticketdependency'),
(105, 'Can delete Ticket dependency', 35, 'delete_ticketdependency');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$20000$YXuSaWLk8l1Q$pcWY5w7I0/aUjz647m5Ed4ewu0pn9p1xDSsKtUR1o9s=', '2016-01-21 22:22:18.878081', 1, 'tola', 'Joash', '', 'amembaj@gmail.com', 1, 1, '2015-10-18 23:38:16.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'admin', 'logentry'),
(2, 'auth', 'group'),
(1, 'auth', 'permission'),
(3, 'auth', 'user'),
(4, 'contenttypes', 'contenttype'),
(10, 'default', 'association'),
(11, 'default', 'code'),
(9, 'default', 'nonce'),
(8, 'default', 'usersocialauth'),
(23, 'helpdesk', 'attachment'),
(33, 'helpdesk', 'customfield'),
(16, 'helpdesk', 'documentationapp'),
(26, 'helpdesk', 'emailtemplate'),
(25, 'helpdesk', 'escalationexclusion'),
(18, 'helpdesk', 'faq'),
(17, 'helpdesk', 'feedback'),
(21, 'helpdesk', 'followup'),
(31, 'helpdesk', 'ignoreemail'),
(27, 'helpdesk', 'kbcategory'),
(28, 'helpdesk', 'kbitem'),
(24, 'helpdesk', 'presetreply'),
(19, 'helpdesk', 'queue'),
(29, 'helpdesk', 'savedsearch'),
(20, 'helpdesk', 'ticket'),
(32, 'helpdesk', 'ticketcc'),
(22, 'helpdesk', 'ticketchange'),
(34, 'helpdesk', 'ticketcustomfieldvalue'),
(35, 'helpdesk', 'ticketdependency'),
(30, 'helpdesk', 'usersettings'),
(14, 'report_builder', 'displayfield'),
(15, 'report_builder', 'filterfield'),
(13, 'report_builder', 'format'),
(12, 'report_builder', 'report'),
(5, 'sessions', 'session'),
(6, 'sites', 'site');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2016-01-21 21:59:53.454695'),
(2, 'auth', '0001_initial', '2016-01-21 21:59:53.781979'),
(3, 'admin', '0001_initial', '2016-01-21 21:59:53.879146'),
(4, 'contenttypes', '0002_remove_content_type_name', '2016-01-21 21:59:54.045605'),
(5, 'auth', '0002_alter_permission_name_max_length', '2016-01-21 21:59:54.440357'),
(6, 'auth', '0003_alter_user_email_max_length', '2016-01-21 21:59:54.484143'),
(7, 'auth', '0004_alter_user_username_opts', '2016-01-21 21:59:54.511853'),
(8, 'auth', '0005_alter_user_last_login_null', '2016-01-21 21:59:54.570338'),
(9, 'auth', '0006_require_contenttypes_0002', '2016-01-21 21:59:54.572883'),
(10, 'default', '0001_initial', '2016-01-21 21:59:54.886376'),
(11, 'default', '0002_add_related_name', '2016-01-21 21:59:54.947353'),
(12, 'default', '0003_alter_email_max_length', '2016-01-21 21:59:54.978681'),
(13, 'helpdesk', '0001_initial', '2016-01-21 21:59:57.481693'),
(14, 'helpdesk', '0002_auto_20150902_1446', '2016-01-21 21:59:58.421038'),
(15, 'helpdesk', '0003_auto_20150928_1004', '2016-01-21 21:59:58.847953'),
(16, 'helpdesk', '0004_auto_20160119_1520', '2016-01-21 21:59:59.237096'),
(17, 'report_builder', '0001_initial', '2016-01-21 22:00:00.090218'),
(18, 'report_builder', '0002_auto_20150201_1809', '2016-01-21 22:00:00.936537'),
(19, 'sessions', '0001_initial', '2016-01-21 22:00:00.990645'),
(20, 'sites', '0001_initial', '2016-01-21 22:00:01.039448');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('mi8blkgsa2yb09v8eolh7jsu8kor88yo', 'MGFkZjkyODgzMDUxZWQzMjZjYzY0ZGY3NzEwMWUyM2JlY2VhMWM1ZTp7Il9hdXRoX3VzZXJfaGFzaCI6IjJhNTU1MzI3ODhiYTVlZDlmYjMxYmRkZmRjMjgxNDFmYmZjYWQ2MzEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2016-02-04 22:22:18.880776');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_attachment`
--

CREATE TABLE IF NOT EXISTS `helpdesk_attachment` (
  `id` int(11) NOT NULL,
  `file` varchar(1000) NOT NULL,
  `filename` varchar(1000) NOT NULL,
  `mime_type` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `followup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_customfield`
--

CREATE TABLE IF NOT EXISTS `helpdesk_customfield` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(30) NOT NULL,
  `help_text` longtext,
  `data_type` varchar(100) NOT NULL,
  `max_length` int(11) DEFAULT NULL,
  `decimal_places` int(11) DEFAULT NULL,
  `empty_selection_list` tinyint(1) NOT NULL,
  `list_values` longtext,
  `ordering` int(11) DEFAULT NULL,
  `required` tinyint(1) NOT NULL,
  `staff_only` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_documentationapp`
--

CREATE TABLE IF NOT EXISTS `helpdesk_documentationapp` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `documentation` longtext,
  `create_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_emailtemplate`
--

CREATE TABLE IF NOT EXISTS `helpdesk_emailtemplate` (
  `id` int(11) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `heading` varchar(100) NOT NULL,
  `plain_text` longtext NOT NULL,
  `html` longtext NOT NULL,
  `locale` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_escalationexclusion`
--

CREATE TABLE IF NOT EXISTS `helpdesk_escalationexclusion` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_escalationexclusion_queues`
--

CREATE TABLE IF NOT EXISTS `helpdesk_escalationexclusion_queues` (
  `id` int(11) NOT NULL,
  `escalationexclusion_id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_faq`
--

CREATE TABLE IF NOT EXISTS `helpdesk_faq` (
  `id` int(11) NOT NULL,
  `question` longtext,
  `answer` longtext,
  `create_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_feedback`
--

CREATE TABLE IF NOT EXISTS `helpdesk_feedback` (
  `id` int(11) NOT NULL,
  `note` longtext NOT NULL,
  `page` varchar(135) NOT NULL,
  `severity` varchar(135) NOT NULL,
  `create_date` datetime(6) DEFAULT NULL,
  `submitter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_followup`
--

CREATE TABLE IF NOT EXISTS `helpdesk_followup` (
  `id` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `comment` longtext,
  `public` tinyint(1) NOT NULL,
  `new_status` int(11) DEFAULT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `helpdesk_followup`
--

INSERT INTO `helpdesk_followup` (`id`, `date`, `title`, `comment`, `public`, `new_status`, `ticket_id`, `user_id`) VALUES
(6, '2015-09-15 23:38:34.000000', 'Ticket Opened & Assigned to Andrew Pham', 'received internal server error when attempting to merge a silo with an already existing silo.', 1, NULL, 3, 9),
(7, '2015-09-16 18:35:10.000000', 'Ticket Opened & Assigned to Andrew Pham', 'Links to form guides\r\nCommunity: https://docs.google.com/document/d/1PBjoQPdCRyrki12vv8AMPxIqOswKqzKH035_o3KSILU/edit?usp=sharing\r\n\r\nAgreement:\r\nhttps://docs.google.com/document/d/1xsHzOQ6CuWc9kNDEOHOQzYx8oZjW0zcn0DWe8Uw7ldk/edit?usp=sharing\r\n\r\nCompletion:\r\nhttps://docs.google.com/document/d/1tDwo3m1ychefNiAMr-8hCZnhEugQlt36AOyUYHlPbVo/edit?usp=sharing\r\n\r\nThere will be more Form Guides to come for Training, Distribution, C4W as we get those up on TA.', 1, NULL, 4, 9),
(8, '2015-09-16 18:44:50.000000', 'Ticket Opened', 'When adding a new indicator, the objectives that display should only reflect those associated the the program, not the country.', 1, NULL, 5, 9),
(9, '2015-09-16 19:08:52.000000', 'Ticket Opened', 'When clicking on indicator planning, each program should be displayed by default with the program box. To create new indicator, you will add using the create indicator button specific to the program.\r\n\r\nThe new indicator screen should then populate the "program" field for you.\r\n\r\nAlso reorder the "program" field to the very top of the "Performance" tab under create new indicator.', 1, NULL, 6, 9),
(10, '2015-09-16 19:31:38.000000', 'Ticket Opened', 'Summary tab will include:\r\nProgram\r\nSector\r\nObjective\r\n\r\nIP attached for ordering reference', 1, NULL, 7, 9),
(11, '2015-09-16 21:18:25.000000', 'Ticket Opened', 'Indicator type will include:\r\n-custom\r\n-standard\r\n-alpha\r\n\r\nIndicator level:\r\n-Goal\r\n-Outcome\r\n-Output\r\n-Activity', 1, NULL, 8, 9),
(12, '2015-09-16 21:20:06.000000', 'Ticket Opened', '.', 1, NULL, 9, 9),
(13, '2015-09-17 16:20:06.000000', 'Ticket Opened', 'There are many other field names that need to be capitalized. Check Agreement field names for that.', 1, NULL, 10, 9),
(14, '2015-09-17 16:22:19.000000', 'Ticket Opened', '.', 1, NULL, 11, 9),
(15, '2015-09-17 16:23:15.000000', 'Ticket Opened', '.', 1, NULL, 12, 9),
(16, '2015-09-17 16:25:28.000000', 'Ticket Opened', 'remove "MC" to make it more generic.', 1, NULL, 13, 9),
(17, '2015-09-17 17:48:35.000000', 'Ticket Opened', '.', 1, NULL, 14, 9),
(21, '2015-09-18 22:38:33.000000', 'Ticket Opened', 'TypeError at /doMerge/\r\n''Collection'' object is not callable. If you meant to call the ''update_many'' method on a ''Collection'' object it is failing because no such method exists.\r\nRequest Method:	POST\r\nRequest URL:	https://tola-data.mercycorps.org/doMerge/\r\nDjango Version:	1.8.2\r\nException Type:	TypeError\r\nException Value:	\r\n''Collection'' object is not callable. If you meant to call the ''update_many'' method on a ''Collection'' object it is failing because no such method exists.\r\nException Location:	/usr/local/lib/python2.7/site-packages/pymongo/collection.py in __call__, line 1773\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola/htdocs'',\r\n ''/var/www/tola/htdocs/tola'',\r\n ''/var/www/tola/htdocs'']\r\nServer time:	Fri, 18 Sep 2015 15:36:40 -0700\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/var/www/tola/htdocs/silo/views.py in doMerge\r\n                        False #, False, None, True  ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/pymongo/collection.py in __call__\r\n                                    self.__name.split(".")[-1]) ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nVariable	Value\r\n_id	\r\nu''_id''\r\ncreate_date	\r\nu''create_date''\r\nstart_time	\r\nu''start_time''\r\nprofile_con/establish_date	\r\nu''profile_con/establish_date''\r\nto_silo_id	\r\nu''17''\r\nfrom_silo_id	\r\nu''18''\r\nend_time	\r\nu''end_time''\r\ndevice_id	\r\nu''device_id''\r\nmeta/instanceName	\r\nu''meta/instanceName''', 1, NULL, 18, 5),
(24, '2015-09-21 16:48:40.000000', 'Ticket Opened & Assigned to Emily Sinn', 'Add link to Tola Activity for Tola Help so users can easily go to Tola Help to submit an issue', 1, NULL, 21, 5),
(25, '2015-09-22 21:48:19.000000', 'Closed', '', 1, 4, 14, 2),
(26, '2015-09-23 06:56:17.000000', 'Ticket Opened Via Web', 'Similar to budget pop-up', 1, NULL, 22, NULL),
(27, '2015-09-23 06:57:20.000000', 'Ticket Opened Via Web', 'document form should have both URL link and upload document', 1, NULL, 23, NULL),
(28, '2015-09-23 07:00:17.000000', 'Ticket Opened Via Web', 'This should be similar to the Print Grid/View that displays in the Program Dashboard', 1, NULL, 24, NULL),
(29, '2015-09-23 07:01:21.000000', 'Ticket Opened Via Web', '.', 1, NULL, 25, NULL),
(30, '2015-09-23 07:02:17.000000', 'Ticket Opened Via Web', '.', 1, NULL, 26, NULL),
(31, '2015-09-23 07:04:04.000000', 'Ticket Opened Via Web', 'per Brandy''s request changing BoQ to Project Budget', 1, NULL, 27, NULL),
(32, '2015-09-23 07:06:01.000000', 'Ticket Opened Via Web', '.', 1, NULL, 28, NULL),
(33, '2015-09-23 07:07:16.000000', 'Ticket Opened Via Web', 'Change from "What is the effect or impact" to What is the anticipated Outcome or Goal"', 1, NULL, 29, NULL),
(34, '2015-09-23 07:09:33.000000', 'Ticket Opened Via Web', 'Under Project Agreement > Project Planning', 1, NULL, 30, NULL),
(35, '2015-09-23 07:10:59.000000', 'Ticket Opened Via Web', 'to "Description of Stakeholder Selection Criteria"', 1, NULL, 31, NULL),
(36, '2015-09-23 07:13:07.000000', 'Ticket Opened Via Web', '.', 1, NULL, 32, NULL),
(37, '2015-09-23 07:13:48.000000', 'Ticket Opened Via Web', '.', 1, NULL, 33, NULL),
(38, '2015-09-23 07:15:33.000000', 'Ticket Opened Via Web', 'move "Evaluate" and "Monitoring" fields from "Project Planning" to this tab.', 1, NULL, 34, NULL),
(39, '2015-09-23 07:16:57.000000', 'Ticket Opened Via Web', 'Add "Field Verification By" under approval tab', 1, NULL, 35, NULL),
(40, '2015-09-25 13:12:34.000000', 'Closed', '', 1, 4, 4, 2),
(41, '2015-09-25 13:13:03.000000', 'Resolved', '', 1, 3, 8, 2),
(42, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 7, 2),
(43, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 9, 2),
(44, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 11, 2),
(45, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 22, 2),
(46, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 23, 2),
(47, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 24, 2),
(48, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 25, 2),
(49, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 26, 2),
(50, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 27, 2),
(51, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 28, 2),
(52, '2015-09-25 13:14:48.000000', 'Closed in bulk update', NULL, 0, 4, 30, 2),
(53, '2015-09-25 13:15:41.000000', 'Closed in bulk update', NULL, 1, 4, 32, 2),
(54, '2015-09-25 13:15:41.000000', 'Closed in bulk update', NULL, 1, 4, 33, 2),
(55, '2015-09-25 13:15:41.000000', 'Closed in bulk update', NULL, 1, 4, 34, 2),
(56, '2015-09-25 13:15:41.000000', 'Closed in bulk update', NULL, 1, 4, 35, 2),
(57, '2015-09-28 02:20:43.000000', 'Ticket Opened Via Web', 'Under the Reports tab on the banner bar in Tola Activity when Indicator Data Report tab is clicked an error message is returned, see attached screen shot. Thanks! ', 1, NULL, 36, NULL),
(58, '2015-09-28 19:59:18.000000', 'Resolved', '', 1, 3, 36, 11),
(59, '2015-09-28 23:01:29.000000', 'Closed', '', 1, 4, 6, 11),
(60, '2015-09-28 23:01:49.000000', 'Closed', '', 1, 4, 8, 11),
(61, '2015-09-28 23:21:06.000000', 'Closed', '', 1, 4, 36, 11),
(62, '2015-09-29 16:12:01.000000', 'Closed', '', 1, 4, 31, 11),
(63, '2015-09-29 16:12:21.000000', 'Closed', '', 1, 4, 29, 11),
(64, '2015-09-29 16:12:42.000000', 'Closed', '', 1, 4, 13, 11),
(65, '2015-09-29 16:13:37.000000', 'Closed', '', 1, 4, 10, 11),
(66, '2015-09-29 18:42:43.000000', 'Ticket Opened', 'I get this error when I click on the dashboard in Tola Help\r\nAttributeError at /helpdesk/dashboard/\r\n''dict'' object has no attribute ''state''\r\nRequest Method:	GET\r\nRequest URL:	http://tola.work/helpdesk/dashboard/\r\nDjango Version:	1.8.2\r\nException Type:	AttributeError\r\nException Value:	\r\n''dict'' object has no attribute ''state''\r\nException Location:	/home/django/tola-help/helpdesk/views/staff.py in dashboard, line 72\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/home/django/tola-help'',\r\n ''/home/django/tola-help/tola-help'',\r\n ''/usr/local/bin'',\r\n ''/usr/lib/python2.7'',\r\n ''/usr/lib/python2.7/plat-x86_64-linux-gnu'',\r\n ''/usr/lib/python2.7/lib-tk'',\r\n ''/usr/lib/python2.7/lib-old'',\r\n ''/usr/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/dist-packages'',\r\n ''/usr/lib/python2.7/dist-packages'',\r\n ''/home/django/tola-help/project'',\r\n ''/home/django/tola-help'']\r\nServer time:	Tue, 29 Sep 2015 11:41:47 -0700\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/dist-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/dist-packages/django/contrib/auth/decorators.py in _wrapped_view\r\n                            return view_func(request, *args, **kwargs) ...\r\n? Local vars\r\n/home/django/tola-help/helpdesk/views/staff.py in dashboard\r\n                        if github_status.state == "open" and ticket.status != 1: ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nNo POST data\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\ncsrftoken	\r\n''Ue7RcTKmbrMIo2o6FpPAH65u2BYdwGtD''\r\nsessionid	\r\n''omzsiths85fuobbmck6vr9s0eqq9q8v5''\r\nMETA\r\nVariable	Value\r\nHTTP_REFERER	\r\n''http://tola.work/''\r\nSERVER_SOFTWARE	\r\n''gunicorn/19.3.0''\r\nSCRIPT_NAME	\r\nu''''\r\nREQUEST_METHOD	\r\n''GET''\r\nPATH_INFO	\r\nu''/helpdesk/dashboard/''\r\nSERVER_PROTOCOL	\r\n''HTTP/1.0''\r\nQUERY_STRING	\r\n''''\r\nHTTP_USER_AGENT	\r\n''Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36''\r\nHTTP_CONNECTION	\r\n''close''\r\nHTTP_COOKIE	\r\n''sessionid=omzsiths85fuobbmck6vr9s0eqq9q8v5; csrftoken=Ue7RcTKmbrMIo2o6FpPAH65u2BYdwGtD''\r\nSERVER_NAME	\r\n''127.0.0.1''\r\nREMOTE_ADDR	\r\n''127.0.0.1''\r\nwsgi.url_scheme	\r\n''http''\r\nSERVER_PORT	\r\n''9000''\r\nREMOTE_PORT	\r\n''50414''\r\nwsgi.input	\r\n<gunicorn.http.body.Body object at 0x7f43be1df110>\r\nHTTP_HOST	\r\n''tola.work''\r\nwsgi.multithread	\r\nTrue\r\nHTTP_UPGRADE_INSECURE_REQUESTS	\r\n''1''\r\nHTTP_ACCEPT	\r\n''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\r\nwsgi.version	\r\n(1, 0)\r\nRAW_URI	\r\n''/helpdesk/dashboard/''\r\nwsgi.run_once	\r\nFalse\r\nwsgi.errors	\r\n<gunicorn.http.wsgi.WSGIErrorsWrapper object at 0x7f43be1df2d0>\r\nwsgi.multiprocess	\r\nTrue\r\nHTTP_ACCEPT_LANGUAGE	\r\n''en-US,en;q=0.8''\r\ngunicorn.socket	\r\n<socket at 0x7f43be33d550 fileno=14 sock=127.0.0.1:9000 peer=127.0.0.1:50414>\r\nHTTP_X_FORWARDED_FOR	\r\n''67.170.137.248''\r\nwsgi.file_wrapper	\r\n''''\r\nCSRF_COOKIE	\r\nu''Ue7RcTKmbrMIo2o6FpPAH65u2BYdwGtD''\r\nHTTP_ACCEPT_ENCODING	\r\n''gzip, deflate, sdch''\r\nSettings\r\nUsing settings module project.settings.local\r\nSetting	Value\r\nSECURE_BROWSER_XSS_FILTER	\r\nFalse\r\nUSE_THOUSAND_SEPARATOR	\r\nFalse\r\nCSRF_COOKIE_SECURE	\r\nFalse\r\nLANGUAGE_CODE	\r\n''en-us''\r\nROOT_URLCONF	\r\n''project.urls''\r\nMANAGERS	\r\n((''django'', ''django@mercycorps.org''),)\r\nSILENCED_SYSTEM_CHECKS	\r\n[]\r\nDEFAULT_CHARSET	\r\n''utf-8''\r\nSESSION_SERIALIZER	\r\n''django.contrib.sessions.serializers.JSONSerializer''\r\nSTATIC_ROOT	\r\n''/home/django/tola-help/assets''\r\nDJANGO_ROOT	\r\n''/home/django/tola-help/project''\r\nALLOWED_HOSTS	\r\n[]\r\nMESSAGE_STORAGE	\r\n''django.contrib.messages.storage.fallback.FallbackStorage''\r\nEMAIL_SUBJECT_PREFIX	\r\n''[Django] ''\r\nSERVER_EMAIL	\r\n''root@localhost''\r\nSECURE_HSTS_SECONDS	\r\n0\r\nSTATICFILES_FINDERS	\r\n(''django.contrib.staticfiles.finders.FileSystemFinder'',\r\n ''django.contrib.staticfiles.finders.AppDirectoriesFinder'')\r\nSESSION_CACHE_ALIAS	\r\n''default''\r\nSESSION_COOKIE_DOMAIN	\r\nNone\r\nSESSION_COOKIE_NAME	\r\n''sessionid''\r\nTIME_INPUT_FORMATS	\r\n(''%H:%M:%S'', ''%H:%M:%S.%f'', ''%H:%M'')\r\nSECURE_REDIRECT_EXEMPT	\r\n[]\r\nDATABASES	\r\n{''default'': {''ATOMIC_REQUESTS'': False,\r\n             ''AUTOCOMMIT'': True,\r\n             ''CONN_MAX_AGE'': 0,\r\n             ''ENGINE'': ''django.db.backends.mysql'',\r\n             ''HOST'': ''localhost'',\r\n             ''NAME'': ''helpdesk'',\r\n             ''OPTIONS'': {},\r\n             ''PASSWORD'': u''********************'',\r\n             ''PORT'': '''',\r\n             ''TEST'': {''CHARSET'': None,\r\n                      ''COLLATION'': None,\r\n                      ''MIRROR'': None,\r\n                      ''NAME'': None},\r\n             ''TIME_ZONE'': ''UTC'',\r\n             ''USER'': ''helpdesk''}}\r\nEMAIL_SSL_KEYFILE	\r\nu''********************''\r\nFILE_UPLOAD_DIRECTORY_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_HANDLERS	\r\n(''django.core.files.uploadhandler.MemoryFileUploadHandler'',\r\n ''django.core.files.uploadhandler.TemporaryFileUploadHandler'')\r\nTEMPLATE_CONTEXT_PROCESSORS	\r\n(''django.contrib.auth.context_processors.auth'',\r\n ''django.core.context_processors.debug'',\r\n ''django.core.context_processors.i18n'',\r\n ''django.core.context_processors.media'',\r\n ''django.core.context_processors.static'',\r\n ''django.core.context_processors.tz'',\r\n ''django.contrib.messages.context_processors.messages'',\r\n ''django.core.context_processors.request'')\r\nDEFAULT_CONTENT_TYPE	\r\n''text/html''\r\nAPPEND_SLASH	\r\nTrue\r\nFIRST_DAY_OF_WEEK	\r\n0\r\nDATABASE_ROUTERS	\r\n[]\r\nDEFAULT_TABLESPACE	\r\n''''\r\nLOCAL_APPS	\r\n(''project'', ''helpdesk'')\r\nYEAR_MONTH_FORMAT	\r\n''F Y''\r\nSTATICFILES_STORAGE	\r\n''django.contrib.staticfiles.storage.StaticFilesStorage''\r\nCACHES	\r\n{''default'': {''BACKEND'': ''django.core.cache.backends.locmem.LocMemCache''}}\r\nSESSION_COOKIE_PATH	\r\n''/''\r\nSECURE_CONTENT_TYPE_NOSNIFF	\r\nFalse\r\nMIDDLEWARE_CLASSES	\r\n(''django.middleware.common.CommonMiddleware'',\r\n ''django.contrib.sessions.middleware.SessionMiddleware'',\r\n ''django.middleware.csrf.CsrfViewMiddleware'',\r\n ''django.contrib.auth.middleware.AuthenticationMiddleware'',\r\n ''django.contrib.auth.middleware.RemoteUserMiddleware'',\r\n ''django.contrib.messages.middleware.MessageMiddleware'',\r\n ''django.middleware.clickjacking.XFrameOptionsMiddleware'')\r\nUSE_I18N	\r\nTrue\r\nTHOUSAND_SEPARATOR	\r\n'',''\r\nSECRET_KEY	\r\nu''********************''\r\nLANGUAGE_COOKIE_NAME	\r\n''django_language''\r\nDEFAULT_INDEX_TABLESPACE	\r\n''''\r\nLOGGING_CONFIG	\r\n''logging.config.dictConfig''\r\nTEMPLATE_LOADERS	\r\n(''django.template.loaders.filesystem.Loader'',\r\n ''django.template.loaders.app_directories.Loader'')\r\nWSGI_APPLICATION	\r\n''project.wsgi.application''\r\nTEMPLATE_DEBUG	\r\nTrue\r\nX_FRAME_OPTIONS	\r\n''SAMEORIGIN''\r\nAUTHENTICATION_BACKENDS	\r\n(''social.backends.google.GoogleOAuth2'',\r\n ''django.contrib.auth.backends.ModelBackend'')\r\nSOCIAL_AUTH_GOOGLE_OAUTH2_SECRET	\r\nu''********************''\r\nFORCE_SCRIPT_NAME	\r\nNone\r\nUSE_X_FORWARDED_HOST	\r\nFalse\r\nEMAIL_TIMEOUT	\r\nNone\r\nSECURE_SSL_HOST	\r\nNone\r\nSIGNING_BACKEND	\r\n''django.core.signing.TimestampSigner''\r\nSESSION_COOKIE_SECURE	\r\nFalse\r\nCSRF_COOKIE_DOMAIN	\r\nNone\r\nFILE_CHARSET	\r\n''utf-8''\r\nDEBUG	\r\nTrue\r\nLANGUAGE_COOKIE_DOMAIN	\r\nNone\r\nDEFAULT_FILE_STORAGE	\r\n''django.core.files.storage.FileSystemStorage''\r\nINSTALLED_APPS	\r\n(''django.contrib.auth'',', 1, NULL, 37, 5),
(67, '2015-09-30 13:22:07.000000', 'Ticket Opened Via Web', 'Created a new issue from Mashal''s issue here. The previous conversation posted below:\r\n\r\nHi Mashal, I see that when you add a new document here (either as a link or upload) it doesn''t display on the page. Let me see if I can find a more suitable place to store these and so we can keep them "live" as we update them.\r\n\r\nI''ll move this to a new issue.\r\n\r\nGreg - Do you think we can embed hackpad into the documentation page and we can display the form guides there?', 1, NULL, 38, NULL),
(68, '2015-10-01 13:47:04.000000', 'Ticket Opened Via Web', 'The pop up window doesnt display to add document, just grayed out. Tested in Chrome and Safari.\r\n\r\n', 1, NULL, 39, NULL),
(69, '2015-10-02 02:35:48.000000', 'Ticket Opened Via Web', 'In Tola Activity, on the Indicator Planning page when the "Import Indicators" is clicked the attached "Page not found" message is returned. Thanks for the fix! ', 1, NULL, 40, NULL),
(70, '2015-10-05 08:24:36.000000', 'Ticket Opened', 'GAIT ID: 6493', 1, NULL, 41, 9),
(71, '2015-10-07 06:31:10.000000', 'Ticket Opened Via Web', 'i want to remove the duplicate entered community, but the delete option is not working.', 1, NULL, 42, NULL),
(72, '2015-10-07 19:33:36.000000', 'Closed', 'Fixed', 1, 4, 42, 11),
(73, '2015-10-07 22:12:53.000000', 'Resolved', 'INTAJ was a new program, had to rerun the script to load it.', 1, 3, 41, 11),
(74, '2015-10-08 05:21:48.000000', 'Ticket Opened Via Web', 'most of our community forms are lost (INVEST in Kandahar-Program),which were linked with the PAs, the list are bellow would you please restore them back.\r\n\r\nDistricts:-\r\n1 Mirwais Mina\r\n2 Aino Mina\r\n3 Kabul Shah\r\n4 Ghazi Abdullah Khan', 1, NULL, 43, NULL),
(75, '2015-10-08 05:28:22.000000', 'Ticket Opened Via Web', 'as i already report this issue that the GPS point in community profile does not accept the decimal degree, based on Greg recommendation we used other browser instead of Chorme which was working but the problem is that, for most of our programs location the GPS point is not working within any internet browses. ', 1, NULL, 44, NULL),
(76, '2015-10-08 23:18:16.000000', 'Resolved', 'I believe this data was entered on the demo server and not the production server', 1, 3, 43, 11),
(77, '2015-10-08 23:27:56.000000', 'Comment', 'Appears to work still on all browsers.  Maybe we could get clarification on what specific community you are seeing this problem on.', 1, NULL, 44, 11),
(78, '2015-10-08 23:28:12.000000', 'Closed', 'Accepted resolution and closed ticket', 1, 4, 41, 11),
(79, '2015-10-08 23:28:36.000000', 'Closed', '', 1, 4, 40, 11),
(80, '2015-10-08 23:57:46.000000', 'Assigned to glind', '', 1, NULL, 44, 11),
(82, '2015-10-12 11:14:56.000000', 'Ticket Opened', 'Currently changes can be made to all the forms (community profile, PAs etc.) even after approval. \r\nThere should not be any option to update approved forms. Forms should be pdf-ed/locked.', 1, NULL, 46, 6),
(83, '2015-10-12 12:40:01.000000', 'Ticket Opened Via Web', 'My profile page is generating the following error:\r\n\r\nPage not found (404)\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/accounts/profile/\r\nRaised by:	tola.views.profile\r\nNo UserProfile matches the given query.\r\nYou''re seeing this error because you have DEBUG = True in your Django settings file. Change that to False, and Django will display a standard 404 page.', 1, NULL, 47, NULL),
(84, '2015-10-12 13:25:53.000000', 'Comment', 'Who''s profile is not updating?  Is it this one : nnajjar@lb.mercycorps.org?\r\n\r\nI don''t see a profile for nnajjar in Tola Activity.  Is this a current active profile that has had access in the past and no longer displays.  Can you log in to the hub and connect with it?', 1, NULL, 47, 11),
(85, '2015-10-12 13:26:03.000000', 'Assigned to glind', '', 1, NULL, 47, 11),
(86, '2015-10-12 13:42:02.000000', 'Closed', '', 1, 4, 3, 11),
(87, '2015-10-12 13:43:17.000000', 'Comment', 'We actually need both program and country objectives for an indicator.  Soaring them at the highest level (country) makes the most sense.  ', 1, NULL, 5, 11),
(88, '2015-10-12 13:44:46.000000', 'Resolved', '', 1, 3, 5, 11),
(89, '2015-10-13 08:45:51.000000', 'Ticket Opened Via Web', 'I find it very challenging to quickly locate the objective related to my country and program because all active countries are shown in the objectives field when I upload a New Indicator. ', 1, NULL, 48, NULL),
(91, '2015-10-13 12:41:17.000000', 'Ticket Opened', 'Tables does not allow a period in the column name and throws an error\r\n\r\nhttps://www.dropbox.com/s/vrw5zijaacvvizj/Screenshot%202015-10-13%2005.40.14.png?dl=0', 1, NULL, 50, 11),
(92, '2015-10-13 13:01:02.000000', 'Ticket Opened', 'We need the ability to add a custom column to a table data set.  Also would like to be able to pull the values in for that column from Tola Activity (Indicator ID, Program ID, Project ID)', 1, NULL, 51, 11),
(93, '2015-10-13 13:03:05.000000', 'Ticket Opened', 'We need the ability to replace values in a column of data.  Example: Column "City Name" has the value "Prtlnd" in it and we need to replace that with "Portland"', 1, NULL, 52, 11),
(94, '2015-10-13 13:09:09.000000', 'Ticket Opened', 'Users should be able to select what columns they want to import from a CSV or Data feed before creating the new table.  We need a screen that show s a list of columns and pre-checked checkboxes that allows the user to uncheck boxes for columns they don''t want to import.', 1, NULL, 53, 11),
(95, '2015-10-17 12:46:55.000000', 'Ticket Opened', 'Filter for form only works for AF, if you switch to any other country you have to select from all provinces rather then country specific.', 1, NULL, 54, 11),
(96, '2015-10-17 12:47:36.000000', 'Comment', 'confirmed bug send to github', 1, NULL, 54, 11),
(98, '2015-10-18 09:22:46.000000', 'Ticket Opened Via Web', 'Please remove on of these', 1, NULL, 56, NULL),
(99, '2015-10-18 09:22:53.000000', 'Ticket Opened Via Web', 'Ethiopia CO has 4 Strategic objectives --> 10 Key Performance Indicators which are also tied to DIG indicators.  Some of the KPIs are also linked to project-level indicators.  Each program must have at least one KPI.  Possible on the Indicator tracking to link country-level indicators to KPI to Strategic Objective?  we are interested to track quantitative progress against KPIs/DIGs and SO.  Please see attached, first tab, columns H, M, N as an example.', 1, NULL, 57, NULL),
(100, '2015-10-18 09:27:32.000000', 'Ticket Opened Via Web', 'to support learning and documenting evidence, it is good to have how to have separate section to put evidences ', 1, NULL, 58, NULL),
(101, '2015-10-18 09:28:05.000000', 'Ticket Opened Via Web', 'Program wise indicators are not available. The error message popped out.', 1, NULL, 59, NULL),
(102, '2015-10-18 09:28:19.000000', 'Ticket Opened', 'Once the Community form data (location tab) are approved, it should be locked and cannot be changed\r\n\r\nhttps://tola-activity.mercycorps.org/activitydb/community_update/52/#location', 1, NULL, 60, 6),
(103, '2015-10-18 11:13:39.000000', 'Closed', '', 1, 4, 43, 11),
(104, '2015-10-18 13:07:33.000000', 'Ticket Opened Via Web', 'I seem to be able to login to Tola Data, but when I click profile I get an Error message - see screen shot.', 1, NULL, 61, NULL),
(105, '2015-10-18 13:08:50.000000', 'Ticket Opened Via Web', 'Hi, I cant see the geographic boundaries of Pakistan. Though I have provided you, Province, District, tehsil, Union council and Village level detail, but I would suggest that, you should atleast upload "Province, District, tehsil and union council"', 1, NULL, 62, NULL),
(106, '2015-10-18 13:49:12.000000', 'Ticket Opened Via Web', 'Hi, I am trying to associate Offices with the province. It worked well, when there is only one province. However, if the office is responsible for more than one province, then, It doesn''t work. After clicking on save this page an URL appear:\r\n\r\nhttps://tola-activity.mercycorps.org/admin/activitydb/province/add/?_to_field=id&_popup=1', 1, NULL, 63, NULL),
(107, '2015-10-19 09:53:32.000000', 'Ticket Opened', 'Users would like to filter or search for specific row/columns in there data set to edit.  We should provide them with some filters and a search function that filters the table.', 1, NULL, 64, 11),
(108, '2015-10-19 10:06:58.000000', 'Ticket Opened', 'In the edit section we want to be able to sum, divide, average a set of columns and add the result to a new column.', 1, NULL, 65, 11),
(109, '2015-10-19 13:12:10.000000', 'Ticket Opened Via Web', 'After discussion across the 5 Tola bootcamp participants related to the name of the the ''Community Profile'', it was agreed to the change the name to ''Site Profile'' as it was agreed that it was more representative of the data entered into that form.', 1, NULL, 66, NULL),
(110, '2015-10-19 13:24:19.000000', 'Ticket Opened Via Web', 'In Approvals, the dropdown lists - ''Estimated by'', ''Field Verification by'', ''Finance Review By'' - and others, display everyone registered into Tola-Activity. It would be better if a country specific filter is tied to these dropdown lists so that someone sees only people in their country instead of displaying everyone. ', 1, NULL, 67, NULL),
(111, '2015-10-20 07:50:44.000000', 'Ticket Opened & Assigned to Greg Lind', 'replace all occurrences of MC or Mercy Corps with the Organizational name global configuration.', 1, NULL, 68, 11),
(112, '2015-10-20 10:18:15.000000', 'Ticket Opened Via Web', 'I have just attempted to merge two CSV files. After telling Tola Tables what tables I wanted to merge "from" and "to" I went through the process of matching up data fields.\r\n\r\nFor example, I merged the variable "form_b_full_time" (Liberia dataset) with the variable "TRQ_3,1_full_time_job" (Kenya dataset). Both of these variables have 2 response options: YES, NO and y, n. \r\n\r\nBut, when I exported the merged table back into a CVS file (so that I could view what happened) it appears that instead of merging Liberia''s data with Kenya''s, it deleted Liberia''s data. I checked this with some other variables (age, full name) and saw the same pattern. I counted the number of columns in Kenya''s and Liberia''s data set (total 105). When adding the 4 columns that are automatically generated when you merge two data sets in Tola Tables this leaves 109 columns...which is exactly the number of columns that were in the exported CSV file (of the merged Tola Tables). So I think it is fair to conclude that no columns were merged and instead the Liberia data that was supposed to merge into the Kenya dataset was deleted.  \r\n\r\nI am not really sure what was supposed to happen, but I am guessing this is not it! \r\n\r\nI am going to send Greg a follow-up email concerning this issue (as we are both in Kenya at the Tola training) so that we can resolve this in person. I just wanted to create a ticket concerning this issue for documentation purposes.\r\n\r\nThank you!\r\n\r\nJill', 1, NULL, 69, NULL),
(113, '2015-10-21 05:19:01.000000', 'Ticket Opened Via Web', '1- once the project is getting approved by PM after clicking back in to the dashboard the status change back to progress.\r\n\r\n2- in print view> Project form> approval section authority title is getting change (refer to screen shoot)', 1, NULL, 70, NULL),
(114, '2015-10-21 12:36:35.000000', 'Ticket Opened Via Web', 'We have a indicator, which got three different evidence. And the system has adding a only one option.\r\n', 1, NULL, 71, NULL),
(115, '2015-10-21 13:20:22.000000', 'Ticket Opened Via Web', 'When I am adding evidence under data in the indicator planning and I click save it gives the following error: indicator instance with collected data 208L does not exist.  Refer to the screen shot.', 1, NULL, 72, NULL),
(116, '2015-10-21 13:23:05.000000', 'Ticket Opened Via Web', 'Tried to deleted a Document which had been uploaded in duplication, and got an error message', 1, NULL, 73, NULL),
(117, '2015-10-21 13:47:46.000000', 'Ticket Opened Via Web', 'Could you please add file as another column in collected indicator data,so that we can be able to identify two separate files for one indicators', 1, NULL, 74, NULL),
(118, '2015-10-22 06:29:39.000000', 'Assigned to glind', '', 1, NULL, 72, 11),
(119, '2015-10-22 06:29:56.000000', 'Assigned to glind', '', 1, NULL, 73, 11),
(120, '2015-10-22 07:59:59.000000', 'Closed', 'The two separate files should be added to different collected data submissions rather then one.  This allows for accurate counts of each file.', 1, 4, 74, 11),
(121, '2015-10-22 08:12:03.000000', 'Ticket Opened', 'The suggested fields are as follows:\r\n1. Site name (required):\r\n2. Country (required) (drop-down menu):\r\n3. Administrative level 1 (required) (hint: province, region) (drop-down menu):\r\n4. Administrative level 2 (hint: district) (drop-down menu):\r\n5. Administrative level 3 (hint: village) (drop-down menu):\r\n6. Latitude:\r\n7. Longitude:\r\n8. Locality type (required) (options: a. urban, b. peri-urban c. rural)\r\n\r\nDemographic information (optional)\r\nhttps://tola-activity.mercycorps.org/activitydb/community_add#for-geographic-communities\r\nXX. (All the fields in the ''geographic communities'' tab in the current community profile form)\r\nXX. Data source for demographic information (required field if any of the demographic info is added):', 1, NULL, 75, 6),
(122, '2015-10-22 08:12:29.000000', 'Ticket Opened Via Web', 'Stakeholder Profile Form. Proposed fields are described in the attached word doc with field titles and suggested description of field format. \r\n\r\n\r\n', 1, NULL, 76, NULL),
(123, '2015-10-22 10:28:51.000000', 'Ticket Opened', 'New screen should include default checklist items Project Sites, Agreement, Complete as defaults and country specific customizable checklists.', 1, NULL, 77, 11),
(124, '2015-10-22 10:36:40.000000', 'Closed', 'Added to Production', 1, 4, 62, 11),
(125, '2015-10-22 11:03:50.000000', 'Assigned to glind', '', 1, NULL, 76, 11),
(126, '2015-10-22 16:42:18.000000', 'Ticket Opened', 'Report filters:\r\n    Date: from... to...\r\n    Program\r\n    Indicators\r\n    Disaggregation\r\n\r\nReport format:\r\n1. Program\r\n2. Date: from... to...\r\n3. Beneficiary map\r\n4. Select Indicator (drop down): a) charts showing target vs. actual\r\n                                                   b) charts: selected indicator dissagregation with actuals\r\n                                                   c) graph of selected indicators on a timeline\r\n\r\n5. Financial data: (chart) activity level budget vs actual\r\n6. Lessons learned (list the lessons learned recorded during the period)', 1, NULL, 78, 6),
(127, '2015-10-23 11:43:17.000000', 'Ticket Opened Via Web', 'When looking at the summary of projects on Tola Activity Dashboard, it would be nice to be able to filter through the projects.  For example, look at projects that are on vocational training or sort by financial projects.', 1, NULL, 79, NULL),
(128, '2015-10-23 13:10:30.000000', 'Ticket Opened Via Web', 'Tate requested to have the option to sort the columns and filter by activity code within the Program Dashboard page. This would allow managers to customize the data displayed based on what is the priority for them.  ', 1, NULL, 80, NULL),
(129, '2015-10-23 13:12:27.000000', 'Ticket Opened', 'The Project checklist should include:\r\n1. Identify program (drop down)\r\n2. Name of project (text field)\r\n3. Display project checklist\r\ni) Review Site profile and Add \r\nii) Review Partner/Stakeholder profile and Add as applicable\r\niii) Review Indicator plan and Add indicators\r\niv) Create Project Agreement\r\nv) Identify monitoring forms and add \r\nvi) Create Project completion forms', 1, NULL, 81, 6),
(130, '2015-10-23 14:23:41.000000', 'Ticket Opened Via Web', 'Checklist Form Guide should include: \r\n\r\n-Site Profile added and approved\r\n-Stakeholder Profile added and approved\r\n-Indicators TvA at project level linked to evidence and reviewed for accuracy, matches with actuals reported in the evidence file. \r\n-All related documents are updated to completion date. (Who is assigned to do this review?? Responsible for DQA, field added to completion form?)\r\n-Monitoring Forms are added\r\n-Dashboard linked (check with Greg on process) \r\n-Review Project Completion Form with approvals\r\n	-Budget v Actuals, verify variances with finance\r\n        -Ensure lessons learned is documented with appropriate stakeholders giving input and disseminated. ', 1, NULL, 82, NULL),
(131, '2015-10-24 10:01:27.000000', 'Ticket Opened', 'Tab: Executive summary\r\n- Activity code field: Add hint: Format is defined by HQ Finance. Activity code is assigned at the time of Project agreement by program or MEL (maybe different by country) and that number is then provided to finance. \r\n- Sector: to be standardized across the organization \r\n\r\nTab: Community proposal\r\n- Change tab name from ''community proposal'' to ''community contact information''\r\n- Change ''community representative contact'' to ''organizational contact''\r\n\r\nTab: Budget\r\n- Budget currency: add option for Euro and GBP\r\n- Change budget tab to only include: Total Project Budget, Mercy Corps’ portion of total project budget, exchange rate, dates, account code and lin code; Hide other budget contributions \r\n\r\nTab: Justification and budget\r\n- MC strategic objective; should be dropdown\r\n- MC program objective: should be dropdown\r\n- Move up ''description of project activities''\r\n- Justification/Stakeholder involvement (community, partner, government etc.): \r\n- Change ''effect/impact'' to ''Anticipated Outcome and Goal''\r\n- Remove all other fields\r\n- Add checklist for uploading/linking full stakeholder analysis and description of deliverables\r\n\r\nMerge tabs: Planning, M&E, Project impact\r\n\r\nTab: Planning\r\n- Benchmarks: turn off for all countries other than Afghanistan \r\n- Capacity: change to ''describe how sustainability will be ensured for this project'' (add to checklist as documentation)\r\n\r\nTab: M&E\r\n- Remove ''Monitoring''\r\n- Standardize ''Evaluate'' and change name from ''evaluate'' to ''evaluation methodology''\r\n\r\nTab: Approval\r\n- Estimated by: change to Originated by\r\n- Remove approval submitted by\r\n- Remove field verification by and date\r\n- Change Approval to “Approval Status”', 1, NULL, 83, 6),
(132, '2015-10-27 07:30:58.000000', 'Ticket Opened Via Web', 'Under the Stakeholder Form stakeholder name is written as ''stakholder'' and needs to be corrected.', 1, NULL, 84, NULL),
(133, '2015-10-27 14:01:42.000000', 'Ticket Opened', 'Stakeholder profile is currently under Project dashboard. It should be moved to the menu bar with the Site Profile. \r\nStakeholder profile should be independent. And we should be able to link them to multiple PAs', 1, NULL, 85, 6),
(134, '2015-10-27 14:16:43.000000', 'Ticket Opened', 'https://tola-activity-demo.mercycorps.org/indicators/collecteddata_add/61/36/\r\n\r\n', 1, NULL, 86, 6),
(140, '2015-10-28 06:52:04.000000', 'Comment', 'We discussed this more today with the TL team and would love to see a search bar attached to the objectives list so they can be found more quickly. At the moment we are using the search function in Chrome as a workaround.', 1, NULL, 48, NULL),
(141, '2015-10-28 07:37:12.000000', 'Resolved', '', 1, 3, 86, 11),
(142, '2015-10-28 09:56:12.000000', 'Resolved', '', 1, 3, 85, 11),
(143, '2015-10-28 09:56:28.000000', 'Resolved', '', 1, 3, 84, 11),
(144, '2015-10-28 10:21:23.000000', 'Comment', 'Tab: M&E\r\n- Lets leave ''Monitoring'' as optional', 1, NULL, 83, 6),
(147, '2015-10-28 13:53:19.000000', 'Closed', '', 1, 4, 66, NULL),
(148, '2015-10-28 13:54:21.000000', 'Closed', '', 1, 4, 75, NULL),
(149, '2015-10-29 05:43:48.000000', 'Ticket Opened Via Web', 'https://tola-activity-demo.mercycorps.org/activitydb/siteprofile_add\r\n\r\nReviewed our Daily Log again to see if we''d decided on a change there. I think what we wanted to change "Community" to was "Contact" with an open text box just as you have in the stakeholder profile. Delete "Community Malik/Elder Name" and "Head of Shura/Insitutution." \r\n\r\n ', 1, NULL, 92, NULL),
(150, '2015-10-29 05:50:31.000000', 'Ticket Opened Via Web', 'The type field under the Stakeholder Profile has no options to select. I don''t see where I can define this on the Admin page either. Makes it difficult to test the form. \r\n', 1, NULL, 93, NULL),
(151, '2015-10-29 05:52:39.000000', 'Ticket Opened Via Web', 'The Timor-Leste Map shows up as the Philippines and at a very small scale on the Site Profile and the Home Dashboard page. Can you center and enlarge this tiny but very important country! \r\n\r\n', 1, NULL, 94, NULL),
(152, '2015-10-29 06:50:09.000000', 'Assigned to amembaj', '', 1, NULL, 92, NULL),
(153, '2015-10-29 09:42:50.000000', 'Closed', '', 1, 4, 92, NULL),
(154, '2015-10-29 14:46:34.000000', 'Comment', 'There is a stockholder section in the main navigation.\r\n\r\nhttps://tola-activity-demo.mercycorps.org/activitydb/stakeholder_list/0/\r\n\r\nIt includes add and edit and delete.', 1, NULL, 93, 11),
(155, '2015-10-29 14:48:38.000000', 'Closed', '', 1, 4, 83, 11),
(156, '2015-10-29 14:49:30.000000', 'Comment', 'These can be added as global checklist items to the global checklist in the admin.', 1, NULL, 82, 11),
(157, '2015-11-02 04:13:44.000000', 'Ticket Opened Via Web', 'i wanted to enter some "stakeholder" data in to Tola demo but in "type" menu there was nothing to select even i can not add it through admin and with out selecting of the type i cant save the form. would you please add it in admin.', 1, NULL, 95, NULL),
(158, '2015-11-02 23:02:43.000000', 'Comment', 'I was just in looking at Timor''s data under Indicator Planning and this program still shows up on their page too even though it''s just listed as Pakistan in GAIT.  https://tola-activity.mercycorps.org/indicators/home/0/', 1, NULL, 56, 5),
(160, '2015-11-03 00:29:53.000000', 'Ticket Opened Via Web', 'https://tola-activity.mercycorps.org/activitydb/documentation_delete/37/\r\n\r\nI want to delete one of the documents we uploaded as a test/dummy document in Activity. At the link above, when I clicked delete there was returned a "No reverse match" screen, attached here. Is it impossible to delete documents? In the future I will use the DEMO site when uploading tests?', 1, NULL, 97, NULL),
(161, '2015-11-03 00:32:10.000000', 'Ticket Opened & Assigned to Emily Sinn', 'We also discussed the following changes to the PA form in Nairobi:\r\n\r\nChange Total Estimate budget to Total Project Budget\r\nChange MC estimated budget to Mercy Corps'' portion of the Project Budget\r\nRemove currency conversion fields \r\nHide Other Budget Contributions (except for Afghanistan)\r\nJustification tab - Add checklist for uploading/linking full stakeholder analysis and description of deliverables\r\nApproval tab - change Approval to Approval Status; remove the following fields: approval submitted by, field verification by and date', 1, NULL, 98, 5),
(162, '2015-11-03 00:50:10.000000', 'Ticket Opened', 'Below are additional changes to the Project Complete form that I noted:\r\n\r\nHow/where do you add stakeholders here?\r\nSee changes to budget on PA form \r\nHide other budget contributions \r\nJustifications - consolidate two fields to "description of key stakeholder involvement); also this tab needs to be retitled - title doesn''t match the section\r\nImpact - change "what capacity was built to ensure sustainability" to "describe how sustainability was ensured for this project?"\r\nAdd to impact tab - how was quality assured for this project?\r\nRemove community handover/maintenance check box (will add to project completion checklist)', 1, NULL, 99, 5),
(163, '2015-11-03 05:57:52.000000', 'Ticket Opened Via Web', 'Overall, I am a big fan of the simplified PA that we''ve come up with. It feels more flexible and manageable. Below are a list problems or enhancements I noticed in the current version of the Project Agreement in tola-activity-demo, tab by tab: \r\n\r\nGeneral\r\n1. Change the green "Save" button to "Save & Next". This should save and push to the next tab in the agreement so that user knows their entered information is safe. \r\n2. At the moment, entered information is lost each time "Save" button is clicked. The exception are for required fields and for what is entered in the pop-up boxes that result when you add monitoring, benchmarking, quantitative outputs, budget contributions. \r\n\r\nExecutive Summary\r\n1. Project Type hint: delete "Please refer to Form 05 - Project Progress Summary" and add "Use these to tag your project by program specific sectors"\r\n2. Project Other Type hint, same as 1. \r\n3. Expected duration should auto populate based on the dates entered in the Start and End fields just above. Can we also flag on the program/home dashboard any agreements that have exceeded their expected duration? \r\n\r\nBudgets\r\nnone\r\n\r\nJustification and Description\r\n1. To maintain a strict, clear distinction between "project" and "activity" as they live within the Tola system, I suggest changing "Description of project activities" to "Description of Project" \r\n2. Delete the "Description of Project" hint as it is still Afg specific. Replace with something broader. I suggest, "Briefly describe the day to day work you will need to do to accomplish this project activity. Include rationale for budget, scope, timeframe as well as those MC staff and other stakeholders that will be necessary to seeing this project is effectively implemented. Site any documentation/monitoring efforts that you''ll need to do before completion." \r\n3. Add to the hint under "Effect or Impact" to say "Please do not include outputs and keep less than 120 words. Describe the logic that will link this project/activity to the proposed desired outcome/goal. Note any assumptions that are critical in this logic chain." \r\n\r\nM&E\r\n1. When adding benchmarks, does it always have to be % completed? Can we have a field to enter the integer and then a drop down to select %, #? \r\n\r\nApprovals \r\n1. Change "Estimated by date" to "Data originated" (or something more smooth/clear than that...)\r\n2. Delete "Field Verification by" and "Reviewed by date"\r\n\r\nUpdate the Form Guide accordingly.\r\n\r\n', 1, NULL, 100, NULL),
(164, '2015-11-03 06:04:10.000000', 'Ticket Opened Via Web', '... where''s the second period? \r\n\r\nI''m no grammar queen but this is driving me crazy. ', 1, NULL, 101, NULL),
(165, '2015-11-03 06:09:45.000000', 'Ticket Opened Via Web', '1. The "Contact" field should be an open text box, not pre-defined "sally sue." Suggest adding the hint: "Record your primary contact''s name, title (if they are a part of an organization), phone number, address, e-mail, and other important notes, here."\r\n\r\n2.Can the Formal Agreement and Vetting/Due Diligence documentation both have hint "optional" and can the drop down be filtered through a tagging system when documents are created? ', 1, NULL, 102, NULL),
(166, '2015-11-03 08:54:19.000000', 'Ticket Opened Via Web', '.', 1, NULL, 103, NULL),
(167, '2015-11-03 08:58:56.000000', 'Ticket Opened', 'We were able to import two tables from Ona that have repeats (repeats creates two sheets in the workbook) and merge the two tables. We could view, edit the first sheet. When tried to "SHARE" and create new Google Sheet, it created the google sheet but with no data. Wondering if this has something to do with the repeats why it didn''t export?', 1, NULL, 104, 9),
(168, '2015-11-03 09:08:39.000000', 'Ticket Opened', 'Currently after merging two tables, the one you choose to merge with another, disappears. It would be good to have the option to keep an original copy.', 1, NULL, 105, 9),
(169, '2015-11-03 13:36:47.000000', 'Reopened', '', 1, 2, 2, 11),
(171, '2015-11-03 13:39:14.000000', 'Reopened', '', 1, 2, 105, 11),
(172, '2015-11-03 13:39:39.000000', 'Reopened', '', 1, 2, 104, 11),
(173, '2015-11-03 13:39:55.000000', 'Reopened', '', 1, 2, 103, 11),
(174, '2015-11-03 13:41:48.000000', 'Comment', 'Contacts are managed separately in the contacts section so they can be reusable per the original requirements.  Documents and type fields are now optional.', 1, NULL, 102, 11),
(175, '2015-11-03 13:42:13.000000', 'Reopened', '', 1, 2, 101, 11),
(176, '2015-11-03 13:43:34.000000', 'Comment', 'Please don''t add giant fix everything tickets.  It makes hard for people to vote on or discuss specific issues.', 1, NULL, 100, 11),
(177, '2015-11-03 13:43:39.000000', 'Reopened', '', 1, 2, 100, 11),
(178, '2015-11-03 13:46:35.000000', 'Comment', 'Big giant fix everything I don''t like tickets = Bad\r\n\r\nStakeholders have a section for adding new stakeholders\r\nbudget changes are being added as new issue and discussed with Finance "see comments in github issue"', 1, NULL, 99, 11),
(179, '2015-11-03 14:27:10.000000', 'Comment', 'Good observation. I''ll make sure you aren''t driven extra-crazy!', 1, NULL, 101, NULL),
(180, '2015-11-03 16:26:49.000000', 'Comment', 'Stakeholders are not part of the complete form, AF needed other budget contributions.', 1, NULL, 99, 11),
(181, '2015-11-03 16:29:31.000000', 'Reopened', '', 1, 2, 98, 11),
(182, '2015-11-03 16:30:41.000000', 'Comment', 'Type is no longer required, but for type field to show up we need to add types in the admin', 1, NULL, 95, 11),
(183, '2015-11-03 16:31:31.000000', 'Comment', 'This looks to be fixed in demo.  Not sure how though.', 1, NULL, 94, 11),
(184, '2015-11-03 16:33:06.000000', 'Reopened', '', 1, 2, 82, 11),
(185, '2015-11-03 16:54:23.000000', 'Reopened', '', 1, 2, 80, 11),
(186, '2015-11-03 16:54:47.000000', 'Reopened', '', 1, 2, 79, 11),
(187, '2015-11-03 16:56:16.000000', 'Reopened', '', 1, 2, 70, 11),
(188, '2015-11-03 16:56:31.000000', 'Reopened', '', 1, 2, 69, 11),
(189, '2015-11-03 16:56:48.000000', 'Reopened', '', 1, 2, 68, 11),
(190, '2015-11-03 22:50:12.000000', 'Ticket Opened', 'Change the order of the items when you click on Workflow in the top navigation to alphabetical order\r\n', 1, NULL, 106, 5),
(191, '2015-11-03 23:01:52.000000', 'Ticket Opened', 'Feedback from Nairobi:  \r\nAdd "data source" to means of verification on the data acquisition tab.  So it reads: Means of Verification / Data Source', 1, NULL, 107, 5),
(192, '2015-11-03 23:45:01.000000', 'Reopened', '', 1, 2, 105, 11),
(193, '2015-11-03 23:45:33.000000', 'Reopened', '', 1, 2, 104, 11),
(194, '2015-11-03 23:45:50.000000', 'Updated', '', 0, NULL, 103, 11),
(195, '2015-11-03 23:46:02.000000', 'Reopened', '', 0, 2, 103, 11),
(196, '2015-11-03 23:46:43.000000', 'Reopened', '', 1, 2, 100, 11),
(197, '2015-11-03 23:50:11.000000', 'Comment', 'This comment confuses me: 2. At the moment, entered information is lost each time "Save" button is clicked. The exception are for required fields and for what is entered in the pop-up boxes that result when you add monitoring, benchmarking, quantitative outputs, budget contributions. \r\n\r\nAre you saying that the save button does not "save" and your changes in the form are not saved?  This has not been my experience  or reported anywhere else so maybe I''m not understanding ?', 1, NULL, 100, 11),
(198, '2015-11-03 23:51:29.000000', 'Reopened', '', 1, 2, 99, 11),
(199, '2015-11-03 23:52:11.000000', 'Reopened', '', 1, 2, 98, 11),
(200, '2015-11-04 00:57:43.000000', 'Reopened', '', 1, 2, 80, 11),
(201, '2015-11-04 00:58:21.000000', 'Reopened', '', 1, 2, 78, 11),
(202, '2015-11-04 00:59:04.000000', 'Reopened', '', 1, 2, 70, 11),
(203, '2015-11-04 01:00:10.000000', 'Reopened', '', 1, 2, 69, 11),
(204, '2015-11-04 01:01:43.000000', 'Reopened', '', 1, 2, 59, 11),
(205, '2015-11-04 01:02:48.000000', 'Comment', 'This has been addressed with the new Strategic Objectives field for indicators.  New SO can be added in the Admin for each country.', 1, NULL, 57, 11),
(206, '2015-11-04 01:05:40.000000', 'Reopened', '', 1, 2, 53, 11),
(207, '2015-11-04 01:07:56.000000', 'Reopened', '', 1, 2, 52, 11),
(208, '2015-11-04 01:09:45.000000', 'Reopened', '', 1, 2, 32, 11),
(209, '2015-11-05 13:14:58.000000', 'Ticket Opened Via Web', 'I was going through the Administrative levels for Lebanon and they did not correspond to the data in the spreadsheet.  There are three levels for Lebanon 1) Governorate and they are Akkar, Baalbeck-ElHermel, Beirut, Bekaa, El-Nabatieh, Mount Lebanon, North and South.  In the current system they are different.\r\nLevel 2) is district and we have 26 districts.  in Tola demo, I think level 3 were added as level 2.\r\nLevel 3) those are the villages.  They are also provided in the spreadsheet.  in Tola no list appears.  ', 1, NULL, 108, NULL),
(210, '2015-11-05 22:41:21.000000', 'Ticket Opened', 'Currently you can''t access Tola Work from Tola Activity - problemo! Add a link under help to go directly to Tola Work. Por Favor. ', 1, NULL, 109, 5),
(211, '2015-11-06 01:14:49.000000', 'Resolved', '', 1, 3, 109, 11),
(212, '2015-11-06 01:15:45.000000', 'Comment', 'The feedback button in the footer takes you directly to Tola Work.', 1, NULL, 109, 11);
INSERT INTO `helpdesk_followup` (`id`, `date`, `title`, `comment`, `public`, `new_status`, `ticket_id`, `user_id`) VALUES
(213, '2015-11-06 01:24:11.000000', 'Comment', 'Province = Governorate and for Lebanon they are: Akkar, Baalbek-El Hermel, Beirut, Bekaa, El Nabatieh, Mount Aley, Mount Baabda, Mount Chouf, Mount El Meten, Mount Jbeil	, Mount Kesrwane, Mount Lebanon, North, South\r\n\r\nDistrict = Level 2 or District it Tola and Level 3 (villages) Is a manual entry field for Tola right now because most countries have to many Villages to populate a single drop down form field.\r\n\r\n', 1, NULL, 108, 11),
(214, '2015-11-06 18:23:59.000000', 'Ticket Opened', 'Grid view of indicators still shows individual objectives and strategic objectives', 1, NULL, 110, 11),
(215, '2015-11-07 16:01:38.000000', 'Ticket Opened', 'The Iraq team would like to use the indicator planning tool to begin tracking them there. ', 1, NULL, 111, 9),
(216, '2015-11-09 21:10:59.000000', 'Ticket Opened', 'Is it possible to filter the list of dig indicators? So once you choose either alpha or standard the drop down would filter to only those indicators?  Or perhaps be able to filter by which DIG sector they connect to?  Right now the full list of DIG indicators feels a little overwhelming to try and sort through. ', 1, NULL, 112, 5),
(217, '2015-11-09 21:15:04.000000', 'Ticket Opened', 'If I click on Indicator > Indicator Planning > scroll to the relevant program and then select Create a New Indicator, can the system pre-populate that info rather than having to reselect country and program from the drop down list on the new Indicator UI?  ', 1, NULL, 113, 5),
(218, '2015-11-09 21:17:19.000000', 'Ticket Opened', 'For example, I selected custom as my indicator type but then selected a DIG alpha indicator.  Can the system generate an error or prompt the user to change the type to DIG?', 1, NULL, 114, 5),
(219, '2015-11-09 21:20:21.000000', 'Ticket Opened', 'I selected Indicator > Indicator Planning > Create a new indicator > Type Custom > DIG (left drop down empty) > Country Timor > Program MRED \r\nAnd received the following error message:\r\n\r\nUnboundLocalError at /indicators/indicator_create/259/\r\nlocal variable ''definition'' referenced before assignment\r\nRequest Method:	POST\r\nRequest URL:	https://tola-activity-demo.mercycorps.org/indicators/indicator_create/259/\r\nDjango Version:	1.8.2\r\nException Type:	UnboundLocalError\r\nException Value:	\r\nlocal variable ''definition'' referenced before assignment\r\nException Location:	/var/www/tola-activity/htdocs/indicators/views.py in indicator_create, line 110\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Mon, 9 Nov 2015 13:18:31 -0800\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/indicators/views.py in indicator_create\r\n                    new_indicator = Indicator(country=country, owner=owner,sector=sector,name=name,source=source,definition=definition) ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nVariable	Value\r\ncountry	\r\nu''6''\r\nsubmit	\r\nu''save''\r\nindicator_type	\r\nu''1''\r\nprogram	\r\nu''254''\r\ncsrfmiddlewaretoken	\r\nu''krusSItW5g9busT4zz8EVkCAaxXReJrq''\r\nservice_indicator	\r\nu''0''\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\nkm_lv	\r\n''x''\r\noptimizelyEndUserId	\r\n''oeu1426178086900r0.33647501352243125''\r\nkm_ai	\r\n''uLTSOJN559s9yWX2ZAJnmUBswlU%3D''\r\n_ga	\r\n''GA1.2.107862919.1426178087''\r\noptimizelySegments	\r\n''%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D''\r\nkm_uq	\r\n''''\r\nsessionid	\r\n''vygr94yan4g2clod1090ziy9087yml61''\r\ncsrftoken	\r\n''krusSItW5g9busT4zz8EVkCAaxXReJrq''\r\n__utma	\r\n''185632118.107862919.1426178087.1426178087.1426287090.2''\r\noptimizelyBuckets	\r\n''%7B%222115560571%22%3A%222442901605%22%2C%222214141681%22%3A%222213931163%22%2C%222445310539%22%3A%222465270090%22%2C%222786931510%22%3A%222798370973%22%7D''\r\ncosign-tola	\r\n''oMo098Oo3DUhNISenqaPJazDKzZtX4ZcdZfZuot+nS7LO4pv0-0u079qIy7Lh5OKwk5pkL74GDZ3ruFN71zir5zu-HU1570lfeozZvDveG9764MbvgP3K0kLbbM6/1447103070''\r\nMETA\r\nVariable	Value\r\nAUTH_TYPE	\r\n''Cosign''\r\nmod_wsgi.listener_port	\r\n''443''\r\nREMOTE_REALM	\r\n''ldap''\r\nmod_wsgi.listener_host	\r\n''''\r\nSERVER_SOFTWARE	\r\n''Apache''\r\nSCRIPT_NAME	\r\nu''''\r\nmod_wsgi.enable_sendfile	\r\n''0''\r\nmod_wsgi.handler_script	\r\n''''\r\nSERVER_SIGNATURE	\r\n''<address>Apache Server at tola-activity-demo.mercycorps.org Port 443</address>\\n''\r\nREQUEST_METHOD	\r\n''POST''\r\nPATH_INFO	\r\nu''/indicators/indicator_create/259/''\r\nHTTP_ORIGIN	\r\n''https://tola-activity-demo.mercycorps.org''\r\nSERVER_PROTOCOL	\r\n''HTTP/1.1''\r\nQUERY_STRING	\r\n''''\r\nSSL_TLS_SNI	\r\n''tola-activity-demo.mercycorps.org''\r\nCOSIGN_SERVICE	\r\n''cosign-tola''\r\nCONTENT_LENGTH	\r\n''678''\r\nHTTP_USER_AGENT	\r\n''Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36''\r\nHTTP_CONNECTION	\r\n''keep-alive''\r\nHTTP_REFERER	\r\n''https://tola-activity-demo.mercycorps.org/indicators/indicator_create/259/''\r\nSERVER_NAME	\r\n''tola-activity-demo.mercycorps.org''\r\nREMOTE_ADDR	\r\n''67.170.137.248''\r\nmod_wsgi.queue_start	\r\n''1447103911360300''\r\nmod_wsgi.request_handler	\r\n''wsgi-script''\r\nwsgi.url_scheme	\r\n''https''\r\nPATH_TRANSLATED	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py/indicators/indicator_create/259/''\r\nSERVER_PORT	\r\n''443''\r\nwsgi.multiprocess	\r\nTrue\r\nmod_wsgi.input_chunked	\r\n''0''\r\nSERVER_ADDR	\r\n''192.168.8.60''\r\nDOCUMENT_ROOT	\r\n''/var/www/tola-activity/htdocs''\r\nmod_wsgi.process_group	\r\n''tola-activity''\r\nSCRIPT_FILENAME	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py''\r\nCOSIGN_FACTOR	\r\n''ldap''\r\nSERVER_ADMIN	\r\n''root@localhost''\r\nwsgi.input	\r\n<mod_wsgi.Input object at 0xa3a13480>\r\nREMOTE_USER	\r\n''esinn''\r\nHTTP_HOST	\r\n''tola-activity-demo.mercycorps.org''\r\nwsgi.multithread	\r\nTrue\r\nHTTP_UPGRADE_INSECURE_REQUESTS	\r\n''1''\r\nHTTP_CACHE_CONTROL	\r\n''max-age=0''\r\nREQUEST_URI	\r\n''/indicators/indicator_create/259/''\r\nHTTP_ACCEPT	\r\n''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\r\nPERL5LIB	\r\n''/usr/share/awstats/lib:/usr/share/awstats/plugins''\r\nmod_wsgi.callable_object	\r\n''application''\r\nwsgi.version	\r\n(1, 0)\r\nGATEWAY_INTERFACE	\r\n''CGI/1.1''\r\nwsgi.run_once	\r\nFalse\r\nwsgi.errors	\r\n<mod_wsgi.Log object at 0xa3a05480>', 1, NULL, 115, 5),
(220, '2015-11-10 05:10:36.000000', 'Comment', 'Emily, I think the program can be auto populated however I was just thinking aloud...Is it possible that we can have a multi-country program or if someone is logged into multiple countries, and system won''t know which country to auto-populate? ', 1, NULL, 113, NULL),
(221, '2015-11-10 10:33:59.000000', 'Ticket Opened Via Web', 'the export button is not working under tola-Activity>report .', 1, NULL, 116, NULL),
(222, '2015-11-10 18:32:21.000000', 'Ticket Opened Via Web', '1) If you are trying to enter indicators for one program, every time you save one indicator you are directed back to the main Indicator page, where you have to again select your program.  Is there any way you can save the indicator and return to the current program?\r\n\r\n2) Objectives: Would it be possible to show only those objectives that are related to that program instead of having to scroll down a very confusing list of objectives\r\n\r\n3) Do you have to be online to enter indicators or is there an offline tool?  \r\n\r\n4) do you have to be online to enter updates to the indicators or is there an offline tool?\r\n\r\n5) Related to the reporting frequency, is there any way the owner of the indicator can be reminded to provide an update to the indicator data?', 1, NULL, 117, NULL),
(223, '2015-11-10 21:20:15.000000', 'Resolved', 'It''s already searchable and filterable in the filed itself.  Just start typing.', 1, 3, 112, 11),
(224, '2015-11-10 21:21:09.000000', 'Resolved', 'It does pre-populate based on program and country.  It just doesn''t recognize USA', 1, 3, 113, 11),
(225, '2015-11-10 21:24:23.000000', 'Reopened', '', 1, 2, 5, 11),
(226, '2015-11-10 22:34:49.000000', 'Closed', '', 1, 4, 110, 11),
(227, '2015-11-10 22:35:58.000000', 'Closed', '', 1, 4, 115, 11),
(228, '2015-11-11 01:50:40.000000', 'Closed', '', 1, 4, 109, 11),
(229, '2015-11-12 03:38:44.000000', 'Ticket Opened Via Web', '6528 - 2015-2016 Integrated Afghan Refugee Assistance Project displays on Timor''s Indicator planning page here: https://tola-activity.mercycorps.org/indicators/home/0/\r\n\r\nCan this be removed? Thanks! ', 1, NULL, 118, NULL),
(230, '2015-11-12 03:48:04.000000', 'Ticket Opened Via Web', 'At the moment when you open the grid print the indicators show up in the order that they are entered. I think it would make the most sense for indicators to initially display according to program logic hierarchy. But it would also be useful if we could sort the graph by each column so that we can group indicators collected with a single MOV, for example, or by person responsible, or frequency of collection.\r\n\r\nThanks!', 1, NULL, 119, NULL),
(231, '2015-11-13 06:26:50.000000', 'Ticket Opened Via Web', 'I am having trouble creating new Site Profile in Tola Activity because each time I click on Create New it asks me to log in again. For Stakeholder Profile and Project Agreements I have no issues creating new entries. My profile shows that I am already logged into the system and in the admin sections I am saved as Staff Status with full editing privileges. Can you help me troubleshoot why I am not accessing the new Site Profile Forms? ', 1, NULL, 120, NULL),
(232, '2015-11-13 14:00:25.000000', 'Ticket Opened Via Web', 'When want to add objectives in the admin, we have to select the program and the list that shows is that of all programs.  Can we please filter per country to show only programs of that country?  It will make it more efficient in selection.', 1, NULL, 121, NULL),
(233, '2015-11-14 09:17:55.000000', 'Ticket Opened Via Web', 'After adding a Site Profile I tried to click to update from the pop-up on the Site Profile map. This returned a 404 page. See attached. Thanks!', 1, NULL, 122, NULL),
(234, '2015-11-14 10:03:19.000000', 'Ticket Opened Via Web', 'Once the contact information has been added and you can associate that background with the stakeholder I don''t see where it can be accessed again in the future. Can you add a clickable button to open the contacts background info?\r\n\r\nEven better would be a grid print of all stakeholders similar to the indicator plan grid print. \r\n\r\nThanks! ', 1, NULL, 123, NULL),
(235, '2015-11-14 10:32:15.000000', 'Ticket Opened Via Web', 'We''ve added a few project agreements but they don''t seem to be appearing in their "open," "pending," "approved" state... \r\n\r\nIts possible that "open" agreements are not displayed in the bar chart and I don''t understand the different between "open" and "pending"', 1, NULL, 124, NULL),
(236, '2015-11-15 07:15:44.000000', 'Ticket Opened Via Web', 'The Button which says "delete stakeholder" has a spelling mistake. Just to let you know.', 1, NULL, 125, NULL),
(237, '2015-11-16 14:46:38.000000', 'Ticket Opened', '.', 1, NULL, 126, 9),
(238, '2015-11-16 14:52:09.000000', 'Ticket Opened', 'Also change: \r\nMC Estimated Budget to "Estimated Organization Project Budget"\r\n\r\nEstimated Total to "Estimated Project Budget" (for local currency)\r\n\r\nMove Estimated Date after "Estimated project budget" & Estimated Organization Project Budget" (USD)\r\n\r\n\r\n\r\n', 1, NULL, 127, 9),
(239, '2015-11-16 15:01:25.000000', 'Ticket Opened', 'Change tab name to: "Description and Justification"\r\n\r\nRemove hint under "description of program activities"\r\n\r\nUnder tab, there should be 4 fields this order:\r\n1) Add field "Problem Statement and Selection Criteria" - combines general background and description of selection criteria\r\n2) Description of Project Activities - no change to field except reorder\r\n3) Add "Description of Government/Community/Private Sector Involvement" field\r\n4) Change "Effect or Impact" to "What is the anticipated GOAL or OUTCOME that this project will contribute to?"', 1, NULL, 128, 9),
(240, '2015-11-16 15:04:51.000000', 'Ticket Opened', '"Originated By" field. Can this be the "Approval submitted by"? Think this works as everyone else won''t submit, they are just review.\r\n\r\nChange "estimated date" to "Originated Date"\r\n\r\nChange "reviewed date" to "Field Verification Date"\r\n\r\n', 1, NULL, 129, 9),
(241, '2015-11-16 15:21:12.000000', 'Comment', 'What form are you talking about? agreement or complete or both?  why do you want them merged, why were they separated in the first place?  Does this then become a multiple select allow more then 1 or is there only one project type per form?', 1, NULL, 126, 11),
(242, '2015-11-16 15:24:39.000000', 'Comment', 'Organization or MC is being replaced with global variable for organizational name... to confusing to say organization when dealing with sub grantees.  see issue https://github.com/mercycorps/tola-activity/issues/105', 1, NULL, 127, 11),
(243, '2015-11-16 15:26:37.000000', 'Comment', 'we are not making changes to local currency vs. donor currency vs any currency until we resolve the currency issues with Finance.  To much complexity that isn''t necessarily replicable to other orgs.', 1, NULL, 127, 11),
(244, '2015-11-16 15:27:33.000000', 'Comment', 'why?', 1, NULL, 128, 11),
(245, '2015-11-16 16:28:37.000000', 'Ticket Opened', 'This section should include:\r\n\r\nOriginated by:\r\nApproved by:', 1, NULL, 130, 9),
(246, '2015-11-16 16:31:44.000000', 'Ticket Opened', 'This should have two fields:\r\n\r\nOriginated by:\r\nApproved by:\r\n\r\n\r\n', 1, NULL, 131, 9),
(247, '2015-11-16 16:48:30.000000', 'Ticket Opened', 'Move "Country" and "Owner" fields to the Summary tab.\r\n\r\nIt makes sense to have these on the summary so that the planning form mirrors closely to the MC Indicator plan template.\r\n\r\nWith this the new Summary tab would be ordered as:\r\n\r\nProgram\r\nSector\r\nProgram Objectives\r\nStrategic Objectives\r\nCountry\r\nOwner', 1, NULL, 132, 9),
(248, '2015-11-16 17:14:18.000000', 'Ticket Opened', '1) Reorder suggestion:\r\n\r\nTargeted\r\nAchieved\r\nData Collected\r\nIndicator\r\nProgram\r\nCountry\r\nRemarks/Comments\r\n\r\n2) Remove "Office" field. Not sure why we need this since indicator data is associated to the indicator and then indicator is associated to a program. We also may not need the "Program" field either.\r\n\r\n3) Add "Originated By" field so that we can track who added the result', 1, NULL, 133, 9),
(249, '2015-11-16 17:37:39.000000', 'Ticket Opened', 'Under Executive Summary Tab:\r\n1) Remove "Project Name" field - seems redundant since it is automatically associated with the Agreement already.\r\n2) Remove "Project Activity" field - redundant with agreement\r\n3) SUGGESTION: Remove "Site" or auto populate\r\n4) Remove Expected and Actual Duration fields - removed from agreement already\r\n', 1, NULL, 134, 9),
(250, '2015-11-16 17:53:33.000000', 'Ticket Opened', 'Under Budget tab, I''ve suggested a reordering plus minor changes to the field names:\r\n\r\n1) Change "Estimated Budget" to "Estimated Project Budget"\r\n2) Change "Actual Budget" to "Actual Project Cost"\r\n3) Add new field "Actual Project Cost Date"\r\n4) Change "Budget Variance" to "Budget versus Actual variance"\r\n5) No change - "Explanation of Variance" field\r\n6) Change "Total Cost" to "Estimated Project Budget for Organization (In USD)"\r\n7) Change "Agency Cost" to "Actual Project Cost for Organization (In USD)"\r\n8) Change "Total in local currency" to "Actual Project Cost (In Local Currency)"\r\n9) Change "Organization Total in local currency" to "Actual Project Cost for Organization (In Local Currency)"\r\n10) Move "Account Code" field here\r\n11) Change "LIN Sub Code" to "LIN Code" and move "LIN Code" field here\r\n12) Move "Other Budget Contribution" tab to the bottom of the "Budget" tab', 1, NULL, 135, 9),
(251, '2015-11-16 19:45:56.000000', 'Reopened', '', 0, 2, 2, 8),
(252, '2015-11-16 19:49:03.000000', 'Reopened', '', 0, 2, 5, 8),
(253, '2015-11-16 19:49:58.000000', 'Reopened', '', 0, 2, 47, 8),
(254, '2015-11-16 19:50:27.000000', 'Reopened', '', 0, 2, 68, 8),
(255, '2015-11-16 20:26:04.000000', 'Reopened', '', 0, 2, 80, 8),
(256, '2015-11-16 20:27:41.000000', 'Reopened', '', 0, 2, 98, 8),
(257, '2015-11-16 20:27:57.000000', 'Reopened', '', 0, 2, 99, 8),
(258, '2015-11-16 20:28:24.000000', 'Reopened', '', 0, 2, 111, 8),
(259, '2015-11-16 20:28:51.000000', 'Reopened', '', 0, 2, 116, 8),
(260, '2015-11-16 20:39:39.000000', 'Reopened', '', 0, 2, 50, 8),
(261, '2015-11-16 20:41:28.000000', 'Reopened', '', 0, 2, 52, 8),
(262, '2015-11-16 20:42:08.000000', 'Reopened', '', 0, 2, 53, 8),
(263, '2015-11-16 20:43:14.000000', 'Reopened', '', 0, 2, 104, 8),
(264, '2015-11-16 20:43:29.000000', 'Reopened', '', 0, 2, 103, 8),
(265, '2015-11-17 13:57:00.000000', 'Ticket Opened', 'For level 3, think it makes sense to include ways to add multiple documents directly in Tola Activity since they just need to be linked and won''t be used for tabulation.', 1, NULL, 136, 9),
(266, '2015-11-17 13:58:19.000000', 'Ticket Opened', 'Work with Greg', 1, NULL, 137, 9),
(267, '2015-11-17 14:27:13.000000', 'Ticket Opened', 'Since we are collecting this information on the Project Agreement form already, there should not be many updates during the Project Completion Phase.', 1, NULL, 138, 9),
(268, '2015-11-17 14:30:09.000000', 'Ticket Opened', 'The new tab should be called "Impact".\r\n\r\nSince Lessons Learn tab only includes two fields, it makes sense to incorporate this into the "Impact" tab.\r\n\r\n', 1, NULL, 139, 9),
(269, '2015-11-17 14:30:53.000000', 'Ticket Opened', 'Under the Quantitative Evidence section under "Impact", we need to add "Progress against Targets (%)". This is a calculation: achieved divided by target and should be displayed as a %.', 1, NULL, 140, 9),
(270, '2015-11-17 14:32:52.000000', 'Ticket Opened', 'Add the following approvals/reviews (to match Project Agreement):\r\n\r\nOriginated By:\r\nField Verification By:\r\nMEL Review:\r\nFinance Review:\r\nRemove "Approval Submitted By:"\r\n', 1, NULL, 141, 9),
(272, '2015-11-17 15:40:20.000000', 'Ticket Opened Via Web', 'Program 5887 indicator plan indicators had the country defaulted to Afghanistan for all the indicators.  Not sure why that happened.  I manually fixed it for each indicator.', 1, NULL, 143, NULL),
(273, '2015-11-17 15:51:32.000000', 'Ticket Opened Via Web', 'Psychosocial Support and Safe Access to Education for Youth program with GAIT ID 5717 is not showing on Tola to be able to add indicators to.  It is on GAIT. Duration 31-3-2014 to 31-3-2016', 1, NULL, 144, NULL),
(274, '2015-11-17 17:07:36.000000', 'Ticket Opened', 'Received the following error when I went to log in to Tola Tables with my Google account:\r\n\r\n400. That’s an error.\r\n\r\nError: redirect_uri_mismatch\r\n\r\nApplication: Tola-Help\r\n\r\nYou can email the developer of this application at: gwlind@gmail.com\r\n\r\nThe redirect URI in the request: https://tola-tables.mercycorps.org/complete/google-oauth2/ did not match a registered redirect URI.\r\n\r\nLearn more\r\n\r\nRequest Details\r\nThat’s all we know.', 1, NULL, 145, 5),
(275, '2015-11-17 17:09:50.000000', 'Ticket Opened', 'When you submit a new ticket on Tola Work the drop down in the "queue" field still reads Tola Data.  Needs to change to Tola Tables. \r\n\r\nWe should do a full review and make sure we''re consistent on the naming conventions  everywhere.  It''s confusing right now. ', 1, NULL, 146, 5),
(276, '2015-11-17 18:45:24.000000', 'Ticket Opened', 'On the demo site of Tola Activity for the new DIG integration, there are duplicate selections in Indicator type: alpha, standard, DIG alpha, DIG standard.  Keep: DIG alpha and DIG standard', 1, NULL, 147, 5),
(277, '2015-11-17 18:46:56.000000', 'Ticket Opened', 'Tola Activity Demo:\r\nDIG team would like to restrict users from being able to make changes to the name field for and DIG alpha or standard indicator. ', 1, NULL, 148, 5),
(278, '2015-11-17 19:48:31.000000', 'Ticket Opened & Assigned to Karrla Sandstrom', 'User''s who have access to multiple countries may see duplicate programs. If they try and save a PA to one of the duplicate programs, they will receive the following JSON error. \r\nExample of a Duplicate Program:\r\nGAITID: 6514 Toys for Busma Centers in Lebanon\r\nListed twice for a user who has access to Lebanon and Pakistan country programs in their Activtiy Profile\r\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\nMultipleObjectsReturned at /activitydb/projectagreement_update/220/\r\nget() returned more than one Program -- it returned 2!\r\nRequest Method:	POST\r\nRequest URL:	https://tola-activity-demo.mercycorps.org/activitydb/projectagreement_update/220/\r\nDjango Version:	1.8.2\r\nException Type:	MultipleObjectsReturned\r\nException Value:	\r\nget() returned more than one Program -- it returned 2!\r\nException Location:	/usr/local/lib/python2.7/site-packages/django/db/models/query.py in get, line 338\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Tue, 17 Nov 2015 11:30:40 -0800', 1, NULL, 149, 8),
(279, '2015-11-17 21:36:17.000000', 'Ticket Opened', 'I received the following error message when I click on Checklist from project dashboard and then Create New Checklist:\r\n\r\nFieldError at /activitydb/checklist_add/7/\r\nCannot resolve keyword ''country'' into field. Choices are: checklist, checklist_id, create_date, edit_date, global_item, id, in_file, item, not_applicable\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/activitydb/checklist_add/7/\r\nDjango Version:	1.8.2\r\nException Type:	FieldError\r\nException Value:	\r\nCannot resolve keyword ''country'' into field. Choices are: checklist, checklist_id, create_date, edit_date, global_item, id, in_file, item, not_applicable\r\nException Location:	/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in names_to_path, line 1391\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Tue, 17 Nov 2015 13:33:34 -0800\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in view\r\n                        return self.dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/activitydb/views.py in dispatch\r\n                    return super(ChecklistCreate, self).dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in dispatch\r\n                    return handler(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    return super(BaseCreateView, self).get(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    form = self.get_form() ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get_form\r\n                    return form_class(**self.get_form_kwargs()) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/activitydb/forms.py in __init__\r\n                    self.fields[''item''].queryset = ChecklistItem.objects.filter(country__in=countries) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/manager.py in manager_method\r\n                            return getattr(self.get_queryset(), name)(*args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/query.py in filter\r\n                    return self._filter_or_exclude(False, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/query.py in _filter_or_exclude\r\n                        clone.query.add_q(Q(*args, **kwargs)) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in add_q\r\n                    clause, require_inner = self._add_q(where_part, self.used_aliases) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in _add_q\r\n                                allow_joins=allow_joins, split_subq=split_subq, ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in build_filter\r\n                    lookups, parts, reffed_aggregate = self.solve_lookup_type(arg) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in solve_lookup_type\r\n                    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta()) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in names_to_path\r\n                                                 "Choices are: %s" % (name, ", ".join(available))) ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nNo POST data\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\nkm_lv	\r\n''x''\r\noptimizelyEndUserId	\r\n''oeu1426178086900r0.33647501352243125''\r\nkm_ai	\r\n''uLTSOJN559s9yWX2ZAJnmUBswlU%3D''\r\n_ga	\r\n''GA1.2.107862919.1426178087''\r\noptimizelySegments	\r\n''%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D''\r\nkm_uq	\r\n''''\r\nsessionid	\r\n''upaykxlg3suu6d7dpcenxd28gj3wfnc8''\r\ncsrftoken	\r\n''6VmevB3CDYTVz3z3eFBLNm9vr8060E7q''\r\n__utma	\r\n''185632118.107862919.1426178087.1426178087.1426287090.2''\r\noptimizelyBuckets	\r\n''%7B%222115560571%22%3A%222442901605%22%2C%222214141681%22%3A%222213931163%22%2C%222445310539%22%3A%222465270090%22%2C%222786931510%22%3A%222798370973%22%7D''\r\ncosign-tola	\r\n''DiwaskNsjzKh7Bh+rosc7j5wZazOY015Eqq0IRiqcXOu7P6ppBd+Y8+HNwATXVXbreH+2UrZ0-ViYuX3YX2HSbzg0uWBPTOPR1GpvshWOk5g1ULpS3K7f2+E1k+v/1447780371''\r\nMETA\r\nVariable	Value\r\nAUTH_TYPE	\r\n''Cosign''\r\nmod_wsgi.listener_port	\r\n''443''\r\nHTTP_REFERER	\r\n''https://tola-activity.mercycorps.org/activitydb/checklist', 1, NULL, 150, 5),
(280, '2015-11-17 23:08:45.000000', 'Comment', 'I see this program shows up under Jordan in Tola Activity, but in GAIT it is in both Lebanon and Jordan.  https://gait.mercycorps.org/editgrant.vm?GrantID=5717', 0, NULL, 144, 8),
(283, '2015-11-18 08:17:25.000000', 'Ticket Opened', 'ajammoul@lb.mercycorps.org is prompt to login and password when selecting "New Site Profile". He accessed that by going to Workflow > Sites > New Site Profile', 1, NULL, 152, 9),
(284, '2015-11-18 15:31:48.000000', 'Ticket Opened Via Web', 'when I was entering a new table on Tola Data after I submit the CSV file, I got the below attached error page.', 1, NULL, 153, NULL),
(285, '2015-11-18 20:13:10.000000', 'Ticket Opened', 'The Help Links on Tola-Activity should link to Tola.Work\r\nhttps://tola-activity.mercycorps.org/faq --> http://tola.work/faq\r\n\r\nhttps://tola-activity.mercycorps.org/contact --> http://tola.work/contact\r\n\r\nhttps://tola-activity.mercycorps.org/documentation --> http://tola.work/documentation\r\n', 1, NULL, 154, 8),
(286, '2015-11-18 20:15:31.000000', 'Ticket Opened', 'The Help Links on Tola Data/Tables should link to Tola.Work\r\nhttps://tola-data.mercycorps.org/faq --> http://tola.work/faq\r\n\r\nhttps://tola-data.mercycorps.org/contact --> http://tola.work/contact\r\n\r\nhttps://tola-data.mercycorps.org/documentation --> http://tola.work/documentation', 1, NULL, 155, 8),
(287, '2015-11-18 21:29:20.000000', 'Reopened', '', 1, 2, 125, 11),
(288, '2015-11-18 21:30:28.000000', 'Reopened', '', 1, 2, 124, 11),
(289, '2015-11-19 00:07:51.000000', 'Ticket Opened', 'Received the following error message when I clicked on the name of a site directly from the pin on the map on the main site profile page\r\n\r\nPage not found (404)\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/activitydb/community_update/103\r\nUsing the URLconf defined in tola.urls, Django tried these URL patterns, in this order:\r\n^api/\r\n^api-auth/\r\n^$ [name=''index'']\r\n^dashboard/(?P<id>\\w+)/(?P<sector>\\w+)/$ [name=''index'']\r\n^$\r\n^admin/doc/\r\n^admin/\r\n^contact [name=''contact'']\r\n^faq [name=''faq'']\r\n^documentation [name=''documentation'']\r\n^activitydb/ ^report_builder/\r\n^activitydb/ ^dashboard/(?P<pk>\\w+)/$ [name=''dashboard'']\r\n^activitydb/ ^dashboard/project/(?P<pk>\\w+)/$ [name=''project_dashboard'']\r\n^activitydb/ ^dashboard/project/(?P<pk>\\w+)$ [name=''project_dashboard'']\r\n^activitydb/ ^dashboard/project [name=''project_dashboard'']\r\n^activitydb/ ^projectagreement_list/(?P<pk>\\w+)/$ [name=''projectagreement_list'']\r\n^activitydb/ ^projectagreement_add/$ [name=''projectagreement_add'']\r\n^activitydb/ ^projectagreement_update/(?P<pk>\\w+)/$ [name=''projectagreement_update'']\r\n^activitydb/ ^projectagreement_delete/(?P<pk>\\w+)/$ [name=''projectagreement_delete'']\r\n^activitydb/ ^projectagreement_import [name=''projectagreement_import'']\r\n^activitydb/ ^projectagreement_detail/(?P<pk>\\w+)/$ [name=''projectagreement_detail'']\r\n^activitydb/ ^projectcomplete_list/(?P<pk>\\w+)/$ [name=''projectcomplete_list'']\r\n^activitydb/ ^projectcomplete_add/(?P<pk>\\w+)/$ [name=''projectcomplete_add'']\r\n^activitydb/ ^projectcomplete_update/(?P<pk>\\w+)/$ [name=''projectcomplete_update'']\r\n^activitydb/ ^projectcomplete_delete/(?P<pk>\\w+)/$ [name=''projectcomplete_delete'']\r\n^activitydb/ ^projectcomplete_import [name=''projectcomplete_import'']\r\n^activitydb/ ^projectcomplete_detail/(?P<pk>\\w+)/$ [name=''projectcomplete_detail'']\r\n^activitydb/ ^siteprofile_list/(?P<program_id>\\w+)/(?P<activity_id>\\w+)/$ [name=''siteprofile_list'']\r\n^activitydb/ ^siteprofile_report/(?P<pk>\\w+)/$ [name=''siteprofile_report'']\r\n^activitydb/ ^siteprofile_add [name=''siteprofile_add'']\r\n^activitydb/ ^siteprofile_update/(?P<pk>\\w+)/$ [name=''siteprofile_update'']\r\n^activitydb/ ^siteprofile_delete/(?P<pk>\\w+)/$ [name=''siteprofile_delete'']\r\n^activitydb/ ^documentation_list/(?P<pk>\\w+)/$ [name=''documentation_list'']\r\n^activitydb/ ^documentation_add [name=''documentation_add'']\r\n^activitydb/ ^documentation_agreement_add/(?P<id>\\w+)/$ [name=''documentation_agreement_add'']\r\n^activitydb/ ^documentation_agreement_update/(?P<pk>\\w+)/(?P<id>\\w+)/$ [name=''documentation_agreement_update'']\r\n^activitydb/ ^documentation_agreement_delete/(?P<pk>\\w+)/$ [name=''documentation_agreement_delete'']\r\n^activitydb/ ^documentation_update/(?P<pk>\\w+)/$ [name=''documentation_update'']\r\n^activitydb/ ^documentation_delete/(?P<pk>\\w+)/$ [name=''documentation_delete'']\r\n^activitydb/ ^monitor_list/(?P<pk>\\w+)/$ [name=''monitor_list'']\r\n^activitydb/ ^monitor_add/(?P<id>\\w+)/$ [name=''monitor_add'']\r\n^activitydb/ ^monitor_update/(?P<pk>\\w+)/$ [name=''monitor_update'']\r\n^activitydb/ ^monitor_delete/(?P<pk>\\w+)/$ [name=''monitor_delete'']\r\n^activitydb/ ^quantitative_add/(?P<id>\\w+)/$ [name=''quantitative_add'']\r\n^activitydb/ ^quantitative_update/(?P<pk>\\w+)/$ [name=''quantitative_update'']\r\n^activitydb/ ^quantitative_delete/(?P<pk>\\w+)/$ [name=''quantitative_delete'']\r\n^activitydb/ ^benchmark_add/(?P<id>\\w+)/$ [name=''benchmark_add'']\r\n^activitydb/ ^benchmark_update/(?P<pk>\\w+)/$ [name=''benchmark_update'']\r\n^activitydb/ ^benchmark_delete/(?P<pk>\\w+)/$ [name=''benchmark_delete'']\r\n^activitydb/ ^training_list/(?P<pk>\\w+)/$ [name=''training_list'']\r\n^activitydb/ ^training_add/(?P<id>\\w+)/$ [name=''training_add'']\r\n^activitydb/ ^training_update/(?P<pk>\\w+)/$ [name=''training_update'']\r\n^activitydb/ ^training_delete/(?P<pk>\\w+)/$ [name=''training_delete'']\r\n^activitydb/ ^stakeholder_list/(?P<pk>\\w+)/$ [name=''stakeholder_list'']\r\n^activitydb/ ^stakeholder_add/(?P<id>\\w+)/$ [name=''stakeholder_add'']\r\n^activitydb/ ^stakeholder_update/(?P<pk>\\w+)/$ [name=''stakeholder_update'']\r\n^activitydb/ ^stakeholder_delete/(?P<pk>\\w+)/$ [name=''stakeholder_delete'']\r\n^activitydb/ ^contact_list/(?P<pk>\\w+)/$ [name=''contact_list'']\r\n^activitydb/ ^contact_add/(?P<id>\\w+)/$ [name=''contact_add'']\r\n^activitydb/ ^contact_update/(?P<pk>\\w+)/$ [name=''contact_update'']\r\n^activitydb/ ^contact_delete/(?P<pk>\\w+)/$ [name=''contact_delete'']\r\n^activitydb/ ^checklist_list/(?P<pk>\\w+)/$ [name=''checklist_list'']\r\n^activitydb/ ^checklist_add/(?P<id>\\w+)/$ [name=''checklist_add'']\r\n^activitydb/ ^checklist_update/(?P<pk>\\w+)/$ [name=''checklist_update'']\r\n^activitydb/ ^checklist_update_link/(?P<pk>\\w+)/(?P<type>\\w+)/(?P<value>\\w+)/$ [name=''checklist_update_link'']\r\n^activitydb/ ^checklist_delete/(?P<pk>\\w+)/$ [name=''checklistdelete'']\r\n^activitydb/ ^beneficiary_list/(?P<pk>\\w+)/$ [name=''beneficiary_list'']', 1, NULL, 156, 5),
(290, '2015-11-19 00:25:38.000000', 'Ticket Opened', 'Following error when I clicked on checklist data on this page: https://tola-activity.mercycorps.org/activitydb/checklist_list/39/\r\n\r\nFieldError at /activitydb/checklist_update/400/\r\nCannot resolve keyword ''country'' into field. Choices are: checklist, checklist_id, create_date, edit_date, global_item, id, in_file, item, not_applicable\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/activitydb/checklist_update/400/\r\nDjango Version:	1.8.2\r\nException Type:	FieldError\r\nException Value:	\r\nCannot resolve keyword ''country'' into field. Choices are: checklist, checklist_id, create_date, edit_date, global_item, id, in_file, item, not_applicable\r\nException Location:	/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in names_to_path, line 1391\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Wed, 18 Nov 2015 16:23:08 -0800\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in view\r\n                        return self.dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in dispatch\r\n                    return handler(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    return super(BaseUpdateView, self).get(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    form = self.get_form() ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get_form\r\n                    return form_class(**self.get_form_kwargs()) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/activitydb/forms.py in __init__\r\n                    self.fields[''item''].queryset = ChecklistItem.objects.filter(country__in=countries) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/manager.py in manager_method\r\n                            return getattr(self.get_queryset(), name)(*args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/query.py in filter\r\n                    return self._filter_or_exclude(False, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/query.py in _filter_or_exclude\r\n                        clone.query.add_q(Q(*args, **kwargs)) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in add_q\r\n                    clause, require_inner = self._add_q(where_part, self.used_aliases) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in _add_q\r\n                                allow_joins=allow_joins, split_subq=split_subq, ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in build_filter\r\n                    lookups, parts, reffed_aggregate = self.solve_lookup_type(arg) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in solve_lookup_type\r\n                    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta()) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in names_to_path\r\n                                                 "Choices are: %s" % (name, ", ".join(available))) ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nNo POST data\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\nkm_lv	\r\n''x''\r\noptimizelyEndUserId	\r\n''oeu1426178086900r0.33647501352243125''\r\nkm_ai	\r\n''uLTSOJN559s9yWX2ZAJnmUBswlU%3D''\r\n_ga	\r\n''GA1.2.107862919.1426178087''\r\noptimizelySegments	\r\n''%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D''\r\nkm_uq	\r\n''''\r\nsessionid	\r\n''xn66o5959n928gbu06awfm295ka1jmtv''\r\ncsrftoken	\r\n''6VmevB3CDYTVz3z3eFBLNm9vr8060E7q''\r\n__utma	\r\n''185632118.107862919.1426178087.1426178087.1426287090.2''\r\noptimizelyBuckets	\r\n''%7B%222115560571%22%3A%222442901605%22%2C%222214141681%22%3A%222213931163%22%2C%222445310539%22%3A%222465270090%22%2C%222786931510%22%3A%222798370973%22%7D''\r\ncosign-tola	\r\n''z8HMcrGw9cpiJ9Jd-KWRrSVLaIbumHuCeH+kb-GA3NgImBimz-k4zq9obaXKQGULR7rmJdL2ao1hulLpOgNef7jHj6SJlOrBTJaRu70IVj97mHTBvmN3VsIhaPEe/1447883589''\r\nMETA\r\nVariable	Value\r\nAUTH_TYPE	\r\n''Cosign''\r\nmod_wsgi.listener_port	\r\n''443''\r\nHTTP_REFERER	\r\n''https://tola-activity.mercycorps.org/activitydb/checklist_list/39/''\r\nmod_wsgi.listener_host	\r\n''''\r\nSERVER_SOFTWARE	\r\n''Apache''\r\nSCRIPT_NAME	\r\nu''''\r\nmod_wsgi.enable_sendfile	\r\n''0''\r\nmod_wsgi.handler_script	\r\n''''\r\nSERVER_SIGNATURE	\r\n''<address>Apache Server at tola-activity.mercycorps.org Port 443</address>\\n''\r\nREQUEST_METHOD	\r\n''GET''\r\nPATH_INFO	\r\nu''/activitydb/checklist_update/400/''\r\nSERVER_PROTOCOL	\r\n''HTTP/1.1''\r\nQUERY_STRING	\r\n''''\r\nSSL_TLS_SNI	\r\n''tola-activity.mercycorps.org''\r\nCOSIGN_SERVICE	\r\n''cosign-tola''\r\nHTTP_USER_AGENT	\r\n''Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36''\r\nHTTP_CONNECTION	\r\n''keep-alive''\r\nREMOTE_REALM	\r\n''ldap''\r\nSERVER_NAME	\r\n''tola-activity.mercycorps.org''\r\nREMOTE_ADDR	\r\n''10.10.27.50''\r\nmod_wsgi.queue_start	\r\n''1447892588110518''\r\nmod_wsgi.request_handler	\r\n''wsgi-script''\r\nwsgi.url_scheme	\r\n''https''\r\nPATH_TRANSLATED	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py/activitydb/checklist_update/400/''\r\nSERVER_PORT	\r\n''443''\r\nwsgi.multiprocess	\r\nTrue\r\nmod_wsgi.input_chunked	\r\n''0''\r\nSERVER_ADDR	\r\n''192.168.8.72''\r\nDOCUMENT_ROOT	\r\n''/var/www/tola-activity/htdocs''\r\nmod_wsgi.process_group	\r\n''tola-activity''\r\nSCRIPT_FILENAME	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py''\r\nCOSIGN_FACTOR	\r\n''ldap''\r\nSERVER_ADMIN	\r\n''root@localhost''\r\nwsgi.input	\r\n<mod_wsgi.Input object at 0xa43eeb10>\r\nREMOTE_USER	\r\n''esinn''\r\nHTTP_HOST	\r\n''tola-activity.mercycorps.org''\r\nwsgi.multithread	\r\nTrue\r\nHTTP_UPGRADE_INSECURE_REQUESTS	\r\n''1''\r\nREQUEST_URI	\r\n''/activitydb/checklist_update/400/''\r\nHTTP_ACCEPT	\r\n''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\r\nPERL5LIB	\r\n''/usr/share/awstats/lib:/usr/share/awstats/plugins''\r\nmod_wsgi.callable_object	\r\n''application''\r\nwsgi.version	\r\n(1, 0)\r\nGATEWAY_INTERFACE	\r\n''CGI/1.1''\r\nwsgi.run_once	\r\nFalse\r\nwsgi.errors	\r\n<mod_wsgi.Log object at 0xa2f9bd40>\r\nREMOTE_PORT	\r\n''58073''\r\nHTTP_ACCEPT_LANGUAGE	\r\n''en-US,en;q=0.8''\r\nmod_wsgi.version	\r\n(3, 4)\r\nmod_wsgi.application_group	\r\n''tola-activity.mercycorps.org|''\r\nmod_wsgi.script_reloading	\r\n''1''\r\nwsgi.file_wrapper	\r\n''''\r\nCSRF_COOKIE	\r\nu''6VmevB3CDYTVz3z3eFBLNm9vr8060E7q''\r\nHTTP_ACCEPT_ENCODING	\r\n''gzip, deflate, sdch''\r\nHTTP_COOKIE	\r\n''optimizelyEndUserId=oeu1426178086900r0.33647501352243125; __utma=185632118.107862919.1426178087.1426178087.1426287090.2; km_ai=uLTSOJN559s9yWX2ZAJnmUBswlU%3D; km_lv=x; optimizelySegments=%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D; optimizelyBuckets=%7B%222115560571%22%3A%222442901605%22%2C%222214141681%22%3A%222213931163%22%2C%222445310539%22%3A%222465270090%22%2C%222786931510%22%3A%222798370973%22%7D; _ga=GA1.2.107862919.1426178087; km_uq=; cosign-tola=z8HMcrGw9cpiJ9Jd-KWRrSVLaIbumHuCeH+kb-GA3NgImBimz-k4zq9obaXKQGULR7rmJdL2ao1hulLpOgNef7jHj6SJlOrBTJaRu70IVj97mHTBvmN3VsIhaPEe/1447883589; sessionid=xn66o5959n928gbu06awfm295ka1jmtv; csrftoken=6VmevB3CDYTVz3z3eFBLNm9vr8060E7q''\r\nSettings\r\nUsing settings module tola.settings.local\r\nSetting	Value\r\nSECURE_BROWSER_XSS_FILTER	\r\nFalse\r\nUSE_THOUSAND_SEPARATOR	\r\nFalse\r\nCSRF_COOKIE_SECURE	\r\nFalse\r\nLANGUAGE_CODE	\r\n''en-us''\r\nROOT_URLCONF	\r\n''tola.urls''\r\nMANAGERS	\r\n((''admin'', ''tola@tola.org''),)\r\nSILENCED_SYSTEM_CHECKS	\r\n[]\r\nDEFAULT_CHARSET	\r\n''utf-8''\r\nSESSION_SERIALIZER	\r\n''django.contrib.sessions.serializers.JSONSerializer''\r\nSTATIC_ROOT	\r\n''/var/www/tola-activity/htdocs/assets''\r\nLDAP_LOGIN	\r\n''uid=pluma,ou=People,dc=system,dc=mercycorps,dc=org''\r\nDJANGO_ROOT	\r\n''/var/www/tola-activity/htdocs/tola''\r\nALLOWED_HOSTS	\r\n[]\r\nEMAIL_HOST	\r\n''localhost''\r\nMESSAGE_STORAGE	\r\n''django.contrib.messages.storage.fallback.FallbackStorage''\r\nEMAIL_SUBJECT_PREFIX	\r\n''[Django] ''\r\nSERVER_EMAIL	\r\n''root@localhost''\r\nSECURE_HSTS_SECONDS	\r\n0\r\nSTATICFILES_FINDERS	\r\n(''django.contrib.staticfiles.finders.FileSystemFinder'',\r\n ''django.contrib.staticfiles.finders.AppDirectoriesFinder'')\r\nSESSION_CACHE_ALIAS	\r\n''default''\r\nSESSION_COOKIE_DOMAIN	\r\nNone\r\nSESSION_COOKIE_NAME	\r\n''sessionid''\r\nTIME_INPUT_FORMATS	\r\n(''%H:%M:%S'', ''%H:%M:%S.%f'', ''%H:%M'')\r\nSECURE_REDIRECT_EXEMPT	\r\n[]\r\nDATABASES	\r\n{''default'': {''ATOMIC_REQUESTS'': False,\r\n             ''AUTOCOMMIT'': True,\r\n             ''CONN_MAX_AGE'': 0,\r\n             ''ENGINE'': ''django.db.backends.mysql'',\r\n             ''HOST'': ''localhost'',\r\n             ''NAME'': ''tola_activity'',\r\n             ''OPTIONS'': {},\r\n             ''PASSWORD'': u''********************'',\r\n             ''PORT'': '''',\r\n             ''TEST'': {''CHARSET'': None,\r\n                      ''COLLATION'': None,\r\n                      ''MIRROR'': None,\r\n                      ''NAME'': None},\r\n             ''TIME_ZONE'': ''UTC'',\r\n             ''USER'': ''tolaactivity''}}\r\nEMAIL_SSL_KEYFILE	\r\nu''********************''\r\nFILE_UPLOAD_DIRECTORY_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_HANDLERS	\r\n(''django.core.files.uploadhandler.MemoryFileUploadHandler'',\r\n ''django.core.files.uploadhandler.TemporaryFileUploadHandler'')\r\nTEMPLATE_CONTEXT_PROCESSORS	\r\n(''django.contrib.auth.context_processors.auth'',\r\n ''django.core.context_processors.debug'',\r\n ''django.core.context_processors.i18n'',\r\n ''django.core.context_processors.media'',\r\n ''django.core.context_processors.static'',\r\n ''django.core.context_processors.tz'',\r\n ''django.contrib.messages.context_processors.messages'',\r\n ''django.core.context_processors.request'')\r\nDEFAULT_CONTENT_TYPE	\r\n''text/html''\r\nREPORT_BUILDER_INCLUDE	\r\n[]\r\nAPPEND_SLASH	\r\nTrue\r\nFIRST_DAY_OF_WEEK	\r\n0\r\nDATABASE_ROUTERS	\r\n[]\r\nDEFAULT_TABLESPACE	\r\n''''\r\nLOCAL_APPS	\r\n(''tola'', ''feed'', ''activitydb'', ''djangocosign'', ''indicators'')\r\nYEAR_MONTH_FORMAT	\r\n''F Y''\r\nSTATICFILES_STORAGE	\r\n''django.contrib.staticfiles.storage.StaticFilesStorage''\r\nCACHES	\r\n{''default'': {''BACKEND'': ''django.core.cache.backends.locmem.LocMemCache''}}\r\nSESSION_COOKIE_PATH	\r\n''/''\r\nSECURE_CONTENT_TYPE_NOSNIFF	\r\nFalse\r\nMIDDLEWARE_CLASSES	\r\n(''django.middleware.common.CommonMiddleware'',\r\n ''django.contrib.sessions.middleware.SessionMiddleware'',\r\n ''django.middleware.csrf.CsrfViewMiddleware'',\r\n ''django.contrib.auth.middleware.AuthenticationMiddleware'',\r\n ''django.contrib.auth.middleware.RemoteUserMiddleware'',\r\n ''django.contrib.messages.middleware.MessageMiddleware'',\r\n ''django.middleware.clickjacking.XFrameOptionsMiddleware'')\r\nUSE_I18N	\r\nTrue\r\nTHOUSAND_SEPARATOR	\r\n'',''\r\nSECRET_KEY	\r\nu''********************''\r\nLANGUAGE_COOKIE_NAME	\r\n''django_language''\r\nDEFAULT_INDEX_TABLESPACE	\r\n''''\r\nGOOGLE_STEP2_URI	\r\n''http://tola.mercycorps.org/gwelcome''\r\nLOGGING_CONFIG	\r\n''logging.config.dictConfig''\r\nTEMPLATE_LOADERS	\r\n(''django.template.loaders.filesystem.Loader'',\r\n ''django.template.loaders.app_directories.Loader'')\r\nWSGI_APPLICATION	\r\n''tola.wsgi.application''\r\nTEMPLATE_DEBUG	\r\nTrue\r\nX_FRAME_OPTIONS	\r\n''SAMEORIGIN''\r\nAUTHENTICATION_BACKENDS	\r\n(''djangocosign.cosign.CosignBackend'',\r\n ''django.contrib.auth.backends.ModelBackend'')\r\nFORCE_SCRIPT_NAME	\r\nNone\r\nUSE_X_FORWARDED_HOST	\r\nFalse\r\nEMAIL_TIMEOUT	\r\nNone\r\nSECURE_SSL_HOST	\r\nNone\r\nSIGNING_BACKEND	\r\n''django.core.signing.TimestampSigner''\r\nSESSION_COOKIE_SECURE	\r\nFalse\r\nCSRF_COOKIE_DOMAIN	\r\nNone\r\nFILE_CHARSET	\r\n''utf-8''\r\nDEBUG	\r\nTrue\r\nLANGUAGE_COOKIE_DOMAIN	\r\nNone\r\nDEFAULT_FILE_STORAGE	\r\n''django.core.files.storage.FileSystemStorage''\r\nINSTALLED_APPS	\r\n(''django.contrib.auth'',\r\n ''django.contrib.contenttypes'',\r\n ''django.contrib.sessions'',\r\n ''django.contrib.sites'',\r\n ''django.contrib.messages'',\r\n ''django.contrib.staticfiles'',\r\n ''django.contrib.admin'',\r\n ''django.contrib.admindocs'',\r\n ''rest_framework'',\r\n ''django_tables2'',\r\n ''crispy_forms'',\r\n ''floppyforms'',\r\n ''django_extensions'',\r\n ''report_builder'',\r\n ''mathfilters'',\r\n ''import_export'',\r\n ''tola'',\r\n ''feed'',\r\n ''activitydb'',\r\n ''djangocosign'',\r\n ''indicators'')\r\nLANGUAGES	\r\n((''af'', ''Afrikaans''),\r\n (''ar'', ''Arabic''),\r\n (''ast'', ''Asturian''),', 1, NULL, 157, 5),
(291, '2015-11-19 17:57:24.000000', 'Ticket Opened', 'Change Community involvement to Stakeholder involvement on Project completion form, justification tab', 1, NULL, 158, 5),
(292, '2015-11-19 18:04:13.000000', 'Ticket Opened', 'Add Quality Assurance check reports are submitted and attached to the default project checklist ', 1, NULL, 159, 5);
INSERT INTO `helpdesk_followup` (`id`, `date`, `title`, `comment`, `public`, `new_status`, `ticket_id`, `user_id`) VALUES
(293, '2015-11-19 20:15:14.000000', 'Ticket Opened & Assigned to Greg Lind', 'We need the indicator data report to filter the select list of indicators down to indicators in the program that was selected.  This would connect the two filters a bit better and provide for finding or summing specific indicator reports by program a lot easier.', 1, NULL, 160, 11),
(294, '2015-11-20 07:39:36.000000', 'Comment', 'Can we have it show up under Lebanon as well?  Each country has its own targets and will be reporting results separately.\r\n', 1, NULL, 144, NULL),
(295, '2015-11-20 15:31:46.000000', 'Ticket Opened Via Web', 'I added results of a program indicator as well as the actual numbers in the dis-aggregation fields, when I went into indicator data to attach evidence, it opened without all the dis-aggregated data I had entered.', 1, NULL, 161, NULL),
(296, '2015-11-22 06:00:49.000000', 'Ticket Opened Via Web', 'some of our colleagues that login in Tola today for the first time, while clicking in site profile the system is asking them for user and password (nomar@af.mercycorps.org ) and also (rmomani@jo.mercycorps.org from jordan) as i saw his post in slack.	 ', 1, NULL, 162, NULL),
(297, '2015-11-23 04:09:38.000000', 'Ticket Opened Via Web', 'while i am going to Project>M&E tab> to add quantitative out i cant link the PA with indicator. i have attached you the screen shoot of the issue. ', 1, NULL, 163, NULL),
(298, '2015-11-23 05:07:24.000000', 'Ticket Opened Via Web', 'When I click on the "Export All" button at the bottom of the Indicator Plan Grid Print nothing happens. No broken link pages is returned, but the Grid Print page seems to only refresh itself. No export/download is initiated. \r\n\r\n', 1, NULL, 164, NULL),
(299, '2015-11-23 13:08:17.000000', 'Assigned to rmomani', '', 1, NULL, 164, NULL),
(300, '2015-11-23 15:16:07.000000', 'Comment', 'This issue still remains, please assist as we can''t move forward with Workflow until resolved!', 1, NULL, 152, NULL),
(301, '2015-11-24 14:34:22.000000', 'Ticket Opened Via Web', 'The admin levels 1,2 and 3 are still not as per lists provided for Lebanon.  Please find link to list below.', 1, NULL, 165, NULL),
(302, '2015-11-24 16:59:33.000000', 'Ticket Opened Via Web', 'data entered under indicator results, specifically in the disaggregation field seem to disappear when go back to edit data or add evidence.  The disaggregation cells previously filled are blank.', 1, NULL, 166, NULL),
(303, '2015-11-24 18:57:18.000000', 'Ticket Opened', 'Delete date created column on indicator planning page https://tola-activity.mercycorps.org/indicators/home/0/ \r\nand add objectives column ', 1, NULL, 167, 5),
(304, '2015-11-24 22:15:44.000000', 'Comment', 'The navigation is ordered by type and then precedence and then alpha.', 1, NULL, 106, 11),
(305, '2015-11-24 22:16:12.000000', 'Reopened', '', 1, 2, 105, 11),
(306, '2015-11-24 22:57:33.000000', 'Ticket Opened', 'ASAP.', 1, NULL, 168, 9),
(307, '2015-11-25 09:08:59.000000', 'Ticket Opened Via Web', 'We have a few questions around the entry of contact info. For example, in the Site Profile it would be good to be able to enter both a name and a designation/ title in a separate field, just as you do when you enter contact info for a stakeholder. Also, Oftentimes, the contact for a Site is also a stakeholder, and it would therefore be good to be able to choose from that same list that''s available under the stakeholder form. Lastly, that list of Contacts should show both name and designation, as people in this part of the world often has same or similar names. ', 1, NULL, 169, NULL),
(308, '2015-11-25 09:12:56.000000', 'Ticket Opened Via Web', 'The contact list under the SH form still holds random names (and referring to my previous ticket, doesn''t list the title), which makes it very difficult to choose the right one. ', 1, NULL, 170, NULL),
(309, '2015-11-25 09:20:35.000000', 'Ticket Opened Via Web', 'When adding data/results to indicators, I am getting an error screen.  Please find attached. It says ''indicator instance with collected data 173L does not exist.''', 1, NULL, 171, NULL),
(310, '2015-11-25 09:29:48.000000', 'Ticket Opened Via Web', 'It seems every time you click ''Save'' in either SH or Site Forms, a duplicate is created and you end up with a long list of the same SH or Site but with different edits. ', 1, NULL, 172, NULL),
(311, '2015-11-25 09:33:08.000000', 'Ticket Opened Via Web', 'As all our Project/ Activity codes relate to LIN codes, would it be possible to shift the LIN code to the first page, under the Activity code, on the PAF?', 1, NULL, 173, NULL),
(312, '2015-11-25 09:36:10.000000', 'Ticket Opened Via Web', 'It would be helpful to have a larger text box rather than just a single line, for the ''Other contributions'', as this requires narrative description which can sometimes be lengthy. ', 1, NULL, 174, NULL),
(313, '2015-11-25 09:39:40.000000', 'Ticket Opened Via Web', 'At the bottom of the PAF there is the option to upload documentation/ project files. It would be helpful if one could also choose from documentation that has already been uploaded, so there''s not a duplication of documents in Tola Workflow. ', 1, NULL, 175, NULL),
(314, '2015-11-25 11:02:18.000000', 'Ticket Opened Via Web', 'The objectives entered for the different programs are not showing up in the objectives box and what has been previously linked has disappeared.', 1, NULL, 176, NULL),
(315, '2015-11-25 11:03:48.000000', 'Ticket Opened Via Web', 'Develop a standard naming convention for the evidence that is linked to indicators.', 1, NULL, 177, NULL),
(316, '2015-11-25 13:28:13.000000', 'Ticket Opened Via Web', 'When going to indicator data and deleting a wrong added field, I get the below attached error page.', 1, NULL, 178, NULL),
(317, '2015-11-25 17:01:19.000000', 'Comment', 'It also happened with L185 to L225 and then L448.  I also found out that if I clicked on save twice or three times it is successfully uploaded.', 1, NULL, 171, NULL),
(318, '2015-11-25 19:53:59.000000', 'Ticket Opened Via Web', '1) Please see attached screenshot when trying to search for indicator.\r\n2) When trying to enter indicators for the same program, every time you try to enter a new indicator, you''re brought back, you have to search for the program again.  Is it possible to go back to the same program, instead of going all the way back to the page where you have to choose your program again?\r\n3) The indicators should always be in order: 1) Impact 2) Outcome 3) output and not in chronological order of when they were entered.  it is confusing the latter way- can this be addressed?\r\n4) How do you suggest we deal with entering targets for projects for which we aren''t priming, i.e., if Mercy Corps targets = 51% of the total target?  I guess we would enter our MC target but enter the total target somewhere?  Or enter total target but note that MC targets = 51% total target?', 1, NULL, 179, NULL),
(319, '2015-11-27 08:03:12.000000', 'Ticket Opened Via Web', 'I am assuming we use the GAIT 4 digit code to enable linking to GAIT, but it would be more useful to use FC as this is how the majority of people keep track of a grant, including program, finance and Ops. The GAIT code is never actually used outside GAIT. ', 1, NULL, 180, NULL),
(320, '2015-11-29 06:03:54.000000', 'Ticket Opened Via Web', 'edit and delete button is not working to Add Quantitative Outputs the page is remaining block and the table is not working  ', 1, NULL, 181, NULL),
(321, '2015-11-30 12:16:34.000000', 'Ticket Opened Via Web', 'i have tried to attached MOU to the stakeholders form. may you explain how to upload /attache the documnts  ', 1, NULL, 182, NULL),
(322, '2015-11-30 12:29:14.000000', 'Resolved', '', 1, 3, 178, 11),
(323, '2015-11-30 12:29:56.000000', 'Resolved', 'This was resolved with TA-163', 1, 3, 181, 11),
(324, '2015-11-30 12:36:09.000000', 'Comment', 'Can we get the project complete name and ID for this.  It looks like the indicator result being linked has an id of None.', 1, NULL, 163, 11),
(325, '2015-11-30 13:28:24.000000', 'Ticket Opened Via Web', '1) Cannot log out of Tola - usually if I have to log out I just switch browsers\r\n2) Stakeholders- when I add stakeholders, they appear more than once, but when i try to delete one, I end up deleting all of them.\r\n3) Stakeholders form- how to attach/upload supporting documents?\r\n', 1, NULL, 183, NULL),
(326, '2015-11-30 13:33:54.000000', 'Ticket Opened Via Web', 'On the training form, I would like to add Programs, but cannot do this on the Admin site.  How can i do this?', 1, NULL, 184, NULL),
(327, '2015-11-30 13:56:05.000000', 'Comment', 'Programs are not added, they are pulled in from GAIT automatically when they have a status of Funded.  If you are missing Programs confirm that they are in GAIT and funded and we can run the import process again.', 1, NULL, 184, 11),
(328, '2015-11-30 14:03:17.000000', 'Comment', '1) If you are referring to Tola Activity you will stay logged in until your Mercy Corps SSO token expires or you clear your browser cache the same as the hub and connect.\r\n2) We might need to create a separate issue for this with a screen shot or steps to reproduce because I have not been to recreate multiple stakeholders, do they appear on the stakeholders screen or in the Agreement form?\r\n3) I will create a separate issue for this, when you upload a document in the Activity Documents section they can then be attached on the stakeholders form via the dropdown.  That needs to be added to the form advice and made easier to do from the Stakeholder form.', 1, NULL, 183, 11),
(329, '2015-11-30 14:06:24.000000', 'Comment', 'You can attach MOU''s in documents section and they will show up in the Formal written description drop down as well as the Vetting Due Diligence.  We will add some clear advice in the form on how to do this and provide a link to make it easier.', 1, NULL, 182, 11),
(330, '2015-11-30 19:25:39.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 126, 11),
(331, '2015-11-30 19:25:39.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 127, 11),
(332, '2015-11-30 19:25:39.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 128, 11),
(333, '2015-11-30 19:25:39.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 129, 11),
(334, '2015-11-30 19:25:39.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 130, 11),
(335, '2015-11-30 19:25:39.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 131, 11),
(336, '2015-11-30 19:25:39.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 132, 11),
(337, '2015-11-30 19:25:39.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 133, 11),
(338, '2015-11-30 19:25:39.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 134, 11),
(339, '2015-11-30 19:38:43.000000', 'Assigned to glind', '', 1, NULL, 135, 11),
(340, '2015-11-30 20:51:53.000000', 'Assigned to atpham', '', 1, NULL, 144, 9),
(341, '2015-11-30 20:52:47.000000', 'Resolved', 'NLG program is now displaying under Lebanon. The official program name is:\r\n"GAITID: 5717 - Psychosocial Support and Safe Access to Education for Youth"\r\n\r\n', 1, 3, 144, 9),
(342, '2015-11-30 20:53:41.000000', 'Closed', 'Accepted resolution and closed ticket', 1, 4, 144, 11),
(343, '2015-11-30 20:54:33.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 136, 11),
(344, '2015-11-30 20:54:33.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 137, 11),
(345, '2015-11-30 20:54:33.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 138, 11),
(346, '2015-11-30 20:54:33.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 139, 11),
(347, '2015-11-30 20:54:33.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 140, 11),
(348, '2015-11-30 20:54:33.000000', 'Assigned to glind in bulk update', NULL, 1, NULL, 141, 11),
(349, '2015-11-30 21:01:08.000000', 'Resolved', 'Sarah resolved. Checked admin and all indicators for program were reselected as Lebanon', 1, 3, 143, 9),
(350, '2015-11-30 21:01:12.000000', 'Closed', 'Accepted resolution and closed ticket', 1, 4, 143, 9),
(351, '2015-11-30 21:15:47.000000', 'Ticket Opened', 'Request from NBO and Brandy:\r\nAdd risks and assumptions field to the justifications tab on the PA form ', 1, NULL, 185, 5),
(352, '2015-11-30 22:16:06.000000', 'Ticket Opened', 'Add specific guidance around the approved by field. I.e. how this is the "owner" of the indicator and is responsible for updating the indicator plan fields as well as ALL collected indicator data associated with the indicator.', 1, NULL, 186, 9),
(353, '2015-11-30 22:37:31.000000', 'Closed', '', 1, 4, 128, 11),
(354, '2015-11-30 22:52:36.000000', 'Closed', '', 1, 4, 129, 11),
(355, '2015-11-30 23:44:30.000000', 'Ticket Opened', 'Re-order the project checklist so it''s a logical order from initiation to completion of a project:\r\n1. Review site profile \r\n2. Review stakeholder profile \r\n3. Review indicator plan and add indicators \r\n4. Identify monitoring forms and add\r\n5. Indicators TvA at project level linked to evidence and reviewed for accuracy, matches with actuals reported in the evidence file\r\n6. Ensure lessons learned are documented with appropriate stakeholders giving input and disseminated\r\n7. Budget v Actuals, verify variances with finance\r\n8. All related documents are updated to completion date.', 1, NULL, 187, 5),
(356, '2015-12-01 01:20:15.000000', 'Updated', '', 0, NULL, 5, 11),
(357, '2015-12-01 01:20:48.000000', 'Closed', '', 1, 4, 5, 11),
(358, '2015-12-01 01:21:16.000000', 'Updated', '', 0, NULL, 5, 11),
(359, '2015-12-01 01:22:11.000000', 'Resolved', '', 1, 3, 111, 11),
(360, '2015-12-01 01:22:59.000000', 'Closed', '', 1, 4, 125, 11),
(361, '2015-12-01 01:24:18.000000', 'Closed', 'The old versions of the indicators types for DIG need to stay for now while in use, they can not be migrated to the alpha or standard ones imported directly from DIG', 1, 4, 147, 11),
(362, '2015-12-01 01:33:29.000000', 'Closed', '', 1, 4, 156, 11),
(363, '2015-12-01 01:49:22.000000', 'Resolved', 'They don''t have editor access to add a new site profile, I believe Andrew fixed it already.', 1, 3, 162, 11),
(364, '2015-12-01 01:52:20.000000', 'Closed', 'This has been updated to allow editing of the item, not the list.', 1, 4, 157, 11),
(365, '2015-12-01 10:22:37.000000', 'Ticket Opened Via Web', 'Program ''Emergency WASH, CP and Winterization for Syrian Refugees and Host Populations in Lebanon'' with GAITID 5755 is actually three different programs (WASH, Winterization and Child Protection) with three different PMs and cost centers.  The donor is UNICEF and the cost centers are 32563, 32635, 32636.  How do you suggest we enter it into Tola Data and track it?  I have entered the indicators under one GAIT number 5755.', 1, NULL, 188, NULL),
(366, '2015-12-01 14:16:14.000000', 'Assigned to glind', '', 1, NULL, 163, 11),
(367, '2015-12-01 18:40:17.000000', 'Ticket Opened Via Web', 'I have located Korahe, Ethiopia on the Sites form, but when I save it, the map automatically goes back to Kabul and does not allow me to save the Korahe location.', 1, NULL, 189, NULL),
(368, '2015-12-01 22:40:52.000000', 'Ticket Opened', 'Error when clicking the "New Indicator" button on the Indicator Planning page.\r\nPage: https://tola-activity.mercycorps.org/indicators/report/0/\r\n\r\nError: \r\nKeyError at /indicators/indicator_add/0/\r\n''pk''\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/indicators/indicator_add/0/\r\nDjango Version:	1.8.2\r\nException Type:	KeyError\r\nException Value:	\r\n''pk''\r\nException Location:	/var/www/tola-activity/htdocs/indicators/views.py in get_form_kwargs, line 200\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Tue, 1 Dec 2015 14:13:11 -0800\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in view\r\n                        return self.dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/indicators/views.py in dispatch\r\n                    return super(IndicatorCreate, self).dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in dispatch\r\n                    return handler(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    return super(BaseCreateView, self).get(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    form = self.get_form() ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get_form\r\n                    return form_class(**self.get_form_kwargs()) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/indicators/views.py in get_form_kwargs\r\n                    program = Indicator.objects.all().filter(id=self.kwargs[''pk'']).values("program__id") ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nNo POST data\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\nkm_lv	\r\n''x''\r\noptimizelyEndUserId	\r\n''oeu1424803601267r0.7453566913027316''\r\nkm_ai	\r\n''jJRcYSoOEZ%2FqN8CBpMykPPeqOwY%3D''\r\n_ga	\r\n''GA1.2.786396913.1424803602''\r\nkvcd	\r\n''1448394200057''\r\noptimizelySegments	\r\n''%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D''\r\nkm_uq	\r\n''''\r\nsessionid	\r\n''f7ov78tftt6qxhly267noj494gxfoamv''\r\ncsrftoken	\r\n''QCFOwpgLqnzHqVP7NEQxfKnRaXyJYWpX''\r\n__utma	\r\n''185632118.786396913.1424803602.1424803602.1424803602.1''\r\noptimizelyBuckets	\r\n''%7B%222214141681%22%3A%222231820528%22%2C%222445310539%22%3A%222465270090%22%7D''\r\ncosign-tola	\r\n''TzCGAHzfbr3QPurRTWH7abbTrgLrMN1hXAbeL5kj2W6BkPNrFxpQg5NUQxZH0uhOs7WQjz-8XxFiBGuEbPqsO8z1ypHZ82tF6LAeS-cKK5iFbypFbBh5FaVvGJQj/1449007973''\r\nMETA\r\nVariable	Value\r\nAUTH_TYPE	\r\n''Cosign''\r\nmod_wsgi.listener_port	\r\n''443''\r\nHTTP_REFERER	\r\n''https://tola-activity.mercycorps.org/indicators/report/98/''\r\nmod_wsgi.listener_host	\r\n''''\r\nSERVER_SOFTWARE	\r\n''Apache''\r\nSCRIPT_NAME	\r\nu''''\r\nmod_wsgi.enable_sendfile	\r\n''0''\r\nmod_wsgi.handler_script	\r\n''''\r\nSERVER_SIGNATURE	\r\n''<address>Apache Server at tola-activity.mercycorps.org Port 443</address>\\n''\r\nREQUEST_METHOD	\r\n''GET''\r\nPATH_INFO	\r\nu''/indicators/indicator_add/0/''\r\nSERVER_PROTOCOL	\r\n''HTTP/1.1''\r\nQUERY_STRING	\r\n''''\r\nSSL_TLS_SNI	\r\n''tola-activity.mercycorps.org''\r\nCOSIGN_SERVICE	\r\n''cosign-tola''\r\nHTTP_USER_AGENT	\r\n''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36''\r\nHTTP_CONNECTION	\r\n''keep-alive''\r\nREMOTE_REALM	\r\n''ldap''\r\nSERVER_NAME	\r\n''tola-activity.mercycorps.org''\r\nREMOTE_ADDR	\r\n''10.10.40.244''\r\nmod_wsgi.queue_start	\r\n''1449007990613172''\r\nmod_wsgi.request_handler	\r\n''wsgi-script''\r\nwsgi.url_scheme	\r\n''https''\r\nPATH_TRANSLATED	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py/indicators/indicator_add/0/''\r\nSERVER_PORT	\r\n''443''\r\nwsgi.multiprocess	\r\nTrue\r\nmod_wsgi.input_chunked	\r\n''0''\r\nSERVER_ADDR	\r\n''192.168.8.72''\r\nDOCUMENT_ROOT	\r\n''/var/www/tola-activity/htdocs''\r\nmod_wsgi.process_group	\r\n''tola-activity''\r\nSCRIPT_FILENAME	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py''\r\nCOSIGN_FACTOR	\r\n''ldap''\r\nSERVER_ADMIN	\r\n''root@localhost''\r\nwsgi.input	\r\n<mod_wsgi.Input object at 0xa3736f70>\r\nREMOTE_USER	\r\n''ksandstrom''\r\nHTTP_HOST	\r\n''tola-activity.mercycorps.org''\r\nwsgi.multithread	\r\nTrue\r\nHTTP_UPGRADE_INSECURE_REQUESTS	\r\n''1''\r\nREQUEST_URI	\r\n''/indicators/indicator_add/0/''\r\nHTTP_ACCEPT	\r\n''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\r\nPERL5LIB	\r\n''/usr/share/awstats/lib:/usr/share/awstats/plugins''\r\nmod_wsgi.callable_object	\r\n''application''\r\nwsgi.version	\r\n(1, 0)\r\nGATEWAY_INTERFACE	\r\n''CGI/1.1''\r\nwsgi.run_once	\r\nFalse\r\nwsgi.errors	\r\n<mod_wsgi.Log object at 0xa3a3c3b8>\r\nREMOTE_PORT	\r\n''52178''\r\nHTTP_ACCEPT_LANGUAGE	\r\n''en-US,en;q=0.8''\r\nmod_wsgi.version	\r\n(3, 4)\r\nmod_wsgi.application_group	\r\n''tola-activity.mercycorps.org|''\r\nmod_wsgi.script_reloading	\r\n''1''\r\nwsgi.file_wrapper	\r\n''''\r\nCSRF_COOKIE	\r\nu''QCFOwpgLqnzHqVP7NEQxfKnRaXyJYWpX''\r\nHTTP_ACCEPT_ENCODING	\r\n''gzip, deflate, sdch''\r\nHTTP_COOKIE	\r\n''optimizelyEndUserId=oeu1424803601267r0.7453566913027316; __utma=185632118.786396913.1424803602.1424803602.1424803602.1; km_ai=jJRcYSoOEZ%2FqN8CBpMykPPeqOwY%3D; km_lv=x; optimizelySegments=%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D; optimizelyBuckets=%7B%222214141681%22%3A%222231820528%22%2C%222445310539%22%3A%222465270090%22%7D; _ga=GA1.2.786396913.1424803602; kvcd=1448394200057; km_uq=; sessionid=f7ov78tftt6qxhly267noj494gxfoamv; csrftoken=QCFOwpgLqnzHqVP7NEQxfKnRaXyJYWpX; cosign-tola=TzCGAHzfbr3QPurRTWH7abbTrgLrMN1hXAbeL5kj2W6BkPNrFxpQg5NUQxZH0uhOs7WQjz-8XxFiBGuEbPqsO8z1ypHZ82tF6LAeS-cKK5iFbypFbBh5FaVvGJQj/1449007973''\r\nSettings\r\nUsing settings module tola.settings.local\r\nSetting	Value\r\nSECURE_BROWSER_XSS_FILTER	\r\nFalse\r\nUSE_THOUSAND_SEPARATOR	\r\nFalse\r\nCSRF_COOKIE_SECURE	\r\nFalse\r\nLANGUAGE_CODE	\r\n''en-us''\r\nROOT_URLCONF	\r\n''tola.urls''\r\nMANAGERS	\r\n((''admin'', ''tola@tola.org''),)\r\nSILENCED_SYSTEM_CHECKS	\r\n[]\r\nDEFAULT_CHARSET	\r\n''utf-8''\r\nSESSION_SERIALIZER	\r\n''django.contrib.sessions.serializers.JSONSerializer''\r\nSTATIC_ROOT	\r\n''/var/www/tola-activity/htdocs/assets''\r\nLDAP_LOGIN	\r\n''uid=pluma,ou=People,dc=system,dc=mercycorps,dc=org''\r\nDJANGO_ROOT	\r\n''/var/www/tola-activity/htdocs/tola''\r\nALLOWED_HOSTS	\r\n[]\r\nEMAIL_HOST	\r\n''localhost''\r\nMESSAGE_STORAGE	\r\n''django.contrib.messages.storage.fallback.FallbackStorage''\r\nEMAIL_SUBJECT_PREFIX	\r\n''[Django] ''\r\nSERVER_EMAIL	\r\n''root@localhost''\r\nSECURE_HSTS_SECONDS	\r\n0\r\nSTATICFILES_FINDERS	\r\n(''django.contrib.staticfiles.finders.FileSystemFinder'',\r\n ''django.contrib.staticfiles.finders.AppDirectoriesFinder'')\r\nSESSION_CACHE_ALIAS	\r\n''default''\r\nSESSION_COOKIE_DOMAIN	\r\nNone\r\nSESSION_COOKIE_NAME	\r\n''sessionid''\r\nTIME_INPUT_FORMATS	\r\n(''%H:%M:%S'', ''%H:%M:%S.%f'', ''%H:%M'')\r\nSECURE_REDIRECT_EXEMPT	\r\n[]\r\nDATABASES	\r\n{''default'': {''ATOMIC_REQUESTS'': False,\r\n             ''AUTOCOMMIT'': True,\r\n             ''CONN_MAX_AGE'': 0,\r\n             ''ENGINE'': ''django.db.backends.mysql'',\r\n             ''HOST'': ''localhost'',\r\n             ''NAME'': ''tola_activity'',\r\n             ''OPTIONS'': {},\r\n             ''PASSWORD'': u''********************'',\r\n             ''PORT'': '''',\r\n             ''TEST'': {''CHARSET'': None,\r\n                      ''COLLATION'': None,\r\n                      ''MIRROR'': None,\r\n                      ''NAME'': None},\r\n             ''TIME_ZONE'': ''UTC'',\r\n             ''USER'': ''tolaactivity''}}\r\nEMAIL_SSL_KEYFILE	\r\nu''********************''\r\nFILE_UPLOAD_DIRECTORY_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_HANDLERS	\r\n(''django.core.files.uploadhandler.MemoryFileUploadHandler'',\r\n ''django.core.files.uploadhandler.TemporaryFileUploadHandler'')\r\nTEMPLATE_CONTEXT_PROCESSORS	\r\n(''django.contrib.auth.context_processors.auth'',\r\n ''django.core.context_processors.debug'',\r\n ''django.core.context_processors.i18n'',\r\n ''django.core.context_processors.media'',\r\n ''django.core.context_processors.static'',\r\n ''django.core.context_processors.tz'',\r\n ''django.contrib.messages.context_processors.messages'',\r\n ''django.core.context_processors.request'')\r\nDEFAULT_CONTENT_TYPE	\r\n''text/html''\r\nREPORT_BUILDER_INCLUDE	\r\n[]\r\nAPPEND_SLASH	\r\nTrue\r\nFIRST_DAY_OF_WEEK	\r\n0\r\nDATABASE_ROUTERS	\r\n[]\r\nDEFAULT_TABLESPACE	\r\n''''\r\nLOCAL_APPS	\r\n(''tola'', ''feed'', ''activitydb'', ''djangocosign'', ''indicators'', ''customdashboard'')\r\nYEAR_MONTH_FORMAT	\r\n''F Y''\r\nSTATICFILES_STORAGE	\r\n''django.contrib.staticfiles.storage.StaticFilesStorage''\r\nCACHES	\r\n{''default'': {''BACKEND'': ''django.core.cache.backends.locmem.LocMemCache''}}\r\nSESSION_COOKIE_PATH	\r\n''/''\r\nSECURE_CONTENT_TYPE_NOSNIFF	\r\nFalse\r\nMIDDLEWARE_CLASSES	\r\n(''django.middleware.common.CommonMiddleware'',\r\n ''django.contrib.sessions.middleware.SessionMiddleware'',\r\n ''django.middleware.csrf.CsrfViewMiddleware'',\r\n ''django.contrib.auth.middleware.AuthenticationMiddleware'',\r\n ''django.contrib.auth.middleware.RemoteUserMiddleware'',\r\n ''django.contrib.messages.middleware.MessageMiddleware'',\r\n ''django.middleware.clickjacking.XFrameOptionsMiddleware'')\r\nUSE_I18N	\r\nTrue\r\nTHOUSAND_SEPARATOR	\r\n'',''\r\nSECRET_KEY	\r\nu''********************''\r\nLANGUAGE_COOKIE_NAME	\r\n''django_language''\r\nDEFAULT_INDEX_TABLESPACE	\r\n''''\r\nGOOGLE_STEP2_URI	\r\n''http://tola.mercycorps.org/gwelcome''\r\nLOGGING_CONFIG	\r\n''logging.config.dictConfig''\r\nTEMPLATE_LOADERS	\r\n(''django.template.loaders.filesystem.Loader'',\r\n ''django.template.loaders.app_directories.Loader'')\r\nWSGI_APPLICATION	\r\n''tola.wsgi.application''\r\nTEMPLATE_DEBUG	\r\nTrue\r\nX_FRAME_OPTIONS	\r\n''SAMEORIGIN''\r\nAUTHENTICATION_BACKENDS	\r\n(''djangocosign.cosign.CosignBackend'',\r\n ''django.contrib.auth.backends.ModelBackend'')\r\nFORCE_SCRIPT_NAME	\r\nNone\r\nUSE_X_FORWARDED_HOST	\r\nFalse\r\nEMAIL_TIMEOUT	\r\nNone\r\nSECURE_SSL_HOST	\r\nNone\r\nSIGNING_BACKEND	\r\n''django.core.signing.TimestampSigner''\r\nSESSION_COOKIE_SECURE	\r\nFalse\r\nCSRF_COOKIE_DOMAIN	\r\nNone\r\nFILE_CHARSET	\r\n''utf-8''\r\nDEBUG	\r\nTrue\r\nLANGUAGE_COOKIE_DOMAIN	\r\nNone\r\nDEFAULT_FILE_STORAGE	\r\n''django.core.files.storage.FileSystemStorage''\r\nINSTALLED_APPS	\r\n(''django.contrib.auth'',\r\n ''django.contrib.contenttypes'',\r\n ''django.contrib.sessions'',\r\n ''django.contrib.sites'',\r\n ''django.contrib.messages'',\r\n ''django.contrib.staticfiles'',\r\n ''django.contrib.admin'',\r\n ''django.contrib.admindocs'',\r\n ''rest_framework'',\r\n ''django_tables2'',\r\n ''crispy_forms'',\r\n ''floppyforms'',\r\n ''django_extensions'',\r\n ''report_builder'',\r\n ''mathfilters'',\r\n ''import_export'',\r\n ''tola'',\r\n ''feed'',\r\n ''activitydb'',\r\n ''djangocosign'',\r\n ''indicators'',\r\n ''customdashboard'')\r\nLANGUAGES	\r\n((''af'', ''Afrikaans''),\r\n (''ar'', ''Arabic''),\r\n (''ast'', ''Asturian''),\r\n (''az'', ''Azerbaijani''),\r\n (''bg'', ''Bulgarian''),\r\n (''be'', ''Belarusian''),\r\n (''bn'', ''Bengali''),\r\n (''br'', ''Breton''),\r\n (''bs'', ''Bosnian''),\r\n (''ca'', ''Catalan''),\r\n (''cs'', ''Czech''),\r\n (''cy'', ''Welsh''),\r\n (''da'', ''Danish''),\r\n (''de'', ''German''),\r\n (''el'', ''Greek''),\r\n (''en'', ''English''),\r\n (''en-au'', ''Australian English''),\r\n (''en-gb'', ''British English''),\r\n (''eo'', ''Esperanto''),\r\n (''es'', ''Spanish''),\r\n (''es-ar'', ''Argentinian Spanish''),\r\n (''es-mx'', ''Mexican Spanish''),\r\n (''es-ni'', ''Nicaraguan Spanish''),\r\n (''es-ve'', ''Venezuelan Spanish''),\r\n (''et'', ''Estonian''),\r\n (''eu'', ''Basque''),\r\n (''fa'', ''Persian''),\r\n (''fi'', ''Finnish''),\r\n (''fr'', ''French''),\r\n (''fy'', ''Frisian''),\r\n (''ga'', ''Irish''),\r\n (''gl'', ''Galician''),\r\n (''he'', ''Hebrew''),\r\n (''hi'', ''Hindi''),\r\n (''hr'', ''Croatian''),\r\n (''hu'', ''Hungarian''),\r\n (''ia'', ''Interlingua''),\r\n (''id'', ''Indonesian''),\r\n (''io'', ''Ido''),\r\n (''is'', ''Icelandic''),\r\n (''it'', ''Italian''),\r\n (''ja'', ''Japanese''),\r\n (''ka'', ''Georgian''),\r\n (''kk'', ''Kazakh''),\r\n (''km'', ''Khmer''),\r\n (''kn'', ''Kannada''),\r\n (''ko'', ''Korean''),\r\n (''lb'', ''Luxembourgish''),\r\n (''lt'', ''Lithuanian''),\r\n (''lv'', ''Latvian''),\r\n (''mk'', ''Macedonian''),\r\n (''ml'', ''Malayalam''),\r\n (''mn'', ''Mongolian''),\r\n (''mr'', ''Marathi''),\r\n (''my'', ''Burmese''),\r\n (''nb'', ''Norwegian Bokmal''),\r\n (''ne'', ''Nepali''),\r\n (''nl'', ''Dutch''),\r\n (''nn'', ''Norwegian Nynorsk''),\r\n (''os'', ''Ossetic''),\r\n (''pa'', ''Punjabi''),\r\n (''pl'', ''Polish''),\r\n (''pt'', ''Portuguese''),\r\n (''pt-br'', ''Brazilian Portuguese''),\r\n (''ro'', ''Romanian''),\r\n (''ru'', ''Russian''),\r\n (''sk'', ''Slovak''),\r\n (''sl'', ''Slovenian''),\r\n (''sq'', ''Albanian''),\r\n (''sr'', ''Serbian''),\r\n (''sr-latn'', ''Serbian Latin''),\r\n (''sv'', ''Swedish''),\r\n (''sw'', ''Swahili''),\r\n (''ta'', ''Tamil''),\r\n (''te'', ''Telugu''),\r\n (''th'', ''Thai''),\r\n (''tr'', ''Turkish''),\r\n (''tt'', ''Tatar''),\r\n (''udm'', ''Udmurt''),\r\n (''uk'', ''Ukrainian''),\r\n (''ur'', ''Urdu''),\r\n (''vi'', ''Vietnamese''),\r\n (''zh-cn'', ''Simplified Chinese''),\r\n (''zh-hans'', ''Simplified Chinese''),\r\n (''zh-hant'', ''Traditional Chinese''),\r\n (''zh-tw'', ''Traditional Chinese''))\r\nUSE_L10N	\r\nFalse\r\nREPORT_BUILDER_EXCLUDE	\r\n[''user'', ''groups'', ''read'', ''template'', ''silo'', ''readtoken'']\r\nREPORT_BUILDER_ASYNC_REPORT	\r\nFalse\r\nLDAP_PASSWORD	\r\nu''********************''\r\nSECURE_HSTS_INCLUDE_SUBDOMAINS	\r\nFalse\r\nSTATICFILES_DIRS	\r\n(''/var/www/tola-activity/htdocs/static'',)\r\nPREPEND_WWW	\r\nFalse\r\nSECURE_PROXY_SSL_HEADER	\r\nNone\r\nLANGUAGE_COOKIE_AGE	\r\nNone\r\nSESSION_COOKIE_HTTPONLY	\r\nTrue\r\nDEBUG_PROPAGATE_EXCEPTIONS	\r\nFalse\r\nCSRF_COOKIE_AGE	\r\n31449600\r\nMONTH_DAY_FORMAT	\r\n''F j''\r\nLOGIN_URL	\r\n''/accounts/login/''\r\nSESSION_EXPIRE_AT_BROWSER_CLOSE	\r\nFalse\r\nLDAP_SERVER	\r\n''ldaps://demeter.mercycorps.org''\r\nTIME_FORMAT	\r\n''P''\r\nAUTH_USER_MODEL	\r\n''auth.User''\r\nDATE_INPUT_FORMATS	\r\n(''%Y-%m-%d'',\r\n ''%m/%d/%Y'',\r\n ''%m/%d/%y'',\r\n ''%b %d %Y'',\r\n ''%b %d, %Y'',\r\n ''%d %b %Y'',\r\n ''%d %b, %Y'',\r\n ''%B %d %Y'',\r\n ''%B %d, %Y'',\r\n ''%d %B %Y'',\r\n ''%d %B, %Y'')\r\nCSRF_COOKIE_NAME	\r\n''csrftoken''\r\nEMAIL_HOST_PASSWORD	\r\nu''********************''\r\nPASSWORD_RESET_TIMEOUT_DAYS	\r\nu''********************''\r\nSESSION_FILE_PATH	\r\nNone\r\nCACHE_MIDDLEWARE_ALIAS	\r\n''default''\r\nSESSION_SAVE_EVERY_REQUEST	\r\nFalse\r\nNUMBER_GROUPING	\r\n0\r\nSESSION_ENGINE	\r\n''django.contrib.sessions.backends.db''\r\nCSRF_FAILURE_VIEW	\r\n''django.views.csrf.csrf_failure''\r\nCSRF_COOKIE_PATH	\r\n''/''\r\nLOGIN_REDIRECT_URL	\r\n''/accounts/profile/''\r\nDECIMAL_SEPARATOR	\r\n''.''\r\nIGNORABLE_404_URLS	\r\n()\r\nLOCALE_PATHS	\r\n()\r\nTEMPLATE_STRING_IF_INVALID	\r\n''''\r\nLOGOUT_URL	\r\n''/accounts/logout/''\r\nEMAIL_USE_TLS	\r\nFalse\r\nFIXTURE_DIRS	\r\n(''/var/www/tola-activity/htdocs/fixtures'',)\r\nGOOGLE_CLIENT_ID	\r\n''617113120802.apps.googleusercontent.com''\r\nDATE_FORMAT	\r\n''Y-n-d''\r\nLDAP_USER_GROUP	\r\n''ertb''\r\nMEDIA_ROOT	\r\n''/var/www/tola-activity/htdocs/media''\r\nLANGUAGE_COOKIE_PATH	\r\n''/''\r\nLDAP_ADMIN_GROUP	\r\n''ertb-admin''\r\nDEFAULT_EXCEPTION_REPORTER_FILTER	\r\n''django.views.debug.SafeExceptionReporterFilter''\r\nADMINS	\r\n((''admin'', ''tola@tola.org''),)\r\nFORMAT_MODULE_PATH	\r\nNone\r\nDEFAULT_FROM_EMAIL	\r\n''webmaster@localhost''\r\nREST_FRAMEWORK	\r\n{''DEFAULT_FILTER_BACKENDS'': (''rest_framework.filters.DjangoFilterBackend'',),\r\n ''PAGINATE_BY'': 10}\r\nMEDIA_URL	\r\n''/media/''\r\nDATETIME_FORMAT	\r\n''N j, Y, P''\r\nTEMPLATE_DIRS	\r\n(''/var/www/tola-activity/htdocs/templates'',)\r\nSITE_ID	\r\n1\r\nDISALLOWED_USER_AGENTS	\r\n()\r\nALLOWED_INCLUDE_ROOTS	\r\n()\r\nGOOGLE_CLIENT_SECRET	\r\nu''********************''\r\nLOGGING	\r\n{''disable_existing_loggers'': False,\r\n ''formatters'': {''simple'': {''format'': ''%(levelname)s %(message)s''},\r\n                ''verbose'': {''datefmt'': ''%Y-%d-%b %H:%M:%S'',\r\n                            ''format'': ''[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s''}},\r\n ''handlers'': {''console'': {''class'': ''logging.StreamHandler'',\r\n                          ''formatter'': ''simple'',\r\n                          ''level'': ''DEBUG''},\r\n              ''file'': {''class'': ''logging.FileHandler'',\r\n                       ''filename'': ''/var/www/tola-activity/htdocs/error.log'',\r\n                       ''formatter'': ''verbose'',\r\n                       ''level'': ''WARNING''}},\r\n ''loggers'': {''django'': {''handlers'': [''file''],\r\n                        ''level'': ''DEBUG'',\r\n                        ''propagate'': True},\r\n             ''epro'': {''handlers'': [''file''],\r\n                      ''level'': ''WARNING'',\r\n                      ''propagate'': True}},\r\n ''version'': 1}\r\nSHORT_DATE_FORMAT	\r\n''m/d/Y''\r\nTEMPLATES	\r\n[]\r\nTEST_RUNNER	\r\n''django.test.runner.DiscoverRunner''\r\nCACHE_MIDDLEWARE_KEY_PREFIX	\r\nu''********************''\r\nSECURE_SSL_REDIRECT	\r\nFalse\r\nTIME_ZONE	\r\n''America/Los_Angeles''\r\nFILE_UPLOAD_MAX_MEMORY_SIZE	\r\n2621440\r\nEMAIL_BACKEND	\r\n''django.core.mail.backends.console.EmailBackend''\r\nEMAIL_USE_SSL	\r\nFalse\r\nCRISPY_TEMPLATE_PACK	\r\n''bootstrap3''\r\nMIGRATION_MODULES	\r\n{}\r\nSITE_NAME	\r\n''tola''\r\nSESSION_COOKIE_AGE	\r\n1209600\r\nSETTINGS_MODULE	\r\n''tola.settings.local''\r\nPROJECT_PATH	\r\n''/var/www/tola-activity/htdocs''\r\nUSE_ETAGS	\r\nFalse\r\nSITE_ROOT	\r\n''/var/www/tola-activity/htdocs''\r\nLANGUAGES_BIDI	\r\n(''he'', ''ar'', ''fa'', ''ur'')\r\nFILE_UPLOAD_TEMP_DIR	\r\nNone\r\nINTERNAL_IPS	\r\n()\r\nSTATIC_URL	\r\n''/static/''\r\nEMAIL_PORT	\r\n25\r\nUSE_TZ	\r\nTrue\r\nSHORT_DATETIME_FORMAT	\r\n''m/d/Y P''\r\nTEST_NON_SERIALIZED_APPS	\r\n[]\r\nPASSWORD_HASHERS	\r\nu''********************''\r\nTHIRD_PARTY_APPS	\r\n(''rest_framework'',\r\n ''django_tables2'',\r\n ''crispy_forms'',\r\n ''floppyforms'',\r\n ''django_extensions'',\r\n ''report_builder'',\r\n ''mathfilters'',\r\n ''import_export'')\r\nABSOLUTE_URL_OVERRIDES	\r\n{}\r\nDJANGO_APPS	\r\n(''django.contrib.auth'',\r\n ''django.contrib.contenttypes'',\r\n ''django.contrib.sessions'',\r\n ''django.contrib.sites'',\r\n ''django.contrib.messages'',\r\n ''django.contrib.staticfiles'',\r\n ''django.contrib.admin'',\r\n ''django.contrib.admindocs'')\r\nCACHE_MIDDLEWARE_SECONDS	\r\n600\r\nEMAIL_SSL_CERTFILE	\r\nNone\r\nCSRF_COOKIE_HTTPONLY	\r\nFalse\r\nDATETIME_INPUT_FORMATS	\r\n(''%Y-%m-%d %H:%M:%S'',\r\n ''%Y-%m-%d %H:%M:%S.%f'',\r\n ''%Y-%m-%d %H:%M'',\r\n ''%Y-%m-%d'',\r\n ''%m/%d/%Y %H:%M:%S'',\r\n ''%m/%d/%Y %H:%M:%S.%f'',\r\n ''%m/%d/%Y %H:%M'',\r\n ''%m/%d/%Y'',\r\n ''%m/%d/%y %H:%M:%S'',\r\n ''%m/%d/%y %H:%M:%S.%f'',\r\n ''%m/%d/%y %H:%M'',\r\n ''%m/%d/%y'')\r\nEMAIL_HOST_USER	\r\n''''\r\nYou''re seeing this error because you have DEBUG = True in your Django settings file. Change that to False, and Django will display a standard page generated by the handler for this status code.\r\n', 1, NULL, 190, 8),
(369, '2015-12-01 23:35:15.000000', 'Comment', 'User: nnajjar is suspended in ldap', 0, NULL, 47, 8),
(370, '2015-12-02 05:34:24.000000', 'Comment', 'PA# 44 office code AF04 (Exposure visit / meeting among associations & buyers at Kabul Province.)\r\n\r\nI can not add new quantitative output (when i enter the indicator it says "success" but when i click close it says "invalid form" and it would not add the indicator. I tried many times but its the same result\r\n\r\nEdit and delete button is not working too ( some of the data entry guy entered duplicate Quantitative output i want to delete them or edit but shows error)', 1, NULL, 163, NULL),
(371, '2015-12-02 20:24:30.000000', 'Assigned to glind', '', 1, NULL, 2, 11),
(372, '2015-12-03 10:48:40.000000', 'Ticket Opened Via Web', 'Hi, Is there any way, If we can import beneficiary list rather adding beneficiaries individually. I clicked on the Import beneficiary, but the window just got blurred. Its not working\r\n', 1, NULL, 191, NULL),
(373, '2015-12-03 17:59:14.000000', 'Resolved', 'That button should not be there anymore.  Indicators can only be added from the program they are being associated with.', 1, 3, 190, 11),
(374, '2015-12-03 18:03:21.000000', 'Comment', 'The default address/search field in the sites form always resets back to Kabul as the default.  The location of the lat-long and the point on the map should have been saved and stored in the database and display in the form and on the map itself.  The search field isn''t actually used for anything other then to look up a new location via google maps, the name of previous searches does not get stored in the database.', 1, NULL, 189, 11),
(375, '2015-12-03 18:04:34.000000', 'Comment', 'At the moment the beneficiaries can not be imported in bulk just entered one at a time.  The import button is just a placeholder, we hope to have import from TolaTables working in the next week or 2.', 1, NULL, 191, 11),
(376, '2015-12-03 18:06:36.000000', 'Comment', 'Our suggestion for this program would be too duplicate the program manually in the Admin and append the fund code to the name.  We don''t currently have a way to handle multiple cost centers from GAIT but we will look at this.', 1, NULL, 188, 11),
(377, '2015-12-03 18:08:10.000000', 'Resolved', '', 1, 3, 184, 11),
(378, '2015-12-03 18:11:38.000000', 'Comment', 'The problem is there are multiple fund codes for some projects and we need a unique way to identify programs.  We could display the fund code more prominently.  The GAIT code is used as a unique ID for all programs in Mercy Corps and allows us to sync and share data with other systems like Navigator.', 1, NULL, 180, 11),
(379, '2015-12-03 18:39:12.000000', 'Comment', 'Objectives are now linked to the specific program.  So when you create an indicator the objectives will display based on the program you selected.  The linking of objectives to indicators happens in the admin when an objective is created or updated.', 1, NULL, 176, 11),
(380, '2015-12-06 18:59:55.000000', 'Ticket Opened & Assigned to Greg Lind', 'It''s difficult to find a project or program from the home page on.  We need a quick search tool in the header that will allow users to find a project quickly by name, activity code, fund code etc.  \r\n\r\nThis should be clearly documented what fields it searches and where those results will take you.  Auto complete would help as well.\r\nThe search bar should show up when the user icon is clicked when the user is logged in along with the links to the user profile.  \r\n\r\nSearch should allow for now program name, gaitid, project name, activity id, indicator name and indicator number.  It should show those results via autocomplete and a pop-over/shadowbox window.  When a result is clicked on it should take you either to the Project Dashboard, Program Dashboard or Indicator Plan.\r\n\r\nResults should be broken down by Dashboard in the results page as well.  ', 1, NULL, 192, 11),
(382, '2015-12-07 18:17:41.000000', 'Ticket Opened & Assigned to Greg Lind', 'We may need to link sites to indicators in some way.  The most granular level to do that at would be via the collected data field.  This would be a drop down of all user accessbile country sites and allow for more then one site per indicator as well as more then one for a collected data set.  \r\n\r\n', 1, NULL, 194, 11),
(383, '2015-12-07 18:25:50.000000', 'Ticket Opened', 'We need to classify land types for each site.  It looks like the best place to add this would be the demographics tab with a field called Land Classification.  Values would be Rural, Urban, Peri-Urban and other?  My guess is we make this a managed field in the admin but universal so everyone uses the same classifications.', 1, NULL, 195, 11),
(384, '2015-12-08 04:33:21.000000', 'Closed', 'Added a land classifier ''Land Type'' to site profile and admin.', 1, 4, 195, NULL),
(385, '2015-12-09 02:14:21.000000', 'Closed', 'Closing this ticket for now, since they user''s ldap and email account has been suspended. Will reference later if similar issues come up. ', 1, 4, 47, 8),
(386, '2015-12-09 02:59:58.000000', 'Ticket Opened', 'Delete Checklist Errors  redirects to:\r\n\r\ncommunity_map.html\r\nWhoops!\r\n\r\n', 1, NULL, 196, 8),
(387, '2015-12-09 03:10:25.000000', 'Closed', 'verified users have site | site | can add site', 1, 4, 162, 8),
(388, '2015-12-09 05:54:04.000000', 'Ticket Opened Via Web', 'in completion form under impact while i click in add quantitative outputs in the table i only can see the indicators belong to INVEST program even while i am changing the program name.', 1, NULL, 197, NULL),
(389, '2015-12-09 16:10:54.000000', 'Ticket Opened', 'Breadcrumb link back to "Project Dashboard" broken when navigating from Project Dashboard > Project Planning "Benchmark and Monitoring Data List" > Project Dashboard', 1, NULL, 198, 8),
(390, '2015-12-09 16:17:10.000000', 'Ticket Opened', 'The drop-down list for "Programs" and "Sites" in the PA form "Executive Summary" should be alphanumeric. ', 1, NULL, 199, 8),
(391, '2015-12-09 16:37:01.000000', 'Ticket Opened', 'The drop-down list of "Programs" and "Projects" in Documentation Form should be alphanumeric.', 1, NULL, 200, 8),
(392, '2015-12-09 16:47:40.000000', 'Ticket Opened', 'If a user enters a document under "Add Documentation" and clicks "Save" multiple times, the document is saved each time as a separate document.  \r\n', 1, NULL, 201, 8),
(393, '2015-12-09 21:40:52.000000', 'Resolved', '', 1, 3, 98, 11),
(394, '2015-12-09 21:41:31.000000', 'Resolved', '', 1, 3, 126, 11),
(395, '2015-12-09 21:41:44.000000', 'Resolved', '', 1, 3, 127, 11),
(396, '2015-12-09 21:43:04.000000', 'Resolved', 'We need the name and activity fields and can not remove those, site does auto populate and we have removed duration fields.', 1, 3, 134, 11),
(397, '2015-12-09 21:44:15.000000', 'Resolved', '', 1, 3, 138, 11),
(398, '2015-12-09 21:44:32.000000', 'Resolved', '', 1, 3, 135, 11),
(399, '2015-12-09 21:44:49.000000', 'Resolved', '', 1, 3, 139, 11),
(400, '2015-12-09 22:46:15.000000', 'Closed', '', 1, 4, 111, 8),
(401, '2015-12-09 22:57:18.000000', 'Resolved', '', 1, 3, 140, 11),
(402, '2015-12-09 23:08:25.000000', 'Closed', '', 1, 4, 127, 8),
(403, '2015-12-09 23:24:38.000000', 'Closed', 'closed except:\r\n4) Change "Budget Variance" to "Budget versus Actual variance"\r\nand\r\n12) Move "Other Budget Contribution" tab to the bottom of the "Budget" tab', 1, 4, 135, 8),
(404, '2015-12-09 23:30:40.000000', 'Closed', '', 1, 4, 138, 8),
(405, '2015-12-09 23:31:39.000000', 'Closed', '', 1, 4, 190, 8),
(406, '2015-12-09 23:32:26.000000', 'Closed', '', 1, 4, 184, 8),
(407, '2015-12-10 00:00:45.000000', 'Closed', '', 1, 4, 178, 8),
(408, '2015-12-10 00:03:09.000000', 'Closed', '', 1, 4, 139, 8),
(409, '2015-12-10 00:08:33.000000', 'Closed', 'closed except: \r\n\r\nJustification tab - there is no checklist for uploading/linking full stakeholder analysis and description of deliverables \r\n\r\nand \r\n\r\nApproval tab - Approval was not changed to Approval Status', 1, 4, 98, 8),
(410, '2015-12-10 00:17:08.000000', 'Closed', '', 1, 4, 140, 8),
(411, '2015-12-10 00:35:14.000000', 'Closed', '', 1, 4, 181, 8),
(412, '2015-12-10 02:15:30.000000', 'Closed', 'Justification Tab removed TA-138', 1, 4, 158, 8),
(413, '2015-12-10 02:17:06.000000', 'Assigned to ksandstrom', '', 1, NULL, 191, 8),
(414, '2015-12-10 10:39:15.000000', 'Comment', 'afghanista has the same problem while i click in project dashboard.', 1, NULL, 196, NULL),
(415, '2015-12-10 21:37:13.000000', 'Comment', 'I fixed the Checklist item delete error, the whoops was a standard template that has been changed as well to be more custom.  What is the project dashboard problem?  Do you know which project dashboard threw the error?', 1, NULL, 196, 11),
(416, '2015-12-11 14:12:27.000000', 'Resolved', 'The program name is provided for reference and not intended to change the indicators available.  In a complete from the program for the project can not be changed or the indicators.  We intend to hide the program in the form at some point.', 1, 3, 197, 11),
(417, '2015-12-11 14:12:51.000000', 'Resolved', '', 1, 3, 196, 11),
(418, '2015-12-13 10:28:54.000000', 'Ticket Opened', 'https://tola-activity.mercycorps.org/activitydb/projectcomplete_add/389/\r\n\r\nUnable to fill the Project completion form. After saving the first page, the form is showing up as ''Invalid form''', 1, NULL, 202, 6),
(419, '2015-12-14 01:36:43.000000', 'Resolved', 'That''s actually telling you the form you submitted was invalid because the budget and actual fields were required.  However since we didn''t provide those fields for you to enter in values we will let that slide... this time.  Should be fixed now.', 1, 3, 202, 11),
(420, '2015-12-14 01:44:31.000000', 'Resolved', 'This is a permission issue.  User ajammooul did not have permission to add new sites because he was not an editor.  It looks like his profile was updated to allow this on Dec. 7, 2015, 7:11 a.m.	 by skouzi (Sarah Kouzi).  We will create a new ticket for making permissions errors more clear rather then the login prompt.', 1, 3, 152, 11),
(421, '2015-12-14 01:46:15.000000', 'Closed', '', 1, 4, 99, 11),
(422, '2015-12-14 01:49:10.000000', 'Resolved', '', 1, 3, 150, 11),
(423, '2015-12-14 04:26:02.000000', 'Reopened', 'that is good, because the completion form should take the indicator directly from PA .we should not be able to add indicator in CF manually.', 1, 2, 197, NULL),
(424, '2015-12-14 09:28:28.000000', 'Closed', 'Accepted resolution and closed ticket', 1, 4, 202, 6),
(425, '2015-12-14 09:44:31.000000', 'Comment', 'as currently while we want to create completion form  for PA under impact there is no any indicator(which should show all indicators of PA).even we cant see the indicators to add it.\r\n', 1, NULL, 197, NULL),
(426, '2015-12-14 14:54:43.000000', 'Ticket Opened Via Web', 'I was on the ''GAITID: 5717 - Psychosocial Support and Safe Access to Education for Youth'' adding indicators and I clicked on save on the first page which requests to identify whether the indicator is a DIG indicator.  An error page then appears, attached below.', 1, NULL, 203, NULL),
(427, '2015-12-14 17:47:06.000000', 'Comment', 'The dig server is not allowing us to connect to it at the moment, we are working on fixing that.  Should be back up soon.', 1, NULL, 203, 11),
(428, '2015-12-14 23:21:21.000000', 'Assigned to ksandstrom in bulk update', NULL, 1, NULL, 200, 8),
(429, '2015-12-14 23:24:35.000000', 'Closed', '', 1, 4, 196, 8),
(430, '2015-12-14 23:27:37.000000', 'Closed', '', 1, 4, 150, 8),
(431, '2015-12-15 04:06:42.000000', 'Ticket Opened Via Web', 'There should be option for adding documents in Completion form. there are some documents which need to be attach with CF like Handover latter, before and after photo...etc.', 1, NULL, 204, NULL),
(432, '2015-12-15 10:50:21.000000', 'Resolved', 'We have a temporary fix in place now for this until the DIG server can be reached again.', 1, 3, 203, 11),
(433, '2015-12-15 16:38:32.000000', 'Reopened', 'Create Custom indicator still errors. (testing what happens when I reopen a tw ticket and add a comment - ks)', 1, 2, 203, 8),
(434, '2015-12-15 17:00:33.000000', 'Ticket placed on hold', NULL, 1, NULL, 191, 8),
(435, '2015-12-15 18:12:41.000000', 'Reopened', 'Can you please send me the file you were trying you upload?', 1, 2, 153, 3),
(436, '2015-12-15 19:00:29.000000', 'Ticket Opened Via Web', 'Hi, we need to add an approver level of $15,000.  Can I do this, or do I need to ask if you can do this?\r\n\r\nThanks\r\nEsther', 1, NULL, 205, NULL),
(437, '2015-12-16 04:51:21.000000', 'Ticket Opened Via Web', 'cant create completion form, system does not allowed us to go to the project dashboard because of the attached error. \r\n\r\nthis issue shows for some of the PAs not all', 1, NULL, 206, NULL),
(438, '2015-12-16 04:54:47.000000', 'Ticket Opened Via Web', 'Does anyone else find it strange that you can select people other than yourself for approvals? I think that on the approvals page the only name you should be able to select is your own...at the moment you can select anyone that has logged into the system as the person verifying. ', 1, NULL, 207, NULL),
(439, '2015-12-16 06:16:18.000000', 'Ticket Opened Via Web', 'I''ve been getting confused when I have multiple tables open at the same time which one I''m looking at as I click between. Can you add a name title for each table on the "View Table Data" page? ', 1, NULL, 208, NULL),
(440, '2015-12-16 06:19:54.000000', 'Ticket Opened Via Web', 'I don''t see a place where I can get back to the contact information I''ve entered under stakeholders profiles. Can we add a button so I can get a printable table (like the indicators/PMP grid print) of all my stakeholders contact info? \r\n\r\n', 1, NULL, 209, NULL);
INSERT INTO `helpdesk_followup` (`id`, `date`, `title`, `comment`, `public`, `new_status`, `ticket_id`, `user_id`) VALUES
(441, '2015-12-16 07:46:04.000000', 'Ticket Opened Via Web', 'There are many non-Timor-Leste programs in our Program Dashboard and Indicator Planning pages. Can you please help to filter them out? ', 1, NULL, 210, NULL),
(442, '2015-12-16 13:17:29.000000', 'Ticket Opened Via Web', 'Each time we try to save an Indicator Data we get Page Not Found returned. Data is saved successfully, so no trouble there... ', 1, NULL, 211, NULL),
(443, '2015-12-16 19:09:57.000000', 'Closed', '', 1, 4, 154, 8),
(444, '2015-12-16 19:51:13.000000', 'Closed', 'This was fixed in the tola work admin.', 1, 4, 146, 11),
(445, '2015-12-16 19:56:44.000000', 'Closed', '', 1, 4, 203, 8),
(446, '2015-12-16 19:57:01.000000', 'Comment', 'This has been fixed. ', 1, NULL, 203, 8),
(447, '2015-12-16 20:29:39.000000', 'Comment', 'Pakistan\r\nGAITID: 6890 - 321 Bhago!\r\nand \r\nGAITID: 6528 - 2015-2016 Integrated Afghan Refugee Assistance Project\r\n\r\nshowing up under the Indicator Planning page for Timor-Leste', 1, NULL, 210, 8),
(448, '2015-12-16 20:37:23.000000', 'Closed', '', 1, 4, 145, 11),
(449, '2015-12-16 21:59:49.000000', 'Closed', '', 1, 4, 197, 8),
(450, '2015-12-16 22:03:02.000000', 'Assigned to ksandstrom', '', 1, NULL, 189, 8),
(451, '2015-12-16 23:59:00.000000', 'Resolved', '2) Is a duplicate issue:http://tola.work/helpdesk/tickets/172/\r\n\r\n3) Is a duplicate issue:http://tola.work/helpdesk/tickets/182/\r\n\r\n\r\n', 1, 3, 183, 8),
(452, '2015-12-17 00:00:33.000000', 'Assigned to ksandstrom', '', 1, NULL, 183, 8),
(453, '2015-12-17 00:01:30.000000', 'Resolved', '', 1, 3, 189, 8),
(454, '2015-12-17 00:12:48.000000', 'Assigned to mkhan', '', 1, NULL, 50, 3),
(455, '2015-12-17 00:13:18.000000', 'Closed', 'dot and dollar sign are keywords in mongodb so replacing them with _ and USD respectively', 1, 4, 50, 3),
(456, '2015-12-17 00:26:43.000000', 'Closed', 'Fixed a string encoding issue.', 1, 4, 103, 3),
(457, '2015-12-17 00:29:11.000000', 'Comment', 'Asked Andrew for more clarification.', 1, NULL, 104, 3),
(458, '2015-12-17 00:32:42.000000', 'Reopened', 'Can you send me the file that was attempted to be uploaded?', 1, 2, 153, 3),
(459, '2015-12-17 14:11:52.000000', 'Ticket Opened Via Web', 'When providing approval authority for a person at MC Lebanon under the approval authority ''add'' button, I got an error page.  I had entered the name of that person and clicked on save and the below attached error page appeared.', 1, NULL, 212, NULL),
(460, '2015-12-18 23:49:58.000000', 'Assigned to mkhan', '', 1, NULL, 105, 3),
(461, '2015-12-19 00:16:02.000000', 'Closed', 'This is already addressed by commit 9908854', 1, 4, 105, 3),
(462, '2015-12-21 09:30:26.000000', 'Ticket Opened Via Web', 'Error for PA with activity code 32550A044, 32550A046 and 32550A048 ', 1, NULL, 213, NULL),
(463, '2015-12-23 18:08:41.000000', 'Resolved', '', 1, 3, 212, 11),
(464, '2015-12-23 18:14:23.000000', 'Resolved', '', 1, 3, 210, 11),
(465, '2015-12-23 18:16:21.000000', 'Comment', 'Can we get a list of the PA''s you have seen this for?', 1, NULL, 206, 11),
(466, '2015-12-23 18:17:59.000000', 'Resolved', '', 1, 3, 211, 11),
(467, '2015-12-23 18:18:47.000000', 'Comment', 'You can do this in the admin section for Approval Authority.', 1, NULL, 205, 11),
(468, '2015-12-23 18:19:38.000000', 'Resolved', '', 1, 3, 200, 11),
(469, '2015-12-28 17:14:27.000000', 'Closed', 'In the future this can be resolved in the Admin section, under "Programs"  \r\nhttps://tola-activity.mercycorps.org/admin/activitydb/program/\r\n\r\nIt has been fixed for now.', 1, 4, 210, 8),
(470, '2015-12-28 19:48:19.000000', 'Comment', 'From Glind: it looks like this is a data problem at least initially.  There are a few projects that have more then one complete.  That should not be technically allowed by the software unless the complete was created before the lock out process happened or was created in the administrator.  Just to be sure I will add some additional check to block out admin and manual database entry of duplicated completes for a project.  For now though I will go through and clean this up in the database.  For reference these are the completes with duplications (they are all Afghanistan projects).\r\n\r\n?[10:02] \r\n32547A008 project_agreement_id = 58(edited)\r\n\r\n?[10:03] \r\n32547A018 project_agreement_id = 155(edited)\r\n\r\n?[10:04] \r\n32550A046 project_agreement_id = 451(edited)\r\n\r\n?[10:04] \r\n32550A048 project_agreement_id = 457(edited)', 0, NULL, 213, 8),
(471, '2015-12-28 20:56:35.000000', 'Closed', '', 0, 4, 152, 8),
(472, '2015-12-28 20:59:24.000000', 'Closed', '', 1, 4, 211, 8),
(473, '2015-12-29 05:19:41.000000', 'Ticket Opened Via Web', 'the completion form should take automatically the Indicator from the PA ( should be link with those indicator which we already linked the PA with that indicator). ', 1, NULL, 214, NULL),
(474, '2015-12-30 01:02:25.000000', 'Ticket Opened', 'When you save a benchmark a new page loads with the benchmark data and the options to Save changes or Close. \r\n\r\nIn Firefox if you choose "Save Changes", nothing happens and you have to use the back button to get back to the PA. If you choose "Close," you are redirected back to the PA "Executive Summary" and an additional pop up pops up asking the user to "Confirm" to resend the information. \r\n\r\nIn Chrome if you choose "Save Changes" or "Close" nothing happens. The user has to use the back button to get back to the PA.\r\n\r\nThe benchmark is saved in both browsers', 1, NULL, 215, 8),
(475, '2015-12-31 00:43:33.000000', 'Ticket Opened', 'Unable to add disaggregation to an indicator. Clicking "Add Disaggregation" loads the Indicator summary page, not the disaggregation form', 1, NULL, 216, 8),
(476, '2015-12-31 01:07:12.000000', 'Ticket Opened', 'Users with "View Only" permissions have access to most of Tola-Activity, Add, Change, Delete. \r\n\r\nSee current access available to "View Only" permissions:  https://docs.google.com/spreadsheets/d/1s_0keYwnEmlHH-ORh4IgmQrpis5OBaxFvbiTzREw9Dw/edit?usp=sharing\r\n\r\n', 1, NULL, 217, 8),
(477, '2015-12-31 02:00:41.000000', 'Closed', '', 1, 4, 198, 8),
(478, '2016-01-04 16:51:58.000000', 'Closed', '', 1, 4, 134, 8),
(479, '2016-01-04 16:57:27.000000', 'Closed', '', 1, 4, 200, 8),
(480, '2016-01-05 13:25:56.000000', 'Resolved', '', 1, 3, 216, 11),
(481, '2016-01-05 13:28:20.000000', 'Comment', 'We need to confirm this, but all Quantitative Data links (indicators) should be imported into the completion as long as they were entered before the completion was created.', 1, NULL, 214, 11),
(482, '2016-01-05 15:31:55.000000', 'Closed', 'The link should at least link to the "Performance" tab and to the "Disaggregation" section ', 1, 4, 216, 8),
(483, '2016-01-05 23:51:54.000000', 'Ticket Opened', 'When trying to enter indicators for the same program, every time you try to enter a new indicator, you''re brought back, you have to search for the program again. Is it possible to go back to the same program, instead of going all the way back to the page where you have to choose your program again?', 1, NULL, 218, 8),
(484, '2016-01-06 00:52:37.000000', 'Resolved', '', 1, 3, 179, 8),
(485, '2016-01-06 17:57:09.000000', 'Ticket Opened & Assigned to Greg Lind', 'The "Contact List" page is only accessible from the breadcrumb navigation on the "Contact Form" page. Users can only find the "Contact List" link after clicking "Add New Contact" under Stakeholders page. There should be a more intuitive way to access it. \r\n\r\nContact list page: https://tola-activity.mercycorps.org/activitydb/contact_list/0/', 1, NULL, 219, 8),
(487, '2016-01-06 23:07:11.000000', 'Resolved', '', 1, 3, 205, 8),
(488, '2016-01-06 23:08:17.000000', 'Assigned to ksandstrom', '', 1, NULL, 205, 8),
(489, '2016-01-07 18:27:30.000000', 'Resolved', '', 1, 3, 206, 11),
(490, '2016-01-07 18:38:23.000000', 'Comment', 'This is a bit confusing.  The duplicate programs should not affect a project because you should only be able to select one program to a project.  That''s the error thrown is on getting a program for the submitted project, that would mean somehow a project had more then one program and that relationship is not allowed int he data base.  Can we double check this with another project?  The one above seems to work fine in production and on demo. project_id = 220.\r\n\r\nhttps://tola-activity-demo.mercycorps.org/activitydb/projectagreement_update/220/', 1, NULL, 149, 11),
(491, '2016-01-07 18:40:32.000000', 'Closed', '', 1, 4, 212, 11),
(492, '2016-01-07 18:43:18.000000', 'Comment', 'We should probably limit this to users in the country or super users/admins but most approvals are not submitted by the logged in user (CD or PM) but by a proxy users, usually the country admin M&E person.', 1, NULL, 207, 11),
(493, '2016-01-07 18:47:56.000000', 'Assigned to glind', '', 1, NULL, 215, 11),
(494, '2016-01-07 18:48:33.000000', 'Comment', 'This is actually a bug, the user should not be directed to another page.  The ajax form submission is broken.', 1, NULL, 215, 11),
(495, '2016-01-08 17:41:26.000000', 'Closed', '', 1, 4, 183, 8),
(496, '2016-01-08 18:27:14.000000', 'Closed', '', 1, 4, 176, 8),
(497, '2016-01-08 20:12:12.000000', 'Assigned to glind', '', 1, NULL, 219, 11),
(498, '2016-01-08 20:21:21.000000', 'Comment', '#1 Search is fixed. Assuming you were having the same issue as all of us were\r\n#2 I created a new ticket just for this enhancement request: http://tola.work/helpdesk/tickets/218/\r\n#4 We will look into this', 1, NULL, 179, 8),
(499, '2016-01-08 20:32:21.000000', 'Comment', 'How did this get sent to github?  and it''s not a bug or error.', 1, NULL, 148, 11),
(500, '2016-01-08 20:32:37.000000', 'Assigned to glind', '', 1, NULL, 148, 11),
(501, '2016-01-08 23:53:57.000000', 'Closed', '', 1, 4, 164, 8),
(502, '2016-01-10 11:22:54.000000', 'Ticket Opened Via Web', 'in approval tab it should take the user name in the (approved by) section automatically, so the approval group also wont be able to change that or select any name from drop in down list. ', 1, NULL, 221, NULL),
(503, '2016-01-11 17:20:20.000000', 'Reopened', '', 1, 2, 172, 8),
(504, '2016-01-11 19:08:57.000000', 'Ticket Opened & Assigned to Greg Lind', 'Example Progam: 5717 Psychosocial Support and Safe Access to Education for Youth - \r\nCountries: Jordan and Lebanon (though according to GAIT this should only be in Jordan)\r\nIf user''s Profile is Jordan they will get an error (Exception Value: invalid literal for int() with base 10: '''') trying to save/update indicator data on the shared program. Example: \r\nhttps://tola-activity-demo.mercycorps.org/indicators/collecteddata_update/1552/\r\n\r\nIf user''s Profile is Lebanon, it does not error. \r\n\r\nIf user''s Profile is Lebanon and Jordan saving indicator data also fails\r\nException Value: invalid literal for int() with base 10: ''''', 1, NULL, 222, 8),
(505, '2016-01-11 19:53:42.000000', 'Ticket Opened & Assigned to Andrew Pham', 'There is a link to "Form Help/Guidance" on the "Create Indicator" page example: https://tola-activity.mercycorps.org/indicators/indicator_create/142/ \r\n\r\nwhich links to the PA form guide: \r\nhttps://docs.google.com/document/d/1xsHzOQ6CuWc9kNDEOHOQzYx8oZjW0zcn0DWe8Uw7ldk/\r\n\r\nThe link should either be removed or link to the Indicator Form Guide or to a new Form Guide: \r\nhttps://docs.google.com/document/d/18QN7U6-b3AXmjL9fcHfFaxo1yisxuvpefGmsJTslJY4/\r\n\r\n\r\n\r\n\r\n', 1, NULL, 223, 8),
(506, '2016-01-12 00:02:37.000000', 'Closed', '', 1, 4, 170, 8),
(507, '2016-01-12 00:36:17.000000', 'Closed', '', 1, 4, 201, 11),
(508, '2016-01-12 00:40:30.000000', 'Closed', '', 1, 4, 223, 11),
(509, '2016-01-12 14:52:19.000000', 'Ticket Opened & Assigned to Greg Lind', 'The "Formal Written Description of Relationship" and "Vetting/ due diligence statement" drop down selections, in the Stakeholder form, are not being filtered by country. \r\n', 1, NULL, 224, 8),
(510, '2016-01-14 11:43:34.000000', 'Ticket Opened Via Web', 'Was trying to link tola tables onto my kobo , with the following JSON file : https://kc.humanitarianresponse.info/as3ad/forms/baseline_ind_v2/api\r\n\r\nwhich was made public to avoid any kind of authorization errors.\r\nAnd then after filling and pressing on submit , tola table prompts me to login on another page , tried using both my MC account , as well as my Kobo account , but none the less received the same error :\r\nValueError at /json\r\n\r\nThis was tried with both AutoPull on and off.\r\n\r\nKindly check attached.', 1, NULL, 225, NULL),
(511, '2016-01-14 14:18:26.000000', 'Closed', '', 1, 4, 172, 8),
(512, '2016-01-14 18:36:01.000000', 'Comment', 'https://github.com/mercycorps/tola-activity/issues/175', 1, NULL, 217, 8),
(513, '2016-01-14 18:52:30.000000', 'Comment', 'https://github.com/mercycorps/tola-activity/issues/131', 1, NULL, 116, 8),
(514, '2016-01-14 18:54:27.000000', 'Comment', 'https://github.com/mercycorps/tola-activity/issues/105', 1, NULL, 68, 8),
(515, '2016-01-14 18:56:49.000000', 'Closed', 'https://github.com/toladata/TolaActivity/issues/43', 1, 4, 130, 8),
(516, '2016-01-14 19:46:02.000000', 'Closed', '', 1, 4, 189, 8),
(517, '2016-01-14 19:48:44.000000', 'Resolved', '', 1, 3, 180, 8),
(518, '2016-01-14 21:56:51.000000', 'Ticket Opened & Assigned to Greg Lind', 'We copied the Site and PA form to the @mc domain account. They used to belong to the AFG domain/account.\r\n\r\nPlease update the two links in TA \r\n\r\nWORKFLOW FORM 01 Site Profile Form Guide v.1\r\nnew form link: \r\nhttps://drive.google.com/open?id=18nGr_uk1VSzitwjkstxvjGWxtINzlITUgBGFP_s-b9o\r\n\r\nWORKFLOW FORM 03 Agreement Form Guide v.1\r\nnew form link: \r\nhttps://drive.google.com/open?id=111BzD3uHlJpaj4MSk7l8XApvrpu69QgimWPnfXbBUT4', 1, NULL, 226, 8),
(519, '2016-01-15 18:51:37.000000', 'Closed', '', 1, 4, 168, 8),
(520, '2016-01-15 18:57:36.000000', 'Ticket Opened & Assigned to Mahmood Khan', 'Auto-pull feature, for ONA data, creates duplicate records every time the cron job runs since it pulls the same data everytime.', 1, NULL, 227, 8),
(521, '2016-01-15 19:16:21.000000', 'Comment', 'example: Add a "Save and Create another Indicator for the Same Program" button?', 1, NULL, 218, 8),
(522, '2016-01-15 19:24:31.000000', 'Closed', '', 1, 4, 206, 8),
(523, '2016-01-15 19:25:30.000000', 'Closed', '', 1, 4, 205, 8),
(524, '2016-01-15 19:30:40.000000', 'Closed', '', 1, 4, 185, 8),
(525, '2016-01-15 19:47:08.000000', 'Reopened', '', 1, 2, 185, 8),
(526, '2016-01-15 19:47:18.000000', 'Resolved', '', 1, 3, 185, 8),
(527, '2016-01-15 19:49:10.000000', 'Reopened', '#formchange\r\nApproved for Production, Already in Demo, need Form Guidance update', 1, 2, 185, 8),
(528, '2016-01-15 19:59:56.000000', 'Resolved', '', 1, 3, 188, 8),
(529, '2016-01-15 20:09:16.000000', 'Comment', 'This should be resolved now. ', 1, NULL, 225, 8),
(530, '2016-01-15 20:10:53.000000', 'Closed', '', 1, 4, 226, 8),
(531, '2016-01-18 07:36:06.000000', 'Ticket Opened Via Web', 'currently changes can be made to all the forms (site profile, PAs etc.) even after approval. \r\nThere should not be any option to update approved forms. Forms should be pdf-ed/locked.\r\nBecause currently we are facing problem.( the field staff create completion form for approved PA, and the went back to the PA and edited that. now the dashboard shows PA open but while we click on PA it shows approved in the form ', 1, NULL, 228, NULL),
(532, '2016-01-19 11:47:43.000000', 'Ticket Opened', 'Currently the site profile is the only place where we are collecting x/y coordinates and admin boundaries and it is use as part of the Workflow. As we look to expand tola''s use of mapping, it would be good to begin associating these sites to every instance of indicator results. However, most indicator results may not go all the way to x/y coordinates but more at an admin boundary like district or province.\r\n\r\n', 1, NULL, 229, 9),
(533, '2016-01-19 12:07:36.000000', 'Ticket Opened & Assigned to Andrew Pham', 'The demographic information tab needs to be more dynamic and flexible to country needs. Realizing that the Site Profile is the key form for all geographical information and expanding the use of other external contextual information, the demographic tab is becoming more important. For example, we won''t be able to hard code fields on specific SADD disaggregation since these tend to change as they are about to and vary across different organizations. I suggest for us to allow country admins to customize the demographic types they would like to add such as population, land, literacy, etc and then add the same disaggregation feature used in indicator collected data. The front end could resemble that of the "indicator evidence" portion under Workflow where we list the various TvAs and which indicator it is reporting against.', 1, NULL, 230, 9),
(534, '2016-01-19 14:09:23.000000', 'Comment', 'Apologies for the delay, Mahmood! The repeat function in xlsform allows us to repeat a question or a group of questions in a mobile form until the enumerator wants to move on. See: http://xlsform.org/#repeats (there''s also an example in the link to what an xlsform looks like). For example, when you are in the field you want to survey each household member but you don''t know how many members each household will have at the design, so using the repeat you can ask each household member a set of questions. The reason it might be worthwhile looking at this is the export from Ona is different as it puts the responses in a separate sheet in a workbook.', 1, NULL, 104, 9),
(535, '2016-01-19 15:00:02.000000', 'Duplicate', 'This is a duplicate of http://tola.work/helpdesk/tickets/194/', 1, 5, 229, 11),
(536, '2016-01-19 15:31:07.000000', 'Ticket Opened Via Web', 'Under INTAJ program in Lebanon and when I attempted to enter results under one of INTAJ indicators.  I got an error page, the one that says you are lost and shows directions to different cities.  I am attaching what I clicked on below.', 1, NULL, 231, NULL),
(537, '2016-01-19 17:23:15.000000', 'Comment', 'I am unable to recreate the error. What data are you trying to enter into each field for that Indicator? Are you linking evidence?', 1, NULL, 231, 8),
(538, '2016-01-19 17:26:11.000000', 'Assigned to ksandstrom', '', 1, NULL, 231, 8),
(539, '2016-01-19 18:32:54.000000', 'Ticket Opened', 'The form guide links on the Demo need to be different links than Production links. This will help us manage form changes according to our agreed upon change request doc. \r\nhttps://drive.google.com/open?id=1iKus-jD_9bNLqu76QGJ-Iky2kJJBpiYJLUD7UuZST9Q\r\n\r\nNew URLs for Demo Guides: \r\nhttps://drive.google.com/drive/folders/0B7AuTjJ-qmYHeExBOWxSNU5LSmM\r\n\r\n', 1, NULL, 232, 8),
(540, '2016-01-20 03:09:42.000000', 'Ticket Opened', 'When I click on the delete table button (under my "Your Tables" link) , nothing happens, but I can enter the delete silo url directly in my browser to delete the table example url: \r\nhttps://tola-tables-demo.mercycorps.org/silo_delete/30\r\n\r\n', 1, NULL, 233, 8),
(541, '2016-01-20 18:17:31.000000', 'Ticket Opened & Assigned to Mahmood Khan', 'If a user edits a column name and accidentally adds a space after the column name, Tola Tables will error: \r\n\r\nRequest Method:	POST\r\nRequest URL:	https://tola-tables-demo.mercycorps.org/edit_columns/4/\r\nDjango Version:	1.8.2\r\nException Type:	WriteError\r\nException Value:	\r\nAn empty update path is not valid.\r\nException Location:	/usr/local/lib/python2.7/site-packages/pymongo/helpers.py in _check_write_command_response, line 261', 1, NULL, 234, 8),
(542, '2016-01-20 19:04:34.000000', 'Closed', '', 1, 4, 227, 8),
(543, '2016-01-20 19:06:18.000000', 'Closed', '', 1, 4, 52, 8),
(544, '2016-01-20 19:07:59.000000', 'Comment', 'https://github.com/toladata/TolaTables/issues/11', 1, NULL, 155, 8),
(545, '2016-01-20 19:29:03.000000', 'Ticket Opened & Assigned to Mahmood Khan', 'Merging tables creates a table with a typo in the title: "mergeing of # and #" \r\n\r\nThe typo should be fixed or the users should be given the ability to name the merged table, before it is created.', 1, NULL, 235, 8),
(546, '2016-01-20 19:46:50.000000', 'Ticket Opened & Assigned to Mahmood Khan', 'When a user maps fields for "table 1" and "table 2" in the merge process, the system should store the mapping and then be able to reuse it when a user tries to update data in the merged table.', 1, NULL, 236, 3),
(547, '2016-01-20 22:12:24.000000', 'Comment', 'I think this just needs to re-direct to the silo page rather then reload the current screen.', 1, NULL, 234, 11),
(548, '2016-01-20 22:33:02.000000', 'Closed', '', 1, 4, 233, 8),
(549, '2016-01-20 22:39:00.000000', 'Closed', '', 1, 4, 235, 8),
(550, '2016-01-20 22:57:19.000000', 'Ticket Opened', 'If you view the "Data Source" PAGE for a TT that *already has a current CSV file* attached to it and click SAVE the  "Get External Data ...or Create New Table" page loads, instead of the "Your Data Tables" \r\n', 1, NULL, 237, 8),
(551, '2016-01-20 23:53:07.000000', 'Closed', 'This is a feature not a bug, but the "feature" could use some work. It should be clearer to the user that you can (simply) create another table with the same (CSV) data source. ', 1, 4, 237, 8),
(552, '2016-01-21 04:20:16.000000', 'Ticket Opened & Assigned to Cali Livingstone', 'Currently the wording of the hint on the Justification and Description tab do not provide clear guidance as they still reference Afghanistan terms. \r\n\r\nI suggest several edits: \r\n1. To maintain a strict, clear distinction between "project" and "activity" as they live within the Tola system, I suggest changing "Description of project activities" to "Description of Project" \r\n\r\n2. Delete the "Description of Project" hint as it is still Afg specific. Replace with something broader. I suggest, "Briefly describe the day to day work you plan to complete in order to accomplish this project activity. Include rationale for budget, scope, timeframe as well as those MC staff and stakeholders that will be necessary to seeing this project is effectively implemented. Site any documentation/monitoring efforts that you''ll need to do before completion." \r\n\r\n3. Add to the hint under "Effect or Impact" to say "Please do not include outputs and keep less than 120 words. Describe the logic that will link this project/activity to the proposed desired outcome/goal. Note any assumptions that are critical in this logic chain." ', 1, NULL, 238, 12);

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ignoreemail`
--

CREATE TABLE IF NOT EXISTS `helpdesk_ignoreemail` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `email_address` varchar(150) NOT NULL,
  `keep_in_mailbox` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ignoreemail_queues`
--

CREATE TABLE IF NOT EXISTS `helpdesk_ignoreemail_queues` (
  `id` int(11) NOT NULL,
  `ignoreemail_id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_kbcategory`
--

CREATE TABLE IF NOT EXISTS `helpdesk_kbcategory` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_kbitem`
--

CREATE TABLE IF NOT EXISTS `helpdesk_kbitem` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `question` longtext NOT NULL,
  `answer` longtext NOT NULL,
  `votes` int(11) NOT NULL,
  `recommendations` int(11) NOT NULL,
  `last_updated` datetime(6) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_presetreply`
--

CREATE TABLE IF NOT EXISTS `helpdesk_presetreply` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_presetreply_queues`
--

CREATE TABLE IF NOT EXISTS `helpdesk_presetreply_queues` (
  `id` int(11) NOT NULL,
  `presetreply_id` int(11) NOT NULL,
  `queue_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_queue`
--

CREATE TABLE IF NOT EXISTS `helpdesk_queue` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `email_address` varchar(254) DEFAULT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `allow_public_submission` tinyint(1) NOT NULL,
  `allow_email_submission` tinyint(1) NOT NULL,
  `escalate_days` int(11) DEFAULT NULL,
  `new_ticket_cc` varchar(200) DEFAULT NULL,
  `updated_ticket_cc` varchar(200) DEFAULT NULL,
  `email_box_type` varchar(5) DEFAULT NULL,
  `email_box_host` varchar(200) DEFAULT NULL,
  `email_box_port` int(11) DEFAULT NULL,
  `email_box_ssl` tinyint(1) NOT NULL,
  `email_box_user` varchar(200) DEFAULT NULL,
  `email_box_pass` varchar(200) DEFAULT NULL,
  `email_box_imap_folder` varchar(100) DEFAULT NULL,
  `email_box_interval` int(11) DEFAULT NULL,
  `email_box_last_check` datetime(6) DEFAULT NULL,
  `socks_proxy_type` varchar(8) DEFAULT NULL,
  `socks_proxy_host` char(39) DEFAULT NULL,
  `socks_proxy_port` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_savedsearch`
--

CREATE TABLE IF NOT EXISTS `helpdesk_savedsearch` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `shared` tinyint(1) NOT NULL,
  `query` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ticket`
--

CREATE TABLE IF NOT EXISTS `helpdesk_ticket` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `submitter_email` varchar(254) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `on_hold` tinyint(1) NOT NULL,
  `description` longtext,
  `resolution` longtext,
  `priority` int(11) NOT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  `last_escalation` datetime(6) DEFAULT NULL,
  `assigned_to_id` int(11) DEFAULT NULL,
  `queue_id` int(11) NOT NULL,
  `github_issue_id` varchar(255),
  `github_issue_number` varchar(255),
  `github_issue_url` varchar(255),
  `type` int(11) NOT NULL,
  `votes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `helpdesk_ticket`
--

INSERT INTO `helpdesk_ticket` (`id`, `title`, `created`, `modified`, `submitter_email`, `status`, `on_hold`, `description`, `resolution`, `priority`, `due_date`, `last_escalation`, `assigned_to_id`, `queue_id`, `github_issue_id`, `github_issue_number`, `github_issue_url`, `type`, `votes`) VALUES
(2, 'External partner organizations and consultants need access to enter and view data', '2015-09-11 21:45:23.000000', '2015-12-02 20:24:30.000000', 'glind@mercycorps.org', 1, 0, 'We likely need to remove the SSO component of Activity and replace it with google auth and local accounts.  There are a number of sub-grants in each country that will need to allow data entry and views into specific programs.', NULL, 2, NULL, NULL, 11, 1, '', '', '', 1, 3),
(3, 'Import into merge silo broken', '2015-09-15 23:38:34.000000', '2015-10-12 13:42:02.000000', 'atpham@mercycorps.org', 4, 0, 'received internal server error when attempting to merge a silo with an already existing silo.', '', 3, NULL, NULL, 9, 2, '', '', '', 1, 1),
(4, 'Add link to Form Guides in each workflow (Community, Agreement, Completion)', '2015-09-16 18:35:10.000000', '2015-09-25 13:12:34.000000', 'atpham@mercycorps.org', 4, 0, 'Links to form guides\r\nCommunity: https://docs.google.com/document/d/1PBjoQPdCRyrki12vv8AMPxIqOswKqzKH035_o3KSILU/edit?usp=sharing\r\n\r\nAgreement:\r\nhttps://docs.google.com/document/d/1xsHzOQ6CuWc9kNDEOHOQzYx8oZjW0zcn0DWe8Uw7ldk/edit?usp=sharing\r\n\r\nCompletion:\r\nhttps://docs.google.com/document/d/1tDwo3m1ychefNiAMr-8hCZnhEugQlt36AOyUYHlPbVo/edit?usp=sharing\r\n\r\nThere will be more Form Guides to come for Training, Distribution, C4W as we get those up on TA.', '', 3, NULL, NULL, 9, 1, '', '', '', 1, 0),
(5, '', '2015-09-16 18:44:50.000000', '2015-12-01 01:21:16.000000', 'atpham@mercycorps.org', 4, 0, 'When adding a new indicator, the objectives that display should only reflect those associated the the program, not the country.', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 1),
(6, 'Move "create indicator" button to program box in Indicator Planning', '2015-09-16 19:08:52.000000', '2015-09-28 23:01:29.000000', 'atpham@mercycorps.org', 4, 0, 'When clicking on indicator planning, each program should be displayed by default with the program box. To create new indicator, you will add using the create indicator button specific to the program.\r\n\r\nThe new indicator screen should then populate the "program" field for you.\r\n\r\nAlso reorder the "program" field to the very top of the "Performance" tab under create new indicator.', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(7, 'Add Summary Tab for Indicator Planning + reorder all other indicator fields to match IP template', '2015-09-16 19:31:38.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, 'Summary tab will include:\r\nProgram\r\nSector\r\nObjective\r\n\r\nIP attached for ordering reference', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(8, 'change Indicator Type + add indicator level', '2015-09-16 21:18:25.000000', '2015-09-28 23:01:49.000000', 'atpham@mercycorps.org', 4, 0, 'Indicator type will include:\r\n-custom\r\n-standard\r\n-alpha\r\n\r\nIndicator level:\r\n-Goal\r\n-Outcome\r\n-Output\r\n-Activity', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(9, 'Change "Analyses and Reporting" tab to "Analysis and Reporting"', '2015-09-16 21:20:06.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, '.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(10, 'Capitalize Project "Type" and "Dates"', '2015-09-17 16:20:06.000000', '2015-09-29 16:13:37.000000', 'atpham@mercycorps.org', 4, 0, 'There are many other field names that need to be capitalized. Check Agreement field names for that.', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, -1),
(11, 'Move "Community" selection to the top of the Community tab', '2015-09-17 16:22:19.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, '.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(12, 'Remove "expected duration" field from Agreement ', '2015-09-17 16:23:15.000000', '2015-09-17 16:23:19.000000', 'atpham@mercycorps.org', 4, 0, '.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(13, 'community mobilizer field + add community mobilizer contact field', '2015-09-17 16:25:28.000000', '2015-09-29 16:12:42.000000', 'atpham@mercycorps.org', 4, 0, 'remove "MC" to make it more generic.', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(14, 'Tola Help - "Tola Activity" is spelt wrong on home page', '2015-09-17 17:48:35.000000', '2015-09-22 21:48:19.000000', 'atpham@mercycorps.org', 4, 0, '.', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(18, 'Can''t change column header when editing', '2015-09-18 22:38:33.000000', '2015-09-22 21:47:29.000000', 'esinn@mercycorps.org', 4, 0, 'TypeError at /doMerge/\r\n''Collection'' object is not callable. If you meant to call the ''update_many'' method on a ''Collection'' object it is failing because no such method exists.\r\nRequest Method:	POST\r\nRequest URL:	https://tola-data.mercycorps.org/doMerge/\r\nDjango Version:	1.8.2\r\nException Type:	TypeError\r\nException Value:	\r\n''Collection'' object is not callable. If you meant to call the ''update_many'' method on a ''Collection'' object it is failing because no such method exists.\r\nException Location:	/usr/local/lib/python2.7/site-packages/pymongo/collection.py in __call__, line 1773\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola/htdocs'',\r\n ''/var/www/tola/htdocs/tola'',\r\n ''/var/www/tola/htdocs'']\r\nServer time:	Fri, 18 Sep 2015 15:36:40 -0700\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/var/www/tola/htdocs/silo/views.py in doMerge\r\n                        False #, False, None, True  ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/pymongo/collection.py in __call__\r\n                                    self.__name.split(".")[-1]) ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nVariable	Value\r\n_id	\r\nu''_id''\r\ncreate_date	\r\nu''create_date''\r\nstart_time	\r\nu''start_time''\r\nprofile_con/establish_date	\r\nu''profile_con/establish_date''\r\nto_silo_id	\r\nu''17''\r\nfrom_silo_id	\r\nu''18''\r\nend_time	\r\nu''end_time''\r\ndevice_id	\r\nu''device_id''\r\nmeta/instanceName	\r\nu''meta/instanceName''', '', 3, NULL, NULL, NULL, 2, '', '', '', 1, 0),
(21, 'Add Tola Help link to Tola Activity', '2015-09-21 16:48:40.000000', '2015-09-25 13:11:36.000000', 'esinn@mercycorps.org', 4, 0, 'Add link to Tola Activity for Tola Help so users can easily go to Tola Help to submit an issue', NULL, 2, NULL, NULL, 5, 1, '', '', '', 1, 1),
(22, 'Remove "Document" upload and replace with link to "Documents" form', '2015-09-23 06:56:17.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, 'Similar to budget pop-up', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(23, 'Document form: add upload document method', '2015-09-23 06:57:20.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, 'document form should have both URL link and upload document', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(24, '"Print view" should be a button on Project Dashboard', '2015-09-23 07:00:17.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, 'This should be similar to the Print Grid/View that displays in the Program Dashboard', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 1),
(25, 'Project Agreement: Add Account Code, LIN Code under Budget tab', '2015-09-23 07:01:21.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, '.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(26, 'Project Agreement: Add "Total Local", "MC Estimated Local", "Exchange Rate and Date"under Budget tab', '2015-09-23 07:02:17.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, '.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(27, 'Project Agreement: Add "Project Budget" (BoQ) link to document form', '2015-09-23 07:04:04.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, 'per Brandy''s request changing BoQ to Project Budget', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(28, 'Project Agreement: Reorder "Program Objectives" below "Strategic Objectives"', '2015-09-23 07:06:01.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, '.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(29, 'Project Planning tab: change field wording', '2015-09-23 07:07:15.000000', '2015-09-29 16:12:21.000000', 'atpham@mercycorps.org', 4, 0, 'Change from "What is the effect or impact" to What is the anticipated Outcome or Goal"', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(30, 'Change "Justification Background" to " General Background and Problem Statement"', '2015-09-23 07:09:33.000000', '2015-09-25 13:14:48.000000', 'atpham@mercycorps.org', 4, 0, 'Under Project Agreement > Project Planning', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(31, 'Change "Justification description community selection"...', '2015-09-23 07:10:59.000000', '2015-09-29 16:12:01.000000', 'atpham@mercycorps.org', 4, 0, 'to "Description of Stakeholder Selection Criteria"', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(32, 'Project Planning tab: add hyperlink to indicator when added here', '2015-09-23 07:13:07.000000', '2015-11-04 01:09:45.000000', 'atpham@mercycorps.org', 4, 0, '.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(33, 'Project Agreement: Add link for government approval document', '2015-09-23 07:13:48.000000', '2015-09-25 13:15:41.000000', 'atpham@mercycorps.org', 4, 0, '.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(34, 'Create "Monitoring and Evaluation" tab and...', '2015-09-23 07:15:33.000000', '2015-09-25 13:15:41.000000', 'atpham@mercycorps.org', 4, 0, 'move "Evaluate" and "Monitoring" fields from "Project Planning" to this tab.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(35, 'Project Agreement: Remove " Checked by" and "Reviewed by" fields under Approval tab', '2015-09-23 07:16:57.000000', '2015-09-25 13:15:41.000000', 'atpham@mercycorps.org', 4, 0, 'Add "Field Verification By" under approval tab', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(36, 'Error message when Indicator Data Report button is clicked', '2015-09-28 02:20:43.000000', '2015-09-28 23:21:06.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'Under the Reports tab on the banner bar in Tola Activity when Indicator Data Report tab is clicked an error message is returned, see attached screen shot. Thanks! ', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(37, 'Tola Help - dashboard', '2015-09-29 18:42:43.000000', '2015-09-29 18:42:43.000000', 'esinn@mercycorps.org', 4, 0, 'I get this error when I click on the dashboard in Tola Help\r\nAttributeError at /helpdesk/dashboard/\r\n''dict'' object has no attribute ''state''\r\nRequest Method:	GET\r\nRequest URL:	http://tola.work/helpdesk/dashboard/\r\nDjango Version:	1.8.2\r\nException Type:	AttributeError\r\nException Value:	\r\n''dict'' object has no attribute ''state''\r\nException Location:	/home/django/tola-help/helpdesk/views/staff.py in dashboard, line 72\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/home/django/tola-help'',\r\n ''/home/django/tola-help/tola-help'',\r\n ''/usr/local/bin'',\r\n ''/usr/lib/python2.7'',\r\n ''/usr/lib/python2.7/plat-x86_64-linux-gnu'',\r\n ''/usr/lib/python2.7/lib-tk'',\r\n ''/usr/lib/python2.7/lib-old'',\r\n ''/usr/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/dist-packages'',\r\n ''/usr/lib/python2.7/dist-packages'',\r\n ''/home/django/tola-help/project'',\r\n ''/home/django/tola-help'']\r\nServer time:	Tue, 29 Sep 2015 11:41:47 -0700\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/dist-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/dist-packages/django/contrib/auth/decorators.py in _wrapped_view\r\n                            return view_func(request, *args, **kwargs) ...\r\n? Local vars\r\n/home/django/tola-help/helpdesk/views/staff.py in dashboard\r\n                        if github_status.state == "open" and ticket.status != 1: ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nNo POST data\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\ncsrftoken	\r\n''Ue7RcTKmbrMIo2o6FpPAH65u2BYdwGtD''\r\nsessionid	\r\n''omzsiths85fuobbmck6vr9s0eqq9q8v5''\r\nMETA\r\nVariable	Value\r\nHTTP_REFERER	\r\n''http://tola.work/''\r\nSERVER_SOFTWARE	\r\n''gunicorn/19.3.0''\r\nSCRIPT_NAME	\r\nu''''\r\nREQUEST_METHOD	\r\n''GET''\r\nPATH_INFO	\r\nu''/helpdesk/dashboard/''\r\nSERVER_PROTOCOL	\r\n''HTTP/1.0''\r\nQUERY_STRING	\r\n''''\r\nHTTP_USER_AGENT	\r\n''Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36''\r\nHTTP_CONNECTION	\r\n''close''\r\nHTTP_COOKIE	\r\n''sessionid=omzsiths85fuobbmck6vr9s0eqq9q8v5; csrftoken=Ue7RcTKmbrMIo2o6FpPAH65u2BYdwGtD''\r\nSERVER_NAME	\r\n''127.0.0.1''\r\nREMOTE_ADDR	\r\n''127.0.0.1''\r\nwsgi.url_scheme	\r\n''http''\r\nSERVER_PORT	\r\n''9000''\r\nREMOTE_PORT	\r\n''50414''\r\nwsgi.input	\r\n<gunicorn.http.body.Body object at 0x7f43be1df110>\r\nHTTP_HOST	\r\n''tola.work''\r\nwsgi.multithread	\r\nTrue\r\nHTTP_UPGRADE_INSECURE_REQUESTS	\r\n''1''\r\nHTTP_ACCEPT	\r\n''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\r\nwsgi.version	\r\n(1, 0)\r\nRAW_URI	\r\n''/helpdesk/dashboard/''\r\nwsgi.run_once	\r\nFalse\r\nwsgi.errors	\r\n<gunicorn.http.wsgi.WSGIErrorsWrapper object at 0x7f43be1df2d0>\r\nwsgi.multiprocess	\r\nTrue\r\nHTTP_ACCEPT_LANGUAGE	\r\n''en-US,en;q=0.8''\r\ngunicorn.socket	\r\n<socket at 0x7f43be33d550 fileno=14 sock=127.0.0.1:9000 peer=127.0.0.1:50414>\r\nHTTP_X_FORWARDED_FOR	\r\n''67.170.137.248''\r\nwsgi.file_wrapper	\r\n''''\r\nCSRF_COOKIE	\r\nu''Ue7RcTKmbrMIo2o6FpPAH65u2BYdwGtD''\r\nHTTP_ACCEPT_ENCODING	\r\n''gzip, deflate, sdch''\r\nSettings\r\nUsing settings module project.settings.local\r\nSetting	Value\r\nSECURE_BROWSER_XSS_FILTER	\r\nFalse\r\nUSE_THOUSAND_SEPARATOR	\r\nFalse\r\nCSRF_COOKIE_SECURE	\r\nFalse\r\nLANGUAGE_CODE	\r\n''en-us''\r\nROOT_URLCONF	\r\n''project.urls''\r\nMANAGERS	\r\n((''django'', ''django@mercycorps.org''),)\r\nSILENCED_SYSTEM_CHECKS	\r\n[]\r\nDEFAULT_CHARSET	\r\n''utf-8''\r\nSESSION_SERIALIZER	\r\n''django.contrib.sessions.serializers.JSONSerializer''\r\nSTATIC_ROOT	\r\n''/home/django/tola-help/assets''\r\nDJANGO_ROOT	\r\n''/home/django/tola-help/project''\r\nALLOWED_HOSTS	\r\n[]\r\nMESSAGE_STORAGE	\r\n''django.contrib.messages.storage.fallback.FallbackStorage''\r\nEMAIL_SUBJECT_PREFIX	\r\n''[Django] ''\r\nSERVER_EMAIL	\r\n''root@localhost''\r\nSECURE_HSTS_SECONDS	\r\n0\r\nSTATICFILES_FINDERS	\r\n(''django.contrib.staticfiles.finders.FileSystemFinder'',\r\n ''django.contrib.staticfiles.finders.AppDirectoriesFinder'')\r\nSESSION_CACHE_ALIAS	\r\n''default''\r\nSESSION_COOKIE_DOMAIN	\r\nNone\r\nSESSION_COOKIE_NAME	\r\n''sessionid''\r\nTIME_INPUT_FORMATS	\r\n(''%H:%M:%S'', ''%H:%M:%S.%f'', ''%H:%M'')\r\nSECURE_REDIRECT_EXEMPT	\r\n[]\r\nDATABASES	\r\n{''default'': {''ATOMIC_REQUESTS'': False,\r\n             ''AUTOCOMMIT'': True,\r\n             ''CONN_MAX_AGE'': 0,\r\n             ''ENGINE'': ''django.db.backends.mysql'',\r\n             ''HOST'': ''localhost'',\r\n             ''NAME'': ''helpdesk'',\r\n             ''OPTIONS'': {},\r\n             ''PASSWORD'': u''********************'',\r\n             ''PORT'': '''',\r\n             ''TEST'': {''CHARSET'': None,\r\n                      ''COLLATION'': None,\r\n                      ''MIRROR'': None,\r\n                      ''NAME'': None},\r\n             ''TIME_ZONE'': ''UTC'',\r\n             ''USER'': ''helpdesk''}}\r\nEMAIL_SSL_KEYFILE	\r\nu''********************''\r\nFILE_UPLOAD_DIRECTORY_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_HANDLERS	\r\n(''django.core.files.uploadhandler.MemoryFileUploadHandler'',\r\n ''django.core.files.uploadhandler.TemporaryFileUploadHandler'')\r\nTEMPLATE_CONTEXT_PROCESSORS	\r\n(''django.contrib.auth.context_processors.auth'',\r\n ''django.core.context_processors.debug'',\r\n ''django.core.context_processors.i18n'',\r\n ''django.core.context_processors.media'',\r\n ''django.core.context_processors.static'',\r\n ''django.core.context_processors.tz'',\r\n ''django.contrib.messages.context_processors.messages'',\r\n ''django.core.context_processors.request'')\r\nDEFAULT_CONTENT_TYPE	\r\n''text/html''\r\nAPPEND_SLASH	\r\nTrue\r\nFIRST_DAY_OF_WEEK	\r\n0\r\nDATABASE_ROUTERS	\r\n[]\r\nDEFAULT_TABLESPACE	\r\n''''\r\nLOCAL_APPS	\r\n(''project'', ''helpdesk'')\r\nYEAR_MONTH_FORMAT	\r\n''F Y''\r\nSTATICFILES_STORAGE	\r\n''django.contrib.staticfiles.storage.StaticFilesStorage''\r\nCACHES	\r\n{''default'': {''BACKEND'': ''django.core.cache.backends.locmem.LocMemCache''}}\r\nSESSION_COOKIE_PATH	\r\n''/''\r\nSECURE_CONTENT_TYPE_NOSNIFF	\r\nFalse\r\nMIDDLEWARE_CLASSES	\r\n(''django.middleware.common.CommonMiddleware'',\r\n ''django.contrib.sessions.middleware.SessionMiddleware'',\r\n ''django.middleware.csrf.CsrfViewMiddleware'',\r\n ''django.contrib.auth.middleware.AuthenticationMiddleware'',\r\n ''django.contrib.auth.middleware.RemoteUserMiddleware'',\r\n ''django.contrib.messages.middleware.MessageMiddleware'',\r\n ''django.middleware.clickjacking.XFrameOptionsMiddleware'')\r\nUSE_I18N	\r\nTrue\r\nTHOUSAND_SEPARATOR	\r\n'',''\r\nSECRET_KEY	\r\nu''********************''\r\nLANGUAGE_COOKIE_NAME	\r\n''django_language''\r\nDEFAULT_INDEX_TABLESPACE	\r\n''''\r\nLOGGING_CONFIG	\r\n''logging.config.dictConfig''\r\nTEMPLATE_LOADERS	\r\n(''django.template.loaders.filesystem.Loader'',\r\n ''django.template.loaders.app_directories.Loader'')\r\nWSGI_APPLICATION	\r\n''project.wsgi.application''\r\nTEMPLATE_DEBUG	\r\nTrue\r\nX_FRAME_OPTIONS	\r\n''SAMEORIGIN''\r\nAUTHENTICATION_BACKENDS	\r\n(''social.backends.google.GoogleOAuth2'',\r\n ''django.contrib.auth.backends.ModelBackend'')\r\nSOCIAL_AUTH_GOOGLE_OAUTH2_SECRET	\r\nu''********************''\r\nFORCE_SCRIPT_NAME	\r\nNone\r\nUSE_X_FORWARDED_HOST	\r\nFalse\r\nEMAIL_TIMEOUT	\r\nNone\r\nSECURE_SSL_HOST	\r\nNone\r\nSIGNING_BACKEND	\r\n''django.core.signing.TimestampSigner''\r\nSESSION_COOKIE_SECURE	\r\nFalse\r\nCSRF_COOKIE_DOMAIN	\r\nNone\r\nFILE_CHARSET	\r\n''utf-8''\r\nDEBUG	\r\nTrue\r\nLANGUAGE_COOKIE_DOMAIN	\r\nNone\r\nDEFAULT_FILE_STORAGE	\r\n''django.core.files.storage.FileSystemStorage''\r\nINSTALLED_APPS	\r\n(''django.contrib.auth'',', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(38, 'Adding documents to "Documentation" page is not displaying the uploaded document or showing the URL', '2015-09-30 13:22:07.000000', '2015-09-30 13:22:07.000000', 'atpham@mercycorps.org', 4, 0, 'Created a new issue from Mashal''s issue here. The previous conversation posted below:\r\n\r\nHi Mashal, I see that when you add a new document here (either as a link or upload) it doesn''t display on the page. Let me see if I can find a more suitable place to store these and so we can keep them "live" as we update them.\r\n\r\nI''ll move this to a new issue.\r\n\r\nGreg - Do you think we can embed hackpad into the documentation page and we can display the form guides there?', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(39, 'Adding documents to "Project Documents"', '2015-10-01 13:47:04.000000', '2015-10-01 13:47:04.000000', 'atpham@mercycorps.org', 4, 0, 'The pop up window doesnt display to add document, just grayed out. Tested in Chrome and Safari.\r\n\r\n', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 1),
(40, 'Import Indicator button results in "Page not found" ', '2015-10-02 02:35:48.000000', '2015-10-08 23:28:36.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'In Tola Activity, on the Indicator Planning page when the "Import Indicators" is clicked the attached "Page not found" message is returned. Thanks for the fix! ', '', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(41, 'INTAJ program for Lebanon not displaying in T-A', '2015-10-05 08:24:36.000000', '2015-10-08 23:28:12.000000', 'atpham@mercycorps.org', 4, 0, 'GAIT ID: 6493', 'INTAJ was a new program, had to rerun the script to load it.', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(42, 'Community profile-delete button - Error  ', '2015-10-07 06:31:10.000000', '2015-10-07 19:33:36.000000', 'msadat@af.mercycorps.org', 4, 0, 'i want to remove the duplicate entered community, but the delete option is not working.', 'Fixed', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(43, 'Enterd forms are disappear in Tola', '2015-10-08 05:21:48.000000', '2015-10-18 11:13:39.000000', 'msadat@af.mercycorps.org', 4, 0, 'most of our community forms are lost (INVEST in Kandahar-Program),which were linked with the PAs, the list are bellow would you please restore them back.\r\n\r\nDistricts:-\r\n1 Mirwais Mina\r\n2 Aino Mina\r\n3 Kabul Shah\r\n4 Ghazi Abdullah Khan', 'I believe this data was entered on the demo server and not the production server', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(44, 'community Profile GPS point ', '2015-10-08 05:28:22.000000', '2015-10-08 23:57:46.000000', 'msadat@af.mercycorps.org', 4, 0, 'as i already report this issue that the GPS point in community profile does not accept the decimal degree, based on Greg recommendation we used other browser instead of Chorme which was working but the problem is that, for most of our programs location the GPS point is not working within any internet browses. ', NULL, 2, NULL, NULL, 11, 1, '', '', '', 1, 1),
(46, 'Restrict changes to approved forms', '2015-10-12 11:14:56.000000', '2015-10-12 11:14:56.000000', 'nadhikari@af.mercycorps.org', 4, 0, 'Currently changes can be made to all the forms (community profile, PAs etc.) even after approval. \r\nThere should not be any option to update approved forms. Forms should be pdf-ed/locked.', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(47, 'My Account details are not updating on Tola-Activity', '2015-10-12 12:40:01.000000', '2015-12-09 02:14:21.000000', 'nnajjar@lb.mercycorps.org', 4, 0, 'My profile page is generating the following error:\r\n\r\nPage not found (404)\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/accounts/profile/\r\nRaised by:	tola.views.profile\r\nNo UserProfile matches the given query.\r\nYou''re seeing this error because you have DEBUG = True in your Django settings file. Change that to False, and Django will display a standard 404 page.', 'Closing this ticket for now, since they user''s ldap and email account has been suspended. Will reference later if similar issues come up. ', 3, NULL, NULL, 11, 1, '', '', '', 1, 0),
(48, 'Objectives are too difficult to find because they are not sorted by country', '2015-10-13 08:45:51.000000', '2015-10-28 06:52:04.000000', 'afernandes@mercycorps.org', 4, 0, 'I find it very challenging to quickly locate the objective related to my country and program because all active countries are shown in the objectives field when I upload a New Indicator. ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 2),
(50, 'Tables (Silo) does not allow "." in column Name', '2015-10-13 12:41:17.000000', '2015-12-17 00:13:18.000000', 'glind@mercycorps.org', 4, 0, 'Tables does not allow a period in the column name and throws an error.', 'dot and dollar sign are keywords in mongodb so replacing them with _ and USD respectively', 1, NULL, NULL, 3, 2, '', '', '', 3, 0),
(51, 'Need the ability to add a new column to a table data set', '2015-10-13 13:01:02.000000', '2015-10-13 13:01:05.000000', 'glind@mercycorps.org', 4, 0, 'We need the ability to add a custom column to a table data set.  Also would like to be able to pull the values in for that column from Tola Activity (Indicator ID, Program ID, Project ID)', NULL, 2, NULL, NULL, NULL, 2, '', '', '', 2, 0),
(52, 'Edit/Replace values in a column of table data', '2015-10-13 13:03:05.000000', '2016-01-20 19:06:18.000000', 'glind@mercycorps.org', 4, 0, 'We need the ability to replace values in a column of data.  Example: Column "City Name" has the value "Prtlnd" in it and we need to replace that with "Portland"', '', 3, NULL, NULL, NULL, 2, '', '', '', 2, 4),
(53, 'Provide a column selection screen before import', '2015-10-13 13:09:09.000000', '2015-11-16 20:42:08.000000', 'glind@mercycorps.org', 2, 0, 'Users should be able to select what columns they want to import from a CSV or Data feed before creating the new table.  We need a screen that show s a list of columns and pre-checked checkboxes that allows the user to uncheck boxes for columns they don''t want to import.', NULL, 3, NULL, NULL, NULL, 2, '', '', '', 2, 0),
(54, 'Country filter doesn''t work for non-Afghanistan countries on Community Form', '2015-10-17 12:46:55.000000', '2015-10-17 12:47:47.000000', 'glind@mercycorps.org', 4, 0, 'Filter for form only works for AF, if you switch to any other country you have to select from all provinces rather then country specific.', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 3, 1),
(56, 'Integrated Afghan Refugees Assistance Program is two times in the indicators data', '2015-10-18 09:22:46.000000', '2015-11-02 23:02:43.000000', 'nbuzdar@pk.mercycorps.org', 4, 0, 'Please remove on of these', NULL, 3, NULL, NULL, NULL, 2, '', '', '', 3, 1),
(57, 'Indicators roll up', '2015-10-18 09:22:53.000000', '2015-11-04 01:02:48.000000', 'esalazar@et.mercycorps.org', 4, 0, 'Ethiopia CO has 4 Strategic objectives --> 10 Key Performance Indicators which are also tied to DIG indicators.  Some of the KPIs are also linked to project-level indicators.  Each program must have at least one KPI.  Possible on the Indicator tracking to link country-level indicators to KPI to Strategic Objective?  we are interested to track quantitative progress against KPIs/DIGs and SO.  Please see attached, first tab, columns H, M, N as an example.', 'This has been addressed with the new Strategic Objectives field for indicators.  New SO can be added in the Admin for each country.', 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(58, 'in addition to the work flow , how the evidence is stored ', '2015-10-18 09:27:32.000000', '2015-10-18 09:27:32.000000', 'kwakwaya@et.mercycorps.org', 4, 0, 'to support learning and documenting evidence, it is good to have how to have separate section to put evidences ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(59, 'I can''t see indicators', '2015-10-18 09:28:05.000000', '2015-11-04 01:01:47.000000', 'nbuzdar@pk.mercycorps.org', 4, 0, 'Program wise indicators are not available. The error message popped out.', NULL, 2, NULL, NULL, NULL, 2, '', '', '', 3, 0),
(60, 'Locking approved community form data (location tab)', '2015-10-18 09:28:19.000000', '2015-10-18 09:28:19.000000', 'nadhikari@af.mercycorps.org', 4, 0, 'Once the Community form data (location tab) are approved, it should be locked and cannot be changed\r\n\r\nhttps://tola-activity.mercycorps.org/activitydb/community_update/52/#location', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(61, 'Can''t add my profile to Tola-Data', '2015-10-18 13:07:33.000000', '2015-10-18 13:07:33.000000', 'jcarlson@lb.mercycorps.org', 4, 0, 'I seem to be able to login to Tola Data, but when I click profile I get an Error message - see screen shot.', NULL, 3, NULL, NULL, NULL, 2, '', '', '', 1, 0),
(62, 'Please upload Pakistan''s Geographic boundaries', '2015-10-18 13:08:50.000000', '2015-10-22 10:36:40.000000', 'nbuzdar@pk.mercycorps.org', 4, 0, 'Hi, I cant see the geographic boundaries of Pakistan. Though I have provided you, Province, District, tehsil, Union council and Village level detail, but I would suggest that, you should atleast upload "Province, District, tehsil and union council"', 'Added to Production', 2, NULL, NULL, NULL, 1, '', '', '', 2, 1),
(63, 'I can''t associate more than one province to office code', '2015-10-18 13:49:12.000000', '2015-10-18 13:49:12.000000', 'nbuzdar@pk.mercycorps.org', 4, 0, 'Hi, I am trying to associate Offices with the province. It worked well, when there is only one province. However, if the office is responsible for more than one province, then, It doesn''t work. After clicking on save this page an URL appear:\r\n\r\nhttps://tola-activity.mercycorps.org/admin/activitydb/province/add/?_to_field=id&_popup=1', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(64, 'It''s difficult to find specific rows of data in edit data screens', '2015-10-19 09:53:32.000000', '2015-10-19 09:53:32.000000', 'glind@mercycorps.org', 4, 0, 'Users would like to filter or search for specific row/columns in there data set to edit.  We should provide them with some filters and a search function that filters the table.', NULL, 3, NULL, NULL, NULL, 2, '', '', '', 2, 0),
(65, 'Sum multiple columns per row and create a new sum column', '2015-10-19 10:06:58.000000', '2015-10-19 10:06:58.000000', 'glind@mercycorps.org', 4, 0, 'In the edit section we want to be able to sum, divide, average a set of columns and add the result to a new column.', NULL, 2, NULL, NULL, NULL, 2, '', '', '', 2, 0),
(66, 'Change the name of the Community Profile Core Form to Site Profile', '2015-10-19 13:12:10.000000', '2015-10-28 13:53:19.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'After discussion across the 5 Tola bootcamp participants related to the name of the the ''Community Profile'', it was agreed to the change the name to ''Site Profile'' as it was agreed that it was more representative of the data entered into that form.', '', 3, NULL, NULL, NULL, 1, '', '', '', 2, 1),
(67, 'Add a country specific filter to Approvals', '2015-10-19 13:24:19.000000', '2015-10-19 13:25:33.000000', 'amembaj@gmail.com', 4, 0, 'In Approvals, the dropdown lists - ''Estimated by'', ''Field Verification by'', ''Finance Review By'' - and others, display everyone registered into Tola-Activity. It would be better if a country specific filter is tied to these dropdown lists so that someone sees only people in their country instead of displaying everyone. ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 1),
(68, 'Add a site configuration for organization name', '2015-10-20 07:50:44.000000', '2016-01-14 18:54:29.000000', 'glind@mercycorps.org', 1, 0, 'replace all occurrences of MC or Mercy Corps with the Organizational name global configuration.', NULL, 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(69, 'Data not merging ', '2015-10-20 10:18:15.000000', '2015-11-04 01:00:10.000000', 'jscantlan@mercycorps.org', 4, 0, 'I have just attempted to merge two CSV files. After telling Tola Tables what tables I wanted to merge "from" and "to" I went through the process of matching up data fields.\r\n\r\nFor example, I merged the variable "form_b_full_time" (Liberia dataset) with the variable "TRQ_3,1_full_time_job" (Kenya dataset). Both of these variables have 2 response options: YES, NO and y, n. \r\n\r\nBut, when I exported the merged table back into a CVS file (so that I could view what happened) it appears that instead of merging Liberia''s data with Kenya''s, it deleted Liberia''s data. I checked this with some other variables (age, full name) and saw the same pattern. I counted the number of columns in Kenya''s and Liberia''s data set (total 105). When adding the 4 columns that are automatically generated when you merge two data sets in Tola Tables this leaves 109 columns...which is exactly the number of columns that were in the exported CSV file (of the merged Tola Tables). So I think it is fair to conclude that no columns were merged and instead the Liberia data that was supposed to merge into the Kenya dataset was deleted.  \r\n\r\nI am not really sure what was supposed to happen, but I am guessing this is not it! \r\n\r\nI am going to send Greg a follow-up email concerning this issue (as we are both in Kenya at the Tola training) so that we can resolve this in person. I just wanted to create a ticket concerning this issue for documentation purposes.\r\n\r\nThank you!\r\n\r\nJill', NULL, 3, NULL, NULL, NULL, 2, '', '', '', 1, 0),
(70, 'Approval issue ', '2015-10-21 05:19:01.000000', '2015-11-04 00:59:04.000000', 'msadat@af.mercycorps.org', 4, 0, '1- once the project is getting approved by PM after clicking back in to the dashboard the status change back to progress.\r\n\r\n2- in print view> Project form> approval section authority title is getting change (refer to screen shoot)', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(71, 'Want to upload two documents for one indictors', '2015-10-21 12:36:35.000000', '2015-10-21 12:36:35.000000', 'nbuzdar@pk.mercycorps.org', 4, 0, 'We have a indicator, which got three different evidence. And the system has adding a only one option.\r\n', NULL, 3, NULL, NULL, NULL, 2, '', '', '', 2, 0),
(72, 'error when uploading evidence', '2015-10-21 13:20:22.000000', '2015-10-22 06:29:44.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'When I am adding evidence under data in the indicator planning and I click save it gives the following error: indicator instance with collected data 208L does not exist.  Refer to the screen shot.', NULL, 2, NULL, NULL, 11, 1, '', '', '', 3, 0),
(73, 'Deleted a Document', '2015-10-21 13:23:05.000000', '2015-10-22 06:30:02.000000', 'jcarlson@lb.mercycorps.org', 4, 0, 'Tried to deleted a Document which had been uploaded in duplication, and got an error message', NULL, 3, NULL, NULL, 11, 1, '', '', '', 1, 0),
(74, 'Please add file name in collected indicator data', '2015-10-21 13:47:46.000000', '2015-10-22 07:59:59.000000', 'nbuzdar@pk.mercycorps.org', 4, 0, 'Could you please add file as another column in collected indicator data,so that we can be able to identify two separate files for one indicators', 'The two separate files should be added to different collected data submissions rather then one.  This allows for accurate counts of each file.', 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(75, 'Add new form: ''Site Profile''', '2015-10-22 08:12:03.000000', '2015-10-28 13:54:21.000000', 'nadhikari@af.mercycorps.org', 4, 0, 'The suggested fields are as follows:\r\n1. Site name (required):\r\n2. Country (required) (drop-down menu):\r\n3. Administrative level 1 (required) (hint: province, region) (drop-down menu):\r\n4. Administrative level 2 (hint: district) (drop-down menu):\r\n5. Administrative level 3 (hint: village) (drop-down menu):\r\n6. Latitude:\r\n7. Longitude:\r\n8. Locality type (required) (options: a. urban, b. peri-urban c. rural)\r\n\r\nDemographic information (optional)\r\nhttps://tola-activity.mercycorps.org/activitydb/community_add#for-geographic-communities\r\nXX. (All the fields in the ''geographic communities'' tab in the current community profile form)\r\nXX. Data source for demographic information (required field if any of the demographic info is added):', '', 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(76, 'Stakeholder Profile Form', '2015-10-22 08:12:29.000000', '2015-10-22 11:03:50.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'Stakeholder Profile Form. Proposed fields are described in the attached word doc with field titles and suggested description of field format. \r\n\r\n\r\n', NULL, 2, NULL, NULL, 11, 1, '', '', '', 2, 0),
(77, 'Move checklist to "New Project" form and add screen ', '2015-10-22 10:28:51.000000', '2015-10-22 10:33:57.000000', 'glind@mercycorps.org', 4, 0, 'New screen should include default checklist items Project Sites, Agreement, Complete as defaults and country specific customizable checklists.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 1),
(78, 'New request for report builder format', '2015-10-22 16:42:18.000000', '2015-11-04 00:58:21.000000', 'nadhikari@af.mercycorps.org', 4, 0, 'Report filters:\r\n    Date: from... to...\r\n    Program\r\n    Indicators\r\n    Disaggregation\r\n\r\nReport format:\r\n1. Program\r\n2. Date: from... to...\r\n3. Beneficiary map\r\n4. Select Indicator (drop down): a) charts showing target vs. actual\r\n                                                   b) charts: selected indicator dissagregation with actuals\r\n                                                   c) graph of selected indicators on a timeline\r\n\r\n5. Financial data: (chart) activity level budget vs actual\r\n6. Lessons learned (list the lessons learned recorded during the period)', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(79, 'modifications to the Tola Activity Dashboard to be able to sort through the projects ', '2015-10-23 11:43:17.000000', '2015-11-03 16:54:47.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'When looking at the summary of projects on Tola Activity Dashboard, it would be nice to be able to filter through the projects.  For example, look at projects that are on vocational training or sort by financial projects.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(80, 'Sortable Columns and Filterable by Activity Code', '2015-10-23 13:10:30.000000', '2015-12-16 18:46:20.000000', 'clivingstone@cn.mercycorps.org', 1, 0, 'Tate requested to have the option to sort the columns and filter by activity code within the Program Dashboard page. This would allow managers to customize the data displayed based on what is the priority for them.  ', NULL, 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(81, 'Add Project checklist on Tola-activity home page instead of ''create project'' button', '2015-10-23 13:12:27.000000', '2015-10-26 08:04:24.000000', 'nadhikari@af.mercycorps.org', 4, 0, 'The Project checklist should include:\r\n1. Identify program (drop down)\r\n2. Name of project (text field)\r\n3. Display project checklist\r\ni) Review Site profile and Add \r\nii) Review Partner/Stakeholder profile and Add as applicable\r\niii) Review Indicator plan and Add indicators\r\niv) Create Project Agreement\r\nv) Identify monitoring forms and add \r\nvi) Create Project completion forms', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 1),
(82, 'Project Completion Checklist', '2015-10-23 14:23:41.000000', '2015-11-03 16:33:06.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'Checklist Form Guide should include: \r\n\r\n-Site Profile added and approved\r\n-Stakeholder Profile added and approved\r\n-Indicators TvA at project level linked to evidence and reviewed for accuracy, matches with actuals reported in the evidence file. \r\n-All related documents are updated to completion date. (Who is assigned to do this review?? Responsible for DQA, field added to completion form?)\r\n-Monitoring Forms are added\r\n-Dashboard linked (check with Greg on process) \r\n-Review Project Completion Form with approvals\r\n	-Budget v Actuals, verify variances with finance\r\n        -Ensure lessons learned is documented with appropriate stakeholders giving input and disseminated. ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(83, 'Project agreement form: revisions', '2015-10-24 10:01:27.000000', '2015-10-29 14:48:38.000000', 'nadhikari@af.mercycorps.org', 4, 0, 'Tab: Executive summary\r\n- Activity code field: Add hint: Format is defined by HQ Finance. Activity code is assigned at the time of Project agreement by program or MEL (maybe different by country) and that number is then provided to finance. \r\n- Sector: to be standardized across the organization \r\n\r\nTab: Community proposal\r\n- Change tab name from ''community proposal'' to ''community contact information''\r\n- Change ''community representative contact'' to ''organizational contact''\r\n\r\nTab: Budget\r\n- Budget currency: add option for Euro and GBP\r\n- Change budget tab to only include: Total Project Budget, Mercy Corps’ portion of total project budget, exchange rate, dates, account code and lin code; Hide other budget contributions \r\n\r\nTab: Justification and budget\r\n- MC strategic objective; should be dropdown\r\n- MC program objective: should be dropdown\r\n- Move up ''description of project activities''\r\n- Justification/Stakeholder involvement (community, partner, government etc.): \r\n- Change ''effect/impact'' to ''Anticipated Outcome and Goal''\r\n- Remove all other fields\r\n- Add checklist for uploading/linking full stakeholder analysis and description of deliverables\r\n\r\nMerge tabs: Planning, M&E, Project impact\r\n\r\nTab: Planning\r\n- Benchmarks: turn off for all countries other than Afghanistan \r\n- Capacity: change to ''describe how sustainability will be ensured for this project'' (add to checklist as documentation)\r\n\r\nTab: M&E\r\n- Remove ''Monitoring''\r\n- Standardize ''Evaluate'' and change name from ''evaluate'' to ''evaluation methodology''\r\n\r\nTab: Approval\r\n- Estimated by: change to Originated by\r\n- Remove approval submitted by\r\n- Remove field verification by and date\r\n- Change Approval to “Approval Status”', '', 3, NULL, NULL, NULL, 1, '', '', '', 2, 1),
(84, 'Correction of a Typo', '2015-10-27 07:30:58.000000', '2015-10-28 09:56:28.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'Under the Stakeholder Form stakeholder name is written as ''stakholder'' and needs to be corrected.', '', 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(85, 'Stakeholder profile- add to the main menu bar with Site profile', '2015-10-27 14:01:42.000000', '2015-10-28 09:56:13.000000', 'nadhikari@af.mercycorps.org', 4, 0, 'Stakeholder profile is currently under Project dashboard. It should be moved to the menu bar with the Site Profile. \r\nStakeholder profile should be independent. And we should be able to link them to multiple PAs', '', 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(86, 'Add Project agreement field in the Indicator Data form', '2015-10-27 14:16:43.000000', '2015-10-28 07:37:12.000000', 'nadhikari@af.mercycorps.org', 4, 0, 'https://tola-activity-demo.mercycorps.org/indicators/collecteddata_add/61/36/\r\n\r\n', '', 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(92, 'Site Profile in Demo--Community section still has Afghanistan specific fields', '2015-10-29 05:43:48.000000', '2015-10-29 09:42:50.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'https://tola-activity-demo.mercycorps.org/activitydb/siteprofile_add\r\n\r\nReviewed our Daily Log again to see if we''d decided on a change there. I think what we wanted to change "Community" to was "Contact" with an open text box just as you have in the stakeholder profile. Delete "Community Malik/Elder Name" and "Head of Shura/Insitutution." \r\n\r\n ', '', 3, NULL, NULL, 21, 1, '', '', '', 2, 0),
(93, 'Stakeholder Profile in Demo--No type options or admin to fill, hard to test', '2015-10-29 05:50:31.000000', '2015-10-29 14:46:34.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'The type field under the Stakeholder Profile has no options to select. I don''t see where I can define this on the Admin page either. Makes it difficult to test the form. \r\n', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(94, 'Timor Map shows up as Philippines', '2015-10-29 05:52:39.000000', '2015-11-03 16:31:31.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'The Timor-Leste Map shows up as the Philippines and at a very small scale on the Site Profile and the Home Dashboard page. Can you center and enlarge this tiny but very important country! \r\n\r\n', 'This looks to be fixed in demo.  Not sure how though.', 2, NULL, NULL, NULL, 1, '', '', '', 1, 1),
(95, 'can select type in Stakeholder form', '2015-11-02 04:13:44.000000', '2015-11-03 16:30:41.000000', 'msadat@af.mercycorps.org', 4, 0, 'i wanted to enter some "stakeholder" data in to Tola demo but in "type" menu there was nothing to select even i can not add it through admin and with out selecting of the type i cant save the form. would you please add it in admin.', 'Type is no longer required, but for type field to show up we need to add types in the admin', 3, NULL, NULL, NULL, 1, '', '', '', 1, 1),
(97, 'Trying to delete documents we''ve uploaded as tests ', '2015-11-03 00:29:53.000000', '2015-11-03 00:29:53.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'https://tola-activity.mercycorps.org/activitydb/documentation_delete/37/\r\n\r\nI want to delete one of the documents we uploaded as a test/dummy document in Activity. At the link above, when I clicked delete there was returned a "No reverse match" screen, attached here. Is it impossible to delete documents? In the future I will use the DEMO site when uploading tests?', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(98, 'Additional changes to PA form as per NBO discussion', '2015-11-03 00:32:10.000000', '2015-12-10 00:08:34.000000', 'esinn@mercycorps.org', 4, 0, 'We also discussed the following changes to the PA form in Nairobi:\r\n\r\nChange Total Estimate budget to Total Project Budget\r\nChange MC estimated budget to Mercy Corps'' portion of the Project Budget\r\nRemove currency conversion fields \r\nHide Other Budget Contributions (except for Afghanistan) --THIS WAS A JOKE LEAVE IT IN FOR NOW\r\nJustification tab - Add checklist for uploading/linking full stakeholder analysis and description of deliverables -- CHECKLIST GLOBALS ARE CONFIGURABLE AS WELL AS BY PROJECT\r\nApproval tab - change Approval to Approval Status; remove the following fields: approval submitted by, field verification by and date', '', 3, NULL, NULL, 5, 1, '', '', '', 2, 0),
(99, 'Additional changes to PC form per NBO discussion', '2015-11-03 00:50:10.000000', '2015-12-14 01:46:15.000000', 'esinn@mercycorps.org', 4, 0, 'Below are additional changes to the Project Complete form that I noted:\r\n\r\nHow/where do you add stakeholders here?\r\nSee changes to budget on PA form \r\nHide other budget contributions \r\nJustifications - consolidate two fields to "description of key stakeholder involvement); also this tab needs to be retitled - title doesn''t match the section\r\nImpact - change "what capacity was built to ensure sustainability" to "describe how sustainability was ensured for this project?"\r\nAdd to impact tab - how was quality assured for this project?\r\nRemove community handover/maintenance check box (will add to project completion checklist)', 'Big giant fix everything I don''t like tickets = Bad\r\n\r\nStakeholders have a section for adding new stakeholders\r\nbudget changes are being added as new issue and discussed with Finance "see comments in github issue"', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(100, 'Demo PA feedback-- Duration, "Save & Next" button, Adding monitoring, benchmarks, etc. ', '2015-11-03 05:57:52.000000', '2015-11-03 23:50:11.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'Overall, I am a big fan of the simplified PA that we''ve come up with. It feels more flexible and manageable. Below are a list problems or enhancements I noticed in the current version of the Project Agreement in tola-activity-demo, tab by tab: \r\n\r\nGeneral\r\n1. Change the green "Save" button to "Save & Next". This should save and push to the next tab in the agreement so that user knows their entered information is safe. \r\n2. At the moment, entered information is lost each time "Save" button is clicked. The exception are for required fields and for what is entered in the pop-up boxes that result when you add monitoring, benchmarking, quantitative outputs, budget contributions. \r\n\r\nExecutive Summary\r\n1. Project Type hint: delete "Please refer to Form 05 - Project Progress Summary" and add "Use these to tag your project by program specific sectors"\r\n2. Project Other Type hint, same as 1. \r\n3. Expected duration should auto populate based on the dates entered in the Start and End fields just above. Can we also flag on the program/home dashboard any agreements that have exceeded their expected duration? \r\n\r\nBudgets\r\nnone\r\n\r\nJustification and Description\r\n1. To maintain a strict, clear distinction between "project" and "activity" as they live within the Tola system, I suggest changing "Description of project activities" to "Description of Project" \r\n2. Delete the "Description of Project" hint as it is still Afg specific. Replace with something broader. I suggest, "Briefly describe the day to day work you will need to do to accomplish this project activity. Include rationale for budget, scope, timeframe as well as those MC staff and other stakeholders that will be necessary to seeing this project is effectively implemented. Site any documentation/monitoring efforts that you''ll need to do before completion." \r\n3. Add to the hint under "Effect or Impact" to say "Please do not include outputs and keep less than 120 words. Describe the logic that will link this project/activity to the proposed desired outcome/goal. Note any assumptions that are critical in this logic chain." \r\n\r\nM&E\r\n1. When adding benchmarks, does it always have to be % completed? Can we have a field to enter the integer and then a drop down to select %, #? \r\n\r\nApprovals \r\n1. Change "Estimated by date" to "Data originated" (or something more smooth/clear than that...)\r\n2. Delete "Field Verification by" and "Reviewed by date"\r\n\r\nUpdate the Form Guide accordingly.\r\n\r\n', 'Please don''t add giant fix everything tickets.  It makes hard for people to vote on or discuss specific issues.', 2, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(101, 'The "Inspired in Kabul. Built in Portland" tag has poor punctuation...', '2015-11-03 06:04:10.000000', '2015-11-03 14:27:10.000000', 'clivingstone@cn.mercycorps.org', 4, 0, '... where''s the second period? \r\n\r\nI''m no grammar queen but this is driving me crazy. ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 3, -1);
INSERT INTO `helpdesk_ticket` (`id`, `title`, `created`, `modified`, `submitter_email`, `status`, `on_hold`, `description`, `resolution`, `priority`, `due_date`, `last_escalation`, `assigned_to_id`, `queue_id`, `github_issue_id`, `github_issue_number`, `github_issue_url`, `type`, `votes`) VALUES
(102, 'Demo Stakeholder Profile feedback ', '2015-11-03 06:09:45.000000', '2015-11-03 13:41:48.000000', 'clivingstone@cn.mercycorps.org', 4, 0, '1. The "Contact" field should be an open text box, not pre-defined "sally sue." Suggest adding the hint: "Record your primary contact''s name, title (if they are a part of an organization), phone number, address, e-mail, and other important notes, here."\r\n\r\n2.Can the Formal Agreement and Vetting/Due Diligence documentation both have hint "optional" and can the drop down be filtered through a tagging system when documents are created? ', 'Contacts are managed separately in the contacts section so they can be reusable per the original requirements.  Documents and type fields are now optional.', 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(103, 'Tried to export merged dataset as excel', '2015-11-03 08:54:19.000000', '2015-12-17 00:26:43.000000', 'shemingway@iq.mercycorps.org', 4, 0, 'Changed Title from tried to export merged dataset as excel', '', 3, NULL, NULL, 3, 2, '', '', '', 3, 0),
(104, 'Import from ONA - How does using repeats affect merge/export functions in Tola Tables', '2015-11-03 08:58:56.000000', '2016-01-19 16:46:36.000000', 'atpham@mercycorps.org', 1, 0, 'We were able to import two tables from Ona that have repeats (repeats creates two sheets in the workbook) and merge the two tables. We could view, edit the first sheet. When tried to "SHARE" and create new Google Sheet, it created the google sheet but with no data. Wondering if this has something to do with the repeats why it didn''t export?', NULL, 3, NULL, NULL, NULL, 2, '127488630', '15', 'https://github.com/toladata/TolaTables/issues/15', 3, 0),
(105, 'When merging two tables, Tables should prompt to keep a original copy of the table', '2015-11-03 09:08:39.000000', '2015-12-19 00:16:02.000000', 'atpham@mercycorps.org', 4, 0, 'Currently after merging two tables, the one you choose to merge with another, disappears. It would be good to have the option to keep an original copy.', 'This is already addressed by commit 9908854', 3, NULL, NULL, 3, 2, '', '', '', 2, 2),
(106, 'Change the order of the Workflow navigation drop down', '2015-11-03 22:50:12.000000', '2015-11-24 22:15:44.000000', 'esinn@mercycorps.org', 4, 0, 'Change the order of the items when you click on Workflow in the top navigation to alphabetical order\r\n', 'The navigation is ordered by type and then precedence and then alpha.', 4, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(107, 'Add "data source" to Indicator data acquisition ', '2015-11-03 23:01:52.000000', '2015-11-03 23:01:52.000000', 'esinn@mercycorps.org', 4, 0, 'Feedback from Nairobi:  \r\nAdd "data source" to means of verification on the data acquisition tab.  So it reads: Means of Verification / Data Source', NULL, 4, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(108, 'Administrative levels for Lebanon incorrect', '2015-11-05 13:14:58.000000', '2015-11-06 01:24:11.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'I was going through the Administrative levels for Lebanon and they did not correspond to the data in the spreadsheet.  There are three levels for Lebanon 1) Governorate and they are Akkar, Baalbeck-ElHermel, Beirut, Bekaa, El-Nabatieh, Mount Lebanon, North and South.  In the current system they are different.\r\nLevel 2) is district and we have 26 districts.  in Tola demo, I think level 3 were added as level 2.\r\nLevel 3) those are the villages.  They are also provided in the spreadsheet.  in Tola no list appears.  ', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(109, 'Add link to Tola work to Tola activity', '2015-11-05 22:41:21.000000', '2015-11-11 01:50:40.000000', 'esinn@mercycorps.org', 4, 0, 'Currently you can''t access Tola Work from Tola Activity - problemo! Add a link under help to go directly to Tola Work. Por Favor. ', 'The feedback button in the footer takes you directly to Tola Work.', 1, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(110, 'Print or grid view of indicators objectives are broken', '2015-11-06 18:23:59.000000', '2015-11-10 22:34:49.000000', 'glind@mercycorps.org', 4, 0, 'Grid view of indicators still shows individual objectives and strategic objectives', '', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(111, 'Display Iraq programs from GAIT', '2015-11-07 16:01:38.000000', '2015-12-09 22:46:15.000000', 'atpham@mercycorps.org', 4, 0, 'The Iraq team would like to use the indicator planning tool to begin tracking them there. ', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(112, 'Filter DIG indicators', '2015-11-09 21:10:59.000000', '2015-11-10 21:20:15.000000', 'esinn@mercycorps.org', 4, 0, 'Is it possible to filter the list of dig indicators? So once you choose either alpha or standard the drop down would filter to only those indicators?  Or perhaps be able to filter by which DIG sector they connect to?  Right now the full list of DIG indicators feels a little overwhelming to try and sort through. ', 'It''s already searchable and filterable in the filed itself.  Just start typing.', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(113, 'Prepopulate country/program on new indicator UI', '2015-11-09 21:15:04.000000', '2015-11-10 21:21:09.000000', 'esinn@mercycorps.org', 4, 0, 'If I click on Indicator > Indicator Planning > scroll to the relevant program and then select Create a New Indicator, can the system pre-populate that info rather than having to reselect country and program from the drop down list on the new Indicator UI?  ', 'It does pre-populate based on program and country.  It just doesn''t recognize USA', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(114, 'Add data validation to new indicator UI', '2015-11-09 21:17:19.000000', '2015-11-09 21:17:19.000000', 'esinn@mercycorps.org', 4, 0, 'For example, I selected custom as my indicator type but then selected a DIG alpha indicator.  Can the system generate an error or prompt the user to change the type to DIG?', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(115, 'Error message when I try and create a custom indicator', '2015-11-09 21:20:21.000000', '2015-11-10 22:35:58.000000', 'esinn@mercycorps.org', 4, 0, 'I selected Indicator > Indicator Planning > Create a new indicator > Type Custom > DIG (left drop down empty) > Country Timor > Program MRED \r\nAnd received the following error message:\r\n\r\nUnboundLocalError at /indicators/indicator_create/259/\r\nlocal variable ''definition'' referenced before assignment\r\nRequest Method:	POST\r\nRequest URL:	https://tola-activity-demo.mercycorps.org/indicators/indicator_create/259/\r\nDjango Version:	1.8.2\r\nException Type:	UnboundLocalError\r\nException Value:	\r\nlocal variable ''definition'' referenced before assignment\r\nException Location:	/var/www/tola-activity/htdocs/indicators/views.py in indicator_create, line 110\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Mon, 9 Nov 2015 13:18:31 -0800\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/indicators/views.py in indicator_create\r\n                    new_indicator = Indicator(country=country, owner=owner,sector=sector,name=name,source=source,definition=definition) ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nVariable	Value\r\ncountry	\r\nu''6''\r\nsubmit	\r\nu''save''\r\nindicator_type	\r\nu''1''\r\nprogram	\r\nu''254''\r\ncsrfmiddlewaretoken	\r\nu''krusSItW5g9busT4zz8EVkCAaxXReJrq''\r\nservice_indicator	\r\nu''0''\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\nkm_lv	\r\n''x''\r\noptimizelyEndUserId	\r\n''oeu1426178086900r0.33647501352243125''\r\nkm_ai	\r\n''uLTSOJN559s9yWX2ZAJnmUBswlU%3D''\r\n_ga	\r\n''GA1.2.107862919.1426178087''\r\noptimizelySegments	\r\n''%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D''\r\nkm_uq	\r\n''''\r\nsessionid	\r\n''vygr94yan4g2clod1090ziy9087yml61''\r\ncsrftoken	\r\n''krusSItW5g9busT4zz8EVkCAaxXReJrq''\r\n__utma	\r\n''185632118.107862919.1426178087.1426178087.1426287090.2''\r\noptimizelyBuckets	\r\n''%7B%222115560571%22%3A%222442901605%22%2C%222214141681%22%3A%222213931163%22%2C%222445310539%22%3A%222465270090%22%2C%222786931510%22%3A%222798370973%22%7D''\r\ncosign-tola	\r\n''oMo098Oo3DUhNISenqaPJazDKzZtX4ZcdZfZuot+nS7LO4pv0-0u079qIy7Lh5OKwk5pkL74GDZ3ruFN71zir5zu-HU1570lfeozZvDveG9764MbvgP3K0kLbbM6/1447103070''\r\nMETA\r\nVariable	Value\r\nAUTH_TYPE	\r\n''Cosign''\r\nmod_wsgi.listener_port	\r\n''443''\r\nREMOTE_REALM	\r\n''ldap''\r\nmod_wsgi.listener_host	\r\n''''\r\nSERVER_SOFTWARE	\r\n''Apache''\r\nSCRIPT_NAME	\r\nu''''\r\nmod_wsgi.enable_sendfile	\r\n''0''\r\nmod_wsgi.handler_script	\r\n''''\r\nSERVER_SIGNATURE	\r\n''<address>Apache Server at tola-activity-demo.mercycorps.org Port 443</address>\\n''\r\nREQUEST_METHOD	\r\n''POST''\r\nPATH_INFO	\r\nu''/indicators/indicator_create/259/''\r\nHTTP_ORIGIN	\r\n''https://tola-activity-demo.mercycorps.org''\r\nSERVER_PROTOCOL	\r\n''HTTP/1.1''\r\nQUERY_STRING	\r\n''''\r\nSSL_TLS_SNI	\r\n''tola-activity-demo.mercycorps.org''\r\nCOSIGN_SERVICE	\r\n''cosign-tola''\r\nCONTENT_LENGTH	\r\n''678''\r\nHTTP_USER_AGENT	\r\n''Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36''\r\nHTTP_CONNECTION	\r\n''keep-alive''\r\nHTTP_REFERER	\r\n''https://tola-activity-demo.mercycorps.org/indicators/indicator_create/259/''\r\nSERVER_NAME	\r\n''tola-activity-demo.mercycorps.org''\r\nREMOTE_ADDR	\r\n''67.170.137.248''\r\nmod_wsgi.queue_start	\r\n''1447103911360300''\r\nmod_wsgi.request_handler	\r\n''wsgi-script''\r\nwsgi.url_scheme	\r\n''https''\r\nPATH_TRANSLATED	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py/indicators/indicator_create/259/''\r\nSERVER_PORT	\r\n''443''\r\nwsgi.multiprocess	\r\nTrue\r\nmod_wsgi.input_chunked	\r\n''0''\r\nSERVER_ADDR	\r\n''192.168.8.60''\r\nDOCUMENT_ROOT	\r\n''/var/www/tola-activity/htdocs''\r\nmod_wsgi.process_group	\r\n''tola-activity''\r\nSCRIPT_FILENAME	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py''\r\nCOSIGN_FACTOR	\r\n''ldap''\r\nSERVER_ADMIN	\r\n''root@localhost''\r\nwsgi.input	\r\n<mod_wsgi.Input object at 0xa3a13480>\r\nREMOTE_USER	\r\n''esinn''\r\nHTTP_HOST	\r\n''tola-activity-demo.mercycorps.org''\r\nwsgi.multithread	\r\nTrue\r\nHTTP_UPGRADE_INSECURE_REQUESTS	\r\n''1''\r\nHTTP_CACHE_CONTROL	\r\n''max-age=0''\r\nREQUEST_URI	\r\n''/indicators/indicator_create/259/''\r\nHTTP_ACCEPT	\r\n''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\r\nPERL5LIB	\r\n''/usr/share/awstats/lib:/usr/share/awstats/plugins''\r\nmod_wsgi.callable_object	\r\n''application''\r\nwsgi.version	\r\n(1, 0)\r\nGATEWAY_INTERFACE	\r\n''CGI/1.1''\r\nwsgi.run_once	\r\nFalse\r\nwsgi.errors	\r\n<mod_wsgi.Log object at 0xa3a05480>', '', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(116, '"Export All" button In Reports > Activity Report does not work', '2015-11-10 10:33:59.000000', '2016-01-14 18:52:30.000000', 'msadat@af.mercycorps.org', 1, 0, 'The export button is not working under Report > Activity Report .', NULL, 3, NULL, NULL, 11, 1, '', '', '', 1, 4),
(117, 'Indicator page', '2015-11-10 18:32:21.000000', '2015-11-10 18:32:21.000000', 'esalazar@et.mercycorps.org', 4, 0, '1) If you are trying to enter indicators for one program, every time you save one indicator you are directed back to the main Indicator page, where you have to again select your program.  Is there any way you can save the indicator and return to the current program?\r\n\r\n2) Objectives: Would it be possible to show only those objectives that are related to that program instead of having to scroll down a very confusing list of objectives\r\n\r\n3) Do you have to be online to enter indicators or is there an offline tool?  \r\n\r\n4) do you have to be online to enter updates to the indicators or is there an offline tool?\r\n\r\n5) Related to the reporting frequency, is there any way the owner of the indicator can be reminded to provide an update to the indicator data?', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(118, 'Non-TL program is showing up in our Indicator planning page. Please remove. ', '2015-11-12 03:38:44.000000', '2015-11-12 03:38:44.000000', 'clivingstone@cn.mercycorps.org', 4, 0, '6528 - 2015-2016 Integrated Afghan Refugee Assistance Project displays on Timor''s Indicator planning page here: https://tola-activity.mercycorps.org/indicators/home/0/\r\n\r\nCan this be removed? Thanks! ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(119, 'Sortable Grid Print for the Indicator Planning tool', '2015-11-12 03:48:04.000000', '2015-11-12 03:48:04.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'At the moment when you open the grid print the indicators show up in the order that they are entered. I think it would make the most sense for indicators to initially display according to program logic hierarchy. But it would also be useful if we could sort the graph by each column so that we can group indicators collected with a single MOV, for example, or by person responsible, or frequency of collection.\r\n\r\nThanks!', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(120, 'Cannot access Site Profile because of log in issues', '2015-11-13 06:26:50.000000', '2015-11-13 06:26:50.000000', 'aamaral@mercycorps.org', 4, 0, 'I am having trouble creating new Site Profile in Tola Activity because each time I click on Create New it asks me to log in again. For Stakeholder Profile and Project Agreements I have no issues creating new entries. My profile shows that I am already logged into the system and in the admin sections I am saved as Staff Status with full editing privileges. Can you help me troubleshoot why I am not accessing the new Site Profile Forms? ', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(121, 'in Django Admin when adding Objectives, add a filter per country', '2015-11-13 14:00:25.000000', '2015-11-13 14:00:25.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'When want to add objectives in the admin, we have to select the program and the list that shows is that of all programs.  Can we please filter per country to show only programs of that country?  It will make it more efficient in selection.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(122, '404 returned when click to update Site Profile', '2015-11-14 09:17:55.000000', '2015-11-14 09:17:55.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'After adding a Site Profile I tried to click to update from the pop-up on the Site Profile map. This returned a 404 page. See attached. Thanks!', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(123, 'Stakeholder Profile--Can''t pull up contact information once its been entered', '2015-11-14 10:03:19.000000', '2015-11-14 10:03:19.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'Once the contact information has been added and you can associate that background with the stakeholder I don''t see where it can be accessed again in the future. Can you add a clickable button to open the contacts background info?\r\n\r\nEven better would be a grid print of all stakeholders similar to the indicator plan grid print. \r\n\r\nThanks! ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(124, 'Open Agreements are not appearing in the bar graph on Timor''s home page', '2015-11-14 10:32:15.000000', '2015-12-01 01:14:47.000000', 'clivingstone@cn.mercycorps.org', 2, 0, 'We''ve added a few project agreements but they don''t seem to be appearing in their "open," "pending," "approved" state... \r\n\r\nIts possible that "open" agreements are not displayed in the bar chart and I don''t understand the different between "open" and "pending"', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(125, 'spelling', '2015-11-15 07:15:44.000000', '2015-12-01 01:22:59.000000', 'msadat@af.mercycorps.org', 4, 0, 'The Button which says "delete stakeholder" has a spelling mistake. Just to let you know.', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(126, 'Project Agreement: remove Project Type Other', '2015-11-16 14:46:38.000000', '2015-12-09 21:41:31.000000', 'atpham@mercycorps.org', 3, 0, 'Going forward, we''ll have each tola country admin update and customize the field options.', '', 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(127, 'PA budget tab: Change Total estimated budget to Estimated Project Budget', '2015-11-16 14:52:09.000000', '2015-12-09 23:08:25.000000', 'atpham@mercycorps.org', 4, 0, 'Also change: \r\nMC Estimated Budget to "Estimated Organization Budget"\r\n\r\nEstimated Total to "Estimated Budget" (for local currency)\r\n\r\nMove Estimated Date after "Estimated Budget" & Estimated Organization Budget" (USD)\r\n\r\n\r\n\r\n', '', 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(128, 'PA: justification and description tab', '2015-11-16 15:01:25.000000', '2015-11-30 22:37:32.000000', 'atpham@mercycorps.org', 4, 0, 'Change tab name to: "Description and Justification"\r\n\r\nRemove hint under "description of program activities"\r\n\r\nUnder tab, there should be 4 fields this order:\r\n1) Add field "Problem Statement and Selection Criteria" - combines general background and description of selection criteria\r\n2) Description of Project Activities - no change to field except reorder\r\n3) Add "Description of Government/Community/Private Sector Involvement" field\r\n4) Change "Effect or Impact" to "What is the anticipated GOAL or OUTCOME that this project will contribute to?"', '', 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(129, 'PA Approval tab', '2015-11-16 15:04:51.000000', '2015-11-30 22:52:36.000000', 'atpham@mercycorps.org', 4, 0, '"Originated By" field. Can this be the "Approval submitted by"? Think this works as everyone else won''t submit, they are just review.\r\n\r\nChange "estimated date" to "Originated Date"\r\n\r\nChange "reviewed date" to "Field Verification Date"\r\n\r\n', '', 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(130, 'Site Profile: Add optional approval tab', '2015-11-16 16:28:37.000000', '2016-01-14 18:56:50.000000', 'atpham@mercycorps.org', 4, 0, 'This section should include:\r\n\r\nOriginated by:\r\nApproved by:', 'https://github.com/toladata/TolaActivity/issues/43', 3, NULL, NULL, 11, 1, '', '', '', 2, 1),
(131, 'Stakeholder profile: Add optional Approval tab', '2015-11-16 16:31:44.000000', '2015-11-30 19:25:39.000000', 'atpham@mercycorps.org', 1, 0, 'This should have two fields:\r\n\r\nOriginated by:\r\nApproved by:\r\n\r\n\r\n', NULL, 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(132, 'Indicator Planning Tab: reordering fields', '2015-11-16 16:48:30.000000', '2015-11-30 22:39:59.000000', 'atpham@mercycorps.org', 1, 0, 'Move "Country" fields to the Summary tab.\r\n\r\nIt makes sense to have these on the summary so that the planning form mirrors closely to the MC Indicator plan template.\r\n\r\nWith this the new Summary tab would be ordered as:\r\n\r\nProgram\r\nSector\r\nProgram Objectives\r\nStrategic Objectives\r\nCountry\r\n\r\nAlso "Owner" field should be revisited and up for discussion to distinguish what is the difference between "Owner" and "Approved by". I think we only need one field.', NULL, 5, NULL, NULL, 11, 1, '', '', '', 2, 0),
(133, 'Collected Indicator Data Form (under Indicator Data)', '2015-11-16 17:14:18.000000', '2015-11-30 22:13:49.000000', 'atpham@mercycorps.org', 4, 0, 'Remarks/Comments should be a TextField\r\n', NULL, 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(134, 'Project Completion - Executive Summary Tab', '2015-11-16 17:37:39.000000', '2016-01-04 16:51:58.000000', 'atpham@mercycorps.org', 4, 0, 'Remove Expected and Actual Duration fields - removed from agreement already\r\n', 'We need the name and activity fields and can not remove those, site does auto populate and we have removed duration fields.', 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(135, 'Project Completion - Budget Tab', '2015-11-16 17:53:33.000000', '2015-12-09 23:24:38.000000', 'atpham@mercycorps.org', 4, 0, 'Under Budget tab, I''ve suggested a reordering plus minor changes to the field names:\r\n\r\n1) Change "Estimated Budget" to "Estimated Budget"\r\n2) Change "Actual Budget" to "Actual Cost"\r\n3) Add new field "Actual Cost Date"\r\n4) Change "Budget Variance" to "Budget versus Actual variance"\r\n5) No change - "Explanation of Variance" field\r\n6) Change "Total Cost" to "Estimated Budget for Organization (In USD)"\r\n7) Change "Agency Cost" to "Actual Cost for Organization (In USD)"\r\n8) Change "Total in local currency" to "Actual Cost (In Local Currency)"\r\n9) Change "Organization Total in local currency" to "Actual Cost for Organization (In Local Currency)"\r\n10) Move "Account Code" field here\r\n11) Change "LIN Sub Code" to "LIN Code" and move "LIN Code" field here\r\n12) Move "Other Budget Contribution" tab to the bottom of the "Budget" tab', '', 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(136, 'Add multiple evidence documents/links (for non-tabular level 3 evidence)', '2015-11-17 13:57:00.000000', '2015-11-30 20:54:33.000000', 'atpham@mercycorps.org', 1, 0, 'For level 3, think it makes sense to include ways to add multiple documents directly in Tola Activity since they just need to be linked and won''t be used for tabulation.', NULL, 3, NULL, NULL, 11, 1, '', '', '', 2, 3),
(137, 'Add Evidence Status visual to Tola Activity Dashboard', '2015-11-17 13:58:19.000000', '2015-11-30 21:20:43.000000', 'atpham@mercycorps.org', 1, 0, 'Work with Greg...\r\n\r\nLevel 1 - For Survey Data: Tola Tables + Set timer to refresh from Ona (Tabular); For Monitoring Data: Project Workflow\r\nLevel 2 - For Survey and Monitoring Data: Tola Tables (manual upload data sets (Tabular)\r\nLevel 3 - For Survey and Monitoring Data: Upload documents/links via Tola-Activity (Non-tabular)\r\nLevel 4 - No Evidence :(\r\n\r\nAdd to program dashboard ', NULL, 3, NULL, NULL, 11, 1, '', '', '', 2, 2),
(138, 'Project Completion: Remove "Justifications" tab', '2015-11-17 14:27:13.000000', '2015-12-09 23:30:40.000000', 'atpham@mercycorps.org', 4, 0, 'Since we are collecting this information on the Project Agreement form already, there should not be many updates during the Project Completion Phase.', '', 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(139, 'Project Completion: Combine "Lessons Learned" with "Impact" tab', '2015-11-17 14:30:09.000000', '2015-12-10 00:03:09.000000', 'atpham@mercycorps.org', 4, 0, 'The new tab should be called "Impact".\r\n\r\nSince Lessons Learn tab only includes two fields, it makes sense to incorporate this into the "Impact" tab.\r\n\r\n', '', 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(140, 'Project Completion: Add "Progress against Targets" under Quantitative Evidence', '2015-11-17 14:30:53.000000', '2015-12-10 00:17:08.000000', 'atpham@mercycorps.org', 4, 0, 'Under the Quantitative Evidence section under "Impact", we need to add "Progress against Targets (%)". This is a calculation: achieved divided by target and should be displayed as a %.', '', 3, NULL, NULL, 11, 1, '', '', '', 2, 1),
(141, 'Project Completion: Approval tab', '2015-11-17 14:32:52.000000', '2015-11-30 20:54:33.000000', 'atpham@mercycorps.org', 1, 0, 'Add the following approvals/reviews (to match Project Agreement):\r\n\r\nOriginated By:\r\nField Verification By:\r\nMEL Review:\r\nFinance Review:\r\nRemove "Approval Submitted By:"\r\n', NULL, 3, NULL, NULL, 11, 1, '', '', '', 2, 0),
(143, 'country defaulted to Afghanistan for one WASH program indicators', '2015-11-17 15:40:20.000000', '2015-11-30 21:01:12.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'Program 5887 indicator plan indicators had the country defaulted to Afghanistan for all the indicators.  Not sure why that happened.  I manually fixed it for each indicator.', 'Sarah resolved. Checked admin and all indicators for program were reselected as Lebanon', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(144, 'No Lost Generation Program not showing on Tola', '2015-11-17 15:51:32.000000', '2015-11-30 20:53:41.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'Psychosocial Support and Safe Access to Education for Youth program with GAIT ID 5717 is not showing on Tola to be able to add indicators to.  It is on GAIT. Duration 31-3-2014 to 31-3-2016', 'NLG program is now displaying under Lebanon. The official program name is:\r\n"GAITID: 5717 - Psychosocial Support and Safe Access to Education for Youth"\r\n\r\n', 2, NULL, NULL, 9, 1, '', '', '', 1, 11),
(145, 'error 400 when try to login with Google account', '2015-11-17 17:07:36.000000', '2015-12-16 20:37:23.000000', 'esinn@mercycorps.org', 4, 0, 'Received the following error when I went to log in to Tola Tables with my Google account:\r\n\r\n400. That’s an error.\r\n\r\nError: redirect_uri_mismatch\r\n\r\nApplication: Tola-Help\r\n\r\nYou can email the developer of this application at: gwlind@gmail.com\r\n\r\nThe redirect URI in the request: https://tola-tables.mercycorps.org/complete/google-oauth2/ did not match a registered redirect URI.\r\n\r\nLearn more\r\n\r\nRequest Details\r\nThat’s all we know.', '', 3, NULL, NULL, NULL, 2, '', '', '', 3, 0),
(146, 'Change Tola Data to Tola Tables on Tola Work', '2015-11-17 17:09:50.000000', '2015-12-16 19:51:13.000000', 'esinn@mercycorps.org', 4, 0, 'When you submit a new ticket on Tola Work the drop down in the "queue" field still reads Tola Data.  Needs to change to Tola Tables. \r\n\r\nWe should do a full review and make sure we''re consistent on the naming conventions  everywhere.  It''s confusing right now. ', 'This was fixed in the tola work admin.', 3, NULL, NULL, NULL, 2, '', '', '', 3, 0),
(147, 'Duplicate alpha/standard selections in Indicator type on Demo site ', '2015-11-17 18:45:23.000000', '2015-12-01 01:24:18.000000', 'esinn@mercycorps.org', 4, 0, 'On the demo site of Tola Activity for the new DIG integration, there are duplicate selections in Indicator type: alpha, standard, DIG alpha, DIG standard.  Keep: DIG alpha and DIG standard', 'The old versions of the indicators types for DIG need to stay for now while in use, they can not be migrated to the alpha or standard ones imported directly from DIG', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(148, 'Restrict changes to name field for all DIG indicators', '2015-11-17 18:46:56.000000', '2016-01-08 20:36:50.000000', 'esinn@mercycorps.org', 1, 0, 'Tola Activity Demo:\r\nDIG team would like to restrict users from being able to make changes to the name field for and DIG alpha or standard indicator. ', NULL, 3, NULL, NULL, 2, 1, '', '', '', 2, 0),
(149, 'Duplicate programs cause error on PA save', '2015-11-17 19:48:31.000000', '2016-01-07 18:38:23.000000', 'ksandstrom@mercycorps.org', 4, 0, 'User''s who have access to multiple countries may see duplicate programs. If they try and save a PA to one of the duplicate programs, they will receive the following JSON error. \r\nExample of a Duplicate Program:\r\nGAITID: 6514 Toys for Busma Centers in Lebanon\r\nListed twice for a user who has access to Lebanon and Pakistan country programs in their Activtiy Profile\r\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\nMultipleObjectsReturned at /activitydb/projectagreement_update/220/\r\nget() returned more than one Program -- it returned 2!\r\nRequest Method:	POST\r\nRequest URL:	https://tola-activity-demo.mercycorps.org/activitydb/projectagreement_update/220/\r\nDjango Version:	1.8.2\r\nException Type:	MultipleObjectsReturned\r\nException Value:	\r\nget() returned more than one Program -- it returned 2!\r\nException Location:	/usr/local/lib/python2.7/site-packages/django/db/models/query.py in get, line 338\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Tue, 17 Nov 2015 11:30:40 -0800', NULL, 5, NULL, NULL, 11, 1, '', '', '', 3, 0),
(150, 'Error message when I click on "Create new checklist"', '2015-11-17 21:36:17.000000', '2015-12-14 23:27:37.000000', 'esinn@mercycorps.org', 4, 0, 'I received the following error message when I click on Checklist from project dashboard and then Create New Checklist:\r\n\r\nFieldError at /activitydb/checklist_add/7/\r\nCannot resolve keyword ''country'' into field. Choices are: checklist, checklist_id, create_date, edit_date, global_item, id, in_file, item, not_applicable\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/activitydb/checklist_add/7/\r\nDjango Version:	1.8.2\r\nException Type:	FieldError\r\nException Value:	\r\nCannot resolve keyword ''country'' into field. Choices are: checklist, checklist_id, create_date, edit_date, global_item, id, in_file, item, not_applicable\r\nException Location:	/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in names_to_path, line 1391\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Tue, 17 Nov 2015 13:33:34 -0800\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in view\r\n                        return self.dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/activitydb/views.py in dispatch\r\n                    return super(ChecklistCreate, self).dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in dispatch\r\n                    return handler(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    return super(BaseCreateView, self).get(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    form = self.get_form() ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get_form\r\n                    return form_class(**self.get_form_kwargs()) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/activitydb/forms.py in __init__\r\n                    self.fields[''item''].queryset = ChecklistItem.objects.filter(country__in=countries) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/manager.py in manager_method\r\n                            return getattr(self.get_queryset(), name)(*args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/query.py in filter\r\n                    return self._filter_or_exclude(False, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/query.py in _filter_or_exclude\r\n                        clone.query.add_q(Q(*args, **kwargs)) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in add_q\r\n                    clause, require_inner = self._add_q(where_part, self.used_aliases) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in _add_q\r\n                                allow_joins=allow_joins, split_subq=split_subq, ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in build_filter\r\n                    lookups, parts, reffed_aggregate = self.solve_lookup_type(arg) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in solve_lookup_type\r\n                    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta()) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in names_to_path\r\n                                                 "Choices are: %s" % (name, ", ".join(available))) ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nNo POST data\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\nkm_lv	\r\n''x''\r\noptimizelyEndUserId	\r\n''oeu1426178086900r0.33647501352243125''\r\nkm_ai	\r\n''uLTSOJN559s9yWX2ZAJnmUBswlU%3D''\r\n_ga	\r\n''GA1.2.107862919.1426178087''\r\noptimizelySegments	\r\n''%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D''\r\nkm_uq	\r\n''''\r\nsessionid	\r\n''upaykxlg3suu6d7dpcenxd28gj3wfnc8''\r\ncsrftoken	\r\n''6VmevB3CDYTVz3z3eFBLNm9vr8060E7q''\r\n__utma	\r\n''185632118.107862919.1426178087.1426178087.1426287090.2''\r\noptimizelyBuckets	\r\n''%7B%222115560571%22%3A%222442901605%22%2C%222214141681%22%3A%222213931163%22%2C%222445310539%22%3A%222465270090%22%2C%222786931510%22%3A%222798370973%22%7D''\r\ncosign-tola	\r\n''DiwaskNsjzKh7Bh+rosc7j5wZazOY015Eqq0IRiqcXOu7P6ppBd+Y8+HNwATXVXbreH+2UrZ0-ViYuX3YX2HSbzg0uWBPTOPR1GpvshWOk5g1ULpS3K7f2+E1k+v/1447780371''\r\nMETA\r\nVariable	Value\r\nAUTH_TYPE	\r\n''Cosign''\r\nmod_wsgi.listener_port	\r\n''443''\r\nHTTP_REFERER	\r\n''https://tola-activity.mercycorps.org/activitydb/checklist', '', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(152, 'login prompt when trying to access site profile', '2015-11-18 08:17:25.000000', '2015-12-28 20:56:35.000000', 'atpham@mercycorps.org', 4, 0, 'ajammoul@lb.mercycorps.org is prompt to login and password when selecting "New Site Profile". He accessed that by going to Workflow > Sites > New Site Profile', 'This is a permission issue.  User ajammooul did not have permission to add new sites because he was not an editor.  It looks like his profile was updated to allow this on Dec. 7, 2015, 7:11 a.m.	 by skouzi (Sarah Kouzi).  We will create a new ticket for making permissions errors more clear rather then the login prompt.', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(153, 'erroe when entering new table', '2015-11-18 15:31:48.000000', '2015-12-17 00:32:42.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'when I was entering a new table on Tola Data after I submit the CSV file, I got the below attached error page.', NULL, 2, NULL, NULL, 3, 2, '', '', '', 3, 3),
(154, 'Tola Activity Help links should link to Tola.Work', '2015-11-18 20:13:10.000000', '2015-12-16 19:09:57.000000', 'ksandstrom@mercycorps.org', 4, 0, 'The Help Links on Tola-Activity should link to Tola.Work\r\nhttps://tola-activity.mercycorps.org/faq --> http://tola.work/faq\r\n\r\nhttps://tola-activity.mercycorps.org/contact --> http://tola.work/contact\r\n\r\nhttps://tola-activity.mercycorps.org/documentation --> http://tola.work/documentation\r\n', '', 4, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(155, 'Tola Data Help links should link to Tola.Work', '2015-11-18 20:15:31.000000', '2016-01-20 19:07:59.000000', 'ksandstrom@mercycorps.org', 1, 0, 'The Help Links on Tola Data/Tables should link to Tola.Work\r\nhttps://tola-data.mercycorps.org/faq --> http://tola.work/faq\r\n\r\nhttps://tola-data.mercycorps.org/contact --> http://tola.work/contact\r\n\r\nhttps://tola-data.mercycorps.org/documentation --> http://tola.work/documentation', NULL, 4, NULL, NULL, NULL, 2, '', '', '', 2, 1),
(156, 'Error when I click on the site name from a pin on the map on the site profile page ', '2015-11-19 00:07:51.000000', '2015-12-01 01:33:29.000000', 'esinn@mercycorps.org', 4, 0, 'Received the following error message when I clicked on the name of a site directly from the pin on the map on the main site profile page\r\n\r\nPage not found (404)\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/activitydb/community_update/103\r\nUsing the URLconf defined in tola.urls, Django tried these URL patterns, in this order:\r\n^api/\r\n^api-auth/\r\n^$ [name=''index'']\r\n^dashboard/(?P<id>\\w+)/(?P<sector>\\w+)/$ [name=''index'']\r\n^$\r\n^admin/doc/\r\n^admin/\r\n^contact [name=''contact'']\r\n^faq [name=''faq'']\r\n^documentation [name=''documentation'']\r\n^activitydb/ ^report_builder/\r\n^activitydb/ ^dashboard/(?P<pk>\\w+)/$ [name=''dashboard'']\r\n^activitydb/ ^dashboard/project/(?P<pk>\\w+)/$ [name=''project_dashboard'']\r\n^activitydb/ ^dashboard/project/(?P<pk>\\w+)$ [name=''project_dashboard'']\r\n^activitydb/ ^dashboard/project [name=''project_dashboard'']\r\n^activitydb/ ^projectagreement_list/(?P<pk>\\w+)/$ [name=''projectagreement_list'']\r\n^activitydb/ ^projectagreement_add/$ [name=''projectagreement_add'']\r\n^activitydb/ ^projectagreement_update/(?P<pk>\\w+)/$ [name=''projectagreement_update'']\r\n^activitydb/ ^projectagreement_delete/(?P<pk>\\w+)/$ [name=''projectagreement_delete'']\r\n^activitydb/ ^projectagreement_import [name=''projectagreement_import'']\r\n^activitydb/ ^projectagreement_detail/(?P<pk>\\w+)/$ [name=''projectagreement_detail'']\r\n^activitydb/ ^projectcomplete_list/(?P<pk>\\w+)/$ [name=''projectcomplete_list'']\r\n^activitydb/ ^projectcomplete_add/(?P<pk>\\w+)/$ [name=''projectcomplete_add'']\r\n^activitydb/ ^projectcomplete_update/(?P<pk>\\w+)/$ [name=''projectcomplete_update'']\r\n^activitydb/ ^projectcomplete_delete/(?P<pk>\\w+)/$ [name=''projectcomplete_delete'']\r\n^activitydb/ ^projectcomplete_import [name=''projectcomplete_import'']\r\n^activitydb/ ^projectcomplete_detail/(?P<pk>\\w+)/$ [name=''projectcomplete_detail'']\r\n^activitydb/ ^siteprofile_list/(?P<program_id>\\w+)/(?P<activity_id>\\w+)/$ [name=''siteprofile_list'']\r\n^activitydb/ ^siteprofile_report/(?P<pk>\\w+)/$ [name=''siteprofile_report'']\r\n^activitydb/ ^siteprofile_add [name=''siteprofile_add'']\r\n^activitydb/ ^siteprofile_update/(?P<pk>\\w+)/$ [name=''siteprofile_update'']\r\n^activitydb/ ^siteprofile_delete/(?P<pk>\\w+)/$ [name=''siteprofile_delete'']\r\n^activitydb/ ^documentation_list/(?P<pk>\\w+)/$ [name=''documentation_list'']\r\n^activitydb/ ^documentation_add [name=''documentation_add'']\r\n^activitydb/ ^documentation_agreement_add/(?P<id>\\w+)/$ [name=''documentation_agreement_add'']\r\n^activitydb/ ^documentation_agreement_update/(?P<pk>\\w+)/(?P<id>\\w+)/$ [name=''documentation_agreement_update'']\r\n^activitydb/ ^documentation_agreement_delete/(?P<pk>\\w+)/$ [name=''documentation_agreement_delete'']\r\n^activitydb/ ^documentation_update/(?P<pk>\\w+)/$ [name=''documentation_update'']\r\n^activitydb/ ^documentation_delete/(?P<pk>\\w+)/$ [name=''documentation_delete'']\r\n^activitydb/ ^monitor_list/(?P<pk>\\w+)/$ [name=''monitor_list'']\r\n^activitydb/ ^monitor_add/(?P<id>\\w+)/$ [name=''monitor_add'']\r\n^activitydb/ ^monitor_update/(?P<pk>\\w+)/$ [name=''monitor_update'']\r\n^activitydb/ ^monitor_delete/(?P<pk>\\w+)/$ [name=''monitor_delete'']\r\n^activitydb/ ^quantitative_add/(?P<id>\\w+)/$ [name=''quantitative_add'']\r\n^activitydb/ ^quantitative_update/(?P<pk>\\w+)/$ [name=''quantitative_update'']\r\n^activitydb/ ^quantitative_delete/(?P<pk>\\w+)/$ [name=''quantitative_delete'']\r\n^activitydb/ ^benchmark_add/(?P<id>\\w+)/$ [name=''benchmark_add'']\r\n^activitydb/ ^benchmark_update/(?P<pk>\\w+)/$ [name=''benchmark_update'']\r\n^activitydb/ ^benchmark_delete/(?P<pk>\\w+)/$ [name=''benchmark_delete'']\r\n^activitydb/ ^training_list/(?P<pk>\\w+)/$ [name=''training_list'']\r\n^activitydb/ ^training_add/(?P<id>\\w+)/$ [name=''training_add'']\r\n^activitydb/ ^training_update/(?P<pk>\\w+)/$ [name=''training_update'']\r\n^activitydb/ ^training_delete/(?P<pk>\\w+)/$ [name=''training_delete'']\r\n^activitydb/ ^stakeholder_list/(?P<pk>\\w+)/$ [name=''stakeholder_list'']\r\n^activitydb/ ^stakeholder_add/(?P<id>\\w+)/$ [name=''stakeholder_add'']\r\n^activitydb/ ^stakeholder_update/(?P<pk>\\w+)/$ [name=''stakeholder_update'']\r\n^activitydb/ ^stakeholder_delete/(?P<pk>\\w+)/$ [name=''stakeholder_delete'']\r\n^activitydb/ ^contact_list/(?P<pk>\\w+)/$ [name=''contact_list'']\r\n^activitydb/ ^contact_add/(?P<id>\\w+)/$ [name=''contact_add'']\r\n^activitydb/ ^contact_update/(?P<pk>\\w+)/$ [name=''contact_update'']\r\n^activitydb/ ^contact_delete/(?P<pk>\\w+)/$ [name=''contact_delete'']\r\n^activitydb/ ^checklist_list/(?P<pk>\\w+)/$ [name=''checklist_list'']\r\n^activitydb/ ^checklist_add/(?P<id>\\w+)/$ [name=''checklist_add'']\r\n^activitydb/ ^checklist_update/(?P<pk>\\w+)/$ [name=''checklist_update'']\r\n^activitydb/ ^checklist_update_link/(?P<pk>\\w+)/(?P<type>\\w+)/(?P<value>\\w+)/$ [name=''checklist_update_link'']\r\n^activitydb/ ^checklist_delete/(?P<pk>\\w+)/$ [name=''checklistdelete'']\r\n^activitydb/ ^beneficiary_list/(?P<pk>\\w+)/$ [name=''beneficiary_list'']', '', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0);
INSERT INTO `helpdesk_ticket` (`id`, `title`, `created`, `modified`, `submitter_email`, `status`, `on_hold`, `description`, `resolution`, `priority`, `due_date`, `last_escalation`, `assigned_to_id`, `queue_id`, `github_issue_id`, `github_issue_number`, `github_issue_url`, `type`, `votes`) VALUES
(157, 'Error when I clicked on a checklist ', '2015-11-19 00:25:38.000000', '2015-12-01 01:52:20.000000', 'esinn@mercycorps.org', 4, 0, 'Following error when I clicked on checklist data on this page: https://tola-activity.mercycorps.org/activitydb/checklist_list/39/\r\n\r\nFieldError at /activitydb/checklist_update/400/\r\nCannot resolve keyword ''country'' into field. Choices are: checklist, checklist_id, create_date, edit_date, global_item, id, in_file, item, not_applicable\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/activitydb/checklist_update/400/\r\nDjango Version:	1.8.2\r\nException Type:	FieldError\r\nException Value:	\r\nCannot resolve keyword ''country'' into field. Choices are: checklist, checklist_id, create_date, edit_date, global_item, id, in_file, item, not_applicable\r\nException Location:	/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in names_to_path, line 1391\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Wed, 18 Nov 2015 16:23:08 -0800\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in view\r\n                        return self.dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in dispatch\r\n                    return handler(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    return super(BaseUpdateView, self).get(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    form = self.get_form() ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get_form\r\n                    return form_class(**self.get_form_kwargs()) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/activitydb/forms.py in __init__\r\n                    self.fields[''item''].queryset = ChecklistItem.objects.filter(country__in=countries) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/manager.py in manager_method\r\n                            return getattr(self.get_queryset(), name)(*args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/query.py in filter\r\n                    return self._filter_or_exclude(False, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/query.py in _filter_or_exclude\r\n                        clone.query.add_q(Q(*args, **kwargs)) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in add_q\r\n                    clause, require_inner = self._add_q(where_part, self.used_aliases) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in _add_q\r\n                                allow_joins=allow_joins, split_subq=split_subq, ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in build_filter\r\n                    lookups, parts, reffed_aggregate = self.solve_lookup_type(arg) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in solve_lookup_type\r\n                    _, field, _, lookup_parts = self.names_to_path(lookup_splitted, self.get_meta()) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/db/models/sql/query.py in names_to_path\r\n                                                 "Choices are: %s" % (name, ", ".join(available))) ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nNo POST data\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\nkm_lv	\r\n''x''\r\noptimizelyEndUserId	\r\n''oeu1426178086900r0.33647501352243125''\r\nkm_ai	\r\n''uLTSOJN559s9yWX2ZAJnmUBswlU%3D''\r\n_ga	\r\n''GA1.2.107862919.1426178087''\r\noptimizelySegments	\r\n''%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D''\r\nkm_uq	\r\n''''\r\nsessionid	\r\n''xn66o5959n928gbu06awfm295ka1jmtv''\r\ncsrftoken	\r\n''6VmevB3CDYTVz3z3eFBLNm9vr8060E7q''\r\n__utma	\r\n''185632118.107862919.1426178087.1426178087.1426287090.2''\r\noptimizelyBuckets	\r\n''%7B%222115560571%22%3A%222442901605%22%2C%222214141681%22%3A%222213931163%22%2C%222445310539%22%3A%222465270090%22%2C%222786931510%22%3A%222798370973%22%7D''\r\ncosign-tola	\r\n''z8HMcrGw9cpiJ9Jd-KWRrSVLaIbumHuCeH+kb-GA3NgImBimz-k4zq9obaXKQGULR7rmJdL2ao1hulLpOgNef7jHj6SJlOrBTJaRu70IVj97mHTBvmN3VsIhaPEe/1447883589''\r\nMETA\r\nVariable	Value\r\nAUTH_TYPE	\r\n''Cosign''\r\nmod_wsgi.listener_port	\r\n''443''\r\nHTTP_REFERER	\r\n''https://tola-activity.mercycorps.org/activitydb/checklist_list/39/''\r\nmod_wsgi.listener_host	\r\n''''\r\nSERVER_SOFTWARE	\r\n''Apache''\r\nSCRIPT_NAME	\r\nu''''\r\nmod_wsgi.enable_sendfile	\r\n''0''\r\nmod_wsgi.handler_script	\r\n''''\r\nSERVER_SIGNATURE	\r\n''<address>Apache Server at tola-activity.mercycorps.org Port 443</address>\\n''\r\nREQUEST_METHOD	\r\n''GET''\r\nPATH_INFO	\r\nu''/activitydb/checklist_update/400/''\r\nSERVER_PROTOCOL	\r\n''HTTP/1.1''\r\nQUERY_STRING	\r\n''''\r\nSSL_TLS_SNI	\r\n''tola-activity.mercycorps.org''\r\nCOSIGN_SERVICE	\r\n''cosign-tola''\r\nHTTP_USER_AGENT	\r\n''Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36''\r\nHTTP_CONNECTION	\r\n''keep-alive''\r\nREMOTE_REALM	\r\n''ldap''\r\nSERVER_NAME	\r\n''tola-activity.mercycorps.org''\r\nREMOTE_ADDR	\r\n''10.10.27.50''\r\nmod_wsgi.queue_start	\r\n''1447892588110518''\r\nmod_wsgi.request_handler	\r\n''wsgi-script''\r\nwsgi.url_scheme	\r\n''https''\r\nPATH_TRANSLATED	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py/activitydb/checklist_update/400/''\r\nSERVER_PORT	\r\n''443''\r\nwsgi.multiprocess	\r\nTrue\r\nmod_wsgi.input_chunked	\r\n''0''\r\nSERVER_ADDR	\r\n''192.168.8.72''\r\nDOCUMENT_ROOT	\r\n''/var/www/tola-activity/htdocs''\r\nmod_wsgi.process_group	\r\n''tola-activity''\r\nSCRIPT_FILENAME	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py''\r\nCOSIGN_FACTOR	\r\n''ldap''\r\nSERVER_ADMIN	\r\n''root@localhost''\r\nwsgi.input	\r\n<mod_wsgi.Input object at 0xa43eeb10>\r\nREMOTE_USER	\r\n''esinn''\r\nHTTP_HOST	\r\n''tola-activity.mercycorps.org''\r\nwsgi.multithread	\r\nTrue\r\nHTTP_UPGRADE_INSECURE_REQUESTS	\r\n''1''\r\nREQUEST_URI	\r\n''/activitydb/checklist_update/400/''\r\nHTTP_ACCEPT	\r\n''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\r\nPERL5LIB	\r\n''/usr/share/awstats/lib:/usr/share/awstats/plugins''\r\nmod_wsgi.callable_object	\r\n''application''\r\nwsgi.version	\r\n(1, 0)\r\nGATEWAY_INTERFACE	\r\n''CGI/1.1''\r\nwsgi.run_once	\r\nFalse\r\nwsgi.errors	\r\n<mod_wsgi.Log object at 0xa2f9bd40>\r\nREMOTE_PORT	\r\n''58073''\r\nHTTP_ACCEPT_LANGUAGE	\r\n''en-US,en;q=0.8''\r\nmod_wsgi.version	\r\n(3, 4)\r\nmod_wsgi.application_group	\r\n''tola-activity.mercycorps.org|''\r\nmod_wsgi.script_reloading	\r\n''1''\r\nwsgi.file_wrapper	\r\n''''\r\nCSRF_COOKIE	\r\nu''6VmevB3CDYTVz3z3eFBLNm9vr8060E7q''\r\nHTTP_ACCEPT_ENCODING	\r\n''gzip, deflate, sdch''\r\nHTTP_COOKIE	\r\n''optimizelyEndUserId=oeu1426178086900r0.33647501352243125; __utma=185632118.107862919.1426178087.1426178087.1426287090.2; km_ai=uLTSOJN559s9yWX2ZAJnmUBswlU%3D; km_lv=x; optimizelySegments=%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D; optimizelyBuckets=%7B%222115560571%22%3A%222442901605%22%2C%222214141681%22%3A%222213931163%22%2C%222445310539%22%3A%222465270090%22%2C%222786931510%22%3A%222798370973%22%7D; _ga=GA1.2.107862919.1426178087; km_uq=; cosign-tola=z8HMcrGw9cpiJ9Jd-KWRrSVLaIbumHuCeH+kb-GA3NgImBimz-k4zq9obaXKQGULR7rmJdL2ao1hulLpOgNef7jHj6SJlOrBTJaRu70IVj97mHTBvmN3VsIhaPEe/1447883589; sessionid=xn66o5959n928gbu06awfm295ka1jmtv; csrftoken=6VmevB3CDYTVz3z3eFBLNm9vr8060E7q''\r\nSettings\r\nUsing settings module tola.settings.local\r\nSetting	Value\r\nSECURE_BROWSER_XSS_FILTER	\r\nFalse\r\nUSE_THOUSAND_SEPARATOR	\r\nFalse\r\nCSRF_COOKIE_SECURE	\r\nFalse\r\nLANGUAGE_CODE	\r\n''en-us''\r\nROOT_URLCONF	\r\n''tola.urls''\r\nMANAGERS	\r\n((''admin'', ''tola@tola.org''),)\r\nSILENCED_SYSTEM_CHECKS	\r\n[]\r\nDEFAULT_CHARSET	\r\n''utf-8''\r\nSESSION_SERIALIZER	\r\n''django.contrib.sessions.serializers.JSONSerializer''\r\nSTATIC_ROOT	\r\n''/var/www/tola-activity/htdocs/assets''\r\nLDAP_LOGIN	\r\n''uid=pluma,ou=People,dc=system,dc=mercycorps,dc=org''\r\nDJANGO_ROOT	\r\n''/var/www/tola-activity/htdocs/tola''\r\nALLOWED_HOSTS	\r\n[]\r\nEMAIL_HOST	\r\n''localhost''\r\nMESSAGE_STORAGE	\r\n''django.contrib.messages.storage.fallback.FallbackStorage''\r\nEMAIL_SUBJECT_PREFIX	\r\n''[Django] ''\r\nSERVER_EMAIL	\r\n''root@localhost''\r\nSECURE_HSTS_SECONDS	\r\n0\r\nSTATICFILES_FINDERS	\r\n(''django.contrib.staticfiles.finders.FileSystemFinder'',\r\n ''django.contrib.staticfiles.finders.AppDirectoriesFinder'')\r\nSESSION_CACHE_ALIAS	\r\n''default''\r\nSESSION_COOKIE_DOMAIN	\r\nNone\r\nSESSION_COOKIE_NAME	\r\n''sessionid''\r\nTIME_INPUT_FORMATS	\r\n(''%H:%M:%S'', ''%H:%M:%S.%f'', ''%H:%M'')\r\nSECURE_REDIRECT_EXEMPT	\r\n[]\r\nDATABASES	\r\n{''default'': {''ATOMIC_REQUESTS'': False,\r\n             ''AUTOCOMMIT'': True,\r\n             ''CONN_MAX_AGE'': 0,\r\n             ''ENGINE'': ''django.db.backends.mysql'',\r\n             ''HOST'': ''localhost'',\r\n             ''NAME'': ''tola_activity'',\r\n             ''OPTIONS'': {},\r\n             ''PASSWORD'': u''********************'',\r\n             ''PORT'': '''',\r\n             ''TEST'': {''CHARSET'': None,\r\n                      ''COLLATION'': None,\r\n                      ''MIRROR'': None,\r\n                      ''NAME'': None},\r\n             ''TIME_ZONE'': ''UTC'',\r\n             ''USER'': ''tolaactivity''}}\r\nEMAIL_SSL_KEYFILE	\r\nu''********************''\r\nFILE_UPLOAD_DIRECTORY_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_HANDLERS	\r\n(''django.core.files.uploadhandler.MemoryFileUploadHandler'',\r\n ''django.core.files.uploadhandler.TemporaryFileUploadHandler'')\r\nTEMPLATE_CONTEXT_PROCESSORS	\r\n(''django.contrib.auth.context_processors.auth'',\r\n ''django.core.context_processors.debug'',\r\n ''django.core.context_processors.i18n'',\r\n ''django.core.context_processors.media'',\r\n ''django.core.context_processors.static'',\r\n ''django.core.context_processors.tz'',\r\n ''django.contrib.messages.context_processors.messages'',\r\n ''django.core.context_processors.request'')\r\nDEFAULT_CONTENT_TYPE	\r\n''text/html''\r\nREPORT_BUILDER_INCLUDE	\r\n[]\r\nAPPEND_SLASH	\r\nTrue\r\nFIRST_DAY_OF_WEEK	\r\n0\r\nDATABASE_ROUTERS	\r\n[]\r\nDEFAULT_TABLESPACE	\r\n''''\r\nLOCAL_APPS	\r\n(''tola'', ''feed'', ''activitydb'', ''djangocosign'', ''indicators'')\r\nYEAR_MONTH_FORMAT	\r\n''F Y''\r\nSTATICFILES_STORAGE	\r\n''django.contrib.staticfiles.storage.StaticFilesStorage''\r\nCACHES	\r\n{''default'': {''BACKEND'': ''django.core.cache.backends.locmem.LocMemCache''}}\r\nSESSION_COOKIE_PATH	\r\n''/''\r\nSECURE_CONTENT_TYPE_NOSNIFF	\r\nFalse\r\nMIDDLEWARE_CLASSES	\r\n(''django.middleware.common.CommonMiddleware'',\r\n ''django.contrib.sessions.middleware.SessionMiddleware'',\r\n ''django.middleware.csrf.CsrfViewMiddleware'',\r\n ''django.contrib.auth.middleware.AuthenticationMiddleware'',\r\n ''django.contrib.auth.middleware.RemoteUserMiddleware'',\r\n ''django.contrib.messages.middleware.MessageMiddleware'',\r\n ''django.middleware.clickjacking.XFrameOptionsMiddleware'')\r\nUSE_I18N	\r\nTrue\r\nTHOUSAND_SEPARATOR	\r\n'',''\r\nSECRET_KEY	\r\nu''********************''\r\nLANGUAGE_COOKIE_NAME	\r\n''django_language''\r\nDEFAULT_INDEX_TABLESPACE	\r\n''''\r\nGOOGLE_STEP2_URI	\r\n''http://tola.mercycorps.org/gwelcome''\r\nLOGGING_CONFIG	\r\n''logging.config.dictConfig''\r\nTEMPLATE_LOADERS	\r\n(''django.template.loaders.filesystem.Loader'',\r\n ''django.template.loaders.app_directories.Loader'')\r\nWSGI_APPLICATION	\r\n''tola.wsgi.application''\r\nTEMPLATE_DEBUG	\r\nTrue\r\nX_FRAME_OPTIONS	\r\n''SAMEORIGIN''\r\nAUTHENTICATION_BACKENDS	\r\n(''djangocosign.cosign.CosignBackend'',\r\n ''django.contrib.auth.backends.ModelBackend'')\r\nFORCE_SCRIPT_NAME	\r\nNone\r\nUSE_X_FORWARDED_HOST	\r\nFalse\r\nEMAIL_TIMEOUT	\r\nNone\r\nSECURE_SSL_HOST	\r\nNone\r\nSIGNING_BACKEND	\r\n''django.core.signing.TimestampSigner''\r\nSESSION_COOKIE_SECURE	\r\nFalse\r\nCSRF_COOKIE_DOMAIN	\r\nNone\r\nFILE_CHARSET	\r\n''utf-8''\r\nDEBUG	\r\nTrue\r\nLANGUAGE_COOKIE_DOMAIN	\r\nNone\r\nDEFAULT_FILE_STORAGE	\r\n''django.core.files.storage.FileSystemStorage''\r\nINSTALLED_APPS	\r\n(''django.contrib.auth'',\r\n ''django.contrib.contenttypes'',\r\n ''django.contrib.sessions'',\r\n ''django.contrib.sites'',\r\n ''django.contrib.messages'',\r\n ''django.contrib.staticfiles'',\r\n ''django.contrib.admin'',\r\n ''django.contrib.admindocs'',\r\n ''rest_framework'',\r\n ''django_tables2'',\r\n ''crispy_forms'',\r\n ''floppyforms'',\r\n ''django_extensions'',\r\n ''report_builder'',\r\n ''mathfilters'',\r\n ''import_export'',\r\n ''tola'',\r\n ''feed'',\r\n ''activitydb'',\r\n ''djangocosign'',\r\n ''indicators'')\r\nLANGUAGES	\r\n((''af'', ''Afrikaans''),\r\n (''ar'', ''Arabic''),\r\n (''ast'', ''Asturian''),', 'This has been updated to allow editing of the item, not the list.', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(158, 'Change Community involvement to Stakeholder involvement on PC form', '2015-11-19 17:57:24.000000', '2015-12-10 02:15:30.000000', 'esinn@mercycorps.org', 4, 0, 'Change Community involvement to Stakeholder involvement on Project completion form, justification tab', 'Justification Tab removed TA-138', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(159, 'Add Quality Assurance check reports to default project checklist ', '2015-11-19 18:04:13.000000', '2015-12-09 03:16:19.000000', 'esinn@mercycorps.org', 1, 0, 'Add Quality Assurance check reports are submitted and attached to the default project checklist ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(160, 'Indicator Data Report does not filter indicator list by selected program', '2015-11-19 20:15:14.000000', '2015-11-19 20:15:35.000000', 'glind@mercycorps.org', 4, 0, 'We need the indicator data report to filter the select list of indicators down to indicators in the program that was selected.  This would connect the two filters a bit better and provide for finding or summing specific indicator reports by program a lot easier.', NULL, 2, NULL, NULL, 11, 1, '', '', '', 2, 1),
(161, 'adding disaggregated data in results and finding out that they are not saved when re-open', '2015-11-20 15:31:46.000000', '2015-11-20 15:31:46.000000', 'skouzi@lb.mercycorps.org', 1, 0, 'I added results of a program indicator as well as the actual numbers in the dis-aggregation fields, when I went into indicator data to attach evidence, it opened without all the dis-aggregated data I had entered.', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 1, 1),
(162, 'login error ', '2015-11-22 06:00:49.000000', '2015-12-09 03:10:25.000000', 'msadat@af.mercycorps.org', 4, 0, 'some of our colleagues that login in Tola today for the first time, while clicking in site profile the system is asking them for user and password (nomar@af.mercycorps.org ) and also (rmomani@jo.mercycorps.org from jordan) as i saw his post in slack.	 ', 'They don''t have editor access to add a new site profile, I believe Andrew fixed it already.', 2, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(163, 'PA linking error with the indicator ', '2015-11-23 04:09:38.000000', '2015-12-02 05:34:24.000000', 'msadat@af.mercycorps.org', 4, 0, 'while i am going to Project>M&E tab> to add quantitative out i cant link the PA with indicator. i have attached you the screen shoot of the issue. ', NULL, 2, NULL, NULL, 11, 1, '', '', '', 3, 1),
(164, 'Indicators Grid Print "Export All" doesn''t trigger any action', '2015-11-23 05:07:24.000000', '2016-01-08 23:53:57.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'When I click on the "Export All" button at the bottom of the Indicator Plan Grid Print nothing happens. No broken link pages is returned, but the Grid Print page seems to only refresh itself. No export/download is initiated. \r\n\r\n', '', 3, NULL, NULL, 26, 1, '', '', '', 1, 0),
(165, 'Admin levels 1 2 and 3 are not as provided to be added for Lebanon', '2015-11-24 14:34:22.000000', '2015-12-09 03:17:08.000000', 'skouzi@lb.mercycorps.org', 1, 0, 'The admin levels 1,2 and 3 are still not as per lists provided for Lebanon.  Please find link to list below.', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(166, 'results and disaggregations added when go back to edit data disaggregation data does not show', '2015-11-24 16:59:33.000000', '2015-11-24 16:59:33.000000', 'skouzi@lb.mercycorps.org', 1, 0, 'data entered under indicator results, specifically in the disaggregation field seem to disappear when go back to edit data or add evidence.  The disaggregation cells previously filled are blank.', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 1, 1),
(167, 'Delete date created on indicator planning ', '2015-11-24 18:57:18.000000', '2015-11-24 18:57:18.000000', 'esinn@mercycorps.org', 1, 0, 'Delete date created column on indicator planning page https://tola-activity.mercycorps.org/indicators/home/0/ \r\nand add objectives column ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(168, 'Tola Tables footer needs to be updated', '2015-11-24 22:57:33.000000', '2016-01-15 18:51:37.000000', 'atpham@mercycorps.org', 4, 0, 'ASAP.', '', 3, NULL, NULL, NULL, 2, '', '', '', 2, 0),
(169, 'Disconnect between contact info entered', '2015-11-25 09:08:59.000000', '2015-11-25 09:08:59.000000', 'jcarlson@lb.mercycorps.org', 1, 0, 'We have a few questions around the entry of contact info. For example, in the Site Profile it would be good to be able to enter both a name and a designation/ title in a separate field, just as you do when you enter contact info for a stakeholder. Also, Oftentimes, the contact for a Site is also a stakeholder, and it would therefore be good to be able to choose from that same list that''s available under the stakeholder form. Lastly, that list of Contacts should show both name and designation, as people in this part of the world often has same or similar names. ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(170, 'SH Form - contact list', '2015-11-25 09:12:56.000000', '2016-01-12 00:02:38.000000', 'jcarlson@lb.mercycorps.org', 4, 0, 'The contact list under the SH form still holds random names (and referring to my previous ticket, doesn''t list the title), which makes it very difficult to choose the right one. ', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(171, 'erroe when adding results ', '2015-11-25 09:20:35.000000', '2015-12-08 20:19:19.000000', 'skouzi@lb.mercycorps.org', 1, 0, 'When adding data/results to indicators, I am getting an error screen.  Please find attached. It says ''indicator instance with collected data 173L does not exist.''', NULL, 3, NULL, NULL, NULL, 3, '', '', '', 3, 0),
(172, 'Several copies created of SH and Sites', '2015-11-25 09:29:48.000000', '2016-01-14 14:18:26.000000', 'jcarlson@lb.mercycorps.org', 4, 0, 'It seems every time you click ''Save'' in either SH or Site Forms, a duplicate is created and you end up with a long list of the same SH or Site but with different edits. ', '', 4, NULL, NULL, 11, 1, '', '', '', 1, 0),
(173, 'Move LIN code in PA', '2015-11-25 09:33:08.000000', '2015-11-25 09:33:08.000000', 'jcarlson@lb.mercycorps.org', 1, 0, 'As all our Project/ Activity codes relate to LIN codes, would it be possible to shift the LIN code to the first page, under the Activity code, on the PAF?', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 2),
(174, 'Larger text box for ''Other budget contribution''', '2015-11-25 09:36:10.000000', '2015-11-25 09:36:10.000000', 'jcarlson@lb.mercycorps.org', 1, 0, 'It would be helpful to have a larger text box rather than just a single line, for the ''Other contributions'', as this requires narrative description which can sometimes be lengthy. ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 1),
(175, 'Project files uploading', '2015-11-25 09:39:40.000000', '2015-12-03 18:40:26.000000', 'jcarlson@lb.mercycorps.org', 1, 0, 'At the bottom of the PAF there is the option to upload documentation/ project files. It would be helpful if one could also choose from documentation that has already been uploaded, so there''s not a duplication of documents in Tola Workflow. ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 6),
(176, 'the objectives for Lebanon programs are not showing', '2015-11-25 11:02:18.000000', '2016-01-08 18:27:14.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'The objectives entered for the different programs are not showing up in the objectives box and what has been previously linked has disappeared.', '', 2, NULL, NULL, NULL, 1, '', '', '', 1, 3),
(177, 'Developing a naming convention for the linked evidence', '2015-11-25 11:03:48.000000', '2015-11-25 11:03:48.000000', 'skouzi@lb.mercycorps.org', 1, 0, 'Develop a standard naming convention for the evidence that is linked to indicators.', NULL, 3, NULL, NULL, NULL, 2, '', '', '', 2, 0),
(178, 'Error when deleting a value for a wrong result', '2015-11-25 13:28:13.000000', '2015-12-10 00:00:45.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'When going to indicator data and deleting a wrong added field, I get the below attached error page.', '', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(179, 'Indicator Planning', '2015-11-25 19:53:59.000000', '2016-01-08 20:21:21.000000', 'esalazar@et.mercycorps.org', 3, 0, '1) Please see attached screenshot when trying to search for indicator.\r\n2) When trying to enter indicators for the same program, every time you try to enter a new indicator, you''re brought back, you have to search for the program again.  Is it possible to go back to the same program, instead of going all the way back to the page where you have to choose your program again?\r\n3) The indicators should always be in order: 1) Impact 2) Outcome 3) output and not in chronological order of when they were entered.  it is confusing the latter way- can this be addressed?\r\n4) How do you suggest we deal with entering targets for projects for which we aren''t priming, i.e., if Mercy Corps targets = 51% of the total target?  I guess we would enter our MC target but enter the total target somewhere?  Or enter total target but note that MC targets = 51% total target?', '#1 Search is fixed. Assuming you were having the same issue as all of us were\r\n#2 I created a new ticket just for this enhancement request: http://tola.work/helpdesk/tickets/218/\r\n#4 We will look into this', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(180, 'Exchange GAIT codes for FC to identify and track programs', '2015-11-27 08:03:12.000000', '2016-01-14 19:48:47.000000', 'jcarlson@lb.mercycorps.org', 3, 0, 'I am assuming we use the GAIT 4 digit code to enable linking to GAIT, but it would be more useful to use FC as this is how the majority of people keep track of a grant, including program, finance and Ops. The GAIT code is never actually used outside GAIT. ', '', 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(181, 'adding to TA-163 ', '2015-11-29 06:03:54.000000', '2015-12-10 00:35:14.000000', 'msadat@af.mercycorps.org', 4, 0, 'edit and delete button is not working to Add Quantitative Outputs the page is remaining block and the table is not working  ', 'This was resolved with TA-163', 2, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(182, 'How to attache MOU on the stakeholders form ', '2015-11-30 12:16:34.000000', '2015-11-30 14:07:35.000000', 'kwakwaya@et.mercycorps.org', 1, 0, 'i have tried to attached MOU to the stakeholders form. may you explain how to upload /attache the documents.\r\n\r\nComment From Greg:\r\nYou can attach MOU''s in documents section and they will show up in the Formal written description drop down as well as the Vetting Due Diligence. We need to add some clear advice in the form on how to do this and provide a link to make it easier, something similar to the Documents pop-up in the Agreement form.  ', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(183, 'Tola Activity- General + Indicators', '2015-11-30 13:28:24.000000', '2016-01-08 17:41:26.000000', 'esalazar@et.mercycorps.org', 4, 0, '1) Cannot log out of Tola - usually if I have to log out I just switch browsers\r\n2) Stakeholders- when I add stakeholders, they appear more than once, but when i try to delete one, I end up deleting all of them.\r\n3) Stakeholders form- how to attach/upload supporting documents?\r\n', '', 3, NULL, NULL, 8, 1, '', '', '', 1, 0),
(184, 'How to add programs to Training?', '2015-11-30 13:33:54.000000', '2015-12-09 23:32:26.000000', 'esalazar@et.mercycorps.org', 4, 0, 'On the training form, I would like to add Programs, but cannot do this on the Admin site.  How can i do this?', '', 2, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(185, 'Add risks and assumptions to Project agreement form', '2015-11-30 21:15:47.000000', '2016-01-15 19:49:10.000000', 'esinn@mercycorps.org', 2, 0, 'Request from NBO and Brandy:\r\nAdd risks and assumptions field to the justifications tab on the PA form ', '', 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(186, 'Form Guidance - Indicator Planning', '2015-11-30 22:16:06.000000', '2015-12-04 00:34:10.000000', 'atpham@mercycorps.org', 1, 0, 'Add specific guidance around the approved by field. I.e. how this is the "owner" of the indicator and is responsible for updating the indicator plan fields as well as ALL collected indicator data associated with the indicator.', NULL, 3, NULL, NULL, 6, 3, '', '', '', 2, 1),
(187, 'Re-order project level checklist ', '2015-11-30 23:44:30.000000', '2015-11-30 23:44:30.000000', 'esinn@mercycorps.org', 1, 0, 'Re-order the project checklist so it''s a logical order from initiation to completion of a project:\r\n1. Review site profile \r\n2. Review stakeholder profile \r\n3. Review indicator plan and add indicators \r\n4. Identify monitoring forms and add\r\n5. Indicators TvA at project level linked to evidence and reviewed for accuracy, matches with actuals reported in the evidence file\r\n6. Ensure lessons learned are documented with appropriate stakeholders giving input and disseminated\r\n7. Budget v Actuals, verify variances with finance\r\n8. All related documents are updated to completion date.', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(188, 'Tracking results and evidence for a program that has one GAIT number but three cost centers', '2015-12-01 10:22:37.000000', '2016-01-15 20:00:18.000000', 'skouzi@lb.mercycorps.org', 3, 0, 'Program ''Emergency WASH, CP and Winterization for Syrian Refugees and Host Populations in Lebanon'' with GAITID 5755 is actually three different programs (WASH, Winterization and Child Protection) with three different PMs and cost centers.  The donor is UNICEF and the cost centers are 32563, 32635, 32636.  How do you suggest we enter it into Tola Data and track it?  I have entered the indicators under one GAIT number 5755.', '', 3, NULL, NULL, 6, 3, '', '', '', 2, 0),
(189, 'Sites- Map- cannot locate Korahe, Ethiopia and reverts to Kabul', '2015-12-01 18:40:17.000000', '2016-01-14 19:46:02.000000', 'esalazar@et.mercycorps.org', 4, 0, 'I have located Korahe, Ethiopia on the Sites form, but when I save it, the map automatically goes back to Kabul and does not allow me to save the Korahe location.', '', 3, NULL, NULL, 8, 1, '', '', '', 2, 0),
(190, ' "New Indicator" button errors on the Indicator Library page', '2015-12-01 22:40:52.000000', '2015-12-09 23:31:39.000000', 'ksandstrom@mercycorps.org', 4, 0, 'Error when clicking the "New Indicator" button on the Indicator Planning page.\r\nPage: https://tola-activity.mercycorps.org/indicators/report/0/\r\n\r\nError: \r\nKeyError at /indicators/indicator_add/0/\r\n''pk''\r\nRequest Method:	GET\r\nRequest URL:	https://tola-activity.mercycorps.org/indicators/indicator_add/0/\r\nDjango Version:	1.8.2\r\nException Type:	KeyError\r\nException Value:	\r\n''pk''\r\nException Location:	/var/www/tola-activity/htdocs/indicators/views.py in get_form_kwargs, line 200\r\nPython Executable:	/usr/bin/python\r\nPython Version:	2.7.6\r\nPython Path:	\r\n[''/usr/local/lib/python27.zip'',\r\n ''/usr/local/lib/python2.7'',\r\n ''/usr/local/lib/python2.7/plat-linux2'',\r\n ''/usr/local/lib/python2.7/lib-tk'',\r\n ''/usr/local/lib/python2.7/lib-old'',\r\n ''/usr/local/lib/python2.7/lib-dynload'',\r\n ''/usr/local/lib/python2.7/site-packages'',\r\n ''/var/www/tola-activity/htdocs'',\r\n ''/var/www/tola-activity/htdocs/tola'',\r\n ''/var/www/tola-activity/htdocs'']\r\nServer time:	Tue, 1 Dec 2015 14:13:11 -0800\r\nTraceback Switch to copy-and-paste view\r\n\r\n/usr/local/lib/python2.7/site-packages/django/core/handlers/base.py in get_response\r\n                                response = wrapped_callback(request, *callback_args, **callback_kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in view\r\n                        return self.dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/indicators/views.py in dispatch\r\n                    return super(IndicatorCreate, self).dispatch(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/base.py in dispatch\r\n                    return handler(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    return super(BaseCreateView, self).get(request, *args, **kwargs) ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get\r\n                    form = self.get_form() ...\r\n? Local vars\r\n/usr/local/lib/python2.7/site-packages/django/views/generic/edit.py in get_form\r\n                    return form_class(**self.get_form_kwargs()) ...\r\n? Local vars\r\n/var/www/tola-activity/htdocs/indicators/views.py in get_form_kwargs\r\n                    program = Indicator.objects.all().filter(id=self.kwargs[''pk'']).values("program__id") ...\r\n? Local vars\r\nRequest information\r\n\r\nGET\r\nNo GET data\r\nPOST\r\nNo POST data\r\nFILES\r\nNo FILES data\r\nCOOKIES\r\nVariable	Value\r\nkm_lv	\r\n''x''\r\noptimizelyEndUserId	\r\n''oeu1424803601267r0.7453566913027316''\r\nkm_ai	\r\n''jJRcYSoOEZ%2FqN8CBpMykPPeqOwY%3D''\r\n_ga	\r\n''GA1.2.786396913.1424803602''\r\nkvcd	\r\n''1448394200057''\r\noptimizelySegments	\r\n''%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D''\r\nkm_uq	\r\n''''\r\nsessionid	\r\n''f7ov78tftt6qxhly267noj494gxfoamv''\r\ncsrftoken	\r\n''QCFOwpgLqnzHqVP7NEQxfKnRaXyJYWpX''\r\n__utma	\r\n''185632118.786396913.1424803602.1424803602.1424803602.1''\r\noptimizelyBuckets	\r\n''%7B%222214141681%22%3A%222231820528%22%2C%222445310539%22%3A%222465270090%22%7D''\r\ncosign-tola	\r\n''TzCGAHzfbr3QPurRTWH7abbTrgLrMN1hXAbeL5kj2W6BkPNrFxpQg5NUQxZH0uhOs7WQjz-8XxFiBGuEbPqsO8z1ypHZ82tF6LAeS-cKK5iFbypFbBh5FaVvGJQj/1449007973''\r\nMETA\r\nVariable	Value\r\nAUTH_TYPE	\r\n''Cosign''\r\nmod_wsgi.listener_port	\r\n''443''\r\nHTTP_REFERER	\r\n''https://tola-activity.mercycorps.org/indicators/report/98/''\r\nmod_wsgi.listener_host	\r\n''''\r\nSERVER_SOFTWARE	\r\n''Apache''\r\nSCRIPT_NAME	\r\nu''''\r\nmod_wsgi.enable_sendfile	\r\n''0''\r\nmod_wsgi.handler_script	\r\n''''\r\nSERVER_SIGNATURE	\r\n''<address>Apache Server at tola-activity.mercycorps.org Port 443</address>\\n''\r\nREQUEST_METHOD	\r\n''GET''\r\nPATH_INFO	\r\nu''/indicators/indicator_add/0/''\r\nSERVER_PROTOCOL	\r\n''HTTP/1.1''\r\nQUERY_STRING	\r\n''''\r\nSSL_TLS_SNI	\r\n''tola-activity.mercycorps.org''\r\nCOSIGN_SERVICE	\r\n''cosign-tola''\r\nHTTP_USER_AGENT	\r\n''Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36''\r\nHTTP_CONNECTION	\r\n''keep-alive''\r\nREMOTE_REALM	\r\n''ldap''\r\nSERVER_NAME	\r\n''tola-activity.mercycorps.org''\r\nREMOTE_ADDR	\r\n''10.10.40.244''\r\nmod_wsgi.queue_start	\r\n''1449007990613172''\r\nmod_wsgi.request_handler	\r\n''wsgi-script''\r\nwsgi.url_scheme	\r\n''https''\r\nPATH_TRANSLATED	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py/indicators/indicator_add/0/''\r\nSERVER_PORT	\r\n''443''\r\nwsgi.multiprocess	\r\nTrue\r\nmod_wsgi.input_chunked	\r\n''0''\r\nSERVER_ADDR	\r\n''192.168.8.72''\r\nDOCUMENT_ROOT	\r\n''/var/www/tola-activity/htdocs''\r\nmod_wsgi.process_group	\r\n''tola-activity''\r\nSCRIPT_FILENAME	\r\n''/var/www/tola-activity/htdocs/tola/wsgi.py''\r\nCOSIGN_FACTOR	\r\n''ldap''\r\nSERVER_ADMIN	\r\n''root@localhost''\r\nwsgi.input	\r\n<mod_wsgi.Input object at 0xa3736f70>\r\nREMOTE_USER	\r\n''ksandstrom''\r\nHTTP_HOST	\r\n''tola-activity.mercycorps.org''\r\nwsgi.multithread	\r\nTrue\r\nHTTP_UPGRADE_INSECURE_REQUESTS	\r\n''1''\r\nREQUEST_URI	\r\n''/indicators/indicator_add/0/''\r\nHTTP_ACCEPT	\r\n''text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8''\r\nPERL5LIB	\r\n''/usr/share/awstats/lib:/usr/share/awstats/plugins''\r\nmod_wsgi.callable_object	\r\n''application''\r\nwsgi.version	\r\n(1, 0)\r\nGATEWAY_INTERFACE	\r\n''CGI/1.1''\r\nwsgi.run_once	\r\nFalse\r\nwsgi.errors	\r\n<mod_wsgi.Log object at 0xa3a3c3b8>\r\nREMOTE_PORT	\r\n''52178''\r\nHTTP_ACCEPT_LANGUAGE	\r\n''en-US,en;q=0.8''\r\nmod_wsgi.version	\r\n(3, 4)\r\nmod_wsgi.application_group	\r\n''tola-activity.mercycorps.org|''\r\nmod_wsgi.script_reloading	\r\n''1''\r\nwsgi.file_wrapper	\r\n''''\r\nCSRF_COOKIE	\r\nu''QCFOwpgLqnzHqVP7NEQxfKnRaXyJYWpX''\r\nHTTP_ACCEPT_ENCODING	\r\n''gzip, deflate, sdch''\r\nHTTP_COOKIE	\r\n''optimizelyEndUserId=oeu1424803601267r0.7453566913027316; __utma=185632118.786396913.1424803602.1424803602.1424803602.1; km_ai=jJRcYSoOEZ%2FqN8CBpMykPPeqOwY%3D; km_lv=x; optimizelySegments=%7B%221854021394%22%3A%22none%22%2C%221857680709%22%3A%22search%22%2C%221870300565%22%3A%22gc%22%2C%221871260543%22%3A%22false%22%2C%222095296721%22%3A%22true%22%2C%222098971189%22%3A%22true%22%2C%222296311553%22%3A%22true%22%2C%222324580126%22%3A%22true%22%7D; optimizelyBuckets=%7B%222214141681%22%3A%222231820528%22%2C%222445310539%22%3A%222465270090%22%7D; _ga=GA1.2.786396913.1424803602; kvcd=1448394200057; km_uq=; sessionid=f7ov78tftt6qxhly267noj494gxfoamv; csrftoken=QCFOwpgLqnzHqVP7NEQxfKnRaXyJYWpX; cosign-tola=TzCGAHzfbr3QPurRTWH7abbTrgLrMN1hXAbeL5kj2W6BkPNrFxpQg5NUQxZH0uhOs7WQjz-8XxFiBGuEbPqsO8z1ypHZ82tF6LAeS-cKK5iFbypFbBh5FaVvGJQj/1449007973''\r\nSettings\r\nUsing settings module tola.settings.local\r\nSetting	Value\r\nSECURE_BROWSER_XSS_FILTER	\r\nFalse\r\nUSE_THOUSAND_SEPARATOR	\r\nFalse\r\nCSRF_COOKIE_SECURE	\r\nFalse\r\nLANGUAGE_CODE	\r\n''en-us''\r\nROOT_URLCONF	\r\n''tola.urls''\r\nMANAGERS	\r\n((''admin'', ''tola@tola.org''),)\r\nSILENCED_SYSTEM_CHECKS	\r\n[]\r\nDEFAULT_CHARSET	\r\n''utf-8''\r\nSESSION_SERIALIZER	\r\n''django.contrib.sessions.serializers.JSONSerializer''\r\nSTATIC_ROOT	\r\n''/var/www/tola-activity/htdocs/assets''\r\nLDAP_LOGIN	\r\n''uid=pluma,ou=People,dc=system,dc=mercycorps,dc=org''\r\nDJANGO_ROOT	\r\n''/var/www/tola-activity/htdocs/tola''\r\nALLOWED_HOSTS	\r\n[]\r\nEMAIL_HOST	\r\n''localhost''\r\nMESSAGE_STORAGE	\r\n''django.contrib.messages.storage.fallback.FallbackStorage''\r\nEMAIL_SUBJECT_PREFIX	\r\n''[Django] ''\r\nSERVER_EMAIL	\r\n''root@localhost''\r\nSECURE_HSTS_SECONDS	\r\n0\r\nSTATICFILES_FINDERS	\r\n(''django.contrib.staticfiles.finders.FileSystemFinder'',\r\n ''django.contrib.staticfiles.finders.AppDirectoriesFinder'')\r\nSESSION_CACHE_ALIAS	\r\n''default''\r\nSESSION_COOKIE_DOMAIN	\r\nNone\r\nSESSION_COOKIE_NAME	\r\n''sessionid''\r\nTIME_INPUT_FORMATS	\r\n(''%H:%M:%S'', ''%H:%M:%S.%f'', ''%H:%M'')\r\nSECURE_REDIRECT_EXEMPT	\r\n[]\r\nDATABASES	\r\n{''default'': {''ATOMIC_REQUESTS'': False,\r\n             ''AUTOCOMMIT'': True,\r\n             ''CONN_MAX_AGE'': 0,\r\n             ''ENGINE'': ''django.db.backends.mysql'',\r\n             ''HOST'': ''localhost'',\r\n             ''NAME'': ''tola_activity'',\r\n             ''OPTIONS'': {},\r\n             ''PASSWORD'': u''********************'',\r\n             ''PORT'': '''',\r\n             ''TEST'': {''CHARSET'': None,\r\n                      ''COLLATION'': None,\r\n                      ''MIRROR'': None,\r\n                      ''NAME'': None},\r\n             ''TIME_ZONE'': ''UTC'',\r\n             ''USER'': ''tolaactivity''}}\r\nEMAIL_SSL_KEYFILE	\r\nu''********************''\r\nFILE_UPLOAD_DIRECTORY_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_PERMISSIONS	\r\nNone\r\nFILE_UPLOAD_HANDLERS	\r\n(''django.core.files.uploadhandler.MemoryFileUploadHandler'',\r\n ''django.core.files.uploadhandler.TemporaryFileUploadHandler'')\r\nTEMPLATE_CONTEXT_PROCESSORS	\r\n(''django.contrib.auth.context_processors.auth'',\r\n ''django.core.context_processors.debug'',\r\n ''django.core.context_processors.i18n'',\r\n ''django.core.context_processors.media'',\r\n ''django.core.context_processors.static'',\r\n ''django.core.context_processors.tz'',\r\n ''django.contrib.messages.context_processors.messages'',\r\n ''django.core.context_processors.request'')\r\nDEFAULT_CONTENT_TYPE	\r\n''text/html''\r\nREPORT_BUILDER_INCLUDE	\r\n[]\r\nAPPEND_SLASH	\r\nTrue\r\nFIRST_DAY_OF_WEEK	\r\n0\r\nDATABASE_ROUTERS	\r\n[]\r\nDEFAULT_TABLESPACE	\r\n''''\r\nLOCAL_APPS	\r\n(''tola'', ''feed'', ''activitydb'', ''djangocosign'', ''indicators'', ''customdashboard'')\r\nYEAR_MONTH_FORMAT	\r\n''F Y''\r\nSTATICFILES_STORAGE	\r\n''django.contrib.staticfiles.storage.StaticFilesStorage''\r\nCACHES	\r\n{''default'': {''BACKEND'': ''django.core.cache.backends.locmem.LocMemCache''}}\r\nSESSION_COOKIE_PATH	\r\n''/''\r\nSECURE_CONTENT_TYPE_NOSNIFF	\r\nFalse\r\nMIDDLEWARE_CLASSES	\r\n(''django.middleware.common.CommonMiddleware'',\r\n ''django.contrib.sessions.middleware.SessionMiddleware'',\r\n ''django.middleware.csrf.CsrfViewMiddleware'',\r\n ''django.contrib.auth.middleware.AuthenticationMiddleware'',\r\n ''django.contrib.auth.middleware.RemoteUserMiddleware'',\r\n ''django.contrib.messages.middleware.MessageMiddleware'',\r\n ''django.middleware.clickjacking.XFrameOptionsMiddleware'')\r\nUSE_I18N	\r\nTrue\r\nTHOUSAND_SEPARATOR	\r\n'',''\r\nSECRET_KEY	\r\nu''********************''\r\nLANGUAGE_COOKIE_NAME	\r\n''django_language''\r\nDEFAULT_INDEX_TABLESPACE	\r\n''''\r\nGOOGLE_STEP2_URI	\r\n''http://tola.mercycorps.org/gwelcome''\r\nLOGGING_CONFIG	\r\n''logging.config.dictConfig''\r\nTEMPLATE_LOADERS	\r\n(''django.template.loaders.filesystem.Loader'',\r\n ''django.template.loaders.app_directories.Loader'')\r\nWSGI_APPLICATION	\r\n''tola.wsgi.application''\r\nTEMPLATE_DEBUG	\r\nTrue\r\nX_FRAME_OPTIONS	\r\n''SAMEORIGIN''\r\nAUTHENTICATION_BACKENDS	\r\n(''djangocosign.cosign.CosignBackend'',\r\n ''django.contrib.auth.backends.ModelBackend'')\r\nFORCE_SCRIPT_NAME	\r\nNone\r\nUSE_X_FORWARDED_HOST	\r\nFalse\r\nEMAIL_TIMEOUT	\r\nNone\r\nSECURE_SSL_HOST	\r\nNone\r\nSIGNING_BACKEND	\r\n''django.core.signing.TimestampSigner''\r\nSESSION_COOKIE_SECURE	\r\nFalse\r\nCSRF_COOKIE_DOMAIN	\r\nNone\r\nFILE_CHARSET	\r\n''utf-8''\r\nDEBUG	\r\nTrue\r\nLANGUAGE_COOKIE_DOMAIN	\r\nNone\r\nDEFAULT_FILE_STORAGE	\r\n''django.core.files.storage.FileSystemStorage''\r\nINSTALLED_APPS	\r\n(''django.contrib.auth'',\r\n ''django.contrib.contenttypes'',\r\n ''django.contrib.sessions'',\r\n ''django.contrib.sites'',\r\n ''django.contrib.messages'',\r\n ''django.contrib.staticfiles'',\r\n ''django.contrib.admin'',\r\n ''django.contrib.admindocs'',\r\n ''rest_framework'',\r\n ''django_tables2'',\r\n ''crispy_forms'',\r\n ''floppyforms'',\r\n ''django_extensions'',\r\n ''report_builder'',\r\n ''mathfilters'',\r\n ''import_export'',\r\n ''tola'',\r\n ''feed'',\r\n ''activitydb'',\r\n ''djangocosign'',\r\n ''indicators'',\r\n ''customdashboard'')\r\nLANGUAGES	\r\n((''af'', ''Afrikaans''),\r\n (''ar'', ''Arabic''),\r\n (''ast'', ''Asturian''),\r\n (''az'', ''Azerbaijani''),\r\n (''bg'', ''Bulgarian''),\r\n (''be'', ''Belarusian''),\r\n (''bn'', ''Bengali''),\r\n (''br'', ''Breton''),\r\n (''bs'', ''Bosnian''),\r\n (''ca'', ''Catalan''),\r\n (''cs'', ''Czech''),\r\n (''cy'', ''Welsh''),\r\n (''da'', ''Danish''),\r\n (''de'', ''German''),\r\n (''el'', ''Greek''),\r\n (''en'', ''English''),\r\n (''en-au'', ''Australian English''),\r\n (''en-gb'', ''British English''),\r\n (''eo'', ''Esperanto''),\r\n (''es'', ''Spanish''),\r\n (''es-ar'', ''Argentinian Spanish''),\r\n (''es-mx'', ''Mexican Spanish''),\r\n (''es-ni'', ''Nicaraguan Spanish''),\r\n (''es-ve'', ''Venezuelan Spanish''),\r\n (''et'', ''Estonian''),\r\n (''eu'', ''Basque''),\r\n (''fa'', ''Persian''),\r\n (''fi'', ''Finnish''),\r\n (''fr'', ''French''),\r\n (''fy'', ''Frisian''),\r\n (''ga'', ''Irish''),\r\n (''gl'', ''Galician''),\r\n (''he'', ''Hebrew''),\r\n (''hi'', ''Hindi''),\r\n (''hr'', ''Croatian''),\r\n (''hu'', ''Hungarian''),\r\n (''ia'', ''Interlingua''),\r\n (''id'', ''Indonesian''),\r\n (''io'', ''Ido''),\r\n (''is'', ''Icelandic''),\r\n (''it'', ''Italian''),\r\n (''ja'', ''Japanese''),\r\n (''ka'', ''Georgian''),\r\n (''kk'', ''Kazakh''),\r\n (''km'', ''Khmer''),\r\n (''kn'', ''Kannada''),\r\n (''ko'', ''Korean''),\r\n (''lb'', ''Luxembourgish''),\r\n (''lt'', ''Lithuanian''),\r\n (''lv'', ''Latvian''),\r\n (''mk'', ''Macedonian''),\r\n (''ml'', ''Malayalam''),\r\n (''mn'', ''Mongolian''),\r\n (''mr'', ''Marathi''),\r\n (''my'', ''Burmese''),\r\n (''nb'', ''Norwegian Bokmal''),\r\n (''ne'', ''Nepali''),\r\n (''nl'', ''Dutch''),\r\n (''nn'', ''Norwegian Nynorsk''),\r\n (''os'', ''Ossetic''),\r\n (''pa'', ''Punjabi''),\r\n (''pl'', ''Polish''),\r\n (''pt'', ''Portuguese''),\r\n (''pt-br'', ''Brazilian Portuguese''),\r\n (''ro'', ''Romanian''),\r\n (''ru'', ''Russian''),\r\n (''sk'', ''Slovak''),\r\n (''sl'', ''Slovenian''),\r\n (''sq'', ''Albanian''),\r\n (''sr'', ''Serbian''),\r\n (''sr-latn'', ''Serbian Latin''),\r\n (''sv'', ''Swedish''),\r\n (''sw'', ''Swahili''),\r\n (''ta'', ''Tamil''),\r\n (''te'', ''Telugu''),\r\n (''th'', ''Thai''),\r\n (''tr'', ''Turkish''),\r\n (''tt'', ''Tatar''),\r\n (''udm'', ''Udmurt''),\r\n (''uk'', ''Ukrainian''),\r\n (''ur'', ''Urdu''),\r\n (''vi'', ''Vietnamese''),\r\n (''zh-cn'', ''Simplified Chinese''),\r\n (''zh-hans'', ''Simplified Chinese''),\r\n (''zh-hant'', ''Traditional Chinese''),\r\n (''zh-tw'', ''Traditional Chinese''))\r\nUSE_L10N	\r\nFalse\r\nREPORT_BUILDER_EXCLUDE	\r\n[''user'', ''groups'', ''read'', ''template'', ''silo'', ''readtoken'']\r\nREPORT_BUILDER_ASYNC_REPORT	\r\nFalse\r\nLDAP_PASSWORD	\r\nu''********************''\r\nSECURE_HSTS_INCLUDE_SUBDOMAINS	\r\nFalse\r\nSTATICFILES_DIRS	\r\n(''/var/www/tola-activity/htdocs/static'',)\r\nPREPEND_WWW	\r\nFalse\r\nSECURE_PROXY_SSL_HEADER	\r\nNone\r\nLANGUAGE_COOKIE_AGE	\r\nNone\r\nSESSION_COOKIE_HTTPONLY	\r\nTrue\r\nDEBUG_PROPAGATE_EXCEPTIONS	\r\nFalse\r\nCSRF_COOKIE_AGE	\r\n31449600\r\nMONTH_DAY_FORMAT	\r\n''F j''\r\nLOGIN_URL	\r\n''/accounts/login/''\r\nSESSION_EXPIRE_AT_BROWSER_CLOSE	\r\nFalse\r\nLDAP_SERVER	\r\n''ldaps://demeter.mercycorps.org''\r\nTIME_FORMAT	\r\n''P''\r\nAUTH_USER_MODEL	\r\n''auth.User''\r\nDATE_INPUT_FORMATS	\r\n(''%Y-%m-%d'',\r\n ''%m/%d/%Y'',\r\n ''%m/%d/%y'',\r\n ''%b %d %Y'',\r\n ''%b %d, %Y'',\r\n ''%d %b %Y'',\r\n ''%d %b, %Y'',\r\n ''%B %d %Y'',\r\n ''%B %d, %Y'',\r\n ''%d %B %Y'',\r\n ''%d %B, %Y'')\r\nCSRF_COOKIE_NAME	\r\n''csrftoken''\r\nEMAIL_HOST_PASSWORD	\r\nu''********************''\r\nPASSWORD_RESET_TIMEOUT_DAYS	\r\nu''********************''\r\nSESSION_FILE_PATH	\r\nNone\r\nCACHE_MIDDLEWARE_ALIAS	\r\n''default''\r\nSESSION_SAVE_EVERY_REQUEST	\r\nFalse\r\nNUMBER_GROUPING	\r\n0\r\nSESSION_ENGINE	\r\n''django.contrib.sessions.backends.db''\r\nCSRF_FAILURE_VIEW	\r\n''django.views.csrf.csrf_failure''\r\nCSRF_COOKIE_PATH	\r\n''/''\r\nLOGIN_REDIRECT_URL	\r\n''/accounts/profile/''\r\nDECIMAL_SEPARATOR	\r\n''.''\r\nIGNORABLE_404_URLS	\r\n()\r\nLOCALE_PATHS	\r\n()\r\nTEMPLATE_STRING_IF_INVALID	\r\n''''\r\nLOGOUT_URL	\r\n''/accounts/logout/''\r\nEMAIL_USE_TLS	\r\nFalse\r\nFIXTURE_DIRS	\r\n(''/var/www/tola-activity/htdocs/fixtures'',)\r\nGOOGLE_CLIENT_ID	\r\n''617113120802.apps.googleusercontent.com''\r\nDATE_FORMAT	\r\n''Y-n-d''\r\nLDAP_USER_GROUP	\r\n''ertb''\r\nMEDIA_ROOT	\r\n''/var/www/tola-activity/htdocs/media''\r\nLANGUAGE_COOKIE_PATH	\r\n''/''\r\nLDAP_ADMIN_GROUP	\r\n''ertb-admin''\r\nDEFAULT_EXCEPTION_REPORTER_FILTER	\r\n''django.views.debug.SafeExceptionReporterFilter''\r\nADMINS	\r\n((''admin'', ''tola@tola.org''),)\r\nFORMAT_MODULE_PATH	\r\nNone\r\nDEFAULT_FROM_EMAIL	\r\n''webmaster@localhost''\r\nREST_FRAMEWORK	\r\n{''DEFAULT_FILTER_BACKENDS'': (''rest_framework.filters.DjangoFilterBackend'',),\r\n ''PAGINATE_BY'': 10}\r\nMEDIA_URL	\r\n''/media/''\r\nDATETIME_FORMAT	\r\n''N j, Y, P''\r\nTEMPLATE_DIRS	\r\n(''/var/www/tola-activity/htdocs/templates'',)\r\nSITE_ID	\r\n1\r\nDISALLOWED_USER_AGENTS	\r\n()\r\nALLOWED_INCLUDE_ROOTS	\r\n()\r\nGOOGLE_CLIENT_SECRET	\r\nu''********************''\r\nLOGGING	\r\n{''disable_existing_loggers'': False,\r\n ''formatters'': {''simple'': {''format'': ''%(levelname)s %(message)s''},\r\n                ''verbose'': {''datefmt'': ''%Y-%d-%b %H:%M:%S'',\r\n                            ''format'': ''[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s''}},\r\n ''handlers'': {''console'': {''class'': ''logging.StreamHandler'',\r\n                          ''formatter'': ''simple'',\r\n                          ''level'': ''DEBUG''},\r\n              ''file'': {''class'': ''logging.FileHandler'',\r\n                       ''filename'': ''/var/www/tola-activity/htdocs/error.log'',\r\n                       ''formatter'': ''verbose'',\r\n                       ''level'': ''WARNING''}},\r\n ''loggers'': {''django'': {''handlers'': [''file''],\r\n                        ''level'': ''DEBUG'',\r\n                        ''propagate'': True},\r\n             ''epro'': {''handlers'': [''file''],\r\n                      ''level'': ''WARNING'',\r\n                      ''propagate'': True}},\r\n ''version'': 1}\r\nSHORT_DATE_FORMAT	\r\n''m/d/Y''\r\nTEMPLATES	\r\n[]\r\nTEST_RUNNER	\r\n''django.test.runner.DiscoverRunner''\r\nCACHE_MIDDLEWARE_KEY_PREFIX	\r\nu''********************''\r\nSECURE_SSL_REDIRECT	\r\nFalse\r\nTIME_ZONE	\r\n''America/Los_Angeles''\r\nFILE_UPLOAD_MAX_MEMORY_SIZE	\r\n2621440\r\nEMAIL_BACKEND	\r\n''django.core.mail.backends.console.EmailBackend''\r\nEMAIL_USE_SSL	\r\nFalse\r\nCRISPY_TEMPLATE_PACK	\r\n''bootstrap3''\r\nMIGRATION_MODULES	\r\n{}\r\nSITE_NAME	\r\n''tola''\r\nSESSION_COOKIE_AGE	\r\n1209600\r\nSETTINGS_MODULE	\r\n''tola.settings.local''\r\nPROJECT_PATH	\r\n''/var/www/tola-activity/htdocs''\r\nUSE_ETAGS	\r\nFalse\r\nSITE_ROOT	\r\n''/var/www/tola-activity/htdocs''\r\nLANGUAGES_BIDI	\r\n(''he'', ''ar'', ''fa'', ''ur'')\r\nFILE_UPLOAD_TEMP_DIR	\r\nNone\r\nINTERNAL_IPS	\r\n()\r\nSTATIC_URL	\r\n''/static/''\r\nEMAIL_PORT	\r\n25\r\nUSE_TZ	\r\nTrue\r\nSHORT_DATETIME_FORMAT	\r\n''m/d/Y P''\r\nTEST_NON_SERIALIZED_APPS	\r\n[]\r\nPASSWORD_HASHERS	\r\nu''********************''\r\nTHIRD_PARTY_APPS	\r\n(''rest_framework'',\r\n ''django_tables2'',\r\n ''crispy_forms'',\r\n ''floppyforms'',\r\n ''django_extensions'',\r\n ''report_builder'',\r\n ''mathfilters'',\r\n ''import_export'')\r\nABSOLUTE_URL_OVERRIDES	\r\n{}\r\nDJANGO_APPS	\r\n(''django.contrib.auth'',\r\n ''django.contrib.contenttypes'',\r\n ''django.contrib.sessions'',\r\n ''django.contrib.sites'',\r\n ''django.contrib.messages'',\r\n ''django.contrib.staticfiles'',\r\n ''django.contrib.admin'',\r\n ''django.contrib.admindocs'')\r\nCACHE_MIDDLEWARE_SECONDS	\r\n600\r\nEMAIL_SSL_CERTFILE	\r\nNone\r\nCSRF_COOKIE_HTTPONLY	\r\nFalse\r\nDATETIME_INPUT_FORMATS	\r\n(''%Y-%m-%d %H:%M:%S'',\r\n ''%Y-%m-%d %H:%M:%S.%f'',\r\n ''%Y-%m-%d %H:%M'',\r\n ''%Y-%m-%d'',\r\n ''%m/%d/%Y %H:%M:%S'',\r\n ''%m/%d/%Y %H:%M:%S.%f'',\r\n ''%m/%d/%Y %H:%M'',\r\n ''%m/%d/%Y'',\r\n ''%m/%d/%y %H:%M:%S'',\r\n ''%m/%d/%y %H:%M:%S.%f'',\r\n ''%m/%d/%y %H:%M'',\r\n ''%m/%d/%y'')\r\nEMAIL_HOST_USER	\r\n''''\r\nYou''re seeing this error because you have DEBUG = True in your Django settings file. Change that to False, and Django will display a standard page generated by the handler for this status code.\r\n', 'That button should not be there anymore.  Indicators can only be added from the program they are being associated with.', 4, NULL, NULL, NULL, 1, '', '', '', 3, 0);
INSERT INTO `helpdesk_ticket` (`id`, `title`, `created`, `modified`, `submitter_email`, `status`, `on_hold`, `description`, `resolution`, `priority`, `due_date`, `last_escalation`, `assigned_to_id`, `queue_id`, `github_issue_id`, `github_issue_number`, `github_issue_url`, `type`, `votes`) VALUES
(191, 'Import Beneficiary', '2015-12-03 10:48:40.000000', '2015-12-15 17:00:33.000000', 'nbuzdar@pk.mercycorps.org', 1, 1, 'Hi, Is there any way, If we can import beneficiary list rather adding beneficiaries individually. I clicked on the Import beneficiary, but the window just got blurred. Its not working\r\n', NULL, 3, NULL, NULL, 8, 1, '', '', '', 2, 0),
(192, 'Global search in the header to help users find specific projects, programs or Indicators', '2015-12-06 18:59:55.000000', '2015-12-06 19:00:07.000000', 'glind@mercycorps.org', 1, 0, 'It''s difficult to find a project or program from the home page on.  We need a quick search tool in the header that will allow users to find a project quickly by name, activity code, fund code etc.  \r\n\r\nThis should be clearly documented what fields it searches and where those results will take you.  Auto complete would help as well.\r\nThe search bar should show up when the user icon is clicked when the user is logged in along with the links to the user profile.  \r\n\r\nSearch should allow for now program name, gaitid, project name, activity id, indicator name and indicator number.  It should show those results via autocomplete and a pop-over/shadowbox window.  When a result is clicked on it should take you either to the Project Dashboard, Program Dashboard or Indicator Plan.\r\n\r\nResults should be broken down by Dashboard in the results page as well.  ', NULL, 2, NULL, NULL, 11, 1, '', '', '', 2, 0),
(194, 'Link an Activity Site to a collected data record for an Indicator', '2015-12-07 18:17:41.000000', '2015-12-07 18:23:15.000000', 'glind@mercycorps.org', 1, 0, 'We may need to link sites to indicators in some way.  The most granular level to do that at would be via the collected data field.  This would be a drop down of all user accessbile country sites and allow for more then one site per indicator as well as more then one for a collected data set.  \r\n\r\n', NULL, 3, NULL, NULL, 11, 1, '', '', '', 2, 2),
(195, 'Add land classification to Site Profile demographics tab', '2015-12-07 18:25:50.000000', '2015-12-08 04:33:21.000000', 'glind@mercycorps.org', 4, 0, 'We need to classify land types for each site.  It looks like the best place to add this would be the demographics tab with a field called Land Classification.  Values would be Rural, Urban, Peri-Urban and other?  My guess is we make this a managed field in the admin but universal so everyone uses the same classifications.', 'Added a land classifier ''Land Type'' to site profile and admin.', 2, NULL, NULL, NULL, 1, '', '', '', 2, 2),
(196, 'Delete Checklist redirects to community_map.html', '2015-12-09 02:59:58.000000', '2015-12-14 23:24:35.000000', 'ksandstrom@mercycorps.org', 4, 0, 'Delete Checklist Errors  redirects to:\r\n\r\ncommunity_map.html\r\nWhoops!\r\n\r\n', '', 3, NULL, NULL, NULL, 1, '', '', '', 3, 2),
(197, 'Completion form Error ', '2015-12-09 05:54:04.000000', '2015-12-16 21:59:49.000000', 'msadat@af.mercycorps.org', 4, 0, 'in completion form under impact while i click in add quantitative outputs in the table i only can see the indicators belong to INVEST program even while i am changing the program name.', 'The program name is provided for reference and not intended to change the indicators available.  In a complete from the program for the project can not be changed or the indicators.  We intend to hide the program in the form at some point.', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(198, 'Broken Breadcrumb', '2015-12-09 16:10:54.000000', '2015-12-31 02:00:41.000000', 'ksandstrom@mercycorps.org', 4, 0, 'Breadcrumb link back to "Project Dashboard" broken when navigating from Project Dashboard > Project Planning "Benchmark and Monitoring Data List" > Project Dashboard', '', 5, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(199, 'Order drop-down list of "Programs" and "Sites" in PA Form', '2015-12-09 16:17:10.000000', '2015-12-09 16:17:10.000000', 'ksandstrom@mercycorps.org', 1, 0, 'The drop-down list for "Programs" and "Sites" in the PA form "Executive Summary" should be alphanumeric. ', NULL, 4, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(200, 'Order drop-down list of "Programs" and "Projects" in Documentation Form', '2015-12-09 16:37:01.000000', '2016-01-04 16:57:27.000000', 'ksandstrom@mercycorps.org', 4, 0, 'The drop-down list of "Programs" and "Projects" in Documentation Form should be alphanumeric.', '', 5, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(201, 'Multiple copies of documentation saved.', '2015-12-09 16:47:40.000000', '2016-01-12 00:36:17.000000', 'ksandstrom@mercycorps.org', 4, 0, 'If a user enters a document under "Add Documentation" and clicks "Save" multiple times, the document is saved each time as a separate document.  \r\n', '', 5, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(202, 'Project completion form is broken and showing up as ''invalid form''', '2015-12-13 10:28:54.000000', '2015-12-14 09:28:28.000000', 'nadhikari@af.mercycorps.org', 4, 0, 'https://tola-activity.mercycorps.org/activitydb/projectcomplete_add/389/\r\n\r\nUnable to fill the Project completion form. After saving the first page, the form is showing up as ''Invalid form''', 'That''s actually telling you the form you submitted was invalid because the budget and actual fields were required.  However since we didn''t provide those fields for you to enter in values we will let that slide... this time.  Should be fixed now.', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(203, 'error when adding a new indicator', '2015-12-14 14:54:43.000000', '2015-12-16 19:57:01.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'I was on the ''GAITID: 5717 - Psychosocial Support and Safe Access to Education for Youth'' adding indicators and I clicked on save on the first page which requests to identify whether the indicator is a DIG indicator.  An error page then appears, attached below.', 'We have a temporary fix in place now for this until the DIG server can be reached again.', 2, NULL, NULL, 11, 1, '', '', '', 3, 0),
(204, 'There should be option for adding (attaching) documents in Completion form the same like PA', '2015-12-15 04:06:42.000000', '2015-12-15 04:06:42.000000', 'msadat@af.mercycorps.org', 1, 0, 'There should be option for adding documents in Completion form. there are some documents which need to be attach with CF like Handover latter, before and after photo...etc.', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 2, 3),
(205, 'Add new approver level', '2015-12-15 19:00:29.000000', '2016-01-15 19:25:32.000000', 'esalazar@et.mercycorps.org', 4, 0, 'Hi, we need to add an approver level of $15,000.  Can I do this, or do I need to ask if you can do this?\r\n\r\nThanks\r\nEsther', '', 3, NULL, NULL, 8, 1, '', '', '', 2, 0),
(206, 'Project dashboard is broken for some of the PAs', '2015-12-16 04:51:21.000000', '2016-01-15 19:24:34.000000', 'msadat@af.mercycorps.org', 4, 0, 'cant create completion form, system does not allowed us to go to the project dashboard because of the attached error. \r\n\r\nthis issue shows for some of the PAs not all', '', 2, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(207, 'Selecting verification/approval should be limited to the individual signed on? ', '2015-12-16 04:54:47.000000', '2016-01-07 18:43:19.000000', 'clivingstone@cn.mercycorps.org', 1, 0, 'Does anyone else find it strange that you can select people other than yourself for approvals? I think that on the approvals page the only name you should be able to select is your own...at the moment you can select anyone that has logged into the system as the person verifying. ', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 1, 1),
(208, 'Display name of the table on the "View Table Data" page', '2015-12-16 06:16:18.000000', '2016-01-20 19:19:23.000000', 'clivingstone@cn.mercycorps.org', 3, 0, 'I''ve been getting confused when I have multiple tables open at the same time which one I''m looking at as I click between. Can you add a name title for each table on the "View Table Data" page? ', NULL, 3, NULL, NULL, NULL, 2, '127763055', '19', 'https://github.com/toladata/TolaTables/issues/19', 2, 4),
(209, 'Print stakeholder contacts button', '2015-12-16 06:19:54.000000', '2015-12-16 06:19:54.000000', 'clivingstone@cn.mercycorps.org', 1, 0, 'I don''t see a place where I can get back to the contact information I''ve entered under stakeholders profiles. Can we add a button so I can get a printable table (like the indicators/PMP grid print) of all my stakeholders contact info? \r\n\r\n', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 2, 3),
(210, 'Afghanistan country programs are not being filtered out of Timor''s Program Dashboard page', '2015-12-16 07:46:04.000000', '2015-12-28 17:14:27.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'There are many non-Timor-Leste programs in our Program Dashboard and Indicator Planning pages. Can you please help to filter them out? ', '', 2, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(211, 'Page Not Found each time you save Indicator Data', '2015-12-16 13:17:28.000000', '2015-12-28 20:59:24.000000', 'clivingstone@cn.mercycorps.org', 4, 0, 'Each time we try to save an Indicator Data we get Page Not Found returned. Data is saved successfully, so no trouble there... ', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(212, 'erroe on admin page when adding a name under approval authority', '2015-12-17 14:11:52.000000', '2016-01-07 18:40:32.000000', 'skouzi@lb.mercycorps.org', 4, 0, 'When providing approval authority for a person at MC Lebanon under the approval authority ''add'' button, I got an error page.  I had entered the name of that person and clicked on save and the below attached error page appeared.', '', 3, NULL, NULL, NULL, 1, '', '', '', 1, 0),
(213, 'Error message:  unable to open project dashboard ', '2015-12-21 09:30:26.000000', '2015-12-29 19:27:43.000000', 'msadat@af.mercycorps.org', 4, 0, 'Error for PA with activity code 32550A044, 32550A046 and 32550A048 ', NULL, 2, NULL, NULL, 11, 1, '', '', '', 3, 2),
(214, 'Completion form-Impact Tab', '2015-12-29 05:19:41.000000', '2016-01-05 13:28:20.000000', 'msadat@af.mercycorps.org', 1, 0, 'the completion form should take automatically the Indicator from the PA ( should be link with those indicator which we already linked the PA with that indicator). ', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 2, 0),
(215, 'PA M&E tab: Save Benchmark browser issues', '2015-12-30 01:02:25.000000', '2016-01-07 18:48:33.000000', 'ksandstrom@mercycorps.org', 4, 0, 'When you save a benchmark a new plain page loads with the benchmark data and the options to Save changes or Close. \r\n\r\nIn Firefox if you choose "Save Changes", nothing happens and you have to use the back button to get back to the PA. If you choose "Close," you are redirected back to the PA "Executive Summary" and an additional pop up pops up asking the user to "Confirm" to resend the information. \r\n\r\nIn Chrome if you choose "Save Changes" or "Close" nothing happens. The user has to use the back button to get back to the PA.\r\n\r\nThe benchmark is saved in both browsers', NULL, 2, NULL, NULL, 11, 1, '', '', '', 3, 0),
(216, '"Add a Disaggregation" loads Indicator Summary page, not form', '2015-12-31 00:43:33.000000', '2016-01-05 15:31:55.000000', 'ksandstrom@mercycorps.org', 4, 0, 'Unable to add disaggregation to an indicator. Clicking "Add Disaggregation" loads the Indicator summary page, not the disaggregation form', '', 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(217, '"View Only" User Permissions set in Admin are not being applied', '2015-12-31 01:07:12.000000', '2016-01-14 18:36:01.000000', 'ksandstrom@mercycorps.org', 1, 0, 'Users with "View Only" permissions have access to most of Tola-Activity, Add, Change, Delete. \r\n\r\nSee current access available to "View Only" permissions:  https://docs.google.com/spreadsheets/d/1s_0keYwnEmlHH-ORh4IgmQrpis5OBaxFvbiTzREw9Dw/edit?usp=sharing\r\n\r\n', NULL, 3, NULL, NULL, NULL, 1, '', '', '', 3, 0),
(218, 'Entering Indicators reload Program Dashboard instead of current program', '2016-01-05 23:51:54.000000', '2016-01-15 19:16:22.000000', 'esalazar@et.mercycorps.org', 1, 0, 'When trying to enter indicators for the same program, every time you try to enter a new indicator, you''re brought back, you have to search for the program again. Is it possible to go back to the same program, instead of going all the way back to the page where you have to choose your program again?', NULL, 4, NULL, NULL, NULL, 1, '', '', '', 2, 5),
(219, 'Link to "Contact List" page is hidden from user', '2016-01-06 17:57:09.000000', '2016-01-08 20:29:11.000000', 'ksandstrom@mercycorps.org', 1, 0, 'The "Contact List" page is only accessible from the breadcrumb navigation on the "Contact Form" page. Users can only find the "Contact List" link after clicking "Add New Contact" under Stakeholders page. There should be a more intuitive way to access it. \r\n\r\nContact list page: https://tola-activity.mercycorps.org/activitydb/contact_list/0/', NULL, 3, NULL, NULL, 2, 1, '', '', '', 1, 2),
(221, 'approved by should take the user name automatically ', '2016-01-10 11:22:54.000000', '2016-01-19 17:26:55.000000', 'msadat@af.mercycorps.org', 1, 0, 'in approval tab it should take the user name in the (approved by) section automatically, so the approval group also wont be able to change that or select any name from drop in down list. ', NULL, 2, NULL, NULL, NULL, 1, '', '', '', 2, 1),
(222, 'Indicator data update causes error, if Program is in two countries', '2016-01-11 19:08:57.000000', '2016-01-11 19:09:32.000000', 'ksandstrom@mercycorps.org', 4, 0, 'Example Progam: 5717 Psychosocial Support and Safe Access to Education for Youth - \r\nCountries: Jordan and Lebanon (though according to GAIT this should only be in Jordan)\r\nIf user''s Profile is Jordan they will get an error (Exception Value: invalid literal for int() with base 10: '''') trying to save/update indicator data on the shared program. Example: \r\nhttps://tola-activity-demo.mercycorps.org/indicators/collecteddata_update/1552/\r\n\r\nIf user''s Profile is Lebanon, it does not error. \r\n\r\nIf user''s Profile is Lebanon and Jordan saving indicator data also fails\r\nException Value: invalid literal for int() with base 10: ''''', NULL, 3, NULL, NULL, 11, 1, '', '', '', 3, 0),
(223, 'Form Help/Guide on Create Indicator page links to PA Form Guide', '2016-01-11 19:53:42.000000', '2016-01-12 00:40:30.000000', 'ksandstrom@mercycorps.org', 4, 0, 'There is a link to "Form Help/Guidance" on the "Create Indicator" page example: https://tola-activity.mercycorps.org/indicators/indicator_create/142/ \r\n\r\nwhich links to the PA form guide: \r\nhttps://docs.google.com/document/d/1xsHzOQ6CuWc9kNDEOHOQzYx8oZjW0zcn0DWe8Uw7ldk/\r\n\r\nThe link should either be removed or link to the Indicator Form Guide or to a new Form Guide: \r\nhttps://docs.google.com/document/d/18QN7U6-b3AXmjL9fcHfFaxo1yisxuvpefGmsJTslJY4/\r\n\r\n\r\n\r\n\r\n', '', 3, NULL, NULL, 9, 1, '', '', '', 3, 0),
(224, 'SH form, written description and due diligence not filtered by country', '2016-01-12 14:52:19.000000', '2016-01-15 00:39:28.000000', 'ksandstrom@mercycorps.org', 3, 0, 'The "Formal Written Description of Relationship" and "Vetting/ due diligence statement" drop down selections, in the Stakeholder form, are not being filtered by country. \r\n', NULL, 5, NULL, NULL, 11, 1, '126781829', '64', 'https://github.com/toladata/TolaActivity/issues/64', 3, 0),
(225, 'Other data source JSON error', '2016-01-14 11:43:33.000000', '2016-01-15 20:09:17.000000', 'amachalani@lb.mercycorps.org', 1, 0, 'Was trying to link tola tables onto my kobo , with the following JSON file : https://kc.humanitarianresponse.info/as3ad/forms/baseline_ind_v2/api\r\n\r\nwhich was made public to avoid any kind of authorization errors.\r\nAnd then after filling and pressing on submit , tola table prompts me to login on another page , tried using both my MC account , as well as my Kobo account , but none the less received the same error :\r\nValueError at /json\r\n\r\nThis was tried with both AutoPull on and off.\r\n\r\nKindly check attached.', NULL, 3, NULL, NULL, NULL, 2, NULL, NULL, NULL, 3, 3),
(226, 'Update links to Site Profile and Agreement Forms.', '2016-01-14 21:56:51.000000', '2016-01-15 20:10:55.000000', 'ksandstrom@mercycorps.org', 4, 0, 'We copied the Site and PA form to the @mc domain account. They used to belong to the AFG domain/account.\r\n\r\nPlease update the two links in TA \r\n\r\nWORKFLOW FORM 01 Site Profile Form Guide v.1\r\nnew form link: \r\nhttps://drive.google.com/open?id=18nGr_uk1VSzitwjkstxvjGWxtINzlITUgBGFP_s-b9o\r\n\r\nWORKFLOW FORM 03 Agreement Form Guide v.1\r\nnew form link: \r\nhttps://drive.google.com/open?id=111BzD3uHlJpaj4MSk7l8XApvrpu69QgimWPnfXbBUT4', '', 5, NULL, NULL, 11, 1, '126757640', '63', 'https://github.com/toladata/TolaActivity/issues/63', 3, 0),
(227, 'Auto-pull feature, for ONA data, creates duplicate records every time the cron job runs', '2016-01-15 18:57:36.000000', '2016-01-20 19:04:36.000000', 'ksandstrom@mercycorps.org', 4, 0, 'Auto-pull feature, for ONA data, creates duplicate records every time the cron job runs since it pulls the same data everytime.', '', 3, NULL, NULL, 3, 2, NULL, NULL, NULL, 3, 0),
(228, 'Restrict changes to approved forms', '2016-01-18 07:36:05.000000', '2016-01-18 07:36:06.000000', 'msadat@af.mercycorps.org', 1, 0, 'currently changes can be made to all the forms (site profile, PAs etc.) even after approval. \r\nThere should not be any option to update approved forms. Forms should be pdf-ed/locked.\r\nBecause currently we are facing problem.( the field staff create completion form for approved PA, and the went back to the PA and edited that. now the dashboard shows PA open but while we click on PA it shows approved in the form ', NULL, 2, NULL, NULL, NULL, 3, NULL, NULL, NULL, 1, 0),
(229, 'Add ability to associate a Site to an indicator result', '2016-01-19 11:47:41.000000', '2016-01-19 15:00:02.000000', 'atpham@mercycorps.org', 5, 0, 'Currently the site profile is the only place where we are collecting x/y coordinates and admin boundaries and it is use as part of the Workflow. As we look to expand tola''s use of mapping, it would be good to begin associating these sites to every instance of indicator results. However, most indicator results may not go all the way to x/y coordinates but more at an admin boundary like district or province.\r\n\r\n', NULL, 3, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, -1),
(230, 'Site Profile: revise demographic information tab ', '2016-01-19 12:07:35.000000', '2016-01-19 12:07:36.000000', 'atpham@mercycorps.org', 1, 0, 'The demographic information tab needs to be more dynamic and flexible to country needs. Realizing that the Site Profile is the key form for all geographical information and expanding the use of other external contextual information, the demographic tab is becoming more important. For example, we won''t be able to hard code fields on specific SADD disaggregation since these tend to change as they are about to and vary across different organizations. I suggest for us to allow country admins to customize the demographic types they would like to add such as population, land, literacy, etc and then add the same disaggregation feature used in indicator collected data. The front end could resemble that of the "indicator evidence" portion under Workflow where we list the various TvAs and which indicator it is reporting against.', NULL, 3, NULL, NULL, 9, 3, NULL, NULL, NULL, 2, 0),
(231, 'error when I click on enter new data', '2016-01-19 15:31:05.000000', '2016-01-19 17:26:12.000000', 'skouzi@lb.mercycorps.org', 1, 0, 'Under INTAJ program in Lebanon and when I attempted to enter results under one of INTAJ indicators.  I got an error page, the one that says you are lost and shows directions to different cities.  I am attaching what I clicked on below.', NULL, 3, NULL, NULL, 8, 1, NULL, NULL, NULL, 3, 0),
(232, 'Form Guides links on Demo site need to be different from Production site links', '2016-01-19 18:32:54.000000', '2016-01-19 18:32:54.000000', 'ksandstrom@mercycorps.org', 1, 0, 'The form guide links on the Demo need to be different links than Production links. This will help us manage form changes according to our agreed upon change request doc. \r\nhttps://drive.google.com/open?id=1iKus-jD_9bNLqu76QGJ-Iky2kJJBpiYJLUD7UuZST9Q\r\n\r\nNew URLs for Demo Guides: \r\nhttps://drive.google.com/drive/folders/0B7AuTjJ-qmYHeExBOWxSNU5LSmM\r\n\r\n', NULL, 3, NULL, NULL, NULL, 1, NULL, NULL, NULL, 2, 0),
(233, 'Demo site: Delete table button is not working', '2016-01-20 03:09:42.000000', '2016-01-20 22:33:03.000000', 'ksandstrom@mercycorps.org', 4, 0, 'When I click on the delete table button (under my "Your Tables" link) , nothing happens, but I can enter the delete silo url directly in my browser to delete the table example url: \r\nhttps://tola-tables-demo.mercycorps.org/silo_delete/30\r\n\r\n', '', 3, NULL, NULL, NULL, 2, '127740550', '17', 'https://github.com/toladata/TolaTables/issues/17', 3, 0),
(234, 'Changing column name (multiple times) causes error', '2016-01-20 18:17:31.000000', '2016-01-20 22:12:25.000000', 'ksandstrom@mercycorps.org', 1, 0, 'If a user edits a column name, saves it and then edits it again and clicks saves, there is an error if the page or table is not reloaded first. \r\n\r\n\r\nRequest Method:	POST\r\nRequest URL:	https://tola-tables-demo.mercycorps.org/edit_columns/4/\r\nDjango Version:	1.8.2\r\nException Type:	WriteError\r\nException Value:	\r\nAn empty update path is not valid.\r\nException Location:	/usr/local/lib/python2.7/site-packages/pymongo/helpers.py in _check_write_command_response, line 261', NULL, 3, NULL, NULL, 3, 2, '127753031', '18', 'https://github.com/toladata/TolaTables/issues/18', 3, 0),
(235, 'Merged Tables Titles: fix typo or allow users to name.', '2016-01-20 19:29:02.000000', '2016-01-20 22:39:01.000000', 'ksandstrom@mercycorps.org', 4, 0, 'Merging tables creates a table with a typo in the title: "mergeing of # and #" \r\n\r\nThe typo should be fixed or the users should be given the ability to name the merged table, before it is created.', '', 3, NULL, NULL, 3, 2, '127765290', '20', 'https://github.com/toladata/TolaTables/issues/20', 3, 0),
(236, 'Store merge field mapping and be able to reuse it.', '2016-01-20 19:46:49.000000', '2016-01-20 19:47:00.000000', 'mkhan@mercycorps.org', 1, 0, 'When a user maps fields for "table 1" and "table 2" in the merge process, the system should store the mapping and then be able to reuse it when a user tries to update data in the merged table.', NULL, 2, NULL, NULL, 3, 2, '127768445', '21', 'https://github.com/toladata/TolaTables/issues/21', 2, 0),
(237, '"Get External Data" page loads on save', '2016-01-20 22:57:18.000000', '2016-01-20 23:53:08.000000', 'ksandstrom@mercycorps.org', 4, 0, 'If you view the "Data Source" PAGE for a TT that *already has a current CSV file* attached to it and click SAVE the  "Get External Data ...or Create New Table" page loads, instead of the "Your Data Tables" \r\n', 'This is a feature not a bug, but the "feature" could use some work. It should be clearer to the user that you can (simply) create another table with the same (CSV) data source. ', 3, NULL, NULL, 3, 2, '127804540', '23', 'https://github.com/toladata/TolaTables/issues/23', 3, 0),
(238, 'Revise field "hints" on Justification and Description tab in a PA', '2016-01-21 04:20:16.000000', '2016-01-21 04:20:16.000000', 'clivingstone@cn.mercycorps.org', 1, 0, 'Currently the wording of the hint on the Justification and Description tab do not provide clear guidance as they still reference Afghanistan terms. \r\n\r\nI suggest several edits: \r\n1. To maintain a strict, clear distinction between "project" and "activity" as they live within the Tola system, I suggest changing "Description of project activities" to "Description of Project" \r\n\r\n2. Delete the "Description of Project" hint as it is still Afg specific. Replace with something broader. I suggest, "Briefly describe the day to day work you plan to complete in order to accomplish this project activity. Include rationale for budget, scope, timeframe as well as those MC staff and stakeholders that will be necessary to seeing this project is effectively implemented. Site any documentation/monitoring efforts that you''ll need to do before completion." \r\n\r\n3. Add to the hint under "Effect or Impact" to say "Please do not include outputs and keep less than 120 words. Describe the logic that will link this project/activity to the proposed desired outcome/goal. Note any assumptions that are critical in this logic chain." ', NULL, 3, NULL, NULL, 12, 1, NULL, NULL, NULL, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ticketcc`
--

CREATE TABLE IF NOT EXISTS `helpdesk_ticketcc` (
  `id` int(11) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `can_view` tinyint(1) NOT NULL,
  `can_update` tinyint(1) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `helpdesk_ticketcc`
--

INSERT INTO `helpdesk_ticketcc` (`id`, `email`, `can_view`, `can_update`, `ticket_id`, `user_id`) VALUES
(1, NULL, 1, 1, 14, 2),
(2, NULL, 1, 1, 4, 2),
(3, NULL, 1, 1, 8, 2),
(4, NULL, 1, 1, 10, 2),
(5, NULL, 1, 1, 36, 11),
(6, NULL, 1, 1, 6, 11),
(7, NULL, 1, 1, 8, 11),
(8, NULL, 1, 1, 31, 11),
(9, NULL, 1, 1, 29, 11),
(10, NULL, 1, 1, 13, 11),
(11, NULL, 1, 1, 10, 11),
(12, NULL, 1, 1, 42, 11),
(13, NULL, 1, 1, 41, 11),
(14, NULL, 1, 1, 43, 11),
(15, NULL, 1, 1, 44, 11),
(16, NULL, 1, 1, 40, 11),
(17, NULL, 1, 1, 47, 11),
(18, NULL, 1, 1, 3, 11),
(19, NULL, 1, 1, 5, 11),
(20, NULL, 1, 1, 74, 11),
(21, NULL, 1, 1, 62, 11),
(22, NULL, 1, 1, 48, 12),
(23, NULL, 1, 1, 86, 11),
(24, NULL, 1, 1, 85, 11),
(25, NULL, 1, 1, 84, 11),
(27, NULL, 1, 1, 66, 2),
(28, NULL, 1, 1, 75, 2),
(29, NULL, 1, 1, 93, 11),
(30, NULL, 1, 1, 83, 11),
(31, NULL, 1, 1, 82, 11),
(32, NULL, 1, 1, 56, 5),
(34, NULL, 1, 1, 105, 11),
(35, NULL, 1, 1, 104, 11),
(36, NULL, 1, 1, 103, 11),
(37, NULL, 1, 1, 102, 11),
(38, NULL, 1, 1, 101, 11),
(39, NULL, 1, 1, 100, 11),
(40, NULL, 1, 1, 99, 11),
(41, NULL, 1, 1, 101, 2),
(42, NULL, 1, 1, 98, 11),
(43, NULL, 1, 1, 95, 11),
(44, NULL, 1, 1, 94, 11),
(45, NULL, 1, 1, 80, 11),
(46, NULL, 1, 1, 79, 11),
(47, NULL, 1, 1, 70, 11),
(48, NULL, 1, 1, 69, 11),
(49, NULL, 1, 1, 78, 11),
(50, NULL, 1, 1, 59, 11),
(51, NULL, 1, 1, 57, 11),
(52, NULL, 1, 1, 32, 11),
(53, NULL, 1, 1, 109, 11),
(54, NULL, 1, 1, 108, 11),
(55, NULL, 1, 1, 113, 21),
(56, NULL, 1, 1, 112, 11),
(57, NULL, 1, 1, 113, 11),
(58, NULL, 1, 1, 115, 11),
(59, NULL, 1, 1, 126, 11),
(60, NULL, 1, 1, 127, 11),
(61, NULL, 1, 1, 128, 11),
(63, NULL, 1, 1, 2, 8),
(64, NULL, 1, 1, 5, 8),
(65, NULL, 1, 1, 47, 8),
(66, NULL, 1, 1, 68, 8),
(67, NULL, 1, 1, 80, 8),
(68, NULL, 1, 1, 98, 8),
(69, NULL, 1, 1, 99, 8),
(70, NULL, 1, 1, 111, 8),
(71, NULL, 1, 1, 116, 8),
(72, NULL, 1, 1, 50, 8),
(73, NULL, 1, 1, 52, 8),
(74, NULL, 1, 1, 53, 8),
(75, NULL, 1, 1, 104, 8),
(76, NULL, 1, 1, 103, 8),
(77, NULL, 1, 1, 144, 8),
(78, NULL, 1, 1, 125, 11),
(79, NULL, 1, 1, 124, 11),
(80, NULL, 1, 1, 152, 15),
(81, NULL, 1, 1, 106, 11),
(82, NULL, 1, 1, 178, 11),
(83, NULL, 1, 1, 181, 11),
(84, NULL, 1, 1, 163, 11),
(85, NULL, 1, 1, 184, 11),
(86, NULL, 1, 1, 183, 11),
(87, NULL, 1, 1, 182, 11),
(88, NULL, 1, 1, 144, 11),
(89, NULL, 1, 1, 143, 9),
(90, '', 1, 1, 186, 6),
(91, NULL, 1, 1, 111, 11),
(92, NULL, 1, 1, 147, 11),
(93, NULL, 1, 1, 156, 11),
(94, NULL, 1, 1, 162, 11),
(95, NULL, 1, 1, 157, 11),
(96, NULL, 1, 1, 190, 11),
(97, NULL, 1, 1, 189, 11),
(98, NULL, 1, 1, 191, 11),
(99, NULL, 1, 1, 188, 11),
(100, NULL, 1, 1, 180, 11),
(101, NULL, 1, 1, 176, 11),
(102, NULL, 1, 1, 195, 21),
(103, NULL, 1, 1, 162, 8),
(104, NULL, 1, 1, 127, 8),
(105, NULL, 1, 1, 135, 8),
(106, NULL, 1, 1, 138, 8),
(107, NULL, 1, 1, 184, 8),
(108, NULL, 1, 1, 178, 8),
(109, NULL, 1, 1, 139, 8),
(110, NULL, 1, 1, 140, 8),
(111, NULL, 1, 1, 181, 8),
(112, NULL, 1, 1, 158, 8),
(113, NULL, 1, 1, 196, 7),
(114, NULL, 1, 1, 196, 11),
(115, NULL, 1, 1, 197, 11),
(116, NULL, 1, 1, 202, 11),
(117, NULL, 1, 1, 152, 11),
(118, NULL, 1, 1, 150, 11),
(119, NULL, 1, 1, 203, 11),
(120, NULL, 1, 1, 150, 8),
(121, NULL, 1, 1, 203, 8),
(122, NULL, 1, 1, 146, 11),
(123, NULL, 1, 1, 210, 8),
(124, NULL, 1, 1, 145, 11),
(125, NULL, 1, 1, 197, 8),
(126, NULL, 1, 1, 183, 8),
(127, NULL, 1, 1, 104, 3),
(128, NULL, 1, 1, 212, 11),
(129, NULL, 1, 1, 210, 11),
(130, NULL, 1, 1, 206, 11),
(131, NULL, 1, 1, 211, 11),
(132, NULL, 1, 1, 205, 11),
(133, NULL, 1, 1, 200, 11),
(134, NULL, 1, 1, 213, 8),
(135, NULL, 1, 1, 152, 8),
(136, NULL, 1, 1, 211, 8),
(137, NULL, 1, 1, 134, 8),
(138, NULL, 1, 1, 216, 11),
(139, NULL, 1, 1, 214, 11),
(140, NULL, 1, 1, 179, 8),
(141, NULL, 1, 1, 205, 8),
(142, NULL, 1, 1, 207, 11),
(143, NULL, 1, 1, 176, 8),
(144, NULL, 1, 1, 148, 11),
(145, NULL, 1, 1, 164, 8),
(146, NULL, 1, 1, 172, 8),
(147, NULL, 1, 1, 170, 8),
(148, NULL, 1, 1, 201, 11),
(149, NULL, 1, 1, 223, 11),
(150, NULL, 1, 1, 130, 8),
(151, NULL, 1, 1, 180, 8),
(152, NULL, 1, 1, 168, 8),
(153, NULL, 1, 1, 218, 8),
(154, NULL, 1, 1, 206, 8),
(155, NULL, 1, 1, 185, 8),
(156, NULL, 1, 1, 188, 8),
(157, NULL, 1, 1, 225, 8),
(158, NULL, 1, 1, 229, 11),
(159, NULL, 1, 1, 231, 8),
(160, NULL, 1, 1, 234, 11);

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ticketchange`
--

CREATE TABLE IF NOT EXISTS `helpdesk_ticketchange` (
  `id` int(11) NOT NULL,
  `field` varchar(100) NOT NULL,
  `old_value` longtext,
  `new_value` longtext,
  `followup_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `helpdesk_ticketchange`
--

INSERT INTO `helpdesk_ticketchange` (`id`, `field`, `old_value`, `new_value`, `followup_id`) VALUES
(2, 'Title', 'tried to export merged dataset as excel', '', 194),
(3, 'Title', 'Objectives in Indicator Planning should be related to the program not the country', '', 356),
(4, 'Title', 'Changed Title from Objectives in Indicator Planning should be related to the program not the country ', '', 358);

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ticketcustomfieldvalue`
--

CREATE TABLE IF NOT EXISTS `helpdesk_ticketcustomfieldvalue` (
  `id` int(11) NOT NULL,
  `value` longtext,
  `field_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_ticketdependency`
--

CREATE TABLE IF NOT EXISTS `helpdesk_ticketdependency` (
  `id` int(11) NOT NULL,
  `depends_on_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `helpdesk_usersettings`
--

CREATE TABLE IF NOT EXISTS `helpdesk_usersettings` (
  `id` int(11) NOT NULL,
  `settings_pickled` longtext,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_builder_displayfield`
--

CREATE TABLE IF NOT EXISTS `report_builder_displayfield` (
  `id` int(11) NOT NULL,
  `path` varchar(2000) NOT NULL,
  `path_verbose` varchar(2000) NOT NULL,
  `field` varchar(2000) NOT NULL,
  `field_verbose` varchar(2000) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `sort` int(11) DEFAULT NULL,
  `sort_reverse` tinyint(1) NOT NULL,
  `width` int(11) NOT NULL,
  `aggregate` varchar(5) NOT NULL,
  `position` smallint(5) UNSIGNED DEFAULT NULL,
  `total` tinyint(1) NOT NULL,
  `group` tinyint(1) NOT NULL,
  `display_format_id` int(11),
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_builder_filterfield`
--

CREATE TABLE IF NOT EXISTS `report_builder_filterfield` (
  `id` int(11) NOT NULL,
  `path` varchar(2000) NOT NULL,
  `path_verbose` varchar(2000) NOT NULL,
  `field` varchar(2000) NOT NULL,
  `field_verbose` varchar(2000) NOT NULL,
  `filter_type` varchar(20) NOT NULL,
  `filter_value` varchar(2000) NOT NULL,
  `filter_value2` varchar(2000) NOT NULL,
  `exclude` tinyint(1) NOT NULL,
  `position` smallint(5) UNSIGNED DEFAULT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_builder_format`
--

CREATE TABLE IF NOT EXISTS `report_builder_format` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `string` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_builder_report`
--

CREATE TABLE IF NOT EXISTS `report_builder_report` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `description` longtext NOT NULL,
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `distinct` tinyint(1) NOT NULL,
  `report_file` varchar(100) NOT NULL,
  `report_file_creation` datetime(6) DEFAULT NULL,
  `root_model_id` int(11) NOT NULL,
  `user_created_id` int(11) DEFAULT NULL,
  `user_modified_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `report_builder_report_starred`
--

CREATE TABLE IF NOT EXISTS `report_builder_report_starred` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_association`
--

CREATE TABLE IF NOT EXISTS `social_auth_association` (
  `id` int(11) NOT NULL,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_code`
--

CREATE TABLE IF NOT EXISTS `social_auth_code` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_nonce`
--

CREATE TABLE IF NOT EXISTS `social_auth_nonce` (
  `id` int(11) NOT NULL,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_usersocialauth`
--

CREATE TABLE IF NOT EXISTS `social_auth_usersocialauth` (
  `id` int(11) NOT NULL,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

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
  ADD UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  ADD KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_type_id` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  ADD KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`);

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
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `django_site`
--
ALTER TABLE `django_site`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helpdesk_attachment`
--
ALTER TABLE `helpdesk_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_attachment_8e047ae2` (`followup_id`);

--
-- Indexes for table `helpdesk_customfield`
--
ALTER TABLE `helpdesk_customfield`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `helpdesk_documentationapp`
--
ALTER TABLE `helpdesk_documentationapp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helpdesk_emailtemplate`
--
ALTER TABLE `helpdesk_emailtemplate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helpdesk_escalationexclusion`
--
ALTER TABLE `helpdesk_escalationexclusion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helpdesk_escalationexclusion_queues`
--
ALTER TABLE `helpdesk_escalationexclusion_queues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `escalationexclusion_id` (`escalationexclusion_id`,`queue_id`),
  ADD KEY `helpdesk_escalati_queue_id_7147f512308958f0_fk_helpdesk_queue_id` (`queue_id`);

--
-- Indexes for table `helpdesk_faq`
--
ALTER TABLE `helpdesk_faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helpdesk_feedback`
--
ALTER TABLE `helpdesk_feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_feedback_submitter_id_5c962d2ae73a718f_fk_auth_user_id` (`submitter_id`);

--
-- Indexes for table `helpdesk_followup`
--
ALTER TABLE `helpdesk_followup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_followup_649b92cd` (`ticket_id`),
  ADD KEY `helpdesk_followup_e8701ad4` (`user_id`);

--
-- Indexes for table `helpdesk_ignoreemail`
--
ALTER TABLE `helpdesk_ignoreemail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helpdesk_ignoreemail_queues`
--
ALTER TABLE `helpdesk_ignoreemail_queues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ignoreemail_id` (`ignoreemail_id`,`queue_id`),
  ADD KEY `helpdesk_ignoreem_queue_id_75203a3e99ea6cd9_fk_helpdesk_queue_id` (`queue_id`);

--
-- Indexes for table `helpdesk_kbcategory`
--
ALTER TABLE `helpdesk_kbcategory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_kbcategory_2dbcba41` (`slug`);

--
-- Indexes for table `helpdesk_kbitem`
--
ALTER TABLE `helpdesk_kbitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk__category_id_5d11790ccfb7bf86_fk_helpdesk_kbcategory_id` (`category_id`);

--
-- Indexes for table `helpdesk_presetreply`
--
ALTER TABLE `helpdesk_presetreply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helpdesk_presetreply_queues`
--
ALTER TABLE `helpdesk_presetreply_queues`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `presetreply_id` (`presetreply_id`,`queue_id`),
  ADD KEY `helpdesk_presetrep_queue_id_127b195d54ea33e_fk_helpdesk_queue_id` (`queue_id`);

--
-- Indexes for table `helpdesk_queue`
--
ALTER TABLE `helpdesk_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_queue_2dbcba41` (`slug`);

--
-- Indexes for table `helpdesk_savedsearch`
--
ALTER TABLE `helpdesk_savedsearch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_savedsearch_user_id_6922181ec9b8c47f_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `helpdesk_ticket`
--
ALTER TABLE `helpdesk_ticket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_ticket_assigned_to_id_642f30536672006b_fk_auth_user_id` (`assigned_to_id`),
  ADD KEY `helpdesk_ticket_queue_id_6e6b13ee729ffc4_fk_helpdesk_queue_id` (`queue_id`);

--
-- Indexes for table `helpdesk_ticketcc`
--
ALTER TABLE `helpdesk_ticketcc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_ticket_ticket_id_1c50e280961cf606_fk_helpdesk_ticket_id` (`ticket_id`),
  ADD KEY `helpdesk_ticketcc_user_id_5da9220d4bef4d2d_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `helpdesk_ticketchange`
--
ALTER TABLE `helpdesk_ticketchange`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_tic_followup_id_ad194b075ad1846_fk_helpdesk_followup_id` (`followup_id`);

--
-- Indexes for table `helpdesk_ticketcustomfieldvalue`
--
ALTER TABLE `helpdesk_ticketcustomfieldvalue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `helpdesk_ti_field_id_318243926d238037_fk_helpdesk_customfield_id` (`field_id`),
  ADD KEY `helpdesk_ticket_ticket_id_6d8dd91012d3e15c_fk_helpdesk_ticket_id` (`ticket_id`);

--
-- Indexes for table `helpdesk_ticketdependency`
--
ALTER TABLE `helpdesk_ticketdependency`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `helpdesk_ticketdependency_ticket_id_48d023fb08737572_uniq` (`ticket_id`,`depends_on_id`),
  ADD KEY `helpdesk_ti_depends_on_id_38b89194a4b47f38_fk_helpdesk_ticket_id` (`depends_on_id`);

--
-- Indexes for table `helpdesk_usersettings`
--
ALTER TABLE `helpdesk_usersettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `report_builder_displayfield`
--
ALTER TABLE `report_builder_displayfield`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_builder_displayfield_e648f564` (`display_format_id`),
  ADD KEY `report_builder_displayfield_6f78b20c` (`report_id`);

--
-- Indexes for table `report_builder_filterfield`
--
ALTER TABLE `report_builder_filterfield`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report_builder_filterfield_6f78b20c` (`report_id`);

--
-- Indexes for table `report_builder_format`
--
ALTER TABLE `report_builder_format`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_builder_report`
--
ALTER TABLE `report_builder_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report__root_model_id_49d9257f76ec6404_fk_django_content_type_id` (`root_model_id`),
  ADD KEY `report_builder__user_created_id_6ebaca247590dc8c_fk_auth_user_id` (`user_created_id`),
  ADD KEY `report_builder_user_modified_id_76c4173bdc4b590c_fk_auth_user_id` (`user_modified_id`),
  ADD KEY `report_builder_report_2dbcba41` (`slug`);

--
-- Indexes for table `report_builder_report_starred`
--
ALTER TABLE `report_builder_report_starred`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_id` (`report_id`,`user_id`),
  ADD KEY `report_builder_report_s_user_id_3ca1bec6156d1ecb_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `social_auth_association`
--
ALTER TABLE `social_auth_association`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_auth_code`
--
ALTER TABLE `social_auth_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_auth_code_email_75f27066d057e3b6_uniq` (`email`,`code`),
  ADD KEY `social_auth_code_c1336794` (`code`);

--
-- Indexes for table `social_auth_nonce`
--
ALTER TABLE `social_auth_nonce`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_auth_nonce_server_url_36601f978463b4_uniq` (`server_url`,`timestamp`,`salt`);

--
-- Indexes for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_auth_usersocialauth_provider_2f763109e2c4a1fb_uniq` (`provider`,`uid`),
  ADD KEY `social_auth_usersociala_user_id_193b2d80880502b2_fk_auth_user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `django_site`
--
ALTER TABLE `django_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `helpdesk_attachment`
--
ALTER TABLE `helpdesk_attachment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_customfield`
--
ALTER TABLE `helpdesk_customfield`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_documentationapp`
--
ALTER TABLE `helpdesk_documentationapp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_emailtemplate`
--
ALTER TABLE `helpdesk_emailtemplate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_escalationexclusion`
--
ALTER TABLE `helpdesk_escalationexclusion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_escalationexclusion_queues`
--
ALTER TABLE `helpdesk_escalationexclusion_queues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_faq`
--
ALTER TABLE `helpdesk_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_feedback`
--
ALTER TABLE `helpdesk_feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_followup`
--
ALTER TABLE `helpdesk_followup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=553;
--
-- AUTO_INCREMENT for table `helpdesk_ignoreemail`
--
ALTER TABLE `helpdesk_ignoreemail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_ignoreemail_queues`
--
ALTER TABLE `helpdesk_ignoreemail_queues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_kbcategory`
--
ALTER TABLE `helpdesk_kbcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_kbitem`
--
ALTER TABLE `helpdesk_kbitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_presetreply`
--
ALTER TABLE `helpdesk_presetreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_presetreply_queues`
--
ALTER TABLE `helpdesk_presetreply_queues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_queue`
--
ALTER TABLE `helpdesk_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_savedsearch`
--
ALTER TABLE `helpdesk_savedsearch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_ticket`
--
ALTER TABLE `helpdesk_ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
--
-- AUTO_INCREMENT for table `helpdesk_ticketcc`
--
ALTER TABLE `helpdesk_ticketcc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;
--
-- AUTO_INCREMENT for table `helpdesk_ticketchange`
--
ALTER TABLE `helpdesk_ticketchange`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `helpdesk_ticketcustomfieldvalue`
--
ALTER TABLE `helpdesk_ticketcustomfieldvalue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_ticketdependency`
--
ALTER TABLE `helpdesk_ticketdependency`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `helpdesk_usersettings`
--
ALTER TABLE `helpdesk_usersettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report_builder_displayfield`
--
ALTER TABLE `report_builder_displayfield`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report_builder_filterfield`
--
ALTER TABLE `report_builder_filterfield`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report_builder_format`
--
ALTER TABLE `report_builder_format`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report_builder_report`
--
ALTER TABLE `report_builder_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `report_builder_report_starred`
--
ALTER TABLE `report_builder_report_starred`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `social_auth_association`
--
ALTER TABLE `social_auth_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `social_auth_code`
--
ALTER TABLE `social_auth_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `social_auth_nonce`
--
ALTER TABLE `social_auth_nonce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `helpdesk_attachment`
--
ALTER TABLE `helpdesk_attachment`
  ADD CONSTRAINT `helpdesk_att_followup_id_b25e0571e29225b_fk_helpdesk_followup_id` FOREIGN KEY (`followup_id`) REFERENCES `helpdesk_followup` (`id`);

--
-- Constraints for table `helpdesk_escalationexclusion_queues`
--
ALTER TABLE `helpdesk_escalationexclusion_queues`
  ADD CONSTRAINT `D80f15a59c499d9d358118b803a93c51` FOREIGN KEY (`escalationexclusion_id`) REFERENCES `helpdesk_escalationexclusion` (`id`),
  ADD CONSTRAINT `helpdesk_escalati_queue_id_7147f512308958f0_fk_helpdesk_queue_id` FOREIGN KEY (`queue_id`) REFERENCES `helpdesk_queue` (`id`);

--
-- Constraints for table `helpdesk_feedback`
--
ALTER TABLE `helpdesk_feedback`
  ADD CONSTRAINT `helpdesk_feedback_submitter_id_5c962d2ae73a718f_fk_auth_user_id` FOREIGN KEY (`submitter_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `helpdesk_followup`
--
ALTER TABLE `helpdesk_followup`
  ADD CONSTRAINT `helpdesk_follow_ticket_id_1447d1bf7c1602e4_fk_helpdesk_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `helpdesk_ticket` (`id`),
  ADD CONSTRAINT `helpdesk_followup_user_id_2f76e3101e13bd89_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `helpdesk_ignoreemail_queues`
--
ALTER TABLE `helpdesk_ignoreemail_queues`
  ADD CONSTRAINT `helpde_ignoreemail_id_32dbfb63235a3d4_fk_helpdesk_ignoreemail_id` FOREIGN KEY (`ignoreemail_id`) REFERENCES `helpdesk_ignoreemail` (`id`),
  ADD CONSTRAINT `helpdesk_ignoreem_queue_id_75203a3e99ea6cd9_fk_helpdesk_queue_id` FOREIGN KEY (`queue_id`) REFERENCES `helpdesk_queue` (`id`);

--
-- Constraints for table `helpdesk_kbitem`
--
ALTER TABLE `helpdesk_kbitem`
  ADD CONSTRAINT `helpdesk__category_id_5d11790ccfb7bf86_fk_helpdesk_kbcategory_id` FOREIGN KEY (`category_id`) REFERENCES `helpdesk_kbcategory` (`id`);

--
-- Constraints for table `helpdesk_presetreply_queues`
--
ALTER TABLE `helpdesk_presetreply_queues`
  ADD CONSTRAINT `helpd_presetreply_id_2fa4cb63da21fc02_fk_helpdesk_presetreply_id` FOREIGN KEY (`presetreply_id`) REFERENCES `helpdesk_presetreply` (`id`),
  ADD CONSTRAINT `helpdesk_presetrep_queue_id_127b195d54ea33e_fk_helpdesk_queue_id` FOREIGN KEY (`queue_id`) REFERENCES `helpdesk_queue` (`id`);

--
-- Constraints for table `helpdesk_savedsearch`
--
ALTER TABLE `helpdesk_savedsearch`
  ADD CONSTRAINT `helpdesk_savedsearch_user_id_6922181ec9b8c47f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `helpdesk_ticket`
--
ALTER TABLE `helpdesk_ticket`
  ADD CONSTRAINT `helpdesk_ticket_assigned_to_id_642f30536672006b_fk_auth_user_id` FOREIGN KEY (`assigned_to_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `helpdesk_ticket_queue_id_6e6b13ee729ffc4_fk_helpdesk_queue_id` FOREIGN KEY (`queue_id`) REFERENCES `helpdesk_queue` (`id`);

--
-- Constraints for table `helpdesk_ticketcc`
--
ALTER TABLE `helpdesk_ticketcc`
  ADD CONSTRAINT `helpdesk_ticket_ticket_id_1c50e280961cf606_fk_helpdesk_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `helpdesk_ticket` (`id`),
  ADD CONSTRAINT `helpdesk_ticketcc_user_id_5da9220d4bef4d2d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `helpdesk_ticketchange`
--
ALTER TABLE `helpdesk_ticketchange`
  ADD CONSTRAINT `helpdesk_tic_followup_id_ad194b075ad1846_fk_helpdesk_followup_id` FOREIGN KEY (`followup_id`) REFERENCES `helpdesk_followup` (`id`);

--
-- Constraints for table `helpdesk_ticketcustomfieldvalue`
--
ALTER TABLE `helpdesk_ticketcustomfieldvalue`
  ADD CONSTRAINT `helpdesk_ti_field_id_318243926d238037_fk_helpdesk_customfield_id` FOREIGN KEY (`field_id`) REFERENCES `helpdesk_customfield` (`id`),
  ADD CONSTRAINT `helpdesk_ticket_ticket_id_6d8dd91012d3e15c_fk_helpdesk_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `helpdesk_ticket` (`id`);

--
-- Constraints for table `helpdesk_ticketdependency`
--
ALTER TABLE `helpdesk_ticketdependency`
  ADD CONSTRAINT `helpdesk_ti_depends_on_id_38b89194a4b47f38_fk_helpdesk_ticket_id` FOREIGN KEY (`depends_on_id`) REFERENCES `helpdesk_ticket` (`id`),
  ADD CONSTRAINT `helpdesk_ticket_ticket_id_7b3ef17946834949_fk_helpdesk_ticket_id` FOREIGN KEY (`ticket_id`) REFERENCES `helpdesk_ticket` (`id`);

--
-- Constraints for table `helpdesk_usersettings`
--
ALTER TABLE `helpdesk_usersettings`
  ADD CONSTRAINT `helpdesk_usersettings_user_id_4d4b7ad90e88d77d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `report_builder_displayfield`
--
ALTER TABLE `report_builder_displayfield`
  ADD CONSTRAINT `r_display_format_id_4a1079b882ad9720_fk_report_builder_format_id` FOREIGN KEY (`display_format_id`) REFERENCES `report_builder_format` (`id`),
  ADD CONSTRAINT `report_bu_report_id_3eebab33d0ec8ab2_fk_report_builder_report_id` FOREIGN KEY (`report_id`) REFERENCES `report_builder_report` (`id`);

--
-- Constraints for table `report_builder_filterfield`
--
ALTER TABLE `report_builder_filterfield`
  ADD CONSTRAINT `report_bu_report_id_68efeb0436c7a715_fk_report_builder_report_id` FOREIGN KEY (`report_id`) REFERENCES `report_builder_report` (`id`);

--
-- Constraints for table `report_builder_report`
--
ALTER TABLE `report_builder_report`
  ADD CONSTRAINT `report__root_model_id_49d9257f76ec6404_fk_django_content_type_id` FOREIGN KEY (`root_model_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `report_builder__user_created_id_6ebaca247590dc8c_fk_auth_user_id` FOREIGN KEY (`user_created_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `report_builder_user_modified_id_76c4173bdc4b590c_fk_auth_user_id` FOREIGN KEY (`user_modified_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `report_builder_report_starred`
--
ALTER TABLE `report_builder_report_starred`
  ADD CONSTRAINT `report_bu_report_id_4a197892710e8bd0_fk_report_builder_report_id` FOREIGN KEY (`report_id`) REFERENCES `report_builder_report` (`id`),
  ADD CONSTRAINT `report_builder_report_s_user_id_3ca1bec6156d1ecb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  ADD CONSTRAINT `social_auth_usersociala_user_id_193b2d80880502b2_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!