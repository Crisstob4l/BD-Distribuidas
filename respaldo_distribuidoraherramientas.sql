-- MySQL dump 10.13  Distrib 9.0.1, for Win64 (x86_64)
--
-- Host: localhost    Database: distribuidoraherramientas
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buytool`
--

DROP TABLE IF EXISTS `buytool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buytool` (
  `idBuyTool` int NOT NULL,
  `idPurchase` int DEFAULT NULL,
  `idInventory` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `unitPrice` decimal(10,2) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`idBuyTool`),
  KEY `idPurchase` (`idPurchase`),
  KEY `idInventory` (`idInventory`),
  CONSTRAINT `buytool_ibfk_1` FOREIGN KEY (`idPurchase`) REFERENCES `purchase` (`idPurchase`),
  CONSTRAINT `buytool_ibfk_2` FOREIGN KEY (`idInventory`) REFERENCES `inventory` (`idInventory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buytool`
--

LOCK TABLES `buytool` WRITE;
/*!40000 ALTER TABLE `buytool` DISABLE KEYS */;
INSERT INTO `buytool` VALUES (1,1,1,5,100.00,'Compra inicial de tijeras'),(2,1,2,3,200.00,'Compra de taladros'),(3,1,3,10,50.00,'Compra de martillos'),(4,2,1,4,150.00,'Reabastecimiento de tijeras'),(5,2,2,7,220.00,'Sierra circular en promoción'),(6,3,3,2,80.00,'Compra de herramientas de jardín'),(7,3,1,12,75.00,'Compra de herramientas variadas'),(8,4,4,8,90.00,'Taladros de oferta'),(9,4,5,6,60.00,'Martillos en descuento'),(10,5,1,15,30.00,'Tijeras de jardín');
/*!40000 ALTER TABLE `buytool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `idInventory` int NOT NULL,
  `idWarehouse` int DEFAULT NULL,
  `idTool` int DEFAULT NULL,
  `zone` varchar(10) DEFAULT NULL,
  `rack` varchar(10) DEFAULT NULL,
  `level` varchar(10) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `purchasePrice` decimal(10,2) DEFAULT NULL,
  `storeSalePrice` decimal(10,2) DEFAULT NULL,
  `wholeSalePrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idInventory`),
  KEY `idWarehouse` (`idWarehouse`),
  KEY `idTool` (`idTool`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`idWarehouse`) REFERENCES `warehouse` (`idWarehouse`),
  CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`idTool`) REFERENCES `tool` (`idTool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,1,'A','1','1','A-1',10,200.00,250.00,180.00),(2,1,2,'A','1','2','A-2',15,300.00,400.00,250.00),(3,1,3,'A','1','3','A-3',8,150.00,200.00,120.00),(4,1,4,'A','1','4','A-4',5,100.00,150.00,90.00),(5,1,5,'A','1','5','A-5',20,50.00,80.00,40.00);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase`
--

DROP TABLE IF EXISTS `purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase` (
  `idPurchase` int NOT NULL,
  `idSupplier` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `folio` varchar(50) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPurchase`),
  KEY `idSupplier` (`idSupplier`),
  CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`idSupplier`) REFERENCES `supplier` (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase`
--

LOCK TABLES `purchase` WRITE;
/*!40000 ALTER TABLE `purchase` DISABLE KEYS */;
INSERT INTO `purchase` VALUES (1,1,'2023-01-10','10:30:00','F-001',500.00),(2,2,'2023-01-15','11:45:00','F-002',750.00),(3,3,'2023-01-20','09:15:00','F-003',1200.00),(4,4,'2023-02-05','14:20:00','F-004',650.00),(5,5,'2023-02-10','08:30:00','F-005',300.00),(6,1,'2023-02-15','16:00:00','F-006',950.00),(7,2,'2023-03-01','12:00:00','F-007',500.00),(8,3,'2023-03-10','15:45:00','F-008',800.00),(9,4,'2023-03-20','10:30:00','F-009',400.00),(10,5,'2023-03-25','13:15:00','F-010',700.00);
/*!40000 ALTER TABLE `purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `idSupplier` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idSupplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'ProveeTools','Av. Reforma','101','CDMX','CDMX','5551234567','proveetools@mail.com','Juan Perez'),(2,'Ferretería Mundial','Calle Hidalgo','15','Monterrey','Nuevo León','8181234567','ferremundial@mail.com','Laura Martinez'),(3,'Herramientas del Norte','Calle 13','23','Guadalajara','Jalisco','3312345678','herrdelnorte@mail.com','Carlos Diaz'),(4,'Distribuidora del Sur','Avenida Patria','45','Tijuana','Baja California','6642345678','delsur@mail.com','Ana Torres'),(5,'Central Tooling','Insurgentes','400','CDMX','CDMX','5557654321','centraltooling@mail.com','Raúl Gómez');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_guadalajara`
--

DROP TABLE IF EXISTS `supplier_guadalajara`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_guadalajara` (
  `idSupplier` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_guadalajara`
--

LOCK TABLES `supplier_guadalajara` WRITE;
/*!40000 ALTER TABLE `supplier_guadalajara` DISABLE KEYS */;
INSERT INTO `supplier_guadalajara` VALUES (3,'Herramientas del Norte','Calle 13','23','Guadalajara','Jalisco','3312345678','herrdelnorte@mail.com','Carlos Diaz');
/*!40000 ALTER TABLE `supplier_guadalajara` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool`
--

DROP TABLE IF EXISTS `tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool` (
  `idTool` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `manufacturer` varchar(50) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`idTool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool`
--

LOCK TABLES `tool` WRITE;
/*!40000 ALTER TABLE `tool` DISABLE KEYS */;
INSERT INTO `tool` VALUES (1,'Taladro','TLD-200','Bosch','Azul','Mediano','Taladro inalámbrico de 12V'),(2,'Sierra Circular','SC-150','DeWalt','Amarillo','Grande','Sierra circular de 1500W'),(3,'Tijera de jardinero','TJ-22','Truper','Verde','Pequeño','Tijera para poda de jardín'),(4,'Llave Inglesa','LI-18','Stanley','Negro','Grande','Llave ajustable para tuercas grandes'),(5,'Martillo','MT-500','Truper','Rojo','Mediano','Martillo de 500g con mango de fibra');
/*!40000 ALTER TABLE `tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `idWarehouse` int NOT NULL,
  `street` varchar(100) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `area` decimal(10,2) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `manager` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idWarehouse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

LOCK TABLES `warehouse` WRITE;
/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Calle 13','23','Guadalajara','Jalisco',150.50,'3312345678','Carlos Diaz'),(2,'Av. Revolución','200','Monterrey','Nuevo León',200.00,'8182345678','Marta Herrera'),(3,'Calle del Valle','40','CDMX','CDMX',100.00,'5553456789','Luis Torres'),(4,'Avenida Hidalgo','300','Toluca','Estado de México',180.50,'7221234567','Sofía Lopez'),(5,'Boulevard Oriente','100','Puebla','Puebla',120.00,'2221234567','Diego Fernandez');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-31 10:06:03
