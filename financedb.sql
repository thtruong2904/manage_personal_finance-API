-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2023 at 11:04 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `financedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(500) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `isActivity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`id`, `username`, `password`, `email`, `role_id`, `isActivity`) VALUES
(9, 'tranhuuthanh', '$2a$10$HxwZrSRucqm93bfIWhVr/uiA0aGVXGlug52lgdPw6mYVgh2XTBLAO', 'tranhuuthanh@gmail.com', 2, 1),
(10, 'tranhuutruong', '$2a$10$mpKHLu9aMySR4VToqQq5keTRiPdL9ASWQr/wQjjl3W/ppHUN6sXPG', 'tranhuutruong290401@gmail.com', 1, 1),
(11, 'lequocthien', '$2a$10$WbOxp9dIZR7RAxf4lqGtsO3bgz6wR/RJM5.ZwLjitVKrlD4zgNx7m', 'lequocthien@gmail.com', 2, 1),
(15, 'tranminhlong', '$2a$10$mGyly4QFZQ78AWmCwmcKL.XsjcU41mnQ621TLrmdEbQlhymkk7Zj.', 'tranminhlong@gmail.com', 2, 1),
(21, 'phuochieu12', '$2a$10$HCicN6EXswN1vJ0aJyXt/u4Dcw95wrl5y9ozXuaygIThm1LhzR4ye', 'phuochie@gmail.com', 2, 1),
(26, 'user01', '$2a$10$CLc0vsRFdcYDs8Qb.xIn3eY5chGNL/aDiGNhEQ28z/Dp2HWGbxR/i', 'abcdef@gmail.com', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bank_cards`
--

CREATE TABLE `bank_cards` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `balance` decimal(65,2) NOT NULL,
  `cardnumber` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` text NOT NULL,
  `updated_at` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_cards`
--

INSERT INTO `bank_cards` (`id`, `user_id`, `name`, `balance`, `cardnumber`, `description`, `created_at`, `updated_at`) VALUES
(10, 10, 'MSB', '800000.00', '123456789', 'Ngân hàng hàng hải Việt Nam', '2023-04-07 14:22:27', '18/04/2023 00:35:31'),
(116, 10, 'THT', '1200000.00', '19001089', 'Ngân Hàng Phát triển nông nghiệp và nông thôn', '17/04/2023 19:01:33', '18/04/2023 11:29:37'),
(117, 11, 'VietcomBank', '15000000.00', '0985723525', 'Ngân hàng Thương mại Cổ phần Ngoại thương', '18/04/2023 11:40:44', '18/04/2023 11:40:44');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `created_at` text COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `description`, `name`, `color`, `type`, `created_at`, `updated_at`) VALUES
(3, 10, 'Bán xe máy mua xe máy mới', 'Bán xe máy', '#00ffff', 1, '2023-04-06 16:43:54', '12/04/2023 17:23:25'),
(10, 8, 'Lấy lương ăn Tết', 'Lương thưởng tháng 13', '#0000ff', 1, '2023-04-07 14:34:06', '12/04/2023 14:49:45'),
(58, 10, 'ABCDEF', 'Giáo dục', '#7fff00', 2, '13/04/2023 16:10:09', '13/04/2023 17:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `balance` decimal(20,2) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `deposit` decimal(20,2) NOT NULL,
  `deadline` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `user_id`, `name`, `balance`, `amount`, `deposit`, `deadline`, `status`) VALUES
(10, 10, 'Mua xe BMW', '4200000.00', '2300000000.00', '1200000.00', '2023-04-22', 1),
(62, 10, 'Để dành cho bố mẹ xây nhà', '3000000.00', '1000000000.00', '2000000.00', '2026-06-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `content`, `is_read`, `created_at`) VALUES
(10, 10, 'Mục tiêu sắp hết hạn', 'Mục tiêu Mua xe BMW của bạn sắp hết hạn. Hãy thêm tiền cho mục tiêu để hoàn thành nhé', 0, '2023-04-19');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `RoleName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `RoleName`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token_id` varchar(500) NOT NULL,
  `expired_time` bigint(19) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`id`, `user_id`, `token_id`, `expired_time`) VALUES
(50, 9, 'b30cf2de-4791-468b-abca-9d64cbae8114', 1681068437023),
(51, 9, '9257fc25-44d1-4ee5-be7b-37b6bef9c97f', 1681070241180),
(67, 8, 'ed047f03-d7ac-4ea5-a538-c2293a164e08', 1681219078089),
(69, 11, 'cc26f5c9-2e1b-4aba-8c81-6ddd74f97dc1', 1681234670908),
(70, 11, '1b6d042a-d0ca-49ec-8e8b-465b191a2e3c', 1681257756989);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `card_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `transactiondate` date NOT NULL,
  `type` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `category_id`, `card_id`, `name`, `amount`, `location`, `transactiondate`, `type`, `description`) VALUES
(230, 10, 58, 10, 'Mua sách', '200000.00', 'Nhà sách Phương Nam', '2023-04-25', 2, 'Mua sách Văn học'),
(231, 10, 3, 10, 'Bán khung xe', '100000.00', 'Cửa hàng sửa xe honda', '2023-03-23', 1, 'Bán cái khung xe cũ mua khung xe mới');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `account_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `firstname`, `lastname`, `date`, `avatar`, `account_id`) VALUES
(8, 'Trần', 'Hữu Thành', '03/04/2023 09:00:16', '', 9),
(9, 'Trần', 'Hữu Trưởng', '03/04/2023 09:03:09', '', 10),
(10, 'Lê', 'Quốc Thiên', '03/04/2023 09:09:32', '', 11),
(11, 'Tran', 'Minh Long', '11/04/2023 14:10:27', '', 15),
(17, 'Phạm', 'Phước Hiếu', '15/04/2023 11:08:41', '', 21),
(22, 'ABC', 'DEF', '15/04/2023 11:22:42', '', 26);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `bank_cards`
--
ALTER TABLE `bank_cards`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cardnumber` (`cardnumber`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_id_type_idx` (`user_id`,`type`) USING BTREE;

--
-- Indexes for table `goals`
--
ALTER TABLE `goals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `card_id` (`card_id`),
  ADD KEY `type_user_id_transactiondate` (`type`,`user_id`,`transactiondate`) USING BTREE;

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique` (`account_id`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `bank_cards`
--
ALTER TABLE `bank_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `bank_cards`
--
ALTER TABLE `bank_cards`
  ADD CONSTRAINT `bank_cards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`card_id`) REFERENCES `bank_cards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
  ADD CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
