/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `banners` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `banners_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `brands` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `brands_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `carts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `order_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `carts_product_id_foreign` (`product_id`),
  KEY `carts_user_id_foreign` (`user_id`),
  KEY `carts_order_id_foreign` (`order_id`),
  CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  KEY `categories_added_by_foreign` (`added_by`),
  CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `coupons` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `coupons_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `messages` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) unsigned DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_order_number_unique` (`order_number`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_shipping_id_foreign` (`shipping_id`),
  CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `post_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_categories_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `post_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_comments_user_id_foreign` (`user_id`),
  KEY `post_comments_post_id_foreign` (`post_id`),
  CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `post_tags` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tags_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) unsigned DEFAULT NULL,
  `post_tag_id` bigint(20) unsigned DEFAULT NULL,
  `added_by` bigint(20) unsigned DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`),
  KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  KEY `posts_added_by_foreign` (`added_by`),
  CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `product_reviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `product_id` bigint(20) unsigned DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_reviews_user_id_foreign` (`user_id`),
  KEY `product_reviews_product_id_foreign` (`product_id`),
  CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) unsigned DEFAULT NULL,
  `child_cat_id` bigint(20) unsigned DEFAULT NULL,
  `brand_id` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_brand_id_foreign` (`brand_id`),
  KEY `products_cat_id_foreign` (`cat_id`),
  KEY `products_child_cat_id_foreign` (`child_cat_id`),
  CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `shippings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `wishlists` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) unsigned NOT NULL,
  `cart_id` bigint(20) unsigned DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishlists_product_id_foreign` (`product_id`),
  KEY `wishlists_user_id_foreign` (`user_id`),
  KEY `wishlists_cart_id_foreign` (`cart_id`),
  CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Wedding Collection', 'wedding-collection', '/storage/photos/1/wedding-collection-by-Le-Reve.jpg', '<p>Get all of the weeding collection<br></p>', 'active', '2022-12-18 12:19:09', '2022-12-19 07:03:41');
INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Resort Collection', 'resort-collection', '/storage/photos/1/Untitled-1.jpg', '<p>Collect collection for your exciting tour...</p>', 'active', '2022-12-18 12:25:16', '2022-12-19 07:06:10');
INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Cristmas Collection', 'cristmas-collection', '/storage/photos/1/2.jpg', 'Shop All your desired dresses', 'active', '2022-12-18 12:40:33', '2022-12-19 07:06:30');

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Panda', 'panda', 'active', '2022-08-29 08:27:18', '2022-12-19 08:46:50');
INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Gucci', 'gucci', 'active', '2022-08-29 08:27:34', '2022-12-19 08:47:03');
INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Chanel', 'chanel', 'active', '2022-12-19 08:47:20', '2022-12-19 08:47:20');
INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Ganni', 'ganni', 'active', '2022-12-19 08:47:29', '2022-12-19 08:47:29'),
(5, 'Zara', 'zara', 'active', '2022-12-19 08:47:50', '2022-12-19 08:47:50'),
(6, 'Rolex', 'mango', 'active', '2022-12-19 08:48:03', '2022-12-19 19:14:40'),
(7, 'Mango', 'mango-2212194816-960', 'active', '2022-12-19 08:48:16', '2022-12-19 08:48:16'),
(8, 'Stella McCartney', 'stella-mccartney', 'active', '2022-12-19 08:48:46', '2022-12-19 08:48:46'),
(9, 'Nike', 'nike', 'active', '2022-12-19 19:13:58', '2022-12-19 19:13:58');

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(5, 15, 1, 1, 249.00, 'new', 1, 249.00, '2022-12-19 17:35:58', '2022-12-19 17:40:32');
INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(6, 14, 1, 1, 199.00, 'new', 1, 199.00, '2022-12-19 17:36:06', '2022-12-19 17:40:32');
INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(7, 15, 2, 6, 249.00, 'new', 1, 249.00, '2022-12-19 18:35:36', '2022-12-19 18:39:33');
INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(8, 13, 2, 6, 525.00, 'new', 1, 525.00, '2022-12-19 18:37:05', '2022-12-19 18:39:33'),
(9, 13, 3, 6, 525.00, 'new', 1, 525.00, '2022-12-19 19:44:46', '2022-12-19 19:45:41'),
(10, 2, 4, 6, 569.05, 'new', 1, 569.05, '2022-12-19 19:57:01', '2022-12-19 20:02:10'),
(11, 15, 4, 6, 249.00, 'new', 1, 249.00, '2022-12-19 20:01:26', '2022-12-19 20:02:10'),
(12, 14, 5, 6, 199.00, 'new', 1, 199.00, '2022-12-19 20:18:32', '2022-12-19 20:19:12'),
(13, 14, 6, 6, 199.00, 'new', 1, 199.00, '2022-12-19 20:19:31', '2022-12-19 20:20:06');

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Woman', 'woman', '<p>Get all woman fasion</p>', '/storage/photos/1/photo-1483985988355-763728e1935b.jpeg', 1, NULL, NULL, 'active', '2022-12-19 08:12:37', '2022-12-19 08:19:09');
INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Man', 'man', NULL, '/storage/photos/1/istockphoto-626085868-612x612.jpg', 1, NULL, NULL, 'active', '2022-12-19 08:13:01', '2022-12-19 08:19:54');
INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Girls', 'girls', NULL, '/storage/photos/1/BbManja-Woman-Banner-Online-Shopping-in-Bangladesh-for-Original-Product-BD-Shop-Online-Shop-Buy-Online-Shop-Bangladesh-scaled.jpg', 1, NULL, NULL, 'active', '2022-12-19 08:13:54', '2022-12-19 08:27:59');
INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(4, 'T-shirt', 't-shirt', NULL, NULL, 0, 1, NULL, 'active', '2022-12-19 08:29:01', '2022-12-19 08:34:06'),
(5, 'V-neck T-shirt', 'v-neck-t-shirt', NULL, NULL, 0, 1, NULL, 'active', '2022-12-19 08:32:42', '2022-12-19 08:33:58'),
(6, 'Polo T-shirt', 'polo-t-shirt', NULL, NULL, 0, 1, NULL, 'active', '2022-12-19 08:33:49', '2022-12-19 08:33:49'),
(7, 'Women Tank Tops', 'women-tank-tops', NULL, NULL, 0, 1, NULL, 'active', '2022-12-19 08:34:37', '2022-12-19 08:34:37'),
(8, 'Trousers', 'trousers', NULL, NULL, 0, 1, NULL, 'active', '2022-12-19 08:35:45', '2022-12-19 08:35:45'),
(9, 'Joggers', 'joggers', NULL, NULL, 0, 1, NULL, 'active', '2022-12-19 08:36:06', '2022-12-19 08:36:06'),
(10, 'Hoodies', 'hoodies', NULL, NULL, 0, 1, NULL, 'active', '2022-12-19 08:36:50', '2022-12-19 08:36:50'),
(11, 'T-Shirt', 't-shirt-2212193805-100', NULL, NULL, 0, 3, NULL, 'active', '2022-12-19 08:38:05', '2022-12-19 08:38:05'),
(12, 'V-Neck T-Shirt', 'v-neck-t-shirt-2212193828-138', NULL, NULL, 0, 3, NULL, 'active', '2022-12-19 08:38:28', '2022-12-19 08:38:28'),
(13, 'Polo T-Shirt', 'polo-t-shirt-2212193903-386', NULL, NULL, 0, 3, NULL, 'active', '2022-12-19 08:39:03', '2022-12-19 08:39:03'),
(14, 'Sweatshirts', 'sweatshirts', NULL, NULL, 0, 3, NULL, 'active', '2022-12-19 08:40:01', '2022-12-19 08:40:01'),
(15, 'Dress', 'dress', NULL, NULL, 0, 3, NULL, 'active', '2022-12-19 08:41:37', '2022-12-19 08:41:37'),
(16, 'V-neck T-shirt', 'v-neck-t-shirt-2212194210-446', NULL, NULL, 0, 2, NULL, 'active', '2022-12-19 08:42:10', '2022-12-19 08:42:10'),
(17, 'T-shirt', 't-shirt-2212194306-401', NULL, NULL, 0, 2, NULL, 'active', '2022-12-19 08:43:06', '2022-12-19 08:43:06'),
(18, 'Trousers', 'trousers-2212194322-807', NULL, NULL, 0, 2, NULL, 'active', '2022-12-19 08:43:22', '2022-12-19 08:43:22'),
(19, 'Boys Polo T-shirts', 'boys-polo-t-shirts', NULL, NULL, 0, 2, NULL, 'active', '2022-12-19 08:44:26', '2022-12-19 08:44:26'),
(20, 'Tracksuit', 'tracksuit', NULL, NULL, 0, 2, NULL, 'active', '2022-12-19 08:45:07', '2022-12-19 08:45:07'),
(21, 'Hoodies', 'hoodies-2212191842-977', NULL, NULL, 0, 2, NULL, 'active', '2022-12-19 10:18:42', '2022-12-19 10:18:42');

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', 'fixed', 300.00, 'active', NULL, NULL);
INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(2, '111111', 'percent', 10.00, 'active', NULL, NULL);




INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Hannah Fernandez', 'Molestiae lorem comm', 'nixivoraj@mailinator.com', NULL, '4158998526', 'Ratione at Nam culpa', NULL, '2022-12-19 20:00:49', '2022-12-19 20:00:49');


INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1);

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('082a85ff-b2df-48e8-a530-f64e7d731b7a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-19 20:02:10', '2022-12-19 20:02:10');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('0c4b6be7-6cee-4e80-9cf2-da683aa44f2a', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', '2022-12-19 20:22:42', '2022-12-19 20:20:06', '2022-12-19 20:22:42');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('53f49f6a-3855-4e45-a839-3acc584008a0', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-19 20:19:12', '2022-12-19 20:19:12');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('a95babdf-9352-4ad1-bc4b-d8a070e8518d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', '2022-12-19 17:41:15', '2022-12-19 17:40:31', '2022-12-19 17:41:15'),
('acf1e1ab-90fe-40af-926c-2a3fb2d290ad', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2022-12-19 19:45:41', '2022-12-19 19:45:41'),
('e552efc7-c1ac-42b6-b524-1bbec9818f82', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2022-12-19 19:24:43', '2022-12-19 18:39:33', '2022-12-19 19:24:43');

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-T7ZYMBKULV', 1, 448.00, 1, NULL, 548.00, 2, 'cod', 'unpaid', 'delivered', 'Mr. Afzal', 'Khan', 'afzal@gmail.com', '4412435387', 'Uk', NULL, 'briklane', NULL, '2022-12-19 17:40:31', '2022-12-19 19:38:22');
INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(2, 'ORD-J9DMOZILSO', 6, 774.00, 1, NULL, 974.00, 2, 'paypal', 'paid', 'new', 'Mr. Afzal', 'Khan', 'test@gmail.com', '4452585889', 'Uk', '2500', 'briklane', NULL, '2022-12-19 18:39:33', '2022-12-19 18:39:33');
INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(3, 'ORD-OLNNWJPBCB', 6, 525.00, 2, NULL, 625.00, 1, 'paypal', 'paid', 'new', 'Camille', 'Lancaster', 'belynaret@mailinator.com', '4102525688', 'KM', '3025', '35 Hague Extension', 'Magni recusandae Mi', '2022-12-19 19:45:41', '2022-12-19 19:45:41');
INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(4, 'ORD-N3HTUD7QQ9', 6, 818.05, 2, NULL, 918.05, 2, 'paypal', 'paid', 'new', 'Leigh', 'Emerson', 'gihiw@mailinator.com', '41145258962', 'NP', '4455', '716 West Milton Lane', 'Dolor excepturi irur', '2022-12-19 20:02:10', '2022-12-19 20:02:10'),
(5, 'ORD-R3NLBAJQHD', 6, 199.00, NULL, NULL, 199.00, 1, 'cod', 'unpaid', 'new', 'Dorian', 'Jensen', 'wovahy@mailinator.com', '41565895263', 'AL', '4145', '452 Oak Lane', 'Corrupti quaerat of', '2022-12-19 20:19:12', '2022-12-19 20:19:12'),
(6, 'ORD-JWLOEZIF6R', 6, 199.00, 1, NULL, 399.00, 1, 'cod', 'unpaid', 'new', 'Lacota', 'Gutierrez', 'rybater@mailinator.com', '4215368663', 'AL', '4586', '504 New Extension', 'Non consequatur mole', '2022-12-19 20:20:06', '2022-12-19 20:20:06');













INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Navy White Full Sleeve Styles Hoodies For Boys', 'navy-white-full-sleeve-styles-hoodies-for-boys', '<ul class=\"ulDefault\" style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla625, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Main Material: One Side Brush.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Sleeve: Full Sleeve.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">A Perfect Casual Wear.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Fit Type: Regular.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Color: As same as the picture.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\"><strong style=\"margin: 0px; outline: none; padding: 0px;\">Disclaimer:</strong>&nbsp;Product color may slightly vary due to photographic lighting sources or your monitor settings.</li></ul>', '<p><span style=\"font-family: Bangla377, Lato, sans-serif;\">Measurements: Approx. Overall Length 65cm</span><br style=\"font-family: Bangla377, Lato, sans-serif;\"><span style=\"font-family: Bangla377, Lato, sans-serif;\">100% Cotton</span><br style=\"font-family: Bangla377, Lato, sans-serif;\"><span style=\"font-family: Bangla377, Lato, sans-serif;\">Colors May Vary Due to Studio Lighting Effects</span><br></p>', '/storage/photos/1/Raglan-Hoodie-Navy-Blue-Sleeve-With-White-Color-Front.jpg', 100, 'S', 'default', 'active', 1200.00, 10.00, 1, 2, 19, 1, '2022-12-19 08:59:37', '2022-12-19 08:59:37');
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(2, 'Stylish Casual Long Sleeve Hoodie for Men-P19', 'stylish-casual-long-sleeve-hoodie-for-men-p19', '<ul class=\"ulDefault\" style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla649, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Main Material: One Side Brush.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Type: Hoodie.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Sleeve: Full Sleeve.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">GSM: 280-300 gsm.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Made in Bangladesh.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">A Perfect Casual Wear.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Fit Type: Regular.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Size: M, L, XL, XXL.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Measurement (In Inch): M (Length 28\", Chest 38\"), L (Length 29\", Chest 40\"), XL (Length 30\", Chest 42\"), XXL (Length 31\", Chest 44\").</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Color: As same as picture.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\"><strong style=\"margin: 0px; outline: none; padding: 0px;\">Disclaimer:</strong>&nbsp;Product color may slightly vary due to photographic lighting sources or your monitor settings.</li></ul>', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla649, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\"><div class=\"clearfix _o46 _3erg _29_7 direction_ltr text_align_ltr\" style=\"margin: 0px; outline: none; padding: 0px;\"><div id=\"js_7xc\" class=\"_3058 _ui9 _hh7 _6ybn _s1- _52mr _3oh-\" data-tooltip-content=\"Monday 9:26pm\" data-hover=\"tooltip\" data-tooltip-position=\"left\" style=\"margin: 0px; outline: none; padding: 0px;\"><div class=\"_aok _7i2m\" tabindex=\"0\" style=\"margin: 0px; outline: none; padding: 0px;\"><span class=\"_3oh- _58nk\" style=\"margin: 0px; outline: none; padding: 0px;\">Please check your products in front of riders or courier service agents.</span></div></div></div></li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">The product will be replaced if it has any defects by its manufacturer.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">The customer needs to inform us&nbsp;within&nbsp;24 hours&nbsp;from the date of delivery*.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Products must be with the tags intact and in their original packaging, in an unwashed and undamaged condition.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Replacement for products is subject to the inspection team.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Replacement cannot be possible if the product is burnt, damaged by a short circuit, damaged due to neglect, improper usage,&nbsp;or broken by the customer.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Innerwear and products of clearance sale cannot be replaced.</li></ul>', '/storage/photos/1/0243121_stylish-casual-long-sleeve-hoodie-for-men-p19.png', 10, 'S,M,L', 'new', 'active', 599.00, 5.00, 1, 2, 21, 8, '2022-12-19 10:22:44', '2022-12-19 10:22:44');
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(3, 'Stretched Jeans Pant LLM11', 'stretched-jeans-pant-llm11', '<h1 data-spm-anchor-id=\"a2700.details.0.i0.4eff4e47w8Atmo\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; font-size: 16px; line-height: 24px; font-family: Bangla984, Roboto, Helvetica, Tahoma, Arial, &quot;Microsoft YaHei&quot;; vertical-align: baseline; color: rgb(51, 51, 51);\"><ul class=\"\" style=\"margin-right: 0px; margin-bottom: 0px; margin-left: 0px; padding: 0px; list-style: none; overflow: hidden; columns: auto 2; column-gap: 32px; color: rgb(0, 0, 0); font-family: Roboto, -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, Helvetica, Bangla163, sans-serif; font-size: 12px;\"><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Product Name: Khaki Color stretch denim pant for men</li><li class=\"\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i1.5751TNrkTNrk3X\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Fabric: Soft and stretch denim fabrics for men</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Spandex: 2%</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Wash: 1</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Gender: Men</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Item Type: Full Length Denim pant for men</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Pant Style: Semi narrow Shape</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Style: Casual look and formal look</li><li class=\"\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Pocket Style : Front U shape pocket.</li><li class=\"\" data-spm-anchor-id=\"a2a0e.pdp.product_detail.i0.5751TNrkTNrk3X\" style=\"margin: 0px; padding: 0px 0px 0px 15px; position: relative; font-size: 14px; line-height: 18px; text-align: left; list-style: none; word-break: break-word; break-inside: avoid;\">✅ Material: 100% Cotton</li></ul></h1>', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla306, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Stretched Jeans Pant LLM11.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Product Type: Jeans Pant.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Main Material: 98% Cotton + 2% Spandex.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Waist Size: 31, 32, 33, 34, 36.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Measurement (In Inch):&nbsp; 31 (Waist 31’’, Length 40+’’); 32 (Waist 32”, Length 40+”); 33 (Waist 33’’, Length 40+’’); 34 (Waist 34”, Length 40+”); 36 (Waist 36”, Length 40+”).</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Style: Slim Fit.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Gender: For Men.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Color: As same as the picture.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">100% Export Quality.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\"><strong style=\"margin: 0px; outline: none; padding: 0px;\">Disclaimer:</strong>&nbsp;Product color may slightly vary due to photographic lighting sources or your monitor settings.</li></ul>', '/storage/photos/1/0188321_stretched-jeans-pant-llm11.jpeg', 5, ',L,XL', 'hot', 'active', 1449.00, 20.00, 0, 2, 18, 8, '2022-12-19 10:37:01', '2022-12-19 10:37:01');
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(4, 'Stylish Casual Long Sleeve Hoodie for Men-P11', 'stylish-casual-long-sleeve-hoodie-for-men-p11', '<ul class=\"ulDefault\" style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla822, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Main Material: One Side Brush.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Type: Hoodie.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Sleeve: Full Sleeve.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">GSM: 280-300 gsm.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Made in Bangladesh.</li></ul>', '<ul class=\"ulDefault\" style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla822, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Main Material: One Side Brush.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Type: Hoodie.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Sleeve: Full Sleeve.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">GSM: 280-300 gsm.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Made in Bangladesh.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">A Perfect Casual Wear.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Fit Type: Regular.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Size: M, L, XL, XXL.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Measurement (In Inch): M (Length 28\", Chest 38\"), L (Length 29\", Chest 40\"), XL (Length 30\", Chest 42\"), XXL (Length 31\", Chest 44\").</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Color: As same as the picture.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\"><strong style=\"margin: 0px; outline: none; padding: 0px;\">Disclaimer:</strong>&nbsp;Product color may slightly vary due to photographic lighting sources or your monitor settings.</li></ul>', '/storage/photos/1/0243113_stylish-casual-long-sleeve-hoodie-for-men-p11.png', 5, 'S,M,L,XL', 'hot', 'active', 599.00, 0.00, 0, 2, 21, 4, '2022-12-19 10:43:23', '2022-12-19 10:43:23'),
(5, 'Stretched Jeans Pant FEL', 'stretched-jeans-pant-fel', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla789, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Stretched Jeans Pant FEL.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Product Type: Jeans Pant.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Main Material: 98% Cotton + 2% Spandex.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Waist Size:&nbsp; 30</li></ul>', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla789, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Stretched Jeans Pant FEL.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Product Type: Jeans Pant.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Main Material: 98% Cotton + 2% Spandex.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Waist Size:&nbsp; 30</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Measurement (In Inch): 29 (Waist 29”, Length 40+”);&nbsp;&nbsp; 30 (Waist 30”, Length 40+”); 31 (Waist 31”, Length 40+”); 32 (Waist 32”, Length 40+”); 36 (Waist 36”, Length 40+”).</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Style: Slim Fit.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Gender: For Men.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">Color: As same as the picture.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\">100% Export Quality.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left !important;\"><strong style=\"margin: 0px; outline: none; padding: 0px;\">Disclaimer:</strong>&nbsp;Product color may slightly vary due to photographic lighting sources or your monitor settings.</li></ul>', '/storage/photos/1/0188284_stretched-jeans-pant-fel.jpeg', 1289, 'S,M', 'hot', 'active', 1290.00, 3.00, 0, 2, 18, 2, '2022-12-19 11:22:36', '2022-12-19 11:22:36'),
(6, 'Denim Pant for Men PS- 302', 'denim-pant-for-men-ps-302', '<ul class=\"ulDefault\" style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla1069, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Denim Pant for Men PS- 302.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Product Type: Man\'s Denim Pant.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Spandex - 2%</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Size- 28, 30, 32, 34, 36.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Label- Collin\'s</li></ul>', '<ul class=\"ulDefault\" style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla1069, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Denim Pant for Men PS- 302.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Product Type: Man\'s Denim Pant.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Spandex - 2%</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Size- 28, 30, 32, 34, 36.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Label- Collin\'s</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Narrow Slim Fit With Stitch.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Very Comfortable to Wear Any Session.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Color: As like the Picture.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\"><strong style=\"margin: 0px; outline: none; padding: 0px;\">Disclaimer</strong>: Due to the light and screen difference, the item\'s color may be slightly different from the pictures.</li></ul>', '/storage/photos/1/0240862_denim-pant-for-men-ps-302.jpeg', 19, 'S,M,L,XL', 'new', 'active', 699.00, 39.00, 0, 2, 18, 3, '2022-12-19 11:26:43', '2022-12-19 11:26:43'),
(7, 'Short Sleeve Cotton Tee for Women', 'short-sleeve-cotton-tee-for-women', '<p><span style=\"font-family: Bangla596, Lato, sans-serif;\">Made from 100% cotton,</span></p><p><span style=\"font-family: Bangla596, Lato, sans-serif;\">this Premium Short Sleeve Tee for women is a perfect addition to your casual collection.</span></p><p><span style=\"font-family: Bangla596, Lato, sans-serif;\">It has a Regular fit, Scoop Neckline, and Dipped Hem. Ideal for any occasion.</span></p>', '<p><span style=\"font-family: Bangla596, Lato, sans-serif;\">Made from 100% cotton, </span></p><p><span style=\"font-family: Bangla596, Lato, sans-serif;\">this Premium Short Sleeve Tee for women is a perfect addition to your casual collection. </span></p><p><span style=\"font-family: Bangla596, Lato, sans-serif;\">It has a Regular fit, Scoop Neckline, and Dipped Hem. Ideal for any occasion. </span></p><p><span style=\"font-family: Bangla596, Lato, sans-serif;\">They are also available in other colours.</span><br style=\"font-family: Bangla596, Lato, sans-serif;\"><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"🧺\" src=\"https://s.w.org/images/core/emoji/14.0.0/svg/1f9fa.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; font-family: Bangla596, Lato, sans-serif; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; padding: 0px !important;\"><span style=\"font-family: Bangla596, Lato, sans-serif;\">&nbsp;Care Instructions: Machine Wash Warm, With Like Colours, Do Not Bleach, Tumble Dry Low, Warm Iron (Do Not Iron Design), </span></p><p><span style=\"font-family: Bangla596, Lato, sans-serif;\">Do Not Dry Clean. * </span></p><p><span style=\"font-family: Bangla596, Lato, sans-serif;\">Colour May Vary Due to Studio Lighting Effects.</span><br></p>', '/storage/photos/1/14.jpg', 10, 'L,XL', 'new', 'active', 500.00, 45.00, 1, 1, 4, 4, '2022-12-19 11:34:13', '2022-12-19 11:34:13'),
(10, 'Sleeve V-Neck T-Shirt in Black Colour', 'short-sleeve-v-neck-t-shirt-in-black-colour-2212194245-884', '<ol style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; font-family: Bangla802, Lato, sans-serif;\"><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Measurements:&nbsp; Approx. Overall Length</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">100% Cotton</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Brand: Manja</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Colors May Vary Due to Studio Lighting Effects</li></ol>', '<ol style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; font-family: Bangla802, Lato, sans-serif;\"><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Measurements:&nbsp; Approx. Overall Length</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">100% Cotton</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Brand: Manja</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Colors May Vary Due to Studio Lighting Effects</li></ol>', '/storage/photos/1/Black-Strip-Girls-New-Design-T-shirt-1.jpg', 3, 'S,M,L,XL', 'new', 'active', 600.00, 40.00, 1, 1, 5, 3, '2022-12-19 11:42:45', '2022-12-19 11:47:24'),
(11, 'Short Sleeve V-Neck T-Shirt in Black Colour', 'short-sleeve-v-neck-t-shirt-in-black-colour-2212194334-462', '<ol style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; font-family: Bangla802, Lato, sans-serif;\"><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Measurements:&nbsp; Approx. Overall Length</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">100% Cotton</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Brand: Manja</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Colors May Vary Due to Studio Lighting Effects</li></ol>', '<ol style=\"list-style-position: initial; list-style-image: initial; padding: 0px; margin-bottom: 1.3em; font-family: Bangla802, Lato, sans-serif;\"><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Measurements:&nbsp; Approx. Overall Length</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">100% Cotton</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Brand: Manja</li><li style=\"margin-bottom: 0.6em; margin-left: 1.3em;\">Colors May Vary Due to Studio Lighting Effects</li></ol>', '/storage/photos/1/Stylish-Cotton-V-Neck-T-shirt-For-Women-in-Black-Online-Shopping-in-Bangladesh-for-Original-Product-BD-Shop-Online-Shop-Buy-Online-Shop-bd-600x700.jpg', 3, 'S,M,L,XL', 'new', 'active', 500.00, 41.00, 1, 1, NULL, 4, '2022-12-19 11:43:34', '2022-12-19 11:43:34'),
(12, 'Half Sleeve Cotton T-shirt for Women - SA22', 'half-sleeve-cotton-t-shirt-for-women-sa22', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla388, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Half-Sleeve Cotton T-shirt for Women - SA22.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Product Type: T-shirt.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Fabric: Cotton.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">V-Neck.</li></ul>', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla388, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Half Sleeve Cotton T-shirt for Women - SA22.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Product Type: T-shirt.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Fabric: Cotton.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">V-Neck.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Size: S, M, L, XL, XXL.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Measurement (in Inch): S (Length 26\", Chest 36\"), M (Length 27\", Chest 37\"), L (Length 28\", Chest 38\"), XL (Length 29\", Chest 39\"), XXL (Length 30\", Chest 40\").</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Fashionable and Trendy.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Comfortable to wear.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Color: Black.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\"><strong style=\"margin: 0px; outline: none; padding: 0px;\">Disclaimer:</strong>&nbsp;Due to monitor or mobile screen you may experience slight to very slight difference.</li></ul>', '/storage/photos/1/0208480_half-sleeve-cotton-t-shirt-for-women-sa22.jpeg', 11, 'S,M,L,XL', 'new', 'active', 445.00, 15.00, 0, 1, 7, 5, '2022-12-19 16:55:43', '2022-12-19 16:55:43'),
(13, 'Polka Dot Print Tops for Women', 'polka-dot-print-tops-for-women', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla1003, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Polka Dot Print Tops for Women.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Product Type: Tops.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Material: Polyester (Linen).</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Size: M, L, XL, XXL.</li></ul>', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla1003, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Polka Dot Print Tops for Women.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Product Type: Tops.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Material: Polyester (Linen).</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Size: M, L, XL, XXL.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Measurement (In Inch): M (Length 27.5\", Chest 31\"), L (Length 28.5\", Chest 32\"), XL (Length 33\", Chest 42\"), XXL (Length 34\", Chest 44\").</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Sleeve Length: Three-Quarter Sleeves.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Sleeve Styling:&nbsp; Bell Sleeves</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Neck: Boat neck.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Transparency: Opaque.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Geometric print.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Type: Regular.&nbsp;&nbsp;</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Print or Pattern Type: Polka dots.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Color: Black and White (polka dot).</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\"><strong style=\"margin: 0px; outline: none; padding: 0px;\">Disclaimer:</strong>&nbsp;Product color may slightly vary due to photographic lighting sources or your monitor settings.</li></ul>', '/storage/photos/1/0208503_polka-dot-print-tops-for-women.jpeg', 15, 'S,M,L,XL', 'hot', 'active', 750.00, 30.00, 1, 1, 7, 2, '2022-12-19 16:58:32', '2022-12-19 16:58:32'),
(14, 'Theo Half Sleeve T-shirt for Women WTS-0002', 'theo-half-sleeve-t-shirt-for-women-wts-0002', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla309, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Theo Half Sleeve T-shirt for Women WTS-0002.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Product Type: T-shirt.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Material: 100% Cotton.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Size: XS, S, M, L, XL.</li></ul>', '<ul style=\"margin: 12px 0px; outline: none; padding: 0px 0px 0px 36px; list-style-position: initial; list-style-image: initial; color: rgb(119, 119, 119); font-family: Bangla309, &quot;Open Sans&quot;, sans-serif; font-size: 14px;\"><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Theo Half Sleeve T-shirt for Women WTS-0002.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Product Type: T-shirt.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Material: 100% Cotton.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Size: XS, S, M, L, XL.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Measurement (in Inch): XS (Chest 30”); S (Chest 32”); M (Chest 34”); L (Chest 36\"); XL (Chest 38\").</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Looks stylish, trendy, and comfortable.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">100% export quality product.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Color: Powder Blue.</li><li style=\"margin: 0px; outline: none; padding: 0px; text-align: left;\">Disclaimer: Product color may slightly vary due to photographic lighting sources or your monitor settings.</li></ul>', '/storage/photos/1/0208409_theo-half-sleeve-t-shirt-for-women-wts-0002.jpeg', 14, 'S,M,L', 'hot', 'active', 199.00, 0.00, 1, 1, 4, 3, '2022-12-19 17:01:54', '2022-12-19 19:38:22'),
(15, 'Long Sleeve V neck T Shirt for Girls', 'long-sleeve-v-neck-t-shirt-for-girls', '<p><span style=\"font-family: Bangla593, Lato, sans-serif;\">“Made from soft cotton, this Black V-neck Long Sleeve T-Shirt for Girls has a Slim fit and is Ideal for casual wear.</span></p><p><img draggable=\"false\" role=\"img\" class=\"emoji\" alt=\"🧺\" src=\"https://s.w.org/images/core/emoji/14.0.0/svg/1f9fa.svg\" style=\"max-width: 100%; opacity: 1; transition: opacity 1s ease 0s; font-family: Bangla593, Lato, sans-serif; border-width: initial !important; border-color: initial !important; border-image: initial !important; display: inline !important; height: 1em !important; vertical-align: -0.1em !important; box-shadow: none !important; width: 1em !important; margin: 0px 0.07em !important; background-image: none !important; background-position: initial !important; background-size: initial !important; background-repeat: initial !important; background-attachment: initial !important; background-origin: initial !important; background-clip: initial !important; padding: 0px !important;\"><span style=\"font-family: Bangla593, Lato, sans-serif;\">&nbsp;Care Instructions: Machine Wash Warm, With Like Colours, Do Not Bleach, Tumble Dry Low, Warm Iron (Do Not Iron Design), Do Not Dry Clean. * Colour May Vary Due to Studio Lighting Effects.”</span><br></p>', '<p><span style=\"font-family: Bangla593, Lato, sans-serif;\">“Made from soft cotton,</span></p>', '/storage/photos/1/7a7a0079-9069-4e31-b8aa-faa0e477dac5-600x518.jpg', 24, 'S,M,L,XL', 'hot', 'active', 249.00, 0.00, 1, 3, 11, 3, '2022-12-19 17:22:30', '2022-12-19 19:38:22'),
(16, 'Black and White Classic Raglan Short Sleeve Tee for Girls', 'black-and-white-classic-raglan-short-sleeve-tee-for-girls', '<p><span style=\"font-family: Bangla561, Lato, sans-serif;\">“Made from 100% super soft cotton, this Black and White Classic Raglan Short Sleeve Baseball Tees has a Slim fit and Manja’s Signature Revenge Logo printed on it. Ideal for home, school, weekends.</span><br></p>', '<p><span style=\"font-family: Bangla561, Lato, sans-serif;\">“Made from 100% super soft cotton, this Black and White Classic Raglan Short Sleeve Baseball Tees has a Slim fit and Manja’s Signature Revenge Logo printed on it. Ideal for home, school, weekends.</span><br></p>', '/storage/photos/1/7a7a0079-9069-4e31-b8aa-faa0e477dac5-600x518.jpg', 15, 'S,M,L,XL', 'hot', 'active', 400.00, 10.00, 1, 3, 11, 4, '2022-12-19 17:29:04', '2022-12-19 17:29:04');

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, '<p style=\"margin-bottom: 1.3em; color: rgb(81, 80, 80); font-family: Roboto, Bangla947, sans-serif;\">We are an online selling&nbsp;<font color=\"#0a0a0a\"><span style=\"touch-action: manipulation;\">e-commerce company in the U</span></font>K, we are the manufacturers and exporters. Our mother\'s Office is in&nbsp;<a href=\"https://manja.co.uk/\" target=\"_blank\" rel=\"noopener\" style=\"touch-action: manipulation; color: rgb(10, 10, 10); box-shadow: none;\">UK Manja</a>, Unit 7, 55B Derby Street, Manchester, M8 8HW.</p><p style=\"margin-bottom: 1.3em; color: rgb(81, 80, 80); font-family: Roboto, Bangla947, sans-serif;\">We only sell authentic 100% Garments quality products.</p><p style=\"margin-bottom: 1.3em; color: rgb(81, 80, 80); font-family: Roboto, Bangla947, sans-serif;\">You can then add them to your shopping bag and click on place order. You let us know your details address, and contact number once you are done. A representative will then deliver your order right to your home or office.</p><p style=\"margin-bottom: 1.3em; color: rgb(81, 80, 80); font-family: Roboto, Bangla947, sans-serif;\">We are currently serving the whole Word &amp; all over the UK.&nbsp;<span style=\"color: rgb(51, 51, 51);\">We accept&nbsp;<span style=\"font-weight: bolder;\"><span style=\"color: rgb(255, 0, 0);\">CASH ON DELIVERY</span></span></span>&nbsp;&amp; we also have Online&nbsp;<span style=\"font-weight: bolder;\">Credit cards</span>&nbsp;&amp; all sorts of online cards or bank transfers for the UK.</p><p style=\"margin-bottom: 1.3em; color: rgb(81, 80, 80); font-family: Roboto, Bangla947, sans-serif;\">Our interest is to provide the best online-selling Basic clothing fashion for our consumers so that they can have the best out of Manja while online shopping experience. This is how we can mark our presence in the online shopping era.</p>', '<span style=\"text-align: justify;\">Manja is a Trusted Online Shopping, we take our time to listen understand, and evolve to fit changing modern family needs, always with an emphasis on providing the highest quality clothing for the lowest price.</span>', '/storage/photos/1/logo_Logo_200.png', '/storage/photos/1/BbManja-Woman-Banner-Online-Shopping-in-Bangladesh-for-Original-Product-BD-Shop-Online-Shop-Buy-Online-Shop-Bangladesh-scaled.jpg', 'United Kingdom', '+4193873863863', 'manja@gmail.com', NULL, '2022-12-19 11:14:41');


INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Express', 200.00, 'active', '2022-08-29 08:29:08', '2022-12-19 17:42:12');
INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Normal', 100.00, 'active', '2022-08-29 08:29:30', '2022-12-19 17:41:57');


INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$UYoLBkdNJN.r36MKL0gm7eyQfbx9bfXQ/VysAOCnv3A1D6tCTivnW', NULL, 'admin', NULL, NULL, 'active', NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'User', 'user@gmail.com', NULL, '$2y$10$RajzeFeGevWCZ8gHSaQ7aO57nQsX3y8UUyaGeVh9otwyHTPlBPfkW', NULL, 'user', NULL, NULL, 'active', NULL, NULL, NULL);
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'Judith Bernard', 'jawo@mailinator.com', NULL, '$2y$10$xOU1qWEynl9me4JsjhgxAe/pdGLf.eGMKUwzhcQGgGaCM7Gji2iYG', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-15 20:33:43', '2022-12-15 20:33:43');
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(4, 'Adrian Welch', 'deze@mailinator.com', NULL, '$2y$10$QlBUyFgkvNKPFYRdJETP7uAo9sxTrWOm91svIJYgg3sjX5YPyNex6', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-15 22:13:52', '2022-12-15 22:13:52'),
(5, 'Test Account', 'test@gmail.com', NULL, '$2y$10$RzNgPaVBn3OOeuWqHJKSUeEL98ZR.p38uQpGk6C9oVDOtyp5pZBr6', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-19 18:27:47', '2022-12-19 18:27:47'),
(6, 'test1', 'admin1@gmail.com', NULL, '$2y$10$vlzcPuVR/GMNpxQxPW4F9.xvacKOVK3kBxztnceU6ekQSOLCwHyLK', NULL, 'user', NULL, NULL, 'active', NULL, '2022-12-19 18:34:23', '2022-12-19 18:34:23');




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;