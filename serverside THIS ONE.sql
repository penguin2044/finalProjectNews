-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2025 at 10:01 PM
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
(1, 'Announcements'),
(2, 'General Discussion'),
(3, 'Tech'),
(4, 'Art'),
(5, 'Photography'),
(6, 'Books'),
(7, 'Fitness'),
(8, 'Travel'),
(9, 'Food'),
(10, 'Gaming'),
(11, 'Announcements'),
(12, 'General Discussion'),
(13, 'Tech'),
(14, 'Art'),
(15, 'Photography'),
(16, 'Books'),
(17, 'Fitness'),
(18, 'Travel'),
(19, 'Food'),
(20, 'Gaming');

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

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `postID` int(11) NOT NULL,
  `postName` varchar(100) NOT NULL,
  `postMessage` text NOT NULL,
  `postImage` varchar(255) DEFAULT NULL,
  `userName` varchar(20) DEFAULT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `postName`, `postMessage`, `postImage`, `userName`, `categoryID`) VALUES
(41, 'Welcome to the Forum', 'Excited to have you all here for discussions!', NULL, 'penguin', 1),
(42, 'Weekly Tech Roundup', 'Discuss the latest trends in tech here.', NULL, 'penguin', 3),
(43, 'Share Your Art', 'Post your latest digital or traditional art here.', NULL, 'penguin', 4),
(44, 'Travel Bucket List', 'Where do you want to travel next?', NULL, 'penguin', 8),
(45, 'Favorite Book Recommendations', 'Drop your must-read book titles here.', NULL, 'penguin', 6),
(46, 'Workout Routines', 'Share your workout plans and tips!', NULL, 'penguin', 7),
(47, 'Gaming Night Plans', 'Who is up for a gaming session this weekend?', NULL, 'penguin', 10),
(48, 'Photography Challenge', 'Post your best landscape shots here.', NULL, 'penguin', 5),
(49, 'Forum Updates', 'Latest updates to the forum features.', NULL, 'penguin', 1),
(50, 'Best Tech Gadgets of 2025', 'What gadgets are you loving this year?', NULL, 'penguin', 3),
(51, 'Art Styles You Love', 'Share hidden travel gems that you have discovered, which are off the beaten path and worth exploring. Share details on how to reach them, what to expect, and why they were special to you.', NULL, 'penguin', 4),
(52, 'Food Recipes Exchange', 'Share your favorite recipes here.', NULL, 'penguin', 9),
(53, 'Travel Stories', 'Share a story from your last trip!', NULL, 'penguin', 8),
(54, 'Book vs Movie', 'Which adaptations were better?', NULL, 'penguin', 6),
(55, 'Cardio Tips', 'Best ways to improve cardio health?', NULL, 'penguin', 7),
(56, 'Latest Game Releases', 'Discuss newly released games here.', NULL, 'penguin', 10),
(57, 'General Chat', 'Talk about anything and everything.', NULL, 'penguin', 2),
(58, 'Pet Photography', 'Post your cute pet photos here.', NULL, 'penguin', 5),
(59, 'Forum Rules Reminder', 'Please review our updated forum rules.', NULL, 'penguin', 1),
(60, 'Tech Help Thread', 'Post your tech questions here for community help.', NULL, 'penguin', 3),
(61, 'Art Critique Thread', 'Looking for feedback? Share your art here.', NULL, 'penguin', 4),
(62, 'Best Street Food', 'Share your best street food experiences.', NULL, 'penguin', 9),
(63, 'Hidden Travel Gems', 'Share hidden places you discovered.', NULL, 'penguin', 8),
(64, 'Fantasy Book Recommendations', 'Looking for your fantasy book suggestions.', NULL, 'penguin', 6),
(65, 'Home Workouts', 'Workout routines without gym equipment.', NULL, 'penguin', 7),
(66, 'Retro Games', 'Discuss your favorite retro games here.', NULL, 'penguin', 10),
(67, 'Chit Chat', 'A place for lighthearted conversations.', NULL, 'penguin', 2),
(68, 'Landscape Photography', 'Post your best landscape photos.', NULL, 'penguin', 5),
(69, 'Forum Maintenance Notice', 'Scheduled downtime for maintenance.', NULL, 'penguin', 1),
(70, 'Tech Rumors', 'Discuss upcoming tech rumors here.', NULL, 'penguin', 3),
(71, 'Welcome to the Forum', 'Welcome to the forum, everyone! We are thrilled to have you join our community where we will discuss various topics, share knowledge, support each other, and create a safe space for learning and growing together every day.', NULL, 'penguin', 1),
(72, 'Weekly Tech Roundup', 'Let us use this thread to discuss the latest technology trends including new AI developments, hardware releases, programming languages updates, and other technology advancements that are shaping the world right now.', NULL, 'penguin', 3),
(73, 'Share Your Art', 'This post is for artists to showcase their creations, whether you create digital illustrations, paintings, sketches, or sculpture. Share your workflow, your favorite tools, and tips with the community here!', NULL, 'penguin', 4),
(74, 'Travel Bucket List', 'What destinations are on your travel bucket list? Share why you want to visit these places, the activities you want to do, and what inspires you about these destinations so we can all get inspired and add new places to our lists.', NULL, 'penguin', 8),
(75, 'Favorite Book Recommendations', 'Drop your book recommendations here, whether it is fiction, non-fiction, biographies, or poetry. Share what made you love these books and how they impacted your life, encouraging others to find joy in reading as well.', NULL, 'penguin', 6),
(76, 'Workout Routines', 'Share your workout routines with the community, including your warm-up, strength, cardio, and cool-down practices. Share what has worked for you and how your workout has helped your health and mindset over time.', NULL, 'penguin', 7),
(77, 'Gaming Night Plans', 'Are you planning a gaming night this weekend with friends or online buddies? Share what games you will be playing, your game tags if you want others to join, and any snacks or setups you use to make your gaming night fun.', NULL, 'penguin', 10),
(78, 'Photography Challenge', 'Post your best photos for this week\'s photography challenge. The theme is \"Cityscapes at Night.\" Share your camera settings, editing techniques, and stories behind the shot to inspire others to improve their photography skills.', NULL, 'penguin', 5),
(79, 'Forum Updates', 'We have updated the forum with new categories, added new moderation tools, and improved the user experience for mobile users. Please share your feedback on the changes so we can continue improving the community for everyone.', NULL, 'penguin', 1),
(80, 'Best Tech Gadgets of 2025', 'Share your favorite tech gadgets of 2025 here, including why you like them, how they have improved your daily life, and any tips on using them effectively for productivity, creativity, or entertainment.', NULL, 'penguin', 3),
(81, 'Art Styles You Love', 'Discuss your favorite art styles, from abstract to realism, impressionism to modern digital painting. Share what inspires you about these styles, your favorite artists, and how they have influenced your own art journey.', NULL, 'penguin', 4),
(82, 'Food Recipes Exchange', 'Share your favorite recipes with detailed instructions, ingredient lists, and personal notes that make these recipes special. Whether it is a family dish or a creative experiment, let others try it and give their feedback.', NULL, 'penguin', 9),
(83, 'Travel Stories', 'Share a detailed travel story from your past trips, including the places you visited, experiences you had, foods you tried, and people you met along the way to inspire others to explore and appreciate different cultures.', NULL, 'penguin', 8),
(84, 'Book vs Movie', 'Have you read a book and then watched its movie adaptation? Share your detailed comparisons, what the movie got right or wrong, and whether you prefer the book or the movie and why in this discussion thread.', NULL, 'penguin', 6),
(85, 'Cardio Tips', 'Cardio exercises are crucial for heart health, stamina, and general fitness. Share your favorite cardio exercises, how you make your sessions interesting, and tips for beginners to improve consistency in their routines.', NULL, 'penguin', 7),
(86, 'Latest Game Releases', 'Discuss the latest game releases here, including your reviews, gameplay experiences, graphics and storyline opinions, and whether you would recommend these games to other gamers in the community.', NULL, 'penguin', 10),
(87, 'General Chat', 'This thread is for general conversations unrelated to specific categories. Feel free to share how your day is going, what you are currently working on, and anything you want to talk about in a chill space.', NULL, 'penguin', 2),
(88, 'Pet Photography', 'Post your pet photos and share their stories with the community. Talk about your photography settings, how you capture their expressions, and tips for others wanting to photograph their pets beautifully.', NULL, 'penguin', 5),
(89, 'Forum Rules Reminder', 'Please take a moment to review the updated forum rules. We aim to keep this community respectful, supportive, and informative for everyone. Your cooperation is essential for maintaining a positive space.', NULL, 'penguin', 1),
(90, 'Tech Help Thread', 'If you are experiencing tech issues, whether it is software bugs, hardware troubleshooting, or needing advice on what tech to purchase, post your detailed questions here for the community to help you.', NULL, 'penguin', 3),
(91, 'Art Critique Thread', 'Share your artwork here if you would like constructive feedback. Include details like your medium, your goal for the piece, and areas you are struggling with so others can give you helpful, kind critiques.', NULL, 'penguin', 4),
(92, 'Best Street Food', 'Discuss your favorite street food experiences from around the world, sharing what made the food special, the places you found them, and any photos you took while enjoying the vibrant local scenes.', NULL, 'penguin', 9),
(93, 'Hidden Travel Gems', 'Share hidden travel gems that you have discovered, which are off the beaten path and worth exploring. Share details on how to reach them, what to expect, and why they were special to you.', NULL, 'penguin', 8),
(94, 'Fantasy Book Recommendations', 'Share your top fantasy book recommendations, including what makes the world-building, characters, and storylines stand out for you, so others can discover and enjoy these books.', NULL, 'penguin', 6),
(95, 'Home Workouts', 'Share your home workout routines, including how you manage space, equipment, and motivation to keep consistent with fitness even without a gym, and how it has helped your physical and mental health.', NULL, 'penguin', 7),
(96, 'Retro Games', 'Discuss your favorite retro games, share your experiences revisiting them, and talk about the nostalgia and fun you find in these classic games that remain timeless for many gamers.', NULL, 'penguin', 10),
(97, 'Chit Chat', 'Use this space for lighthearted conversations with the community, from hobbies to weekend plans, or any fun topic you would like to share with everyone in a relaxed environment.', NULL, 'penguin', 2),
(98, 'Landscape Photography', 'Post your best landscape photographs and share the stories behind them, including camera settings, time of day, and what inspired you to capture that particular moment in nature.', NULL, 'penguin', 5),
(99, 'Forum Maintenance Notice', 'We will have scheduled maintenance this week to improve security and performance. The forum will be temporarily unavailable during this period. Thank you for your understanding and patience.', NULL, 'penguin', 1),
(100, 'Tech Rumors', 'Use this thread to discuss upcoming technology rumors, leaks about new gadgets, and predictions on what the next big thing in the tech world will be, encouraging community speculation.', NULL, 'penguin', 3);

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
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`userName`) REFERENCES `users` (`userName`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
