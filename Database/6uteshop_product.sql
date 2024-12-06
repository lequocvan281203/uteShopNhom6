
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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `ProductID` bigint NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(1000) NOT NULL,
  `Description` varchar(2500) DEFAULT NULL,
  `Price` double NOT NULL,
  `CategoryID` bigint NOT NULL,
  `Amount` int DEFAULT NULL,
  `BrandID` bigint DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `CategoryID_idx` (`CategoryID`),
  KEY `fk_product_brandid_idx` (`BrandID`),
  CONSTRAINT `fk_product_brandid` FOREIGN KEY (`BrandID`) REFERENCES `brand` (`BrandID`),
  CONSTRAINT `fk_product_categoryid` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;

-- Phụ kiện công nghệ--
-- Apple
INSERT INTO `product` VALUES
(1,'Tai nghe không dây Apple AirPods Pro', 'Tai nghe không dây Apple AirPods Pro', 5490000, 1, 20, 1),
(2,'iPhone 14 Pro Max', 'Điện thoại iPhone 14 Pro Max', 25990000, 1, 15, 1),
(3,'iPad Gen 10', 'Máy tính bảng iPad Gen 10', 10990000, 1, 10, 1),
(4,'MacBook Air M2', 'Máy tính xách tay MacBook Air M2', 28990000, 1, 12, 1),
(5,'Apple Watch Series 8', 'Đồng hồ thông minh Apple Watch Series 8', 9990000, 1, 18, 1);

-- Samsung
INSERT INTO `product` VALUES
(6,'Samsung Galaxy S23 Ultra', 'Điện thoại Samsung Galaxy S23 Ultra', 20990000, 1, 25, 2),
(7,'Samsung Galaxy Tab S8', 'Máy tính bảng Samsung Galaxy Tab S8', 15990000, 1, 15, 2),
(8,'Samsung Galaxy Watch 5', 'Đồng hồ thông minh Samsung Galaxy Watch 5', 7990000, 1, 10, 2),
(9,'Tai nghe không dây Samsung Galaxy Buds 2 Pro', 'Tai nghe không dây Samsung Galaxy Buds 2 Pro', 3490000, 1, 20, 2),
(10,'Samsung Galaxy Z Fold 4', 'Điện thoại gập Samsung Galaxy Z Fold 4', 30990000, 1, 12, 2);

-- Xiaomi
INSERT INTO `product` VALUES
(11,'Xiaomi 13 Pro', 'Điện thoại Xiaomi 13 Pro', 15990000, 1, 30, 3),
(12,'Xiaomi Pad 6', 'Máy tính bảng Xiaomi Pad 6', 8990000, 1, 20, 3),
(13,'Xiaomi Redmi Buds 4 Pro', 'Tai nghe không dây Xiaomi Redmi Buds 4 Pro', 1990000, 1, 25, 3),
(14,'Xiaomi Smart Band 7 Pro', 'Vòng đeo tay thông minh Xiaomi Smart Band 7 Pro', 1490000, 1, 15, 3),
(15,'Xiaomi Mi Band 7', 'Vòng đeo tay thông minh Xiaomi Mi Band 7', 990000, 1, 30, 3);

-- Sony
INSERT INTO `product` VALUES
(16,'Sony WH-1000XM5', 'Tai nghe không dây Sony WH-1000XM5', 8990000, 1, 15, 4),
(17,'Sony WF-1000XM4', 'Tai nghe không dây Sony WF-1000XM4', 5490000, 1, 20, 4),
(18,'Sony SRS-XB13', 'Loa Bluetooth Sony SRS-XB13', 1290000, 1, 25, 4);

-- Dell
INSERT INTO `product` VALUES
(19,'Dell XPS 13 Plus', 'Máy tính xách tay Dell XPS 13 Plus', 32990000, 1, 10, 5),
(20,'Dell Inspiron 16 Plus', 'Máy tính xách tay Dell Inspiron 16 Plus', 25990000, 1, 15, 5),
(21,'Dell Alienware x17 R2', 'Máy tính xách tay gaming Dell Alienware x17 R2', 65990000, 1, 12, 5),
(22,'Màn hình Dell UltraSharp U2723QE', 'Màn hình Dell UltraSharp U2723QE', 12990000, 1, 18, 5);

-- Asus
INSERT INTO `product` VALUES
(23,'Asus Zenbook 14 OLED', 'Máy tính xách tay Asus Zenbook 14 OLED', 24990000, 1, 25, 6),
(24,'Asus ROG Zephyrus G14', 'Máy tính xách tay gaming Asus ROG Zephyrus G14', 45990000, 1, 15, 6),
(25,'Asus TUF Gaming F15', 'Máy tính xách tay gaming Asus TUF Gaming F15', 20990000, 1, 10, 6),
(26,'Asus ROG Phone 6 Pro', 'Điện thoại gaming Asus ROG Phone 6 Pro', 18990000, 1, 20, 6);

