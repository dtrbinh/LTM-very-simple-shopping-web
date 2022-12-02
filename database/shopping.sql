-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2022 at 08:29 PM
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
-- Database: `shopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `ma_the_loai` int(11) NOT NULL,
  `ten_the_loai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mo_ta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`ma_the_loai`, `ten_the_loai`, `mo_ta`) VALUES
(1, 'New', 'Quần áo mới thiết kế'),
(2, 'Sale', 'Quần áo giảm giá'),
(3, 'Style', 'Quần áo dạo phố'),
(4, 'Nam', 'Thời trang nam'),
(5, 'Nữ', 'Thời trang nữ'),
(6, 'Dép', 'Dép thời trang'),
(7, 'Nón', 'Nón thời trang');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id_history` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ma_san_pham` int(11) DEFAULT NULL,
  `ngay_mua` timestamp NULL DEFAULT NULL,
  `so_luong` int(11) DEFAULT NULL,
  `thanh_tien` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id_history`, `user_id`, `ma_san_pham`, `ngay_mua`, `so_luong`, `thanh_tien`) VALUES
(8, 13, 2, '2015-05-17 07:55:17', 1, 520000);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ma_san_pham` int(11) NOT NULL,
  `ma_the_loai` int(11) DEFAULT NULL,
  `ten_san_pham` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hinh_anh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gia_ban` double DEFAULT NULL,
  `hang_san_xuat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thong_tin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`ma_san_pham`, `ma_the_loai`, `ten_san_pham`, `hinh_anh`, `gia_ban`, `hang_san_xuat`, `thong_tin`) VALUES
(1, 1, 'Áo khoác mới', 'new.jpg', 100000, 'Balenciaga', 'Đang cập nhật'),
(2, 2, 'Áo đang giảm giá', 'sale1.jpg', 520000, 'Adidas', 'Đang cập nhật'),
(3, 3, 'Áo kiểu đơn giản', 'nostyle.jpg', 520000, 'Gucci', 'Đang cập nhật'),
(4, 4, 'Áo nam', 'nam1.jpg', 520000, 'Lv', 'Đang cập nhật'),
(5, 5, 'Áo nữ', 'nu1.jpg', 520000, 'LuonVuituoi', 'Đang cập nhật'),
(6, 6, 'Dép', 'dep1.jpg', 520000, 'Bitis', 'Đang cập nhật'),
(7, 7, 'Nón', 'non1.jpg', 520000, 'Tập đoàn tình báo NONSON', 'Đang cập nhật');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ngaysinh` date DEFAULT NULL,
  `gioitinh` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sdt` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diachi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `ngaysinh`, `gioitinh`, `email`, `sdt`, `diachi`, `role`) VALUES
(13, 'test', 'test123', '2002-02-28', 'Nam', 'dotranbinhqng02@gmail.com', '0945067412', 'lienchieu', '2'),
(14, 'user2', 'user2', '2015-05-11', 'Nam', 'thoatruong@gmail.com', '0983435628', 'danang', '2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`ma_the_loai`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`),
  ADD KEY `fk_history_product` (`ma_san_pham`) USING BTREE,
  ADD KEY `fk_history_user` (`user_id`) USING BTREE;

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ma_san_pham`),
  ADD KEY `fk_product_category` (`ma_the_loai`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `ma_the_loai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id_history` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ma_san_pham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
