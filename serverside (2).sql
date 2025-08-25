-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2025 at 08:14 PM
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
-- Database: `serverside`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`) VALUES
(21, 'Science & Nature'),
(22, 'Productivity'),
(23, 'Coding Challenges'),
(24, 'Music Discussions'),
(25, 'Mental Health'),
(26, 'Movie Reviews'),
(27, 'Pet Care'),
(28, 'Sustainable Living'),
(29, 'Photography Tips'),
(30, 'Sports Talk'),
(31, 'Language Learning'),
(32, 'Career Growth'),
(33, 'Cooking Tips'),
(34, 'Tech Support'),
(35, 'Event Planning'),
(36, 'Mindfulness'),
(37, 'Entrepreneurship'),
(38, 'Outdoor Adventures'),
(39, 'Creative Writing'),
(40, 'Digital Art');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `commentID` int(11) NOT NULL,
  `commentText` text NOT NULL,
  `postID` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`commentID`, `commentText`, `postID`, `userName`, `created_at`) VALUES
(3, 'this is a comment by mememeeeeeee', 129, 'penguin', '2025-07-14 18:03:06'),
(11, 'this is fire', 132, 'penguin', '2025-07-14 19:14:48'),
(12, 'this is fire', 132, 'penguin', '2025-07-14 19:14:51'),
(13, 'dssdwdadsadwad', 133, 'penguin', '2025-07-21 13:46:17'),
(14, 'dssdwdadsadwad', 133, 'penguin', '2025-07-21 13:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `imageID` int(11) NOT NULL,
  `imageURL` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `postName` varchar(100) NOT NULL,
  `postMessage` text NOT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `categoryID` int(11) NOT NULL,
  `postImage` varchar(225) DEFAULT NULL,
  `dateMade` date NOT NULL DEFAULT current_timestamp(),
  `dateEdit` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `postName`, `postMessage`, `userName`, `categoryID`, `postImage`, `dateMade`, `dateEdit`) VALUES
(101, 'Exploring the universe', '<p>Let&nbsp;us&nbsp;discuss&nbsp;the&nbsp;wonders&nbsp;of&nbsp;the&nbsp;universe,&nbsp;the&nbsp;mysteries&nbsp;of&nbsp;space,&nbsp;and&nbsp;recent&nbsp;discoveries&nbsp;that&nbsp;continue&nbsp;to&nbsp;inspire&nbsp;us&nbsp;to&nbsp;learn&nbsp;more&nbsp;about&nbsp;science&nbsp;and&nbsp;nature&nbsp;while&nbsp;fostering&nbsp;curiosity&nbsp;and&nbsp;collaboration&nbsp;within&nbsp;our&nbsp;community&nbsp;here.</p>', 'penguin', 21, NULL, '2025-07-21', '2025-07-21'),
(121, 'dadsad', '<p>dadsawdsa</p>', 'penguin', 21, NULL, '2025-07-21', '2025-07-21'),
(123, 'nametest', '<p></p><h2 class=\"ql-align-center\">dawdsadawdawd</h2><p>dafdaiufeaf</p><h3>da</h3><ol><li>dadsaddwaddwd</li><li>dwadwa</li><li>dwadwa</li></ol>', 'penguin', 21, NULL, '2025-07-21', '2025-07-21'),
(125, '8tyfdx', '<h2><a href=\"google.com\" rel=\"noopener noreferrer\" target=\"_blank\">ygffgdyfu</a></h2>', 'penguin', 21, NULL, '2025-07-21', '2025-07-21'),
(129, 'Exploring the universes', '<p class=\"ql-align-center\">OK&nbsp;I&nbsp;pull&nbsp;up</p><p class=\"ql-align-center\">ihgyuihoij</p>', 'penguin', 22, NULL, '2025-07-21', '2025-07-21'),
(130, 'Exploring the universessss', '<p class=\"ql-align-center\">adwdsadwd</p>', 'penguin', 22, NULL, '2025-07-21', '2025-07-21'),
(132, 'dwaddw', '<h2 class=\"ql-align-center\"><strong>dasdawdsawdsadwdwad</strong></h2><h2>ok&nbsp;I&nbsp;pull&nbsp;up&nbsp;to&nbsp;the&nbsp;after&nbsp;party</h2>', 'penguin', 21, '', '2025-07-21', '2025-07-21'),
(133, 'postL', '<p class=\"ql-align-center\">this&nbsp;is&nbsp;a&nbsp;new&nbsp;postL</p>', 'penguin', 21, '', '2025-07-21', '2025-07-21'),
(134, 'this is a test for me ', '<p class=\"ql-align-center\">ok&nbsp;I&nbsp;pull&nbsp;up&nbsp;to&nbsp;the&nbsp;after&nbsp;party</p>', 'penguin', 24, NULL, '2025-07-21', '2025-07-21'),
(135, 'testing the create function', '<h2 class=\"ql-align-center\"><strong>this&nbsp;is&nbsp;not&nbsp;a&nbsp;test&nbsp;it&nbsp;is&nbsp;instead&nbsp;a&nbsp;test</strong></h2>', 'penguin', 21, NULL, '2025-07-21', '2025-07-21'),
(136, 'bendover', '<p>this&nbsp;is&nbsp;a&nbsp;delete&nbsp;test</p><p></p>', 'penguin', 21, 'wdehd.png', '2025-07-21', '2025-07-21'),
(137, 'ben', '<p class=\"ql-align-center\">ben&nbsp;dover</p>', 'penguin', 24, 'mac.png', '2025-07-21', '2025-07-21'),
(138, '&#60;h2&#62;this is A post &#60;/h2&#62;', '<p class=\"ql-align-center\">ben&nbsp;dover&nbsp;</p><p class=\"ql-align-center\">what&nbsp;the&nbsp;sigma</p>', 'penguin', 21, NULL, '2025-07-21', '2025-07-21'),
(139, 'dwdsadwd', '<h2 class=\"ql-align-center\">bendover</h2><p>&nbsp;&lt;style&gt;&nbsp;h2{color:red;}&lt;/style&gt;</p>', 'penguin', 23, NULL, '2025-07-21', '2025-07-21'),
(140, 'test script', '<p>&lt;script&gt;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;document.getElementById(&quot;promptButton&quot;).addEventListener(&quot;click&quot;,&nbsp;function()&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;let&nbsp;userInput&nbsp;=&nbsp;prompt(&quot;Enter&nbsp;something:&quot;);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(userInput&nbsp;!==&nbsp;null)&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alert(&quot;You&nbsp;entered:&nbsp;&quot;&nbsp;+&nbsp;userInput);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;alert(&quot;Prompt&nbsp;was&nbsp;cancelled.&quot;);</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;});</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&lt;/script&gt;</p>', 'penguin', 21, 'mouse.png', '2025-07-21', '2025-07-21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userName` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `isAdmin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userName`, `password`, `email`, `isAdmin`) VALUES
('ben', 'asdasdasd', 'dsad@gmail.com', 0),
('penguin', 'asdasdasd', 'glasstree25@gmail.com', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `postID` (`postID`),
  ADD KEY `userName` (`userName`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`imageID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`postID`),
  ADD KEY `userName` (`userName`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`postID`) REFERENCES `posts` (`postID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`userName`) REFERENCES `users` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`imageID`) REFERENCES `posts` (`postID`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `users` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
