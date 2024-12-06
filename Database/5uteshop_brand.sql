

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `BrandID` bigint NOT NULL AUTO_INCREMENT,
  `BrandName` varchar(500) NOT NULL,
  `Description` varchar(2000) DEFAULT NULL,
  `ImageLink` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`BrandID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
-- Phụ kiện công nghệ--
INSERT INTO `brand` VALUES
(1, 'Apple', 'Thương hiệu Apple', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/102014/apple_30th_0.png' ),
(2, 'Samsung', 'Thương hiệu Samsung', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/092010/samsung-converted.gif' ),
(3, 'Xiaomi', 'Thương hiệu Xiaomi', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/072021/xiaomi_global_logo_cmyk.jpg' ),
(4, 'Sony', 'Thương hiệu Sony', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/0000/3198/brand.gif' ),
(5, 'Dell', 'Thương hiệu Dell', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/052015/logo_dell_blue-2014.png' ),
(6, 'Asus', 'Thương hiệu Asus', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/0000/6630/brand.gif' ),
(7, 'HP', 'Thương hiệu HP', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/122015/untitled-1_58.png' ),
(8, 'Logitech', 'Thương hiệu Logitech', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/092015/logitech-logo-2015-black.png?itok=Jo78wE8M' ),
(9, 'JBL', 'Thương hiệu JBL', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/0000/1944/brand.gif?itok=QXmog0SJ' ),
(10, 'Anker', 'Thương hiệu Anker', 'https://bizweb.dktcdn.net/100/405/018/themes/788840/assets/logo.png?1713840865813' );
 
-- Đồ dùng học tập--
INSERT INTO `brand` VALUES
(11, 'Thiên Long', 'Thương hiệu Thiên Long', 'https://upload.wikimedia.org/wikipedia/vi/3/3b/Logo_thienlong.png' ),
(12, 'Hồng Hà', 'Thương hiệu Hồng Hà', 'https://vpphongha.com.vn/wp-content/uploads/2021/10/6.10.9.png' ),
(13, 'Campus', 'Thương hiệu Campus', 'https://companieslogo.com/img/orig/CAMPUS.NS-0b850c5a.png?t=1720244491' ),
(14, 'Deli', 'Thương hiệu Deli', 'https://vppdeli.vn/wp-content/uploads/2024/03/Deli_logo-1.png' ),
(15, 'Stabilo', 'Thương hiệu Stabilo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_LpLGvHrQrTRXM-k5oQ7CZe1oG4v7iRGXNA&s' ),
(16, 'Faber-Castell', 'Thương hiệu Faber-Castell', 'https://logos-download.com/wp-content/uploads/2016/03/Faber-Castell_logo.png' ),
(17, 'Pilot', 'Thương hiệu Pilot', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpqueAhW2GgkXTwkit_2oihxi4NVNvdWwNfA&s' ),
(18, 'Parker', 'Thương hiệu Parker', 'https://penstore.vn/wp-content/uploads/2018/03/cropped-parker-pen-logo-butparkervietnam.png' ),
(19, 'Montblanc', 'Thương hiệu Montblanc', 'https://upload.wikimedia.org/wikipedia/commons/d/dd/Montblanc_logo.svg' );

-- Thời trang:--
INSERT INTO `brand` VALUES
(20, 'Nike', 'Thương hiệu Nike', 'https://inkythuatso.com/uploads/images/2021/11/logo-nike-inkythuatso-2-01-04-15-42-44.jpg' ),
(21, 'Adidas', 'Thương hiệu Adidas', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGLJC-hmcfN9t5pvZRmFrTBktTfr4lpdWKTA&s' ),
(22, 'Puma', 'Thương hiệu Puma', 'https://rubee.com.vn/admin/webroot/upload/image//images/tin-tuc/puma-logo-3.jpg' ),
(23, 'Converse', 'Thương hiệu Converse', 'https://drake.vn/image/catalog/H%C3%ACnh%20content/logo%20gi%C3%A0y%20Converse/logo-gi%C3%A0y-converse-02.jpg' ),
(24, 'Vans', 'Thương hiệu Vans', 'https://drake.vn/image/catalog/H%C3%ACnh%20content/logo-vans/vans-logo_2.jpg' ),
(25, 'Uniqlo', 'Thương hiệu Uniqlo', 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/UNIQLO_logo.svg/772px-UNIQLO_logo.svg.png' ),
(26, 'H&M', 'Thương hiệu H&M', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/H%26M-Logo.svg/1280px-H%26M-Logo.svg.png' ),
(27, 'Zara', 'Thương hiệu Zara', 'https://rubee.com.vn/admin/webroot/upload/image//images/tin-tuc/zara-logo-2.jpg' ),
(28, 'Mango', 'Thương hiệu Mango', 'https://e7.pngegg.com/pngimages/464/141/png-clipart-mango-kids-logo-fashion-mango-text-retail.png' ),
(29, 'Topshop', 'Thương hiệu Topshop', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyqao-TzN0q8UZYflRlfm6M9eWXeMNC2F0vA&s' );
 
-- Đồ trang trí phòng:--
INSERT INTO `brand` VALUES
(30, 'IKEA', 'Thương hiệu IKEA', 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/Ikea_logo.svg/2560px-Ikea_logo.svg.png' ),
(31, 'JYSK', 'Thương hiệu JYSK', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-KkwZFji1XhRsKfW7ahqBNYAC2IsNrKDnUQ&s' ),
(32, 'MUJI', 'Thương hiệu MUJI', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/MUJI_logo.svg/2560px-MUJI_logo.svg.png' ),
(33, 'MINISO', 'Thương hiệu MINISO', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRmSPnFkt-Z3XlNXaG2M-9DzEFt2ZZgYMz9tQ&s' ),
(34, 'Daiso', 'Thương hiệu Daiso', 'https://mms.img.susercontent.com/vn-11134513-7r98o-lsv727lc5pl084@resize_ss1242x600!@crop_w1242_h600_cT' ),
(35, 'Xiaomi', 'Thương hiệu Xiaomi', 'https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-original-577x577/s3/072021/xiaomi_global_logo_cmyk.jpg' ),
(36, 'Philips', 'Thương hiệu Philips', 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Philips_logo_new.svg/2560px-Philips_logo_new.svg.png' ),
(37, 'Osram', 'Thương hiệu Osram', 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Osram_Logo.svg/1200px-Osram_Logo.svg.png' );

-- Sản phẩm làm đẹp:--
INSERT INTO `brand` VALUES
(38, 'Innisfree', 'Thương hiệu Innisfree', 'https://thietkelogo.mondial.vn/wp-content/uploads/2024/01/Mau_thiet_ke_logo_thuong_hieu_cong_ty_INNISFREE_1.jpg' ),
(39, 'Laneige', 'Thương hiệu Laneige', 'https://thietkelogo.mondial.vn/wp-content/uploads/2024/01/Laneige-Logo-1.jpg' ),
(40, 'Etude House', 'Thương hiệu Etude House', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMaq4LcC-qUtFvuQ5ECKCtfWw6KCKUic_uJg&s' ),
(41, 'The Face Shop', 'Thương hiệu The Face Shop', 'https://aeonmall-hadong.com.vn/wp-content/uploads/2019/08/z4293677303749_a1376a49bc4c8f337a4c13e2e6ae1830-750x468.jpg' ),
(42, 'Nature Republic', 'Thương hiệu Nature Republic', 'https://upload.wikimedia.org/wikipedia/en/3/37/Nature_Republic_logo.png' ),
(43, 'L\Oreal', 'Thương hiệu L\Oreal', 'https://thietkelogo.mondial.vn/wp-content/uploads/2024/01/Loreal-logo-1.jpg' ),
(44, 'Maybelline', 'Thương hiệu Maybelline', 'https://thietkelogo.mondial.vn/wp-content/uploads/2024/01/mau_thiet_ke_logo_thuong_hieu_cong_ty_maybelline_1.jpg' ),
(45, 'Revlon', 'Thương hiệu Revlon', 'https://thietkelogo.mondial.vn/wp-content/uploads/2024/01/Mau_thiet_ke_logo_thuong_hieu_cong_ty_Revlon_1.jpg' ),
(46, 'NYX', 'Thương hiệu NYX', 'https://logos-world.net/wp-content/uploads/2020/11/NYX-Logo.png' ),
(47, 'E.L.F.', 'Thương hiệu E.L.F.', 'https://cdn.worldvectorlogo.com/logos/logo-elf.svg' );


/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