-- HP
INSERT INTO `product` VALUES
(27,'HP Spectre x360 14', 'Máy tính xách tay HP Spectre x360 14', 30990000, 1, 30, 7),
(28,'HP Envy 15', 'Máy tính xách tay HP Envy 15', 22990000, 1, 20, 7),
(29,'HP Omen 16', 'Máy tính xách tay gaming HP Omen 16', 35990000, 1, 25, 7),
(30,'HP EliteBook x360 1040 G9', 'Máy tính xách tay doanh nhân HP EliteBook x360 1040 G9', 40990000, 1, 15, 7);

-- Logitech
INSERT INTO `product` VALUES
(31,'Logitech MX Master 3S', 'Chuột không dây Logitech MX Master 3S', 2490000, 1, 15, 8),
(32,'Logitech MX Anywhere 3', 'Chuột không dây Logitech MX Anywhere 3', 1990000, 1, 20, 8),
(33,'Logitech G Pro X Superlight', 'Chuột gaming không dây Logitech G Pro X Superlight', 3490000, 1, 25, 8),
(34,'Bàn phím cơ Logitech G915 TKL', 'Bàn phím cơ không dây Logitech G915 TKL', 4990000, 1, 10, 8);

-- JBL
INSERT INTO `product` VALUES
(35,'JBL Flip 6', 'Loa Bluetooth JBL Flip 6', 2990000, 1, 20, 9),
(36,'JBL Charge 5', 'Loa Bluetooth JBL Charge 5', 4490000, 1, 30, 9),
(37,'JBL Boombox 3', 'Loa Bluetooth JBL Boombox 3', 10990000, 1, 15, 9),
(38,'JBL Tune 230NC TWS', 'Tai nghe không dây JBL Tune 230NC TWS', 2490000, 1, 25, 9);

-- Anker
INSERT INTO `product` VALUES
(39,'Anker PowerCore 20100', 'Sạc dự phòng Anker PowerCore 20100', 1290000, 1, 30, 10),
(40,'Anker PowerWave Pad', 'Sạc không dây Anker PowerWave Pad', 790000, 1, 20, 10),
(41,'Anker Soundcore Life Q30', 'Tai nghe không dây Anker Soundcore Life Q30', 1990000, 1, 25, 10),
(42,'Anker PowerLine III USB-C to Lightning', 'Cáp sạc Anker PowerLine III USB-C to Lightning', 490000, 1, 15, 10);


-- Đồ dùng học tập--
-- Thiên Long
INSERT INTO `product` VALUES
(43,'Bút bi Thiên Long 027', 'Bút bi Thiên Long 027', 5000, 2, 30, 11),
(44,'Bút gel Thiên Long Gel-007', 'Bút gel Thiên Long Gel-007', 8000, 2, 25, 11),
(45,'Sổ tay Thiên Long FlexOffice A4', 'Sổ tay Thiên Long FlexOffice A4', 30000, 2, 20, 11),
(46,'Bút chì Thiên Long', 'Bút chì Thiên Long', 3000, 2, 30, 11),
(47,'Tẩy Thiên Long', 'Tẩy Thiên Long', 2000, 2, 25, 11);

-- Hồng Hà
INSERT INTO `product` VALUES
(48,'Bút máy Hồng Hà 78', 'Bút máy Hồng Hà 78', 20000, 2, 20, 12),
(49,'Bút bi Hồng Hà 111', 'Bút bi Hồng Hà 111', 4000, 2, 30, 12),
(50,'Sổ lò xo Hồng Hà A5', 'Sổ lò xo Hồng Hà A5', 25000, 2, 25, 12),
(51,'Thước kẻ Hồng Hà', 'Thước kẻ Hồng Hà', 5000, 2, 20, 12);

-- Campus
INSERT INTO `product` VALUES
(52,'Sổ tay Campus', 'Sổ tay Campus', 25000, 2, 30, 13),
(53,'Bút bi Campus', 'Bút bi Campus', 6000, 2, 25, 13),
(54,'Bút chì Campus', 'Bút chì Campus', 4000, 2, 20, 13),
(55,'Tẩy Campus', 'Tẩy Campus', 3000, 2, 30, 13);

