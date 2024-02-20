-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2023 at 11:32 AM
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
-- Database: `graceerp`
--

-- --------------------------------------------------------

--
-- Table structure for table `erp_attact`
--

CREATE TABLE `erp_attact` (
  `att_actid` bigint(20) NOT NULL COMMENT 'attendance activity id',
  `att_id` bigint(20) NOT NULL COMMENT 'attendance id',
  `stu_id` varchar(20) NOT NULL COMMENT 'student id(Register no)',
  `att_date` date NOT NULL COMMENT 'attendance date',
  `att_hour` varchar(10) NOT NULL COMMENT 'attendance hour(1,2,3,4,5,6,7,8)',
  `att_sub` varchar(50) NOT NULL COMMENT 'subcode of attendance taken',
  `att_status` varchar(10) NOT NULL COMMENT 'attendance status(P/A)',
  `cls_id` bigint(20) NOT NULL COMMENT 'class id',
  `att_act` varchar(30) NOT NULL COMMENT 'Activity (delete/update)',
  `attact_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Attendance Modified Timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_attendance`
--

CREATE TABLE `erp_attendance` (
  `att_id` bigint(20) NOT NULL COMMENT 'attendance id',
  `stu_id` varchar(20) NOT NULL COMMENT 'student id(Register no)',
  `att_date` date NOT NULL COMMENT 'attendance date',
  `att_hour` varchar(10) NOT NULL COMMENT 'attendance hour(1,2,3,4,5,6,7,8)',
  `att_sub` varchar(50) NOT NULL COMMENT 'subcode of attendance taken',
  `att_status` varchar(10) NOT NULL COMMENT 'attendance status(P/A)',
  `att_sreason` varchar(500) NOT NULL COMMENT 'reason for absence',
  `cls_id` bigint(20) NOT NULL COMMENT 'class id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_calender`
--

CREATE TABLE `erp_calender` (
  `cal_id` bigint(20) NOT NULL COMMENT 'Calender id',
  `cal_event` varchar(30) NOT NULL COMMENT 'Event name',
  `cal_pic` varchar(300) NOT NULL COMMENT 'calendar event picture',
  `cal_timestamp` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'timestamp of Event creation',
  `cal_postby` varchar(30) NOT NULL COMMENT 'Posted by Whom',
  `cal_sdate` date NOT NULL COMMENT 'Event Starting date',
  `cal_edate` date NOT NULL COMMENT 'Event Ending date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_category`
--

CREATE TABLE `erp_category` (
  `cat_id` bigint(20) NOT NULL COMMENT 'category id',
  `cat_name` varchar(30) NOT NULL COMMENT 'category name',
  `cat_desc` varchar(500) NOT NULL COMMENT 'category description',
  `cat_modname` varchar(30) NOT NULL COMMENT 'module name',
  `cat_pcat` varchar(30) NOT NULL COMMENT 'parent category'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_class`
--

CREATE TABLE `erp_class` (
  `cls_id` bigint(20) NOT NULL COMMENT 'Class id',
  `cls_startyr` year(4) NOT NULL COMMENT 'Starting year',
  `cls_endyr` year(4) NOT NULL COMMENT 'Ending year',
  `cls_deptcode` varchar(20) NOT NULL COMMENT 'Department code',
  `cls_dept` varchar(50) NOT NULL COMMENT 'Department name(Abbreviation)',
  `cls_deptname` varchar(50) NOT NULL COMMENT 'dept name(full form)',
  `cls_sem` varchar(10) NOT NULL COMMENT 'Semester',
  `cls_course` varchar(20) NOT NULL COMMENT 'Course name',
  `cls_acdstyr` year(4) NOT NULL COMMENT 'academic start year',
  `cls_acdedyr` year(4) NOT NULL COMMENT 'academic end year'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_createexam`
--

CREATE TABLE `erp_createexam` (
  `ce_id` bigint(20) NOT NULL COMMENT 'Create Exam id',
  `cls_id` bigint(20) NOT NULL COMMENT 'Class id',
  `ce_exam` varchar(30) NOT NULL COMMENT 'Exam name(Slip test/Unit test/IAT/University)',
  `ce_type` varchar(20) NOT NULL COMMENT 'create exam type(university/academic/other)',
  `ce_sdate` date DEFAULT NULL COMMENT 'create exam start date',
  `ce_edate` date DEFAULT NULL COMMENT 'create exam end date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_exam`
--

CREATE TABLE `erp_exam` (
  `exam_id` bigint(20) NOT NULL COMMENT 'Exam id',
  `ce_id` bigint(20) NOT NULL COMMENT 'Create exam id',
  `test_id` bigint(20) NOT NULL COMMENT 'test id',
  `tt_subcode` varchar(50) NOT NULL COMMENT 'subject code of Exam',
  `exam_date` date NOT NULL COMMENT 'Exam date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_faculty`
--

CREATE TABLE `erp_faculty` (
  `f_id` varchar(20) NOT NULL COMMENT 'Faculty id',
  `f_fname` varchar(20) NOT NULL COMMENT 'Faculty first name',
  `f_lname` varchar(20) NOT NULL COMMENT 'Faculty last name',
  `f_dob` date NOT NULL COMMENT 'faculty date of birth',
  `f_gender` varchar(20) NOT NULL COMMENT 'faculty gender',
  `f_dept` varchar(20) NOT NULL COMMENT 'faculty department',
  `f_designation` varchar(20) NOT NULL COMMENT 'faculty designation',
  `f_qualification` varchar(20) NOT NULL COMMENT 'faculty Qualification',
  `f_exp` varchar(20) NOT NULL COMMENT 'faculty Experience',
  `f_role` varchar(50) NOT NULL COMMENT 'Faculty Role',
  `f_doj` date DEFAULT NULL COMMENT 'date of join',
  `f_mobile` varchar(20) NOT NULL COMMENT 'faculty mobile number',
  `f_email` varchar(20) NOT NULL COMMENT 'faculty Email id',
  `f_img` varchar(500) NOT NULL COMMENT 'faculty image',
  `cls_id` bigint(20) NOT NULL COMMENT 'class id (incharge of class)',
  `f_mlang` varchar(20) NOT NULL COMMENT 'faculty mother language',
  `f_mstatus` varchar(20) NOT NULL COMMENT 'faculty marrital status',
  `f_idmark` varchar(100) NOT NULL COMMENT 'faculty identification mark',
  `f_klang` varchar(20) NOT NULL COMMENT 'faculty known language',
  `f_pob` varchar(50) NOT NULL COMMENT 'place of birth',
  `f_bloodgrp` varchar(20) NOT NULL COMMENT 'faculty blood group',
  `f_pdoctor` varchar(100) NOT NULL COMMENT 'faculty personal Doctor name ',
  `f_pdoctorno` varchar(20) NOT NULL COMMENT 'faculty personal doctor number',
  `f_emgno` varchar(20) NOT NULL COMMENT 'faculty emergency number',
  `f_disability` varchar(100) NOT NULL COMMENT 'faculty Disability',
  `f_hobbies` varchar(20) NOT NULL COMMENT 'faculty hobbies',
  `f_nationality` varchar(20) NOT NULL COMMENT 'faculty nationality',
  `f_religion` varchar(20) NOT NULL COMMENT 'faculty religion',
  `f_community` varchar(20) NOT NULL COMMENT 'faculty community',
  `f_caste` varchar(20) NOT NULL COMMENT 'faculty caste',
  `f_add` varchar(50) NOT NULL COMMENT 'faculty address',
  `f_city` varchar(20) NOT NULL COMMENT 'faculty city',
  `f_state` varchar(20) NOT NULL COMMENT 'faculty state',
  `f_zip` varchar(20) NOT NULL COMMENT 'faculty Zipcode',
  `f_padd` varchar(20) NOT NULL COMMENT 'faculty permanent address',
  `f_aadhaarno` varchar(30) NOT NULL COMMENT 'aadhaar number',
  `f_voterid` varchar(30) NOT NULL COMMENT 'voter id',
  `f_ppno` varchar(20) NOT NULL COMMENT 'passport number',
  `f_panno` varchar(20) NOT NULL COMMENT 'pancard number',
  `f_univspec` varchar(200) NOT NULL COMMENT 'university specialization',
  `f_yoc` year(4) NOT NULL COMMENT 'year of completion',
  `f_teachexp` varchar(20) NOT NULL COMMENT 'teaching experience',
  `f_projguide` int(10) NOT NULL COMMENT 'number of projects guiding',
  `f_indexp` int(10) NOT NULL COMMENT 'industry experience',
  `f_pastemp` varchar(200) NOT NULL COMMENT 'past employers',
  `f_hostel` varchar(10) NOT NULL COMMENT 'faculty Hostel(Yes/No)',
  `f_transport` varchar(10) NOT NULL COMMENT 'faculty transport(Yes/No)',
  `f_food` varchar(20) NOT NULL COMMENT 'food offering',
  `f_child` varchar(50) NOT NULL COMMENT 'staff No.Of.child',
  `f_childinsame` varchar(20) NOT NULL COMMENT 'child in same college (child Name)',
  `f_childinother` varchar(20) NOT NULL COMMENT 'child studying in other college (Child Name)',
  `f_status` varchar(20) NOT NULL COMMENT 'status',
  `f_bioid` varchar(20) NOT NULL COMMENT 'bio id',
  `mobile_token` varchar(999) NOT NULL COMMENT 'Mobile Token',
  `f_spin` varchar(100) NOT NULL COMMENT 'Faculty Security Pin',
  `last_otp` varchar(10) NOT NULL COMMENT 'Last OTP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_fees`
--

CREATE TABLE `erp_fees` (
  `fee_id` bigint(20) NOT NULL COMMENT 'fees id',
  `fee_course` varchar(20) NOT NULL COMMENT 'fees course \r\n\r\n(UGF-ug first year,\r\nUGL - ug lateral ot transfer,\r\nPG - pg)',
  `fee_maincat` varchar(20) NOT NULL COMMENT 'Fees Main Category',
  `fee_subcat` varchar(10) NOT NULL COMMENT 'Fees Sub Category\r\n\r\n(gs-government_school,\r\npmss-pmss,\r\nfg-first_graduate,\r\notr-others,\r\nal-alumini,\r\nCate1-cutoffabove90,\r\nCate2-cutoffbetween8090,\r\nCate3-cutoffabove70,\r\nCate4-cutoffbelow70,\r\ng-general)',
  `fee_tuition` varchar(20) NOT NULL COMMENT 'tuition fees',
  `fee_au` varchar(20) NOT NULL COMMENT 'au fees',
  `fee_cdeposit` varchar(20) NOT NULL COMMENT 'caution deposit fees',
  `fee_accommodation` varchar(20) NOT NULL COMMENT 'accommodation fees',
  `fee_mess` varchar(20) NOT NULL COMMENT 'mess fees',
  `fee_bus` varchar(20) NOT NULL COMMENT 'bus fees',
  `fee_exam` varchar(20) NOT NULL COMMENT 'exam fees',
  `fee_erp` varchar(20) NOT NULL COMMENT 'erp fees',
  `fee_dept` varchar(20) NOT NULL COMMENT 'fees for department'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_gallery`
--

CREATE TABLE `erp_gallery` (
  `g_id` bigint(20) NOT NULL COMMENT 'Gallery id',
  `g_title` varchar(30) NOT NULL COMMENT 'gallery title',
  `g_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'gallery timestamp(Event date&time)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_hostel`
--

CREATE TABLE `erp_hostel` (
  `h_id` bigint(20) NOT NULL COMMENT 'Hostel id',
  `h_gender` varchar(10) NOT NULL COMMENT 'Gender Hostel ',
  `h_wdn` varchar(30) NOT NULL COMMENT 'Hostel warden name',
  `h_wdnno` varchar(20) NOT NULL COMMENT 'hostel wardan mobile no',
  `h_depty_wdn` varchar(30) NOT NULL COMMENT 'hostel depty warden name',
  `h_depty_wdnno` varchar(20) NOT NULL COMMENT 'hostel depty warden mobile no',
  `h_rt_wdn` varchar(20) NOT NULL COMMENT 'hostel residential tutor warden name',
  `h_rt_wdnno` varchar(20) NOT NULL COMMENT 'hostel residential tutor warden mobile no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_img`
--

CREATE TABLE `erp_img` (
  `img_id` bigint(20) NOT NULL COMMENT 'Image id',
  `g_id` bigint(20) NOT NULL COMMENT 'gallery id',
  `img_img` varchar(100) NOT NULL COMMENT 'image',
  `img_desc` varchar(50) NOT NULL COMMENT 'image Description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_leave`
--

CREATE TABLE `erp_leave` (
  `lv_id` bigint(20) NOT NULL COMMENT 'Leave id',
  `f_id` varchar(20) NOT NULL COMMENT 'faculty id(leave taken by)',
  `f_dept` varchar(30) NOT NULL,
  `lv_dept` varchar(10) NOT NULL COMMENT 'dept of faculty',
  `lv_type` varchar(20) NOT NULL COMMENT 'leave type (ML,CL,Permission)',
  `lv_reason` varchar(200) NOT NULL COMMENT 'leave reason',
  `lv_applyon` date NOT NULL COMMENT 'apply date',
  `lv_sdate` date NOT NULL COMMENT 'leave start date',
  `lv_edate` date NOT NULL COMMENT 'leave end date',
  `lv_stime` time NOT NULL COMMENT 'leave start time',
  `lv_etime` time NOT NULL COMMENT 'leave end time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_leave_alt`
--

CREATE TABLE `erp_leave_alt` (
  `la_id` bigint(20) NOT NULL COMMENT 'leave alter id',
  `lv_id` bigint(20) NOT NULL COMMENT 'leave id',
  `la_date` date NOT NULL COMMENT 'leave alteration date',
  `la_hour` varchar(5) NOT NULL COMMENT 'leave alteration hour',
  `cls_id` bigint(20) NOT NULL COMMENT 'leave alteration class id',
  `f_id` int(20) NOT NULL COMMENT 'leave aleration staff (f_id)\r\n',
  `la_staffacpt` int(20) NOT NULL COMMENT 'staff accept\r\n(accept-1/reject-0)',
  `la_hodacpt` int(5) NOT NULL COMMENT 'hod accept\r\n(accept-1/reject-0)',
  `la_principalacpt` int(5) NOT NULL COMMENT 'principal accept\r\n(accept-1/reject-0)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_login`
--

CREATE TABLE `erp_login` (
  `log_id` varchar(20) NOT NULL COMMENT 'Login id(Registerno/faculty id)',
  `log_pwd` varchar(20) NOT NULL COMMENT 'login password',
  `log_session` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'login session(timestamp)',
  `log_status` int(5) NOT NULL DEFAULT 1 COMMENT 'active status\r\n(active -1,inactive - 0)',
  `log_secqn` varchar(50) NOT NULL COMMENT 'security question',
  `log_ans` varchar(50) NOT NULL COMMENT 'answer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_mark`
--

CREATE TABLE `erp_mark` (
  `mark_id` bigint(20) NOT NULL COMMENT 'mark id',
  `stu_id` varchar(20) NOT NULL COMMENT 'student id(register no)',
  `cls_id` bigint(20) NOT NULL COMMENT 'class id',
  `ce_id` bigint(20) NOT NULL COMMENT 'create exam id',
  `exam_id` bigint(20) NOT NULL COMMENT 'exm id (sub , pass mark , max mark)',
  `mark_draft` varchar(200) NOT NULL COMMENT 'draft mark',
  `mark_publish` varchar(20) NOT NULL COMMENT 'publish mark',
  `mark_rstatus` varchar(20) NOT NULL COMMENT 'retest status (assignment mark/retest mark)',
  `mark_date` date NOT NULL COMMENT 'mark entry date'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_markact`
--

CREATE TABLE `erp_markact` (
  `markact_id` bigint(20) NOT NULL COMMENT 'mark activity id ',
  `mark_id` bigint(20) NOT NULL COMMENT 'mark id',
  `stu_id` varchar(20) NOT NULL COMMENT 'student id(register no)',
  `cls_id` bigint(20) NOT NULL COMMENT 'class id',
  `ce_id` bigint(20) NOT NULL COMMENT 'create exam id',
  `exam_id` bigint(20) NOT NULL COMMENT 'exm id (sub , pass mark , max mark)',
  `mark_draft` varchar(200) NOT NULL COMMENT 'draft mark',
  `mark_publish` varchar(20) NOT NULL COMMENT 'publish mark',
  `mark_date` date NOT NULL COMMENT 'mark entry date',
  `markact_act` varchar(20) NOT NULL COMMENT 'action (update/delete)',
  `markact_ts` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'mark modified timestamp'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `erp_mark_status_vw`
-- (See below for the actual view)
--
CREATE TABLE `erp_mark_status_vw` (
`cls_id` bigint(20)
,`cls_startyr` year(4)
,`cls_endyr` year(4)
,`cls_dept` varchar(50)
,`cls_sem` varchar(10)
,`cls_course` varchar(20)
,`ce_exam` varchar(30)
,`mark_publish` varchar(20)
,`90-100` bigint(21)
,`80-90` bigint(21)
,`70-80` bigint(21)
,`60-70` bigint(21)
,`50-60` bigint(21)
,`40-50` bigint(21)
,`30-40` bigint(21)
,`20-30` bigint(21)
,`0-20` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `erp_news`
--

CREATE TABLE `erp_news` (
  `news_id` bigint(20) NOT NULL COMMENT 'news id',
  `news_title` varchar(20) NOT NULL COMMENT 'news title',
  `news_desc` varchar(200) NOT NULL COMMENT 'news description',
  `news_link` varchar(200) NOT NULL COMMENT 'news link',
  `news_type` varchar(200) NOT NULL COMMENT 'news type',
  `news_img` varchar(200) NOT NULL COMMENT 'news image',
  `news_status` int(5) NOT NULL COMMENT 'status of news \r\nvisible\r\n(0-not visible / 1- visible)',
  `news_postby` varchar(50) NOT NULL COMMENT 'news posted by'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `erp_news`
--

INSERT INTO `erp_news` (`news_id`, `news_title`, `news_desc`, `news_link`, `news_type`, `news_img`, `news_status`, `news_postby`) VALUES
(1, 'result published', 'UG and PG result published ', 'https://stucor.in/study-materials-annauniv/', 'news', 'img/stucor.jpeg', 1, ''),
(2, 'sports day', 'sports day on 06-03-2023', 'null', 'events', 'img/sportsbroucher.jpeg', 1, ''),
(3, 'leave announcement', 'leave on 06-03-2023', 'null', 'circular', 'img/circular.jpeg', 1, ''),
(4, 'thought of the day', 'thought of the day - 01', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'thought', 'img/thumpnail01.jpeg', 1, ''),
(5, 'Winner In Olympic', 'Olympic winner in 2023', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'performer', 'img/winner.jpeg', 1, ''),
(6, 'Annual Day', 'Annual day Celebration', 'https://www.facebook.com/gracecoengg/videos/238633114684864/', ' news', 'annual.peg', 1, ''),
(8, 'attendance report  ', 'UG and PG report published ', 'https://stucor.in/study-materials-annauniv/', 'news', 'img/report .jpeg', 1, ''),
(9, 'college day', 'college day on 06-03-2023', 'null', 'events', 'img/college.jpeg', 1, ''),
(10, 'symposium ', 'symposium on 06-03-2023', 'null', 'circular', 'img/scircular.jpeg', 1, ''),
(11, 'Workshop', 'Workshop of the day - 01 ', 'https://www.facebook.com/gracecoengg/videos/1346897965840026/', 'events', 'img/Workshop .jpeg', 1, ''),
(12, 'thought of the day', 'thought of the day - 02', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'thought', 'img/thumpnail02.jpeg', 1, ''),
(13, 'thought of the day', 'thought of the day - 03', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'thought', 'img/thumpnail03.jpeg', 1, ''),
(14, 'thought of the day', 'thought of the day - 04', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'thought', 'img/thumpnail04.jpeg', 1, ''),
(15, 'thought of the day', 'thought of the day - 05', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'thought', 'img/thumpnail05.jpeg', 1, ''),
(16, 'sports day-02', 'sports day on 06-08-2023', 'null', 'events', 'img/sportsbroucher2.jpeg', 1, ''),
(17, 'sports day-03', 'sports day on 06-08-2024', 'null', 'events', 'img/sportsbroucher3.jpeg', 1, ''),
(18, 'sports day-04', 'sports day on 0-08-2025', 'null', 'events', 'img/sportsbroucher4.jpeg', 1, ''),
(19, 'sports day-05', 'sports day on 05-08-2026', 'null', 'events', 'img/sportsbroucher5.jpeg', 1, ''),
(20, 'sports day-07', 'sports day on 09-08-2025', 'null', 'events', 'img/sportsbroucher7.jpeg', 1, ''),
(21, 'sports day-06', 'sports day on 12-08-2026', 'null', 'events', 'img/sportsbroucher6.jpeg', 1, ''),
(22, 'leave announcement-2', 'leave on 07-04-2023', 'null', 'circular', 'img/circular2.jpeg', 1, ''),
(23, 'leave announcement-3', 'leave on 08-05-2023', 'null', 'circular', 'img/circular3.jpeg', 1, ''),
(24, 'leave announcement-4', 'leave on 09-06-2023', 'null', 'circular', 'img/circular4.jpeg', 1, ''),
(25, 'Rank Holder', 'Rank Holder in 2020', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'performer', 'img/Rank Holder.jpeg', 1, ''),
(26, 'Rank Holder-2', 'Rank Holder in 2021', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'performer', 'img/Rank Holder-1.jpeg', 1, ''),
(27, 'Rank Holder-3', 'Rank Holder in 2022', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'performer', 'img/Rank Holder-2.jpeg', 1, ''),
(28, 'Rank Holder-3', 'Rank Holder in 2023', 'https://www.youtube.com/watch?v=tujqRqHT1Qs&list=PLJx23jPZ2MP7NWSeGXb3mT3EkoeDtvuFN&index=4', 'performer', 'img/Rank Holder-3.jpeg', 1, ''),
(29, 'college day', 'The event \'college day\' is scheduled for 2023-11-30 at 09:10 for a duration of 2', '', 'calender', 'img/1701315774_green-building-wallpaper.jpg', 0, ''),
(30, 'cl day', 'The event \'cl day\' is scheduled for 2022-10-30 at 09:14 for a duration of 2', '', 'calender', 'img/1701315892_green-building-wallpaper.jpg', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `erp_notification`
--

CREATE TABLE `erp_notification` (
  `no_id` bigint(20) NOT NULL,
  `no_viewid` bigint(20) NOT NULL,
  `no_newsid` bigint(20) NOT NULL,
  `no_timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `erp_n_circular`
-- (See below for the actual view)
--
CREATE TABLE `erp_n_circular` (
`news_id` bigint(20)
,`news_title` varchar(20)
,`news_desc` varchar(200)
,`news_link` varchar(200)
,`news_type` varchar(200)
,`news_img` varchar(200)
,`news_status` int(5)
,`news_postby` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `erp_n_events`
-- (See below for the actual view)
--
CREATE TABLE `erp_n_events` (
`news_id` bigint(20)
,`news_title` varchar(20)
,`news_desc` varchar(200)
,`news_link` varchar(200)
,`news_type` varchar(200)
,`news_img` varchar(200)
,`news_status` int(5)
,`news_postby` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `erp_n_news`
-- (See below for the actual view)
--
CREATE TABLE `erp_n_news` (
`news_id` bigint(20)
,`news_title` varchar(20)
,`news_desc` varchar(200)
,`news_link` varchar(200)
,`news_type` varchar(200)
,`news_img` varchar(200)
,`news_status` int(5)
,`news_postby` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `erp_n_performer`
-- (See below for the actual view)
--
CREATE TABLE `erp_n_performer` (
`news_id` bigint(20)
,`news_title` varchar(20)
,`news_desc` varchar(200)
,`news_link` varchar(200)
,`news_type` varchar(200)
,`news_img` varchar(200)
,`news_status` int(5)
,`news_postby` varchar(50)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `erp_n_thought`
-- (See below for the actual view)
--
CREATE TABLE `erp_n_thought` (
`news_id` bigint(20)
,`news_title` varchar(20)
,`news_desc` varchar(200)
,`news_link` varchar(200)
,`news_type` varchar(200)
,`news_img` varchar(200)
,`news_status` int(5)
,`news_postby` varchar(50)
);

-- --------------------------------------------------------

--
-- Table structure for table `erp_role`
--

CREATE TABLE `erp_role` (
  `r_id` bigint(20) NOT NULL COMMENT 'role id',
  `r_rolename` varchar(30) NOT NULL COMMENT 'role name',
  `r_access` varchar(30) NOT NULL COMMENT 'role access',
  `r_desc` varchar(20) NOT NULL COMMENT 'role description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `erp_role`
--

INSERT INTO `erp_role` (`r_id`, `r_rolename`, `r_access`, `r_desc`) VALUES
(1, 'HOD', 'Homepage', '0'),
(2, 'Advisor', 'attendence', '0'),
(3, 'student', 'Mark', '0');

-- --------------------------------------------------------

--
-- Table structure for table `erp_schedule`
--

CREATE TABLE `erp_schedule` (
  `sc_id` bigint(20) NOT NULL COMMENT 'scedule id',
  `sc_frdate` date NOT NULL COMMENT 'schedule from date',
  `sc_todate` date NOT NULL COMMENT 'schedule to date',
  `class_id` bigint(20) NOT NULL COMMENT 'class id',
  `type_id` int(10) NOT NULL COMMENT 'type id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `erp_schedule`
--

INSERT INTO `erp_schedule` (`sc_id`, `sc_frdate`, `sc_todate`, `class_id`, `type_id`) VALUES
(1, '2023-03-13', '2023-03-29', 1, 1),
(2, '2023-04-03', '2023-04-29', 1, 1),
(3, '2023-03-13', '2023-03-29', 11, 1),
(4, '2023-04-03', '2023-04-29', 11, 1),
(5, '2023-03-13', '2023-03-29', 2, 1),
(6, '2023-04-03', '2023-04-29', 2, 1),
(7, '2023-03-13', '2023-03-29', 10, 1),
(8, '2023-04-03', '2023-04-29', 10, 1),
(9, '2023-03-13', '2023-03-29', 9, 1),
(10, '2023-04-03', '2023-04-29', 9, 1),
(11, '2023-03-13', '2023-03-29', 16, 1),
(12, '2023-04-03', '2023-04-29', 16, 1),
(13, '2023-03-13', '2023-03-29', 18, 1),
(14, '2023-04-03', '2023-04-29', 18, 1),
(15, '2023-03-13', '2023-03-29', 7, 1),
(16, '2023-04-03', '2023-04-29', 7, 1),
(17, '2023-03-13', '2023-03-29', 20, 1),
(18, '2023-04-03', '2023-04-29', 20, 1),
(19, '2023-03-13', '2023-03-29', 8, 1),
(20, '2023-04-03', '2023-04-29', 8, 1),
(21, '2023-03-13', '2023-03-29', 5, 2),
(22, '2023-04-03', '2023-04-29', 5, 2),
(23, '2023-03-13', '2023-03-29', 4, 2),
(24, '2023-04-03', '2023-04-29', 4, 2),
(25, '2023-03-13', '2023-03-29', 6, 2),
(26, '2023-04-03', '2023-04-29', 6, 2),
(27, '4567-03-12', '4578-03-12', 1, 1),
(28, '2023-12-13', '2024-01-07', 12, 1);

-- --------------------------------------------------------

--
-- Table structure for table `erp_sem`
--

CREATE TABLE `erp_sem` (
  `sem_id` bigint(20) NOT NULL,
  `cls_id` bigint(20) NOT NULL,
  `sem_no` bigint(10) NOT NULL,
  `sem_start` date NOT NULL,
  `sem_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_student`
--

CREATE TABLE `erp_student` (
  `stu_id` varchar(24) NOT NULL COMMENT 'student id',
  `stu_admno` varchar(20) NOT NULL COMMENT 'student admission number',
  `stu_regno` varchar(30) NOT NULL COMMENT 'Student register number',
  `stu_fname` varchar(20) NOT NULL COMMENT 'student first name',
  `stu_lname` varchar(20) NOT NULL COMMENT 'student last name ',
  `stu_dob` date NOT NULL COMMENT 'student date of birth',
  `stu_gender` varchar(10) NOT NULL COMMENT 'student gender',
  `cls_id` bigint(20) NOT NULL COMMENT 'class id',
  `stu_doj` date NOT NULL COMMENT 'student date of join',
  `stu_mobile` varchar(20) NOT NULL COMMENT 'student mobile number',
  `stu_email` varchar(30) NOT NULL COMMENT 'student email',
  `stu_coursetype` varchar(20) NOT NULL COMMENT 'course type (regular/part-time)',
  `stu_quota` varchar(20) NOT NULL COMMENT 'student quota',
  `stu_counsellingno` varchar(20) NOT NULL COMMENT 'student councelling no',
  `stu_lateral` varchar(20) NOT NULL COMMENT 'lateral (yes/no)',
  `stu_img` varchar(500) NOT NULL COMMENT 'student image',
  `stu_height` varchar(20) NOT NULL COMMENT 'height (in cm)',
  `stu_weight` varchar(20) NOT NULL COMMENT 'weight (in kg)',
  `stu_emergencyno` int(15) NOT NULL COMMENT 'Student Emergency Mobile',
  `stu_mlang` varchar(20) NOT NULL COMMENT 'student mother language',
  `stu_klang` varchar(20) NOT NULL COMMENT 'student known language',
  `stu_idmark` varchar(100) NOT NULL COMMENT 'student identification mark',
  `stu_hobbies` varchar(100) NOT NULL COMMENT 'student hobbies',
  `stu_extcur` varchar(200) NOT NULL COMMENT 'Student Extra Curricular',
  `stu_nationality` varchar(30) NOT NULL COMMENT 'student nationality',
  `stu_religion` varchar(20) NOT NULL COMMENT 'student religion',
  `stu_bloodgrp` varchar(20) NOT NULL COMMENT 'student blood group',
  `stu_disability` varchar(20) NOT NULL COMMENT 'student disability (yes/no)',
  `stu_disid` varchar(50) NOT NULL COMMENT 'disability id card no',
  `stu_distype` varchar(80) NOT NULL COMMENT 'disability type',
  `stu_disper` int(100) NOT NULL COMMENT 'disability percentage',
  `stu_pdoctor` varchar(50) NOT NULL COMMENT 'student personal doctor name',
  `stu_pdoctorno` varchar(20) NOT NULL COMMENT 'personal doctor no',
  `stu_bp` varchar(20) NOT NULL COMMENT 'blood pressure',
  `stu_visionL` varchar(20) NOT NULL COMMENT 'vision Left',
  `stu_visionR` varchar(20) NOT NULL COMMENT 'vision right',
  `stu_eyecon` varchar(20) NOT NULL COMMENT 'detail of eye contion',
  `stu_pulse` varchar(20) NOT NULL COMMENT 'pulse',
  `stu_squint` varchar(20) NOT NULL COMMENT 'squint detail',
  `stu_dentalcon` varchar(50) NOT NULL COMMENT 'detail of dental condition',
  `stu_healthcon` varchar(50) NOT NULL COMMENT 'details of health condition',
  `stu_father` varchar(50) NOT NULL COMMENT 'student father name',
  `stu_fqualification` varchar(30) NOT NULL COMMENT 'student father qualification',
  `stu_foccupation` varchar(30) NOT NULL COMMENT 'student father occupation',
  `stu_fmobile` varchar(20) NOT NULL COMMENT 'student father mobile number',
  `stu_fatherimg` varchar(500) NOT NULL COMMENT 'student father image',
  `stu_mother` varchar(50) NOT NULL COMMENT 'student mother name',
  `stu_moccupation` varchar(30) NOT NULL COMMENT 'student mother occupation',
  `stu_mmobile` varchar(20) NOT NULL COMMENT 'student mother mobile number',
  `stu_gmobile` varchar(20) NOT NULL COMMENT 'student guardian mobile number',
  `stu_motherimg` varchar(500) NOT NULL COMMENT 'student mother image',
  `stu_guardian` varchar(30) NOT NULL COMMENT 'student guardian name',
  `stu_guardianimg` varchar(500) NOT NULL COMMENT 'student guardian image',
  `stu_sibdetail` varchar(20) NOT NULL COMMENT 'student sibling details',
  `stu_sibinsame` int(5) NOT NULL COMMENT 'student sibling in same college',
  `stu_orphan` varchar(10) NOT NULL COMMENT 'orphan(yes/no)',
  `stu_padd` varchar(50) NOT NULL COMMENT 'student permanent address',
  `stu_city` varchar(20) NOT NULL COMMENT 'student city',
  `stu_state` varchar(20) NOT NULL COMMENT 'student state',
  `stu_zip` varchar(20) NOT NULL COMMENT 'student zip code',
  `stu_transport` varchar(30) NOT NULL COMMENT 'student transport(yes/no)',
  `tr_id` bigint(20) NOT NULL COMMENT 'transport id',
  `stu_hostel` varchar(10) NOT NULL COMMENT 'student hostel(yes/no)',
  `h_id` int(20) NOT NULL COMMENT 'hostel id',
  `stu_hosteltype` varchar(20) NOT NULL COMMENT 'hostler type (free/paid)',
  `stu_roomno` varchar(20) NOT NULL COMMENT 'hostel room number',
  `stu_food` varchar(20) NOT NULL COMMENT 'food offering',
  `stu_comments` varchar(100) NOT NULL COMMENT 'comments',
  `stu_aadhar` varchar(20) NOT NULL COMMENT 'student aadhar number',
  `stu_ppno` varchar(30) NOT NULL COMMENT 'passport no',
  `stu_ppissueat` varchar(50) NOT NULL COMMENT 'passport issue at',
  `stu_issuedate` varchar(30) NOT NULL COMMENT 'passport issue date',
  `stu_ppexpdate` date DEFAULT NULL COMMENT 'passport expiry date',
  `stu_visa` varchar(500) NOT NULL COMMENT 'passport visa details',
  `stu_visano` varchar(30) NOT NULL COMMENT 'passport visa number',
  `stu_visaexpdate` date DEFAULT NULL COMMENT 'visa expiry date',
  `stu_10thmark` int(10) NOT NULL COMMENT '10th mark',
  `stu_12thmark` int(10) NOT NULL COMMENT '12th mark',
  `stu_10theno` varchar(20) NOT NULL COMMENT '10th exam number',
  `stu_12theno` varchar(20) NOT NULL COMMENT '12th exam number',
  `stu_comcerno` varchar(30) NOT NULL COMMENT 'community certficate no',
  `stu_community` varchar(20) NOT NULL COMMENT 'student community',
  `stu_caste` varchar(20) NOT NULL COMMENT 'student caste',
  `stu_tcno` varchar(50) NOT NULL COMMENT 'student tc number',
  `stu_tccomment` varchar(100) NOT NULL COMMENT 'student tc comment',
  `stu_income` int(20) NOT NULL COMMENT 'annual income',
  `stu_inccerno` varchar(30) NOT NULL COMMENT 'Income certificate number',
  `stu_fg` varchar(11) NOT NULL COMMENT 'first graduate (yes/no)',
  `stu_splcat` varchar(50) NOT NULL COMMENT 'student special category (sports/ex-service man)',
  `stu_nameasbank` varchar(100) NOT NULL COMMENT 'student name as in bank account',
  `stu_bankname` varchar(20) NOT NULL COMMENT 'bank name',
  `stu_brancename` varchar(20) NOT NULL COMMENT 'branch name',
  `stu_scholarsts` int(5) NOT NULL COMMENT 'student scholarship status',
  `stu_scholarship` varchar(200) NOT NULL COMMENT 'student scholarship details',
  `stu_accno` varchar(30) NOT NULL COMMENT 'student account number',
  `stu_ifsc` varchar(30) NOT NULL COMMENT 'student ifsc number',
  `stu_status` varchar(20) NOT NULL COMMENT 'student status (active/Transfer/dropout/discontinued/Completed)',
  `mobile_token` varchar(999) NOT NULL COMMENT 'Mobile Token',
  `stu_spin` varchar(100) NOT NULL COMMENT 'Student Security Pin',
  `last_otp` varchar(10) NOT NULL COMMENT 'Last OTP'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `erp_student`
--

INSERT INTO `erp_student` (`stu_id`, `stu_admno`, `stu_regno`, `stu_fname`, `stu_lname`, `stu_dob`, `stu_gender`, `cls_id`, `stu_doj`, `stu_mobile`, `stu_email`, `stu_coursetype`, `stu_quota`, `stu_counsellingno`, `stu_lateral`, `stu_img`, `stu_height`, `stu_weight`, `stu_emergencyno`, `stu_mlang`, `stu_klang`, `stu_idmark`, `stu_hobbies`, `stu_extcur`, `stu_nationality`, `stu_religion`, `stu_bloodgrp`, `stu_disability`, `stu_disid`, `stu_distype`, `stu_disper`, `stu_pdoctor`, `stu_pdoctorno`, `stu_bp`, `stu_visionL`, `stu_visionR`, `stu_eyecon`, `stu_pulse`, `stu_squint`, `stu_dentalcon`, `stu_healthcon`, `stu_father`, `stu_fqualification`, `stu_foccupation`, `stu_fmobile`, `stu_fatherimg`, `stu_mother`, `stu_moccupation`, `stu_mmobile`, `stu_gmobile`, `stu_motherimg`, `stu_guardian`, `stu_guardianimg`, `stu_sibdetail`, `stu_sibinsame`, `stu_orphan`, `stu_padd`, `stu_city`, `stu_state`, `stu_zip`, `stu_transport`, `tr_id`, `stu_hostel`, `h_id`, `stu_hosteltype`, `stu_roomno`, `stu_food`, `stu_comments`, `stu_aadhar`, `stu_ppno`, `stu_ppissueat`, `stu_issuedate`, `stu_ppexpdate`, `stu_visa`, `stu_visano`, `stu_visaexpdate`, `stu_10thmark`, `stu_12thmark`, `stu_10theno`, `stu_12theno`, `stu_comcerno`, `stu_community`, `stu_caste`, `stu_tcno`, `stu_tccomment`, `stu_income`, `stu_inccerno`, `stu_fg`, `stu_splcat`, `stu_nameasbank`, `stu_bankname`, `stu_brancename`, `stu_scholarsts`, `stu_scholarship`, `stu_accno`, `stu_ifsc`, `stu_status`, `mobile_token`, `stu_spin`, `last_otp`) VALUES
('11111', '1223', '9039839q579', 'john', 'j', '2222-03-12', 'Male', 10, '2023-12-28', '9999999999', 'j@g.nb', 'Regular', 'Counselling', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', 0, '', '', '', '', '', '', '', '', NULL, '', '', NULL, 0, 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('1111111111', '123456', '', 'John', 'Newton', '2002-02-18', 'Male', 1, '2023-12-05', '9999999999', 'j@j.com', 'Regular', 'Counselling', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', 0, '', '', '', '', '', '', '', '', NULL, '', '', NULL, 0, 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 'Completed', '', '', ''),
('2021AE01', '12546788098', '', 'kumara', 'Vel', '2003-09-07', 'Male', 3, '2020-11-11', '121212221', 'kumar@gmail.com', '', 'Management', '', '', 'img/Vel.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raja', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Rani', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'Raja guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'Ramanathapuram', 'tamilnadu', '628753', 'No', 0, 'No', 0, '', '2', '', 'talented boy', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '78996438', '68455342', '', 'MBC', '-', '', '', 0, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2021AE02', '12546788098', '', 'Rani', 'Devi', '2003-09-07', 'Female', 3, '2020-11-11', '121212221', 'rani@gmail.com', '', 'Management', '', '', 'img/rani.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'speech,Dance', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raja', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Durga', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'lakshmi guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628603', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 0, 0, '46837634', '34785987', '', 'sC', '-', '', '', 10000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2021CS02', '12546783456', '', 'Sangeetha', 'S', '2003-05-07', 'Female', 4, '2020-11-11', '121454344', 'sangeetha@gmail.com', '', 'Management', '', '', 'img/sangeetha.jpg', '175', '52', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'O', 'no', '', '0', 0, 'nil', '7869045678', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222224567', 'img/fdad.jpg', 'Bama', 'coolie', '44444442345', '66666634346', 'img/bmom.jpg', 'Bharathi guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'Madurai', 'tamilnadu', '628043', 'No', 0, 'No', 0, '', '', '', '', '454554548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 480, 540, '78996438', '53863672', '', 'SC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2021PS01', '12546788098', '', 'Muthu', 'Raj', '2003-10-07', 'Male', 5, '2020-11-11', '121215678', 'muthu@gmail.com', '', 'Management', '', '', 'img/vivek.jpg', '175', '65', 0, 'tamil', 'english', 'scare in hand', 'speech,Drawing', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '92', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raj', '10th', 'coolie', '2222562222', 'img/fdad.jpg', 'Kumari', 'coolie', '44444445644', '66666666666', 'img/bmom.jpg', 'Vivek guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 420, 540, '46837634', '68455342', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2021PS02', '12546788098', '', 'Gandhi', 'Raj', '2003-02-07', 'Male', 5, '2020-11-11', '121212221', 'gandhi@gmail.com', '', 'Management', '', '', 'img/gandhi.jpg', '160', '56', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'bala', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'soundar guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/885 housing board', 'thirunelveli', 'tamilnadu', '628033', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 460, 534, '78996438', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA01', '12546788098', '', 'Ram', 'babu', '2002-03-01', 'Male', 6, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/babu.jpg', '169', '52', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 520, '78996438', '68455342', '', 'BC', '-', '', '', 10000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA02', '12546788098', '', 'Kavitha', 'S', '2003-09-07', 'Female', 6, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/kavitha.jpg', '175', '60', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 499, 596, '78996438', '34785987', '', 'BC', '-', '', '', 6000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA03', '12546788098', '', 'Kabilan', 'l', '2001-01-07', 'Male', 6, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/kabilan.jpg', '175', '60', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 499, 596, '78996438', '34785987', '', 'BC', '-', '', '', 6000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA04', '12546788098', '', 'Ramya', 'M', '2002-02-07', 'Female', 6, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/ramya.jpg', '175', '60', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 499, 596, '78996438', '34785987', '', 'BC', '-', '', '', 6000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA05', '12546788098', '', 'Roshini', 'N', '2001-03-07', 'Female', 6, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/roshi.jpg', '175', '60', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 499, 596, '78996438', '34785987', '', 'BC', '-', '', '', 6000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA06', '12546788098', '', 'Ravi', 'S', '2002-04-07', 'Male', 6, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/rravi.jpg', '175', '60', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 499, 596, '78996438', '34785987', '', 'BC', '-', '', '', 6000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA07', '12546788098', '', 'Sangeetha', 'T', '2001-05-07', 'Female', 6, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/geetha.jpg', '175', '60', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 499, 596, '78996438', '34785987', '', 'BC', '-', '', '', 6000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA08', '12546788098', '', 'Sanjay', 'S', '2002-06-07', 'Male', 6, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/Sanjay.jpg', '175', '60', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 499, 596, '78996438', '34785987', '', 'BC', '-', '', '', 6000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA09', '12546788098', '', 'Sasikumar', 'R', '2001-07-07', 'Male', 6, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sasi.jpg', '175', '60', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 499, 596, '78996438', '34785987', '', 'BC', '-', '', '', 6000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('2022MBA10', '12546788098', '', 'Sasti', 'S', '2002-08-07', 'Male', 6, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sasti.jpg', '175', '60', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '4356478398', '89', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/7/2023', '2023-10-22', '', '45793465', '2025-03-13', 499, 596, '78996438', '34785987', '', 'BC', '-', '', '', 6000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('20CS14', '12345', '', 'Newton', 'john', '2002-02-18', 'Male', 1, '2023-12-05', '9999999999', 'j@j.c', 'Regular', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', 0, '', '', '', '', '', '', '', '', NULL, '', '', NULL, 0, 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('23456789', '234567', '', 'ghjj', 'sdfgh', '2023-11-28', 'Male', 13, '2023-12-12', '12345678', 's@4rthjk.j', 'Regular', 'Counselling', '234567', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', 0, '', '', '', '', '', '', '', '', NULL, '', '', NULL, 0, 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', ''),
('8765', '345678', '', 'kjhgfd', 'ghjm', '2023-12-13', 'Male', 11, '2023-12-08', '3456789', 'f@fgh.jhg', 'Regular', 'Counselling', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', 0, '', '', '', '', '', '', '', '', NULL, '', '', NULL, 0, 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', ''),
('8766', '345678', '', 'kjhgfd', 'ghjm', '2023-12-13', 'Male', 11, '2023-12-08', '3456789', 'f@fgh.jhg', 'Regular', 'Counselling', '', 'No', '8766.jpg', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', 0, '', '', '', '', '', '', '', '', NULL, '', '', NULL, 0, 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', ''),
('8767', '345678', '', 'kjhgfd', 'ghjm', '2023-12-13', 'Male', 11, '2023-12-08', '3456789', 'f@fgh.jhg', 'Regular', 'Counselling', '', 'No', '8767.jpg', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', 0, '', '', '', '', '', '', '', '', NULL, '', '', NULL, 0, 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', ''),
('9503', '20104', '', 'John', 'Newton', '2002-02-18', 'Male', 1, '2023-12-08', '9999999999', 'j@g.j', 'Regular', 'Counselling', '1234567890', '', '9503.jpg', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', 0, '', '', '', '', '', '', '', '', NULL, '', '', NULL, 0, 0, '', '', '', '', '', '', '', 0, '', '', '', '', '', '', 0, '', '', '', '', '', '', ''),
('950320103005', '12546788098', '', 'Prem ', 'm', '2003-06-07', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/prem.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103012', '12546788098', '', 'jeyam', 'ravi', '2003-07-27', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sridhar.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103013', '12546788098', '', 'Surya', 'R', '2003-08-17', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/stanley.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103015', '12546788098', '', 'Sudhagar', 'S', '2003-09-07', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sudhan.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103018', '12546788098', '', 'Ajith', 'Kumar', '0000-00-00', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/Ajith.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103022', '12546788098', '', 'Arun', 'E', '2002-02-07', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/arun.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103023', '12546788098', '', 'Stanley', 'm', '2002-03-07', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/stanley.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103025', '12546788098', '', 'Sudha ', 'S', '2002-04-07', 'Female', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sudha.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103028', '12546788098', '', 'Thomas', 'John', '2002-05-07', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/thomas.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103029', '12546788098', '', 'Rishu john', 'K', '2002-09-07', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/rishu.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320103701', '12546788098', '', 'Muthuram', 'S', '2002-09-07', 'Male', 20, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/Muthu.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104003', '12546788098', '', 'Aron', 'S', '2002-09-03', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/aron.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104005', '12546788098', '', 'Dhana', 'babu', '2002-04-05', 'Male', 1, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/babu.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104006', '12546788098', '', 'Dharma ', 'lingam', '2003-09-28', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/dharma.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104007', '12546788098', '', 'Gowtham ', 'S', '2002-02-07', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/gowtham.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104012', '12546788098', '', 'Jerald abishek', 'V', '2003-09-18', 'Male', 0, '2020-11-11', '121212221', 'jero@gmail.com', 'Regular', 'Management', '', '', '[value-7]', '175', '50', 0, 'tamil', 'english', 'scare in hand', ' play', '', 'india', 'Christian', 'A+', '', '', '0', 0, 'nil', '6734788347', '86', 'very good', 'very good', 'very good', '80', '[value-56]', 'very good', 'very good', 'Raju', '10th', 'coolie', '2222222222', '[value-36]', 'Devi', 'coolie', '44444444444', '66666666666', '[value-35]', 'jero guardian', '[value-37]', '', 0, 'No', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '[value-61]', '545454548787', '43895456', 'udangudi', '[value-66]', '0000-00-00', '[value-65]', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', 'tn454545454', 'BC', '-', '', '', 10000, '0', 'No', 'Ex-Service man', 'JERALD ABISHEK', 'TMB', 'millerpuam', 0, '', '', '8754986532124589', 'Active', '', '', ''),
('950320104013', '12546788098', '', 'Jerrick', 'roshan', '2002-01-01', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/roshan.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104014', '12546788098', '', 'John ', 'Newton', '2003-07-27', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/john.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104015', '12546788098', '', 'karuppa', 'samy', '2002-03-01', 'Male', 1, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/karupu.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104018', '12546788098', '', 'Prem ', 'Kumar', '2003-09-24', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/prem.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104022', '12546788098', '', 'Sridhar', 'E', '2002-10-21', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sridhar.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104023', '12546788098', '', 'Stanley', 'R', '2003-03-07', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/stanley.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104025', '12546788098', '', 'Sudhan ', 'S', '2002-04-05', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sudhan.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104027', '12546788098', '', 'Thesai', 'Jebas', '2003-05-07', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/thesai.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104028', '12546788098', '', 'Thomas', 'Abhraham', '2002-06-03', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/thomas.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104305', '12546788098', '', 'Rishu john', 'K', '2003-04-07', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/rishu.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320104701', '12546788098', '', 'Janaki selvam', 'S', '2002-06-11', 'Male', 1, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/janaki.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105003', '12546788098', '', 'Aathi', 'S', '2002-09-17', 'Male', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/aathi.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105005', '12546788098', '', 'Muthu', 'Raj', '2003-03-01', 'Male', 16, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/Raj.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105006', '12546788098', '', 'Gomathi', 'S', '2002-04-27', 'Female', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/gomathi.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105007', '12546788098', '', 'Dharma ', 'raj', '2003-05-17', 'Male', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/gowtham.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105012', '12546788098', '', 'jeyantha', 'S', '2002-06-02', 'Female', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jeyantha.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105013', '12546788098', '', 'Jerrick', 'roshan', '2003-07-07', 'Male', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jeri.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105014', '12546788098', '', 'karthiga ', 's', '2002-08-02', 'Female', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/karthiga.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105015', '12546788098', '', 'sasdika', 'e', '2003-08-01', 'Female', 16, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/sasthika.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105018', '12546788098', '', 'godjin ', 'damy', '2002-01-02', 'Male', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/godji.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105022', '12546788098', '', 'prami', 'jenitta', '2003-02-27', 'Female', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jenitta.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', '');
INSERT INTO `erp_student` (`stu_id`, `stu_admno`, `stu_regno`, `stu_fname`, `stu_lname`, `stu_dob`, `stu_gender`, `cls_id`, `stu_doj`, `stu_mobile`, `stu_email`, `stu_coursetype`, `stu_quota`, `stu_counsellingno`, `stu_lateral`, `stu_img`, `stu_height`, `stu_weight`, `stu_emergencyno`, `stu_mlang`, `stu_klang`, `stu_idmark`, `stu_hobbies`, `stu_extcur`, `stu_nationality`, `stu_religion`, `stu_bloodgrp`, `stu_disability`, `stu_disid`, `stu_distype`, `stu_disper`, `stu_pdoctor`, `stu_pdoctorno`, `stu_bp`, `stu_visionL`, `stu_visionR`, `stu_eyecon`, `stu_pulse`, `stu_squint`, `stu_dentalcon`, `stu_healthcon`, `stu_father`, `stu_fqualification`, `stu_foccupation`, `stu_fmobile`, `stu_fatherimg`, `stu_mother`, `stu_moccupation`, `stu_mmobile`, `stu_gmobile`, `stu_motherimg`, `stu_guardian`, `stu_guardianimg`, `stu_sibdetail`, `stu_sibinsame`, `stu_orphan`, `stu_padd`, `stu_city`, `stu_state`, `stu_zip`, `stu_transport`, `tr_id`, `stu_hostel`, `h_id`, `stu_hosteltype`, `stu_roomno`, `stu_food`, `stu_comments`, `stu_aadhar`, `stu_ppno`, `stu_ppissueat`, `stu_issuedate`, `stu_ppexpdate`, `stu_visa`, `stu_visano`, `stu_visaexpdate`, `stu_10thmark`, `stu_12thmark`, `stu_10theno`, `stu_12theno`, `stu_comcerno`, `stu_community`, `stu_caste`, `stu_tcno`, `stu_tccomment`, `stu_income`, `stu_inccerno`, `stu_fg`, `stu_splcat`, `stu_nameasbank`, `stu_bankname`, `stu_brancename`, `stu_scholarsts`, `stu_scholarship`, `stu_accno`, `stu_ifsc`, `stu_status`, `mobile_token`, `stu_spin`, `last_otp`) VALUES
('950320105023', '12546788098', '', 'shanmuga', 'sundari', '2002-03-07', 'Female', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sundari.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105025', '12546788098', '', 'amira ', 'mabel', '2003-04-17', 'Female', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/amira.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105028', '12546788098', '', 'aasha', 'm', '2002-05-07', 'Female', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/aasha.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320105305', '12546788098', '', 'jeron', 'r', '2003-06-27', 'Male', 16, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/rishu.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106003', '12546788098', '', 'vivek', 'kumar', '2002-09-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/vivek.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106005', '12546788098', '', 'bala', 'jana', '2002-03-01', 'Male', 2, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/bala.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106006', '12546788098', '', 'sri ', 'ram', '2002-01-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sri.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106007', '12546788098', '', 'Mejack', 'Son', '2002-02-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jack.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106012', '12546788098', '', 'kumar', 'val', '2002-03-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/kumar.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106013', '12546788098', '', 'stanes', 'lee', '2002-03-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/staneslee.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106014', '12546788098', '', 'anbu ', 'Newton', '2002-09-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/anbu.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106015', '12546788098', '', 'mada', 'samy', '2002-03-01', 'Male', 2, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/samy.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106018', '12546788098', '', 'ajith ', 'Kumar', '2002-04-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/ajith.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106022', '12546788098', '', 'thirupathi', 'raja', '2002-05-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/thirupathu.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106023', '12546788098', '', 'anto', 'rohan', '2002-06-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/anto.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106025', '12546788098', '', 'abishek ', 'Sudhan', '2002-07-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sudhan.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106028', '12546788098', '', 'Srinivasa', 'Vignesh M', '2003-08-05', 'Male', 2, '2020-11-11', '9514582003', 'srinivasavignesh.m@gmail.com', '', 'Management', '', '', 'img/srini.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '62/5 Kaniyaler Street', 'Arumuganeri', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106305', '12546788098', '', 'gandhi', 'raj', '2002-09-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/gandhiu.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320106701', '12546788098', '', 'soundhar', 'raj', '2002-11-07', 'Male', 2, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/soundar.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114003', '12546788098', '', 'Ashok', 'S', '2002-01-07', 'Male', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/ashok.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114005', '12546788098', '', 'ram', 'babu', '2002-03-01', 'Male', 7, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/babu.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114006', '12546788098', '', 'Ram', 'lingam', '2002-02-07', 'Male', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/ram.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114007', '12546788098', '', 'Ravi', 'S', '2002-04-07', 'Male', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/ravi.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114012', '12546788098', '', 'Raani', 'V', '2002-05-07', 'Female', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/raani.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114013', '12546788098', '', 'Jerrick', 'lingam', '2002-06-07', 'Male', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/roshan.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114014', '12546788098', '', 'John ', 'Martin', '2002-07-07', 'Male', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/john.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114015', '12546788098', '', 'Muthu', 'samy', '2002-08-01', 'Male', 7, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/karupu.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114018', '12546788098', '', 'Muthu', 'Kumar', '2002-09-07', 'Male', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/prem.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114022', '12546788098', '', 'Ravi', 'Varma', '2002-10-07', 'Male', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/ravi.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114023', '12546788098', '', 'Stanley', 'R', '2002-11-07', 'Male', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/stanley.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950320114025', '12546788098', '', 'Sudhan ', 'S', '2002-12-07', 'Male', 7, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sudhan.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103001', '12546788098', '', 'Abhi', 'jebas', '2003-09-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jebas.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103002', '12546788098', '', 'Ajith', 'kumar', '2003-01-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/ajith.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103003', '12546788098', '', 'Sudha', 'R', '2003-02-07', 'Female', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sudha.jpg', '175', '50', 0, 'tamil', 'english', 'scare in \r\nhand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103004', '12546788098', '', 'Sudhan ', 'S', '2003-03-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sudhan.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103005', '12546788098', '', 'Ashok', 'jebas', '2003-09-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jebas.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103006', '12546788098', '', 'Ajith', 'E', '2003-01-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/ajith.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103007', '12546788098', '', 'Stanley', 'R', '2003-02-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/stanley.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103008', '12546788098', '', 'Sudhakar ', 'S', '2003-03-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sudhakar.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103009', '12546788098', '', 'Thomas', 'Abhraham', '2003-04-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/thomas.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103010', '12546788098', '', 'john', 'K', '2003-05-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/john.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321103011', '12546788098', '', 'Janaki', 'S', '2003-06-07', 'Male', 8, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/janaki.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104001', '12543465098', '', 'Aathi durai', 'M', '2003-01-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/aathi.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '628009', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104002', '12543465098', '', 'Abishek A Stepan', 'S', '2003-02-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/stepan.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '628009', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104004', '12543465098', '', 'Alwin', 'K', '2003-03-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/alwin.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '628009', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104005', '12543465098', '', 'Mari', 'Muthu', '2003-04-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/muthu.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '628009', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104007', '12543465098', '', 'Anantha', 'Kumaran', '2003-05-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/ananthu.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '628009', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104010', '12543465098', '', 'Anush', 'M', '2003-06-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/anush.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '628009', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104011', '12543465098', '', 'Aravind', 'M', '2003-07-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/aravind.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '628009', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104012', '12543465098', '', 'Arul rino fernando', 'M', '2003-08-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/arul.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104015', '12543465098', '', 'Denni thomas', 'M', '2003-09-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/denni.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '628009', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321104028', '12543465098', '', 'Mark s thomas', 'M', '2003-10-04', 'Male', 11, '2020-11-12', '121212345', 'Vignesh@gmail.com', '', 'Management', '', '', 'img/thomas.jpg', '164', '50', 0, 'tamil', 'english', 'scare in hand', 'Reading,dance', '', 'india', 'hindu', 'o+', 'no', '', '0', 0, 'nil', '7869045678', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Durai', '10th', 'coolie', '2222245645', 'img/fdad.jpg', 'Lakshmi', 'coolie', '44444444565', '66666666464', 'img/bmom.jpg', 'Vignesh guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'kerala', 'kerala', '628009', 'No', 0, 'No', 0, '', '2', '', '', '545345345787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 420, 540, '78996345', '53863672', '', 'MBC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105003', '12546788098', '', 'pranav', 'kumar', '2002-09-07', 'Male', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/pranav.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105005', '12546788098', '', 'bala', 'sundar', '2003-03-01', 'Male', 9, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/bala.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105006', '12546788098', '', 'hari ', 'ram', '2002-01-07', 'Male', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/hari.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105007', '12546788098', '', 'leela ', 'devi', '2003-02-07', 'Female', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/leele.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105008', '12546788098', '', 'abhinaya', 's', '2002-03-07', 'Female', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/abi.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', '');
INSERT INTO `erp_student` (`stu_id`, `stu_admno`, `stu_regno`, `stu_fname`, `stu_lname`, `stu_dob`, `stu_gender`, `cls_id`, `stu_doj`, `stu_mobile`, `stu_email`, `stu_coursetype`, `stu_quota`, `stu_counsellingno`, `stu_lateral`, `stu_img`, `stu_height`, `stu_weight`, `stu_emergencyno`, `stu_mlang`, `stu_klang`, `stu_idmark`, `stu_hobbies`, `stu_extcur`, `stu_nationality`, `stu_religion`, `stu_bloodgrp`, `stu_disability`, `stu_disid`, `stu_distype`, `stu_disper`, `stu_pdoctor`, `stu_pdoctorno`, `stu_bp`, `stu_visionL`, `stu_visionR`, `stu_eyecon`, `stu_pulse`, `stu_squint`, `stu_dentalcon`, `stu_healthcon`, `stu_father`, `stu_fqualification`, `stu_foccupation`, `stu_fmobile`, `stu_fatherimg`, `stu_mother`, `stu_moccupation`, `stu_mmobile`, `stu_gmobile`, `stu_motherimg`, `stu_guardian`, `stu_guardianimg`, `stu_sibdetail`, `stu_sibinsame`, `stu_orphan`, `stu_padd`, `stu_city`, `stu_state`, `stu_zip`, `stu_transport`, `tr_id`, `stu_hostel`, `h_id`, `stu_hosteltype`, `stu_roomno`, `stu_food`, `stu_comments`, `stu_aadhar`, `stu_ppno`, `stu_ppissueat`, `stu_issuedate`, `stu_ppexpdate`, `stu_visa`, `stu_visano`, `stu_visaexpdate`, `stu_10thmark`, `stu_12thmark`, `stu_10theno`, `stu_12theno`, `stu_comcerno`, `stu_community`, `stu_caste`, `stu_tcno`, `stu_tccomment`, `stu_income`, `stu_inccerno`, `stu_fg`, `stu_splcat`, `stu_nameasbank`, `stu_bankname`, `stu_brancename`, `stu_scholarsts`, `stu_scholarship`, `stu_accno`, `stu_ifsc`, `stu_status`, `mobile_token`, `stu_spin`, `last_otp`) VALUES
('950321105009', '12546788098', '', 'jeya', 'priya', '2003-04-07', 'Female', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/rpriya.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105010', '12546788098', '', 'karthiga ', 's', '2002-05-07', 'Female', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/karthiga.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105011', '12546788098', '', 'sasdika', 'e', '2003-06-01', 'Female', 9, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/sasdika.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105012', '12546788098', '', 'godjin ', 'damy', '2002-07-07', 'Male', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/godji.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105013', '12546788098', '', 'prami', 'jenitta', '2003-08-07', 'Male', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/prami.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105014', '12546788098', '', 'shanmuga', 'sundari', '2002-09-07', 'Male', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sanmuga.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105015', '12546788098', '', 'amira ', 'mabel', '2003-10-07', 'Female', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/amira.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105016', '12546788098', '', 'aasha', 'm', '2002-09-07', 'Female', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/aasa.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105017', '12546788098', '', 'jeron', 'r', '2003-05-07', 'Male', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jeron.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321105018', '12546788098', '', 'aman', 'kumar', '2002-04-07', 'Male', 9, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/aman.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106003', '12546788098', '', 'kumar', 'pranav', '2003-01-01', 'Male', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/kumar.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106005', '12546788098', '', 'sundar', 'bala', '2003-02-02', 'Male', 10, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/sundga.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106006', '12546788098', '', 'ram', 'hari ', '2003-03-03', 'Male', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/ram.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106007', '12546788098', '', 'devi', 'leela ', '2003-04-04', 'Male', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/devi.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106012', '12546788098', '', 's', 'abhinaya', '2003-05-08', 'Female', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/abi.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106013', '12546788098', '', 'priya', 'jeya', '2003-06-11', 'Female', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/priya.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106014', '12546788098', '', 's', 'karthiga ', '2003-07-13', 'Female', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/karthiga.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106015', '12546788098', '', 'e', 'sasdika', '2003-08-15', 'Female', 10, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/sadika.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106018', '12546788098', '', 'damy', 'godjin ', '2003-09-17', 'Male', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/dammy.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106022', '12546788098', '', 'jenitta', 'prami', '2003-01-19', 'Male', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jenitto.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106023', '12546788098', '', 'sundari', 'shanmuga', '2003-02-21', 'Male', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sundari.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106025', '12546788098', '', 'mabel', 'amira ', '2003-03-23', 'Male', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/mabel.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106028', '12546788098', '', 'm', 'aasha', '2003-04-24', 'Female', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/aasa.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106305', '12546788098', '', 'r', 'jeron', '2003-05-25', 'Male', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/rishu.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321106701', '12546788098', '', 'kumar', 'aman', '2003-06-27', 'Male', 10, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/kumar.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114003', '12546788098', '', 'aadesh', 'S', '2003-07-07', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/aadhed.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114005', '12546788098', '', 'Dhana', 'raj', '2003-08-08', 'Male', 18, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/raj.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114006', '12546788098', '', 'Dharma ', 'prapu', '2003-09-09', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/dharma.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114007', '12546788098', '', 'Gowtham ', 'S', '2003-01-17', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/gowtham.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114012', '12546788098', '', 'john', 'V', '2003-02-17', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jero.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114013', '12546788098', '', 'Jerrick', 'M', '2003-03-17', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/roshan.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114014', '12546788098', '', 'Jebas', 'S', '2003-04-27', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/jebas.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114015', '12546788098', '', 'karuppa', 'raj', '2003-05-21', 'Male', 18, '2020-11-11', '121212121', 'babu@gmail.com', '', 'Management', '', '', 'img/karupu.jpg', '169', '50', 0, 'tamil', 'english', 'scare in hand', 'singing', '', 'india', 'hindu', 'b+', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Jayaram', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Vijaya', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'babu guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'tuty', 'tamilnadu', '628008', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 520, '46837634', '53863672', '', 'BC', '-', '', '', 20000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114018', '12546788098', '', 'Prem ', 'm', '2003-06-07', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/prem.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114022', '12546788098', '', 'jeyam', 'ravi', '2003-07-27', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sridhar.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114023', '12546788098', '', 'Surya', 'R', '2003-08-17', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/stanley.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', ''),
('950321114025', '12546788098', '', 'Sudhagar', 'S', '2003-09-07', 'Male', 18, '2020-11-11', '121212221', 'jero@gmail.com', '', 'Management', '', '', 'img/sudhan.jpg', '175', '50', 0, 'tamil', 'english', 'scare in hand', 'speech', '', 'india', 'hindu', 'A', 'no', '', '0', 0, 'nil', '6734788347', '86', 'good', 'good', 'good', '80', 'no', 'good', 'normal', 'Raju', '10th', 'coolie', '2222222222', 'img/fdad.jpg', 'Devi', 'coolie', '44444444444', '66666666666', 'img/bmom.jpg', 'jero guardian', 'img/bgaurd.jpg', '', 0, 'no', '1h/882 housing board', 'thirunelveli', 'tamilnadu', '628003', 'No', 0, 'No', 0, '', '', '', '', '545454548787', '43895456', 'udangudi', '20/3/2023', '2023-06-22', '', '45795498', '2025-03-13', 460, 596, '78996438', '53863672', '', 'BC', '-', '', '', 5000, '0', '0', '', '', '', '', 0, '', '', '', 'Active', '', '', '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `erp_stu_count_vw`
-- (See below for the actual view)
--
CREATE TABLE `erp_stu_count_vw` (
`course` varchar(20)
,`startyear` year(4)
,`endyear` year(4)
,`semester` varchar(10)
,`dept` varchar(50)
,`deptname` varchar(50)
,`classid` bigint(20)
,`male` decimal(23,0)
,`female` decimal(23,0)
,`counts` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `erp_subject`
--

CREATE TABLE `erp_subject` (
  `sub_id` bigint(20) NOT NULL COMMENT 'subject id',
  `tt_subcode` varchar(10) NOT NULL COMMENT 'Timetable subjectcode',
  `cls_id` bigint(20) NOT NULL COMMENT 'class id',
  `sub_name` varchar(50) NOT NULL COMMENT 'subject name',
  `sub_credit` int(20) NOT NULL COMMENT 'subject credits',
  `sub_type` varchar(10) NOT NULL COMMENT 'subject type',
  `f_id` varchar(20) NOT NULL COMMENT 'faculty id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `erp_subject`
--

INSERT INTO `erp_subject` (`sub_id`, `tt_subcode`, `cls_id`, `sub_name`, `sub_credit`, `sub_type`, `f_id`) VALUES
(1, 'CS3401', 11, 'Introduction to Operating System', 3, '2', 'f003'),
(2, 'CS3452', 11, 'Theory of Computation', 3, '2', 'f002'),
(3, 'CS3461', 11, 'Operating System Laboratory', 1, '1', 'f003'),
(4, 'CS3481', 11, 'Database Management System Laboratory', 1, '1', 'f022'),
(5, 'CS3491', 11, 'Machine Learning lab', 3, '2', 'f002'),
(6, 'CS3492', 11, 'Database Management System', 3, '2', 'f023'),
(7, 'GE3451', 11, 'Environmental Science and Sustainability', 3, '2', 'f022'),
(8, 'CS8601', 1, 'Mobile Computing', 3, '2', 'f002'),
(9, 'CS8602', 1, 'Compiler Design', 4, '2', 'f003'),
(10, 'CS8603', 1, 'distributed system', 3, '2', 'f022'),
(11, 'CS8611', 1, 'Mini Project', 2, '3', 'f024'),
(12, 'CS8651', 1, 'Internet Programming', 3, '2', 'f023'),
(13, 'CS8661', 1, 'Internet Programming Laboratory', 2, '1', 'f042'),
(14, 'CS8662', 1, 'Mobile Application Development Laboratory', 2, '1', 'f024'),
(15, 'CS8691', 1, 'artificial intelligence', 3, '2', 'f042'),
(16, 'EC8095', 2, 'Vlsi Design', 3, '3', 'f001'),
(17, 'EC8611', 2, 'Technical Electrical', 3, '2', 'f025'),
(18, 'EC8651', 2, 'Transmission Lines and Rf System', 3, '2', 'f026'),
(19, 'EC8652', 2, 'Wiireless Communication', 3, '2', 'f027'),
(20, 'EC8661', 2, 'Vlsi Design Laboratory', 2, '1', 'f004'),
(21, 'EC8681', 2, 'Microprocessors and Microcontrollers Laboratory', 2, '1', 'f026'),
(22, 'EC8691', 2, 'Microprocessors and Microcontrollers', 3, '2', 'f004'),
(23, 'EC8645', 2, 'Communication systems ', 3, '2', 'f028'),
(24, 'EC8465', 2, 'Communication systems lab', 2, '1', 'f006'),
(25, 'EC3452', 10, 'Electromagnetic fields', 3, '2', 'f025'),
(26, 'EC3401', 10, 'Networks and Security', 4, '2', 'f001'),
(27, 'EC3451', 10, 'Linear integrated Systems', 3, '2', 'f027'),
(28, 'EC3492', 10, 'Digital Signal Processing', 2, '2', 'f041'),
(29, 'EC3491', 10, 'Communication systems', 3, '2', 'f026'),
(30, 'GE3451', 10, 'Environmental Science and Sustainability', 3, '2', 'f004'),
(31, 'EC3461', 10, 'Communication systems lab', 2, '1', 'f001'),
(32, 'EC3462', 10, 'Linear integrated Systems lab', 2, '1', 'f006'),
(33, 'EC3498', 10, 'Digital Signal Processing lab', 2, '1', 'f026'),
(34, 'EE8601', 16, 'Solid statics drivers', 3, '2', 'f028'),
(35, 'EE8602', 16, 'Protect and Switch gear', 3, '2', 'f006'),
(36, 'EE8603', 16, 'Embedded Systems', 3, '2', 'f045'),
(37, 'EE8003', 16, 'Power systems stability', 3, '3', 'f005'),
(38, 'EE8001', 16, 'Visual language and applications', 3, '3', 'f044'),
(39, 'EE8661', 16, 'Power electronics and Drives', 2, '1', 'f026'),
(40, 'EE8681', 16, 'Microprocessors and Microcontrollers Laboratory', 2, '1', 'f043'),
(41, 'EE8611', 16, 'Mini projects', 2, '1', 'f029'),
(42, 'GE3451', 9, 'Environmental Science and Sustainability', 3, '0', 'f005'),
(43, 'EE3401', 9, 'Transmission and Distribution', 2, '2', 'f044'),
(44, 'EE3402', 9, 'Linear Integrated Circuit', 3, '2', 'f028'),
(45, 'EE3403', 9, 'Measurements and instrumentation', 3, '2', 'f045'),
(46, 'EE3404', 9, 'Microprocessors and controllers', 3, '2', 'f006'),
(47, 'EE3405', 9, 'Electrical machines', 3, '2', 'f044'),
(48, 'EE3411', 9, 'Electrical machines lab', 2, '1', 'f043'),
(49, 'EE3412', 9, 'Linear Integrated Circuit lab', 2, '1', 'f005'),
(50, 'EE3413', 9, 'Microprocessors and Microcontrollers Lab', 2, '1', 'f028'),
(51, 'ME8651', 7, 'Design of transmission systems', 3, '2', 'f010'),
(52, 'ME8691', 7, 'Computer aided design and manufactor', 3, '2', 'f009'),
(53, 'ME8693', 7, 'Heat and mass transfer', 3, '2', 'f032'),
(54, 'ME8692', 7, 'Machine Element', 3, '2', 'f030'),
(55, 'ME8694', 7, 'Hydraclices and pneumatics', 3, '2', 'f046'),
(56, 'ME8681', 7, 'cad-cam lab', 2, '1', 'f030'),
(57, 'ME8682', 7, 'Design and fabricates project', 2, '1', 'f031'),
(58, 'HS8581', 7, 'professional communication lab', 2, '1', 'f032'),
(59, 'ME3491', 18, 'Theory of machines', 3, '2', 'f009'),
(60, 'ME3451', 18, 'Thermal Engineering', 4, '2', 'f046'),
(61, 'ME3492', 18, 'HHydraclices and pneumatics', 3, '2', 'f010'),
(62, 'ME3493', 18, 'Manufactory technology', 3, '2', 'f031'),
(63, 'CE3491', 18, 'Strength of materials', 3, '2', 'f010'),
(64, 'GE3451', 18, 'Environmental Science and Sustainability', 3, '0', 'f032'),
(65, 'CE3481', 18, 'Strength of materials and fluid lab', 2, '1', 'f010'),
(66, 'ME3461', 18, 'Termal Engineering', 2, '1', 'f009'),
(67, 'CE8601', 20, 'Design of steel structre Elements ', 3, '2', 'f007'),
(68, 'CE8602', 20, 'Design of steel structre Elements ', 3, '2', 'f008'),
(69, 'CE8603', 20, 'Irrigation Engineering', 3, '2', 'f035'),
(70, 'CE8604', 20, 'Highways Engineering', 3, '2', 'f034'),
(71, 'EN8592', 20, 'Waste material management', 3, '2', 'f047'),
(72, 'CE8611', 20, 'Highway Engineering', 2, '1', 'f033'),
(73, 'CE8612', 20, 'Irrigation Engineering lab', 2, '1', 'f007'),
(74, 'HS8581', 20, 'professional communication lab', 2, '1', 'f035'),
(75, 'CE3401', 8, 'Applied hydraulics Engineering', 3, '2', 'f033'),
(76, 'CE3402', 8, 'Strength of materials', 3, '2', 'f034'),
(77, 'CE3403', 8, 'Concreate technology', 3, '2', 'f035'),
(78, 'CE3404', 8, 'Soil machanics', 3, '2', 'f008'),
(79, 'CE3405', 8, 'Highway&railway engineering', 3, '2', 'f007'),
(80, 'GE3451', 8, 'Environmental Science and Sustainability', 3, '0', 'f035'),
(81, 'CE3411', 8, 'Concreate technology lab', 2, '1', 'f007'),
(82, 'CE3412', 8, 'Material Engineering lab', 2, '1', 'f047'),
(83, 'CE3413', 8, 'Solid machines lab', 2, '1', 'f008'),
(84, 'HS8586', 1, 'Professional Communication', 2, '1', 'f003'),
(85, 'CS3462', 11, 'DataScience', 3, '2', 'f003'),
(86, 'CS3468', 11, 'Artificial Intelligence', 3, '2', 'f042'),
(87, 'EE8013', 16, 'Power systems lab', 2, '2', 'f005'),
(88, 'ME8695', 7, 'Automobile Engineering', 2, '3', 'f031'),
(89, 'ME3496', 18, 'Manufacturing lab', 2, '1', 'f046'),
(90, 'CE8603', 20, 'Building Structure', 3, '2', 'f035'),
(100, 'MBA101', 6, 'Macroeconomics', 2, '2', 'f011'),
(101, 'MBA102', 6, 'Business law', 3, '2', 'f038'),
(102, 'MBA103', 6, 'Operation management', 3, '2', 'f012'),
(103, 'MBA104', 6, 'Corporate finance', 3, '2', 'f039'),
(104, 'MBA105', 6, 'Optimization and research', 3, '2', 'f040'),
(105, 'MBA106', 6, 'Organizational behaviour', 3, '2', 'f012'),
(106, 'MBA107', 6, 'Project management lab', 2, '1', 'f012'),
(107, 'MBA108', 6, 'Macroeconomics lab', 2, '1', 'f040');

-- --------------------------------------------------------

--
-- Table structure for table `erp_test`
--

CREATE TABLE `erp_test` (
  `test_id` bigint(20) NOT NULL COMMENT 'test id ',
  `test_name` varchar(30) NOT NULL COMMENT 'test name ',
  `test_maxmark` varchar(20) NOT NULL COMMENT 'max mark for test',
  `test_passmark` varchar(20) NOT NULL COMMENT 'pass mark for test',
  `test_type` varchar(20) NOT NULL COMMENT 'test type (g-grade/m-mark)'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `erp_test`
--

INSERT INTO `erp_test` (`test_id`, `test_name`, `test_maxmark`, `test_passmark`, `test_type`) VALUES
(1, 'Slip Test 1', '20', '10', 'm'),
(2, 'Slip Test 2', '20', '10', 'm'),
(3, 'Slip Test 3', '20', '10', 'm'),
(4, 'Slip Test 4', '20', '10', 'm'),
(5, 'Slip Test 5', '20', '10', 'm'),
(6, 'Slip Test 6', '20', '10', 'm'),
(7, 'Slip Test 7', '20', '10', 'm'),
(8, 'Slip Test 8', '20', '10', 'm'),
(9, 'Slip Test 9', '20', '10', 'm'),
(10, 'Slip Test 10', '20', '10', 'm'),
(11, 'Slip Test 11', '20', '10', 'm'),
(12, 'Slip Test 12', '20', '10', 'm'),
(13, 'Slip Test 13', '20', '10', 'm'),
(14, 'Slip Test 14', '20', '10', 'm'),
(15, 'Slip Test 15', '20', '10', 'm'),
(16, 'Slip Test 16', '20', '10', 'm'),
(17, 'Slip Test 17', '20', '10', 'm'),
(18, 'Slip Test 18', '20', '10', 'm'),
(19, 'Slip Test 19', '20', '10', 'm'),
(20, 'Slip Test 20', '20', '10', 'm'),
(21, 'Unit Test 1', '50', '25', 'm'),
(22, 'Unit Test 2', '50', '25', 'm'),
(23, 'Unit Test 3', '50', '25', 'm'),
(24, 'Unit Test 4', '50', '25', 'm'),
(25, 'Unit Test 5', '50', '25', 'm'),
(26, 'IAT 1', '50', '25', 'm'),
(27, 'IAT 2', '50', '25', 'm'),
(28, 'IAT 3', '50', '25', 'm'),
(29, 'Model exam', '100', '50', 'm'),
(30, 'University', '100', '50', 'g');

-- --------------------------------------------------------

--
-- Table structure for table `erp_timetable`
--

CREATE TABLE `erp_timetable` (
  `tt_id` int(200) NOT NULL COMMENT 'timetable_id (autu_increment)',
  `cls_id` bigint(20) NOT NULL COMMENT 'class_id',
  `sc_id` bigint(20) NOT NULL COMMENT 'schedule id',
  `tt_day` varchar(30) NOT NULL COMMENT 'timetable_day',
  `tt_period` varchar(20) NOT NULL COMMENT 'timetable_periodno',
  `tt_subcode` varchar(30) NOT NULL COMMENT 'timetable_subjectcode',
  `tt_secondary` varchar(10) NOT NULL COMMENT 'secondary subcode',
  `tt_date` date DEFAULT NULL COMMENT 'date of subject to be altered',
  `tt_status` int(5) NOT NULL COMMENT 'status (0-invalid | 1-valid)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `erp_timetable`
--

INSERT INTO `erp_timetable` (`tt_id`, `cls_id`, `sc_id`, `tt_day`, `tt_period`, `tt_subcode`, `tt_secondary`, `tt_date`, `tt_status`) VALUES
(1, 1, 1, 'Mon', '1', 'CS8601', ' ', NULL, 0),
(2, 1, 1, 'Mon', '2', 'CS8602', ' ', NULL, 0),
(3, 1, 1, 'Mon', '3', 'CS8602', ' ', NULL, 0),
(4, 1, 1, 'Mon', '4', 'CS8603', ' ', NULL, 0),
(5, 1, 1, 'Mon', '5', 'CS8661', ' ', NULL, 0),
(6, 1, 1, 'Mon', '6', 'CS8661', ' ', NULL, 0),
(7, 1, 1, 'Mon', '7', 'CS8661', '', NULL, 0),
(8, 1, 1, 'Mon', '8', 'CS8602', '', NULL, 0),
(9, 1, 1, 'Tue', '1', 'CS8602', '', NULL, 0),
(10, 1, 1, 'Tue', '2', 'CS8603', '', NULL, 0),
(11, 1, 1, 'Tue', '3', 'CS8603', '', NULL, 0),
(12, 1, 1, 'Tue', '4', 'CS8651', '', NULL, 0),
(13, 1, 1, 'Tue', '5', 'CS8651', '', NULL, 0),
(14, 1, 1, 'Tue', '6', 'CS8691', '', NULL, 0),
(15, 1, 1, 'Tue', '7', 'CS8691', '', NULL, 0),
(16, 1, 1, 'Tue', '8', 'CS8603', '', NULL, 0),
(17, 1, 1, 'Wed', '1', 'CS8603', '', NULL, 0),
(18, 1, 1, 'Wed', '2', 'CS8651', '', NULL, 0),
(19, 1, 1, 'Wed', '3', 'CS8651', '', NULL, 0),
(20, 1, 1, 'Wed', '4', 'CS8691', '', NULL, 0),
(21, 1, 1, 'Wed', '5', 'CS8662', '', NULL, 0),
(22, 1, 1, 'Wed', '6', 'CS8662', '', NULL, 0),
(23, 1, 1, 'Wed', '7', 'CS8662', '', NULL, 0),
(24, 1, 1, 'Wed', '8', 'CS8651', '', NULL, 0),
(25, 1, 1, 'Thu', '1', 'CS8651', '', NULL, 0),
(26, 1, 1, 'Thu', '2', 'CS8691', '', NULL, 0),
(27, 1, 1, 'Thu', '3', 'CS8691', '', NULL, 0),
(28, 1, 1, 'Thu', '4', 'CS8611', '', NULL, 0),
(29, 1, 1, 'Thu', '5', 'CS8611', '', NULL, 0),
(30, 1, 1, 'Thu', '6', 'CS8601', '', NULL, 0),
(31, 1, 1, 'Thu', '7', 'CS8601', '', NULL, 0),
(32, 1, 1, 'Thu', '8', 'CS8691', '', NULL, 0),
(33, 1, 1, 'Fri', '1', 'CS8691', '', NULL, 0),
(34, 1, 1, 'Fri', '2', 'CS8611', '', NULL, 0),
(35, 1, 1, 'Fri', '3', 'CS8611', '', NULL, 0),
(36, 1, 1, 'Fri', '4', 'CS8601', '', NULL, 0),
(37, 1, 1, 'Fri ', '5', 'HS8586', '', NULL, 0),
(38, 1, 1, 'Fri', '6', 'HS8586', '', NULL, 0),
(39, 1, 1, 'Fri', '7', 'CS8651', '', NULL, 0),
(40, 1, 1, 'Fri', '8', 'CS8611', '', NULL, 0),
(41, 1, 1, 'Sat', '1', 'CS8611', '', NULL, 0),
(42, 1, 1, 'Sat', '2', 'CS8601', '', NULL, 0),
(43, 1, 1, 'Sat', '3', 'CS8601', '', NULL, 0),
(44, 1, 1, 'Sat', '4', 'CS8602', '', NULL, 0),
(45, 1, 1, 'Sat', '5', 'CS8602', '', NULL, 0),
(46, 1, 1, 'Sat', '6', 'CS8603', '', NULL, 0),
(47, 1, 1, 'Sat', '7', 'CS8603', '', NULL, 0),
(48, 1, 1, 'Sat', '8', 'CS8601', '', NULL, 0),
(49, 11, 1, 'Mon', '1', 'CS3401', ' ', NULL, 0),
(50, 11, 1, 'Mon', '2', 'CS3452', ' ', NULL, 0),
(51, 11, 1, 'Mon', '3', 'CS3452', ' ', NULL, 0),
(52, 11, 1, 'Mon', '4', 'CS3492', ' ', NULL, 0),
(53, 11, 1, 'Mon', '5', 'CS3492', ' ', NULL, 0),
(54, 11, 1, 'Mon', '6', 'GE3451', ' ', NULL, 0),
(55, 11, 1, 'Mon', '7', 'GE3451', '', NULL, 0),
(56, 11, 1, 'Mon', '8', 'CS3452', '', NULL, 0),
(57, 11, 1, 'Tue', '1', 'CS3452', '', NULL, 0),
(58, 11, 1, 'Tue', '2', 'CS3492', '', NULL, 0),
(59, 11, 1, 'Tue', '3', 'CS3492', '', NULL, 0),
(60, 11, 1, 'Tue', '4', 'GE3451', '', NULL, 0),
(61, 11, 1, 'Tue', '5', 'CS3461', '', NULL, 0),
(62, 11, 1, 'Tue', '6', 'CS3461', '', NULL, 0),
(63, 11, 1, 'Tue', '7', 'CS3461', '', NULL, 0),
(64, 11, 1, 'Tue', '8', 'CS3492', '', NULL, 0),
(65, 11, 1, 'Wed', '1', 'CS3492', '', NULL, 0),
(66, 11, 1, 'Wed', '2', 'GE3451', '', NULL, 0),
(67, 11, 1, 'Wed', '3', 'GE3451', '', NULL, 0),
(68, 11, 1, 'Wed', '4', 'CS3462', '', NULL, 0),
(69, 11, 1, 'Wed', '5', 'CS3462', '', NULL, 0),
(70, 11, 1, 'Wed', '6', 'CS3468', '', NULL, 0),
(71, 11, 1, 'Wed', '7', 'CS3468', '', NULL, 0),
(72, 11, 1, 'Wed', '8', 'GE3451', '', NULL, 0),
(73, 11, 1, 'Thu', '1', 'GE3451', '', NULL, 0),
(74, 11, 1, 'Thu', '2', 'CS3462', '', NULL, 0),
(75, 11, 1, 'Thu', '3', 'CS3462', '', NULL, 0),
(76, 11, 1, 'Thu', '4', 'CS3468', '', NULL, 0),
(77, 11, 1, 'Thu', '5', 'CS3481', '', NULL, 0),
(78, 11, 1, 'Thu', '6', 'CS3481', '', NULL, 0),
(79, 11, 1, 'Thu', '7', 'CS3481', '', NULL, 0),
(80, 11, 1, 'Thu', '8', 'CS3462', '', NULL, 0),
(81, 11, 1, 'Fri', '1', 'CS3462', '', NULL, 0),
(82, 11, 1, 'Fri', '2', 'CS3468', '', NULL, 0),
(83, 11, 1, 'Fri', '3', 'CS3468', '', NULL, 0),
(84, 11, 1, 'Fri', '4', 'CS3401', '', NULL, 0),
(85, 11, 1, 'Fri ', '5', 'CS3401', '', NULL, 0),
(86, 11, 1, 'Fri', '6', 'CS3452', '', NULL, 0),
(87, 11, 1, 'Fri', '7', 'CS3452', '', NULL, 0),
(88, 11, 1, 'Fri', '8', 'CS3468', '', NULL, 0),
(89, 11, 1, 'Sat', '1', 'CS3468', '', NULL, 0),
(90, 11, 1, 'Sat', '2', 'CS3401', '', NULL, 0),
(91, 11, 1, 'Sat', '3', 'CS3401', '', NULL, 0),
(92, 11, 1, 'Sat', '4', 'CS3452', '', NULL, 0),
(93, 11, 1, 'Sat', '5', 'CS3491', '', NULL, 0),
(94, 11, 1, 'Sat', '6', 'CS3491', '', NULL, 0),
(95, 11, 1, 'Sat', '7', 'CS3491', '', NULL, 0),
(96, 11, 1, 'Sat', '8', 'CS3401', '', NULL, 0),
(97, 2, 1, 'Mon', '1', 'EC8095', ' ', NULL, 0),
(98, 2, 1, 'Mon', '2', 'EC8611', ' ', NULL, 0),
(99, 2, 1, 'Mon', '3', 'EC8611', ' ', NULL, 0),
(100, 2, 1, 'Mon', '4', 'EC8651', ' ', NULL, 0),
(101, 2, 1, 'Mon', '5', 'EC8651', ' ', NULL, 0),
(102, 2, 1, 'Mon', '6', 'EC8652', ' ', NULL, 0),
(103, 2, 1, 'Mon', '7', 'EC8652', '', NULL, 1),
(104, 2, 1, 'Mon', '8', 'EC8611', '', NULL, 0),
(105, 2, 1, 'Tue', '1', 'EC8611', '', NULL, 0),
(106, 2, 1, 'Tue', '2', 'EC8651', '', NULL, 1),
(107, 2, 1, 'Tue', '3', 'EC8651', '', NULL, 0),
(108, 2, 1, 'Tue', '4', 'EC8652', '', NULL, 0),
(109, 2, 1, 'Tue', '5', 'EC8661', '', NULL, 1),
(110, 2, 1, 'Tue', '6', 'EC8661', '', NULL, 0),
(111, 2, 1, 'Tue', '7', 'EC8661', '', NULL, 0),
(112, 2, 1, 'Tue', '8', 'EC8651', '', NULL, 0),
(113, 2, 1, 'Wed', '1', 'EC8651', '', NULL, 0),
(114, 2, 1, 'Wed', '2', 'EC8652', '', NULL, 0),
(115, 2, 1, 'Wed', '3', 'EC8652', '', NULL, 0),
(116, 2, 1, 'Wed', '4', 'EC8691', '', NULL, 0),
(117, 2, 1, 'Wed', '5', 'EC8691', '', NULL, 0),
(118, 2, 1, 'Wed', '6', 'EC8645', '', NULL, 0),
(119, 2, 1, 'Wed', '7', 'EC8645', '', NULL, 0),
(120, 2, 1, 'Wed', '8', 'EC8652', '', NULL, 0),
(121, 2, 1, 'Thu', '1', 'EC8652', '', NULL, 0),
(122, 2, 1, 'Thu', '2', 'EC8691', '', NULL, 0),
(123, 2, 1, 'Thu', '3', 'EC8691', '', NULL, 0),
(124, 2, 1, 'Thu', '4', 'EC8645', '', NULL, 0),
(125, 2, 1, 'Thu', '5', 'EC8681', '', NULL, 0),
(126, 2, 1, 'Thu', '6', 'EC8681', '', NULL, 0),
(127, 2, 1, 'Thu', '7', 'EC8681', '', NULL, 0),
(128, 2, 1, 'Thu', '8', 'EC8691', '', NULL, 0),
(129, 2, 1, 'Fri', '1', 'EC8691', '', NULL, 0),
(130, 2, 1, 'Fri', '2', 'EC8645', '', NULL, 0),
(131, 2, 1, 'Fri', '3', 'EC8645', '', NULL, 0),
(132, 2, 1, 'Fri', '4', 'EC8095', '', NULL, 0),
(133, 2, 1, 'Fri ', '5', 'EC8095', '', NULL, 0),
(134, 2, 1, 'Fri', '6', 'EC8611', '', NULL, 0),
(135, 2, 1, 'Fri', '7', 'EC8611', '', NULL, 0),
(136, 2, 1, 'Fri', '8', 'EC8645', '', NULL, 0),
(137, 2, 1, 'Sat', '1', 'EC8645', '', NULL, 0),
(138, 2, 1, 'Sat', '2', 'EC8095', '', NULL, 0),
(139, 2, 1, 'Sat', '3', 'EC8095', '', NULL, 0),
(140, 2, 1, 'Sat', '4', 'EC8611', '', NULL, 0),
(141, 2, 1, 'Sat', '5', 'EC8465', '', NULL, 0),
(142, 2, 1, 'Sat', '6', 'EC8465', '', NULL, 0),
(143, 2, 1, 'Sat', '7', 'EC8465', '', NULL, 0),
(144, 2, 1, 'Sat', '8', 'EC8095', '', NULL, 0),
(145, 10, 1, 'Mon', '1', 'EC3452', ' ', NULL, 0),
(146, 10, 1, 'Mon', '2', 'EC3401', ' ', NULL, 0),
(147, 10, 1, 'Mon', '3', 'EC3401', ' ', NULL, 0),
(148, 10, 1, 'Mon', '4', 'EC3451', ' ', NULL, 0),
(149, 10, 1, 'Mon', '5', 'EC3461', ' ', NULL, 0),
(150, 10, 1, 'Mon', '6', 'EC3461', ' ', NULL, 0),
(151, 10, 1, 'Mon', '7', 'EC3461', '', NULL, 1),
(152, 10, 1, 'Mon', '8', 'EC3401', '', NULL, 0),
(153, 10, 1, 'Tue', '1', 'EC3401', '', NULL, 0),
(154, 10, 1, 'Tue', '2', 'EC3451', '', NULL, 1),
(155, 10, 1, 'Tue', '3', 'EC3451', '', NULL, 0),
(156, 10, 1, 'Tue', '4', 'EC3492', '', NULL, 0),
(157, 10, 1, 'Tue', '5', 'EC3492', '', NULL, 1),
(158, 10, 1, 'Tue', '6', 'EC3491', '', NULL, 0),
(159, 10, 1, 'Tue', '7', 'EC3491', '', NULL, 0),
(160, 10, 1, 'Tue', '8', 'EC3451', '', NULL, 0),
(161, 10, 1, 'Wed', '1', 'EC3451', '', NULL, 0),
(162, 10, 1, 'Wed', '2', 'EC3492', '', NULL, 0),
(163, 10, 1, 'Wed', '3', 'EC3492', '', NULL, 0),
(164, 10, 1, 'Wed', '4', 'EC3491', '', NULL, 0),
(165, 10, 1, 'Wed', '5', 'EC3462', '', NULL, 0),
(166, 10, 1, 'Wed', '6', 'EC3462', '', NULL, 0),
(167, 10, 1, 'Wed', '7', 'EC3462', '', NULL, 0),
(168, 10, 1, 'Wed', '8', 'EC3492', '', NULL, 0),
(169, 10, 1, 'Thu', '1', 'EC3492', '', NULL, 0),
(170, 10, 1, 'Thu', '2', 'EC3491', '', NULL, 0),
(171, 10, 1, 'Thu', '3', 'EC3491', '', NULL, 0),
(172, 10, 1, 'Thu', '4', 'GE3451', '', NULL, 0),
(173, 10, 1, 'Thu', '5', 'GE3451', '', NULL, 0),
(174, 10, 1, 'Thu', '6', 'EC3452', '', NULL, 0),
(175, 10, 1, 'Thu', '7', 'EC3452', '', NULL, 0),
(176, 10, 1, 'Thu', '8', 'EC3491', '', NULL, 0),
(177, 10, 1, 'Fri', '1', 'EC3491', '', NULL, 0),
(178, 10, 1, 'Fri', '2', 'GE3451', '', NULL, 0),
(179, 10, 1, 'Fri', '3', 'GE3451', '', NULL, 0),
(180, 10, 1, 'Fri', '4', 'EC3452', '', NULL, 0),
(181, 10, 1, 'Fri ', '5', 'EC3498', '', NULL, 0),
(182, 10, 1, 'Fri', '6', 'EC3498', '', NULL, 0),
(183, 10, 1, 'Fri', '7', 'EC3498', '', NULL, 0),
(184, 10, 1, 'Fri', '8', 'GE3451', '', NULL, 0),
(185, 10, 1, 'Sat', '1', 'GE3451', '', NULL, 0),
(186, 10, 1, 'Sat', '2', 'EC3452', '', NULL, 0),
(187, 10, 1, 'Sat', '3', 'EC3452', '', NULL, 0),
(188, 10, 1, 'Sat', '4', 'EC3401', '', NULL, 0),
(189, 10, 1, 'Sat', '5', 'EC3401', '', NULL, 0),
(190, 10, 1, 'Sat', '6', 'EC3451', '', NULL, 0),
(191, 10, 1, 'Sat', '7', 'EC3451', '', NULL, 0),
(192, 10, 1, 'Sat', '8', 'EC3452', '', NULL, 0),
(193, 9, 1, 'Mon', '1', 'GE3451', ' ', NULL, 0),
(194, 9, 1, 'Mon', '2', 'EE3401', ' ', NULL, 0),
(195, 9, 1, 'Mon', '3', 'EE3401', ' ', NULL, 0),
(196, 9, 1, 'Mon', '4', 'EE3402', ' ', NULL, 0),
(197, 9, 1, 'Mon', '5', 'EE3402', ' ', NULL, 0),
(198, 9, 1, 'Mon', '6', 'EE3403', ' ', NULL, 0),
(199, 9, 1, 'Mon', '7', 'EE3403', ' ', NULL, 0),
(200, 9, 1, 'Mon', '8', 'EE3401', ' ', NULL, 0),
(201, 9, 1, 'Tue', '1', 'EE3401', ' ', NULL, 0),
(202, 9, 1, 'Tue', '2', 'EE3402', ' ', NULL, 0),
(203, 9, 1, 'Tue', '3', 'EE3402', ' ', NULL, 0),
(204, 9, 1, 'Tue', '4', 'EE3403', ' ', NULL, 0),
(205, 9, 1, 'Tue', '5', 'EE3411', ' ', NULL, 0),
(206, 9, 1, 'Tue', '6', 'EE3411', ' ', NULL, 0),
(207, 9, 1, 'Tue', '7', 'EE3411', ' ', NULL, 0),
(208, 9, 1, 'Tue', '8', 'EE3402', ' ', NULL, 0),
(209, 9, 1, 'Wed', '1', 'EE3402', ' ', NULL, 0),
(210, 9, 1, 'Wed', '2', 'EE3403', '', NULL, 0),
(211, 9, 1, 'Wed', '3', 'EE3403', '', NULL, 0),
(212, 9, 1, 'Wed', '4', 'EE3404', '', NULL, 0),
(213, 9, 1, 'Wed', '5', 'EE3404', '', NULL, 0),
(214, 9, 1, 'Wed', '6', 'EE3405', '', NULL, 0),
(215, 9, 1, 'Wed', '7', 'EE3405', '', NULL, 0),
(216, 9, 1, 'Wed', '8', 'EE3403', '', NULL, 0),
(217, 9, 1, 'Thu', '1', 'EE3403', '', NULL, 0),
(218, 9, 1, 'Thu', '2', 'EE3404', '', NULL, 0),
(219, 9, 1, 'Thu', '3', 'EE3404', '', NULL, 0),
(220, 9, 1, 'Thu', '4', 'EE3405', '', NULL, 0),
(221, 9, 1, 'Thu', '5', 'EE3412', '', NULL, 0),
(222, 9, 1, 'Thu', '6', 'EE3412', '', NULL, 0),
(223, 9, 1, 'Thu', '7', 'EE3412', '', NULL, 0),
(224, 9, 1, 'Thu', '8', 'EE3404', '', NULL, 0),
(225, 9, 1, 'Fri', '1', 'EE3404', '', NULL, 0),
(226, 9, 1, 'Fri', '2', 'EE3405', '', NULL, 0),
(227, 9, 1, 'Fri', '3', 'EE3405', '', NULL, 0),
(228, 9, 1, 'Fri', '4', 'GE3451', '', NULL, 0),
(229, 9, 1, 'Fri ', '5', 'GE3451', '', NULL, 0),
(230, 9, 1, 'Fri', '6', 'EE3401', '', NULL, 0),
(231, 9, 1, 'Fri', '7', 'EE3401', '', NULL, 0),
(232, 9, 1, 'Fri', '8', 'EE3405', '', NULL, 0),
(233, 9, 1, 'Sat', '1', 'EE3405', '', NULL, 0),
(234, 9, 1, 'Sat', '2', 'GE3451', '', NULL, 0),
(235, 9, 1, 'Sat', '3', 'GE3451', '', NULL, 0),
(236, 9, 1, 'Sat', '4', 'EE3401', '', NULL, 0),
(237, 9, 1, 'Sat', '5', 'EE3413', '', NULL, 0),
(238, 9, 1, 'Sat', '6', 'EE3413', '', NULL, 0),
(239, 9, 1, 'Sat', '7', 'EE3413', '', NULL, 0),
(240, 9, 1, 'Sat', '8', 'GE3451', '', NULL, 0),
(241, 16, 1, 'Mon', '1', 'EE8601', ' ', NULL, 0),
(242, 16, 1, 'Mon', '2', 'EE8602', ' ', NULL, 0),
(243, 16, 1, 'Mon', '3', 'EE8602', ' ', NULL, 0),
(244, 16, 1, 'Mon', '4', 'EE8603', ' ', NULL, 0),
(245, 16, 1, 'Mon', '5', 'EE8681', ' ', NULL, 0),
(246, 16, 1, 'Mon', '6', 'EE8681', ' ', NULL, 0),
(247, 16, 1, 'Mon', '7', 'EE8681', '', NULL, 1),
(248, 16, 1, 'Mon', '8', 'EE8602', '', NULL, 0),
(249, 16, 1, 'Tue', '1', 'EE8602', '', NULL, 0),
(250, 16, 1, 'Tue', '2', 'EE8603', '', NULL, 1),
(251, 16, 1, 'Tue', '3', 'EE8603', '', NULL, 0),
(252, 16, 1, 'Tue', '4', 'EE8003', '', NULL, 0),
(253, 16, 1, 'Tue', '5', 'EE8003', '', NULL, 1),
(254, 16, 1, 'Tue', '6', 'EE8001', '', NULL, 0),
(255, 16, 1, 'Tue', '7', 'EE8001', '', NULL, 0),
(256, 16, 1, 'Tue', '8', 'EE8603', '', NULL, 0),
(257, 16, 1, 'Wed', '1', 'EE8603', '', NULL, 0),
(258, 16, 1, 'Wed', '2', 'EE8003', '', NULL, 0),
(259, 16, 1, 'Wed', '3', 'EE8003', '', NULL, 0),
(260, 16, 1, 'Wed', '4', 'EE8001', '', NULL, 0),
(261, 16, 1, 'Wed', '5', 'EE8013', '', NULL, 0),
(262, 16, 1, 'Wed', '6', 'EE8013', '', NULL, 0),
(263, 16, 1, 'Wed', '7', 'EE8013', '', NULL, 0),
(264, 16, 1, 'Wed', '8', 'EE8003', '', NULL, 0),
(265, 16, 1, 'Thu', '1', 'EE8003', '', NULL, 0),
(266, 16, 1, 'Thu', '2', 'EE8001', '', NULL, 0),
(267, 16, 1, 'Thu', '3', 'EE8001', '', NULL, 0),
(268, 16, 1, 'Thu', '4', 'EE8661', '', NULL, 0),
(269, 16, 1, 'Thu', '5', 'EE8661', '', NULL, 0),
(270, 16, 1, 'Thu', '6', 'EE8601', '', NULL, 0),
(271, 16, 1, 'Thu', '7', 'EE8601', '', NULL, 0),
(272, 16, 1, 'Thu', '8', 'EE8001', '', NULL, 0),
(273, 16, 1, 'Fri', '1', 'EE8001', '', NULL, 0),
(274, 16, 1, 'Fri', '2', 'EE8611', '', NULL, 0),
(275, 16, 1, 'Fri', '3', 'EE8611', '', NULL, 0),
(276, 16, 1, 'Fri', '4', 'EE8601', '', NULL, 0),
(277, 16, 1, 'Fri ', '5', 'EE8611', '', NULL, 0),
(278, 16, 1, 'Fri', '6', 'EE8611', '', NULL, 0),
(279, 16, 1, 'Fri', '7', 'EE8611', '', NULL, 0),
(280, 16, 1, 'Fri', '8', 'EE8661', '', NULL, 0),
(281, 16, 1, 'Sat', '1', 'EE8661', '', NULL, 0),
(282, 16, 1, 'Sat', '2', 'EE8601', '', NULL, 0),
(283, 16, 1, 'Sat', '3', 'EE8601', '', NULL, 0),
(284, 16, 1, 'Sat', '4', 'EE8602', '', NULL, 0),
(285, 16, 1, 'Sat', '5', 'EE8602', '', NULL, 0),
(286, 16, 1, 'Sat', '6', 'EE8603', '', NULL, 0),
(287, 16, 1, 'Sat', '7', 'EE8603', '', NULL, 0),
(288, 16, 1, 'Sat', '8', 'EE8601', '', NULL, 0),
(289, 18, 1, 'Mon', '1', 'ME3491', ' ', NULL, 0),
(290, 18, 1, 'Mon', '2', 'ME3451', ' ', NULL, 0),
(291, 18, 1, 'Mon', '3', 'ME3451', ' ', NULL, 0),
(292, 18, 1, 'Mon', '4', 'ME3492', ' ', NULL, 0),
(293, 18, 1, 'Mon', '5', 'ME3492', ' ', NULL, 0),
(294, 18, 1, 'Mon', '6', 'ME3493', ' ', NULL, 0),
(295, 18, 1, 'Mon', '7', 'ME3493', '', NULL, 0),
(296, 18, 1, 'Mon', '8', 'ME3451', '', NULL, 0),
(297, 18, 1, 'Tue', '1', 'ME3451', '', NULL, 0),
(298, 18, 1, 'Tue', '2', 'ME3492', '', NULL, 0),
(299, 18, 1, 'Tue', '3', 'ME3492', '', NULL, 0),
(300, 18, 1, 'Tue', '4', 'ME3493', '', NULL, 0),
(301, 18, 1, 'Tue', '5', 'CE3481', '', NULL, 0),
(302, 18, 1, 'Tue', '6', 'CE3481', '', NULL, 0),
(303, 18, 1, 'Tue', '7', 'CE3481', '', NULL, 0),
(304, 18, 1, 'Tue', '8', 'ME3492', '', NULL, 0),
(305, 18, 1, 'Wed', '1', 'ME3492', '', NULL, 0),
(306, 18, 1, 'Wed', '2', 'ME3493', '', NULL, 0),
(307, 18, 1, 'Wed', '3', 'ME3493', '', NULL, 0),
(308, 18, 1, 'Wed', '4', 'ME3491', '', NULL, 0),
(309, 18, 1, 'Wed', '5', 'ME3491', '', NULL, 0),
(310, 18, 1, 'Wed', '6', 'ME3451', '', NULL, 0),
(311, 18, 1, 'Wed', '7', 'ME3451', '', NULL, 0),
(312, 18, 1, 'Wed', '8', 'ME3493', '', NULL, 0),
(313, 18, 1, 'Thu', '1', 'ME3493', '', NULL, 0),
(314, 18, 1, 'Thu', '2', 'CE3491', '', NULL, 0),
(315, 18, 1, 'Thu', '3', 'CE3491', '', NULL, 0),
(316, 18, 1, 'Thu', '4', 'GE3451', '', NULL, 0),
(317, 18, 1, 'Thu', '5', 'ME3461', '', NULL, 0),
(318, 18, 1, 'Thu', '6', 'ME3461', '', NULL, 0),
(319, 18, 1, 'Thu', '7', 'ME3461', '', NULL, 0),
(320, 18, 1, 'Thu', '8', 'CE3491', '', NULL, 0),
(321, 18, 1, 'Fri', '1', 'CE3491', '', NULL, 0),
(322, 18, 1, 'Fri', '2', 'GE3451', '', NULL, 0),
(323, 18, 1, 'Fri', '3', 'GE3451', '', NULL, 0),
(324, 18, 1, 'Fri', '4', 'ME3491', '', NULL, 0),
(325, 18, 1, 'Fri ', '5', 'ME3491', '', NULL, 0),
(326, 18, 1, 'Fri', '6', 'ME3451', '', NULL, 0),
(327, 18, 1, 'Fri', '7', 'ME3451', '', NULL, 0),
(328, 18, 1, 'Fri', '8', 'GE3451', '', NULL, 0),
(329, 18, 1, 'Sat', '1', 'GE3451', '', NULL, 0),
(330, 18, 1, 'Sat', '2', 'ME3491', '', NULL, 0),
(331, 18, 1, 'Sat', '3', 'ME3491', '', NULL, 0),
(332, 18, 1, 'Sat', '4', 'ME3451', '', NULL, 0),
(333, 18, 1, 'Sat', '5', 'ME3496', '', NULL, 0),
(334, 18, 1, 'Sat', '6', 'ME3496', '', NULL, 0),
(335, 18, 1, 'Sat', '7', 'ME3496', '', NULL, 0),
(336, 18, 1, 'Sat', '8', 'ME3491', '', NULL, 0),
(337, 7, 1, 'Mon', '1', 'ME8651', ' ', NULL, 0),
(338, 7, 1, 'Mon', '2', 'ME8691', ' ', NULL, 0),
(339, 7, 1, 'Mon', '3', 'ME8691', ' ', NULL, 0),
(340, 7, 1, 'Mon', '4', 'ME8693', ' ', NULL, 0),
(341, 7, 1, 'Mon', '5', 'ME8681', ' ', NULL, 0),
(342, 7, 1, 'Mon', '6', 'ME8681', ' ', NULL, 0),
(343, 7, 1, 'Mon', '7', 'ME8681', '', NULL, 0),
(344, 7, 1, 'Mon', '8', 'ME8691', '', NULL, 0),
(345, 7, 1, 'Tue', '1', 'ME8691', '', NULL, 0),
(346, 7, 1, 'Tue', '2', 'ME8693', '', NULL, 0),
(347, 7, 1, 'Tue', '3', 'ME8693', '', NULL, 0),
(348, 7, 1, 'Tue', '4', 'ME8692', '', NULL, 0),
(349, 7, 1, 'Tue', '5', 'ME8692', '', NULL, 0),
(350, 7, 1, 'Tue', '6', 'ME8694', '', NULL, 0),
(351, 7, 1, 'Tue', '7', 'ME8694', '', NULL, 0),
(352, 7, 1, 'Tue', '8', 'ME8693', '', NULL, 0),
(353, 7, 1, 'Wed', '1', 'ME8693', '', NULL, 0),
(354, 7, 1, 'Wed', '2', 'ME8692', '', NULL, 0),
(355, 7, 1, 'Wed', '3', 'ME8692', '', NULL, 0),
(356, 7, 1, 'Wed', '4', 'ME8694', '', NULL, 0),
(357, 7, 1, 'Wed', '5', 'ME8682', '', NULL, 0),
(358, 7, 1, 'Wed', '6', 'ME8682', '', NULL, 0),
(359, 7, 1, 'Wed', '7', 'ME8682', '', NULL, 0),
(360, 7, 1, 'Wed', '8', 'ME8692', '', NULL, 0),
(361, 7, 1, 'Thu', '1', 'ME8692', '', NULL, 0),
(362, 7, 1, 'Thu', '2', 'ME8694', '', NULL, 0),
(363, 7, 1, 'Thu', '3', 'ME8694', '', NULL, 0),
(364, 7, 1, 'Thu', '4', 'ME8695', '', NULL, 0),
(365, 7, 1, 'Thu', '5', 'ME8695', '', NULL, 0),
(366, 7, 1, 'Thu', '6', 'ME8651', '', NULL, 0),
(367, 7, 1, 'Thu', '7', 'ME8651', '', NULL, 0),
(368, 7, 1, 'Thu', '8', 'ME8694', '', NULL, 0),
(369, 7, 1, 'Fri', '1', 'ME8694', '', NULL, 0),
(370, 7, 1, 'Fri', '2', 'ME8695', '', NULL, 0),
(371, 7, 1, 'Fri', '3', 'ME8695', '', NULL, 0),
(372, 7, 1, 'Fri', '4', 'ME8651', '', NULL, 0),
(373, 7, 1, 'Fri ', '5', 'HS8581', '', NULL, 0),
(374, 7, 1, 'Fri', '6', 'HS8581', '', NULL, 0),
(375, 7, 1, 'Fri', '7', 'HS8581', '', NULL, 0),
(376, 7, 1, 'Fri', '8', 'ME8695', '', NULL, 0),
(377, 7, 1, 'Sat', '1', 'ME8695', '', NULL, 0),
(378, 7, 1, 'Sat', '2', 'ME8651', '', NULL, 0),
(379, 7, 1, 'Sat', '3', 'ME8651', '', NULL, 0),
(380, 7, 1, 'Sat', '4', 'ME8691', '', NULL, 0),
(381, 7, 1, 'Sat', '5', 'ME8691', '', NULL, 0),
(382, 7, 1, 'Sat', '6', 'ME8693', '', NULL, 0),
(383, 7, 1, 'Sat', '7', 'ME8693', '', NULL, 0),
(384, 7, 1, 'Sat', '8', 'ME8651', '', NULL, 0),
(385, 20, 1, 'Mon', '1', 'CE8601', ' ', NULL, 0),
(386, 20, 1, 'Mon', '2', 'CE8602', ' ', NULL, 0),
(387, 20, 1, 'Mon', '3', 'CE8602', ' ', NULL, 0),
(388, 20, 1, 'Mon', '4', 'CE8604', ' ', NULL, 0),
(389, 20, 1, 'Mon', '5', 'CE8604', ' ', NULL, 0),
(390, 20, 1, 'Mon', '6', 'CE8611', ' ', NULL, 0),
(391, 20, 1, 'Mon', '7', 'CE8611', '  ', NULL, 0),
(392, 20, 1, 'Mon', '8', 'CE8602', ' ', NULL, 0),
(393, 20, 1, 'Tue', '1', 'CE8602', ' ', NULL, 0),
(394, 20, 1, 'Tue', '2', 'CE8604', ' ', NULL, 0),
(395, 20, 1, 'Tue', '3', 'CE8604', ' ', NULL, 0),
(396, 20, 1, 'Tue', '4', 'CE8603', ' ', NULL, 0),
(397, 20, 1, 'Tue', '5', 'CE8603', ' ', NULL, 0),
(398, 20, 1, 'Tue', '6', 'EN8592', ' ', NULL, 0),
(399, 20, 1, 'Tue', '7', 'EN8592', ' ', NULL, 0),
(400, 20, 1, 'Tue', '8', 'CE8604', ' ', NULL, 0),
(401, 20, 1, 'Wed', '1', 'CE8604', ' ', NULL, 0),
(402, 20, 1, 'Wed', '2', 'CE8603', ' ', NULL, 0),
(403, 20, 1, 'Wed', '3', 'CE8603', ' ', NULL, 0),
(404, 20, 1, 'Wed', '4', 'EN8592', ' ', NULL, 0),
(405, 20, 1, 'Wed', '5', 'CE8612', ' ', NULL, 0),
(406, 20, 1, 'Wed', '6', 'CE8612', ' ', NULL, 0),
(407, 20, 1, 'Wed', '7', 'CE8612', ' ', NULL, 0),
(408, 20, 1, 'Wed', '8', 'CE8603', ' ', NULL, 0),
(409, 20, 1, 'Thu', '1', 'CE8603', ' ', NULL, 0),
(410, 20, 1, 'Thu', '2', 'EN8592', ' ', NULL, 0),
(411, 20, 1, 'Thu', '3', 'EN8592', ' ', NULL, 0),
(412, 20, 1, 'Thu', '4', 'CE8613', ' ', NULL, 0),
(413, 20, 1, 'Thu', '5', 'CE8613', ' ', NULL, 0),
(414, 20, 1, 'Thu', '6', 'CE8601', ' ', NULL, 0),
(415, 20, 1, 'Thu', '7', 'CE8601', ' ', NULL, 0),
(416, 20, 1, 'Thu', '8', 'EN8592', ' ', NULL, 0),
(417, 20, 1, 'Fri', '1', 'EN8592', ' ', NULL, 0),
(418, 20, 1, 'Fri', '2', 'CE8613', ' ', NULL, 0),
(419, 20, 1, 'Fri', '3', 'CE8613', ' ', NULL, 0),
(420, 20, 1, 'Fri', '4', 'CE8601', ' ', NULL, 0),
(421, 20, 1, 'Fri ', '5', 'CE8581', ' ', NULL, 0),
(422, 20, 1, 'Fri', '6', 'CE8581', ' ', NULL, 0),
(423, 20, 1, 'Fri', '7', 'CE8581', ' ', NULL, 0),
(424, 20, 1, 'Fri', '8', 'CE8613', ' ', NULL, 0),
(425, 20, 1, 'Sat', '1', 'CE8613', ' ', NULL, 0),
(426, 20, 1, 'Sat', '2', 'CE8601', ' ', NULL, 0),
(427, 20, 1, 'Sat', '3', 'CE8601', ' ', NULL, 0),
(428, 20, 1, 'Sat', '4', 'CE8602', ' ', NULL, 0),
(429, 20, 1, 'Sat', '5', 'CE8602', ' ', NULL, 0),
(430, 20, 1, 'Sat', '6', 'CE8604', ' ', NULL, 0),
(431, 20, 1, 'Sat', '7', 'CE8604', ' ', NULL, 0),
(432, 20, 1, 'Sat', '8', 'CE8601', ' ', NULL, 0),
(433, 8, 1, 'Mon', '1', 'CE3401', ' ', NULL, 0),
(434, 8, 1, 'Mon', '2', 'CE3402', ' ', NULL, 0),
(435, 8, 1, 'Mon', '3', 'CE3402', ' ', NULL, 0),
(436, 8, 1, 'Mon', '4', 'CE3403', ' ', NULL, 0),
(437, 8, 1, 'Mon', '5', 'CE3403', ' ', NULL, 0),
(438, 8, 1, 'Mon', '6', 'CE3404', ' ', NULL, 0),
(439, 8, 1, 'Mon', '7', 'CE3404', '', NULL, 0),
(440, 8, 1, 'Mon', '8', 'CE3402', '', NULL, 0),
(441, 8, 1, 'Tue', '1', 'CE3402', '', NULL, 0),
(442, 8, 1, 'Tue', '2', 'CE3403', '', NULL, 0),
(443, 8, 1, 'Tue', '3', 'CE3403', '', NULL, 0),
(444, 8, 1, 'Tue', '4', 'CE3404', '', NULL, 0),
(445, 8, 1, 'Tue', '5', 'CE8411', '', NULL, 0),
(446, 8, 1, 'Tue', '6', 'CE8411', '', NULL, 0),
(447, 8, 1, 'Tue', '7', 'CE8411', '', NULL, 0),
(448, 8, 1, 'Tue', '8', 'CE3403', '', NULL, 0),
(449, 8, 1, 'Wed', '1', 'CE3403', '', NULL, 0),
(450, 8, 1, 'Wed', '2', 'CE3404', '', NULL, 0),
(451, 8, 1, 'Wed', '3', 'CE3404', '', NULL, 0),
(452, 8, 1, 'Wed', '4', 'CE3405', '', NULL, 0),
(453, 8, 1, 'Wed', '5', 'CE3405', '', NULL, 0),
(454, 8, 1, 'Wed', '6', 'GE3451', '', NULL, 0),
(455, 8, 1, 'Wed', '7', 'GE3451', '', NULL, 0),
(456, 8, 1, 'Wed', '8', 'CE3404', '', NULL, 0),
(457, 8, 1, 'Thu', '1', 'CE3404', '', NULL, 0),
(458, 8, 1, 'Thu', '2', 'CE3405', '', NULL, 0),
(459, 8, 1, 'Thu', '3', 'CE3405', '', NULL, 0),
(460, 8, 1, 'Thu', '4', 'GE3451', '', NULL, 0),
(461, 8, 1, 'Thu', '5', 'CE3412', '', NULL, 0),
(462, 8, 1, 'Thu', '6', 'CE3412', '', NULL, 0),
(463, 8, 1, 'Thu', '7', 'CE3412', '', NULL, 0),
(464, 8, 1, 'Thu', '8', 'CE3405', '', NULL, 0),
(465, 8, 1, 'Fri', '1', 'CE3405', '', NULL, 0),
(466, 8, 1, 'Fri', '2', 'CE3451', '', NULL, 0),
(467, 8, 1, 'Fri', '3', 'CE3451', '', NULL, 0),
(468, 8, 1, 'Fri', '4', 'CE3401', '', NULL, 0),
(469, 8, 1, 'Fri ', '5', 'CS3401', '', NULL, 0),
(470, 8, 1, 'Fri', '6', 'CE3402', '', NULL, 0),
(471, 8, 1, 'Fri', '7', 'CE3402', '', NULL, 0),
(472, 8, 1, 'Fri', '8', 'GE3451', '', NULL, 0),
(473, 8, 1, 'Sat', '1', 'GE3451', '', NULL, 0),
(474, 8, 1, 'Sat', '2', 'CE3401', '', NULL, 0),
(475, 8, 1, 'Sat', '3', 'CE3401', '', NULL, 0),
(476, 8, 1, 'Sat', '4', 'CE3402', '', NULL, 0),
(477, 8, 1, 'Sat', '5', 'GE3413', '', NULL, 0),
(478, 8, 1, 'Sat', '6', 'GE3413', '', NULL, 0),
(479, 8, 1, 'Sat', '7', 'GE3413', '', NULL, 0),
(480, 8, 1, 'Sat', '8', 'CE3401', '', NULL, 0),
(481, 6, 2, 'Mon', '1', 'MBA101', ' ', NULL, 0),
(482, 6, 2, 'Mon', '2', 'MBA102', ' ', NULL, 0),
(483, 6, 2, 'Mon', '3', 'MBA103', ' ', NULL, 0),
(484, 6, 2, 'Mon', '4', 'MBA102', ' ', NULL, 0),
(485, 6, 2, 'Tue', '1', 'MBA102', '', NULL, 0),
(486, 6, 2, 'Tue', '2', 'MBA107', '', NULL, 0),
(487, 6, 2, 'Tue', '3', 'MBA107', '', NULL, 0),
(488, 6, 2, 'Tue', '4', 'MBA103', '', NULL, 0),
(489, 6, 2, 'Wed', '1', 'MBA103', '', NULL, 0),
(490, 6, 2, 'Wed', '2', 'MBA104', '', NULL, 0),
(491, 6, 2, 'Wed', '3', 'MBA105', '', NULL, 0),
(492, 6, 2, 'Wed', '4', 'MBA104', '', NULL, 0),
(493, 6, 2, 'Thu', '1', 'MBA104', '', NULL, 0),
(494, 6, 2, 'Thu', '2', 'MBA108', '', NULL, 0),
(495, 6, 2, 'Thu', '3', 'MBA108', '', NULL, 0),
(496, 6, 2, 'Thu', '4', 'MBA105', '', NULL, 0),
(497, 6, 2, 'Fri', '1', 'MBA105', '', NULL, 0),
(498, 6, 2, 'Fri', '2', 'MBA106', '', NULL, 0),
(499, 6, 2, 'Fri', '3', 'MBA101', '', NULL, 0),
(500, 6, 2, 'Fri', '4', 'MBA106', '', NULL, 0),
(501, 6, 2, 'Sat', '1', 'MBA106', '', NULL, 0),
(502, 6, 2, 'Sat', '2', 'MBA102', '', NULL, 0),
(503, 6, 2, 'Sat', '3', 'MBA103', '', NULL, 0),
(504, 6, 2, 'Sat', '4', 'MBA101', '', NULL, 0),
(505, 1, 1, 'Monday', '1', 'Association', '', NULL, 0),
(506, 1, 1, 'Monday', '2', 'Placement training', '', NULL, 0),
(507, 1, 1, 'Monday', '3', 'CS8601', '', NULL, 0),
(508, 1, 1, 'Monday', '4', 'CS8661', '', NULL, 0),
(509, 1, 1, 'Monday', '5', 'CS8611', '', NULL, 0),
(510, 1, 1, 'Monday', '6', 'CS8602', '', NULL, 0),
(511, 1, 1, 'Monday', '7', 'CS8651', '', NULL, 0),
(512, 1, 1, 'Monday', '8', 'Association', '', NULL, 0),
(513, 12, 28, 'Monday', '1', 'Advisor Ward meet', '', NULL, 0),
(514, 12, 28, 'Monday', '2', 'Library', '', NULL, 0),
(515, 12, 28, 'Monday', '3', 'Association', '', NULL, 0),
(516, 12, 28, 'Monday', '4', 'Library', '', NULL, 0),
(517, 12, 28, 'Monday', '5', 'Association', '', NULL, 0),
(518, 12, 28, 'Monday', '6', 'Association', '', NULL, 0),
(519, 12, 28, 'Monday', '7', 'Placement training', '', NULL, 0),
(520, 12, 28, 'Monday', '8', 'Advisor Ward meet', '', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `erp_transport`
--

CREATE TABLE `erp_transport` (
  `tr_id` bigint(20) NOT NULL COMMENT 'transport id',
  `tr_routeno` int(10) NOT NULL COMMENT 'transport route no',
  `tr_routename` varchar(20) NOT NULL COMMENT 'transport route name',
  `tr_stop` varchar(20) NOT NULL COMMENT 'transport stop name',
  `tr_pickup` time NOT NULL COMMENT 'pickup time',
  `tr_drop` time NOT NULL COMMENT 'drop time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `erp_tt_type`
--

CREATE TABLE `erp_tt_type` (
  `type_id` bigint(20) NOT NULL,
  `type_title` varchar(30) NOT NULL,
  `type_hours` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `erp_tt_type`
--

INSERT INTO `erp_tt_type` (`type_id`, `type_title`, `type_hours`) VALUES
(1, 'General', 8),
(2, 'MBA', 4),
(3, 'Special Timetable', 4),
(4, 'MBA Timetable', 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `res_post_status_vw`
-- (See below for the actual view)
--
CREATE TABLE `res_post_status_vw` (
`exam_id` bigint(20)
,`cls_startyr` year(4)
,`cls_endyr` year(4)
,`cls_course` varchar(20)
,`cls_dept` varchar(50)
,`cls_sem` varchar(10)
,`res_sts` varchar(10)
,`cls_id` bigint(20)
,`ce_exam` varchar(30)
,`sub_name` varchar(50)
,`f_fname` varchar(20)
,`f_lname` varchar(20)
);

-- --------------------------------------------------------

--
-- Structure for view `erp_mark_status_vw`
--
DROP TABLE IF EXISTS `erp_mark_status_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `erp_mark_status_vw`  AS SELECT `erp_class`.`cls_id` AS `cls_id`, `erp_class`.`cls_startyr` AS `cls_startyr`, `erp_class`.`cls_endyr` AS `cls_endyr`, `erp_class`.`cls_dept` AS `cls_dept`, `erp_class`.`cls_sem` AS `cls_sem`, `erp_class`.`cls_course` AS `cls_course`, `erp_createexam`.`ce_exam` AS `ce_exam`, `erp_mark`.`mark_publish` AS `mark_publish`, count(case when `erp_mark`.`mark_publish` > 90 then 1 end) AS `90-100`, count(case when `erp_mark`.`mark_publish` > 80 and `erp_mark`.`mark_publish` <= 90 then 1 end) AS `80-90`, count(case when `erp_mark`.`mark_publish` > 70 and `erp_mark`.`mark_publish` <= 80 then 1 end) AS `70-80`, count(case when `erp_mark`.`mark_publish` > 60 and `erp_mark`.`mark_publish` <= 70 then 1 end) AS `60-70`, count(case when `erp_mark`.`mark_publish` > 50 and `erp_mark`.`mark_publish` <= 60 then 1 end) AS `50-60`, count(case when `erp_mark`.`mark_publish` > 40 and `erp_mark`.`mark_publish` <= 50 then 1 end) AS `40-50`, count(case when `erp_mark`.`mark_publish` > 30 and `erp_mark`.`mark_publish` <= 40 then 1 end) AS `30-40`, count(case when `erp_mark`.`mark_publish` > 20 and `erp_mark`.`mark_publish` <= 30 then 1 end) AS `20-30`, count(case when `erp_mark`.`mark_publish` > 0 and `erp_mark`.`mark_publish` <= 20 then 1 end) AS `0-20` FROM (((`erp_class` join `erp_createexam` on(`erp_class`.`cls_id` = `erp_createexam`.`cls_id`)) join `erp_exam` on(`erp_exam`.`ce_id` = `erp_createexam`.`ce_id`)) join `erp_mark` on(`erp_mark`.`ce_id` = `erp_createexam`.`ce_id`)) GROUP BY `erp_createexam`.`cls_id`, `erp_createexam`.`ce_exam` ;

-- --------------------------------------------------------

--
-- Structure for view `erp_n_circular`
--
DROP TABLE IF EXISTS `erp_n_circular`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `erp_n_circular`  AS SELECT `erp_news`.`news_id` AS `news_id`, `erp_news`.`news_title` AS `news_title`, `erp_news`.`news_desc` AS `news_desc`, `erp_news`.`news_link` AS `news_link`, `erp_news`.`news_type` AS `news_type`, `erp_news`.`news_img` AS `news_img`, `erp_news`.`news_status` AS `news_status`, `erp_news`.`news_postby` AS `news_postby` FROM `erp_news` WHERE `erp_news`.`news_type` = 'circular' ;

-- --------------------------------------------------------

--
-- Structure for view `erp_n_events`
--
DROP TABLE IF EXISTS `erp_n_events`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `erp_n_events`  AS SELECT `erp_news`.`news_id` AS `news_id`, `erp_news`.`news_title` AS `news_title`, `erp_news`.`news_desc` AS `news_desc`, `erp_news`.`news_link` AS `news_link`, `erp_news`.`news_type` AS `news_type`, `erp_news`.`news_img` AS `news_img`, `erp_news`.`news_status` AS `news_status`, `erp_news`.`news_postby` AS `news_postby` FROM `erp_news` WHERE `erp_news`.`news_type` = 'events' ;

-- --------------------------------------------------------

--
-- Structure for view `erp_n_news`
--
DROP TABLE IF EXISTS `erp_n_news`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `erp_n_news`  AS SELECT `erp_news`.`news_id` AS `news_id`, `erp_news`.`news_title` AS `news_title`, `erp_news`.`news_desc` AS `news_desc`, `erp_news`.`news_link` AS `news_link`, `erp_news`.`news_type` AS `news_type`, `erp_news`.`news_img` AS `news_img`, `erp_news`.`news_status` AS `news_status`, `erp_news`.`news_postby` AS `news_postby` FROM `erp_news` WHERE `erp_news`.`news_type` = 'news' ;

-- --------------------------------------------------------

--
-- Structure for view `erp_n_performer`
--
DROP TABLE IF EXISTS `erp_n_performer`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `erp_n_performer`  AS SELECT `erp_news`.`news_id` AS `news_id`, `erp_news`.`news_title` AS `news_title`, `erp_news`.`news_desc` AS `news_desc`, `erp_news`.`news_link` AS `news_link`, `erp_news`.`news_type` AS `news_type`, `erp_news`.`news_img` AS `news_img`, `erp_news`.`news_status` AS `news_status`, `erp_news`.`news_postby` AS `news_postby` FROM `erp_news` WHERE `erp_news`.`news_type` = 'performer' ;

-- --------------------------------------------------------

--
-- Structure for view `erp_n_thought`
--
DROP TABLE IF EXISTS `erp_n_thought`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `erp_n_thought`  AS SELECT `erp_news`.`news_id` AS `news_id`, `erp_news`.`news_title` AS `news_title`, `erp_news`.`news_desc` AS `news_desc`, `erp_news`.`news_link` AS `news_link`, `erp_news`.`news_type` AS `news_type`, `erp_news`.`news_img` AS `news_img`, `erp_news`.`news_status` AS `news_status`, `erp_news`.`news_postby` AS `news_postby` FROM `erp_news` WHERE `erp_news`.`news_type` = 'thought' ;

-- --------------------------------------------------------

--
-- Structure for view `erp_stu_count_vw`
--
DROP TABLE IF EXISTS `erp_stu_count_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `erp_stu_count_vw`  AS SELECT `erp_class`.`cls_course` AS `course`, `erp_class`.`cls_startyr` AS `startyear`, `erp_class`.`cls_endyr` AS `endyear`, `erp_class`.`cls_sem` AS `semester`, `erp_class`.`cls_dept` AS `dept`, `erp_class`.`cls_deptname` AS `deptname`, `erp_student`.`cls_id` AS `classid`, sum(`erp_student`.`stu_gender` = 'Male') AS `male`, sum(`erp_student`.`stu_gender` = 'Female') AS `female`, count(`erp_student`.`cls_id`) AS `counts` FROM (`erp_class` join `erp_student` on(`erp_student`.`cls_id` = `erp_class`.`cls_id`)) GROUP BY `erp_class`.`cls_id` ;

-- --------------------------------------------------------

--
-- Structure for view `res_post_status_vw`
--
DROP TABLE IF EXISTS `res_post_status_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `res_post_status_vw`  AS SELECT `erp_exam`.`exam_id` AS `exam_id`, `erp_class`.`cls_startyr` AS `cls_startyr`, `erp_class`.`cls_endyr` AS `cls_endyr`, `erp_class`.`cls_course` AS `cls_course`, `erp_class`.`cls_dept` AS `cls_dept`, `erp_class`.`cls_sem` AS `cls_sem`, if(`erp_mark`.`mark_publish`,'Posted','Not Posted') AS `res_sts`, `erp_createexam`.`cls_id` AS `cls_id`, `erp_createexam`.`ce_exam` AS `ce_exam`, `erp_subject`.`sub_name` AS `sub_name`, `erp_faculty`.`f_fname` AS `f_fname`, `erp_faculty`.`f_lname` AS `f_lname` FROM (((((`erp_exam` left join `erp_createexam` on(`erp_exam`.`ce_id` = `erp_createexam`.`ce_id`)) left join `erp_mark` on(`erp_exam`.`exam_id` = `erp_mark`.`exam_id`)) join `erp_subject` on(`erp_subject`.`tt_subcode` = `erp_exam`.`tt_subcode`)) join `erp_faculty` on(`erp_subject`.`f_id` = `erp_faculty`.`f_id`)) join `erp_class` on(`erp_class`.`cls_id` = `erp_createexam`.`cls_id`)) GROUP BY `erp_exam`.`exam_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `erp_attact`
--
ALTER TABLE `erp_attact`
  ADD PRIMARY KEY (`att_actid`);

--
-- Indexes for table `erp_attendance`
--
ALTER TABLE `erp_attendance`
  ADD PRIMARY KEY (`att_id`);

--
-- Indexes for table `erp_calender`
--
ALTER TABLE `erp_calender`
  ADD PRIMARY KEY (`cal_id`);

--
-- Indexes for table `erp_category`
--
ALTER TABLE `erp_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `erp_class`
--
ALTER TABLE `erp_class`
  ADD PRIMARY KEY (`cls_id`);

--
-- Indexes for table `erp_createexam`
--
ALTER TABLE `erp_createexam`
  ADD PRIMARY KEY (`ce_id`);

--
-- Indexes for table `erp_exam`
--
ALTER TABLE `erp_exam`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `erp_faculty`
--
ALTER TABLE `erp_faculty`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `erp_fees`
--
ALTER TABLE `erp_fees`
  ADD PRIMARY KEY (`fee_id`);

--
-- Indexes for table `erp_gallery`
--
ALTER TABLE `erp_gallery`
  ADD PRIMARY KEY (`g_id`);

--
-- Indexes for table `erp_hostel`
--
ALTER TABLE `erp_hostel`
  ADD PRIMARY KEY (`h_id`);

--
-- Indexes for table `erp_img`
--
ALTER TABLE `erp_img`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `erp_leave`
--
ALTER TABLE `erp_leave`
  ADD PRIMARY KEY (`lv_id`);

--
-- Indexes for table `erp_leave_alt`
--
ALTER TABLE `erp_leave_alt`
  ADD PRIMARY KEY (`la_id`);

--
-- Indexes for table `erp_login`
--
ALTER TABLE `erp_login`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `erp_mark`
--
ALTER TABLE `erp_mark`
  ADD PRIMARY KEY (`mark_id`);

--
-- Indexes for table `erp_markact`
--
ALTER TABLE `erp_markact`
  ADD PRIMARY KEY (`markact_id`);

--
-- Indexes for table `erp_news`
--
ALTER TABLE `erp_news`
  ADD PRIMARY KEY (`news_id`);

--
-- Indexes for table `erp_notification`
--
ALTER TABLE `erp_notification`
  ADD PRIMARY KEY (`no_id`);

--
-- Indexes for table `erp_role`
--
ALTER TABLE `erp_role`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `erp_schedule`
--
ALTER TABLE `erp_schedule`
  ADD PRIMARY KEY (`sc_id`);

--
-- Indexes for table `erp_student`
--
ALTER TABLE `erp_student`
  ADD PRIMARY KEY (`stu_id`);

--
-- Indexes for table `erp_subject`
--
ALTER TABLE `erp_subject`
  ADD PRIMARY KEY (`sub_id`);

--
-- Indexes for table `erp_test`
--
ALTER TABLE `erp_test`
  ADD PRIMARY KEY (`test_id`);

--
-- Indexes for table `erp_timetable`
--
ALTER TABLE `erp_timetable`
  ADD PRIMARY KEY (`tt_id`);

--
-- Indexes for table `erp_transport`
--
ALTER TABLE `erp_transport`
  ADD PRIMARY KEY (`tr_id`);

--
-- Indexes for table `erp_tt_type`
--
ALTER TABLE `erp_tt_type`
  ADD PRIMARY KEY (`type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `erp_attact`
--
ALTER TABLE `erp_attact`
  MODIFY `att_actid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'attendance activity id';

--
-- AUTO_INCREMENT for table `erp_attendance`
--
ALTER TABLE `erp_attendance`
  MODIFY `att_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'attendance id';

--
-- AUTO_INCREMENT for table `erp_calender`
--
ALTER TABLE `erp_calender`
  MODIFY `cal_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Calender id';

--
-- AUTO_INCREMENT for table `erp_category`
--
ALTER TABLE `erp_category`
  MODIFY `cat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'category id';

--
-- AUTO_INCREMENT for table `erp_class`
--
ALTER TABLE `erp_class`
  MODIFY `cls_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Class id';

--
-- AUTO_INCREMENT for table `erp_createexam`
--
ALTER TABLE `erp_createexam`
  MODIFY `ce_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Create Exam id';

--
-- AUTO_INCREMENT for table `erp_exam`
--
ALTER TABLE `erp_exam`
  MODIFY `exam_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Exam id';

--
-- AUTO_INCREMENT for table `erp_fees`
--
ALTER TABLE `erp_fees`
  MODIFY `fee_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'fees id';

--
-- AUTO_INCREMENT for table `erp_gallery`
--
ALTER TABLE `erp_gallery`
  MODIFY `g_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Gallery id';

--
-- AUTO_INCREMENT for table `erp_hostel`
--
ALTER TABLE `erp_hostel`
  MODIFY `h_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Hostel id';

--
-- AUTO_INCREMENT for table `erp_img`
--
ALTER TABLE `erp_img`
  MODIFY `img_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Image id';

--
-- AUTO_INCREMENT for table `erp_leave`
--
ALTER TABLE `erp_leave`
  MODIFY `lv_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Leave id';

--
-- AUTO_INCREMENT for table `erp_leave_alt`
--
ALTER TABLE `erp_leave_alt`
  MODIFY `la_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'leave alter id';

--
-- AUTO_INCREMENT for table `erp_mark`
--
ALTER TABLE `erp_mark`
  MODIFY `mark_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'mark id';

--
-- AUTO_INCREMENT for table `erp_markact`
--
ALTER TABLE `erp_markact`
  MODIFY `markact_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'mark activity id ';

--
-- AUTO_INCREMENT for table `erp_news`
--
ALTER TABLE `erp_news`
  MODIFY `news_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'news id', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `erp_notification`
--
ALTER TABLE `erp_notification`
  MODIFY `no_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_role`
--
ALTER TABLE `erp_role`
  MODIFY `r_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `erp_schedule`
--
ALTER TABLE `erp_schedule`
  MODIFY `sc_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'scedule id', AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `erp_subject`
--
ALTER TABLE `erp_subject`
  MODIFY `sub_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'subject id', AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `erp_test`
--
ALTER TABLE `erp_test`
  MODIFY `test_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'test id ', AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `erp_timetable`
--
ALTER TABLE `erp_timetable`
  MODIFY `tt_id` int(200) NOT NULL AUTO_INCREMENT COMMENT 'timetable_id (autu_increment)', AUTO_INCREMENT=521;

--
-- AUTO_INCREMENT for table `erp_transport`
--
ALTER TABLE `erp_transport`
  MODIFY `tr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'transport id';

--
-- AUTO_INCREMENT for table `erp_tt_type`
--
ALTER TABLE `erp_tt_type`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
