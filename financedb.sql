-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2023 at 09:28 AM
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
(11, 'lequocthien', '$2a$10$WbOxp9dIZR7RAxf4lqGtsO3bgz6wR/RJM5.ZwLjitVKrlD4zgNx7m', 'tranthithuylinh02112011@gmail.com', 2, 1),
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
(10, 10, 'MSB', '6085000.00', '123456789', 'Ngân hàng hàng hải Việt Nam', '2023-04-07 14:22:27', '21/04/2023 13:26:04'),
(117, 11, 'VietcomBank', '1500000.00', '0985723525', 'Ngân hàng Thương mại Cổ phần Ngoại thương', '18/04/2023 11:40:44', '19/04/2023 23:08:12'),
(119, 10, 'VietcomBank', '14900000.00', '098572352', 'Ngân hàng Tây Nam Bộ', '21/04/2023 01:47:26', '21/04/2023 01:47:26'),
(120, 10, 'BIDV', '14750000.00', '010010183456', 'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam', '23/04/2023 12:08:26', '23/04/2023 12:08:26');

-- --------------------------------------------------------

--
-- Table structure for table `budgets`
--

CREATE TABLE `budgets` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `fromdate` date NOT NULL,
  `todate` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `budgets`
--

INSERT INTO `budgets` (`id`, `user_id`, `category_id`, `amount`, `fromdate`, `todate`, `description`) VALUES
(11, 10, 66, '550000.00', '2023-05-01', '2023-05-31', 'Ăn nhậu các thứ bala bala bala'),
(13, 10, 58, '1100000.00', '2023-05-01', '2023-05-31', 'Tiền mua đồ dùng học tập'),
(15, 10, 68, '1500000.00', '2023-05-01', '2023-05-31', 'Sinh hoạt hàng ngày');

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
(58, 10, 'ABCDEF', 'Giáo dục', '#7fff00', 2, '13/04/2023 16:10:09', '13/04/2023 17:10:18'),
(61, 11, 'Đi khắp mọi nơi', 'Đi du lịch', '#ec6349', 2, '19/04/2023 23:00:04', '20/04/2023 01:12:21'),
(62, 11, 'Tiền lương các tháng', 'Lấy lương', '#6cec49', 1, '19/04/2023 23:04:09', '19/04/2023 23:04:09'),
(65, 10, 'Mua quần áo mới hàng tháng', 'Mua quần áo', '#e32323', 2, '23/04/2023 11:50:12', '23/04/2023 11:53:22'),
(66, 10, 'Tụ tập bạn bè cuối tuần', 'Giải trí', '#2330e3', 2, '23/04/2023 11:54:25', '23/04/2023 11:54:25'),
(67, 10, 'Lương đi làm hàng tháng', 'Lương', '#3fe15f', 1, '23/04/2023 11:54:59', '23/04/2023 11:54:59'),
(68, 10, 'Tiền ăn uống trang trải hàng ngày', 'Sinh hoạt phí', '#e13faf', 2, '23/04/2023 11:55:54', '23/04/2023 11:55:54'),
(69, 10, 'Để dành một khoản cho bản thân', 'Tiết kiệm', '#8bace9', 1, '23/04/2023 11:57:48', '25/04/2023 22:19:54');

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
(62, 10, 'Để dành cho bố mẹ xây nhà', '30000000.00', '1000000000.00', '4000000.00', '2026-06-20', 1),
(67, 10, 'Tiết kiệm mua máy tính mới', '100000.00', '15000000.00', '0.00', '2023-07-06', 1),
(68, 10, 'test', '125000.00', '250000.00', '125000.00', '2023-04-29', 2),
(69, 10, 'Đi du lịch', '100000.00', '1000000.00', '100000.00', '2023-04-22', 3);

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
(134, 10, 'Mục tiêu đã hoàn thành', 'Bạn đã hoàn thành mục tiêu test', 1, '2023-04-23'),
(135, 10, 'Mục tiêu đã hết hạn', 'Mục tiêu Đi du lịch đã hết hạn', 1, '2023-04-23');

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
(230, 10, 58, 10, 'Mua sách', '300000.00', 'Nhà sách Phương Nam', '2023-04-25', 2, 'Mua sách Văn học'),
(231, 10, 3, 10, 'Bán khung xe', '100000.00', 'Cửa hàng sửa xe honda', '2023-03-23', 1, 'Bán cái khung xe cũ mua khung xe mới'),
(237, 10, 68, 10, 'Mua mì ăn sáng', '100000.00', 'Quận 9', '2023-04-18', 2, 'Mì tôm Hảo Hảo'),
(238, 10, 66, 119, 'Đi sinh nhật bạn', '200000.00', 'Quận 9', '2023-04-21', 2, 'Sinh nhật bạn Trưởng'),
(240, 10, 67, 10, 'Lấy lương', '3000000.00', 'VNPT Quận 9', '2023-04-29', 1, 'Lương tháng 04'),
(241, 10, 68, 120, 'Cafe sáng', '50000.00', 'Trạm cafe', '2023-04-25', 2, 'Đi cafe với Trung'),
(242, 10, 66, 120, 'test', '200000.00', 'abc', '2023-04-25', 2, 'test'),
(243, 10, 69, 10, 'Mẹ gửi tiền', '1000000.00', 'Quận 9', '2023-04-25', 1, 'Mẹ cho tiền sài'),
(245, 10, 68, 10, 'Ăn tối', '25000.00', 'Quán hủ tiếu', '2023-04-25', 2, 'Ăn hủ tiếu với PA'),
(246, 10, 68, 10, 'Ăn sáng', '15000.00', 'BCVT', '2023-04-25', 2, 'Ăn sáng'),
(247, 10, 68, 10, 'Mua hoa', '150000.00', 'Quận 9', '2023-05-10', 2, 'Mua hoa tặng bạn tốt nghiệp'),
(248, 10, 68, 10, 'Ăn sáng', '20000.00', 'Quận 9', '2023-04-26', 2, 'Ăn bánh mì'),
(249, 10, 68, 10, 'Ăn tối', '30000.00', 'Quận 9', '2023-04-27', 2, 'Ăn phở bò'),
(250, 10, 68, 119, 'Đổ xăng', '50000.00', 'Quận 9', '2023-04-27', 2, 'Đổ xăng 24k/lit'),
(251, 10, 69, 10, 'Chú Hùng cho', '500000.00', 'Dĩ An', '2023-04-27', 1, 'Chú Hùng cho tiền đổ xăng'),
(252, 10, 69, 10, 'Trả nợ', '100000.00', 'Quận 9', '2023-04-27', 1, 'có người trả nợ'),
(253, 10, 67, 10, 'Trợ cấp', '500000.00', 'VNPT', '2023-04-27', 1, 'Công ty cho trợ cấp'),
(254, 10, 69, 119, 'Làm thêm job ngoài', '500000.00', 'Quận 9', '2023-04-27', 1, 'Làm thêm job sau giờ hành chính'),
(255, 10, 66, 119, 'Đi picnic', '300000.00', 'Dĩ An', '2023-04-28', 2, 'Đi cắm trại 30/04'),
(256, 10, 69, 10, 'Mẹ gửi', '500000.00', 'Quận 9', '2023-05-08', 1, 'Mẹ gửi tiền tiêu vặt'),
(257, 10, 58, 10, 'Mua sách', '200000.00', 'Quận 9', '2023-05-09', 2, 'Mua sách về IT'),
(258, 10, 67, 10, 'Làm thêm', '300000.00', 'Quận 9', '2023-05-09', 1, 'Làm thêm sau giờ học'),
(259, 10, 69, 10, 'ABC trả nợ', '100000.00', 'Quận 9', '2023-05-11', 1, 'Nợ từ tháng trước. Đã trả'),
(260, 10, 68, 10, 'Mua gạo', '50000.00', 'Quận 9', '2023-05-11', 2, 'Mua gạo 14k/kg');

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
(10, 'Lê', 'Quốc Thiên', '03/04/2023 09:09:32', 'https://vapa.vn/wp-content/uploads/2022/12/tai-hinh-nen-anime-ngau-001.jpg', 11),
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
-- Indexes for table `budgets`
--
ALTER TABLE `budgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

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
-- Constraints for table `budgets`
--
ALTER TABLE `budgets`
  ADD CONSTRAINT `mp_budgets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `mp_budgets_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
