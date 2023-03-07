-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 07:47 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coolmate_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id_cart` varchar(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_product` int(11) NOT NULL,
  `size` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_vn_name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`, `category_vn_name`, `image`) VALUES
(1, 'ao-dai-tay', 'Áo nam dài tay', 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/March2022/banner_ao_dai_tay.jpg'),
(2, 'ao-t-shirt', 'Áo T-Shirt', 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/June2022/Ao_thun_08.jpg'),
(3, 'ao-polo', 'Áo Polo', 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2022/polosport2x-100.jpg'),
(4, 'ao-so-mi', 'Áo sơ mi nam', 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/June2022/ao-so-mi.jpg'),
(5, 'quan-short', 'Quần short', 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/June2022/quan-short.jpg'),
(6, 'quan-jeans', 'Quần jeans', 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/June2022/jeans.jpg'),
(7, 'quan-dai', 'Quần dài', 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/June2022/quan-dai.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id_history` varchar(255) NOT NULL,
  `id_user` varchar(255) NOT NULL,
  `id_product` int(11) NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `amount` int(11) NOT NULL,
  `time_created` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id_history`, `id_user`, `id_product`, `size`, `color`, `amount`, `time_created`) VALUES
('029f8d79-3356-442a-b8d5-907ee53b10c7', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-28T06:38:16.434Z'),
('0c994e63-e891-4af3-acfb-fdfdf6b9ec57', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-27T19:58:49.827Z'),
('0e80be24-300e-4712-85b3-785098983974', '3be5330e-017b-408b-9aed-14688c10e780', 7, 'M', 'Xám nhạt', 2, '2023-02-28T06:19:28.879Z'),
('1490b98a-50ef-4708-92a8-de0e4efd40c1', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-28T06:09:36.741Z'),
('1522c1a3-5208-4ae1-bcdf-259a6a321183', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-22T17:39:18.968Z'),
('2747379c-8276-45ab-abfa-1a727848b8f5', '3be5330e-017b-408b-9aed-14688c10e780', 2, 'M', 'Xám nhạt', 3, '2023-02-28T06:18:54.751Z'),
('29aaf033-6bd7-4d4d-bf81-6fe0005b21d9', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-27T19:37:13.463Z'),
('37699e25-6eb3-4bef-8004-599a0462fd71', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-27T20:24:00.249Z'),
('47a8221b-325a-4b64-9b7e-d7456b80ab83', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Rêu bụi', 4, '2023-02-27T20:33:57.571Z'),
('59c17c9e-9e89-41b8-91d8-479ddd39b5da', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 2, '2023-02-28T06:18:33.620Z'),
('6e2d5680-3aa0-4458-866b-02064d3b0830', '3be5330e-017b-408b-9aed-14688c10e780', 2, 'M', 'Trắng', 1, '2023-02-27T19:33:14.096Z'),
('82318b8d-cf7c-4497-9255-6468b8e4a94c', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-27T19:51:23.887Z'),
('85f91db7-ea7a-4bf2-b858-a792faef2a14', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-27T19:44:18.781Z'),
('947cbefd-7ac6-4f30-9a20-e7b2633b7c65', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-27T20:25:35.701Z'),
('c3546ec8-a7bc-4c34-b541-a1ff7204e42e', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Trắng', 2, '2023-02-27T19:39:26.284Z'),
('d61fd9f1-42bf-4cae-9a75-56f2639334b6', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-28T06:32:53.792Z'),
('d9ddd9b4-664f-4cd9-bbbf-3fdb3219a79d', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 2, '2023-02-27T19:35:36.456Z'),
('e2575075-d9a6-4604-8963-a3907c18f0bf', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Trắng', 1, '2023-02-28T06:17:29.557Z'),
('e277e1c6-be37-44e8-9a3b-2ff991dcc6a6', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-27T19:34:18.804Z'),
('e3d304b1-b776-4b79-affc-cc8fe41c7654', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 2, '2023-02-28T06:32:32.080Z'),
('e52c596e-cbc9-4d58-ae9d-0a31e949eddb', '3be5330e-017b-408b-9aed-14688c10e780', 12, 'L', 'Xám nhạt', 1, '2023-02-27T20:33:35.634Z'),
('e5785617-ff29-4fce-a87c-c7d21f4ce5a8', '3be5330e-017b-408b-9aed-14688c10e780', 1, 'M', 'Xám nhạt', 1, '2023-02-27T20:22:41.942Z'),
('e83357ff-4251-4970-bf85-efdb3f88c839', '3be5330e-017b-408b-9aed-14688c10e780', 6, 'M', 'Xám nhạt', 3, '2023-02-28T06:39:10.610Z'),
('e96d7fc9-f41a-4ea8-a27a-caf3b03d1b76', '3be5330e-017b-408b-9aed-14688c10e780', 28, 'M', 'Xám nhạt', 2, '2023-02-28T06:31:53.405Z');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `review` float NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `image1` varchar(1000) NOT NULL,
  `image2` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `price`, `discount`, `review`, `product_name`, `image1`, `image2`) VALUES
(1, 1, 289000, 12, 4.8, 'Áo giữ nhiệt nam Modal Ultra Warm - mặc là ấm, thoáng khí - Đen\r\n', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/September2022/modal-ultra-warm-den-1-1.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2022/ao-giu-nhiet-modal-mau-den.jpg'),
(2, 1, 269000, 12, 4.7, 'Áo thun nam dài tay Cotton Compact V2 - Trắng', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/September2022/ao-dai-tay-compact-v2-trang3.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/September2022/ao-dai-tay-compact-v2-trang2.jpg'),
(3, 1, 399000, 45, 4.9, 'Áo Hoodie nam Daily Wear (mũ trùm có dây rút) - Xám nhạt', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2022/anh-mau-hoodie-daily-wear-xam-1-2.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2022/ao-hoodie-xam-nhat.jpg'),
(4, 1, 289000, 35, 4.9, 'Áo giữ nhiệt nam Modal Ultra Warm - mặc là ấm, thoáng khí - Đen', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/September2022/modal-ultra-warm-den-1-1.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2022/ao-giu-nhiet-modal-mau-den.jpg'),
(5, 1, 499000, 30, 4.7, 'Áo khoác gió thể thao HeiQ ViroBlock, chống UV & trượt nước - Xám xanh', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/September2022/heiQ_reu_xam_xanh_2.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/September2022/heiQ_reu_xam_xanh_1.jpg'),
(6, 2, 299000, 20, 4.9, 'Áo thun in The Future Is Yours Clean Vietnam - màu Trắng', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/June2022/the_future_trang1.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/April2022/tfiys2x.png'),
(7, 2, 14900, 12, 4, 'Áo thun nam Cotton Coolmate Basics 200gsm - Xanh biển', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/February2023/nha4.jpg.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/January2023/nhattttt.jpg'),
(8, 2, 199000, 40, 5, 'Áo thun thể thao nam ProMax-S2 thoáng khí - Trắng', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/tee_pro2_trang_1.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/tee_pro2_trang_1.jpg'),
(9, 2, 169000, 10, 4.9, 'Áo thun thể thao nam Recycle Active V1 - Xanh Navy', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/tee_recy_navy_1fix.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/teeactivenavytruoc_23.jpg'),
(10, 2, 259000, 12, 5, 'Áo thun nam Cotton Compact in Striving for growth - Trắng', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/January2023/_CMM9404.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/January2023/ao_mau_trang-100.jpg'),
(11, 3, 249000, 24, 4.9, 'Áo Polo thể thao nam Recycle Active V2 - Xanh ngọc', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/Polo_v2_xanh_ngoc_1234.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/xanh_ngoc_2d.jpg'),
(12, 3, 249000, 20, 4.9, 'Áo Polo thể thao nam ProMax-S3 thoáng khí - Xanh bóng đêm', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/September2022/pps3-14-5.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/polonavy_99.jpg'),
(13, 3, 289000, 35, 4.8, 'Áo Polo nam thể thao thoáng khí, nhuộm sạch Cleandye - Xanh bóng đêm', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/May2022/12DSC05091_copy.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/March2022/2-01.jpg'),
(14, 3, 239000, 17, 4.8, 'Áo Polo thể thao nam ProMax-S1 Logo thoáng khí - Xanh bóng đêm', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2021/pross1na6.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/May2022/thumb_polo_prmx_bong_dem.jpg'),
(15, 3, 249000, 24, 4, 'Áo Polo thể thao nam Recycle Active V2 - Xanh rêu', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/Polo_v2_reu_1234.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/v2xanhreutruoc_16.jpg'),
(16, 3, 289000, 35, 4.8, 'Áo Polo nam thể thao thoáng khí, nhuộm sạch Cleandye - Đen', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/May2022/DSC05220_copy.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/June2022/polocleandyeden.jpg'),
(17, 4, 349000, 12, 4.9, 'Áo Sơ mi nam Excool Limited ngắn tay chui đầu - Xám', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/DSC00703_copy.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/excoolsomixam_83.jpg'),
(18, 4, 499000, 14, 4.8, 'Áo sơ mi nam dài tay Café-DriS khử mùi hiệu quả - Xám tro', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2021/uIMG_0978_copy.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2021/uIMG_0963_copy.jpg'),
(19, 4, 499000, 14, 4.8, 'Áo sơ mi nam dài tay Café-DriS khử mùi hiệu quả - Trắng', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2021/cae28.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2021/cae26.jpg'),
(20, 4, 499000, 14, 4.8, 'Áo sơ mi nam dài tay Café-DriS khử mùi hiệu quả - Xám nhạt', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/May2022/somicfxam4.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/May2022/somicfxam4_1.jpg'),
(21, 4, 499000, 14, 4.8, 'Áo sơ mi nam dài tay Café-DriS khử mùi hiệu quả - Xanh nhạt', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2021/2uIMG_1077_copy.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2021/uIMG_1035_copy.jpg'),
(22, 5, 149000, 20, 4.8, 'Quần short nam thể thao Recycle 5\" thoáng khí - Đen', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/April2022/DSC04215-copy_39.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/May2022/thumb_recycle_5_den.jpg'),
(23, 5, 239000, 25, 4.9, 'Quần short nam thể thao Recycle 7\" thoáng khí - Xanh rêu', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/DSC01693-copyxanhreu_93.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/DSC01693-copyreuxanh.jpg'),
(24, 5, 189000, 16, 4.9, 'Quần short nam thể thao ProMax-S1 thoáng khí - Đen\r\n', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/August2022/_MG_0190_(1).jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/May2022/DSC05891-copy.jpg'),
(25, 5, 149000, 20, 4.8, 'Quần short nam thể thao Recycle 5\" thoáng khí - Xám nhạt', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2022/quan-short-recycle-5-inch-xam-nhat7.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2022/quan-short-recycle-5-inch-xam-nhat3.jpg'),
(26, 5, 149000, 20, 4.8, 'Quần short nam thể thao Recycle 5\" thoáng khí - Xám đậm', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2022/quan-short-recycle-5-inch-xam-dam6.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2022/quan-short-recycle-5-inch-xam-dam2.jpg'),
(27, 6, 599000, 33, 4.8, 'Quần Jeans Clean Denim dáng Slimfit - Xanh nhạt', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/April2022/1DSC06643-copy-2.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/April2022/32-0.jpg'),
(28, 6, 599000, 33, 4.8, 'Quần Jeans Clean Denim dáng Slimfit - Xanh đậm', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/April2022/1DSC06684-copy.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/April2022/31-0.jpg'),
(29, 6, 599000, 17, 4.9, 'Quần Jeans Clean Denim dáng Regular S2 - Xanh đậm', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/January2023/jean-denim-regular-s2-xanh-dam-7.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/January2023/jean-denim-regular-s2-xanh-dam-8.jpg'),
(30, 6, 599000, 17, 4.9, 'Quần Jeans Clean Denim dáng Slimfit S3 - Xanh sáng', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/January2023/Quan_jeans_s3_xanh_dam_3.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/December2022/1028_nhat_truoc.jpg'),
(31, 6, 399000, 7, 4.9, 'Quần Jeans Basic Slimfit xé gối - màu Xanh nhạt', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2022/anh-mau-jeans-basic-slimfit-xe-goi-xanh-nhat-6.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2022/anh-mau-jeans-basic-slimfit-xe-goi-xanh-nhat-7.jpg'),
(32, 7, 599000, 33, 4.8, 'Quần Jeans Clean Denim dáng Slimfit - Xanh nhạt', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/April2022/1DSC06643-copy-2.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/April2022/32-0.jpg'),
(33, 7, 599000, 17, 4.9, 'Quần Jeans Clean Denim dáng Regular S2 - Xanh garment', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2022/anh-mau-jeans-regular-s2-xanh-garment-6-2.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/November2022/jean-clean-denim-regular-s2-xanh-garment-7_52.jpg'),
(34, 7, 399000, 24, 4.9, 'Quần Jogger thể thao co giãn Graphene - Xám', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2022/Ghi_truoc.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/March2022/deggraphen-xam_copy.jpg'),
(35, 7, 299000, 33, 4.9, 'Quần nỉ nam Jogger Casual co giãn - Xám nhạt', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/September2022/jogger-casual-xam-nhat2_60.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2022/quan-ni-jogger-casual-xam.jpg'),
(36, 7, 349000, 15, 5, 'Quần thể thao nam Essential Jogger sợi Sorona - màu đen', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/February2023/uss_CMM5136.jpg', 'https://media.coolmate.me/cdn-cgi/image/width=672,height=990,quality=85,format=auto/uploads/October2022/quan-essential-jogger-soi-sorona-den-2_4.jpg'),
(48, 2, 100000, 0, 5, 'Áo vippro', 'http://localhost:4000/i/08ef04eb-e339-4c06-a763-084dfd65c103.png', 'http://localhost:4000/i/8ab86938-e4ad-4b8a-b73a-e180a047d3be.png');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `id_product`, `color`) VALUES
(1, 1, 'Xám nhạt'),
(2, 1, 'Rêu bụi'),
(3, 1, 'Xanh biển'),
(4, 1, 'Cacao'),
(5, 1, 'Trắng'),
(6, 1, 'Đen'),
(7, 2, 'Xám nhạt'),
(8, 2, 'Rêu bụi'),
(9, 2, 'Xanh biển'),
(10, 2, 'Cacao'),
(11, 2, 'Trắng'),
(12, 2, 'Đen'),
(13, 3, 'Xám nhạt'),
(14, 3, 'Rêu bụi'),
(15, 3, 'Xanh biển'),
(16, 3, 'Cacao'),
(17, 3, 'Trắng'),
(18, 3, 'Đen'),
(19, 4, 'Xám nhạt'),
(20, 4, 'Rêu bụi'),
(21, 4, 'Xanh biển'),
(22, 4, 'Cacao'),
(23, 4, 'Trắng'),
(24, 4, 'Đen'),
(25, 5, 'Xám nhạt'),
(26, 5, 'Rêu bụi'),
(27, 5, 'Xanh biển'),
(28, 5, 'Cacao'),
(29, 5, 'Trắng'),
(30, 5, 'Đen'),
(31, 6, 'Xám nhạt'),
(32, 6, 'Rêu bụi'),
(33, 6, 'Xanh biển'),
(34, 6, 'Cacao'),
(35, 6, 'Trắng'),
(36, 6, 'Đen'),
(37, 7, 'Xám nhạt'),
(38, 7, 'Rêu bụi'),
(39, 7, 'Xanh biển'),
(40, 7, 'Cacao'),
(41, 7, 'Trắng'),
(42, 7, 'Đen'),
(43, 8, 'Xám nhạt'),
(44, 8, 'Rêu bụi'),
(45, 8, 'Xanh biển'),
(46, 8, 'Cacao'),
(47, 8, 'Trắng'),
(48, 8, 'Đen'),
(49, 9, 'Xám nhạt'),
(50, 9, 'Rêu bụi'),
(51, 9, 'Xanh biển'),
(52, 9, 'Cacao'),
(53, 9, 'Trắng'),
(54, 9, 'Đen'),
(55, 10, 'Xám nhạt'),
(56, 10, 'Rêu bụi'),
(57, 10, 'Xanh biển'),
(58, 10, 'Cacao'),
(59, 10, 'Trắng'),
(60, 10, 'Đen'),
(61, 11, 'Xám nhạt'),
(62, 11, 'Rêu bụi'),
(63, 11, 'Xanh biển'),
(64, 11, 'Cacao'),
(65, 11, 'Trắng'),
(66, 11, 'Đen'),
(67, 12, 'Xám nhạt'),
(68, 12, 'Rêu bụi'),
(69, 12, 'Xanh biển'),
(70, 12, 'Cacao'),
(71, 12, 'Trắng'),
(72, 12, 'Đen'),
(73, 13, 'Xám nhạt'),
(74, 13, 'Rêu bụi'),
(75, 13, 'Xanh biển'),
(76, 13, 'Cacao'),
(77, 13, 'Trắng'),
(78, 13, 'Đen'),
(79, 14, 'Xám nhạt'),
(80, 14, 'Rêu bụi'),
(81, 14, 'Xanh biển'),
(82, 14, 'Cacao'),
(83, 14, 'Trắng'),
(84, 14, 'Đen'),
(85, 15, 'Xám nhạt'),
(86, 15, 'Rêu bụi'),
(87, 15, 'Xanh biển'),
(88, 15, 'Cacao'),
(89, 15, 'Trắng'),
(90, 15, 'Đen'),
(91, 16, 'Xám nhạt'),
(92, 16, 'Rêu bụi'),
(93, 16, 'Xanh biển'),
(94, 16, 'Cacao'),
(95, 16, 'Trắng'),
(96, 16, 'Đen'),
(97, 17, 'Xám nhạt'),
(98, 17, 'Rêu bụi'),
(99, 17, 'Xanh biển'),
(100, 17, 'Cacao'),
(101, 17, 'Trắng'),
(102, 17, 'Đen'),
(103, 18, 'Xám nhạt'),
(104, 18, 'Rêu bụi'),
(105, 18, 'Xanh biển'),
(106, 18, 'Cacao'),
(107, 18, 'Trắng'),
(108, 18, 'Đen'),
(109, 19, 'Xám nhạt'),
(110, 19, 'Rêu bụi'),
(111, 19, 'Xanh biển'),
(112, 19, 'Cacao'),
(113, 19, 'Trắng'),
(114, 19, 'Đen'),
(115, 20, 'Xám nhạt'),
(116, 20, 'Rêu bụi'),
(117, 20, 'Xanh biển'),
(118, 20, 'Cacao'),
(119, 20, 'Trắng'),
(120, 20, 'Đen'),
(121, 21, 'Xám nhạt'),
(122, 21, 'Rêu bụi'),
(123, 21, 'Xanh biển'),
(124, 21, 'Cacao'),
(125, 21, 'Trắng'),
(126, 21, 'Đen'),
(127, 22, 'Xám nhạt'),
(128, 22, 'Rêu bụi'),
(129, 22, 'Xanh biển'),
(130, 22, 'Cacao'),
(131, 22, 'Trắng'),
(132, 22, 'Đen'),
(133, 23, 'Xám nhạt'),
(134, 23, 'Rêu bụi'),
(135, 23, 'Xanh biển'),
(136, 23, 'Cacao'),
(137, 23, 'Trắng'),
(138, 23, 'Đen'),
(139, 24, 'Xám nhạt'),
(140, 24, 'Rêu bụi'),
(141, 24, 'Xanh biển'),
(142, 24, 'Cacao'),
(143, 24, 'Trắng'),
(144, 24, 'Đen'),
(145, 25, 'Xám nhạt'),
(146, 25, 'Rêu bụi'),
(147, 25, 'Xanh biển'),
(148, 25, 'Cacao'),
(149, 25, 'Trắng'),
(150, 25, 'Đen'),
(151, 26, 'Xám nhạt'),
(152, 26, 'Rêu bụi'),
(153, 26, 'Xanh biển'),
(154, 26, 'Cacao'),
(155, 26, 'Trắng'),
(156, 26, 'Đen'),
(157, 27, 'Xám nhạt'),
(158, 27, 'Rêu bụi'),
(159, 27, 'Xanh biển'),
(160, 27, 'Cacao'),
(161, 27, 'Trắng'),
(162, 27, 'Đen'),
(163, 28, 'Xám nhạt'),
(164, 28, 'Rêu bụi'),
(165, 28, 'Xanh biển'),
(166, 28, 'Cacao'),
(167, 28, 'Trắng'),
(168, 28, 'Đen'),
(169, 29, 'Xám nhạt'),
(170, 29, 'Rêu bụi'),
(171, 29, 'Xanh biển'),
(172, 29, 'Cacao'),
(173, 29, 'Trắng'),
(174, 29, 'Đen'),
(175, 30, 'Xám nhạt'),
(176, 30, 'Rêu bụi'),
(177, 30, 'Xanh biển'),
(178, 30, 'Cacao'),
(179, 30, 'Trắng'),
(180, 30, 'Đen'),
(181, 31, 'Xám nhạt'),
(182, 31, 'Rêu bụi'),
(183, 31, 'Xanh biển'),
(184, 31, 'Cacao'),
(185, 31, 'Trắng'),
(186, 31, 'Đen'),
(187, 32, 'Xám nhạt'),
(188, 32, 'Rêu bụi'),
(189, 32, 'Xanh biển'),
(190, 32, 'Cacao'),
(191, 32, 'Trắng'),
(192, 32, 'Đen'),
(193, 33, 'Xám nhạt'),
(194, 33, 'Rêu bụi'),
(195, 33, 'Xanh biển'),
(196, 33, 'Cacao'),
(197, 33, 'Trắng'),
(198, 33, 'Đen'),
(199, 34, 'Xám nhạt'),
(200, 34, 'Rêu bụi'),
(201, 34, 'Xanh biển'),
(202, 34, 'Cacao'),
(203, 34, 'Trắng'),
(204, 34, 'Đen'),
(205, 35, 'Xám nhạt'),
(206, 35, 'Rêu bụi'),
(207, 35, 'Xanh biển'),
(208, 35, 'Cacao'),
(209, 35, 'Trắng'),
(210, 35, 'Đen'),
(211, 36, 'Xám nhạt'),
(212, 36, 'Rêu bụi'),
(213, 36, 'Xanh biển'),
(214, 36, 'Cacao'),
(215, 36, 'Trắng'),
(216, 36, 'Đen'),
(217, 37, 'Xám nhạt'),
(218, 37, 'Rêu bụi'),
(219, 37, 'Xanh biển'),
(220, 37, 'Cacao'),
(221, 37, 'Trắng'),
(222, 37, 'Đen'),
(223, 48, 'Xám nhạt'),
(224, 48, 'Rêu bụi'),
(225, 48, 'Xanh biển');

-- --------------------------------------------------------

--
-- Table structure for table `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_image`
--

INSERT INTO `product_image` (`id`, `id_product`, `image`) VALUES
(1, 1, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/modal-ultra-warm-den-1-1.jpg'),
(2, 1, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/October2022/ao-giu-nhiet-modal-mau-den.jpg'),
(3, 1, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/modal-ultra-warm-den-3-1.jpg'),
(4, 1, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/modal-ultra-warm-den-4-1.jpg'),
(5, 1, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/modal-ultra-warm-den-5.jpg'),
(6, 2, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/ao-dai-tay-compact-v2-trang3.jpg'),
(7, 2, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/ao-dai-tay-compact-v2-trang2.jpg'),
(8, 2, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/ao-dai-tay-compact-v2-trang4.jpg'),
(9, 2, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/ao-dai-tay-compact-v2-trang5.jpg'),
(10, 2, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/ao-dai-tay-compact-v2-trang1.jpg'),
(11, 3, 'https://media.coolmate.me/cdn-cgi/image/width=80,height=80,quality=80,format=auto/uploads/November2022/anh-mau-hoodie-daily-wear-xam-5-2.jpg'),
(12, 3, 'https://media.coolmate.me/cdn-cgi/image/width=80,height=80,quality=80,format=auto/uploads/November2022/anh-mau-hoodie-daily-wear-xam-4-2.jpg'),
(13, 3, 'https://media.coolmate.me/cdn-cgi/image/width=80,height=80,quality=80,format=auto/uploads/November2022/anh-mau-hoodie-daily-wear-xam-3-2.jpg'),
(14, 3, 'https://media.coolmate.me/cdn-cgi/image/width=80,height=80,quality=80,format=auto/uploads/November2022/anh-mau-hoodie-daily-wear-xam-2-2.jpg'),
(15, 3, 'https://media.coolmate.me/cdn-cgi/image/width=80,height=80,quality=80,format=auto/uploads/November2022/anh-mau-hoodie-daily-wear-xam-2.jpg'),
(16, 4, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/modal-ultra-warm-den-1-1.jpg'),
(17, 4, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/October2022/ao-giu-nhiet-modal-mau-den.jpg'),
(18, 4, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/modal-ultra-warm-den-3-1.jpg'),
(19, 4, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/modal-ultra-warm-den-4-1.jpg'),
(20, 4, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/modal-ultra-warm-den-5.jpg'),
(21, 5, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/heiQ_reu_xam_xanh_2.jpg'),
(22, 5, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/heiQ_reu_xam_xanh_1.jpg'),
(23, 5, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/heiQ_reu_xam_xanh_3.jpg'),
(24, 5, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/heiQ_reu_xam_xanh_4.jpg'),
(25, 5, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/heiQ_reu_xam_xanh_5.jpg'),
(26, 6, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/June2022/the_future_trang1.jpg'),
(27, 6, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/April2022/tfiys2x.png'),
(28, 6, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/May2022/Tee_the_future_2.jpg'),
(34, 7, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/February2023/nha4.jpg.jpg'),
(35, 7, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/January2023/nhattttt.jpg'),
(36, 7, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/February2023/nha1a.jpg.jpg'),
(37, 8, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/tee_pro2_trang_1.jpg'),
(38, 8, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/tee_pro2_trang_2.jpg'),
(39, 8, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/tee_pro2_trang_3.jpg'),
(40, 8, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/tee_pro2_trang_4.jpg'),
(41, 9, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/tee_recy_navy_1fix.jpg'),
(42, 9, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/teeactivenavytruoc_23.jpg'),
(43, 9, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/tee_recy_navy_2.jpg'),
(44, 9, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/tee_recy_navy_3.jpg'),
(45, 10, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/January2023/_CMM9404.jpg'),
(46, 10, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/January2023/_CMM9411.jpg'),
(47, 10, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/January2023/_CMM9457.jpg'),
(48, 10, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/January2023/mau_trang_1-100.jpg'),
(49, 11, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/Polo_v2_xanh_ngoc_1234.jpg'),
(50, 11, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/xanh_ngoc_2d.jpg'),
(51, 11, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/xanh_ngoc_v2_3.jpg'),
(52, 11, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/xanh_ngoc_v2_2.jpg'),
(53, 12, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/September2022/pps3-14-5.jpg'),
(54, 12, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/polonavy_99.jpg'),
(55, 12, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/s3-14-6.jpg'),
(56, 12, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/August2022/s3-14-7.jpg'),
(57, 13, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/May2022/DSC05220_copy.jpg'),
(58, 13, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/June2022/polocleandyeden.jpg'),
(59, 13, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/May2022/DSC05232_copy.jpg'),
(60, 13, 'https://media.coolmate.me/cdn-cgi/image/quality=80,format=auto/uploads/May2022/DSC05237_copy.jpg'),
(61, 48, 'http://localhost:4000/i/3c5f450a-9515-4366-9e93-4c4b97a91bfa.png'),
(62, 48, 'http://localhost:4000/i/91f47d39-00af-45db-b7c5-62e5d27ece07.png'),
(63, 48, 'http://localhost:4000/i/a1cf8e32-5309-431e-bec1-4257d74be979.png'),
(64, 48, 'http://localhost:4000/i/15ee5afb-41b4-41b4-aa6a-f2a372ada5e1.png'),
(65, 48, 'http://localhost:4000/i/6adc1c69-5ee0-4f1b-a9d5-570210c9288f.png');

-- --------------------------------------------------------

--
-- Table structure for table `product_size`
--

CREATE TABLE `product_size` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `size` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_size`
--

