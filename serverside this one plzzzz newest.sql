-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2025 at 06:54 PM
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
(4, 'what the hell why is this comment so long. what the hell why is this comment so long. ', 129, 'rertewtewt', '2025-07-14 18:03:06'),
(5, 'this is text', 131, 'penguin', '2025-07-14 18:54:51'),
(6, 'this is a check&#13;&#10;', 131, 'penguin', '2025-07-14 19:02:52'),
(7, 'this is a check&#13;&#10;', 131, 'penguin', '2025-07-14 19:02:54'),
(8, ']]]', 127, 'penguin', '2025-07-14 19:04:39'),
(9, 'lll', 127, 'penguin', '2025-07-14 19:04:47'),
(10, 'lll', 127, 'penguin', '2025-07-14 19:04:52'),
(11, 'this is fire', 132, 'penguin', '2025-07-14 19:14:48'),
(12, 'this is fire', 132, 'penguin', '2025-07-14 19:14:51');

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
  `postImage` varchar(225) NOT NULL DEFAULT 'default.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`postID`, `postName`, `postMessage`, `userName`, `categoryID`, `postImage`) VALUES
(101, 'Exploring the universe', '<p>Let&nbsp;us&nbsp;discuss&nbsp;the&nbsp;wonders&nbsp;of&nbsp;the&nbsp;universe,&nbsp;the&nbsp;mysteries&nbsp;of&nbsp;space,&nbsp;and&nbsp;recent&nbsp;discoveries&nbsp;that&nbsp;continue&nbsp;to&nbsp;inspire&nbsp;us&nbsp;to&nbsp;learn&nbsp;more&nbsp;about&nbsp;science&nbsp;and&nbsp;nature&nbsp;while&nbsp;fostering&nbsp;curiosity&nbsp;and&nbsp;collaboration&nbsp;within&nbsp;our&nbsp;community&nbsp;here.</p>', 'penguin', 21, 'default.png'),
(102, 'Productivity Hacks', '<p>Share&nbsp;your&nbsp;best&nbsp;productivity&nbsp;hacks&nbsp;that&nbsp;have&nbsp;helped&nbsp;you&nbsp;manage&nbsp;your&nbsp;time,&nbsp;stay&nbsp;organized,&nbsp;and&nbsp;maintain&nbsp;motivation&nbsp;while&nbsp;balancing&nbsp;school,&nbsp;work,&nbsp;hobbies,&nbsp;and&nbsp;self-care&nbsp;as&nbsp;you&nbsp;continue&nbsp;to&nbsp;strive&nbsp;toward&nbsp;your&nbsp;personal&nbsp;and&nbsp;professional&nbsp;goals.</p>', 'penguin', 22, 'default.png'),
(103, 'Weekly Coding Challenge', 'Join our weekly coding challenges to sharpen your problem-solving skills, learn new algorithms, and help others in the community improve while maintaining a consistent coding habit to grow your knowledge and confidence in programming.', 'penguin', 23, 'default.png'),
(104, 'Favorite Music Genres', 'Discuss your favorite music genres and artists while sharing playlists and discovering new sounds with others in our community to expand your taste in music and foster connections through the love and appreciation of various musical styles.', 'penguin', 24, 'default.png'),
(105, 'Mental Health Awareness', 'Let us create a supportive space to discuss mental health, share resources, coping strategies, and personal experiences while working together to build an understanding, respectful, and caring environment for everyone in our community.', 'penguin', 25, 'default.png'),
(106, 'Latest Movie Reviews', 'Share your thoughts on the latest movies you have watched, your opinions on the acting, storylines, and cinematography, and join in discussions with others who love movies to find new recommendations and discuss favorite scenes.', 'penguin', 26, 'default.png'),
(107, 'Pet Care Tips', 'Share your pet care tips for keeping your furry, feathery, or scaly friends healthy and happy, including feeding routines, enrichment activities, grooming practices, and tips for managing challenges while building a strong bond with your pets.', 'penguin', 27, 'default.png'),
(108, 'Sustainable Lifestyle', 'Discuss ways to live a more sustainable lifestyle, including reducing waste, eco-friendly product swaps, and sharing resources that help us care for the planet while being mindful of our choices and how they impact the environment around us.', 'penguin', 28, 'default.png'),
(109, 'Photography Tips & Tricks', 'Share your best photography tips and tricks to help others improve their skills, including discussions on camera settings, composition, lighting, and editing techniques to capture stunning and meaningful photos in various environments.', 'penguin', 29, 'default.png'),
(110, 'Sports Discussions', 'Join discussions about your favorite sports, teams, players, and game strategies while sharing your thoughts on recent matches, upcoming events, and personal sports experiences with others in our sports-loving community.', 'penguin', 30, 'default.png'),
(111, 'Language Learning Club', 'Share your experiences, resources, and motivation for learning new languages while connecting with others on a similar journey, practicing conversation skills, and supporting each other in language learning goals and cultural exploration.', 'penguin', 31, 'default.png'),
(112, 'Career Development Tips', 'Discuss career growth strategies, job searching tips, resume advice, and skill development opportunities with others aiming to advance their professional journeys while supporting each other through the challenges and successes along the way.', 'penguin', 32, 'default.png'),
(113, 'Cooking Tips & Recipes', 'Share your favorite cooking tips and recipes with the community, discuss techniques, ingredient substitutions, and meal planning ideas while learning new culinary skills and exploring different cuisines to expand your cooking repertoire.', 'penguin', 33, 'default.png'),
(114, 'Tech Support Thread', 'Use this thread to ask for and provide tech support within the community, including software troubleshooting, hardware issues, programming questions, and general technical advice to help each other solve problems efficiently and effectively.', 'penguin', 34, 'default.png'),
(115, 'Event Planning Ideas', 'Share your event planning ideas, experiences, and tips to help others organize gatherings, parties, and meetups while discussing budgeting, themes, logistics, and ways to make events enjoyable and memorable for everyone involved.', 'penguin', 35, 'default.png'),
(116, 'Mindfulness Practices', 'Discuss mindfulness practices and meditation techniques that help you manage stress, improve focus, and maintain emotional well-being while building a supportive community to encourage consistent mindfulness habits for a balanced life.', 'penguin', 36, 'default.png'),
(117, 'Entrepreneurship Tips', 'Share your entrepreneurship experiences, discuss business ideas, startup challenges, and growth strategies while connecting with others who are on a similar journey to build and scale their businesses with resilience and creativity.', 'penguin', 37, 'default.png'),
(118, 'Outdoor Adventure Stories', 'Share your outdoor adventure stories, whether hiking, camping, kayaking, or exploring new trails, while providing tips, location recommendations, and safety advice to inspire others to enjoy and connect with nature responsibly.', 'penguin', 38, 'default.png'),
(119, 'Creative Writing Club', 'Join our creative writing club to share your stories, poems, and essays while receiving constructive feedback, participating in writing prompts, and encouraging each other to continue developing your unique voice and storytelling skills.', 'penguin', 39, 'default.png'),
(120, 'Digital Art Showcase', 'Share your digital art creations, your workflow, techniques, and favorite tools with the community while exploring inspiration from others, discussing software options, and growing your digital art skills through consistent practice and feedback.', 'penguin', 40, 'default.png'),
(121, 'dadsad', '<p>dadsawdsa</p>', 'penguin', 21, 'default.png'),
(122, 'sigma', '<p>oh&nbsp;IM&nbsp;gumping&nbsp;it&nbsp;jenny</p><h2>bendover</h2><h4><em>sdwdasd</em></h4>', 'penguin', 22, 'default.png'),
(123, 'nametest', '<p></p><h2 class=\"ql-align-center\">dawdsadawdawd</h2><p>dafdaiufeaf</p><h3>da</h3><ol><li>dadsaddwaddwd</li><li>dwadwa</li><li>dwadwa</li></ol>', 'penguin', 21, 'default.png'),
(124, 'dwdsadwd', '<p class=\"ql-align-center\">ben</p>', 'penguin', 22, 'default.png'),
(125, '8tyfdx', '<h2><a href=\"google.com\" rel=\"noopener noreferrer\" target=\"_blank\">ygffgdyfu</a></h2>', 'penguin', 21, 'default.png'),
(126, 'Im gumping it', '<h2 class=\"ql-align-center\">Jesse&nbsp;Kleinschmit</h2><h3 class=\"ql-align-center\">work&nbsp;done&nbsp;.ca</h3><p>ok&nbsp;I&nbsp;pull&nbsp;up&nbsp;to&nbsp;the&nbsp;after&nbsp;part&nbsp;all&nbsp;me&nbsp;homies&nbsp;know&nbsp;its&nbsp;me</p>', 'penguin', 23, 'default.png'),
(127, 'Identifying Architecture Patterns', '<h2 class=\"ql-align-center\"><strong>Identifying&nbsp;Architecture&nbsp;Patterns&nbsp;</strong></h2><h3 class=\"ql-align-center\">by&nbsp;Jesse&nbsp;Kleinschmit</h3><h3>A&nbsp;brief&nbsp;description&nbsp;of&nbsp;each&nbsp;Architecture&nbsp;Pattern&nbsp;(Layered,&nbsp;Client&nbsp;Server,&nbsp;Microservice).&nbsp;</h3><p></p><ul><li>The&nbsp;layered&nbsp;architecture&nbsp;pattern&nbsp;is&nbsp;one&nbsp;of&nbsp;the&nbsp;most&nbsp;used&nbsp;architecture&nbsp;patterns.&nbsp;It&nbsp;uses&nbsp;modules&nbsp;that&nbsp;work&nbsp;the&nbsp;same&nbsp;way&nbsp;are&nbsp;stacked&nbsp;on&nbsp;top&nbsp;of&nbsp;each&nbsp;other&nbsp;on&nbsp;a&nbsp;horizontal&nbsp;line.&nbsp;Each&nbsp;layer&nbsp;of&nbsp;the&nbsp;stack&nbsp;performs&nbsp;a&nbsp;specific&nbsp;task/role&nbsp;of&nbsp;the&nbsp;application.&nbsp;The&nbsp;layered&nbsp;architecture&nbsp;patter&nbsp;does&nbsp;not&nbsp;limit&nbsp;the&nbsp;number&nbsp;of&nbsp;modules&nbsp;that&nbsp;can&nbsp;be&nbsp;stacked&nbsp;on&nbsp;top&nbsp;of&nbsp;each&nbsp;other&nbsp;the&nbsp;reason&nbsp;is&nbsp;that&nbsp;the&nbsp;layered&nbsp;architecture&nbsp;pattern&nbsp;wants&nbsp;the&nbsp;system&nbsp;to&nbsp;be&nbsp;broken&nbsp;down&nbsp;into&nbsp;sperate&nbsp;layers&nbsp;to&nbsp;make&nbsp;it&nbsp;easyer&nbsp;to&nbsp;understand&nbsp;the&nbsp;system&nbsp;and&nbsp;know&nbsp;each&nbsp;role/responsibility&nbsp;of&nbsp;each&nbsp;layer&nbsp;</li></ul><p></p><ul><li>The&nbsp;client&nbsp;server&nbsp;architecture&nbsp;pattern&nbsp;is&nbsp;also&nbsp;known&nbsp;as&nbsp;a&nbsp;networking&nbsp;computing&nbsp;model&nbsp;or&nbsp;client-server&nbsp;network.&nbsp;Architecture&nbsp;patterns&nbsp;show&nbsp;how&nbsp;clients&nbsp;interact&nbsp;with&nbsp;the&nbsp;server&nbsp;over&nbsp;a&nbsp;network&nbsp;connection&nbsp;or&nbsp;an&nbsp;internet&nbsp;connection.&nbsp;in&nbsp;this&nbsp;pattern&nbsp;the&nbsp;server&nbsp;delivers&nbsp;and&nbsp;manages&nbsp;most&nbsp;of&nbsp;the&nbsp;resources&nbsp;and&nbsp;services&nbsp;that&nbsp;are&nbsp;then&nbsp;sent&nbsp;to&nbsp;the&nbsp;client.&nbsp;</li></ul><p></p><ul><li>The&nbsp;Microservice&nbsp;architecture&nbsp;pattern&nbsp;is&nbsp;a&nbsp;collection&nbsp;of&nbsp;small&nbsp;autonomous&nbsp;Services&nbsp;that&nbsp;are&nbsp;self-contained,&nbsp;and&nbsp;they&nbsp;implement&nbsp;a&nbsp;single&nbsp;business&nbsp;capability&nbsp;whiten&nbsp;each&nbsp;module.&nbsp;Each&nbsp;module&nbsp;is&nbsp;a&nbsp;seprate&nbsp;code&nbsp;base&nbsp;and&nbsp;should&nbsp;be&nbsp;able&nbsp;to&nbsp;be&nbsp;made&nbsp;and&nbsp;maintained&nbsp;with&nbsp;a&nbsp;small&nbsp;team&nbsp;of&nbsp;developers.&nbsp;Each&nbsp;service&nbsp;should&nbsp;be&nbsp;able&nbsp;to&nbsp;be&nbsp;deployed&nbsp;independently.&nbsp;</li></ul><p></p><h3>A&nbsp;comparison&nbsp;of&nbsp;the&nbsp;three&nbsp;patterns&nbsp;and&nbsp;the&nbsp;major&nbsp;differences&nbsp;and&nbsp;similarities&nbsp;between&nbsp;them.&nbsp;</h3><p></p><ul><li>The&nbsp;main&nbsp;similarities&nbsp;between&nbsp;the&nbsp;three&nbsp;patterns&nbsp;are&nbsp;that&nbsp;they&nbsp;are&nbsp;all&nbsp;about&nbsp;breaking&nbsp;down&nbsp;a&nbsp;system&nbsp;into&nbsp;diagrams&nbsp;that&nbsp;we&nbsp;can&nbsp;see&nbsp;and&nbsp;use&nbsp;to&nbsp;make&nbsp;a&nbsp;system&nbsp;the&nbsp;way&nbsp;they&nbsp;do&nbsp;this&nbsp;is&nbsp;different&nbsp;but&nbsp;the&nbsp;main&nbsp;idea&nbsp;of&nbsp;each&nbsp;of&nbsp;the&nbsp;three&nbsp;patters&nbsp;is&nbsp;to&nbsp;break&nbsp;down&nbsp;a&nbsp;system&nbsp;so&nbsp;we&nbsp;the&nbsp;developers&nbsp;can&nbsp;understand&nbsp;what&nbsp;system&nbsp;will&nbsp;do&nbsp;and&nbsp;make&nbsp;it&nbsp;so&nbsp;we&nbsp;can&nbsp;develop&nbsp;the&nbsp;system&nbsp;without&nbsp;making&nbsp;assumptions&nbsp;on&nbsp;what&nbsp;each&nbsp;part&nbsp;of&nbsp;the&nbsp;system&nbsp;will&nbsp;do.&nbsp;&nbsp;</li></ul><p></p><ul><li>The&nbsp;main&nbsp;differences&nbsp;I&nbsp;see&nbsp;from&nbsp;the&nbsp;three&nbsp;patterns&nbsp;are&nbsp;that&nbsp;they&nbsp;all&nbsp;talk&nbsp;about&nbsp;systems,&nbsp;but&nbsp;the&nbsp;three&nbsp;patterns&nbsp;talk&nbsp;about&nbsp;different&nbsp;parts&nbsp;of&nbsp;the&nbsp;system.&nbsp;the&nbsp;layered&nbsp;architecture&nbsp;pattern&nbsp;breaks&nbsp;down&nbsp;the&nbsp;system&nbsp;into&nbsp;layers,&nbsp;the&nbsp;client&nbsp;server&nbsp;architecture&nbsp;pattern&nbsp;breaks&nbsp;down&nbsp;the&nbsp;system&nbsp;into&nbsp;client&nbsp;and&nbsp;server&nbsp;modules&nbsp;and&nbsp;shows&nbsp;how&nbsp;the&nbsp;communicate&nbsp;with&nbsp;each&nbsp;other&nbsp;and&nbsp;then&nbsp;the&nbsp;microservice&nbsp;architecture&nbsp;pattern&nbsp;breaks&nbsp;down&nbsp;the&nbsp;project&nbsp;into&nbsp;small&nbsp;and&nbsp;independent&nbsp;services&nbsp;that&nbsp;can&nbsp;be&nbsp;done&nbsp;by&nbsp;a&nbsp;small&nbsp;team.&nbsp;As&nbsp;you&nbsp;can&nbsp;see&nbsp;the&nbsp;main&nbsp;difference&nbsp;is&nbsp;that&nbsp;what&nbsp;they&nbsp;break&nbsp;down&nbsp;is&nbsp;different&nbsp;from&nbsp;each&nbsp;other.&nbsp;</li></ul><p></p>', 'penguin', 35, 'mouse.png'),
(128, 'GUMPING', '<h2 class=\"ql-align-center\">What&nbsp;the&nbsp;helllllll</h2><p class=\"ql-align-center\">gayyyttt</p><p class=\"ql-align-center\"></p>', 'penguin', 25, 'mac.png'),
(129, 'Exploring the universes', '<p class=\"ql-align-center\">OK&nbsp;I&nbsp;pull&nbsp;up</p><p class=\"ql-align-center\">ihgyuihoij</p>', 'penguin', 22, 'nexus.png'),
(130, 'Exploring the universessss', '<p class=\"ql-align-center\">adwdsadwd</p>', 'penguin', 22, 'nexus.png'),
(131, 'asdwadwdasdw', '<p>dadwdasdwd</p>', 'penguin', 27, 'wdehd.png'),
(132, 'dwaddw', '<h2 class=\"ql-align-center\"><strong>dasdawdsawdsadwdwad</strong></h2><h2>ok&nbsp;I&nbsp;pull&nbsp;up&nbsp;to&nbsp;the&nbsp;after&nbsp;party</h2>', 'penguin', 21, 'default.png');

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
('penguin', 'asdasdasd', 'glasstree25@gmail.com', 1),
('rertewtewt', 'asdasdasd', 'dsad@gmail.com', 0);

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
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `imageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `postID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

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