-- Deli
INSERT INTO `product` VALUES
(56,'Bút lông Deli', 'Bút lông Deli', 15000, 2, 20, 14),
(57,'Bút dạ quang Deli', 'Bút dạ quang Deli', 10000, 2, 25, 14),
(58,'Kéo Deli', 'Kéo Deli', 20000, 2, 15, 14),
(59,'Ghim bấm Deli', 'Ghim bấm Deli', 15000, 2, 30, 14),
(60,'Dập ghim Deli', 'Dập ghim Deli', 30000, 2, 20, 14);

-- Stabilo
INSERT INTO `product` VALUES
(61,'Bút dạ quang Stabilo Boss', 'Bút dạ quang Stabilo Boss', 12000, 2, 25, 15),
(62,'Bút bi Stabilo Point 88', 'Bút bi Stabilo Point 88', 10000, 2, 30, 15),
(63,'Bút chì màu Stabilo', 'Bút chì màu Stabilo', 50000, 2, 20, 15);

-- Faber-Castell
INSERT INTO `product` VALUES
(64,'Bút chì Faber-Castell', 'Bút chì Faber-Castell', 8000, 2, 20, 16),
(65,'Bút màu nước Faber-Castell', 'Bút màu nước Faber-Castell', 100000, 2, 15, 16),
(66,'Bút lông dầu Faber-Castell', 'Bút lông dầu Faber-Castell', 30000, 2, 25, 16);

-- Pilot
INSERT INTO `product` VALUES
(67,'Bút máy Pilot', 'Bút máy Pilot', 150000, 2, 15, 17),
(68,'Bút bi Pilot', 'Bút bi Pilot', 10000, 2, 30, 17),
(69,'Bút gel Pilot', 'Bút gel Pilot', 12000, 2, 20, 17);

-- Parker
INSERT INTO `product` VALUES
(70,'Bút máy Parker', 'Bút máy Parker', 500000, 2, 10, 18),
(71,'Bút bi Parker', 'Bút bi Parker', 200000, 2, 15, 18);

-- Montblanc
INSERT INTO `product` VALUES
(72,'Bút máy Montblanc', 'Bút máy Montblanc', 10000000, 2, 5, 19);


-- Thời trang:--
-- Nike
INSERT INTO `product` VALUES
(73,'Giày thể thao Nike Air Force 1', 'Giày thể thao Nike Air Force 1', 2500000, 3, 20, 20),
(74,'Áo thun Nike', 'Áo thun Nike', 500000, 3, 25, 20),
(75,'Quần jogger Nike', 'Quần jogger Nike', 700000, 3, 15, 20),
(76,'Mũ lưỡi trai Nike', 'Mũ lưỡi trai Nike', 300000, 3, 30, 20);

-- Adidas
INSERT INTO `product` VALUES
(77,'Giày thể thao Adidas Stan Smith', 'Giày thể thao Adidas Stan Smith', 2000000, 3, 25, 21),
(78,'Áo khoác Adidas', 'Áo khoác Adidas', 1000000, 3, 20, 21),
(79,'Quần legging Adidas', 'Quần legging Adidas', 600000, 3, 15, 21),
(80,'Túi đeo chéo Adidas', 'Túi đeo chéo Adidas', 500000, 3, 30, 21);

-- Puma
INSERT INTO `product` VALUES
(81,'Giày thể thao Puma Suede', 'Giày thể thao Puma Suede', 1800000, 3, 30, 22),
(82,'Áo hoodie Puma', 'Áo hoodie Puma', 800000, 3, 25, 22),
(83,'Quần short Puma', 'Quần short Puma', 400000, 3, 20, 22);

-- Converse (,tiếp tục)
INSERT INTO `product` VALUES
(84,'Giày Converse Chuck Taylor', 'Giày Converse Chuck Taylor', 1500000, 3, 20, 23),
(85,'Áo thun Converse', 'Áo thun Converse', 400000, 3, 30, 23),
(86,'Túi tote Converse', 'Túi tote Converse', 300000, 3, 25, 23);

-- Vans
INSERT INTO `product` VALUES
(87,'Giày Vans Old Skool', 'Giày Vans Old Skool', 1600000, 3, 25, 24),
(88,'Áo hoodie Vans', 'Áo hoodie Vans', 800000, 3, 20, 24),
(89,'Nón lưỡi trai Vans', 'Nón lưỡi trai Vans', 400000, 3, 30, 24),
(90,'Balo Vans', 'Balo Vans', 1000000, 3, 15, 24);

