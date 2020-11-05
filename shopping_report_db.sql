-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 05, 2020 at 01:35 PM
-- Server version: 5.7.28-0ubuntu0.18.04.4
-- PHP Version: 7.2.24-0ubuntu0.18.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopping_report_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Clothing-Tshirt', 1, '2020-10-28 12:42:27', '2020-10-28 12:42:27'),
(2, 'Clothing-Hoodies', 1, '2020-10-28 12:43:05', '2020-10-28 12:43:05'),
(3, 'Clothing-Accessories', 1, '2020-10-28 12:43:35', '2020-10-28 12:43:35'),
(4, 'Music', 1, '2020-10-28 12:44:03', '2020-10-28 12:44:03'),
(5, 'Decor', 1, '2020-10-28 12:44:15', '2020-10-28 12:44:15');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_28_081828_create_categories_table', 2),
(5, '2020_10_28_082219_create_products_table', 3),
(6, '2020_10_28_082916_create_order_status_table', 4),
(7, '2020_10_28_083208_create_orders_table', 5),
(8, '2020_10_28_085407_create_order_product_table', 6);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_postalcode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_name_on_card` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_discount` double NOT NULL DEFAULT '0',
  `billing_tax` double NOT NULL,
  `billing_total` double NOT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `order_status` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `billing_email`, `billing_name`, `billing_address`, `billing_city`, `billing_postalcode`, `billing_phone`, `billing_name_on_card`, `billing_discount`, `billing_tax`, `billing_total`, `payment_gateway`, `order_status`, `created_at`, `updated_at`) VALUES
