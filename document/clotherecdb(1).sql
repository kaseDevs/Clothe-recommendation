-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2022 at 02:41 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clotherecdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `views`, `image`, `body`, `published`, `created_at`) VALUES
(2, 1, 'Official Wear', 'official-wear', 0, 'pexels-august-de-richelieu-4427620.jpg', 'a nice tuxedo with grey tie and a grey shirt, what do you think of this taste', 1, '2022-07-01 04:27:30'),
(3, 1, 'cultural week outfit', 'cultural-week-outfit', 0, 'pexels-godisable-jacob-718977.jpg', 'a pink suit with a casual taste, what do you think?', 1, '2022-07-01 04:27:32');

-- --------------------------------------------------------

--
-- Table structure for table `post_topic`
--

CREATE TABLE `post_topic` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post_topic`
--

INSERT INTO `post_topic` (`id`, `post_id`, `topic_id`) VALUES
(1, 1, 1),
(2, 2, 4),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `slug`) VALUES
(1, 'event', 'event'),
(2, 'burial', 'burial'),
(3, 'wedding', 'wedding'),
(4, 'office', 'office'),
(5, 'student', 'student');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` enum('Aurthor','Admin') DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `role`, `password`, `created_at`, `updated_at`) VALUES
(1, 'kasedevs', 'kasedevs@gmail.com', 'Admin', 'f34a96643a85ba0fa0f8a79bec1c2f90', '2022-07-01 02:31:31', '2022-07-01 02:31:31'),
(2, 'pauline', 'pauline@gmail.com', 'Aurthor', 'ea33803f90c77f6cab6b04f9ef52beb1', '2022-07-01 03:15:34', '2022-07-01 03:15:34'),
(3, 'pamela', 'pamela@gmail.com', NULL, '669ffc150d1f875819183addfc842cab', '2022-07-01 06:03:39', '2022-07-01 06:03:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_topic`
--
ALTER TABLE `post_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_topic`
--
ALTER TABLE `post_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_topic`
--
ALTER TABLE `post_topic`
  ADD CONSTRAINT `post_topic_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