-- Uniqlo
INSERT INTO `product` VALUES
(91,'Áo thun Uniqlo', 'Áo thun Uniqlo', 300000, 3, 30, 25),
(92,'Quần jeans Uniqlo', 'Quần jeans Uniqlo', 800000, 3, 25, 25),
(93,'Áo khoác Uniqlo', 'Áo khoác Uniqlo', 1200000, 3, 20, 25),
(94,'Váy Uniqlo', 'Váy Uniqlo', 700000, 3, 15, 25);

-- H&M
INSERT INTO `product` VALUES
(95,'Áo sơ mi H&M', 'Áo sơ mi H&M', 400000, 3, 20, 26),
(96,'Quần tây H&M', 'Quần tây H&M', 700000, 3, 30, 26),
(97,'Đầm H&M', 'Đầm H&M', 1000000, 3, 25, 26);

-- Zara
INSERT INTO `product` VALUES
(98,'Áo khoác Zara', 'Áo khoác Zara', 1500000, 3, 25, 27),
(99,'Quần âu Zara', 'Quần âu Zara', 1000000, 3, 20, 27),
(100,'Giày Zara', 'Giày Zara', 1200000, 3, 30, 27);

-- Mango
INSERT INTO `product` VALUES
(101,'Đầm Mango', 'Đầm Mango', 1200000, 3, 30, 28),
(102,'Áo len Mango', 'Áo len Mango', 800000, 3, 25, 28),
(103,'Chân váy Mango', 'Chân váy Mango', 600000, 3, 20, 28);

-- Topshop
INSERT INTO `product` VALUES
(104,'Áo croptop Topshop', 'Áo croptop Topshop', 400000, 3, 20, 29),
(105,'Quần short Topshop', 'Quần short Topshop', 500000, 3, 30, 29),
(106,'Jumpsuit Topshop', 'Jumpsuit Topshop', 1000000, 3, 25, 29);


-- Đồ trang trí phòng:--
-- IKEA
INSERT INTO `product` VALUES
(107,'Ghế IKEA', 'Ghế IKEA', 500000, 4, 20, 30),
(108,'Bàn IKEA', 'Bàn IKEA', 1000000, 4, 25, 30),
(109,'Tủ IKEA', 'Tủ IKEA', 1500000, 4, 15, 30),
(110,'Giường IKEA', 'Giường IKEA', 2000000, 4, 30, 30);

-- JYSK
INSERT INTO `product` VALUES
(111,'Chăn JYSK', 'Chăn JYSK', 300000, 4, 25, 31),
(112,'Gối JYSK', 'Gối JYSK', 150000, 4, 20, 31),
(113,'Đệm JYSK', 'Đệm JYSK', 1000000, 4, 30, 31),
(114,'Rèm cửa JYSK', 'Rèm cửa JYSK', 500000, 4, 15, 31);

-- MUJI
INSERT INTO `product` VALUES
(115,'Hộp đựng đồ MUJI', 'Hộp đựng đồ MUJI', 100000, 4, 30, 32),
(116,'Bút MUJI', 'Bút MUJI', 50000, 4, 25, 32),
(117,'Sổ tay MUJI', 'Sổ tay MUJI', 150000, 4, 20, 32);

-- MINISO
INSERT INTO `product` VALUES
(118,'Gấu bông MINISO', 'Gấu bông MINISO', 150000, 4, 20, 33),
(119,'Đèn ngủ MINISO', 'Đèn ngủ MINISO', 100000, 4, 30, 33),
(120,'Túi xách MINISO', 'Túi xách MINISO', 200000, 4, 25, 33);

-- Daiso
INSERT INTO `product` VALUES
(121,'Hộp cơm Daiso', 'Hộp cơm Daiso', 50000, 4, 25, 34),
(122,'Ly nước Daiso', 'Ly nước Daiso', 30000, 4, 20, 34),
(123,'Khăn lau Daiso', 'Khăn lau Daiso', 20000, 4, 30, 34);

-- Xiaomi
INSERT INTO `product` VALUES
(124,'Đèn thông minh Xiaomi', 'Đèn thông minh Xiaomi', 300000, 4, 15, 35),
(125,'Camera an ninh Xiaomi', 'Camera an ninh Xiaomi', 500000, 4, 25, 35),
(126,'Máy lọc không khí Xiaomi', 'Máy lọc không khí Xiaomi', 1000000, 4, 20, 35);

-- Philips
INSERT INTO `product` VALUES
(127,'Bóng đèn Philips', 'Bóng đèn Philips', 100000, 4, 30, 36),
(128,'Đèn bàn Philips', 'Đèn bàn Philips', 300000, 4, 15, 36),
(129,'Máy sấy tóc Philips', 'Máy sấy tóc Philips', 500000, 4, 25, 36);