INSERT INTO `product_size` (`id`, `id_product`, `size`) VALUES
(1, 1, 'S'),
(2, 1, 'M'),
(3, 1, 'L'),
(4, 1, 'XL'),
(5, 2, 'S'),
(6, 2, 'M'),
(7, 2, 'L'),
(8, 2, 'XL'),
(9, 3, 'S'),
(10, 3, 'M'),
(11, 3, 'L'),
(12, 3, 'XL'),
(13, 4, 'S'),
(14, 4, 'M'),
(15, 4, 'L'),
(16, 4, 'XL'),
(17, 5, 'S'),
(18, 5, 'M'),
(19, 5, 'L'),
(20, 5, 'XL'),
(21, 6, 'S'),
(22, 6, 'M'),
(23, 6, 'L'),
(24, 6, 'XL'),
(25, 7, 'S'),
(26, 7, 'M'),
(27, 7, 'L'),
(28, 7, 'XL'),
(29, 8, 'S'),
(30, 8, 'M'),
(31, 8, 'L'),
(32, 8, 'XL'),
(33, 9, 'S'),
(34, 9, 'M'),
(35, 9, 'L'),
(36, 9, 'XL'),
(37, 10, 'S'),
(38, 10, 'M'),
(39, 10, 'L'),
(40, 10, 'XL'),
(41, 11, 'S'),
(42, 11, 'M'),
(43, 11, 'L'),
(44, 11, 'XL'),
(45, 12, 'S'),
(46, 12, 'M'),
(47, 12, 'L'),
(48, 12, 'XL'),
(49, 13, 'S'),
(50, 13, 'M'),
(51, 13, 'L'),
(52, 13, 'XL'),
(53, 14, 'S'),
(54, 14, 'M'),
(55, 14, 'L'),
(56, 14, 'XL'),
(57, 15, 'S'),
(58, 15, 'M'),
(59, 15, 'L'),
(60, 15, 'XL'),
(61, 16, 'S'),
(62, 16, 'M'),
(63, 16, 'L'),
(64, 16, 'XL'),
(65, 17, 'S'),
(66, 17, 'M'),
(67, 17, 'L'),
(68, 17, 'XL'),
(69, 18, 'S'),
(70, 18, 'M'),
(71, 18, 'L'),
(72, 18, 'XL'),
(73, 19, 'S'),
(74, 19, 'M'),
(75, 19, 'L'),
(76, 19, 'XL'),
(77, 20, 'S'),
(78, 20, 'M'),
(79, 20, 'L'),
(80, 20, 'XL'),
(81, 21, 'S'),
(82, 21, 'M'),
(83, 21, 'L'),
(84, 21, 'XL'),
(85, 22, 'S'),
(86, 22, 'M'),
(87, 22, 'L'),
(88, 22, 'XL'),
(89, 23, 'S'),
(90, 23, 'M'),
(91, 23, 'L'),
(92, 23, 'XL'),
(93, 24, 'S'),
(94, 24, 'M'),
(95, 24, 'L'),
(96, 24, 'XL'),
(97, 25, 'S'),
(98, 25, 'M'),
(99, 25, 'L'),
(100, 25, 'XL'),
(101, 26, 'S'),
(102, 26, 'M'),
(103, 26, 'L'),
(104, 26, 'XL'),
(105, 27, 'S'),
(106, 27, 'M'),
(107, 27, 'L'),
(108, 27, 'XL'),
(109, 28, 'S'),
(110, 28, 'M'),
(111, 28, 'L'),
(112, 28, 'XL'),
(113, 29, 'S'),
(114, 29, 'M'),
(115, 29, 'L'),
(116, 29, 'XL'),
(117, 30, 'S'),
(118, 30, 'M'),
(119, 30, 'L'),
(120, 30, 'XL'),
(121, 31, 'S'),
(122, 31, 'M'),
(123, 31, 'L'),
(124, 31, 'XL'),
(125, 32, 'S'),
(126, 32, 'M'),
(127, 32, 'L'),
(128, 32, 'XL'),
(129, 33, 'S'),
(130, 33, 'M'),
(131, 33, 'L'),
(132, 33, 'XL'),
(133, 34, 'S'),
(134, 34, 'M'),
(135, 34, 'L'),
(136, 34, 'XL'),
(137, 35, 'S'),
(138, 35, 'M'),
(139, 35, 'L'),
(140, 35, 'XL'),
(141, 36, 'S'),
(142, 36, 'M'),
(143, 36, 'L'),
(144, 36, 'XL'),
(145, 48, 'S'),
(146, 48, 'L'),
(147, 48, 'M');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `phone`, `email`, `password`) VALUES
('2cc3e473-e274-449f-bc30-2811acac0ba3', 'datist pham', '03287328192', 'g@gmail.com', '25f9e794323b453885f5181f1b624d0b'),
('3be5330e-017b-408b-9aed-14688c10e780', 'nguyen van a', '03829381292', 'f@gmail.com', '25d55ad283aa400af464c76d713c07ad');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id_product`,`id_user`,`size`,`color`),
  ADD UNIQUE KEY `id_cart` (`id_cart`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id_history`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_product_2` (`id_product`),
  ADD KEY `id_product_3` (`id_product`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `product_size`
--
ALTER TABLE `product_size`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `product_size`
--
ALTER TABLE `product_size`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id`) REFERENCES `product_color` (`id`);

--
-- Constraints for table `product_image`
--
ALTER TABLE `product_image`
  ADD CONSTRAINT `product_image_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_size`
--
ALTER TABLE `product_size`
  ADD CONSTRAINT `product_size_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
