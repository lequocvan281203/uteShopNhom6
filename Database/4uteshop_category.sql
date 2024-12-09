

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `CategoryID` bigint NOT NULL AUTO_INCREMENT,
  `CategoryName` varchar(50) DEFAULT NULL,
  `ImageLink` varchar(300) DEFAULT NULL,
  `Icon` varchar(100) DEFAULT NULL,
  `ParentID` bigint NOT NULL,
  PRIMARY KEY (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES 
(1,'Phụ kiện công nghệ', 'static/images/category/Phụ kiện công nghệ.jpg','<i class=\"fa fa-user\"></i>',0),
(2, 'Đồ dùng học tập', 'static/images/category/Đồ dùng học tập.jpg','<i class=\"fa fa-user\"></i>',0),
(3,'Thời trang', 'static/images/category/Thời trang.jpg','<i class=\"fa fa-user\"></i>',0),
(4,'Đồ trang trí phòng', 'static/images/category/Đồ trang trí phòng.jpg','<i class=\"fa fa-user\"></i>',0),
(5, 'Sản phẩm làm đẹp', 'static/images/category/Sản phẩm làm đẹp.jpg','<i class=\"fa fa-user\"></i>',0);
-- Thêm danh mục con

-- Phụ kiện công nghệ (CategoryID = 1)
INSERT INTO category(CategoryName, ImageLink, Icon, ParentID) VALUES
('Tai nghe', 'static/images/category/Tai nghe.jpg','<i class=\"fa fa-headphones\"></i>', 1), 
('Điện thoại', 'static/images/category/Điện thoại.jpg','<i class=\"fa fa-mobile\"></i>', 1),
('Máy tính bảng', 'static/images/category/Máy tính bảng.jpg','<i class=\"fa fa-tablet\"></i>', 1),
('Laptop', 'static/images/category/Laptop.jpg','<i class=\"fa fa-laptop\"></i>', 1),
('Đồng hồ thông minh', 'static/images/category/Đồng hồ thông minh.jpg','<i class=\"fa fa-clock-o\"></i>', 1);

-- Đồ dùng học tập (CategoryID = 2)
INSERT INTO category(CategoryName, ImageLink, Icon, ParentID) VALUES
('Bút viết', 'static/images/category/Bút viết.jpg','<i class=\"fa fa-pencil\"></i>', 2),
('Sổ tay', 'static/images/category/Sổ tay.jpg','<i class=\"fa fa-book\"></i>', 2),
('Tẩy', 'static/images/category/Tẩy.jpg','<i class=\"fa fa-eraser\"></i>', 2),
('Thước kẻ', 'static/images/category/Thước kẻ.jpg','<i class=\"fa fa-ruler\"></i>', 2);

-- Thời trang (CategoryID = 3)
INSERT INTO category(CategoryName, ImageLink, Icon, ParentID) VALUES
('Áo', 'static/images/category/Áo.jpg','<i class=\"fa fa-tshirt\"></i>', 3),
('Quần', 'static/images/category/Quần.jpg','<i class=\"fa fa-male\"></i>', 3),
('Giày', 'static/images/category/Giày.jpg','<i class=\"fa fa-shoe-prints\"></i>', 3),
('Túi xách', 'static/images/category/Túi xách.jpg','<i class=\"fa fa-shopping-bag\"></i>', 3),
('Mũ nón', 'static/images/category/Mũ nón.jpg','<i class=\"fa fa-hat-cowboy\"></i>', 3);

-- Đồ trang trí phòng (CategoryID = 4)
INSERT INTO category(CategoryName, ImageLink, Icon, ParentID) VALUES
('Đèn trang trí', 'static/images/category/Đèn trang trí.jpg','<i class=\"fa fa-lightbulb-o\"></i>', 4),
('Gối', 'static/images/category/Gối.jpg','<i class=\"fa fa-bed\"></i>', 4),
('Chăn', 'static/images/category/Chăn.jpg','<i class=\"fa fa-blanket\"></i>', 4),
('Rèm cửa', 'static/images/category/Rèm cửa.jpg','<i class=\"fa fa-window-maximize\"></i>', 4),
('Hộp đựng đồ', 'static/images/category/Hộp đựng đồ.jpg','<i class=\"fa fa-box\"></i>', 4);

-- Sản phẩm làm đẹp (CategoryID = 5)
INSERT INTO category(CategoryName, ImageLink, Icon, ParentID) VALUES
('Kem dưỡng da', 'static/images/category/Kem dưỡng da.jpg','<i class=\"fa fa-pump-soap\"></i>', 5),
('Sữa rửa mặt', 'static/images/category/Sữa rửa mặt.jpg','<i class=\"fa fa-soap\"></i>', 5),
('Son môi', 'static/images/category/Son môi.jpg','<i class=\"fa fa-lips\"></i>', 5),
('Phấn mắt', 'static/images/category/Phấn mắt.jpg','<i class=\"fa fa-eye\"></i>', 5),
('Nước hoa', 'static/images/category/Nước hoa.jpg','<i class=\"fa fa-spray-can\"></i>', 5);

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

