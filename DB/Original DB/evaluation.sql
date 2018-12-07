-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2018 at 09:27 AM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evaluation`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblevaluationanswer`
--

CREATE TABLE `tblevaluationanswer` (
  `EvaluationAnswerId` int(11) NOT NULL,
  `EvaluationId` int(11) NOT NULL,
  `EvaluatorId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `AnswerText` text NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblmstconfiguration`
--

CREATE TABLE `tblmstconfiguration` (
  `ConfigurationId` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` varchar(100) NOT NULL,
  `DisplayText` varchar(100) DEFAULT NULL,
  `Description` text,
  `DisplayOrder` int(4) NOT NULL DEFAULT '0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstconfiguration`
--

INSERT INTO `tblmstconfiguration` (`ConfigurationId`, `Key`, `Value`, `DisplayText`, `Description`, `DisplayOrder`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'AnswerType', '1', 'Descriptive', 'It store descriptive answers.', 0, b'1', 1, '2018-12-07 06:31:29', 1, '2018-12-07 06:31:29'),
(2, 'AnswerType', '2', 'Numeric', 'It store numeric answers.', 0, b'1', 1, '2018-12-07 06:34:45', 1, '2018-12-07 06:34:45'),
(3, 'AnswerType', '3', 'MCQ', 'It store MCQ Answers.', 0, b'1', 1, '2018-12-07 06:34:45', 1, '2018-12-07 06:34:45'),
(4, 'EvaluationStatus', '0', 'Pending', NULL, 0, b'1', 1, '2018-12-07 06:43:08', 1, '2018-12-07 06:43:08'),
(5, 'EvaluationStatus', '2', 'In Progress', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27'),
(6, 'EvaluationStatus', '1', 'Submitted', NULL, 0, b'1', 1, '2018-12-07 06:44:27', 1, '2018-12-07 06:44:27');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstdepartment`
--

CREATE TABLE `tblmstdepartment` (
  `DepartmentId` int(11) NOT NULL,
  `DepartmentName` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstdepartment`
--

INSERT INTO `tblmstdepartment` (`DepartmentId`, `DepartmentName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Admin', b'1', 1, '2018-12-07 07:39:32', 1, '2018-12-07 07:39:32'),
(2, 'Human Resource', b'1', 1, '2018-12-07 07:41:31', 1, '2018-12-07 07:41:31'),
(3, 'Development', b'1', 1, '2018-12-07 07:41:31', 1, '2018-12-07 07:41:31'),
(4, 'Staffing', b'1', 1, '2018-12-07 07:41:31', 1, '2018-12-07 07:41:31'),
(5, 'Marketing', b'1', 1, '2018-12-07 07:41:31', 1, '2018-12-07 07:41:31'),
(6, 'Head Department', b'1', 1, '2018-12-07 08:11:58', 1, '2018-12-07 08:11:58');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstempevaluation`
--

CREATE TABLE `tblmstempevaluation` (
  `EvaluationId` int(11) NOT NULL,
  `EvaluationTypeId` int(11) NOT NULL,
  `EvaluationDescription` text,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblmstempevaluator`
--

CREATE TABLE `tblmstempevaluator` (
  `EmployeeEvaluatorId` int(11) NOT NULL,
  `EvaluationId` int(11) NOT NULL,
  `EvaluatorId` int(11) NOT NULL,
  `StatusId` bit(1) NOT NULL DEFAULT b'0',
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblmstevaluationtype`
--

CREATE TABLE `tblmstevaluationtype` (
  `EvaluationTypeId` int(11) NOT NULL,
  `EvaluationTypeName` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblmstjobtitle`
--

CREATE TABLE `tblmstjobtitle` (
  `JobTitleId` int(11) NOT NULL,
  `DepartmentId` int(11) NOT NULL,
  `JobTitleName` varchar(100) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstjobtitle`
--

INSERT INTO `tblmstjobtitle` (`JobTitleId`, `DepartmentId`, `JobTitleName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 'Office Administrator', b'1', 1, '2018-12-07 07:42:32', 1, '2018-12-07 07:42:32'),
(2, 2, 'HR Executive', b'1', 1, '2018-12-07 07:49:00', 1, '2018-12-07 07:49:00'),
(3, 2, 'Sr. HR Executive', b'1', 1, '2018-12-07 07:49:00', 1, '2018-12-07 07:49:00'),
(4, 2, 'HR Manager', b'1', 1, '2018-12-07 07:49:00', 1, '2018-12-07 07:49:00'),
(5, 3, 'PHP Developer', b'1', 1, '2018-12-07 07:57:00', 1, '2018-12-07 07:57:00'),
(6, 3, 'Front-End Developer', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(7, 3, 'Wordpress Developer', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(8, 3, '.Net Developer', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(9, 3, 'Quality Analyst', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(10, 3, 'Project and Product Lead', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(11, 3, 'Project Manager', b'1', 1, '2018-12-07 07:57:01', 1, '2018-12-07 07:57:01'),
(12, 4, 'Technical Recruiter', b'1', 1, '2018-12-07 07:59:25', 1, '2018-12-07 07:59:25'),
(13, 4, 'Sr. Technical Recruiter', b'1', 1, '2018-12-07 07:59:25', 1, '2018-12-07 07:59:25'),
(14, 5, 'Business Development Executive', b'1', 1, '2018-12-07 08:00:25', 1, '2018-12-07 08:00:25'),
(15, 6, 'CEO', b'1', 1, '2018-12-07 08:12:42', 1, '2018-12-07 08:12:42'),
(16, 6, 'CTO', b'1', 1, '2018-12-07 08:13:44', 1, '2018-12-07 08:13:44'),
(17, 6, 'Managing Director', b'1', 1, '2018-12-07 08:13:44', 1, '2018-12-07 08:13:44');

-- --------------------------------------------------------

--
-- Table structure for table `tblmstquestion`
--

CREATE TABLE `tblmstquestion` (
  `QuestionId` int(11) NOT NULL,
  `QuestionText` text NOT NULL,
  `AnswerTypeId` int(11) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblmstuserrole`
--

CREATE TABLE `tblmstuserrole` (
  `RoleId` int(11) NOT NULL,
  `RoleName` varchar(50) NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblmstuserrole`
--

INSERT INTO `tblmstuserrole` (`RoleId`, `RoleName`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 'Admin', b'1', 1, '2018-12-07 07:24:43', 1, '2018-12-07 07:24:43'),
(2, 'HR', b'1', 1, '2018-12-07 07:24:43', 1, '2018-12-07 07:24:43'),
(3, 'Employee', b'1', 1, '2018-12-07 07:24:43', 1, '2018-12-07 07:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `tblquestionoptions`
--

CREATE TABLE `tblquestionoptions` (
  `QuestionOptionId` int(11) NOT NULL,
  `QuestionId` int(11) NOT NULL,
  `OptionValue` text NOT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `UserId` int(11) NOT NULL,
  `RoleId` int(11) NOT NULL,
  `JobTitleId` int(11) NOT NULL,
  `LineManagerId` int(11) NOT NULL DEFAULT '0',
  `FirstName` varchar(50) DEFAULT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `LastName` varchar(50) DEFAULT NULL,
  `EmployeeId` varchar(50) DEFAULT '0',
  `EmailAddress` varchar(100) NOT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `IsActive` bit(1) NOT NULL DEFAULT b'1',
  `CreatedBy` int(11) NOT NULL DEFAULT '1',
  `CreatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdatedBy` int(11) NOT NULL DEFAULT '1',
  `UpdatedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`UserId`, `RoleId`, `JobTitleId`, `LineManagerId`, `FirstName`, `MiddleName`, `LastName`, `EmployeeId`, `EmailAddress`, `Password`, `IsActive`, `CreatedBy`, `CreatedOn`, `UpdatedBy`, `UpdatedOn`) VALUES
(1, 1, 0, 0, 'IT', 'Admin', 'Developer', NULL, 'it@theopeneyes.com', '25d55ad283aa400af464c76d713c07ad', b'1', 1, '2018-12-07 05:24:11', 1, '2018-12-07 05:24:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblevaluationanswer`
--
ALTER TABLE `tblevaluationanswer`
  ADD PRIMARY KEY (`EvaluationAnswerId`);

--
-- Indexes for table `tblmstconfiguration`
--
ALTER TABLE `tblmstconfiguration`
  ADD PRIMARY KEY (`ConfigurationId`);

--
-- Indexes for table `tblmstdepartment`
--
ALTER TABLE `tblmstdepartment`
  ADD PRIMARY KEY (`DepartmentId`);

--
-- Indexes for table `tblmstempevaluation`
--
ALTER TABLE `tblmstempevaluation`
  ADD PRIMARY KEY (`EvaluationId`);

--
-- Indexes for table `tblmstempevaluator`
--
ALTER TABLE `tblmstempevaluator`
  ADD PRIMARY KEY (`EmployeeEvaluatorId`);

--
-- Indexes for table `tblmstevaluationtype`
--
ALTER TABLE `tblmstevaluationtype`
  ADD PRIMARY KEY (`EvaluationTypeId`);

--
-- Indexes for table `tblmstjobtitle`
--
ALTER TABLE `tblmstjobtitle`
  ADD PRIMARY KEY (`JobTitleId`);

--
-- Indexes for table `tblmstquestion`
--
ALTER TABLE `tblmstquestion`
  ADD PRIMARY KEY (`QuestionId`);

--
-- Indexes for table `tblmstuserrole`
--
ALTER TABLE `tblmstuserrole`
  ADD PRIMARY KEY (`RoleId`);

--
-- Indexes for table `tblquestionoptions`
--
ALTER TABLE `tblquestionoptions`
  ADD PRIMARY KEY (`QuestionOptionId`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblevaluationanswer`
--
ALTER TABLE `tblevaluationanswer`
  MODIFY `EvaluationAnswerId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmstconfiguration`
--
ALTER TABLE `tblmstconfiguration`
  MODIFY `ConfigurationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblmstdepartment`
--
ALTER TABLE `tblmstdepartment`
  MODIFY `DepartmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblmstempevaluation`
--
ALTER TABLE `tblmstempevaluation`
  MODIFY `EvaluationId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmstempevaluator`
--
ALTER TABLE `tblmstempevaluator`
  MODIFY `EmployeeEvaluatorId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmstevaluationtype`
--
ALTER TABLE `tblmstevaluationtype`
  MODIFY `EvaluationTypeId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmstjobtitle`
--
ALTER TABLE `tblmstjobtitle`
  MODIFY `JobTitleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblmstquestion`
--
ALTER TABLE `tblmstquestion`
  MODIFY `QuestionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tblmstuserrole`
--
ALTER TABLE `tblmstuserrole`
  MODIFY `RoleId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblquestionoptions`
--
ALTER TABLE `tblquestionoptions`
  MODIFY `QuestionOptionId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;