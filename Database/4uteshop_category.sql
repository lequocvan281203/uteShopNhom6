

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
(1,'Phụ kiện công nghệ', 'https://drive.google.com/file/d/1Nsx-1gEpi1bEWG5mpxflS6-98z_ZexPf/view?usp=drive_link','<i class=\"fa fa-user\"></i>',0),
(2, 'Đồ dùng học tập', 'https://drive.google.com/file/d/1FzHRp3SbW2opm00wV-he3GYg9GshY7YX/view?usp=drive_link','<i class=\"fa fa-child\"></i>',0),
(3,'Thời trang', 'https://drive.google.com/file/d/1NT9vQiUTh19_2Fb_ClkIl9Av-u6nfhIZ/view?usp=drive_link','<i class=\"fab fa-gitlab\"></i>',0),
(4,'Đồ trang trí phòng', 'https://drive.google.com/file/d/16igxWA952mNs6KBwhgnRUxlPQt6j-_lO/view?usp=drive_link','<i class=\"fa fa-pills\"></i>',0),
(5, 'Sản phẩm làm đẹp', 'https://drive.google.com/file/d/1RXF99WH-zVOIvpzJYlbNgvrOTEQPLrzx/view?usp=drive_link','<i class=\"fa fa-capsules\"></i>',0);
-- (6,'<i class=\"fa fa-list\"></i>',0)

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

