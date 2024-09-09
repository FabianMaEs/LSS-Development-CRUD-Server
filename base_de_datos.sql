-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gestor_salas
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `horaInicio` time NOT NULL,
  `horaFin` time NOT NULL,
  `usuario` varchar(100) NOT NULL,
  `id_sala` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sala` (`id_sala`),
  CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_sala`) REFERENCES `sala` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'2024-09-09','10:00:00','11:30:00','Fabian',1),(2,'2024-09-09','13:00:00','14:45:00','Leonardo',1),(3,'2024-09-10','12:00:00','13:45:00','Todos',1),(4,'2024-09-10','15:00:00','16:30:00','Nancy',1),(5,'2024-09-11','14:00:00','15:30:00','Arturo',1),(6,'2024-09-12','11:00:00','12:45:00','Fabian',1),(7,'2024-09-09','10:30:00','12:15:00','Leonardo',2),(8,'2024-09-10','16:00:00','17:30:00','Todos',2),(9,'2024-09-11','13:00:00','14:45:00','Nancy',2),(10,'2024-09-12','15:00:00','16:45:00','Arturo',2),(11,'2024-09-13','10:00:00','11:30:00','Fabian',2),(12,'2024-09-09','12:30:00','14:15:00','Nancy',3),(13,'2024-09-10','13:00:00','14:45:00','Arturo',3),(14,'2024-09-11','15:00:00','16:30:00','Fabian',3),(15,'2024-09-12','10:00:00','11:45:00','Leonardo',3),(16,'2024-09-13','17:00:00','18:45:00','Todos',3),(17,'2024-09-09','15:00:00','16:30:00','Arturo',4),(18,'2024-09-10','10:00:00','11:45:00','Fabian',4),(19,'2024-09-11','13:00:00','14:30:00','Leonardo',4),(20,'2024-09-12','14:00:00','15:30:00','Todos',4),(21,'2024-09-13','12:00:00','13:45:00','Nancy',4),(22,'2024-09-09','11:00:00','12:30:00','Todos',5),(23,'2024-09-10','12:00:00','13:45:00','Nancy',5),(24,'2024-09-11','10:00:00','11:45:00','Arturo',5),(25,'2024-09-12','13:00:00','14:30:00','Fabian',5),(26,'2024-09-13','14:00:00','15:45:00','Leonardo',5);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
INSERT INTO `sala` VALUES (1,'Sala 1'),(2,'Sala 2'),(3,'Sala 3'),(4,'Sala 4'),(5,'Sala 5'),(6,'Sala 6');
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Fabian'),(2,'Leonardo'),(3,'Arturo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-09  0:32:40
