-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2023 at 06:56 AM
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

--
-- Dumping data for table `erp_faculty`
--

INSERT INTO `erp_faculty` (`f_id`, `f_fname`, `f_lname`, `f_dob`, `f_gender`, `f_dept`, `f_designation`, `f_qualification`, `f_exp`, `f_role`, `f_doj`, `f_mobile`, `f_email`, `f_img`, `cls_id`, `f_mlang`, `f_mstatus`, `f_idmark`, `f_klang`, `f_pob`, `f_bloodgrp`, `f_pdoctor`, `f_pdoctorno`, `f_emgno`, `f_disability`, `f_hobbies`, `f_nationality`, `f_religion`, `f_community`, `f_caste`, `f_add`, `f_city`, `f_state`, `f_zip`, `f_padd`, `f_aadhaarno`, `f_voterid`, `f_ppno`, `f_panno`, `f_univspec`, `f_yoc`, `f_teachexp`, `f_projguide`, `f_indexp`, `f_pastemp`, `f_hostel`, `f_transport`, `f_food`, `f_child`, `f_childinsame`, `f_childinother`, `f_status`, `f_bioid`, `mobile_token`, `f_spin`, `last_otp`) VALUES
('Admin', 'Administrator', '', '0000-00-00', '', '', '', '', '', '1', NULL, '', '', '', 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0000', '', 0, 0, '', '', '', '', '', '', '', 'Active', '', '', '', '');

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

--
-- Dumping data for table `erp_login`
--

INSERT INTO `erp_login` (`log_id`, `log_pwd`, `log_session`, `log_status`, `log_secqn`, `log_ans`) VALUES
('Admin', 'Admin@123', '2023-12-12 05:51:32', 1, '', '');

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
  `r_access` varchar(300) NOT NULL COMMENT 'role access',
  `r_desc` varchar(20) NOT NULL COMMENT 'role description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `erp_role`
--

INSERT INTO `erp_role` (`r_id`, `r_rolename`, `r_access`, `r_desc`) VALUES
(1, 'Admin', 'home,dashboard,admin_module,attendance_posting,result_posting,reports,gallery,profile,view_calendar,change_password', 'All Access');

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
-- Indexes for table `erp_sem`
--
ALTER TABLE `erp_sem`
  ADD PRIMARY KEY (`sem_id`);

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
  MODIFY `news_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'news id';

--
-- AUTO_INCREMENT for table `erp_notification`
--
ALTER TABLE `erp_notification`
  MODIFY `no_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_role`
--
ALTER TABLE `erp_role`
  MODIFY `r_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'role id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `erp_schedule`
--
ALTER TABLE `erp_schedule`
  MODIFY `sc_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'scedule id';

--
-- AUTO_INCREMENT for table `erp_sem`
--
ALTER TABLE `erp_sem`
  MODIFY `sem_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `erp_subject`
--
ALTER TABLE `erp_subject`
  MODIFY `sub_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'subject id';

--
-- AUTO_INCREMENT for table `erp_test`
--
ALTER TABLE `erp_test`
  MODIFY `test_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'test id ';

--
-- AUTO_INCREMENT for table `erp_timetable`
--
ALTER TABLE `erp_timetable`
  MODIFY `tt_id` int(200) NOT NULL AUTO_INCREMENT COMMENT 'timetable_id (autu_increment)';

--
-- AUTO_INCREMENT for table `erp_transport`
--
ALTER TABLE `erp_transport`
  MODIFY `tr_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'transport id';

--
-- AUTO_INCREMENT for table `erp_tt_type`
--
ALTER TABLE `erp_tt_type`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
