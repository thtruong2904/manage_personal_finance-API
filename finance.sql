-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 03:46 PM
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
-- Database: `finance`
--

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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bank_cards`
--

INSERT INTO `bank_cards` (`id`, `user_id`, `name`, `balance`, `cardnumber`, `description`, `created_at`, `updated_at`) VALUES
(81, 1, 'Prudential Bank', '12500065.00', '0312000076160000', 'Ngan Hang Trung Uong Viet Nam', '2022-05-12 15:52:04', '2022-05-18 09:39:24'),
(91, 88, 'hshshd', '21548.00', '1255', 'hdhdhd', '2022-05-17 21:00:00', '2022-05-17 21:00:00'),
(93, 1, 'BIDV', '20000.00', '3123123', 'Tài khoản ngân hàng BIDV', '2022-05-18 09:05:52', '2022-05-28 16:42:08');

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
(1, 1, 20, '1500000.00', '2025-01-01', '2025-01-31', 'Tiết kiệm mua xe tăng hạng nhẹ T-34'),
(4, 1, 2, '125000.00', '2022-01-01', '2022-01-30', 'Tiền tiết kiệm mua xe tăng Thụy Điển EMIL 1951'),
(5, 1, 20, '23.00', '2022-02-10', '2022-02-12', 'Tiết kiệm mua xe tăng hạng nhẹ RU-215'),
(44, 80, 40, '50000.00', '2022-05-01', '2022-05-31', 'Mua TIVI'),
(45, 80, 40, '50000.00', '2022-05-01', '2022-05-31', 'Mua nhà 6 tầng');

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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `description`, `name`, `color`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Phương tiện chiến đấu bọc thép', 'Panzerkampfwagen', 'C5FF3F', 1, '2022-01-14 00:00:00', '2022-05-10 10:11:13'),
(2, 1, 'Xe tăng hạng nặng', 'Heavy Tank', '4C97FF', 1, '2022-01-15 10:22:27', '2022-03-31 23:55:08'),
(3, 1, 'Pháo tự hành chống tăng', 'Anti-tank destroyer', 'AE44FF', 1, '2022-01-15 10:22:46', '2022-05-12 19:55:28'),
(13, 1, 'Phương tiện chiến đấu bọc thép', 'Panzerkampfwagen', 'B92D5C', 2, '2022-02-07 11:42:57', '2022-04-06 07:53:36'),
(19, 1, 'A submarine is a ship capable of operation under-water', 'U-boat', '831100', 2, '2022-02-07 17:00:57', '2022-05-14 09:12:57'),
(20, 1, 'Pháo chống tăng', 'Tank Destroyer', '6CFF5B', 2, '2022-02-07 17:01:45', '2022-05-12 14:49:45'),
(40, 80, 'desfritio', 'test', '626000', 1, '2022-05-10 16:12:03', '2022-05-10 16:12:03'),
(52, 1, 'An aircraft carries is a war ship', 'Aircraft Carrier', '2E343F', 1, '2022-05-12 22:09:52', '2022-05-14 09:06:40'),
(53, 1, 'A submarine is a watercraft capable of independent operation under-water', 'Submarine', 'FF0000', 1, '2022-05-14 09:11:04', '2022-05-14 09:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `goals`
--

CREATE TABLE `goals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `balance` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `deposit` decimal(10,2) NOT NULL,
  `deadline` date NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `goals`
--

