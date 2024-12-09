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
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `ImageID` bigint NOT NULL AUTO_INCREMENT,
  `ProductID` bigint NOT NULL,
  `ImageLink` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ImageID`),
  KEY `ProductID_idx` (`ProductID`),
  CONSTRAINT `fk_image_productid` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES 
(1,1,'p1_1.jpg'),
(2,2,'p2_1.jpg'),
(3,3,'p3_1.jpg'),
(4,4,'p4_1.jpg'),
(5,5,'p5_1.jpg'),
(6,6,'p6_1.jpg'),
(7,7,'p7_1.jpg'),
(8,8,'p8_1.jpg'),
(9,9,'p9_1.jpg'),
(10,10,'p10_1.jpg'),
(11,11,'p11_1.jpg'),
(12,12,'p12_1.jpg'),
(13,13,'p13_1.jpg'),
(14,14,'p14_1.jpg'),
(15,15,'p15_1.jpg'),
(16,16,'p16_1.jpg'),
(17,17,'p17_1.jpg'),
(18,18,'p18_1.jpg'),
(19,19,'p19_1.jpg'),
(20,20,'p20_1.jpg'),
(21,21,'p21_1.jpg'),
(22,22,'p22_1.jpg'),
(23,23,'p23_1.jpg'),
(24,24,'p24_1.jpg'),
(25,25,'p25_1.jpg'),
(26,26,'p26_1.jpg'),
(27,27,'p27_1.jpg'),
(28,28,'p28_1.jpg'),
(29,29,'p29_1.jpg'),
(30,30,'p30_1.jpg'),
(31,31,'p31_1.jpg'),
(32,32,'p32_1.jpg'),
(33,33,'p33_1.jpg'),
(34,34,'p34_1.jpg'),
(35,35,'p35_1.jpg'),
(36,36,'p36_1.jpg'),
(37,37,'p37_1.jpg'),
(38,38,'p38_1.jpg'),
(39,39,'p39_1.jpg'),
(40,40,'p40_1.jpg'),
(41,41,'p41_1.jpg'),
(42,42,'p42_1.jpg'),
(43,43,'p43_1.jpg'),
(44,44,'p44_1.jpg'),
(45,45,'p45_1.jpg'),
(46,46,'p46_1.jpg'),
(47,47,'p47_1.jpg'),
(48,48,'p48_1.jpg'),
(49,49,'p49_1.jpg'),
(50,50,'p50_1.jpg'),
(51,51,'p51_1.jpg'),
(52,52,'p52_1.jpg'),
(53,53,'p53_1.jpg'),
(54,54,'p54_1.jpg'),
(55,55,'p55_1.jpg'),
(56,56,'p56_1.jpg'),
(57,57,'p57_1.jpg'),
(58,58,'p58_1.jpg'),
(59,59,'p59_1.jpg'),
(60,60,'p60_1.jpg'),
(61,61,'p61_1.jpg'),
(62,62,'p62_1.jpg'),
(63,63,'p63_1.jpg'),
(64,64,'p64_1.jpg'),
(65,65,'p65_1.jpg'),
(66,66,'p66_1.jpg'),
(67,67,'p67_1.jpg'),
(68,68,'p68_1.jpg'),
(69,69,'p69_1.jpg'),
(70,70,'p70_1.jpg'),
(71,71,'p71_1.jpg'),
(72,72,'p72_1.jpg'),
(73,73,'p73_1.jpg'),
(74,74,'p74_1.jpg'),
(75,75,'p75_1.jpg'),
(76,76,'p76_1.jpg'),
(77,77,'p77_1.jpg'),
(78,78,'p78_1.jpg'),
(79,79,'p79_1.jpg'),
(80,80,'p80_1.jpg'),
(81,81,'p81_1.jpg'),
(82,82,'p82_1.jpg'),
(83,83,'p83_1.jpg'),
(84,84,'p84_1.jpg'),
(85,85,'p85_1.jpg'),
(86,86,'p86_1.jpg'),
(87,87,'p87_1.jpg'),
(88,88,'p88_1.jpg'),
(89,89,'p89_1.jpg'),
(90,90,'p90_1.jpg'),
(91,91,'p91_1.jpg'),
(92,92,'p92_1.jpg'),
(93,93,'p93_1.jpg'),
(94,94,'p94_1.jpg'),
(95,95,'p95_1.jpg'),
(96,96,'p96_1.jpg'),
(97,97,'p97_1.jpg'),
(98,98,'p98_1.jpg'),
(99,99,'p99_1.jpg'),
(100,100,'p100_1.jpg'),
(101,101,'p101_1.jpg'),
(102,102,'p102_1.jpg'),
(103,103,'p103_1.jpg'),
(104,104,'p104_1.jpg'),
(105,105,'p105_1.jpg'),
(106,106,'p106_1.jpg'),
(107,107,'p107_1.jpg'),
(108,108,'p108_1.jpg'),
(109,109,'p109_1.jpg'),
(110,110,'p110_1.jpg'),
(111,111,'p111_1.jpg'),
(112,112,'p112_1.jpg'),
(113,113,'p113_1.jpg'),
(114,114,'p114_1.jpg'),
(115,115,'p115_1.jpg'),
(116,116,'p116_1.jpg'),
(117,117,'p117_1.jpg'),
(118,118,'p118_1.jpg'),
(119,119,'p119_1.jpg'),
(120,120,'p120_1.jpg'),
(121,121,'p121_1.jpg'),
(122,122,'p122_1.jpg'),
(123,123,'p123_1.jpg'),
(124,124,'p124_1.jpg'),
(125,125,'p125_1.jpg'),
(126,126,'p126_1.jpg'),
(127,127,'p127_1.jpg'),
(128,128,'p128_1.jpg'),
(129,129,'p129_1.jpg'),
(130,130,'p130_1.jpg'),
(131,131,'p131_1.jpg'),
(132,132,'p132_1.jpg'),
(133,133,'p133_1.jpg'),
(134,134,'p134_1.jpg'),
(135,135,'p135_1.jpg'),
(136,136,'p136_1.jpg'),
(137,137,'p137_1.jpg'),
(138,138,'p138_1.jpg'),
(139,139,'p139_1.jpg'),
(140,140,'p140_1.jpg'),
(141,141,'p141_1.jpg'),
(142,142,'p142_1.jpg'),
(143,143,'p143_1.jpg'),
(144,144,'p144_1.jpg'),
(145,145,'p145_1.jpg'),
(146,146,'p146_1.jpg'),
(147,147,'p147_1.jpg'),
(148,148,'p148_1.jpg'),
(149,149,'p149_1.jpg'),
(150,150,'p150_1.jpg'),
(151,151,'p151_1.jpg'),
(152,152,'p152_1.jpg'),
(153,153,'p153_1.jpg'),
(154,154,'p154_1.jpg'),
(155,155,'p155_1.jpg'),
(156,156,'p156_1.jpg'),
(157,157,'p157_1.jpg'),
(158,158,'p158_1.jpg'),
(159,159,'p159_1.jpg'),
(160,160,'p160_1.jpg'),
(161,161,'p161_1.jpg'),
(162,162,'p162_1.jpg'),
(163,163,'p163_1.jpg');

/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

