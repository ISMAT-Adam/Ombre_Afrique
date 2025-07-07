-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: OmbreAfrique
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.1

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
-- Current Database: `OmbreAfrique`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `OmbreAfrique` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `OmbreAfrique`;

--
-- Table structure for table `Approvisionner`
--

DROP TABLE IF EXISTS `Approvisionner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Approvisionner` (
  `id_fournisseur_Fournisseur` int NOT NULL,
  `id_ingredient_stock` int NOT NULL,
  PRIMARY KEY (`id_fournisseur_Fournisseur`,`id_ingredient_stock`),
  KEY `id_ingredient_stock` (`id_ingredient_stock`),
  CONSTRAINT `Approvisionner_ibfk_1` FOREIGN KEY (`id_fournisseur_Fournisseur`) REFERENCES `Fournisseur` (`id_fournisseur_Fournisseur`),
  CONSTRAINT `Approvisionner_ibfk_2` FOREIGN KEY (`id_ingredient_stock`) REFERENCES `stock` (`id_ingredient_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Approvisionner`
--

LOCK TABLES `Approvisionner` WRITE;
/*!40000 ALTER TABLE `Approvisionner` DISABLE KEYS */;
/*!40000 ALTER TABLE `Approvisionner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client` (
  `id_client_Client` int NOT NULL,
  `nom_Client` varchar(50) DEFAULT NULL,
  `telephone_Client` varchar(20) DEFAULT NULL,
  `adresse_Client` varchar(100) DEFAULT NULL,
  `preferences_Client` text,
  `points_fidelite_Client` int DEFAULT NULL,
  PRIMARY KEY (`id_client_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Client`
--

LOCK TABLES `Client` WRITE;
/*!40000 ALTER TABLE `Client` DISABLE KEYS */;
/*!40000 ALTER TABLE `Client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Commande`
--

DROP TABLE IF EXISTS `Commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Commande` (
  `id_ccommande_Commande` int NOT NULL,
  `date_heure_Commande` datetime DEFAULT NULL,
  `type_Commande` varchar(30) DEFAULT NULL,
  `id_serveur_Commande` int DEFAULT NULL,
  `facture_id_facture_facture` int DEFAULT NULL,
  PRIMARY KEY (`id_ccommande_Commande`),
  KEY `id_serveur_Commande` (`id_serveur_Commande`),
  KEY `facture_id_facture_facture` (`facture_id_facture_facture`),
  CONSTRAINT `Commande_ibfk_1` FOREIGN KEY (`id_serveur_Commande`) REFERENCES `Employé` (`id_employe_Employé`),
  CONSTRAINT `Commande_ibfk_2` FOREIGN KEY (`facture_id_facture_facture`) REFERENCES `Facture` (`id_facture_Facture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Commande`
--

LOCK TABLES `Commande` WRITE;
/*!40000 ALTER TABLE `Commande` DISABLE KEYS */;
INSERT INTO `Commande` VALUES (1,'2025-06-07 20:14:54','sur place',2,1),(2,'2025-06-07 20:14:54','à emporter',3,2),(3,'2025-06-07 20:14:54','livraison à domicile',4,3);
/*!40000 ALTER TABLE `Commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Composer_de`
--

DROP TABLE IF EXISTS `Composer_de`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Composer_de` (
  `code_plat_Plat` int NOT NULL,
  `id_ingredient_stock` int NOT NULL,
  PRIMARY KEY (`code_plat_Plat`,`id_ingredient_stock`),
  KEY `id_ingredient_stock` (`id_ingredient_stock`),
  CONSTRAINT `Composer_de_ibfk_1` FOREIGN KEY (`code_plat_Plat`) REFERENCES `Plat` (`code_plat_Plat`),
  CONSTRAINT `Composer_de_ibfk_2` FOREIGN KEY (`id_ingredient_stock`) REFERENCES `stock` (`id_ingredient_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Composer_de`
--

LOCK TABLES `Composer_de` WRITE;
/*!40000 ALTER TABLE `Composer_de` DISABLE KEYS */;
/*!40000 ALTER TABLE `Composer_de` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contenir`
--

DROP TABLE IF EXISTS `Contenir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contenir` (
  `code_plat_Plat` int NOT NULL,
  `id_ccommande_Commande` int NOT NULL,
  PRIMARY KEY (`code_plat_Plat`,`id_ccommande_Commande`),
  KEY `id_ccommande_Commande` (`id_ccommande_Commande`),
  CONSTRAINT `Contenir_ibfk_1` FOREIGN KEY (`code_plat_Plat`) REFERENCES `Plat` (`code_plat_Plat`),
  CONSTRAINT `Contenir_ibfk_2` FOREIGN KEY (`id_ccommande_Commande`) REFERENCES `Commande` (`id_ccommande_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contenir`
--

LOCK TABLES `Contenir` WRITE;
/*!40000 ALTER TABLE `Contenir` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contenir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employe`
--

DROP TABLE IF EXISTS `Employe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employe` (
  `id_employe_Employe` int NOT NULL,
  `nom_Employe` varchar(50) DEFAULT NULL,
  `prenom_Employe` varchar(50) DEFAULT NULL,
  `telephone_Employe` varchar(20) DEFAULT NULL,
  `adresse_Employe` varchar(100) DEFAULT NULL,
  `poste_Employe` varchar(50) DEFAULT NULL,
  `salaire_Employe` decimal(10,2) DEFAULT NULL,
  `date_embauche_Employe` date DEFAULT NULL,
  PRIMARY KEY (`id_employe_Employe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employe`
--

LOCK TABLES `Employe` WRITE;
/*!40000 ALTER TABLE `Employe` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employé`
--

DROP TABLE IF EXISTS `Employé`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employé` (
  `id_employe_Employé` int NOT NULL,
  `nom_Employé` varchar(50) DEFAULT NULL,
  `prenom_Employé` varchar(50) DEFAULT NULL,
  `telephone_Employé` varchar(20) DEFAULT NULL,
  `adresse_Employé` varchar(100) DEFAULT NULL,
  `poste_Employé` varchar(50) DEFAULT NULL,
  `salaire_Employé` decimal(10,2) DEFAULT NULL,
  `date_embauche_Employé` date DEFAULT NULL,
  PRIMARY KEY (`id_employe_Employé`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employé`
--

LOCK TABLES `Employé` WRITE;
/*!40000 ALTER TABLE `Employé` DISABLE KEYS */;
INSERT INTO `Employé` VALUES (1,'Issaka','Ahmat','66221122','123 rue de 40','serveur',60000.00,'2024-02-10'),(2,'Oumar','Mahamat','63221122','123 rue de 30','serveur',60000.00,'2024-02-10'),(3,'Zakaria','Idriss','63821122','23 rue de 30','serveur',60000.00,'2024-02-10'),(4,'Saad','Absakine','63921122','3 rue de 30','serveur',60000.00,'2024-02-10'),(5,'Mahadi','Fadoul','63821162','23 rue de 20','serveur',60000.00,'2024-02-10'),(6,'Atteib','Doungous','63921422','25 rue de 40','serveur',60000.00,'2024-02-10'),(7,'Saleh','Mahamat Adam','66132566','25 rue de Biltine','gerant',75000.00,'2023-02-10'),(8,'Saada','Oumar','63454569','3 rue de Taradona','cuisiniere',70000.00,'2024-03-10'),(9,'Nousseiba','Khalil','63588978','23 rue de 40','cuisiniere',70000.00,'2024-02-10'),(10,'Fatime','Ibrahim','66311415','rue de Goz beida','cuisiniere',70000.00,'2023-12-12'),(11,'Anouar','Ali','63454547','3 rue de Taradona','patissier',70000.00,'2024-03-10'),(12,'Fachir','Annour','63588578','13 rue de 40','patissier',70000.00,'2024-02-10'),(13,'Taha','Abdelmountalib','63454578','rue avenue Marechall','caissier',100000.00,'2024-06-10'),(14,'Adam','Yahkoub','68252536','13 rue de Adre','caissier',100000.00,'2022-02-04'),(15,'Abdoulaye','fayçal','66251666','rue avenue Marechall','responsable des achats',150000.00,'2022-06-12');
/*!40000 ALTER TABLE `Employé` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Facture`
--

DROP TABLE IF EXISTS `Facture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Facture` (
  `id_facture_Facture` int NOT NULL,
  `date_Facture` date DEFAULT NULL,
  `montant_HT_Facture` decimal(10,2) DEFAULT NULL,
  `taxes_Facture` decimal(10,2) DEFAULT NULL,
  `montant_TTC_Facture` decimal(10,2) DEFAULT NULL,
  `mode_paiement_Facture` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_facture_Facture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Facture`
--

LOCK TABLES `Facture` WRITE;
/*!40000 ALTER TABLE `Facture` DISABLE KEYS */;
INSERT INTO `Facture` VALUES (1,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Facture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fournisseur`
--

DROP TABLE IF EXISTS `Fournisseur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fournisseur` (
  `id_fournisseur_Fournisseur` int NOT NULL,
  `nom_Fournisseur` varchar(100) DEFAULT NULL,
  `contact_Fournisseur` varchar(100) DEFAULT NULL,
  `specialite_Fournisseur` varchar(100) DEFAULT NULL,
  `conditions_paiement_Fournisseur` text,
  PRIMARY KEY (`id_fournisseur_Fournisseur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fournisseur`
--

LOCK TABLES `Fournisseur` WRITE;
/*!40000 ALTER TABLE `Fournisseur` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fournisseur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Passer`
--

DROP TABLE IF EXISTS `Passer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Passer` (
  `id_ccommande_Commande` int NOT NULL,
  `id_client_Client` int NOT NULL,
  PRIMARY KEY (`id_ccommande_Commande`,`id_client_Client`),
  KEY `id_client_Client` (`id_client_Client`),
  CONSTRAINT `Passer_ibfk_1` FOREIGN KEY (`id_ccommande_Commande`) REFERENCES `Commande` (`id_ccommande_Commande`),
  CONSTRAINT `Passer_ibfk_2` FOREIGN KEY (`id_client_Client`) REFERENCES `Client` (`id_client_Client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Passer`
--

LOCK TABLES `Passer` WRITE;
/*!40000 ALTER TABLE `Passer` DISABLE KEYS */;
/*!40000 ALTER TABLE `Passer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plat`
--

DROP TABLE IF EXISTS `Plat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plat` (
  `code_plat_Plat` int NOT NULL,
  `nom_Plat` varchar(100) DEFAULT NULL,
  `description_Plat` text,
  `prix_Plat` decimal(10,2) DEFAULT NULL,
  `categorie_Plat` varchar(50) DEFAULT NULL,
  `temps_preparation_Plat` time DEFAULT NULL,
  `ingredients_Plat` text,
  PRIMARY KEY (`code_plat_Plat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plat`
--

LOCK TABLES `Plat` WRITE;
/*!40000 ALTER TABLE `Plat` DISABLE KEYS */;
INSERT INTO `Plat` VALUES (1,'Salade africaine','Salade fraîche avec avocat et mangue',4.50,'Entrées','00:10:00','avocat, mangue, salade, citron'),(2,'Beignets de banane','Beignets croustillants à base de banane plantain',3.00,'Entrées','00:08:00','banane plantain, farine, sucre'),(3,'Poulet Yassa','Poulet mariné au citron et aux oignons',8.50,'Plats principaux','00:25:00','poulet, citron, oignons, moutarde'),(4,'Thieboudienne','Riz au poisson typique du Sénégal',9.00,'Plats principaux','00:35:00','riz, poisson, légumes, tomate'),(5,'Brochettes d’agneau','Brochettes grillées servies avec alloco',10.00,'Plats principaux','00:20:00','agneau, épices, banane plantain'),(6,'Tiramisu tropical','Tiramisu revisité à la mangue et ananas',4.00,'Desserts','00:15:00','mascarpone, mangue, ananas, biscuit'),(7,'Crêpe coco','Crêpe sucrée au lait de coco et sucre roux',3.50,'Desserts','00:12:00','farine, œufs, lait de coco'),(8,'Jus de bissap','Boisson traditionnelle à base d’hibiscus',2.00,'Boissons','00:05:00','fleurs d’hibiscus, sucre, menthe'),(9,'Gingembre frais','Boisson piquante et sucrée au gingembre',2.00,'Boissons','00:05:00','gingembre, sucre, citron');
/*!40000 ALTER TABLE `Plat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Table_resto`
--

DROP TABLE IF EXISTS `Table_resto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Table_resto` (
  `numero_table_Table` int NOT NULL,
  `capacite_Table` int DEFAULT NULL,
  `zone_Table` varchar(20) DEFAULT NULL,
  `etat_Table` enum('libre','occupée','réservée') DEFAULT NULL,
  `commande_id_ccommande_commande` int DEFAULT NULL,
  PRIMARY KEY (`numero_table_Table`),
  KEY `commande_id_ccommande_commande` (`commande_id_ccommande_commande`),
  CONSTRAINT `Table_resto_ibfk_1` FOREIGN KEY (`commande_id_ccommande_commande`) REFERENCES `Commande` (`id_ccommande_Commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Table_resto`
--

LOCK TABLES `Table_resto` WRITE;
/*!40000 ALTER TABLE `Table_resto` DISABLE KEYS */;
INSERT INTO `Table_resto` VALUES (1,2,'zone A','libre',NULL),(2,4,'zone B','occupée',NULL),(3,6,'zone C','réservée',NULL),(4,8,'zone A','libre',NULL),(5,2,'zone B','libre',NULL),(6,4,'zone C','occupée',NULL),(7,6,'zone A','libre',NULL),(8,8,'zone B','réservée',NULL),(9,2,'zone C','occupée',NULL),(10,4,'zone A','libre',NULL),(11,6,'zone B','réservée',NULL),(12,8,'zone C','libre',NULL),(13,2,'zone A','libre',NULL),(14,4,'zone B','occupée',NULL),(15,6,'zone C','libre',NULL),(16,8,'zone A','réservée',NULL),(17,2,'zone B','libre',NULL),(18,4,'zone C','libre',NULL),(19,6,'zone A','occupée',NULL),(20,8,'zone B','libre',NULL);
/*!40000 ALTER TABLE `Table_resto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `id_ingredient_stock` int NOT NULL,
  `nom_stock` varchar(50) DEFAULT NULL,
  `quantite_stock` int DEFAULT NULL,
  `seuil_alerte_stock` int DEFAULT NULL,
  PRIMARY KEY (`id_ingredient_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-07 11:06:03