(1, 2, 'kaiser@msn.com', 'Mario Speedwagon', 'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016', 'Bangalore', '790102', '8888437689', 'Mario Speedwagon', 10, 1, 100, 'Stripe', 1, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(2, 3, 'bmcmahon@hotmail.com', 'Petey Cruiser', 'GELEPHU, BHUTAN GELEPHU', 'BHUTAN GELEPHU', '790103', '8888437690', 'Petey Cruiser', 10, 1, 105, 'Stripe', 1, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(3, 4, 'hmbrand@verizon.net', 'Anna Sthesia', 'PHUENTSHOLING, POST BOX: 11 PHUENTSHOLING', '11 PHUENTSHOLING', '790104', '8888437691', 'Anna Sthesia', 10, 1, 110, 'Stripe', 1, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(4, 5, 'mglee@icloud.com', 'Paul Molive', 'P.O. PHUNTSOLINGBHUTAN PHUENTSHOLING', 'PHUNTSOLINGBHUTAN PHUENTSHOLING', '790105', '8888437692', 'Paul Molive', 10, 1, 115, 'Stripe', 1, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(5, 6, 'nimaclea@live.com', 'Anna Mull', 'DPCL acc GELEPHU GELEPHU', 'GELEPHU GELEPHU', '790106', '8888437693', 'Anna Mull', 10, 1, 120, 'Stripe', 1, '2020-08-15 17:15:49', '2020-10-31 06:56:34'),
(6, 7, 'psichel@verizon.net', 'Gail Forcewind', 'BHUTAN OIL DISTRIBUTORS GELEPHU', 'DISTRIBUTORS GELEPHU', '790107', '8888437694', 'Gail Forcewind', 10, 1, 125, 'Stripe', 1, '2020-09-01 17:15:49', '2020-10-31 06:56:18'),
(7, 8, 'elmer@me.com', 'Paige Turner', 'DPCL acc PHUENTSHOLINGUPPER PHUENTSHOLING PHUENTSHOLING', 'PHUENTSHOLING PHUENTSHOLING', '790108', '8888437695', 'Paige Turner', 10, 1, 130, 'Stripe', 1, '2020-10-15 17:15:49', '2020-10-31 06:56:09'),
(8, 9, 'thaljef@mac.com', 'Bob Frapples', 'Q, POINT,10-MANSINGH ROAD DELHI', 'ROAD DELHI', '790109', '8888437696', 'Bob Frapples', 10, 1, 135, 'Stripe', 1, '2020-09-13 17:15:49', '2020-10-31 06:55:56'),
(9, 10, 'rmcfarla@sbcglobal.net', 'Walter Melon', 'Opp. GURUDWARA BANGLA SAHIB DELHI', 'SAHIB DELHI', '790110', '8888437697', 'Walter Melon', 10, 1, 140, 'Stripe', 1, '2020-09-12 17:15:49', '2020-10-31 06:55:44'),
(10, 11, 'fmerges@msn.com', 'Nick R. Bocker', 'PRATAP BUILDING,N-BLOCK,C.PLACEN BLOCK , CP DELHI', 'CP DELHI', '790111', '8888437698', 'Nick R. Bocker', 10, 1, 145, 'Stripe', 1, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(11, 12, 'retoh@outlook.com', 'Barb Ackue', '12, SCINDIA HOUSEK.G.MARG C.PC PLACE DELHI', 'PLACE DELHI', '790112', '8888437699', 'Barb Ackue', 10, 1, 150, 'Stripe', 2, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(12, 13, 'tamas@att.net', 'Buck Kinnear', 'JANPATH,Opp. EASTERN COURT DELHI', 'COURT DELHI', '790113', '8888437700', 'Buck Kinnear', 10, 1, 155, 'Stripe', 2, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(13, 14, 'thassine@me.com', 'Greta Life', 'H - BLOCK, CONN.PLACEC PLACE DELHI', 'PLACE DELHI', '790114', '8888437701', 'Greta Life', 10, 1, 160, 'Stripe', 2, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(14, 15, 'lstaf@gmail.com', 'Ira Membrit', 'PRAGATI MAIDAN,OPP. NSCI DELHI', 'NSCI DELHI', '790115', '8888437702', 'Ira Membrit', 10, 1, 165, 'Stripe', 2, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(15, 16, 'pfitza@yahoo.com', 'Shonda Leer', '21 - C, C BLOCKCONN.PLACEC PLACE DELHI', 'PLACE DELHI', '790116', '8888437703', 'Shonda Leer', 10, 1, 170, 'Stripe', 2, '2020-10-28 17:15:49', '2020-10-31 06:18:01'),
(16, 17, 'jonathan@sbcglobal.net', 'Brock Lee', 'DISTRICT CENTRE PASCHIM VIHAR DELHI', 'VIHAR DELHI', '790117', '8888437704', 'Brock Lee', 10, 1, 175, 'Stripe', 2, '2020-10-30 17:15:49', '2020-10-31 06:18:01'),
(17, 18, 'penna@sbcglobal.net', 'Maya Didas', 'BLOCK 3, DAG EXTENSIONNEAR DELITE DELHI', 'DELITE DELHI', '790118', '8888437705', 'Maya Didas', 10, 1, 180, 'Stripe', 3, '2020-10-29 17:15:49', '2020-10-31 06:18:01'),
(18, 19, 'terjesa@me.com', 'Rick O\'Shea', 'NEAR RACE COURSE DELHI', 'COURSE DELHI', '790119', '8888437706', 'Rick O\'Shea', 10, 1, 185, 'Stripe', 3, '2020-10-24 17:15:49', '2020-10-31 06:18:01'),
(19, 20, 'killmenow@msn.com', 'Pete Sariya', 'LINK ROAD,KAROL BAGH DELHI', 'BAGH DELHI', '790120', '8888437707', 'Pete Sariya', 10, 1, 190, 'Stripe', 3, '2020-10-25 17:15:49', '2020-10-31 06:18:01'),
(20, 21, 'ranasta@me.com', 'Monty Carlo', 'LINK ROAD,KAROL BAGH DELHI', 'BAGH DELHI', '790121', '8888437708', 'Monty Carlo', 10, 1, 195, 'Stripe', 3, '2020-10-26 17:15:49', '2020-10-31 06:18:01'),
(21, 22, 'maikelnai@sbcglobal.net', 'Sal Monella', 'NEAR JAWAHARLAL NEHRUMARG INTERSECOPP. TO MCD CIVIC CENTRE DELHI', 'CENTRE DELHI', '790122', '8888437709', 'Sal Monella', 10, 1, 200, 'Stripe', 3, '2020-10-27 17:15:49', '2020-10-31 06:18:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `order_id`, `product_id`, `quantity`, `created_at`, `updated_at`) VALUES
(5, 1, 51, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(6, 2, 52, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(7, 3, 53, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(8, 4, 54, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(9, 5, 55, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(10, 6, 56, 1, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(11, 7, 57, 3, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(12, 8, 58, 3, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(13, 9, 59, 3, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(14, 10, 60, 3, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(15, 11, 61, 3, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(16, 12, 62, 1, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(17, 13, 63, 1, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(18, 14, 64, 1, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(19, 15, 65, 1, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(20, 16, 66, 1, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(21, 17, 67, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(22, 18, 68, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(23, 19, 69, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(24, 20, 70, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21'),
(25, 21, 71, 2, '2020-10-30 10:41:21', '2020-10-30 10:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_status`
--

CREATE TABLE `order_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_status`
--

INSERT INTO `order_status` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Complete', 1, '2020-10-28 13:06:31', '2020-10-28 13:06:31'),
(2, 'Pending', 1, '2020-10-28 13:07:20', '2020-10-28 13:07:20'),
(3, 'Cancelled', 1, '2020-10-28 13:07:36', '2020-10-28 13:07:36');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `image` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` double NOT NULL DEFAULT '0',
  `in_stock` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `category_id`, `image`, `description`, `amount`, `in_stock`, `status`, `created_at`, `updated_at`) VALUES
(51, 'V-Neck T-Shirt', 1, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vneck-tee-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 86, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(52, 'Hoodie', 2, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 86, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(53, 'Hoodie with Logo', 2, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-logo-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 45, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(54, 'T-Shirt', 1, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/tshirt-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 18, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(55, 'Beanie', 3, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/beanie-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 20, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(56, 'Belt', 3, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/belt-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 65, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(57, 'Cap', 3, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/cap-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 18, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(58, 'Sunglasses', 3, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/sunglasses-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 90, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(59, 'Hoodie with Pocket', 2, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-pocket-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 45, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(60, 'Hoodie with Zipper', 2, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-zipper-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 45, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(61, 'Long Sleeve Tee', 1, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/long-sleeve-tee-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 25, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(62, 'Polo', 1, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/polo-2.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 20, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(63, 'Album', 4, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/album-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 15, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(64, 'Single', 4, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/single-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 3, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(65, 'V-Neck T-Shirt - Red', 1, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vneck-tee-2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 20, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(66, 'V-Neck T-Shirt - Green', 1, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vnech-tee-green-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 20, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(67, 'V-Neck T-Shirt - Blue', 1, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/vnech-tee-blue-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 15, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(68, 'Hoodie - Red, No', 2, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 45, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(69, 'Hoodie - Green, No', 2, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-green-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 45, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(70, 'Hoodie - Blue, No', 2, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-blue-1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 45, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(71, 'T-Shirt with Logo', 1, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/t-shirt-with-logo-1.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 18, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(72, 'Beanie with Logo', 3, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/beanie-with-logo-1.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 20, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(73, 'Logo Collection', 3, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/logo-1.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 36, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(74, 'WordPress Pennant', 5, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/pennant-1.jpg', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas', 11.05, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00'),
(75, 'Hoodie - Blue, Yes', 2, 'https://woocommercecore.mystagingwebsite.com/wp-content/uploads/2017/12/hoodie-with-logo-2.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 45, 1, 1, '2020-10-28 12:45:00', '2020-10-28 12:45:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `signup_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pin_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(3000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `email_verified_at`, `is_admin`, `password`, `mobile`, `signup_type`, `gender`, `address`, `city`, `pin_code`, `state`, `country`, `image_url`, `date_of_birth`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@admin.com', NULL, 1, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, '2020-10-28 00:02:49', '2020-10-30 12:45:11'),
(2, 'Mario Speedwagon', 'kaiser@msn.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437689', NULL, 'Male', 'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016', 'Bangalore', '790102', 'Bangalore', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(3, 'Petey Cruiser', 'bmcmahon@hotmail.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437690', NULL, 'Male', 'GELEPHU, BHUTAN GELEPHU', 'BHUTAN GELEPHU', '790103', 'Bangalore', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(4, 'Anna Sthesia', 'hmbrand@verizon.net', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437691', NULL, 'Male', 'PHUENTSHOLING, POST BOX: 11 PHUENTSHOLING', '11 PHUENTSHOLING', '790104', 'Bangalore', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(5, 'Paul Molive', 'mglee@icloud.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437692', NULL, 'Male', 'P.O. PHUNTSOLINGBHUTAN PHUENTSHOLING', 'PHUNTSOLINGBHUTAN PHUENTSHOLING', '790105', 'Bangalore', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(6, 'Anna Mull', 'nimaclea@live.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437693', NULL, 'Male', 'DPCL acc GELEPHU GELEPHU', 'GELEPHU GELEPHU', '790106', 'Bangalore', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(7, 'Gail Forcewind', 'psichel@verizon.net', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437694', NULL, 'Male', 'BHUTAN OIL DISTRIBUTORS GELEPHU', 'DISTRIBUTORS GELEPHU', '790107', 'Bangalore', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(8, 'Paige Turner', 'elmer@me.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437695', NULL, 'Male', 'DPCL acc PHUENTSHOLINGUPPER PHUENTSHOLING PHUENTSHOLING', 'PHUENTSHOLING PHUENTSHOLING', '790108', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(9, 'Bob Frapples', 'thaljef@mac.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437696', NULL, 'Male', 'Q, POINT,10-MANSINGH ROAD DELHI', 'ROAD DELHI', '790109', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(10, 'Walter Melon', 'rmcfarla@sbcglobal.net', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437697', NULL, 'Male', 'Opp. GURUDWARA BANGLA SAHIB DELHI', 'SAHIB DELHI', '790110', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(11, 'Nick R. Bocker', 'fmerges@msn.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437698', NULL, 'Male', 'PRATAP BUILDING,N-BLOCK,C.PLACEN BLOCK , CP DELHI', 'CP DELHI', '790111', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(12, 'Barb Ackue', 'retoh@outlook.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437699', NULL, 'Male', '12, SCINDIA HOUSEK.G.MARG C.PC PLACE DELHI', 'PLACE DELHI', '790112', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(13, 'Buck Kinnear', 'tamas@att.net', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437700', NULL, 'Male', 'JANPATH,Opp. EASTERN COURT DELHI', 'COURT DELHI', '790113', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(14, 'Greta Life', 'thassine@me.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437701', NULL, 'Male', 'H - BLOCK, CONN.PLACEC PLACE DELHI', 'PLACE DELHI', '790114', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(15, 'Ira Membrit', 'lstaf@gmail.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437702', NULL, 'Male', 'PRAGATI MAIDAN,OPP. NSCI DELHI', 'NSCI DELHI', '790115', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(16, 'Shonda Leer', 'pfitza@yahoo.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437703', NULL, 'Male', '21 - C, C BLOCKCONN.PLACEC PLACE DELHI', 'PLACE DELHI', '790116', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(17, 'Brock Lee', 'jonathan@sbcglobal.net', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437704', NULL, 'Male', 'DISTRICT CENTRE PASCHIM VIHAR DELHI', 'VIHAR DELHI', '790117', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(18, 'Maya Didas', 'penna@sbcglobal.net', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437705', NULL, 'Female', 'BLOCK 3, DAG EXTENSIONNEAR DELITE DELHI', 'DELITE DELHI', '790118', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(19, 'Rick O\'Shea', 'terjesa@me.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437706', NULL, 'Female', 'NEAR RACE COURSE DELHI', 'COURSE DELHI', '790119', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(20, 'Pete Sariya', 'killmenow@msn.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437707', NULL, 'Female', 'LINK ROAD,KAROL BAGH DELHI', 'BAGH DELHI', '790120', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(21, 'Monty Carlo', 'ranasta@me.com', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437708', NULL, 'Female', 'LINK ROAD,KAROL BAGH DELHI', 'BAGH DELHI', '790121', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48'),
(22, 'Sal Monella', 'maikelnai@sbcglobal.net', NULL, 0, '$2y$10$4sgQKJLQ8H9ai9IKnrV.W.KihaRayPDZd4p.ft65nBE4NxO8cIxme', '8888437709', NULL, 'Female', 'NEAR JAWAHARLAL NEHRUMARG INTERSECOPP. TO MCD CIVIC CENTRE DELHI', 'CENTRE DELHI', '790122', 'DELHI', 'India', NULL, NULL, 1, NULL, '2020-10-28 17:09:48', '2020-10-28 17:09:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_order_status_foreign` (`order_status`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`);

--
-- Indexes for table `order_status`
--
ALTER TABLE `order_status`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_status_name_unique` (`name`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `order_status`
--
ALTER TABLE `order_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_order_status_foreign` FOREIGN KEY (`order_status`) REFERENCES `order_status` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
