-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 04, 2022 at 10:36 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ovas_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment_list`
--

CREATE TABLE `appointment_list` (
  `id` int(30) NOT NULL,
  `code` varchar(100) NOT NULL,
  `schedule` date NOT NULL,
  `owner_name` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `category_id` int(30) NOT NULL,
  `breed` text NOT NULL,
  `age` varchar(50) NOT NULL,
  `service_ids` text DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment_list`
--

INSERT INTO `appointment_list` (`id`, `code`, `schedule`, `owner_name`, `contact`, `email`, `address`, `category_id`, `breed`, `age`, `service_ids`, `status`, `date_created`, `date_updated`) VALUES
(1, 'OVAS-2022010001', '2022-01-04', 'John D Smith', '0912345789', 'jsmith@sample.com', 'Here City', 1, 'German Shepherd', '5 mos. old', '3,1', 0, '2022-01-04 15:55:21', NULL),
(2, 'OVAS-2022010002', '2022-01-05', 'Claire Blake', '09123456897', 'cblake@sample.com', 'There City', 1, 'Pug', '6 mos. old', '3,1', 0, '2022-01-04 15:56:55', NULL),
(3, 'OVAS-2022010003', '2022-01-05', 'Mark Cooper', '094567894152', 'mcooper@gmail.com', 'Here', 2, 'Persian Cat', '1 yr. old', '5,3', 0, '2022-01-04 15:58:23', NULL),
(4, 'OVAS-2022010004', '2022-01-05', 'Samantha Miller', '0995564887', 'smiller@sample.com', 'Sample Address', 2, 'Maine Coon', '7 mos.', '5,1', 0, '2022-01-04 15:59:51', NULL),
(6, 'OVAS-2022010006', '2022-01-06', 'Jane Park', '09888754466', 'jpark@gmail.com', 'Sample address', 2, 'Ragdoll', '8 mos', '5,1', 1, '2022-01-04 16:27:54', '2022-01-04 17:17:55');

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Active, 1 = Delete',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Dogs', 0, '2022-01-04 10:31:11', NULL),
(2, 'Cats', 0, '2022-01-04 10:31:38', NULL),
(3, 'Hamsters', 0, '2022-01-04 10:32:02', NULL),
(4, 'Rabbits', 0, '2022-01-04 10:32:13', NULL),
(5, 'Birds', 0, '2022-01-04 10:32:47', NULL),
(6, 'test', 1, '2022-01-04 10:33:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `message_list`
--

INSERT INTO `message_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `date_created`) VALUES
(1, 'test', '09123456897', 'jsmith@sample.com', 'test', 1, '2022-01-04 17:26:19');

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `category_ids` text NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `fee` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(4) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `category_ids`, `name`, `description`, `fee`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, '2,1', 'Immunization', '<p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris quis quam tellus. Nam elit lectus, lobortis vitae eros a, condimentum pretium eros. Sed mauris nulla, aliquam vel hendrerit ac, aliquam quis mi. In non purus ac metus luctus aliquam. Praesent porta turpis eget molestie pellentesque. In fringilla est vitae sem imperdiet eleifend. Praesent lacinia arcu elit, quis venenatis nisl sollicitudin nec. Pellentesque tempor est nec porta mattis. In hendrerit eleifend felis, quis fermentum dolor eleifend quis. Maecenas dolor magna, luctus id blandit sit amet, bibendum id lacus.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px;\">Nunc pellentesque nibh vel sapien lobortis tempus. In pretium nulla felis, cursus bibendum augue pretium at. Integer eget dignissim libero. Praesent laoreet, purus eu vehicula hendrerit, felis leo lobortis mi, at aliquet nisl est a dolor. Duis eleifend pharetra augue ut finibus. Curabitur id lorem lobortis, tempus mauris quis, fermentum nunc. Vestibulum eu euismod diam, fermentum vulputate elit. Aenean eu odio tincidunt, semper nulla eget, pretium eros. In ullamcorper fringilla faucibus. Curabitur aliquam leo ex, in cursus arcu commodo eu. Vivamus in nulla id massa efficitur rhoncus. Ut sagittis arcu ipsum, at posuere eros pretium nec. Nam neque mauris, molestie eu euismod a, vulputate at diam. Nullam mattis purus tortor, rutrum fringilla lorem eleifend nec. Vestibulum vitae purus sit amet leo imperdiet tristique at ac orci.</p>', 1500, 0, '2022-01-04 10:59:49', '2022-01-04 11:09:22'),
(2, '2,1', 'Vaccination', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Curabitur facilisis consequat lacinia. Curabitur luctus nunc ac libero mattis, id bibendum mauris pretium. Donec vulputate ac velit ac laoreet. Aliquam cursus feugiat turpis, id posuere nisl ornare sit amet. Duis pharetra quam vel risus semper vestibulum. Aliquam lacinia sit amet dolor a viverra. Ut sit amet turpis laoreet, euismod dui at, accumsan lacus. Fusce est nunc, consectetur ac neque at, commodo faucibus ipsum. Nullam rutrum dapibus pulvinar. Mauris eget magna id nisl consequat mollis vitae id purus. Cras eros tellus, fringilla et dictum quis, vulputate id erat. Aliquam erat volutpat.</span><br></p>', 1700, 0, '2022-01-04 11:14:24', NULL),
(3, '5,2,1,3,4', 'Check-up', '<p><span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Ut fringilla velit quis condimentum mattis. Sed egestas ligula imperdiet orci elementum, eu aliquet sem cursus. Vestibulum maximus ex ut mi lobortis ultricies. Ut id congue ipsum. Donec porttitor a nunc a egestas. Ut non urna eget erat vestibulum eleifend. Phasellus blandit dui non neque cursus, id viverra turpis aliquet. Sed tempor nisl a ipsum porta, eget iaculis sem venenatis. Sed ac dolor sagittis, interdum leo ut, sagittis risus. Etiam suscipit, orci eget hendrerit malesuada, nisl mauris semper dolor, non accumsan nisl nibh ac augue. Integer vel lectus quis quam suscipit pharetra quis in lectus. Nulla bibendum ex sed accumsan laoreet. Cras et elit vitae sapien faucibus luctus. Morbi leo nibh, viverra vitae elit ac, luctus elementum urna.</span><br></p>', 500, 0, '2022-01-04 11:15:09', NULL),
(4, '1', 'Anti-Rabies', '<p><span style=\"color: rgb(0, 0, 0); font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: justify;\">Ut fringilla velit quis condimentum mattis. Sed egestas ligula imperdiet orci elementum, eu aliquet sem cursus. Vestibulum maximus ex ut mi lobortis ultricies. Ut id congue ipsum. Donec porttitor a nunc a egestas. Ut non urna eget erat vestibulum eleifend. Phasellus blandit dui non neque cursus, id viverra turpis aliquet. Sed tempor nisl a ipsum porta, eget iaculis sem venenatis. Sed ac dolor sagittis, interdum leo ut, sagittis risus. Etiam suscipit, orci eget hendrerit malesuada, nisl mauris semper dolor, non accumsan nisl nibh ac augue. Integer vel lectus quis quam suscipit pharetra quis in lectus. Nulla bibendum ex sed accumsan laoreet. Cras et elit vitae sapien faucibus luctus. Morbi leo nibh, viverra vitae elit ac, luctus elementum urna.</span><br></p>', 500, 0, '2022-01-04 11:16:24', '2022-01-04 11:17:00'),
(5, '2', 'Anti-Rabies', '<p>Ut fringilla velit quis condimentum mattis. Sed egestas ligula imperdiet orci elementum, eu aliquet sem cursus. Vestibulum maximus ex ut mi lobortis ultricies. Ut id congue ipsum. Donec porttitor a nunc a egestas. Ut non urna eget erat vestibulum eleifend. Phasellus blandit dui non neque cursus, id viverra turpis aliquet. Sed tempor nisl a ipsum porta, eget iaculis sem venenatis. Sed ac dolor sagittis, interdum leo ut, sagittis risus. Etiam suscipit, orci eget hendrerit malesuada, nisl mauris semper dolor, non accumsan nisl nibh ac augue. Integer vel lectus quis quam suscipit pharetra quis in lectus. Nulla bibendum ex sed accumsan laoreet. Cras et elit vitae sapien faucibus luctus. Morbi leo nibh, viverra vitae elit ac, luctus elementum urna.<br></p>', 250, 0, '2022-01-04 11:16:38', '2022-01-04 11:17:08'),
(6, '4', 'deleted', '<p>test</p>', 123, 1, '2022-01-04 11:17:34', '2022-01-04 11:17:46');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Online Veterinary Appointment System - PHP'),
(6, 'short_name', 'OVAS - PHP'),
(11, 'logo', 'uploads/logo-1641262650.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1641262651.png'),
(15, 'content', 'Array'),
(16, 'email', 'info@vetclinic.com'),
(17, 'contact', '09854698789 / 78945632'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', 'XYZ Street, There City, Here, 2306'),
(23, 'max_appointment', '30'),
(24, 'clinic_schedule', '9:00 AM - 5:00 PM');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2021-01-20 14:02:37', '2021-12-14 15:47:08'),
(3, 'Claire', NULL, 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', 'uploads/avatar-3.png?v=1639467985', NULL, 2, 1, '2021-12-14 15:46:25', '2021-12-14 15:46:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment_list`
--
ALTER TABLE `appointment_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment_list`
--
ALTER TABLE `appointment_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment_list`
--
ALTER TABLE `appointment_list`
  ADD CONSTRAINT `appointment_list_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