INSERT INTO `goals` (`id`, `user_id`, `name`, `balance`, `amount`, `deposit`, `deadline`, `status`) VALUES
(1, 1, 'Mua pháo', '10000.00', '2000000.00', '23341.00', '2022-05-29', 1),
(2, 1, 'Mua xe tăng chiến đấu chủ lực Type 71', '19000000.00', '535000.00', '12302246.00', '2022-01-31', 2),
(21, 1, 'Nghiên cứu modules E-100', '82000.00', '259000.00', '761.00', '2022-05-28', 1),
(22, 1, 'Chi phí lắp ráp E-100', '20242.00', '6100000.00', '0.00', '2022-05-30', 1),
(24, 1, 'Test', '456123.00', '123123.00', '0.00', '2022-05-30', 2),
(25, 1, 'Mua nhà sửa', '10000.00', '100000.00', '0.00', '2022-02-28', 1),
(26, 1, 'Test2', '12.00', '123.00', '110.00', '2022-05-30', 1),
(28, 1, 'Test', '123456.00', '123.00', '0.00', '2022-05-30', 2),
(36, 1, 'Mua nhà 2', '10000.00', '100000.00', '999.00', '2022-05-30', 1),
(37, 1, 'TestTest', '12345.00', '123.00', '0.00', '2022-05-30', 2),
(44, 1, 'Complete target', '100000.00', '100000.00', '0.00', '2022-05-14', 2),
(46, 1, 'Mua 1 suat Hadilao', '100000.00', '500000.00', '150184.00', '2022-05-15', 1),
(50, 1, 'outdated target', '400000.00', '1000000.00', '0.00', '2022-05-13', 3),
(55, 1, 'Test', '1.00', '10000000.00', '0.00', '2022-05-30', 1),
(56, 1, 'Test format', '10000000.00', '10000000.00', '0.00', '2022-05-31', 2),
(57, 1, 'Test limit', '99999999.00', '99999999.00', '0.00', '2022-05-23', 2),
(59, 1, 'Mua nhà 456', '10000.00', '100000.00', '0.00', '2022-05-30', 1),
(60, 1, 'hsh', '67.00', '6679.00', '0.00', '2022-05-19', 1);

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
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `content`, `is_read`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mục tiêu hết hạn', 'Mục tiêu đã hết hạn', 1, '2022-05-15 00:00:00', '2022-05-15 00:00:00'),
(2, 1, 'Mục tiêu sắp hết hạn', 'Mục tiêu sắp hết hạn', 1, '2022-05-15 00:00:00', '2022-05-15 00:00:00'),
(3, 1, 'Mục tiêu đã hoàn thành', 'Bạn đã hoàn thành mục tiêu', 1, '2022-05-15 00:00:00', '2022-05-15 00:00:00');

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
(213, 1, 2, 81, 'Bán Air Blade', '2500.00', 'Việt Nam', '2022-06-04', 1, 'Bán xe máy Honda Airblade'),
(214, 1, 20, 81, 'E-100: Nâng cấp pháo', '150.00', 'Việt Nam', '2022-05-15', 2, 'Nâng cấp lên pháo 140mm'),
(216, 1, 53, 81, 'Lương tháng', '200000.00', 'VietNam', '2022-06-04', 1, ''),
(217, 1, 20, 81, 'Đổ xăng', '30000.00', 'Petrolimex', '2022-05-18', 2, 'Đổ xăng'),
(219, 1, 19, 81, 'Đổ xăng', '75000.00', 'Petrolimex', '2022-06-04', 2, 'Đổ 2.7 lít xăng RON-92 giá 75 nghìn'),
(220, 1, 13, 81, 'Nước giải khát StrongBow', '47000.00', 'Coca-Cola', '2022-06-04', 2, 'Nước giải khát StrongBow chai'),
(221, 1, 53, 81, 'Nhận lương', '10000000.00', 'VN', '2022-06-04', 1, 'Lương'),
(222, 1, 19, 81, 'Đóng tiền', '1000000.00', 'VN', '2022-06-04', 2, 'Hóa đơn'),
(223, 1, 1, 81, 'Ăn sáng', '15000.00', 'Vietnam', '2022-06-04', 1, ''),
(224, 1, 53, 93, 'abc', '250.00', 'Vietnam', '2022-06-04', 1, 'fhk'),
(225, 1, 1, 81, 'Mauschen', '50000.00', 'Soviet', '2022-05-08', 1, 'Bán xe giá 50.000 bạc');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `account_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `account_type`, `email`, `password`, `firstname`, `lastname`, `is_active`, `date`, `avatar`) VALUES
(1, 'admin', 'tranhuutruong290401@gmail.com', '123', 'Tran', 'Truong', 1, '2023-02-13 04:16:59', 'https://donoithatdanang.com/wp-content/uploads/2021/11/hinh-anh-anime-boy-buon.jpg'),
(80, 'member', 'lequocthien@gmail.com', '123', 'Le', 'Thien', 1, '2023-02-14 18:03:43', ''),
(88, 'member', 'phuochieu@gmail.com', '123', 'Phuoc', 'Hieu', 1, '2023-02-17 20:51:37', '');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `card_id` (`card_id`),
  ADD KEY `type_user_id_transactiondate` (`type`,`user_id`,`transactiondate`) USING BTREE;

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_cards`
--
ALTER TABLE `bank_cards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `budgets`
--
ALTER TABLE `budgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `goals`
--
ALTER TABLE `goals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bank_cards`
--
ALTER TABLE `bank_cards`
  ADD CONSTRAINT `bank_cards_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `budgets`
--
ALTER TABLE `budgets`
  ADD CONSTRAINT `budgets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `budgets_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `goals`
--
ALTER TABLE `goals`
  ADD CONSTRAINT `goals_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_ibfk_4` FOREIGN KEY (`card_id`) REFERENCES `bank_cards` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