-- Osram
INSERT INTO `product` VALUES
(130,'Bóng đèn Osram', 'Bóng đèn Osram', 80000, 4, 20, 37),
(131,'Đèn LED Osram', 'Đèn LED Osram', 200000, 4, 30, 37);



-- Sản phẩm làm đẹp:--
-- Innisfree
INSERT INTO `product` VALUES
(132,'Sữa rửa mặt Innisfree', 'Sữa rửa mặt Innisfree', 200000, 5, 25, 38),
(133,'Kem chống nắng Innisfree', 'Kem chống nắng Innisfree', 300000, 5, 20, 38),
(134,'Mặt nạ Innisfree', 'Mặt nạ Innisfree', 30000, 5, 30, 38),
(135,'Nước hoa hồng Innisfree', 'Nước hoa hồng Innisfree', 300000, 5, 15, 38);

-- Laneige
INSERT INTO `product` VALUES
(136,'Kem dưỡng ẩm Laneige', 'Kem dưỡng ẩm Laneige', 500000, 5, 20, 39),
(137,'Mặt nạ ngủ Laneige', 'Mặt nạ ngủ Laneige', 300000, 5, 30, 39),
(138,'Son dưỡng môi Laneige', 'Son dưỡng môi Laneige', 200000, 5, 25, 39);

-- Etude House
INSERT INTO `product` VALUES
(139,'Phấn mắt Etude House', 'Phấn mắt Etude House', 200000, 5, 30, 40),
(140,'Son môi Etude House', 'Son môi Etude House', 150000, 5, 25, 40),
(141,'Kem nền Etude House', 'Kem nền Etude House', 300000, 5, 20, 40),
(142,'Mascara Etude House', 'Mascara Etude House', 100000, 5, 15, 40);

-- The Face Shop
INSERT INTO `product` VALUES
(143,'Sữa rửa mặt The Face Shop', 'Sữa rửa mặt The Face Shop', 200000, 5, 20, 41),
(144,'Kem dưỡng da The Face Shop', 'Kem dưỡng da The Face Shop', 400000, 5, 30, 41),
(145,'Mặt nạ The Face Shop', 'Mặt nạ The Face Shop', 30000, 5, 25, 41);

-- Nature Republic
INSERT INTO `product` VALUES
(146,'Gel lô hội Nature Republic', 'Gel lô hội Nature Republic', 150000, 5, 25, 42),
(147,'Mặt nạ Nature Republic', 'Mặt nạ Nature Republic', 30000, 5, 20, 42),
(148,'Kem chống nắng Nature Republic', 'Kem chống nắng Nature Republic', 300000, 5, 30, 42);

-- L'Oreal
INSERT INTO `product` VALUES
(149,'Son môi L\'Oreal', 'Son môi L\'Oreal', 250000, 5, 15, 43),
(150,'Kem nền L\'Oreal', 'Kem nền L\'Oreal', 350000, 5, 25, 43),
(151,'Mascara L\'Oreal', 'Mascara L\'Oreal', 200000, 5, 20, 43);

-- Maybelline
INSERT INTO `product` VALUES
(152,'Kem che khuyết điểm Maybelline', 'Kem che khuyết điểm Maybelline', 200000, 5, 30, 44),
(153,'Phấn phủ Maybelline', 'Phấn phủ Maybelline', 250000, 5, 15, 44),
(154,'Mascara Maybelline', 'Mascara Maybelline', 150000, 5, 25, 44);

-- Revlon
INSERT INTO `product` VALUES
(155,'Son môi Revlon', 'Son môi Revlon', 200000, 5, 20, 45),
(156,'Kem nền Revlon', 'Kem nền Revlon', 300000, 5, 30, 45),
(157,'Phấn má hồng Revlon', 'Phấn má hồng Revlon', 150000, 5, 25, 45);

-- NYX
INSERT INTO `product` VALUES
(158,'Son kem lì NYX', 'Son kem lì NYX', 200000, 5, 25, 46),
(159,'Bảng phấn mắt NYX', 'Bảng phấn mắt NYX', 400000, 5, 20, 46),
(160,'Xịt khoáng NYX', 'Xịt khoáng NYX', 150000, 5, 30, 46);

-- E.L.F.
INSERT INTO `product` VALUES
(161,'Kem lót E.L.F.', 'Kem lót E.L.F.', 150000, 5, 30, 47),
(162,'Phấn má hồng E.L.F.', 'Phấn má hồng E.L.F.', 100000, 5, 25, 47),
(163,'Cọ trang điểm E.L.F.', 'Cọ trang điểm E.L.F.', 50000, 5, 20, 47);




/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

