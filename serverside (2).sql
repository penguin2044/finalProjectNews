-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2025 at 09:34 PM
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
(101, 'Exploring the Universe', 'Let us discuss the wonders of the universe, the mysteries of space, and recent discoveries that continue to inspire us to learn more about science and nature while fostering curiosity and collaboration within our community here.', NULL, 'penguin', 21),
(102, 'Productivity Hacks', 'Share your best productivity hacks that have helped you manage your time, stay organized, and maintain motivation while balancing school, work, hobbies, and self-care as you continue to strive toward your personal and professional goals.', NULL, 'penguin', 22),
(103, 'Weekly Coding Challenge', 'Join our weekly coding challenges to sharpen your problem-solving skills, learn new algorithms, and help others in the community improve while maintaining a consistent coding habit to grow your knowledge and confidence in programming.', NULL, 'penguin', 23),
(104, 'Favorite Music Genres', 'Discuss your favorite music genres and artists while sharing playlists and discovering new sounds with others in our community to expand your taste in music and foster connections through the love and appreciation of various musical styles.', NULL, 'penguin', 24),
(105, 'Mental Health Awareness', 'Let us create a supportive space to discuss mental health, share resources, coping strategies, and personal experiences while working together to build an understanding, respectful, and caring environment for everyone in our community.', NULL, 'penguin', 25),
(106, 'Latest Movie Reviews', 'Share your thoughts on the latest movies you have watched, your opinions on the acting, storylines, and cinematography, and join in discussions with others who love movies to find new recommendations and discuss favorite scenes.', NULL, 'penguin', 26),
(107, 'Pet Care Tips', 'Share your pet care tips for keeping your furry, feathery, or scaly friends healthy and happy, including feeding routines, enrichment activities, grooming practices, and tips for managing challenges while building a strong bond with your pets.', NULL, 'penguin', 27),
(108, 'Sustainable Lifestyle', 'Discuss ways to live a more sustainable lifestyle, including reducing waste, eco-friendly product swaps, and sharing resources that help us care for the planet while being mindful of our choices and how they impact the environment around us.', NULL, 'penguin', 28),
(109, 'Photography Tips & Tricks', 'Share your best photography tips and tricks to help others improve their skills, including discussions on camera settings, composition, lighting, and editing techniques to capture stunning and meaningful photos in various environments.', NULL, 'penguin', 29),
(110, 'Sports Discussions', 'Join discussions about your favorite sports, teams, players, and game strategies while sharing your thoughts on recent matches, upcoming events, and personal sports experiences with others in our sports-loving community.', NULL, 'penguin', 30),
(111, 'Language Learning Club', 'Share your experiences, resources, and motivation for learning new languages while connecting with others on a similar journey, practicing conversation skills, and supporting each other in language learning goals and cultural exploration.', NULL, 'penguin', 31),
(112, 'Career Development Tips', 'Discuss career growth strategies, job searching tips, resume advice, and skill development opportunities with others aiming to advance their professional journeys while supporting each other through the challenges and successes along the way.', NULL, 'penguin', 32),
(113, 'Cooking Tips & Recipes', 'Share your favorite cooking tips and recipes with the community, discuss techniques, ingredient substitutions, and meal planning ideas while learning new culinary skills and exploring different cuisines to expand your cooking repertoire.', NULL, 'penguin', 33),
(114, 'Tech Support Thread', 'Use this thread to ask for and provide tech support within the community, including software troubleshooting, hardware issues, programming questions, and general technical advice to help each other solve problems efficiently and effectively.', NULL, 'penguin', 34),
(115, 'Event Planning Ideas', 'Share your event planning ideas, experiences, and tips to help others organize gatherings, parties, and meetups while discussing budgeting, themes, logistics, and ways to make events enjoyable and memorable for everyone involved.', NULL, 'penguin', 35),
(116, 'Mindfulness Practices', 'Discuss mindfulness practices and meditation techniques that help you manage stress, improve focus, and maintain emotional well-being while building a supportive community to encourage consistent mindfulness habits for a balanced life.', NULL, 'penguin', 36),
(117, 'Entrepreneurship Tips', 'Share your entrepreneurship experiences, discuss business ideas, startup challenges, and growth strategies while connecting with others who are on a similar journey to build and scale their businesses with resilience and creativity.', NULL, 'penguin', 37),
(118, 'Outdoor Adventure Stories', 'Share your outdoor adventure stories, whether hiking, camping, kayaking, or exploring new trails, while providing tips, location recommendations, and safety advice to inspire others to enjoy and connect with nature responsibly.', NULL, 'penguin', 38),
(119, 'Creative Writing Club', 'Join our creative writing club to share your stories, poems, and essays while receiving constructive feedback, participating in writing prompts, and encouraging each other to continue developing your unique voice and storytelling skills.', NULL, 'penguin', 39),
(120, 'Digital Art Showcase', 'Share your digital art creations, your workflow, techniques, and favorite tools with the community while exploring inspiration from others, discussing software options, and growing your digital art skills through consistent practice and feedback.', NULL, 'penguin', 40);

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
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

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
