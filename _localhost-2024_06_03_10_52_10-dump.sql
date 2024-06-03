-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `act_app_appdef`
--

DROP TABLE IF EXISTS `act_app_appdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_app_appdef` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `VERSION_` int NOT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_APP_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_APP_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_app_appdef`
--

LOCK TABLES `act_app_appdef` WRITE;
/*!40000 ALTER TABLE `act_app_appdef` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_app_appdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_app_databasechangelog`
--

DROP TABLE IF EXISTS `act_app_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_app_databasechangelog` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_app_databasechangelog`
--

LOCK TABLES `act_app_databasechangelog` WRITE;
/*!40000 ALTER TABLE `act_app_databasechangelog` DISABLE KEYS */;
INSERT INTO `act_app_databasechangelog` VALUES ('1','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2024-05-28 12:13:25',1,'EXECUTED','9:959783069c0c7ce80320a0617aa48969','createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...','',NULL,'4.9.1',NULL,NULL,'6869605462'),('2','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2024-05-28 12:13:26',2,'EXECUTED','9:c75407b1c0e16adf2a6db585c05a94c7','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT','',NULL,'4.9.1',NULL,NULL,'6869605462'),('3','flowable','org/flowable/app/db/liquibase/flowable-app-db-changelog.xml','2024-05-28 12:13:26',3,'EXECUTED','9:c05b79a3b00e95136533085718361208','createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF','',NULL,'4.9.1',NULL,NULL,'6869605462');
/*!40000 ALTER TABLE `act_app_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_app_databasechangeloglock`
--

DROP TABLE IF EXISTS `act_app_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_app_databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_app_databasechangeloglock`
--

LOCK TABLES `act_app_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `act_app_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `act_app_databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `act_app_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_app_deployment`
--

DROP TABLE IF EXISTS `act_app_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_app_deployment` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_app_deployment`
--

LOCK TABLES `act_app_deployment` WRITE;
/*!40000 ALTER TABLE `act_app_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_app_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_app_deployment_resource`
--

DROP TABLE IF EXISTS `act_app_deployment_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_app_deployment_resource` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_APP_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_APP_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_app_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_app_deployment_resource`
--

LOCK TABLES `act_app_deployment_resource` WRITE;
/*!40000 ALTER TABLE `act_app_deployment_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_app_deployment_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_casedef`
--

DROP TABLE IF EXISTS `act_cmmn_casedef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_casedef` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `VERSION_` int NOT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` bit(1) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `HAS_START_FORM_KEY_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CASE_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`),
  KEY `ACT_IDX_CASE_DEF_DPLY` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CASE_DEF_DPLY` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_casedef`
--

LOCK TABLES `act_cmmn_casedef` WRITE;
/*!40000 ALTER TABLE `act_cmmn_casedef` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_casedef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_databasechangelog`
--

DROP TABLE IF EXISTS `act_cmmn_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_databasechangelog` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_databasechangelog`
--

LOCK TABLES `act_cmmn_databasechangelog` WRITE;
/*!40000 ALTER TABLE `act_cmmn_databasechangelog` DISABLE KEYS */;
INSERT INTO `act_cmmn_databasechangelog` VALUES ('1','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:21',1,'EXECUTED','9:d0cc0aaadf0e4ef70c5b412cd05fadc4','createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...','',NULL,'4.9.1',NULL,NULL,'6869599438'),('2','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:21',2,'EXECUTED','9:8095a5a8a222a100c2d0310cacbda5e7','addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST','',NULL,'4.9.1',NULL,NULL,'6869599438'),('3','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:22',3,'EXECUTED','9:f031b4f0ae67bc5a640736b379049b12','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...','',NULL,'4.9.1',NULL,NULL,'6869599438'),('4','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:22',4,'EXECUTED','9:c484ecfb08719feccac2f80fc962dda9','createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST','',NULL,'4.9.1',NULL,NULL,'6869599438'),('5','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:24',5,'EXECUTED','9:e6a67f8f0d16cd72117900442acfe6e0','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...','',NULL,'4.9.1',NULL,NULL,'6869599438'),('6','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:24',6,'EXECUTED','9:7343ab247d959e5add9278b5386de833','createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF','',NULL,'4.9.1',NULL,NULL,'6869599438'),('7','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:24',7,'EXECUTED','9:d73200db684b6cdb748cc03570d5d2e9','renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...','',NULL,'4.9.1',NULL,NULL,'6869599438'),('8','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:24',8,'EXECUTED','9:eda5e43816221f2d8554bfcc90f1c37e','addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.9.1',NULL,NULL,'6869599438'),('9','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:24',9,'EXECUTED','9:c34685611779075a73caf8c380f078ea','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.9.1',NULL,NULL,'6869599438'),('10','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:24',10,'EXECUTED','9:368e9472ad2348206205170d6c52d58e','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...','',NULL,'4.9.1',NULL,NULL,'6869599438'),('11','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:24',11,'EXECUTED','9:e54b50ceb2bcd5355ae4dfb56d9ff3ad','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.9.1',NULL,NULL,'6869599438'),('12','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:25',12,'EXECUTED','9:f53f262768d04e74529f43fcd93429b0','addColumn tableName=ACT_CMMN_RU_CASE_INST','',NULL,'4.9.1',NULL,NULL,'6869599438'),('13','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:25',13,'EXECUTED','9:64e7eafbe97997094654e83caea99895','addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST','',NULL,'4.9.1',NULL,NULL,'6869599438'),('14','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:25',14,'EXECUTED','9:ab7d934abde497eac034701542e0a281','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.9.1',NULL,NULL,'6869599438'),('16','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:25',15,'EXECUTED','9:03928d422e510959770e7a9daa5a993f','addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.9.1',NULL,NULL,'6869599438'),('17','flowable','org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml','2024-05-28 12:13:25',16,'EXECUTED','9:f30304cf001d6eac78c793ea88cd5781','createIndex indexName=ACT_IDX_HI_CASE_INST_END, tableName=ACT_CMMN_HI_CASE_INST','',NULL,'4.9.1',NULL,NULL,'6869599438');
/*!40000 ALTER TABLE `act_cmmn_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_databasechangeloglock`
--

DROP TABLE IF EXISTS `act_cmmn_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_databasechangeloglock`
--

LOCK TABLES `act_cmmn_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `act_cmmn_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `act_cmmn_databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `act_cmmn_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_deployment`
--

DROP TABLE IF EXISTS `act_cmmn_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_deployment` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_deployment`
--

LOCK TABLES `act_cmmn_deployment` WRITE;
/*!40000 ALTER TABLE `act_cmmn_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_deployment_resource`
--

DROP TABLE IF EXISTS `act_cmmn_deployment_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_deployment_resource` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  `GENERATED_` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CMMN_RSRC_DPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_CMMN_RSRC_DPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_cmmn_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_deployment_resource`
--

LOCK TABLES `act_cmmn_deployment_resource` WRITE;
/*!40000 ALTER TABLE `act_cmmn_deployment_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_deployment_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_hi_case_inst`
--

DROP TABLE IF EXISTS `act_cmmn_hi_case_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_hi_case_inst` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_CASE_INST_END` (`END_TIME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_hi_case_inst`
--

LOCK TABLES `act_cmmn_hi_case_inst` WRITE;
/*!40000 ALTER TABLE `act_cmmn_hi_case_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_hi_case_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_hi_mil_inst`
--

DROP TABLE IF EXISTS `act_cmmn_hi_mil_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_hi_mil_inst` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_hi_mil_inst`
--

LOCK TABLES `act_cmmn_hi_mil_inst` WRITE;
/*!40000 ALTER TABLE `act_cmmn_hi_mil_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_hi_mil_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_hi_plan_item_inst`
--

DROP TABLE IF EXISTS `act_cmmn_hi_plan_item_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_hi_plan_item_inst` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ITEM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `ENTRY_CRITERION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SHOW_IN_OVERVIEW_` bit(1) DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_hi_plan_item_inst`
--

LOCK TABLES `act_cmmn_hi_plan_item_inst` WRITE;
/*!40000 ALTER TABLE `act_cmmn_hi_plan_item_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_hi_plan_item_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_ru_case_inst`
--

DROP TABLE IF EXISTS `act_cmmn_ru_case_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_ru_case_inst` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `LOCK_TIME_` datetime(3) DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_REACTIVATION_TIME_` datetime(3) DEFAULT NULL,
  `LAST_REACTIVATION_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_CASE_INST_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_CASE_INST_PARENT` (`PARENT_ID_`),
  KEY `ACT_IDX_CASE_INST_REF_ID_` (`REFERENCE_ID_`),
  CONSTRAINT `ACT_FK_CASE_INST_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_ru_case_inst`
--

LOCK TABLES `act_cmmn_ru_case_inst` WRITE;
/*!40000 ALTER TABLE `act_cmmn_ru_case_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_ru_case_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_ru_mil_inst`
--

DROP TABLE IF EXISTS `act_cmmn_ru_mil_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_ru_mil_inst` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_MIL_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_MIL_CASE_INST` (`CASE_INST_ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`),
  CONSTRAINT `ACT_FK_MIL_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_ru_mil_inst`
--

LOCK TABLES `act_cmmn_ru_mil_inst` WRITE;
/*!40000 ALTER TABLE `act_cmmn_ru_mil_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_ru_mil_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_ru_plan_item_inst`
--

DROP TABLE IF EXISTS `act_cmmn_ru_plan_item_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_ru_plan_item_inst` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STAGE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_STAGE_` bit(1) DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `STATE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `ITEM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ITEM_DEFINITION_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IS_COMPLETEABLE_` bit(1) DEFAULT NULL,
  `IS_COUNT_ENABLED_` bit(1) DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `SENTRY_PART_INST_COUNT_` int DEFAULT NULL,
  `LAST_AVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_ENABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_DISABLED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_STARTED_TIME_` datetime(3) DEFAULT NULL,
  `LAST_SUSPENDED_TIME_` datetime(3) DEFAULT NULL,
  `COMPLETED_TIME_` datetime(3) DEFAULT NULL,
  `OCCURRED_TIME_` datetime(3) DEFAULT NULL,
  `TERMINATED_TIME_` datetime(3) DEFAULT NULL,
  `EXIT_TIME_` datetime(3) DEFAULT NULL,
  `ENDED_TIME_` datetime(3) DEFAULT NULL,
  `ENTRY_CRITERION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXIT_CRITERION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXTRA_VALUE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DERIVED_CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_UNAVAILABLE_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_PLAN_ITEM_STAGE_INST` (`STAGE_INST_ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`),
  CONSTRAINT `ACT_FK_PLAN_ITEM_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_ru_plan_item_inst`
--

LOCK TABLES `act_cmmn_ru_plan_item_inst` WRITE;
/*!40000 ALTER TABLE `act_cmmn_ru_plan_item_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_ru_plan_item_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_cmmn_ru_sentry_part_inst`
--

DROP TABLE IF EXISTS `act_cmmn_ru_sentry_part_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_cmmn_ru_sentry_part_inst` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `REV_` int NOT NULL,
  `CASE_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CASE_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PLAN_ITEM_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ON_PART_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IF_PART_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TIME_STAMP_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SENTRY_CASE_DEF` (`CASE_DEF_ID_`),
  KEY `ACT_IDX_SENTRY_CASE_INST` (`CASE_INST_ID_`),
  KEY `ACT_IDX_SENTRY_PLAN_ITEM` (`PLAN_ITEM_INST_ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_DEF` FOREIGN KEY (`CASE_DEF_ID_`) REFERENCES `act_cmmn_casedef` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_CASE_INST` FOREIGN KEY (`CASE_INST_ID_`) REFERENCES `act_cmmn_ru_case_inst` (`ID_`),
  CONSTRAINT `ACT_FK_SENTRY_PLAN_ITEM` FOREIGN KEY (`PLAN_ITEM_INST_ID_`) REFERENCES `act_cmmn_ru_plan_item_inst` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_cmmn_ru_sentry_part_inst`
--

LOCK TABLES `act_cmmn_ru_sentry_part_inst` WRITE;
/*!40000 ALTER TABLE `act_cmmn_ru_sentry_part_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_cmmn_ru_sentry_part_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_co_content_item`
--

DROP TABLE IF EXISTS `act_co_content_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_co_content_item` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `MIME_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TASK_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTENT_STORE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTENT_STORE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FIELD_` varchar(400) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTENT_AVAILABLE_` bit(1) DEFAULT b'0',
  `CREATED_` timestamp(6) NULL DEFAULT NULL,
  `CREATED_BY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LAST_MODIFIED_` timestamp(6) NULL DEFAULT NULL,
  `LAST_MODIFIED_BY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTENT_SIZE_` bigint DEFAULT '0',
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `idx_contitem_taskid` (`TASK_ID_`),
  KEY `idx_contitem_procid` (`PROC_INST_ID_`),
  KEY `idx_contitem_scope` (`SCOPE_ID_`,`SCOPE_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_co_content_item`
--

LOCK TABLES `act_co_content_item` WRITE;
/*!40000 ALTER TABLE `act_co_content_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_co_content_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_co_databasechangelog`
--

DROP TABLE IF EXISTS `act_co_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_co_databasechangelog` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_co_databasechangelog`
--

LOCK TABLES `act_co_databasechangelog` WRITE;
/*!40000 ALTER TABLE `act_co_databasechangelog` DISABLE KEYS */;
INSERT INTO `act_co_databasechangelog` VALUES ('1','activiti','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2024-05-28 12:13:19',1,'EXECUTED','8:7644d7165cfe799200a2abdd3419e8b6','createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM','',NULL,'4.9.1',NULL,NULL,'6869599006'),('2','flowable','org/flowable/content/db/liquibase/flowable-content-db-changelog.xml','2024-05-28 12:13:19',2,'EXECUTED','8:fe7b11ac7dbbf9c43006b23bbab60bab','addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM','',NULL,'4.9.1',NULL,NULL,'6869599006');
/*!40000 ALTER TABLE `act_co_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_co_databasechangeloglock`
--

DROP TABLE IF EXISTS `act_co_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_co_databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_co_databasechangeloglock`
--

LOCK TABLES `act_co_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `act_co_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `act_co_databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `act_co_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_dmn_databasechangelog`
--

DROP TABLE IF EXISTS `act_dmn_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_dmn_databasechangelog` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_dmn_databasechangelog`
--

LOCK TABLES `act_dmn_databasechangelog` WRITE;
/*!40000 ALTER TABLE `act_dmn_databasechangelog` DISABLE KEYS */;
INSERT INTO `act_dmn_databasechangelog` VALUES ('1','activiti','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2024-05-28 12:13:17',1,'EXECUTED','9:5b36e70aee5a2e42f6e7a62ea5fa681b','createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.9.1',NULL,NULL,'6869597304'),('2','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2024-05-28 12:13:17',2,'EXECUTED','9:fd13fa3f7af55d2b72f763fc261da30d','createTable tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.9.1',NULL,NULL,'6869597304'),('3','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2024-05-28 12:13:17',3,'EXECUTED','9:9f30e6a3557d4b4c713dbb2dcc141782','addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.9.1',NULL,NULL,'6869597304'),('4','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2024-05-28 12:13:17',4,'EXECUTED','9:41085fbde807dba96104ee75a2fcc4cc','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.9.1',NULL,NULL,'6869597304'),('5','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2024-05-28 12:13:17',5,'EXECUTED','9:169d906b6503ad6907b7e5cd0d70d004','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.9.1',NULL,NULL,'6869597304'),('6','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2024-05-28 12:13:17',6,'EXECUTED','9:f00f92f3ef1af3fc1604f0323630f9b1','createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE','',NULL,'4.9.1',NULL,NULL,'6869597304'),('7','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2024-05-28 12:13:17',7,'EXECUTED','9:d24d4c5f44083b4edf1231a7a682a2cd','dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION','',NULL,'4.9.1',NULL,NULL,'6869597304'),('8','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2024-05-28 12:13:18',8,'EXECUTED','9:3998ef0958b46fe9c19458183952d2a0','addColumn tableName=ACT_DMN_DECISION','',NULL,'4.9.1',NULL,NULL,'6869597304'),('9','flowable','org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml','2024-05-28 12:13:18',9,'EXECUTED','9:5c9dc65601456faa1aa12f8d3afe0e9e','createIndex indexName=ACT_IDX_DMN_INSTANCE_ID, tableName=ACT_DMN_HI_DECISION_EXECUTION','',NULL,'4.9.1',NULL,NULL,'6869597304');
/*!40000 ALTER TABLE `act_dmn_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_dmn_databasechangeloglock`
--

DROP TABLE IF EXISTS `act_dmn_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_dmn_databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_dmn_databasechangeloglock`
--

LOCK TABLES `act_dmn_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `act_dmn_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `act_dmn_databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `act_dmn_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_dmn_decision`
--

DROP TABLE IF EXISTS `act_dmn_decision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_dmn_decision` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DECISION_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_DMN_DEC_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_dmn_decision`
--

LOCK TABLES `act_dmn_decision` WRITE;
/*!40000 ALTER TABLE `act_dmn_decision` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_dmn_decision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_dmn_deployment`
--

DROP TABLE IF EXISTS `act_dmn_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_dmn_deployment` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_dmn_deployment`
--

LOCK TABLES `act_dmn_deployment` WRITE;
/*!40000 ALTER TABLE `act_dmn_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_dmn_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_dmn_deployment_resource`
--

DROP TABLE IF EXISTS `act_dmn_deployment_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_dmn_deployment_resource` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_dmn_deployment_resource`
--

LOCK TABLES `act_dmn_deployment_resource` WRITE;
/*!40000 ALTER TABLE `act_dmn_deployment_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_dmn_deployment_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_dmn_hi_decision_execution`
--

DROP TABLE IF EXISTS `act_dmn_hi_decision_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_dmn_hi_decision_execution` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DECISION_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `INSTANCE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ACTIVITY_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FAILED_` bit(1) DEFAULT b'0',
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `EXECUTION_JSON_` longtext COLLATE utf8mb4_general_ci,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DMN_INSTANCE_ID` (`INSTANCE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_dmn_hi_decision_execution`
--

LOCK TABLES `act_dmn_hi_decision_execution` WRITE;
/*!40000 ALTER TABLE `act_dmn_hi_decision_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_dmn_hi_decision_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_fo_databasechangelog`
--

DROP TABLE IF EXISTS `act_fo_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_fo_databasechangelog` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_fo_databasechangelog`
--

LOCK TABLES `act_fo_databasechangelog` WRITE;
/*!40000 ALTER TABLE `act_fo_databasechangelog` DISABLE KEYS */;
INSERT INTO `act_fo_databasechangelog` VALUES ('1','activiti','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2024-05-28 12:13:18',1,'EXECUTED','8:033ebf9380889aed7c453927ecc3250d','createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.9.1',NULL,NULL,'6869598215'),('2','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2024-05-28 12:13:18',2,'EXECUTED','8:986365ceb40445ce3b27a8e6b40f159b','addColumn tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.9.1',NULL,NULL,'6869598215'),('3','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2024-05-28 12:13:18',3,'EXECUTED','8:abf482518ceb09830ef674e52c06bf15','dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION','',NULL,'4.9.1',NULL,NULL,'6869598215'),('4','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2024-05-28 12:13:18',4,'EXECUTED','8:2087829f22a4b2298dbf530681c74854','modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.9.1',NULL,NULL,'6869598215'),('5','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2024-05-28 12:13:18',5,'EXECUTED','8:b4be732b89e5ca028bdd520c6ad4d446','createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION','',NULL,'4.9.1',NULL,NULL,'6869598215'),('6','flowable','org/flowable/form/db/liquibase/flowable-form-db-changelog.xml','2024-05-28 12:13:18',6,'EXECUTED','8:384bbd364a649b67c3ca1bcb72fe537f','createIndex indexName=ACT_IDX_FORM_TASK, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_PROC, tableName=ACT_FO_FORM_INSTANCE; createIndex indexName=ACT_IDX_FORM_SCOPE, tableName=ACT_FO_FORM_INSTANCE','',NULL,'4.9.1',NULL,NULL,'6869598215');
/*!40000 ALTER TABLE `act_fo_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_fo_databasechangeloglock`
--

DROP TABLE IF EXISTS `act_fo_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_fo_databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_fo_databasechangeloglock`
--

LOCK TABLES `act_fo_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `act_fo_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `act_fo_databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `act_fo_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_fo_form_definition`
--

DROP TABLE IF EXISTS `act_fo_form_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_fo_form_definition` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_FORM_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_fo_form_definition`
--

LOCK TABLES `act_fo_form_definition` WRITE;
/*!40000 ALTER TABLE `act_fo_form_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_fo_form_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_fo_form_deployment`
--

DROP TABLE IF EXISTS `act_fo_form_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_fo_form_deployment` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_fo_form_deployment`
--

LOCK TABLES `act_fo_form_deployment` WRITE;
/*!40000 ALTER TABLE `act_fo_form_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_fo_form_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_fo_form_instance`
--

DROP TABLE IF EXISTS `act_fo_form_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_fo_form_instance` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FORM_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `TASK_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PROC_INST_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PROC_DEF_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SUBMITTED_DATE_` datetime(3) DEFAULT NULL,
  `SUBMITTED_BY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `FORM_VALUES_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_FORM_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_FORM_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_FORM_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_fo_form_instance`
--

LOCK TABLES `act_fo_form_instance` WRITE;
/*!40000 ALTER TABLE `act_fo_form_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_fo_form_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_fo_form_resource`
--

DROP TABLE IF EXISTS `act_fo_form_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_fo_form_resource` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_fo_form_resource`
--

LOCK TABLES `act_fo_form_resource` WRITE;
/*!40000 ALTER TABLE `act_fo_form_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_fo_form_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('1d0dfda0-1ce1-11ef-bf3b-00ff29e62bab',1,'process/performance.bpmn20.xml','1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('1d26b5c1-1ce1-11ef-bf3b-00ff29e62bab',1,'process/performance.performance-001.png','1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('21f94ff0-1d79-11ef-965a-00ff29e62bab',1,'process/performance.bpmn20.xml','21f94fef-1d79-11ef-965a-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"/>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"/>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"aaaaaa\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"/>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"qqqqqq\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"/>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"/>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"/>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"/>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"/>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"/>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2219f751-1d79-11ef-965a-00ff29e62bab',1,'process/performance.performance-001.png','21f94fef-1d79-11ef-965a-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('276aafe1-1ce0-11ef-90dc-00ff29e62bab',1,'process/performance.bpmn20.xml','276aafe0-1ce0-11ef-90dc-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('27862722-1ce0-11ef-90dc-00ff29e62bab',1,'process/performance.performance-001.png','276aafe0-1ce0-11ef-90dc-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('28499e35-1ce0-11ef-90dc-00ff29e62bab',1,'process/performance.bpmn20.xml','28499e34-1ce0-11ef-90dc-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('285202a6-1ce0-11ef-90dc-00ff29e62bab',1,'process/performance.performance-001.png','28499e34-1ce0-11ef-90dc-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('3250903b-1cdf-11ef-a741-00ff29e62bab',1,'process/performance.bpmn20.xml','3250903a-1cdf-11ef-a741-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('326d670c-1cdf-11ef-a741-00ff29e62bab',1,'process/performance.performance-001.png','3250903a-1cdf-11ef-a741-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('3b19cb34-1ce1-11ef-bf3b-00ff29e62bab',1,'process/performance.bpmn20.xml','3b19cb33-1ce1-11ef-bf3b-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('3b222fa5-1ce1-11ef-bf3b-00ff29e62bab',1,'process/performance.performance-001.png','3b19cb33-1ce1-11ef-bf3b-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('43be2117-1cfa-11ef-aff9-00ff29e62bab',1,'process/performance.bpmn20.xml','43be2116-1cfa-11ef-aff9-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('44062698-1cfa-11ef-aff9-00ff29e62bab',1,'process/performance.performance-001.png','43be2116-1cfa-11ef-aff9-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('64ac108e-1cde-11ef-95cf-00ff29e62bab',1,'process/performance.bpmn20.xml','64ac108d-1cde-11ef-95cf-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('64b38a9f-1cde-11ef-95cf-00ff29e62bab',1,'process/performance.performance-001.png','64ac108d-1cde-11ef-95cf-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('6eb94462-1d71-11ef-8ae9-00ff29e62bab',1,'process/performance.bpmn20.xml','6eb91d51-1d71-11ef-8ae9-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('6ee0a283-1d71-11ef-8ae9-00ff29e62bab',1,'process/performance.performance-001.png','6eb91d51-1d71-11ef-8ae9-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('7708d0c1-1d9a-11ef-b8cc-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\qj\\target\\classes\\processes\\公司员工调休流程.bpmn20.xml','7708d0c0-1d9a-11ef-b8cc-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.1\">\r\n    <process id=\"leave\" name=\"公司员工请假流程\" isExecutable=\"true\">\r\n        <documentation>公司员工请假流程</documentation>\r\n        <startEvent id=\"startEvent1\" name=\"开始 \" flowable:formFieldValidation=\"true\"></startEvent>\r\n        <userTask id=\"apply\" name=\"请假申请 \" flowable:assignee=\"${studentUser}\" flowable:formFieldValidation=\"true\">\r\n            <extensionElements>\r\n                <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\r\n            </extensionElements>\r\n        </userTask>\r\n        <userTask id=\"teacherPass\" name=\"领导审批 \" flowable:candidateGroups=\"a\" flowable:formFieldValidation=\"true\"></userTask>\r\n        <exclusiveGateway id=\"judgeTask\" name=\"判断是否大于2天\"></exclusiveGateway>\r\n        <sequenceFlow id=\"applyFlow\" name=\"申请流程 \" sourceRef=\"apply\" targetRef=\"teacherPass\"></sequenceFlow>\r\n        <userTask id=\"principalPass\" name=\"老板审批\" flowable:candidateGroups=\"b\" flowable:formFieldValidation=\"true\"></userTask>\r\n        <endEvent id=\"sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\" name=\"结束\"></endEvent>\r\n        <sequenceFlow id=\"principalCheck\" name=\"通过\" sourceRef=\"principalPass\" targetRef=\"sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05\" name=\"流程开始 \" sourceRef=\"startEvent1\" targetRef=\"apply\"></sequenceFlow>\r\n        <sequenceFlow id=\"teacherPassFlow\" name=\"通过 \" sourceRef=\"teacherPass\" targetRef=\"judgeTask\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"teacherNotPassFlow\" name=\"驳回\" sourceRef=\"teacherPass\" targetRef=\"apply\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"judgeLess\" name=\"小于2天\" sourceRef=\"judgeTask\" targetRef=\"sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${day<=2}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"judgeMore\" name=\"大于2天 \" sourceRef=\"judgeTask\" targetRef=\"principalPass\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${day>2}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"principalNotPassFlow\" name=\"驳回 \" sourceRef=\"principalPass\" targetRef=\"apply\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n    </process>\r\n    <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\r\n        <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\r\n            <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\r\n                <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"74.99999776482586\" y=\"159.99999329447763\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"apply\" id=\"BPMNShape_apply\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"254.99999620020395\" y=\"134.99999798834327\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"teacherPass\" id=\"BPMNShape_teacherPass\">\r\n                <omgdc:Bounds height=\"79.99999999999994\" width=\"100.0\" x=\"494.9999926239253\" y=\"134.99999798834327\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"judgeTask\" id=\"BPMNShape_judgeTask\">\r\n                <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"734.9999780952935\" y=\"154.99999567866334\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"principalPass\" id=\"BPMNShape_principalPass\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"704.9999785423283\" y=\"434.999993517995\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\" id=\"BPMNShape_sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\">\r\n                <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"914.9999863654377\" y=\"160.99999089539082\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNEdge bpmnElement=\"judgeLess\" id=\"BPMNEdge_judgeLess\" flowable:sourceDockerX=\"20.0\" flowable:sourceDockerY=\"20.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\r\n                <omgdi:waypoint x=\"774.9442491776681\" y=\"174.9999951288619\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"914.9999863654377\" y=\"174.9999912788773\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"judgeMore\" id=\"BPMNEdge_judgeMore\" flowable:sourceDockerX=\"20.0\" flowable:sourceDockerY=\"20.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\r\n                <omgdi:waypoint x=\"754.9999781250214\" y=\"194.94667175689042\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"754.9999784827237\" y=\"434.999993517995\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"principalNotPassFlow\" id=\"BPMNEdge_principalNotPassFlow\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\r\n                <omgdi:waypoint x=\"704.9999785423213\" y=\"474.88912948633504\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"304.0\" y=\"474.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"304.86621744522387\" y=\"214.94999798834328\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"teacherNotPassFlow\" id=\"BPMNEdge_teacherNotPassFlow\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"39.99999999999997\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\r\n                <omgdi:waypoint x=\"544.9999926239253\" y=\"134.99999798834327\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"544.9999926239253\" y=\"75.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"306.0\" y=\"75.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"305.3994977262591\" y=\"134.99999798834327\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"applyFlow\" id=\"BPMNEdge_applyFlow\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"39.99999999999997\">\r\n                <omgdi:waypoint x=\"354.94999620020394\" y=\"174.99999798834324\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"494.9999926238438\" y=\"174.99999798834324\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"principalCheck\" id=\"BPMNEdge_principalCheck\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\r\n                <omgdi:waypoint x=\"804.9499785423245\" y=\"474.71097808621374\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"928.0\" y=\"474.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"928.953164519099\" y=\"188.9499145334794\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05\" id=\"BPMNEdge_sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\r\n                <omgdi:waypoint x=\"104.94999736929918\" y=\"174.99999362086504\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"254.99999620020395\" y=\"174.9999968967466\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"teacherPassFlow\" id=\"BPMNEdge_teacherPassFlow\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"39.99999999999997\" flowable:targetDockerX=\"20.0\" flowable:targetDockerY=\"20.0\">\r\n                <omgdi:waypoint x=\"594.949992623855\" y=\"174.9999974384194\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"734.9999775100968\" y=\"174.99999589808294\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n        </bpmndi:BPMNPlane>\r\n    </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('773efbf2-1d9a-11ef-b8cc-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\qj\\target\\classes\\processes\\公司员工调休流程.leave.png','7708d0c0-1d9a-11ef-b8cc-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0\�\0�\0\0A1IDATx^\�\�	�]ey?pj�o�\�\�\�j���Zmm�Uk�.%[\�9w��`@@D�� VqWw@)n,��\n���M�%��I2�\�M\�\�\�f&��Y朼\�\�\�\�9\�]f�{\�s�߽3w�\�\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`����R\�|-\0@ѦM�\�{1(ߟ\��f�u�\"�߼\0\0Ś5k\�CcP�7\�͖\�mZ�y\0\0��\�v\�=��\�;\�>\�lp�u:��\�}\0\0(V�\��\��o\��@�UU�d֬Y�\�\0�X�N\�Qp�\��fK\�6�߼\0\0Ś>}�_Š|S\��-�۴~\�>\0\0�\�\��M\�\�\�}�\�b\�^\���\0\0\�\�v�C\�\�yh�X�;�\�\�>\0\0���\'Ǡ|y\��-�۴~\�>\0\0�\�\�<��\�K\�>\�liݦ\��\�\0�XUU=}pp\�yh�X�?�����\0\0\�\�v�ϊA���4[�\�UU\�̼\0\0Ŋ!�9Q\�\�}�\�ҺM\�7\�\0@�\�~A\�\�\��@��u;00\���\0\0Ŋ!yZ\�Yyh�X�g\�u�u\�\0�b\r�4�\�3\�>\�lp\�L\�7\�\0@�\"ܾ2\�yh��n\��\��\0\0P�����\�[yh���\�\�}M\�\0�bŐ���\�>\�lnO�\��uy\0\0�Cr\'�\�\�}�\�ҺM\�7\�\0@�bH��\��@��u�\�o\�\0�bUU53f\�\�>\�lp����\�\0�X1 \�\���4[]\�_��jv\�\0�bE�\�)꨼4[Z�i�\�}\0\0(V]׻VU\�\�4[Z�i�\�}\0\0(V\�{Ɛ���4\�\�\�\�ǣ\�\��\0\0P��{G\�=,\�\�k\�ñvߖ\�\0�X���\�:$\�͖\�mZ�y\0\0�\�~u]�?\�͖\�mUU\�\��\0\0P��D�7\�\�f\�\0@ƫ@\�N~�\0\02~�\�\�\�\�\0@\�;�B;yt\0\0\��[�\�N��5\0\0dbH�tɻ\�}�\�ҺM\�7\�\0@���\�)\�͖\�mZ�y\0\0�U\�\�����\��f�p�C\�\�\�>\0\0+\�c�f\�}�٪��Y\�\�\�y\0\0�\�\���\�4[Z�i�\�}\0\0(V\�\�_����\��fK\�6�߼\0\0Ŋ!�\��_�\��f|}\�	y\0\0�\�)r_�\��f�\�z\�X�\�\��\0\0P��scP~e\��-\�\�PZ�y\0\0�\�/\��@su:�\'�t\�I\�\�\�s\�\�\�\0\0�XpϮ\�z\�4\�{\��\�sV�\\�\�\'?�\��v?�\0\0�\��\�\��@3\r\r\rU.�k�\�\��\�)�u\0\0�HpϏzN\���\�\�<\�3��\�\�#\�6Y�l\�ʃ:\�\r�u\0�8nTU\�3\�>\�<�\�\�\�\�	�n\�\��\�\�3g�y~}\0\0\�bE�}\�\�n���\�����6�4OUU\�=\�\�3��ɹ#�8\��6\0\0�Ŋ �\��\�\���\�\�i���_~[`\�L�6\�\�\�\��+V�Z�2�#\�\�\�\��\�{\�\0�-Rz7j��\��!x\��v�\�\�v�\���\�\���c9묳\�\�o\0\0[����\�C\�֟�\�1c\�u\�\�s\�uy�\�-X�\�\��m\0`�\�	d\�#ܦ\�!�>0\�\�\����Zv\�Q�\�\�[W�\�\�|F~[\0\0آE�=f�p{y�=���@3\�\Z�\��\�K\�`;\�\�#��Q~\0\0\�\�u:��ư�rt���j0�\�\�\�gϞ}\�=\�\�\�\�<\�^r\�%w�4�\r\0\0!\�7F\�_D\�w\�\�\0͒��:\�C\�L�j$ܮZ�꾽\�\�����\0\0P�n�����R���;�\�@3�\�\�=\�\�s��\�\�O?�ʪ�f\�\�\0��D��\�\�\�Y�f=4�h�]v\�\�+w\�}\�=�/^5s\�\�E\�l�\�\�\�\0�	���~\�\�\��ͼy\�\�8\�Vֱ\���\�mzh�˚^\�}_�`���\�ϟ�\��\�u\�\�\�ܹs��:\�\�C=tu\�7��_\0��\��\�1�\r/^�x�\�{\��\��Z[)\�\�6T���\��\�g��4\�W\��gKY�\����w\�o�喵.kzY�\0\0\r�^�I\�Y>��\�_�-�5\�\�\�Ƴ%�\�n�a�^�\��\0h�\�c�m~\�gK�\�8Ā�<�`<\�os\��\0h�\�;d�����\�\�?F0\�Ye�\0L��\�wݱhx\�_�\�\�\���\�q\�\�\�SVd&\��mVY�\0\0Sl\"\�%7_|��\�?�\�\�T��.˯��/2�a�6��_\0�)6���K��\�p<R��䔵���/2�a�6��_\0�)6���g}p��x�\�e�\�U�e@f2�\�f�\�\00\�&2 _|\�k\r\�#�.˯��/2�a�6��_\0�)f@nV��\�Ye�\0L��\�\�]W\��x�\�e�\�U�e@f2�\�f�\�\00\�&2 _��O�5�T�,��\�\�L�\�۬�~\0�\�D\�\�n��\�\�\�}\�Z\�q\�\�\�\��ˀ\�dX�\�*\�\0`�Md@Nu\�EǬ5 �^~=�ae@f2�\�f�\�\00\�&4 /_>|\�G�5 �^�l�뫾ˀ\�dX�\�*\�\0`��o@^�\�\�\�+~\�ɵ�\�J��\�\�S���ɰ~�U\�/\0�w@^�|xѕ\�qڻ\�\Z�\�J\�I\�\�jІ��ɰ~�U\�/\0�k@^߫>\�W�6�\�L�\�۬�~\0�\�X\�D^\��\�m\��S/2�a�6��_�\�\�\�\0g�9z\'[������ɰ~�U\�/Sh\�Ž�\\c\r\�j\�ʀ\�dX�\�*\�)2n\�\��+\�P.r�ʀ\�dX�\�*\�)��r�o@Y\�\�*2�a�6��_6�\�\�\�x}\0\�\���Ud&\��mVY�lF\��\�`\�:�\�\�w��\�[\�\�Q7D\r\����\�\�9]/�-l.\�f��ɰ~�U\�/�\�D\�\�D���l\�b/�gAԭ�\��ܓN:\�\�K.�\�_��\�����\�z\�w]~�\�\�ϛ7\�\�8\�CCCK\�\�\�\�\���M̀ܬ2 3\�o�\��e3�lh�\�\�a���R��h\�FMPU\�\���u\�\�\����+W.���\�\�\����;\�̙sK�\�==\�O~߰���Ud&\��mVY�lb��\�~odT6\�\�\�dj�l4E^\Z�͇z\�W�XqCb\'\"n7|\�\�\'/�1cƒt�\�M��ܬ2 3\�o�\��e\�А����I\�e�\�G�\�\�ӧ�:�\���\�͛7|\�\�W\�v\�m�3P�7m�~�<�Pro��6���\�u\�\��\����\�ڗ\�.�lx\�\�\�wv�\�7\�66r�ʀ\�dX�\�*\�Mdc�Ӎu?�N�lt�H@�L�곟�\�\�%K\�\�3�t�t����\�!7\�\��\�b\�=;qӵ\�^{J�\�l�ŋ\�\�\�\�u���s\�\�d@nV��\�Ye��	l\�P��\����~n\�򖷬�\�k\�3!\�v�\�ۃB�Wr7�N�\��F/\�X�\�\�z�\�.K�\'�ܰ���Ud&\��mVY�ldy���\�{�NF~��~a�\�e�\�F\�\�\��UK�.\�#Τ�ۿ�\�\�ro��6����~\�6�\��\�cc9\�\�SW\�\�n?\�?7l,\�f��ɰ~�U\�/QBS8�|T\�\�ҿ\r�\�\�.�\�`)�~\�vC\�\�t?\�+��柛��\�v\�W\���R�\�xj�=\��\�w|E�5�\�`@nV��\�Ye����>\�+�i�\Z���\�\�\�v�f��|�\�}\�e�\��\�m�?�<�t�\'ן\�\�{\�\�\��\����)�w\�yû\��5�\�\0��Ye@f2�\�f�\�\�F0^\�+��+\�u�\�\����\��`RR6\Z	�\�\r�6�t��^\�=\'�\Z\�\0�N\�q\�M�e\�ʕ7\�\��M!��\�9s欜={\�\�\�6��Ye@f2�\�f�\�\�Z_\�+��rǺ\�X\�v\��>/�S/�J�3�)���[\�d��\�\'�V�ϛ-\����]v\�m�S\�o��t�\�x\���\�_�K,����\��\�\�\�*2#�\�\�պ\�\�\�7\���믿�\��\��w�\�=\����i\�~/�[���\�\�DC\�X\�ut\�\�\�u�\���h}�s\�F#��r\�!y�٨\���|�\�y\�>\�7\�O<\�[�7|SJ?���w�\��k�u9\0�\��d@nV�k@�,\�o�j�\��\�߽\�+>�|�\�#\�\��\��_�\�Wo�={\�\�\�\�e�\��e�\�r���2F\"\�v\�d�\n���9z\'�\\\�\�3\��`6�t����\�>\�7\�\�K/�\����)-\\�px\�\��3�Z`]F\0\�=0��Uc\rȔ\��m_\�\�\��k�\�z\�\�ſ\�\�\�#��\�\�\�|\���z�\�y\�\�\�\�~Y�=��ʱB\�\�\�\�d\�\�~��`\�۟\�\�G.K�eSJ\�?\�\�pԗɆ�o捷\�r\�U�7|S��\�ۇ\��\�7ߟ-�.c�\�:0��U��L�\�X�\�o\�kd�\�i�W]u\�w\�{h�Ϫ�[�\�^{m���Vcݮ�~�\�\�09V\�ݐp;bC�.�0c\�\�ڟ�n\�̲)��\��o̿V�\�\�\�\�\����7|S�Ϸ���\�\�e�Q^g��U.#\�X�yY�\r�\�x\\q\�;-]�\�\��<�>K�,�͑G��N�\�|_�}\�X��7�\�\�,��\�\�v�ҏ%\�ܦ\�\�\�\�\�J!\�a��\'\�\�\�z\�\�\�)�lJ\��G}\�\��\�J�\�y\�m�ݶ,��oJ\�ي�w\�y\���)�1ˀܬJ�G�)5^5m�n�\��H�ks]>\�u\�\'v\�a÷\�zk~\Z_�t�t\��1V[n��\�/~\�C�\�᭷\�Ϻ^�\�ݕ\'*}=�_�Ϳf�\�W^�m��f^x�\�_�\�7�\�\�\��\�\��\�\�tF\�Y�\r�ǭ\�>I?h�\���\�.�\�2b�uۊ\���ަ�|�+=\�\�9s\�|w�����Z�j�?�<<�bѢE\�\�\���\�\�T�\�n\�X�k�ߞ��\�\�ǁ\�\n��+���\�~��`c\�\�ڟ�n�\�7\�3\�<\���)�wQ>蠃nɿX�\�D��c@�7U%\�2\��]���˧�F�ߺ�\�\��\�\�z���+W�$�\�T<��J\��-\�7�\�;\�\�[M.T�n\�\�܎\�.ʓ	���:(\��\�\�A\�\�~\�o.x\��\�\�\�M)�ܣ�>���k�u\�@4�y\�\�T��\�\�w\�\��.�\�\�\�ozw䡡�#�;\�;V�XqϨ\���]tї\�_\�c{�wQ\�\�Ld�f�\�jb\�r�p;bǺ|\"!w����o\�wp�\0q\"z\\��\�Ȼ#n\�\�\�\�\�\�{\�\�\�\�e�\�h\�{SU��L��ߵ{\�|�k�\�C\�s\�\�s\�K\�ͷ\�~�9o{\�\�\�\�c��\�ϯ˖a\"\�w[o�\�9Vx\�ݒǺ޺B\��>/�[\����Q\\����қ\�.Y�$�3E�\�t����*}\��ka\�7\��\���w\�\��M!�x\�~�\�\���pC\�\�b@�7U5ހc�~\�\�MU�k�N�6\�\�\�\�7\�+ӿi;�l5~\�+��nG�u��B\�x�&%e�^\��\�g?�Ǚ�\"\�\�\�\�H�/�\Z\�@/�3g\�-+V�ȿ\�U����\��\�s\�\�=*�\Z`c0 �ݛ�Z׀9\�w\�\�T�\�\�F�\�Vk�\�\�V\�\�ZW�1Vȝ9\�\�>\�%e��\�9444|\�5\�\�f���K\�;\�9\�\�˿6�n�{\�\�\'��i^�\�9\�\�S�\���\����\�\��\�\�\�`@�7Ue@f2��~Ǫ\�u�T�\�\�F�\�V��\�\�D\�\�\�n�\�?l����\�\�v\�mx\�ҥy�\�K��t�^�=5�\�l$�N\�I3g\�\\r\�e��\���!\�7�\�\�\���o\�?7l,\�_>\�e@f2��~K/뗍l\�\��\�؉�\��\�\����\"e����\�w��\�r\�\�\���\�g�\�]�>O��و^:{\�\�e�/\��\r�\�/�\�\�O?�+�焍ɀܬ2 3\�o�\��e\�\�atc\�<H\�FD\��Jn�?��n7��ۺ�W��\�?\'�@�\�}Ӝ9s\�I��n\�~v\�e�\�N8ᇱ9\�g\�`R\�\�*2�a�6��_6��J7\���:E\�at\�M�;�\� j�ﮜ���?�wnS�M\��.6����l֬Yw�ߙ\�\���\�\�\�\�\��\�7�~\�vX�e30 7�\�L�\�۬�~ل64�n\�\�aRz�\�\�>PS�?\�s\��ϛ7o�ꫯ�\�\�Vg�\�o\�N�t��?4n\�\�\�\���ꉻ\�\�\�\�c��ӟ\��\�\�\�M\�K\�O\�|\�A\�{��\���[6r�ʀ\�dX�\�*\�M�ߐ\�\�\�`��lu\�\�\�G\�M\��\�7�َ;\���\�w\�}\�\�\����~�p\�1��H�t��9s�\�\��ߜv\�i�\�n\�lf\�f��ɰ~�U\�/��d\�\�d�]\�O-#����S@\r4{\�\�\�t\�A��\�\�j�}\��s\�w^��\�\�˪\�\�{\��\�z\�1\�|\��\�\�{Cۇ䷇\���ܬ2 3\�o�\��e3�hh�\�\�`�\�t:��,�sUUߊ/��aT���\�\�9]/�-����Ud&\��mVY�lF\��\�\Z��\�鹿�\��f@nV��\�Ye����b\�\�C�D�}\�Wp_�_\�r�ʀ\�dX�\�*\�)��\�|\Z+B\�9#7\�\��\�\0}1 7�\�L�\�۬�~�\"#�v�޿\�-���\�\�WoG\�y�\�\0&̀ܬ2 3\�o�\��e\ny\�V�0��1\�\��\�\0&̀ܬ2 3\�o�\��e�=,���	M\�\�v_1F�]]UU=7�>����Ud&\��mVY�L5�6��\��<؎���\�&ŀܬ2 3\�o�\��e�	�4]UUیjT\�n\�?\�\�L��Ye@f2�\�f�\�\�Tpi�\�G�\�1\�\��\�\0&̀ܬ2 3\�o�\��e�	��M�\��\�\�o\�\��\0}3 7�\�L�\�۬�~�j.m�\�ۦ7G�;\�\�̀ܬ2 3\�o�\��e�	��͌3�(\�ۻ\�>@\�\�\�*2�a�6��_���K\���Fg@nV��\�Ye�2\�\\ڦ\�\�<<\�\�ey�o\�f��ɰ~�U\�/SM��m�\�n�G\�u}g\�\��Ye@f2�\�f�\�\�Tpi����?��vi\�\��Ye@f2�\�f�\�\�Tpi�N�\�\�\�o\�\��\0}3 7�\�L�\�۬�~�j.m3k֬?��jI\�\��Ye@f2�\�f�\�\�Tpi�n����\�ޞ\��f@nV��\�Ye�2\�\\ڦ\�\��Y췷\�}����Ud&c޼y�\�\�޵\�#��+��b�.\�#؜\\\�f\�̙�\�y�o\�\��\�Z�`�M�/^k_R����\�\�c�^�?F�9	��M]\��\�-y�o\�\��ɚ?�k\�>�쥋-�\�USS\�}_t\�\�k\���W\�lN.m#\��y\�ˀ̆H�Lzb$\�\�#\�j�W���￵˔pi�N�\�\�o�\�6H\Z\�z�yjʀ�pi�3f�e췋\�>@\�\�\�8͉��9\�6u]?:\�ۛ\�>@\�\�\0�=\'v\0J\�<H\�t:�\�\�~�(\�-�/I\'\�Tt_�_\0%pi�\�ӧ�U\�7\�}��Ł\�Q\���r\0(��K\�\�>�ب\�>@�\"оl$܎�\�\�\��-��K\�t:�\�\�~���P�8(��ܪ�N˯\0[:��\Z\Z�\�\�oo\��\0E�\���y�r��_\0�d.m�\�㣮\��\0E�\��y�U�\�\��-��K\��\0=\�n\�Uc�\��U\�g\��-��K\�t:����\���P�8^�\�1\��v\0��pi�n����\�^�\���\�\�>,�w\�}\0(��K\�\�>�wQ\�\�}�\�͘1\�\�\0yW\��R��M�\�yB\�\�>@\�\�\0�\�8@.\��\0P\n��\�v��\�\�y�x\�m�\�#꺾3\�@)\\ڦ��\'\�~{U\�(\�\�\�\�\�ri\��R��M�\�yR\�W\�}�\�\�\�q��#\�@)\\ڦ\�\��C\�W\�}�\�͚5\�O��Z�\��.m#\��#�\Z\�\�\�>\0�B��m��zr췗\�}�\�u:�?�\�my\0J!\�\�61�=��\�\�\�>@\�fΜ�\�qb�5\�@)\\\�&\�\�?\�~�˼P�8@�E o\��\0P\n����\�b��4\��\�\�<*��\��\0P\n����\�u]_�\��7cƌ���\�\0�pi����\�\�y�x.\0�pi����%\�\�_\�}�\�\�u�\�8@ޜ\��.m344\��r�\��\�\�t\'\�Ey\0J!\�\�6u]?-\�۟\�}�\�M�>��\�\0yS\��R����0�88>6\�Ƽ\0�pi�����\�O\�>@\�:�\�\�\�\0���\0�pi�n��or�\��744\�\�qb�!\�@)\\\�&\�\�gD�8\�/����>\�@)\\ڦ��g\�~���P�N�\�7q��.\�@)\\ڦ\�\�>+\�ۋ\�>@\�\�\0��q��6\�@)\\\�&\�\���0\�/�uM\��R��MUUώ�\���P�N�\�8@.\��\0P\n��\�v���\�\�>@\�\�\0�\�q��:\�@)\\\�&\�\�\�D��\��WU\�\�\0yU\��R����0�N�\�8@^�\��.mSU\�sc�=/\��\�\��C �\��\0P\n���\��?c�=7\����\'\�\�\�\0�pi�\�g�\���P�N�󔺮/\��\0P\n��x~\�\�\��\0ŋp��q��e\��R��M\�o/��\���P����)��\�}\0(��K\�\�>�¨y�x�N\�u]_�\��.m300\�_1�}/\�/��\'\��\�>\0�B��mb~\�:\�۳\�>@\���8@�\"\�@)\\\�&\�\�iQg\�}�\�\r\r\r�k�ܟ\�}\0(��K\��\0\�\��iq��Y\��R��\�����b���\��WU\�\�\�\��Ӽ\0�pi��/��v^\�(^�\����?\��\0P\n���}\�%Qg\�}�\�\��\�Q?\��\0P\n��xi]\�g\�}�\�UU\�\�8��(\�@)\\\�&\�\�\�b��n\�(^�\�}V /\��\0P\n����\�\�ߞ�\��\���0\�@)\\ڦ\�\�\"B\�iy�xqp|v�\�/\��\0P\n���\����\�\�\��\0\�\�v��\�\�}\0(��K\�TU�M췧\�}�\�\��\�9Q\�\�}\0(��K\��\0\�\�s\�\0y^\��R��M�\�}U\�p\�\��\0ū\��?\�\�~n\��R��M쳯��v\�(^�\���\0�pi���^�\�)y�xϏ\�\�\�>\0�B��m\�\�6B\�\�>@\�\�\0��8���\��.m�\�vQ\'\�}�\�\��\�Q\�>\0�B��m��zm\�\'\�}�\�\r�W]\�\�\��\0P\n���\�\�urO\��\0ŋ\�\�qb?;\�@)\\\�&\�\�\�G��\��\�iQg\�}\0(��K\��\0\�xQ]\�\�\�>\0�B��m��zC\�\�\��\0ŋp�\�8@\�\��\0P\n����\�r��\��\'\��D��\��.m�\�G}=\�o``\�u]��\��.mSUU\'淯\�}�\�\��\�eqb�n\��R��M\�o�\�~5\�����\�\�\��\0�pi�\�g��\�\�>@\�\�\�+\"䞖\��.m�\�`]\���\��\�WƉ}n\��R��M\�ou\�\�\�}�\�UU�M O\��\0P\n���}�\���P�n����\�\��\0P\n��p\�\�WG};\�@)\\ڦ�������\��\�\�ĉ���\0�pi��\�c�=6\�/�\�F\��V\��R��M\�3��\��\0ŋ�\�vQ\'\�}\0(��K\�TU5��\�\�>@\�\�\0�\�8���\��.m\�v�\�o��\��\�\�E\�=1\�@)\\\�&\�\�YQ_\��\0ŋ�\�\�N\��\0P\n����jv]\�_\��\0ŋ\�\�\��ͼ\0�pi�\�gw��|\�(^]\�o�����\0�pi�\�g\�\���P�88�w\�\�\�>\0�B��m\\�qTUթ\��ky\0J!\�\�61�͉\�y�xq���W\�>\0�B��mb�\�1\�3y�xqp���\��\0P\n���}v���\�>@\�\Z�\���\�>\0�B��mbv{s\�pG\�}�\�\����qy\0J!\�\�6�\�\�uD\�(^�Q_\��\0P\n����j�\�o\��\0ŋ\�P]\�_\��\0P\n���\�mט\�>�\��\�\�qb?6\�@)\\\�&\�ٷD}*\�/�3��\��\0P\n����j�\�o?�\��șu]�\��.m#\��#\�\�\�q��R\��R��M\�o�G\��D\�(^�\�gE}1\�@)\\\�&\�\�=�>�\��WU\�캮��\��.m\�۞1�},\�/N\�;D}>\�@)\\\�&\�\�[#\�~4\�/N\�o��\\\��R��M\�{E}$\���\�9UU}6\�@)\\\�&f��\�\�\�P�8�\�\���\0�pi��{G\�=,\�/N\�;E�\��.m�\�>Q\��\0ū\��\�UU�\��.m�\�\�c�;4\�/N\�;G�\��.m#\��#��ĉ�\�\0�pi���\�\���P�8@\�\Z\�O\�}\0(��K\�\�>���C\�>@\�\�\����O\�}\0(��K\�TU\�κ�\��\0\�p(��K\�D���\�o?�\��WU\�nq��d\��R��M\�\��߼P���w�����\0�pi��\�\�3\��\�>@\�⤾G\�\�\�>\0�B��mb�\�/꠼P���\��\��cy\0J!\�\�6�\�\�\���P��o���Ѽ\0�pi��\�\�3܁y�xqR\�+\�#y\0J!\�\�6.�8\�\0��8@~8\�@)\\\�&\�\�\�F�\��\�v\���\�}\0(��Kۤp�Bn\�(^\���P\��R��M�\�\�\�c\�y�xqp|{$\��\0P\n��I\��\�(^�\�}#\�~0\�@)\\\�&\�ك�\�\��\0ŋ�\�;�\��\0P\n���\���UU�;\�/�\��y\0J!\�\�6�\��oԻ\�>@\�\"\��O ?�\��.m�f�4\�\�}�\�g�ҳ�y\0J!\�\�6.�8\�\�o�\�\�\��\0P\n��I�^�~\�,\�/�_\�Ay\0J!\�\�6\�\rB�ޑ\��\���ޗ\��.m��\�c�S�y�xq�|O \��\0P\n���\�\�И\�ޞ\��\'\�\�F�\��.m�쇢\�\��\0\�K\�6�ܼ\0�pi����\�z\�P�\�\�\�\�ǔ\�>\0�B��mb~�p\�oo\��\0\�Ko0�\�h*\�@)\\\�&\�ُD\�\��ǃ�\�\��\0P\n����\�u]�5\�/�\�\�>\0�B��m\\�q\�I��ޕ\��.m\�\�cr\�\��\0ŋ��\� �?y\0J!\�\�6�\�~<j��P��WU\�μ\0�pi��\�>3\�\�y�xqR?$\�y\0J!\�\�6�\�~2B\�ny�xqp�`]\��\�}\0(��K\�\�>����\�}�\�E�=4B\�\�\�>\0�B��mbv�t\�p�\�}�\�\�I�CQ�\�}\0(��K\�\�>{x�\�]\�>@\�\�\�xX]\�{\�}\0(��K\�\�>{D\�\�y�xn?!\�my\0J!\�\�61�3ܛ\�>@\�\�����\�>\0�B��m\\�q\�\�q�|k\��R��M\�GE\�\��\�\�cr\�\��\0P\n���}\�3Q;\�}�\�\��\�\�Q{\�}\0(��K\�TU\�ٺ�\�\�}�\�\�\�q�\�=\�@)\\\�&\�\�\�E�)\�/�����[\��R��M쳟�\�!\�/���zK\��R��M]\�_��jv\�(^?\�]\�>\0�B��mb��bԬ�P�88!w��\0�pi�\�g�T\�\�\�y�xq�<\"j\�\0�pi��GWU53\�/�G\�A\�\�y\0J!\�\�6.�8\�~T\�Ny\0J!\�\�6�\�5#\�/���\�1\�@)\\\�&\�\�c뺞�\��WU\�g\�\09\'\�@)\\\�&f�/\�7�\��\'\�\�E�)\�@)\\\�&\�ٯDu\�>@\�\�\����\�>\0�B��mb�=�y�xql�BUU�\�>\0�B��mb~���\�\�>@\�\��ŨYy\0J!\�\�6�\�U\�}�\�\��\�Ku]o�\��.m�\�Wc~\��\0\�\�\�(��K\�\��\���\�:y�x��P8\0�pi`��P8\0�pi�\�g�\�\�y�x�P8\0�pi��ݾ3\�\�>@\���p\0\n\'\�\�6�\�~3B\�\�>@\���p\0\n\'\�\�6�Ϟ\���P<(�\�	��M\�n\'\�\���P�A(�\�	��M\�\'E\�}m\�(ޠ?@\�\\\�&\�ٓ��\��\0\�\�w\�\0(��K\�\�\�\���\�\��\0\�\�w\�\0(��K\�\�>{J�\�\�\�}�\��;j\0�N��m\\�q�;j\0N��mb��vԫ\�>@\��5\0\n\'\�\�6UU}�\�\�*\�\�\�Q�t.m�\�1\�m�\��7\�\�P8���}vn]ׯ\��\0\�\�w\�\0(��K\�TUuZ�\�}E\�(���@\�\\\�&\�\�\�c�{y\�(ޠ���p.m�\�w\�~Y\�(ޠ���p.m\�\������\�}�\�y�y\0J\'\�\�6.�8�\�<\0�pi�\�gόzI\�(ޠ���p.m�켘\�^�\��\�m\�(��K\�D��?00\�P<o3@\�\\\�&\�ٳ��\�}�\�\rz�y\0\n\'\�\�6�Ϟ\�\�\�y�xޅ�\�	��M\�oߋ�\�\�>@\�\0�pi�\�gD�0\�ϻ\�P:���}\���\�^�\��\�]�\0(��K\�\�>���ߞ�\��\�]�\0(��K\��\0\�\�.|\0�N��mb��A\�\�\�>@\�\\\0J\'\�\�6�Ϟ\�\�\�}�\�y�y\0J\'\�\�6�ϞWU\�s\�>@\��\�<\0�pi�\�gϏzN\�(ޠ���p.m�\��\�\�\�}�\�\rz>\0\n\'\�\�6�\�^PUճ\�>@\��\0�pi�\�g/��\��P�A\�\�@\�\\\�&\�ً�\�\�\�>@\��\0�pi�\�g\�\�3\�>@\��\0�pi`�ޅ�\�	��M\�?�zF\�(ޠw\��p.m�\�O�\�\�\�}�\�\rz>\0\n\'\�\�6�\��4B\�\�\�>@\��\0�pi�\�gV\�\�\�\�>@\�I\0�pi��\�~>44\��y�xޤ\0�\�	��M쳿���/y�xޤ\0��D08+\�\�\�Y�\�Ib���\�\��\0\�\�&\0$\�{\�\��yM\�oM\�\��N�\�ԼP�AoR\0@a\�+�c�Z�\�\�\Z��^ZU\�?\�}�\�y�\0J�^�#\�z\��\�p\�1\�M\n\0(Pz�v�p\�\�[Z!\�\�_\�u��y�x�ޤ\0��Wj\��\�\�\�A\�\�vY�\�yJ\�(�7)\0�T٫�^��5b����\'\�}�\�\r�\0\n���;-��*\�\�+�\�\�?\�}�\�\r�\0\n6\�*nއ&�}\�\�N�\�P<�\�@?���\�_;\�\�~3o޼\�3\�8Cm\�\���\�4��\�\�[��WUU\�ļP<�\�@?\"\�~=\�\�\�\�ŋ�\�\�\�\��\�Om\�J\�\�\��?�쳗F\�}u��\��\�\�n��\�y�x~��~�WnS�\�C�\���hѢ[#\�^�?Fl�b~[\�\�t��\��\�w8\0\�G��d�\�6�\�\�wy��\��효�\��\0\�\�;\0\�#�h�\�\�Uz<\�ǈ-��0�\�@?&\Zp\�c\�\�\��8|ə\�[]\�\�\�˯�6�ܲ\��vm\�o�\��\�w8\0\�\�D\�%7_|��\�?�\�\�T��.˯��/�,1�]\�\�\�\�}�\��\0�1��{\�%\�Z+܎ԯ.9e�\��K�-K\�n\�G=>\�Ϗ�\0Џ�\�_�\����\�H�\�\�\��K�-K\�o7\r\r�u\�(�q�	��q�Z�v�\�e�\�U�%\��%\�_\��\���P<?\�@?\�f��[��\�n�zl\�(�q�	�\�]�\�`;R\�����p\�\�\�MӧO���P<?\�@?&p����\�\n�#�.˯��/�,1�-��\�1y�x~\��~L$\�\�v\�χ/�\�{\�\n���.˯��/�,1�\�\\\�\��\�>@\���\0��H�Mu\�EǬpS/��ڰp\�\"\��Ï�\0Џ	\�\�ˇ�<\���n\�\�ֺ�\�ܲ\���xƌ�\��\�@\0�����lɍ\�W�\��k�ۑJ��\�\�S���[��\�~\�\�t�\��\�@\0�1n�]�|xѕ\�qڻ\�\n�y�\�\�z5w\�K�-K\�o�\�u�y�x��c\�\��j;^y5w\�K�-K\�o�Μ9\�\�\�>@\�<@?\�\n�y\�v�J�\�\�OM�ܲ\��v[�\����P<\�\0Џ�nZ\'[������[��\�n\�v��\��\�@\0�1V�USWnY��Z2k֬?\��\0\�\� \0�p�UnYb~��\�\�<2\�\�3�\0\�C�mV	�ep\�\�\0	@?\�f��[��ߖ\r\r�q\�(�$\0�p�UnY꺾s�\�{D\�(�$\0�p�UnY�u:��\�}�\�9@\��Y%\��%添f̘\�Gy�x�\0\�C�mV	�e��\�\�m�\�\�ay�x�\0\�C�mV	�e��\�N�\�y�x�\0\�C�mV	�e��\�\�Y�f=4\�\��~�\�*�,1�-\�f�m� \�\��~�\�*�,1�\�\�\�t~?\�\��~�\�*�,\�7�q\�\�7;\�\��\��\0�.n�J�-��\r`q��ڴi��\�(W:/\�u�o�#���\�/O\�fպnUU��\�\�\��:\�o\�o\0\�\�N�\�y�2Ez\�{\��\�\�/�|\�%K.\�k��.�s\�\�?)\'\�6�\��\�\�\�\��޼t\�\�K��\�[\��\��_�\��z���\r`q�\\y�<$\�P��9}�\�#��կޱbŊ\�\��k\�ܹ\r\r]\�y\�\�\�\�fUpS��9s摧�r\�ͫV��\�ȃ�>>餓\�\�~�\�J��\�\�\�\�7�q\�rU�\�;y�r\�u=\�\�o\r��\�,]�\���\�\��\��Yp�U�\�v\�m\��C=\��[n�eY�8��#\�unI��{ma~G \���&\0�|�N\�	;\�\�,H�ve�ưb����\�\�_�;w\�Z!KM]�\�O|\�OM�窐?xc�\��d\�=\���\��|���\�o\0\�H\�^�\�\�\�^����W����Wˣ\�\�\�=��;\�^-�\��\�T\�\�Ҩ;RUU�$U||{\�m��5\�^�:jq�n�Zԫ�zucԯzuC\�\���.\�\�^]ӫ�QW\�ꪨ+{uET�]�\�\�\�,U|�˨KS\�\�%\�\�Ž�E|�?O��W?�ퟤ��\��^]ua�.��a�\�\�\�yQ\�\�\�Q\�\�\�9QR\�\��^���쨳R\�\���w^�Ό\�3R\�\�\�\�\�\�񵜖*>�uj�\��N��\�^��*zߊO\�\�I�}b�����o��\�oĿ_O�\�k�\�\�F�*��/�=�W_�\�/����\�\�1�}t���KQ_L\�_�?߫ϥ�\�\�\��\�3�:*��Lux�\��t���SQ�L۟�?�*\�\�c��\�T���\��p�\�>,U\�>ۇ��\�\�\�!�b�\��\���\�T\�{�{P�\�\�����zo���\����\��\�/Ul�;�}W����\�\�;S\�\�;b{\�T��\�T\�\�\'�\�N\�o�\�R\�\�[c{\�T��G�\�\�ۻ��\�\�\���b{�\�\�9Ul�9U|�SԎ�b{N���^\�ן�*>��*.\�>�g��\��==Ul\�v7Ulױ=�*��T\�\Z�\�N�\��\�\�~c�\�~Cl�>Ul�.U�\�\�l�K\�\�\�\�kR\�\���\�\�R\�\�6�\�\�W\�\�+R\�\�\�c�e�^\Z\�I�\�~q�\�(����\�c��R\�\�c��b�����T����\�~�\�\�I�\�?b�٩b�\�c�Y�b����\��\���T��\���\�R\r\r\r�kl�K�\��\�T\�Guc��R\�\�?\�\�SR\�\��\�\���*���*zO�\�O�BD|��K\�\��*��\�S\�\�\�RE\�ӧO��T����<�N5cƌ��\�G��\�H5s\�\�?�\�?K\����f\���T��ȸ\�?N�^\�K��\�}�Q�\Z?�\�;�-[v_z\�\�p\�G/\\�p�����R��袋\�Y�dɊ�\�Z�\�˗�8�\�\�}#������7\�\�i�N��\�z\�\"���v\�ZJk+���\�\�ZLk3�՗\�\�\�6\�{u�\�8��\�8��\�8��+\�X��=3\��v�\�\�\�1-\�\�1/\�11\'\�q3G\�q5k\�\�7�\�[�9^�\�w:�\\�9\�s@:\'�sD:o�sI:�9�\�\�\�z\��)��\��+�\�\��-�\�\��/�\�y2�7\�y4�[ӹ\�\�z͹8��ӹ:��\��<�\�\�9?\�i.HsB�\��\�4g\\6�fI�I�U\��f�4㤙\'\�@i&��Z33�9j\�\��9+\�]iK\�Y�\�\\�\�H?\�\�;\�\�9Rŉ\�wӻ\�JoCۿ�j�m�����*��0Uz\�4,�J�\�\���4\\�\Z�\�\�52����\�\rg���4���\�G\�\�cR�wq l�7\��0��*��&\r��{Cc\��02L\�	≝ސ�Nر�\�T�\�0\Z�\��ސ\Z\�O�{\�kl�K\ZjSս!7zOO\'�T\�y�Q\��\�\�~Vl�{�\�~v:\�\Z\�\r\�\�{n\��c�yiO\�/�\��\Z֣�\�`o�O}\�\�c�%ihHU\�B@\�\�\�\��*�_Y\�BCl�*��\�TU/\\\�\�\�\�BGl��\�~}l�!Ul�1��;U\�3\�셜0X\�\�v7��Rս��U/<\�\�\���PU�	X;\�ju��\�1�CY\�N\�am\��.�\�^��\�[�^؋\�\�{!0�\��\��\�b�m�\�^��\�>U/\\\�k\�\r\��b����?�{\�Z3(��Q�W�\�nS\�=�~ \��o��\�5�xuH��@l�*>>$n��Tu/dG\�CU/|\�\��c�#�b�����T��\�^�	\�C}ԧ�\�~\n�\�I�#��8j�\�dA�扃\�O\"D}>\�\��{O6D}�~\�I�c{ON\�k��\�\�\���T��\'7��Z?\�\�\�\�\�|#\�\��\'Gғ$\'T<ir\�`\�ɔj\�+��d��vl\'\�`\�ɘ��\�OҜ>\�{\�^3<�٫\�O\�\�k�\�Y�\�O\�\�\�O\n�\'�\�p�*=q��\�T#O*�\'�F�lJO<�\�3UzB*\r��F���q\���X?\�=�U�Pѫ\�O�\�k�[�\�X\�/\��4KO��6\�ȓki�y\�-\r�#Oƥ\'\�Ҁ�*=a�\�T#O楡w\�I�4��\'�R�!8=)�j\�I\�\�\�ȓ��W<���dLC\�\���\'\����IɃ>��ŋ\�yg�n�\�\�\�;,=9:��_�j���6�|\�\�\��ЇV?6�u\�׮\�o��\���\�ϴ��w\\�lp\���\���ҺH\�$����\�\�Jk\�\�ZLk3�\�3zk:�\�\�\�q \�q\��\�H:��cM:\��cQ\n���\�\�\�1\�j\�1/\�11\'\�q3G\�q5k\�\�7��\��\�\�;\�\�1>\�\�9 �\�9\"�7ҹ$�[ҹ&�{\�۳\�5\�t�J\�t~�W�\�y1�\'\�y\�5\�\�Z�9׾�w.N\�\�t�N\�\�t>OO�=�Z3�� \�	O\�\�i�Hs\�Sz�H�M��f�\�L�f�\�\�f�4�Y��zs\�\�Ӝ�\�\�<�\�Xʏ&\0�X\�?��?�:Ŋ\���\�U�V�X�`�\�ٳg\�|衇�_\�̓\�TU���Y�\�\�\�\nn��Gϙ3\�\��\��\�]\�\�/�[5����\����\�V\0\0\0[�c�=v\�\�W_=\�+_w\�uw\�\�~W�W�\�O\�4\�M��\Z#l�\�m\�˧�F�\�T\n�t\�ї]v\���\�8\�\�K/]~�\�O�\r\0\0�e\�\�w\�7��͟\�{ｿ�=\�{\�g\�׿�\���\�~������;vo�*�3AI\n�\'�x\�i˖-�\�\�w\�}\��_�\�W.J�&�_\0\0`�����\�{\�E\�s\�e�]\��\�}\�\�\�w\�\�T\�Xwı\�����\�\�?��}\�\�\�m�\�\0\0\0Ep\�\�MU�+\�\0\0�\�ؽ�*\0\0�O\�ؽ�*\0\0�OM�c\�\�|�K�\0\0\�S\�n\�%\�\0\0\�I�mV	�\0\0\0}p�U.\0\0@�\�f��\0\0\�\'�Y%\�\0\0\�I�mV	�\0\0\0}p�U.\0\0@�\�f��\0\0\�\'�Y%\�\0\0\�I�mV	�\0\0\0}p�U.\0\0@�\�f��\0\0\�\'�Y%\�\0\0\�I�mV	�\0\0\0}p�U.\0\0@�\�f��\0\0\�\'�Y%\�\0\0\�I�mV	�\0\0\0}p�U.\0\0@�\�f��\0\0\�\'�Y%\�\0\0\�I�mV	�\0\0\0}p�U.\0\0@�\�f��\0\0\�\'�Y%\�\0\0\�I�mV	�\0\0\0}p�U.\0\0@�\�͛�\�\�{\�]+h�\�_\�8\�wy�\0\00,�i\�\�\�k�-��\�\�;>\��c\0\0�̟?��g�}\�\�E�\�\�ܩ���/�\�\�k��p{}ԫ\�\�\0\0�	J�*�ru_�P�\�+}\�\�\�_�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\������f\��\0\0\0\0IEND�B`�',1),('94f8114a-1cdd-11ef-95cf-00ff29e62bab',1,'process/performance.bpmn20.xml','94f81149-1cdd-11ef-95cf-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('951e0fdb-1cdd-11ef-95cf-00ff29e62bab',1,'process/performance.performance-001.png','94f81149-1cdd-11ef-95cf-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('a51f2bcb-1ce0-11ef-962e-00ff29e62bab',1,'process/performance.bpmn20.xml','a51f04ba-1ce0-11ef-962e-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('a53bb47c-1ce0-11ef-962e-00ff29e62bab',1,'process/performance.performance-001.png','a51f04ba-1ce0-11ef-962e-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('c4eeb38f-1e41-11ef-877e-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','c4eeb38e-1e41-11ef-877e-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\r\n  <process id=\"Expense\" name=\"ExpenseProcess\" isExecutable=\"true\">\r\n    <documentation>报销流程</documentation>\r\n    <startEvent id=\"start\" name=\"开始\"/>\r\n    <userTask id=\"fillTask\" name=\"出差报销\" flowable:assignee=\"${taskUser}\">\r\n      <extensionElements>\r\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"judgeTask\"/>\r\n    <userTask id=\"directorTak\" name=\"ad审批\">\r\n      <extensionElements>\r\n        <flowable:taskListener event=\"create\" class=\"com.example.expence.task.ManagerTaskHandler\"/>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"bossTask\" name=\"su审批\">\r\n      <extensionElements>\r\n        <flowable:taskListener event=\"create\" class=\"com.example.expence.task.BossTaskHandler\"/>\r\n      </extensionElements>\r\n    </userTask>\r\n    <endEvent id=\"end\" name=\"结束\"/>\r\n    <sequenceFlow id=\"directorNotPassFlow\" name=\"驳回\" sourceRef=\"directorTak\" targetRef=\"fillTask\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"bossNotPassFlow\" name=\"驳回\" sourceRef=\"bossTask\" targetRef=\"fillTask\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"fillTask\"/>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"fillTask\" targetRef=\"judgeTask\"/>\r\n    <sequenceFlow id=\"judgeMore\" name=\"大于500元\" sourceRef=\"judgeTask\" targetRef=\"bossTask\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money > 500}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"bossPassFlow\" name=\"通过\" sourceRef=\"bossTask\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"directorPassFlow\" name=\"通过\" sourceRef=\"directorTak\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"judgeLess\" name=\"小于500元\" sourceRef=\"judgeTask\" targetRef=\"directorTak\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money <= 500}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Expense\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Expense\" id=\"BPMNPlane_Expense\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"285.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"fillTask\" id=\"BPMNShape_fillTask\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"405.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"judgeTask\" id=\"BPMNShape_judgeTask\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"585.0\" y=\"130.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"directorTak\" id=\"BPMNShape_directorTak\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"735.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"bossTask\" id=\"BPMNShape_bossTask\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"555.0\" y=\"255.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"771.0\" y=\"281.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\r\n        <omgdi:waypoint x=\"315.0\" y=\"150.0\"/>\r\n        <omgdi:waypoint x=\"405.0\" y=\"150.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\r\n        <omgdi:waypoint x=\"505.0\" y=\"150.16611295681062\"/>\r\n        <omgdi:waypoint x=\"585.4333333333333\" y=\"150.43333333333334\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"judgeLess\" id=\"BPMNEdge_judgeLess\">\r\n        <omgdi:waypoint x=\"624.5530726256983\" y=\"150.44692737430168\"/>\r\n        <omgdi:waypoint x=\"735.0\" y=\"150.1392757660167\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"directorNotPassFlow\" id=\"BPMNEdge_directorNotPassFlow\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"110.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"37.0\"/>\r\n        <omgdi:waypoint x=\"455.0\" y=\"37.0\"/>\r\n        <omgdi:waypoint x=\"455.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"bossPassFlow\" id=\"BPMNEdge_bossPassFlow\">\r\n        <omgdi:waypoint x=\"655.0\" y=\"295.0\"/>\r\n        <omgdi:waypoint x=\"771.0\" y=\"295.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"judgeMore\" id=\"BPMNEdge_judgeMore\">\r\n        <omgdi:waypoint x=\"605.4340277777778\" y=\"169.56597222222223\"/>\r\n        <omgdi:waypoint x=\"605.1384083044983\" y=\"255.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"directorPassFlow\" id=\"BPMNEdge_directorPassFlow\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"190.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"281.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"bossNotPassFlow\" id=\"BPMNEdge_bossNotPassFlow\">\r\n        <omgdi:waypoint x=\"555.0\" y=\"295.0\"/>\r\n        <omgdi:waypoint x=\"455.0\" y=\"295.0\"/>\r\n        <omgdi:waypoint x=\"455.0\" y=\"190.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('c5191ef0-1e41-11ef-877e-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.Expense.png','c4eeb38e-1e41-11ef-877e-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0M\0\0Y\0\0\0D\�Ĉ\0\0+xIDATx^\�\���uy?pD�x+VG�\�F�jk�vlgZ�CP\�Q��\�\�p�\"$	\�&տ��܊\�TG\��UEK�\�  �$�(�\�EBH\"���$�\����gO7��\�l\�9��;�~>3Ϝs\�}\�B\�\�9\�w�\�\�k/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�Z�8\�B)�T\�J{\'\0P!��\�\�I\0�8\�\0@k�$\0T�a\0�5}\0*\�0\0К>	\0g\0hM���3\0��O@\�\0Z\�\'�\�\0�\�\0Pq��\�\�I\0�8\�\0@k�$\0T�a\0�5}\0*\�0\0К>	\0g\0hM���3\0��O@\�\0Z\�\'�\�\0�\�\0Pq��\�\�I\0�8\�\0@k�$\0T�a\0�5}\0*\�0\0К>	\0g\0hM���3\0��O@\�\0Z\�\'�\�\0�\�\0Pq��\�\�I\0�8\�\0@k�$\0T�a\0�5}\0*\�0\0К>	\0g\0hM���3\0��O@\�\0Z\�\'�\�\0�\�\0Pq��\�\�I\0�8\�\0@k�$\0T�a\0�5}\0*\�0\0К>	\0g\0hM���3\0��O@\�\0Z\�\'�\�\0�\�\0Pq��\�\�I\0�8\�\0@k�$\0T�a\0�5}\0*\�0\0К>	\0g\0hM���3\0��O@\�\0Z\�\'�\�\0�\�\0Pq��\�\�I\0�8\�\0@k�$\0T�a\0�5}\0*\�0\0К>	\0g\0hM���3\0��O@\�\0Z\�\'�\�\0�\�\0Pq��][�l\�G\�Ν[�^\0T�\�\�\\Q/ڰaæ�k\��fͺ6�\0��	��\�˗_U\�p\�\�G������\0\0 4��r\�ʃ�m\�V\�L\�\�\�۷͙3g\�����\�\0@��\0vVf�g�Y�摑ĴCl�>}�\��\0@��\0v�lٲ/���\�\�/~|pp\�/\�\�\0\0}�H�\"$\��\���\�\�\��7o\���\�\�Klݺ\���O>��)S�<\'�.\0\�\�@4�IHJkJz=������\�H�Rꮻ\�zxhh\�\�u�>+IM��U&�ҭ�\��T\Z�R\�֭��\��\�\0�D�$5	KV�\0Js\�\�9\�駟ޒ�O�z\��4@���&�\�*Py\�Y�K/�tu��\�.]���_\�\�3M\0\�\�v�\�4%\���f̘qЪU��IӶm\�n�>}��Ξ\0��6Yehp\�y\�}o{�!3m�me�<?\�\0\�S\�jӔ\�r�*\�\��\�\�XOL\�\�×��\��؞\�\0\���jS���\�:\�S>�~��g֮][̜9\�WCCCS\�}\0�>W_mJ�\��]x\��3w\�\�X���^\0\�FQ\�]�b\�-Y�\�\�]wݤ�M\�\�R\��\�ŋ?�p\�\�\�\�\�\�~\�\�\�ͫ\�\���^6J���\�A\�{\�/�b͚5ŦM����~Zu�\�\�=��o�\�\r\�p\�\�9z�_�\�C=4j\�d)}���WN\�Q�Ju����ז\��\�\�s\��>�O\�\0\�D�\�d2�r\�O\�C9lN�#��\�\�|J��\'\�\�\�/%ջ�\�#}��\�\�\'\�*}��kwx\�\�\�b\�-\�,\��\�Z\�\��-\�O���}2�\�\'\�v���\�Ww\\;������SŶ�,\�_���}2�\�\'\�v��\�b\� P�\�r\��j\�e��\�y�>	@׵3ܽ\�QC@�\�t5\�2@~\�ɼJ��\�\�\���z\�e\��j\�e��\�y�>	@\�\�*\�\0\�G�̫\�I\0���a \��\��\�\��\�\�\�0\0�\�\'\�*}��kg�\���6j�W\\�\�\�^�ȏ>�W\�\0t];\��c�Y\�\�ό\Zb[\\�\�\�^�ȏ>�W\�\0t];\�@\�ʥ�\Zb[��\Z_ ?�d^�O\�um\r�7\�\�t��a �\�e�\�Wc.\�\0\�G�̫\�I\0�nw\�@�%�e?�\�Q�@�\�2\�~\�\�0\0�\�\'\�*}��\�\�0�ys1|\�\�\�Wל6j\0H+\��}��:�2@~\�ɼJ��\�\r�{\�tW\�\�\�\�a\0\�O\�U�$\0]\�lh\�U\�]U\\7�=\�~�\�tգO\�U�$\0]\�lH�\�i���\�/\�@V.k͎�T�>�W\�\0t]�a@\��٨��\��*8U�>�W\�\0t�a �2d!]aJ�b\�ɼJ��\�y�a�\�v�v��\n\�\'\�*}��3\�U���\�]0\�\�\�\�)}2�\�\'�I�(���,Y\�.�\��q\�k�\��q\�\�\����#�(fϞ�\�\���\�\�g�u\�\�3f�6�>�cȫ=\�n jw?��>�W\���S��}��暯Ι3\�c�9�8��\��\�g\�}\�\�W<\�\�cE��\�sl�\�g͚�\�NZq\�Ǿ;�=�\�0�WzbO�О\�\�$�O\�U�$0��!脳\�:k\�G?�\�bɒ%Ŷm\�j!iwb�\��\�O\�\�\��\��|Cz\�t�a �2t\�X\�X�\�$�O\�U�$0)��\�Y\�^{\�w\�q\���\�[����-q���\�G�\�\�\�\�a\��\����\�0\�U\�\r>\�>��>�W\�@\�ʬ\�y\�\����\�/~�\�_�9hL\�v�9昧�M�6+�?:\�0�W�f�\�D\�\�\'\�*}\�^�0͞=�X�fM�}\�%noƌ�N�zhz�t�a �2t\�D���=2�O\�U�$���n�\�L�*ow��?�\�\��\�M\�\�*\�@ǥ\�Ye�\�\�H��\�.}D�̫\�I [e�\�\�\�\�\��A\�\�/�|��iӮI\�\�1\�U���J�M�o��\�\�\�ഫ륷O�\�\'\�*}\�\�\�W_��8K\�XO�Ю��c�9\�ѩS��>:\�0�W:�Y�����\��W;��10\�\�\�\r�7�&9}2�\�\'�,�Yf\�\�O?��8Mx7�\�\'?y��#��1}t�a �2tĮ�L�\0\�*85\��\�;�7\�\��1I\�y�>	d馛n���\�\�\�\�a\Z���\�ӧ?>00�_�Xh_<�5%ݞ2\�U��\�\�=��\�]�i���f�5Lu��_2\�\�q�O\�U�$��o�\�ם��i�\�3\�8\����\�\�\�B�\�A�\�Q-�\�@^eh�\�\�9\�npi�\Z�S�\�[��v\�i\��\�\'\�*}\�\�Yg�\�h�ޚWw�\�\�\�Y���>\�\�0�\ny�a��v�\�{\ZX���y\�&\�\�	Lu{�8\�v�+}2�\�\'�,}\��شbŊ4\�t\�=\�ܳ��\�uK�Xh_�a�\�P`ȫ\�59��\�;�5�4N\�$?\�I`�\�\�ÚOM�+}2�\�\'�,͞={��u\�\�\\\�Q�=\�\�\�\�\�\�\��о&C@Z�� �a\�?�\�mimذ�\�G��\�t\�MŦM�F\�{\�-�O>�d\����zjd{\�\�\�6j[;��Seh�\�\�V\�x\�k��Yp\ZO`�\�\��GiՎ��\�xkٲe\�<0j{Z?��\�Gm�\�\��\'�xb\�\�^�>	d\�\�#�,�lْ暎*\�\�&��T*�a\�u�{]q\�UW�\�\�X�W�.�\�/����׿^���G)^�\���\��\\�\\�r�}?\���rJ\��?��?)f̘Q���\�mŗ��\�\�}\�[\�Z|\��\�-�.]Z\�\�Pc۳��\�\�\�_�\��\�|\�c\�d�Ϗj��}\�\�\'����}l\�[\�\���9��\�\�\�Ǭ&G\�\�\'۩�~�\��ѽ\�\�[�9^(�\�o[�>��\�5�٩�5{\�\�\�o{�c�\�\�+�8	T��\�?�8�\�\�G\�۫��,w\�q[��\�\�裏.?\�JӸ��\�j\�=~\�I��>\�3��k\�\�~��?��\"\�\Z\�\�3��\�\�\��\�?��\�/\����)<\��\�\�S�L)�\�O��8ꨣj�r���\'�pBq�7n,~\�wwdh�\��\�\�\�k�\�\��\�]\���`\�\�׾���\���\�+��m�\��\�ꫯ\��;Y��\�\�M�\�ƿ�\�j��\�Y\�\�5\�\�E49��W�\�c�C9�v�~\�;ߩ�}\�C�P��\�b֬Y�ˢgΜ9�\�Bқ\��\�\�\�n\�\�6��.Z��\�\��\�\�ֶ\��]vYm�*�jz�\�.}\�\�\�>\��\'�����\�k\�>\�4.�\�z5<\�y\�Y!jMl\�\�\�}\�y\�WD.\\X�\�\������\�o\��?��?�� �\��qmHx\��k�dc@��\�\�G\�?�쳋�.��ؼys\�\�\�/~\�\�?��\�/�?��\�?�\�\�\�\�24\�\�\�\�XJ����8�%8�\�\�\�a\�W�\�{Z�Z��g=k$4p�\��t\�\�\��#!)V\�\�̙S[ŏ�#$\�R�\�_\�7��\�\��\���ZH�\�\��\��\�{�G�\�\�\�\�\'�,�v\�i˺}\��\�.�\�#�=o\\v7\�\�jx\�_8\�}ch�դF��._��8\�\�j�\�\�\�\��\�\�\�Q�B\�O�\�O��\�sL\���~\�����C/{\�\�b岶o�\�$�ž\�W��\�E��\��\�+\�\�\��\�\���\�\��\�^��\��/~\�_�z\�,\�@s\�\�\r\�4�4L\��fg\�ۓധ��.j\��\�U�L+\��\��_~��\�\'\�g<\�\�H�\�\�Hh��\�\�]\�\Z\�/x�F��~��~�\���.^��\�\�U\��x�t\�ѷ�\�-\�\'?�\�ڋX\�\�\�v\�@�\�8㌹\��;M\'�x\�|�i|v7\�\�b�_\�L꿼_\�ӦM	A\�>ߴ~��\�\�9_|\�۫+R\�Jh|�)�V\�v�5%jhh�\�\�i�o�\�\�\r7\�Pt\�A\�\�7\�\\[iz\�s�;\�\�\��[��U��\�\�=�\��]�V���\�\�\��\�#\�W�\�i��\�\�n<�j�\�\����\�K_�Rm[|\�E/z\�Hh���\��X�PT\���W�b\�}\�O\�\�-z\�\�|\��\�\�T�<i�OY*\�ז\�R�m:����\�_b��Mz�\��0\�z1D\���\�Ӹ\�\'q�\�$\�\��򗿬m��x{\�ԩSG~�W�cx�BD��A >�t\�y\�ծ��\�~\��N\��\�7k\��\�׶Ǿ������;=\�x\�Vh�\�v\\��fg\�k�_�഻�e\�E�L\�+_�J1��\�[�O<\�\�\�1XG�\Z4{\�\�\�\�[o\�i{\�+_�\�\�裏���+M\�\�\�\���oo��/4\�g?\�󜍡)>Ӕ>�^�>	d뤓NZ٭�\�]r\�%\�-\�\�\�@g\�b�\�+K\��CS��>U\��\�S�\�?\�ܸ\Zo�\�W�Z�<NCE�\�y�-B\�\�\�__���g\�g;��<>\�T_i��ߺb���\�*�4B\�S]����]\��T/�dZ�\�/�R[���\���\�g�\�jGq\�=\�}\�\��\�\�Q\��x[t��\�u\Z�a�I��g�\�y\�B\�\�w\�]m\�c\�v\�@�\��\�O>y\�֭[ӌ3�\�\��L\�N�:\��\�1\���\�?��\�6��ύ�)\�G_�E\�X\�\\sM\�sG\�����\�3Qi5��X��\�\�\�I!�\�������w\�7Bӹ\�[[�z\�_�\�eV��J� s\�^\���f�\�\�\r�7�&�^\�ɴ\",z衵\�\�\�:�v\�\�\�m\�-z\�>�\�\�g�\�\�{\�\�\�\�׋��\�W\�cթ�=\�\�\�\�㍡\�}\�{_\�9qr�y\�\�\�Ϊw\�i���N�K��v\�\'�b���\�Ӡ3���\���eh��\�7�Ӌa\�s��\\\�\�L\���D8�}��\�\r��ǫ�q�\�ƿ/\�����k_\�ѱ\�\�\�\�/�m�S�ǀ+�q��<\"T\�e1H\�JU\"\�\�\��m\�o\����\�Wb�Q���JMc\0j\'0\�\�\�z\�\�\�\'z\�\'ӊ\�\�\�碧}�ӟ��M9\�^:!߫^\��ډr\"�\�\�u���~��^\�\�sO\�o\�ŉv\�\�K#�\�\�\�<\�\�\�\�\�\�z�\�\�U\�@\�,�ڍ��\��Ӱ3!~�\��L\�q?\�}\�9�\"�\�/�t{T�=$N\�]�y��ſ���\�N�[YQ\�6��\�18\�\'N\��,��~|^)޶W��8�n�\�~Q\��ַj�Wq\�?�\�?�m���\�\�Wzqj]\�@ǥ�&O���\�\�륷K\�E�\�DşbH�\�+^D:\�sj/\"\�	!V�ZU̝;w\�~9�>	dohh谙3g>C\�D*�\�e`zh\�ԩ��\�Ig\�64{�HT�=�vOu[+ʞ֮e芉8}{d&�>9\�\�\�\�y=��\�\'�Iaڴi�f̘\�\�D�8\�XaZ]\�\�\��\�~��]3QAg�n��\�y�>	L\Z�\"t\�G���\�\�׏\�\�q҇�az\�\nS\�\�*\�@W�7\��\��L�d^�O�\�\�\�\��M�v\�1\�\�\�O~\�\�\��;N\�~k.�\����\�uu\�Nz\�t�a �2t\�X�\�X�\�$�O\�U�$0)\�\��\�\�x�\�\�>�\�\��j��w\�s\�=\��]�\�\�2#m|\�GV\�y\�K\��\\~\�I\']]\�6\�wZ\�<\�*\�@O\�i\0\�\���\�\�ɼJ�&�����\�04{pp\��\�\�\�e\�\�\\*v|�y\�\�ٱ_z]z\�0�Wz�\� \�\�~\�}2�\�\'\�:\�@^e\�\��\�]N�\�\'\�*}��3\�U���\�U0\�\�v*@�̫\�I\0�\�0�W���\�g*F�̫\�I\0�\�0�W�QJ\�\�U`�0}2�\�\'\�:\�@^e\�\��q2���^@�\�y�>	@\�\�*\�@^v�&*N�̫\�I\0�\�0�W\�\"4\�ɼJ��\�y�a /BA�̫\�I\0�\�0�W\�\"4\�ɼJ��\�y�a /BA�̫\�I\0�\�0�W\�\"4\�ɼJ��\�y�a /BA�̫\�I\0�\�0�W\�\"4\�ɼJ��\�y�a /BA�̫\�I\0�\�0�W\�\"4\�ɼJ��\�y�a /BA�̫\�I\0�\�0�W\�\"4\�ɼJ��\�y�a /BA�̫\�I\0�\�0�W\�\"4\�ɼJ��\�y�a /BA�̫\�I\0�\�0�W\�\"4\�ɼJ��\�,X�}ӦM�~)�\�W�<<T�\�\�\���d>�O\��/~h͚5�~1�\�\�o~\�K\�a\�\�\�9�w�&�>�O\�\0\�\��\�6�\�Jjo��w^�j\�\�\� pY\�I�#zGh\"\�K�|衇Fm�,�O\�s\�(^�+\�\�x��d��.���\�6\�>�*�\�\�\�\� ������s\�����O.Y���;wn1o޼Q�M�\�\'`<\��v�\�Np\\\���xц\r6�]���5kֵ\�\�\0@�+�\�)1\�\�)\�\�0B�`�\�\�W;,\\�\�ѡ���\�>\0@��2\�E\�\�0B�\�ʕ+޶m[=3۷o\�6gΜ5���\0}(Ye�\�Ą��\�ʌ\�\�5k\�<2��v�mӧO� \�\0\�C\�*�\�&&�\�\�d�lٲ/���\�\�/~|pp\�/\�\�\0\0}d�LV��PB�\�\�\�\���7o�\�\�\�%�n\��\�\�\'�|ה)S��^\0\��Xe�\�Ą���\���;Ҡ��뮻\Z\Z�Dz]\0�\�JR���֔\�z���&&�[o�\��4$�֭[wcy�?�^\0\���\�$$�e��q���\�̙s\�\�O?�%\rJ\r�8\�\�SZi�\n1\�\�	�+&���ҥ�^�:MJuK�.�Vy|\�\�3M\0P!�[:�q\�d6cƌ�V�Z\�L\Z��m\�v\�\�\�\�t\�<\0�\�-�\�b�;\�󾷽Ԑ��ƶ\�\�>?\�\0\�s�[:�q\�d700�\�u\�]�������/)�\�c{�/\0\�\��t�\�~p\�)�|x��\�Ϭ]���9s毆�����\0\0`��W\�/�\�\�Νg��^\0T�\�Np\\\�/�\�9���\0a��W\�\�3\0T�a�Np\\\�O\�\0Pq�:�qE?q<@\�\�\��\�\�\0g�W\�\�3\0T�a�Np\\\�O\�\0Pq�:�qE?q<@\�\�\��\�\�\0g�W\�\�3\0T�a�Np\\\�O\�\0Pq�:�qE?q<@\�\�\��\�\�\0g�W\�\�3\0T�a�Np\\\�O\�\0Pq�:�qE?q<@\�\�\��\�\�\0g�W\�\�3\0T�a�Np\\\�O\�\0Pq�:�qE?q<@\�\�\��\�\�\0g�W\�\�3\0T�a�Np\\\�O\�\0Pq�:�qE?q<@\�\�\��\�\�\0g�W\�\�3\0T�a�Np\\\�O\�\0Pq�:�qE?q<@\�\�\��\�\�\0g�W\�\�3\0T�a�Np\\\�O\�\0Pq�:�qE?q<@\�\�\��\�\�\0g�W\�\�3\0T�a�Np\\\�O\�\0Pq�:�qE?q<@\�\�\��\�\�\0g�W\�\�3\0T�a�Np\\\�O\�\0Pq�ƫ<�\�q��Z�^&}\0*\�0�x�\�Д&!)�)\�\�`�\�\'�\�L�XIj��2\�\�I\0�8\�\0!V���%�L\�}\0*\�0�D��&�\�*��>	\0g`�ĊR�\�4%\�&}\0*\�0�DJV��2\�\�I\0�8\�\0)Ym��^��>	\0g`�\�W�\�\�0Y9��\�L��jS�&+\�3\0T�a /EQ<wŊ��dɒg,XP\\w\�u�\�U��o_�x\�C.<<}~�&}\0*\�0��20}�؋5k\��6m*�~�i\�\�\��\��\�6�!\�=\�sD\�\�\0Pq���\�\nS\�\� ��_\�\�\�k\�\�ts�Q=�$\0T�a /\�<+LyT<ehڜ>GT�>	\0g\�K|�&\�U\�*��\�9�z\�I\0�8\�@^\�\rMO>>\\��\�ŝןY��>����\�\�D\�\'�\�yi\'4m\\���\�\�9\�\�W�ߝ*�\�e\��j\�%4\�I\0�8\�@^\�	M\�yŨ�T�\�r\��j\�%4\�I\0�8\�@^\�	Mw/:oTX�W\\�\�\�^BA���3䥝\�t\�u��\�������\�D\�\'�\�y�\�*���O@\�\�\�Nh��\�a�^qY��\Z{	M}\0*\�0��vBӽ?��Qa�^qY��\Z{	M}\0*\�0��vB\�c�Y\�\�ό\nL�-.K\�Wc/���O@\�\�\�Nh�Z�\��Q�)����\�\�D\�\'�\�yi+4m\�\\\�{\��BSl�\�F\�\�\\BA���3\�ew�i\��\�Ų��\��T��,\�I��\�VBS\��=qQ\�\�\�Ԣ\�z\0@�\�\�дys1|\�\�\�Wל6*(��ľV�\�_BS\��=qJ���֔\�z\0@�\�\�,4\�nuiWe\�i�%4US�$5	JV�\0�����4M\�.\�\�\�\�\�Kh��XIj��2@U	Myi�\� ���ޞj���\��&�\�*\0T�Д�f�I\����\�\�\�jӔt?\0����My�\�Tm\�j�U&\0�*�)/BS^%4U[�\�4%�\0��)/BS^%4Q_mJ�\0bȋДW	M\�300�_\�g^Q~����Ȏ��v�\�g\�~\�u�>%4\�Ehʫ��\�:u\�!e?\\\�\�v�vjq\\/�-\0�\�My�\�*���\r��\�W7	D{RW\�\�\r\0\����n�w���Jh\�oS�N=thh\�\�\�\0t\�G\�{n�`��\��\�+{\�\"\�\��9�\�\�_�\�\�\�\�\0\��)/BS^%4\���\�\�,\�\�z\�>}z\�}�X�~}-$\�N\��\�\�\Z�Ӗ�\�\��\0�INhʋДW	M�i\�\n\�H`:\�\���+W���-q��~cp�\�\0}FhʋДW	M�g``\��iӦ����O}\�Sņ\r\�,�G\��q;\r�鱸�\���IJhʋДW	M��\�y\�W�\��\�\�v���\�}\0��Д�)���ˎӊ�|�i�o\�ە��\�\�899\0\�	�)/BS^%4\���\�\�X4q�N�\�mXm�1}\0�$$4u\�\�?|��\�\�\�m�\�\�\�?�\��2e\�s\�}�ДW\�*4��|\�e[T֔t{�����\�}�GϋӅ�{��=�\�p:\�\�q�\�c\0&���\�\�\�˖-�\�\�͛�Շ�r\�r饗��1c\�A\��BS^���=}>鎆��]�����\�\��}\�s��?}�_���\�\��\0\0��\�\�9+W�<x͚5��UݪU��9\�\�700�o�:BS^\��\�\�|\�\r�i�\��y^�\�믿>}�&T\�~\�c�\��8\0�IHh�x\�\�\�\�\�˗_�m\�\�b\�.m/���\�SO=\����ДW\�\�Q�\���;���Q\��zK}��+ҧnB\�\�7<�[��\0L6B\�\�Z�l\�G6lذ)�vg��\�\�\\x\��3o޼Q��d�\�ߡx\��Fmo����磶\�x\�\�O<1j{�jɒ%q*\�1?��\��IXJ+\�\�\��\�\�֭K��	�\�p߫\�\�\0L2M�5��;wn�v\�\�t�ڭ�N\\7n㡇\Z5�O��A\��m\��{ｷx\�k^S<��\�#�oڴi��\��\��\�~q\�W\�{l-,~�\�\�駟>\�{Q\�<L\�\�\�-[��Oل�\�o��\�i\�\0��XY8\�c~�p\�\�G�o߾�\�s\�\�\�\�\�KfΜ��r��?�W�\�8\�\�C�PQ�\��f͊\�⨣�*\���bƌś\��\�\�\�n\�ʔ)ŢE��+���x\�{\�[\�V���]vYm�j\�ƍ�\�\�\�\�x�O+Mݑ���Zt\���=ou}��&\0�\r\rM�3gΚV\'ضmۭq\�r�z0\��\�M\�\�4p�\�]w\�5\�\�K_�ґ�\�\�/�(�=�իW\�BR�,\�\�~ś\�\��\��,\���\�\�BR��\���\�;\��\�Z\�J\�\�U?\�X�O��UXj\�\�g�\0\0rgQ�>}�_|\�\�[�n}�a�zb\�ҥ\�*/{��\�\�\�\�yO=\�T-0Ī\�\�~\���\�\�ŋ�\�|\�;\�\�\�\�w��~��~�x׻\�UDQ/x�F�\���G\��ێ�t\�a�\�n\'ޞ\��׿�x\�\�^W�\�e/+\�\���\�\'\�D�W��\�\�ycy>\�Va�\�g\�\0\�\�\�\�\�_�r\�)w�^�nݍ�\�����n�\�龹��C9�\�\��z\�\�\Z\Z\Z�}a�\��\�\��\�/�\\ӫ_�\�\�x\�+v\�\�\�\'�,:\�\�[\�>����j\�c�\�\�_���\�ӫJ�NSؓ\�\�h�\���&\0�̕\�\�9e\��D9D\�_\�\�t��Kh��\��\�\��m\�\�qw\�}w\�\��\�N\�׎��y\�榡镯|eq\�\�G\�\�Z+M\��}}�o|\��p\������\�\�k����z�\��[\�\�\�U5M�\�\�|�\�\�~\�\�=�̑Gg8L�΄�\������\��\��\����\0�q\�%4\�q\���8D��\�=\�\�c�\�{5�\�\�\�o��A\�[\�^�\���=o�}\���-/\�����\��?y{^�\�A\�.\Z\���]�\nMLNe����\���}-\�;\"n�~q\�c\0\0`�r	M\�٤�~\��������~P\��;�\�;�3\�}\�c+�\��\�\�\�k�\�\�?��\�*T|�N\�\�_�җF�r�14�\�}\�+\�>�\�\��\�~\�uqV�\�N;m\�\�\�v	M�e\�ԩ�\�\�\�\�Ӌ�+W��g\\\�\��M�V_e*\��\�\�\0\0�8\��\�\���\�N\��\�\�CYi�U�6\�W�\�U\�;\�\�Q׭W�R�ۢ\�\�\�_�B\�\�7���馛j\�l\�\�.�\�g�yf\�P\�\��r�u\�n�\�\�\�03�jN<\�\�\�	G&B\�\�	\'���a�i~z\�\0\0L�\\BS��t㩷�\����E\�J\�9\�ScqB�U�V\��l�_%4\�����\�@\�X=\�|\�S�\Zwp�\�v\�i#+Lq�q?\�}\00r	MQ��W�V�\\Kh\�OS�N=�6[\ZW�\��V��^�´%n?�O\0\0&H?��~(���\�ffcp�\�8\�I\�=�^\��7~�i\�\�\�L\�\0�	$4\�UBS۱⴮!\�\�NG~\�\�,(\�\�\�\��B|��c{\\\�pZ\�z��\�\0\�BS^%4\�����7��\�\�$\0\�i]��\�6\0\0 4\�UBSu\�8�\�&��U-vZq\0�.�\�*��z\�+\�\�\����+ʯ7�\����_oޱ}v\�^\0�.�\�*�	\0\02#4\�UB\0\0dFhʫ�&\0\0ȌДW	M\0\0��)��\0\0 3BS^%4\0@f���Jh\0�\�My�\�\0\0��\�*�	\0\02#4\�UB\0\0dFhʫ�&\0\0ȌДW	M\0\0��)��\0\0 3BS^%4\0@f���Jh\0�\�My�\�\0\0��\�*�	\0\02#4\�UB\0\0dFhʫ�&\0\0ȌДW	M\0\0��)��\0\0 3,ؾiӦQû\�~�\�\�Cehڜ>G\0\0@-^���5k֌\Z\�U\�\�7��\�%eh�9}�\0\0�Z�p\�\�7\�pÆ\�\�\�V�zS\��\�U�..\��e�\'}�\0\0��A=V8\�z:>S��^\�\���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\r�	�r\�*z~\0\0\0\0IEND�B`�',1),('ce700575-1cde-11ef-96e8-00ff29e62bab',1,'process/performance.bpmn20.xml','ce700574-1cde-11ef-96e8-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('ceadf8d6-1cde-11ef-96e8-00ff29e62bab',1,'process/performance.performance-001.png','ce700574-1cde-11ef-96e8-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1),('e61a32b0-1e2e-11ef-9942-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','e61a32af-1e2e-11ef-9942-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.flowable.org/processdef\">\r\n    <process id=\"Expense\" name=\"ExpenseProcess\" isExecutable=\"true\">\r\n        <documentation>报销流程</documentation>\r\n        <startEvent id=\"start\" name=\"开始\"></startEvent>\r\n        <userTask id=\"fillTask\" name=\"出差报销\" flowable:assignee=\"${taskUser}\">\r\n            <extensionElements>\r\n                <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\">\r\n                    <![CDATA[false]]></modeler:initiator-can-complete>\r\n            </extensionElements>\r\n        </userTask>\r\n        <exclusiveGateway id=\"judgeTask\"></exclusiveGateway>\r\n        <userTask id=\"directorTak\" name=\"经理审批\">\r\n            <extensionElements>\r\n                <flowable:taskListener event=\"create\"\r\n                                       class=\"com.example.expence.task.ManagerTaskHandler\"></flowable:taskListener>\r\n            </extensionElements>\r\n        </userTask>\r\n        <userTask id=\"bossTask\" name=\"老板审批\">\r\n            <extensionElements>\r\n                <flowable:taskListener event=\"create\"\r\n                                       class=\"com.example.expence.task.BossTaskHandler\"></flowable:taskListener>\r\n            </extensionElements>\r\n        </userTask>\r\n        <endEvent id=\"end\" name=\"结束\"></endEvent>\r\n        <sequenceFlow id=\"directorNotPassFlow\" name=\"驳回\" sourceRef=\"directorTak\" targetRef=\"fillTask\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"bossNotPassFlow\" name=\"驳回\" sourceRef=\"bossTask\" targetRef=\"fillTask\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'驳回\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"fillTask\"></sequenceFlow>\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"fillTask\" targetRef=\"judgeTask\"></sequenceFlow>\r\n        <sequenceFlow id=\"judgeMore\" name=\"大于500元\" sourceRef=\"judgeTask\" targetRef=\"bossTask\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money > 500}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"bossPassFlow\" name=\"通过\" sourceRef=\"bossTask\" targetRef=\"end\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"directorPassFlow\" name=\"通过\" sourceRef=\"directorTak\" targetRef=\"end\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'通过\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"judgeLess\" name=\"小于500元\" sourceRef=\"judgeTask\" targetRef=\"directorTak\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money <= 500}]]></conditionExpression>\r\n        </sequenceFlow>\r\n    </process>\r\n    <bpmndi:BPMNDiagram id=\"BPMNDiagram_Expense\">\r\n        <bpmndi:BPMNPlane bpmnElement=\"Expense\" id=\"BPMNPlane_Expense\">\r\n            <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n                <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"285.0\" y=\"135.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"fillTask\" id=\"BPMNShape_fillTask\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"405.0\" y=\"110.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"judgeTask\" id=\"BPMNShape_judgeTask\">\r\n                <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"585.0\" y=\"130.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"directorTak\" id=\"BPMNShape_directorTak\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"735.0\" y=\"110.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"bossTask\" id=\"BPMNShape_bossTask\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"555.0\" y=\"255.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n                <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"771.0\" y=\"281.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\r\n                <omgdi:waypoint x=\"315.0\" y=\"150.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"405.0\" y=\"150.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\r\n                <omgdi:waypoint x=\"505.0\" y=\"150.16611295681062\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"585.4333333333333\" y=\"150.43333333333334\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"judgeLess\" id=\"BPMNEdge_judgeLess\">\r\n                <omgdi:waypoint x=\"624.5530726256983\" y=\"150.44692737430168\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"735.0\" y=\"150.1392757660167\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"directorNotPassFlow\" id=\"BPMNEdge_directorNotPassFlow\">\r\n                <omgdi:waypoint x=\"785.0\" y=\"110.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"785.0\" y=\"37.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"455.0\" y=\"37.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"455.0\" y=\"110.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"bossPassFlow\" id=\"BPMNEdge_bossPassFlow\">\r\n                <omgdi:waypoint x=\"655.0\" y=\"295.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"771.0\" y=\"295.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"judgeMore\" id=\"BPMNEdge_judgeMore\">\r\n                <omgdi:waypoint x=\"605.4340277777778\" y=\"169.56597222222223\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"605.1384083044983\" y=\"255.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"directorPassFlow\" id=\"BPMNEdge_directorPassFlow\">\r\n                <omgdi:waypoint x=\"785.0\" y=\"190.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"785.0\" y=\"281.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"bossNotPassFlow\" id=\"BPMNEdge_bossNotPassFlow\">\r\n                <omgdi:waypoint x=\"555.0\" y=\"295.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"455.0\" y=\"295.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"455.0\" y=\"190.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n        </bpmndi:BPMNPlane>\r\n    </bpmndi:BPMNDiagram>\r\n</definitions>',0),('e65985a1-1e2e-11ef-9942-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.Expense.png','e61a32af-1e2e-11ef-9942-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0M\0\0Y\0\0\0D\�Ĉ\0\0-\�IDATx^\�\��\\Uy8p�.\�\�Z񅲪��\�em-��*.m\�\�\�\�ry$	�g�v�DEP\�fi\�.�W�)�eP�\0BJ���Hx�K $�Hr�\�\�v�g2�\�{g\�s~���u\�\�sf\�l���\�\���\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�r�B!\�G�;�\nQ\0�\'O@\�)\0ړ\'�\�\0\�ɓ\0Pq��\�\�I\0�8\�\0@{\�$\0T�b\0�=y\0*N1\0О<	\0�\0hO���S\0�\'O@\�)\0ړ\'�\�\0\�ɓ\0Pq��\�\�I\0�8\�\0@{\�$\0T�b\0�=y\0*N1\0О<	\0�\0hO���S\0�\'O@\�)\0ړ\'�\�\0\�ɓ\0Pq��\�\�I\0�8\�\0@{\�$\0T�b\0�=y\0*N1\0О<	\0�\0hO���S\0�\'O@\�)\0ړ\'�\�\0\�ɓ\0Pq��\�\�I\0�8\�\0@{\�$\0T�b\0�=y\0*N1\0О<	\0�\0hO���S\0�\'O@\�)\0ړ\'�\�\0\�ɓ\0Pq��\�\�I\0�8\�\0@{\�$\0T�b\0�=y\0*N1\0О<	\0�\0hO���S\0�\'O@\�)\0ړ\'�\�\0\�ɓ\0Pq��\�\�I\0�8\�\0@{\�$\0T�b\0�=y\0*N1\0О<	\0�\0hO���S\0�\'O@\�)\0ړ\'�\�\0\�ɓ\0Pq��\�\�I\0�8\�\0@{\�$\0T�b\0�=y\0*N1\0О<	\0�\0hO���S\0\�܊+>4w\�\�b```\�\�>\0�\"4M\0�E\�7nZ�n]1k֬K\����\�4��r\�\��\�-Zt\�\�\�\�\�t\0P�&�f�V�z\�֭[\�=S�m۶�s\�\�Y;00�g:\0\�s�&��=\�c׮]{\�HǴ]l�>}�\�\�x\0�\�i�\0v�bŊ/�\rSݼy\�\�|C�\0�O�\r\�\�h�v�\�\�T\�\�\�\�K7o\��\�\�%�l\�\�\�\�G}Ô)S�>\0\�eC4�E��Ɣ\�q\0Uq\�m�-O�\�\r7\�p\�\�\�\�\�\�\�\0}\"V�Z4JV�\0J\�\\s\�Ci��Z�~�e��=},\0\�\'b%�E�d�	�4gΜ\�>�\�Ï��R���;\�EV�\0�\�ŊR��\�*Pyq�\�9眳&\�\�-[\��2_�\�9M\0\�\�v�\�4%PE3f\�\�w\�\�Տ�\r\�֭[��>}���\0��6Yehpꩧ���\�\�3m�me�<-\0\��d�iJz?@�\r\�y饗>P��\�.s\��=\0\���jS��\�<\�c�9hÆ\r��[���9s\�uCCCS\�1\0@���6�\���\�8㌫\�Ν+\�\��\0�](�\�\�\�r\��.]�\����^z餌h�\�m�%\�\�mK�,�sѢE��\�0\��!OΟ?��\'\�gz\�dy�	U\�D\�ڵk�M�6?��\�qĿ{��_~�\�\�\�\��\�{L�~ɓw\�ygӶ\�\�$\0*�9��\�J\�>���ו\��U\�{L,y2��\'�q�\�d�洟\"އ�؜�G�Ē\'\�	y�	Ǌ�Jb\�\"ޏ\�=&�<�Wȓ\0\�\\�\���\�\r��\�\�\�\��}�\�{lKǉ��b\0\�#O\�\�$\0=\�I1\���5\�\�K\���\�_w�\�\��\�\�\�C1\0��\'\�\ny��\����\�\n�z\�q�M\�\�\�C1\0��\'\�\ny��\��\�\�S���z\�}\�x1�P@~\�ɼB��\�:)�_�\�\"�q_:^�>�y2��\'\�9\�@^���ȓy�<	@\�uR\�U�\�\"�q_:^�>�y2��\'\�N���~\��ME@=\�t�}( ?\�d^!O\�s�\���M��ǟj*b[ܗ��\�\0\�G�\�+\�I\0z��b bղ����ؖ�c\�\0\�G�\�+\�I\0z��b`\�\�\�+Oo*b[\�\�4^�:�y2��\'\�]\�\�W�\�M�@=\�>\�~�B1\0��\'\�\ny��\�i1�ys1|Ӣ⺋�o*\0҈11ַ�c\�\0\�G�\�+\�I\0z�U1��oMw�M{( ?\�d^!O\�s���N�5\�Y\�c\���\�C1��\'��y2��\'\�V\�@����\�Ot�������\�Ra\�d^!O\�s��1q�\�F�a�\�\��\Z�\n�\'\�\ny��S\���,�+L\�m*F�\�+\�I\0zN1�W(&\�\�\Z��m�\�ɼB��\�y�b`B\�1\�\��\�)y2��\'�I�(�=�.]���\�:\�\�\'�x\���\�t\�Gl;\���ٳg?�я~\��r\�ʓN:i\�3^�>���\�+�ӆ�\�q\�y2��\'�I�l��p\�\�}Μ9�z\�\�i��V��\�?/n��\�\�\�{\�-B��۱=\�5k\�֣�:\�\�;\�\�\��\�=\�@^���\�\�\�x&9y2��\'�I�l�>|\�I\'m:\�\�c��K�[�n�5I�\�b�\�G�\�?�\�?�jpp\�\�\�\�\�@^�\�\�6@�}��<�Wȓ��P\�=p\�%�|\�\�\�/,XPlٲ%\�:��\�r\�!\r\r�-}zC1�W(zj��\�X\�$!O\�\�$���\����\�\��\�#�(~\��ߥ}Ш\�~=\�Ї�M�6+}>�O1�W(zf�\Z�\�\��\'\�\ny\�^�0͞=�X�vm\���I\�oƌL�:u�\�9\�.\�@^�\�\�nt\�{dF�\�+\�I kW^y凣a\Z��T�\�mtІ���}\�\�{y�b�\�\�\�\�8x�\�ݑ>.\�/}D�\�+\�I [eO\�O>yS��\�M?�\�7L�6\�\�\��\�\�@^�誴���\�[eĿy�\�q\�\�\�\��\�\'\�ɼB��u\�E}-��7ڋ>t*\�衇\�3u\�ԿO_ݡ\�+]Ӫ�����\��G\'�Sc\�T��\Z\�o\�<Lr\�d^!OY*{�=N8\�G\�2\�\�ӟ�\��8\��\�u\����B1\�;kdZ5@\�\Z�V㿹}{��=��<�Wȓ@���\�\�\�v\�a����\�>}�}{���Ε�\�\�2��\�S���B1\�Z�\�]50�\Z�V�S�q�\Z��]=/\�t^ɓy�<	d\�\�3ϼ\��\�NK{��:\�\����:W\�\�h[(\�\n\�@k�\�\�D��K����qju����\�\�g�t:�\�ɼB��t\�I\'\�ӫC\�\�.�\�\�\���\�k�s\r\�@ۢ@1�W(Z\�t>7\�݆�Uc�\�h�����nw_=\�鼒\'\�\ny\�\�\�>\��M�\�rK\�\�tՍ7޸��\��e�Z\�\\�b�eQ�\�+���\�-\�\�v�mTZ5N7&�w�a�\�\�\�Z̧�\�J�\�+\�I K�g\�޶~����\�{\�\��\�kM�Z\�\\�\" �ZQ�C1\���i[\Z7n��\�\�mW^ye�iӦ����\�/�|�\��C=4�=\�q:��kM\�:y=\�\n\�@k-\�o\Z�����7(�\Z��4Luc}]tA�y�Fm^MT�\\�bEq\�=\�4mo�\�F��\�o��i{\Z��\�/��]q\�\��\�\�ߴ�!OY:\���G}4\�k��|��[|x�.\�D�\�\����\�\���7ƚ5k�����)��\�o\�n\�}\�\�\�s�\�\�\���ߋU�V\�0\�C�Pq\�1\�\�~\�k^S̘1��{\�늯|\�+;�}\�k_[|\��\�-�-[V\�a��\�}l\�\���\�\��\�kz-݌\���\���@\�\'<!����yl7\�!y\�\nS܎\�c\�\�\�5�\��\'�8\�\�}\�{_q\�%��䱈W�\�\�\�\�˛\���\���5B\�\�\�;l��\�G~�/�b\\�~\�M7/|\�w\�s�\Z�7�\�E�\�|�qa�h�\�\��\�Nh\Zۋ\�4Y:�\�\�\�\�J\�=\�ܳ\�\0+Mc�~\�7\�\�&����P>\�\��u\�\�\�n�\��q��\�\��ԧ\�\�;��\��P������b�}\���>eʔ\�/�\�/��>�V(G\�S�\��8�\�Ӌx�x\�Ӟ6R �\�\�\�q7\�|s\�\�����\�E\�\�\��\��\�ϯm�\�M\�E]\�\�����\�Z\�\�\��1c_\�i�\�\�\�z�\Z\�\�Z̧�\�j\"\�\�]w\�U\�K�\�zk1o޼\�G�=\�ߑG92.�\�mozӛ�?��?�\�\����g?�\�#+J�{?\��\�\�D,f͚U�ۑGgΜYk\�^\��W\�^{\��%\�\�\�ŋk�\�]\�zWm[|Iq\�y\�\�\��6}�\�y\�\�G>\��{}N\�\r7ܰ\�\0\�4�ɮ����(\"�\��pd���i�\�&�\�l�\�տ�\\�hQ񖷼e\�z\�\�o}�\��������(\��\�\�;\�}\�F1\�\�_�zd�\�\'�\\�u\�Y\�\�͛kߴ~\�K_�=��O|b\�\��\�GM��ۡh�\���\�h�V\rS�\�4�\�i���.\�t^MD��&&\�S|!\�җ����\�\���\�\�S��Ԧ�&r\�{\��\�bɒ%�q{\�Wq\�A\�x\�3j9-V\�\�c\�\�{\�����\�g>sd�?gΜ�-��h�b�|\�+k_Z�\�=\�5I\�4}��߯\�\�x�\�\�w3\�I K\���^_=\�\�\�;�\0W\��]uQD<�\�O���i�դh�\ZǮ\\��8�\�\�k\�\���ԿA�ob?\��\�\�\�\�yLqӱ\�[[i�f\�Y\�zV휀��Ķ���\�/(\�\�ӷ�\�m\�;\��\�Za\���\�=�x�\�__�\�%/)~\��_5�\�n�b��N\�s�\�mTZ5LqS��\�\�N㴻��\�t^\�:O�y晵\��\�ۯx\�s�[;\\��_�jm\�\'ι�����\��`�aÆ�\�D\��3���_6�ɟ�I\��\�e#\�b\�o}\�H}ғ�4\�{\��ȷ\���O�A��EC_hE^�&,r\�_�\�\�\��x\�\���n�<	d\�\�O�\�\�\�t\�G.\�w�\�fWE@]�����P�Ƥ�A�\��?��6m\�H\�\���zqMN��\��{�Hŷ�q�S4Z�\�8%bhh�\�-i4NQ�\\~�\�ž�\�[\\u\�U���\�?�\�;\��\�\�\�*�u:��6,;k�\����N\Z�N��	\�\�\�u��s6.\\X\�e\�,\�\�ss\�\���M|A_ ]|\�\�\�u\�]W;�3V�\��?�\�?/���\�\�\�_5\�?=�\�\���AK_K<W\�\�h\�\�P\�h\�b{�4\�\�1\�uȓ@�ʄ���\�\�ZJ{��(�\�\�C\�2!\�_����hz\��\�����4�4Ň��T�@�\�o~S\�Vod\�P��S��܎o�\�P�� D4\�\�\�&�zꩵ\�Ƿ�1.7�\�\�\�\��vm�O~\�\�\��K\�i�ϱ\�\�\�s\�=5M�߮\Z�V\rQ��\�\Z׮q\�\�\�2�\�:O\�\�\�G>\�ڊ\�g?�\�\�\�yc��Cąm\�\'\�yE\�P�\�x\�\��\�\�\���q�\�Tr\�!��*V�\���\�\�\�!\�\�`ŗOq>h�\�\�\�4\�9M\�k\�Eȓ@��:\�U�:D\�\�\��nY_����\�\�@D4M��T�\�\�4\�1\�\�P5��_*�~\�r\�jP*\�\���v\\>|��#�\�Ŷh�.�\�\��_�\�_\�p	\�8��\��S�\�\�Wv\���j�Z5Lu�Ʒj�v\�|LR�Γ\�šr�\��\�h�\����?T?�)\�k\�8\'��\�Wȋ��\�ȋ\�%R��C�\�9/	l̑\�g\�\�\��\�y���\��\���ו��n�<	d�L�o?�\�ݲeK\�㌫r���\r\�MS�N��\�5\��.\"�\���v�]�vc\�\�\�\�?�#C�\�\���\�4\Z��X��c\�\�q�m�ݶ\�\�h�N9\�\�JU�`\�x����Ҫ�9�1�7Lu�\Z��\Z\�o\�<Lr�ΓqH\\|Q+=\�\�b\�=\Z��D�i��Vop\�<�83K�\�\�\�\ZW�\�\�\�\�⊤\���Xu�o�\�\�\�\�Mӻ\��\�\�s\�s\�ϟ_��\�\�\�\�\��n�<	d\�\�#��Ղ���\�8\�V&\�o�Mӂ\��\�^���\�kWa�\�\�\�\�`\�\��p�64��B!�\�o�[\"�MS�o�\�7��\�\�\�g�Q\��?餓jH\\*�y��*!V�\�d\�((\���?���\�JS㷮�\�@W�\rMc\�I\�T��ǥ��O\�:O\�\�ŗI\�ܜ}\�\�#+A�/|\"/F#\�G\�G��\'\�^=�6�\�\�\��׵K���(�K�\�#\���W\�L<\�\�{\�Q|\�k_+>\�\�\�·�+\�59Ћ�\'��\r\�S&\�~\��ߥ\�θ�\�O~rf\�0\r\�\�\�M\�\����%�FR�=\"�\�}\�o\�\�\�q|~\\�^Dą$\�\�yI��\�\'k\rN\\\�!\Z����\�\��Jq\�^}q�\��\�~\��\�wj�W\�\����qHJ%;;���躴���\'V�:m�\�\�ǥ���LD���Eġ\�\��������T_�\�4\�\�3�\�\��!Ω�/�b\�k\�\�յR�\�z\�$������͜9\�(*\�S��/(�;�N��_��t\�D\�ա!q����m,6v\'v\�ܽ\�@O�w�3\��#3�\�\�\�]��\�Ӑ\'�Iaڴi�f̘q�x�8m_aZS\�\�\��\�~.&c(zf�\Z�\�\��\'\�\ny�4bE\��\�\�\��p\�h/}\�~\�]V�&�b �P\�\�X��>�IB�\�+\�I`R|��i\�.9\�\�C\��\�Oz_�ǩ�\�\�\��^\\%���b?\�\�\�@^�\�\�6>�}��<�Wȓ���/��%ӧO\��\�O���.�\�\�o[�n݃e�\��\�w\�}\�\�\�_�\�?���:ꨋʱ\�b�ˊ\�A1�W(&\�\�6@�;�IN�\�+\�I`Rثl�f�_������K\�\��Wm\�>;ƥ�e\�(\�\n\���\�\�t}D�\�+\�I\0zN1�W(&Ԯ\Z�]\�O��\'\�\ny��S\���	��\�hg۩\0y2��\'\�9\�@^�\�B\� ���y2��\'\�9\�@^�\�F�Q�\�\��\Z�\n�\'\�\ny��S\�����9.f?\�;�y2��\'\�9\�@^�\�\�\�����\'\�\ny��S\����h�\�d^!O\�s���B1�MA�\�+\�I\0zN1�W(\�i\"ȓy�<	@\�)\�\n\�@^4My2��\'\�9\�@^�ȋ�� O\�\�$\0=�\�+y\�4\�ɼB��\�y�b /�&�<�Wȓ\0\��b �P\�E\�D�\'\�\ny��S\����h�\�d^!O\�s���B1�MA�\�+\�I\0zN1�W(\�i\"ȓy�<	@\�)\�\n\�@^4My2��\'\�9\�@^�ȋ�� O\�\�$\0=�\�+y\�4\�ɼB��\�y�b /�&�<�Wȓ\0\�\��mڴ�\�CI\�>\�\�\�β؜�GLMA�\�\'\�I\0&Ē%K\�\\�vm\��\�}\�z\�g�\��U\�{\�\�\�4\�\�|B�`B,Z�h�\�/�|\�\�\�\�:ߤNL��\�ëW��W��\�\�\�=b\�h���\'\�\�Φm�%\�I\0&\\|\0\�7we<ǊO�8묳�(n\�\�(\�\�=���\�4Q�n��tR\�ɥK�s\�\�-\�ϟ\�t\�$	y\0Ƣ,l+n\�\�~P\�S6nܸiݺuŬY�.I\�\0�\\Y\�N�\�v{LI\�4\�V�\\ya�ݢE�\�\Z\Z���\0�X}�i{,N\�41٭Z�\�\�[�n�\�LŶm۶Ι3g\�����\�X\0�%�LV�w�&&��Gz\�ڵk\�阶�mӧO?=\0\��d�\�j\�N\�\�d�bŊ/�\rSݼy\�\�|C�\0��\�d�\�j\�J\�\�d5<<�\�͛7�\�qy�-[�<t\�\�G\�0eʔǥ�\0�\�NV��61�4MLV�\�v\�\�QJ\�p\�\rw\r\r\r},},\0\�b%�E��Ɣ\�q��4MLV\�\\s\�Ci��Z�~�\��=},\0\�b%�E���\�&\�L\�\�d5gΜ\�>�\�Ï��R���;\�EV�\0�B�t�y\�d\�*�s\�9k\�N�nٲe\�)\�\���\�\0���\�+&�3f\�z\�\�G҆i\�֭\�L�>�W\���Q\�\�\r\��ݩ��z\�RCϴ%��s��t,\0\�\��t�y\�d700�祗^�@�c\Z>��\�w\�\�t,\0\�\��t�yE?8\�cڰa\�#\�֭+fΜy\�\�\�\�\�t\0P�[����_�q\�Wϝ;7�,� �\0�\�-\�`^\�/\���?\��\0��P\�\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S\�\r\��\�|��S0V\�Z\�h�8}L\�$\0T�b��*\�ДMR\ZS\�\��d!O@\�)��ԢQ�\�D_�\'�\���XIj\�,Ye�/ȓ\0Pq�\�K�(�h��21\�ɓ\0Pq�\�K�(�h���\�`��\'�\���d�\�*}A���S0��զ)\��0ɓ\0Pq�\�[}�)\����\0�`�\�W�\�\�0Y�\�\0Pq���E\��[n�\��.]�\��K/�T\�8\�\�mK�,�sѢE��\�\�$O@\�)\�R6L\�{�v\�\�bӦM\�\�?,z\�\����_~�Ʋ�zg�Q=\�$\0T�b /�\�{Zȋ\�\�\�\�\�i�*}��y\0*N1��8$\�\nS\�C\�4mN\�#�G���S\�%ΩI�w1q\�G�Q=\�$\0T�b /�6M\�7\\\�\�\�o\�_\��Z\�\�-\'\��&�<	\0�\�K\'M\�\�\�/�S��\�\�!b[ܗ��MA���S䥓�\�\�\�\�oj�\�q\�\�4��MA���S䥓�鷋Omj�\�\��\�\�\�C\�D�\'�\�y\�iZ~駛��z\�}\�x1�\�4\�I\0�8\�@^4My��� O@\�)\�\�I\�W\�K��z\�}\�x1�\�4\�I\0�8\�@^:i�n�\�65K\���\�\�b\��i\"ȓ\0Pq���t\�4ݻ\�7\�\���a�mq_:^�>4My\0*N1��N���U\�\�jj�b[:N�-4My\0*N1�����͛���<��i�mq_\�x1\�\�4\�I\0�8\�@^v\�4=�aM�\�g_mj�\�\�Ř\�qbt�i��2\'.����X�>\0\�c���\�iڼ��iQq\�\�\�75JiĘk\�i\�i��2\'Ni\�$�1%}\0\�\�4Myi\�4\�juiga\�i\�i��XIj\�(Ye��\�4\�U\�\�\�\�\�\�\"�\�Ot��j���͒U&\0�*MS^Z5Mi#���\�Ot��\��\r�U&\0�\"MS^Z5Mb\�B\�T];Ym���\0*@ӔMS^�i��d�\�*\0T��)/���B\�Tm\�jӔ\�~\0�\"4My\�4\��&\�M\�v\0�By\�4\���\�ث̋�\�/^U��{�J\�\�\�o\�\�\�1.},\0Ч4My\�4\���\�:u\�ߗ�pI\�\�x�Ēx\\�/\0�\�h�\�i\�+4M�opp\�\�e��EC�;qQ\�\'\�7\0\�\'\�?\�\�\�\�4\����6u\�\�����\�kl�<\��\�SN).\\X\�|\�\�Ž\�\�[���c{\�\�\�i}\�/}\0�h�\�i\�+4M��\�}3ˆiK�\�>}z\�o|�ذaC�Iڕ\�\�q\r�ӣ�\�\��\0�INӔMS^�i\�O\�W�F\Z�#�<�X�jU\�u$�ol��8@�\�4\�EӔWh��\����>ӦM\�Por>\�O7nL{�\����44N\�\�\�\�\r\0LR���h�\�\nMS�)sނ\���6Lu��d\�iA�\�\0�$�iʋ�)�\�4\��\�9�i��\�\�L\�\�\'�#�>�iʋ�)�\�4\��2\�]Qoh\�\"\��mXm�\"}\r\0�$�iꍻ\�k\�\�n�m��\�^�\�\'?�\�\�M�2\�q阠i\�+v\�4u�~\�e[\\Ɣt{�����\�1\�\"\�\�\�\�;�J\�\��6\\�|[<o�Z\0�IF\�\�]e\r\�\�+V|i\�\�\�[\�EUY�?z\�9笙1cƾ\�xMS^�6M��~\�\r+;;m������\�?_��\"\�_�x\�\��\0\0����{V�Z\�\�k\�ޝTu�W�~\�\�SO=w```\��c4MyEc\�4�\��\�hh�v\�<��\�\�\�\�\�ҷo\\\��^\��\�\�\0LB��\�W\�LO]�r\�[��,F\�ԶRY�?p\�q\��\�4\�\�~cx?\�MSS\�T��e}�-�ܒ�u\�*\�\�\�\Z~��\\\0`�\�4��+V|h\�ƍ�\�\"jW6l\�\�\�g�q\���\�\n\�^\�\�ի�\�˗�\�޼ysӘ���\�M\�\"|\��\�\�{\�m\�Q���\�~{\�\�4~\�_4m�\�+��￿i{/b\�ҥq)\�Q��{�s�\�עYJ#��u\�\�\�ׯO߲q�ox\�5\�\�\0&�ŅC̝;�X�n]ZC\�R<&��\�\�;��\�^E���\��/,֬YSkT=\�\�\�\�3\�\�a\�k^\�b޼y\�]w\�U\�q\�\�\�W_]�|\�\�\�K_�ҢlF\�E\���\���\��M7\�T\�\�}\�\�7r��M�����o|cq\�i�\\pAq\�a�\�^\���\�_�p\�	Mc�\�>�\��)\�G}4}\�\�U\�\��6�y\0�\�be�l4~�hѢ{�m۶\�㹊b\�\�\�\�\�3gμ�,�L\�JS4H\�{l\�s���\�/�\��\�3f\�(���\�O{\�\�j�T\��׿�\�������x\�S�R�\�?�S1gΜ\��\��~�lٲ�թO<���>Pk�f͚+�\��\\������\�U�*��\�\�\�=eʔb\�\�\�\��\�_�\�]\�m�F\�\�Ϋ�T=\��M���\�\�X\�O+M��6E\r����;<oM}��&\0�\r\rM-��\�.�u\�\�k\�\�eQuG��ǥ\rJ�\"\�����\�om�\'V���\��\�C����<\��\�-^�\�\�\�WU�ٸ��zh\�\��\�޻�\�Fn?\�\�i��\�\�\Z�h\�\�v4I�\�\�ګx\�+_Y\�\�>\�{\�\�Z�MS4doy\�[j\�V�ڻ\�A�\���7\�5K\rc�\�\0����\�\�\�\�O�7o\�}[�ly����ٲe\�)ﻣ,�N�ȫ\�\�9;ш\�\��\�kMћ\�\��\�*Sl{\�\�^V̞=�\�E\��\�?�X�dIq�\�\�\�y\�sj\�ND47\�x\�;FV�\�𽷾\��#\�?\�IO\Z�=\�[�r\�\�\�}G�\������\�h\�^\�/~\�g=\�Yū_�\�\�\��x�_\�\�\�\�\�h�z\�h\�Oz�]�Tw��\�\0\�kpp\�\r\�s\�\r��֯_ſ�˿,*�_\�\�tl����8/)~\��Gq(]4O�\�T?\'�\�{n�i�\�N?�\�\�jS~\�\r\r\r\�\�GjMU}/x�F�Gc�����D�r\�!zq�\�{\��\�\�\�hƾ�\�o6�\�E��)\�\��Io�k�\���&\0�̕��\�ʦ\�ceuS��\�\�0MS=�\��\�\���Ї>T�`\�GQ;ϩq̴i\�j�G\'�tR\�g�,�Eaq\�=\�/�˛��\�Er\�!��Xi��h\�\�\�\��o\�\Z��?�\�\�%�\\R\\t\�E;4MqNS�z{���\�\��I>\�y�W�~m�F\���+��θ��~\���=O<_<o�Z\0\0��h�\�и/�\�\�3�\�\�\�q��կ�7�\�\rŻ\��\�.\�\'\�*T\\�!.q\�gԚ�h��\�o��\�\�\�кX��C\��\�\'��\��\'<a�\�ⰿ�\�G#�\�j�~�\�\�g�uV\�st3v\�419�M\�\��o|\�i�3.b�\�\�\�K_\0\0c\�\�)\�i�\�\�s��\\\�\�\�2+M\�\\sM\��뮻��\�W�Z�=.\�\�M�0\�\�\�b�)\�=�C\�\�p�����h\���\���s�b\�\�\�Ѥ��\�xc\��+.e�\�\'>�v���\�\�\�\�\��n����L�:\�\�\�\r\�\�\�ӋU�V�=Ϙ\���M�V_e*\��\�\�\0\0�\��ijl\\~\��o�\�w��\�/�5Q�\�⼣8�\�u�{]\���\�gk�\�\�\�\�\�\��\�5]��q�]��7\�xc\�\�/~�x\�+^Q\\y啵�\�\�\�\�׾\��\�3��L\�|���^�>���i\�?e3��\�\�\�Ji\\\\d<\�~>�\�omXeZ�>7\0\0\�`g\rG/\"\Z�g?�ٵ�hR\"\�\�s\�ڥ��>\�~�\�Wk��9\����,�\�\���t\�\�\�\�#V����}\�!V�^]�\�\�^����\�S64\�֛�O|\�cn�\�\�\��\�\nS\�?�\'}n\0\0\��D6M�F�\�\�:�\�s�Z\�h\�\�\�\�4\���S�\�W66�6�8�\�P�x\\�\�\�h\�?}N\0\0\�\�dh�����U673�8\�).\�\�\�U\�b\\�o<�i��f�\�\0�8\�4\�����}\�i}C\�S��)��R,\\����\�k\�\���c{\�\�pY\�z��\�\0\����B\�\��_^6<%\r\�\�\�E��t\�\0\0t��)�\�4U\�\�ˑ/i\���%.+\0\�c���B\�T={�\�\�\����\�˟W�q�\�)~^�}�\��>\0�\�4\��&\0\0Ȍ�)�\�4\0@f4My��	\0\02�i\�+4M\0\0�MS^�i\0�\�h�\�\nM\0\0dFӔWh�\0\0 3���B\�\0\0�\�4\��&\0\0Ȍ�)�\�4\0@f4My��	\0\02�i\�+4M\0\0�MS^�i\0�\�h�\�\nM\0\0dFӔWh�\0\0 3���B\�\0\0�\�4\��&\0\0Ȍ�)�\�4\0@f4My��	\0\02�i\�+4M\0\0�MS^�i\0�\�,\\�pۦM���w\��(߇;˦is�\0\0hɒ%w�]������[o�\�\�i�*}�\0\0�	�hѢ�/��\�\�\�\�\�8ML��\�ëW��W6L��\�\�\�=\0\0&X\�\�Q\�\�qN�\�yĿ{��k�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�j�������\0\0\0\0IEND�B`�',1),('ea0f18c9-1cde-11ef-96e8-00ff29e62bab',1,'process/performance.bpmn20.xml','ea0f18c8-1cde-11ef-96e8-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>绩效流程</documentation>\n    <startEvent id=\"startEvent1\" name=\"开始节点\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"自评\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"上级评\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"隔级评\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"结束节点\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('ea1d97ba-1cde-11ef-96e8-00ff29e62bab',1,'process/performance.performance-001.png','ea0f18c8-1cde-11ef-96e8-00ff29e62bab',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0\0\0\0�~&\�\0\0\�IDATx^\�\�ߏ\\\�y\�i/��U��?��\�\"Q+ًw�f-\�`[HP�lPq�d�r���\�Ej*��&�\r�k�q05(RL\��H�q{m(6�\�\��\�Nt\�\��\�\�\��\�\�\�#}�\�\�s{�;\�\�ٙ\�^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\�\��\�ɓ\'�\�\�\�\�_MOO\�_�u�\�i�\�7<�\�������th��CR�\�:��\�\�9\�gff��/_\��\�r���\�\�\�\���K\���~~�j�C\��\�D\�\�Q\��t\�\�i\�\�\�ٳg\�7\�H~�j�C\�D��4Q;tT�5�G0\�H:̀����\�\�P=\�!)M\�����\�Q\�\�%���\�N�\�Ii\"v\�Q\���\�|\�\�����\�fҿӲ�vR��B�\�Ii\"v\�Q\�\�\�\�\�\���\�\��QҲ�.��,<�\��\�D\�\�Q�����2o8\�G:\�\��\�D:TWtHJ�C@G�2 �獿�7I\�\�\�\�\�q@\�P]\�!)M\�5ʀx�\��\�\r�AҺ�\��\�D:TWtHJ�C@Gu%\�С��CR��:j��^]��AҺ�\��\�D:TWtHJ�C@G�2 >��?\���u�\�e\�8 t��萔&b���\Ze@̞�\���?�\�y\�!-K\�\�\�\�\�q@\�P]\�!)M\�5ʀH9\�ދ\�DZ�\�N\�q@\�P]\�!)M\�5Ҁ�r��\�\��8o@�eiݼ\�˂q@\�P]\�!)M\�u���\�˯~��y\�a��\�_�Y�D:TWtHJ�C@G\�r@\\�\�?�\���/_\�<o(\�I�I�\��Fy\"�+:�C��\�!���\r�\�=zq�xT�<�\�ҡ\�D\�\�Q\�\�(�^\�*\�s\�\�\�\�8 t��\��&b���\Z6 \�;�;M�==�\�ҡ\�D\�\�Q\��,_\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C\�I+V���{\�g\�\�\�\�+\�\�#M>jҟ�xdn��t��s��+�\��\�D\�\�(\�|\�X�r巛2lr~\�ƍ{_~�\�\�G�}\�O>9\�\�\�??��Ǐ�\�\�\�\��O?�\�/\'&&.�ۧ\�˷�QW\"�+:$��ء�Ӛ�\�t\�tr\�S�槥o6\�\�\�\�Ý;w�\��\�\�3�4�\�:t\�ө��s\�\�㯥\�\�ێʀ�+�\��\�D\�\�0���_�\�I\�vi\�S�\�\'�\�4��\�s\�=\�\�k׮}�_������\�ݻ/\�w\�}\�\�\�}Dd@ԕ�B�\�Ii\"v(77\�/�/:\�\�\�۷o\�OOO\�O�8џ���9\�\�\�\�\�iyZ\�\���b\�BWf>�jJ��ə7\�|\�\�\�sA�;֟���l||��|_\�u%\�С��CR��j���W�ͬ��cǎ�ŋ\�q>T�]��\�\�D�b5mou�/(6\�S\�ǧO��i^\�333�իW�~ժU\�\�\��QW\"�+:$��ء������ԇ~���S�\�>�\�y6l���U����V�X\�Xg\�\�\�\�#����\����+�\��\�D\�P27\�g��7o�q\�ҥ|tߑ\��[�li_�\�F��T�)Ԟ\��Ԧk7\�\�-�={\�\�h~\��E�\�(��q@\�P]\�!)M\�%i\�I-�HH\�\�Yݓ\�\�\�\�\�Q|�\�N�*��jӦMW׬Y\��\"0 \�J\��CuE��4;47\��\�ԅ���V\�\�\�\�Y\�\�Uk�\�\�Ν;�%/\�R8|�p\�ƍ�\�c����+�\��\�D\�P����\�\�B����\�zT\���`ds}\�\�\�\�\��m)�\�Y����>99���Xjg@ԕ�B�\�Ii�uhn\�\�H�\�-�F}u��J\�m�u\�\r��[�aÆ=yɖ\�\�\�?\�ߺu\�\�cYN\�7\�M�2_\�f@ԕ\��ŋIi�u(\���#�\�>�l>�U\��`_i����H�\�z饗^\���ү�7o\����X�\�\��\�\�\�\r��R\�С`\�!)M�5\�v\rn�o߾|</���\�\�\�ʏFҔ\�\�>�ོ`K\�\�ɓ�G}\���X�S\�\�\�\�D]�x@\�P�萔&Z���;X�f\�RJ\�oǻ�Ä\�5\�9s\�ܹ_\�[J.\\\�]�\�j~,\�i\�7\��or��:TytHJ�CM\���Y��\�\�[�?�+��)ϕ�W�~�l)5���$\��X�Ӑo\�<ou%ЀСJ�CR�hZ�j\�\���\�,^Ji��}_ɏFҔ\�\�\�\�\�\�y��R�)kݺu7_u)D]I\�#?G�G�\�Ii\"vh��BS�w�?~:/\�RJ\�[y�\�\�/\�ǲ�\�o\�V޸\'\�ܚC�Q\�מ@�d�\�PoHRk}mѡ\�Oo\��OY�\��%Z�\�\�U�iʳk߾}G\�-�\���m۶�ˏe9\�꛺}�\�D�ސ;\�\��ۭ�=D�\����\��\�\��E�?�!绽�t}m�֡{�\�h\�{�mݺ\���`K)��\�/�\�z~,\�\�V\�\�m��<�!w\�\�e�[_{*a;\�r�\�\�J\�\�Z�\�\�\��\�\��%Z���*᤿111\�i��QwC\�Ϛ5k�o��\�_\�ǲ�n\�M\�V��\�\�r\�\�^v�\���\��C�!翽�t}mѡ\�Oo\��n/+]_[�u����ҋ��e*BhJ\�֡C�>͋�ү��|\�ɯ��i~��}@\�\�\r�so/�\��\�SۀE\�\�\r9�\�e�\�k�-~zC\�w{Y\��\��Ci\�\�ܱcG>�E\�\�`i�1�Y�r巧��\�]�v-\�ڢJ\�\�G�{\�\����\"�}@\�\�\r�so/�\��\�q@\�ޡސ\�\�^V���\�\�\�7\�|�����-;�f�\�\"rbb�\�ԩ|\\I\�K\�\�#\�/?�c\�\�\�\�޽{i~0gϞ=�g�y\�r\�\�?\�\�A\�\"Ooȝ{{\�\�\�מ��\�\����\��\�\��E�?�!绽�t}m�ء���\�3��ܰaC�ҥK�\�^�����֣�{\�}Â�X�\�[\�\��\�cǎ\�ȋ��\�\�NM\�M}8\�w��<\�!ͨ\�kO\�Q{�zC���X\�k�-~zC\�\�b��-;���\�\\D\�.(�l\�R|��>?mg�\�\�\�\�i?��a�V�\\��\�\�\�\�gff\��I\�K���\�\�O\�}FR������B�\�Ii\"vh \��\�\�j��Յ>\r }^��\�U�V]K\�\�\�	Ś������}zt1�\�_���k׮�l�\�O\��Eb@ԕ�B�\�Ii\"v����\\ݾXM\�-M/�\Z\�\�\0\�\�\�\�\�\�IM�i���`\�4%�\�<\�EzN\�B_`�>/}�ڵko>�\�~��u%\�С��CR��\�\�=�zap���\�Zj�\�\��\�\�\���\'����7g{���;-O\�[oA5�H�\�#�\�ccc\�|衇~�iӦ�\�-�F}�\�t�t�\�\��m۶]~\�w\�>\'5g@ԕ�B�\�Ii\"vh�4\�ͽ\�\�do\�N�mXRk֬�\�ƍO>�\��\�\�_�j.<��t���\�SSS���z\�W_}\���A_\�+D]�8 t��萔&b��\�\�[Wr�u9\�-�Xv���\�ضm\��x\�_?\�\�c��[�\�\�sZ֯_�Yvy\�֭\�_|\�ş>|���\�\�D]�8 t��萔&b�F1\��֍���\�|<\�䣹�\�\�\�\�\�\�u�\�TĀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�e@ԕ�B�\�Ii\"v\�(��D:TWtHJ�C@Gu%\�С��CR��:ʀ�+�\��\�D\�\�QD]�8 t��萔&b���2 \�J\��CuE��4;t�QW\"�+:$��\�!����q@\�P]\�!)M\�5==}\�\�\�\�\�\�\�\�97\�J~�j�C\�D��4Q;t\���?����wg%w?��\�ov6\�H~�j�C\�D��4Q;t\����p\���KgϞ=\��\�I\�u?{�\�\�m�\�o�|??G�ӡ\�Ii�w\�t��~�n\�ezn�\�\���{���\�\�\��thy�CR�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��\0\�5<\�\�Q�\0\0\0\0IEND�B`�',1);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8mb3_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('batch.schema.version','7.0.0.0',1),('cfg.execution-related-entities-count','true',1),('cfg.task-related-entities-count','true',1),('common.schema.version','7.0.0.0',1),('entitylink.schema.version','7.0.0.0',1),('eventsubscription.schema.version','7.0.0.0',1),('identitylink.schema.version','7.0.0.0',1),('job.schema.version','7.0.0.0',1),('next.dbid','1',1),('schema.history','upgrade(6.8.1.0->7.0.0.0)',2),('schema.version','7.0.0.0',2),('task.schema.version','7.0.0.0',1),('variable.schema.version','7.0.0.0',1);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
INSERT INTO `act_hi_actinst` VALUES ('0c7d9f11-1e2f-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363',1,0,NULL,''),('0c7d9f12-1e2f-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363',2,0,NULL,''),('0c7d9f13-1e2f-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','fillTask','0c7d9f14-1e2f-11ef-9942-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 10:48:09.363','2024-05-30 12:41:39.155',3,6809792,NULL,''),('0f4dd13c-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:15:19.201','2024-05-29 12:15:19.203',1,2,NULL,''),('0f4e1f5d-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:15:19.203','2024-05-29 12:15:19.203',2,0,NULL,''),('0f4e466e-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','0f4f57df-1d72-11ef-8102-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:15:19.204',NULL,3,NULL,NULL,''),('17ca541c-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:02:23.595','2024-05-30 19:02:23.595',1,0,NULL,''),('17ca7b2d-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 19:02:23.596','2024-05-30 19:02:23.606',2,10,NULL,''),('17cc01ce-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-05-30 19:02:23.606','2024-05-30 19:02:23.606',3,0,NULL,''),('17cc28df-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','directorTak','17cc28e0-1e74-11ef-aa50-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-05-30 19:02:23.607',NULL,4,NULL,NULL,''),('1c088cf5-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',1,0,NULL,''),('1c088cf6-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',2,0,NULL,''),('1c088cf7-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','judgeMore',NULL,NULL,'大于500元','sequenceFlow',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',3,0,NULL,''),('1c08b408-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','bossTask','1c08b409-1e3f-11ef-91f3-00ff29e62bab',NULL,'老板审批','userTask',NULL,'2024-05-30 12:43:07.388',NULL,4,NULL,NULL,''),('1e89b276-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079',1,0,NULL,''),('1e89b277-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079',2,0,NULL,''),('1e89b278-1e42-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','fillTask','1e89b279-1e42-11ef-877e-00ff29e62bab',NULL,'出差报销','userTask','111','2024-05-30 13:04:40.079','2024-05-30 13:06:38.936',3,118857,NULL,''),('33e664a5-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 13:06:27.076','2024-05-29 13:06:27.078',1,2,NULL,''),('33e6d9d6-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 13:06:27.079','2024-05-29 13:06:27.079',2,0,NULL,''),('33e6d9d7-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','33e88788-1d79-11ef-965a-00ff29e62bab',NULL,'自评','userTask',NULL,'2024-05-29 13:06:27.079',NULL,3,NULL,NULL,''),('37435a13-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:23:35.738','2024-05-29 12:23:35.740',1,2,NULL,''),('3743cf44-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:23:35.741','2024-05-29 12:23:35.741',2,0,NULL,''),('3743cf45-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','374507c6-1d73-11ef-bde3-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:23:35.741',NULL,3,NULL,NULL,''),('42480137-1e8a-11ef-8eab-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 21:41:03.811','2024-05-30 21:41:03.811',1,0,NULL,''),('42480138-1e8a-11ef-8eab-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:41:03.811','2024-05-30 21:41:03.811',2,0,NULL,''),('42480139-1e8a-11ef-8eab-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','fillTask','4248013a-1e8a-11ef-8eab-00ff29e62bab',NULL,'出差报销','userTask','243','2024-05-30 21:41:03.811','2024-05-30 21:52:51.037',3,707226,NULL,''),('4d27d3e5-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127',1,0,NULL,''),('4d27d3e6-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127',2,0,NULL,''),('4d27d3e7-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','fillTask','4d27d3e8-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','33','2024-05-30 19:03:53.127',NULL,3,NULL,NULL,''),('5d0ba34c-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-28 21:58:30.022','2024-05-28 21:58:30.025',1,3,NULL,''),('5d0c187d-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-28 21:58:30.025','2024-05-28 21:58:30.025',2,0,NULL,''),('5d0c187e-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','5d0efeaf-1cfa-11ef-aff9-00ff29e62bab',NULL,'自评','userTask','a','2024-05-28 21:58:30.025',NULL,3,NULL,NULL,''),('5ee09c7f-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-06-02 21:45:27.812','2024-06-02 21:45:27.818',1,6,NULL,''),('5ee1adf0-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:45:27.819','2024-06-02 21:45:27.819',2,0,NULL,''),('5ee1adf1-20e6-11ef-8056-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','fillTask','5ee35ba2-20e6-11ef-8056-00ff29e62bab',NULL,'出差报销','userTask','456','2024-06-02 21:45:27.819','2024-06-02 21:47:20.966',3,113147,NULL,''),('62e2c976-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.521',1,2,NULL,''),('62e31797-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:27:39.521','2024-05-30 21:27:39.521',2,0,NULL,''),('62e31798-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','fillTask','62e4ec59-1e88-11ef-bccc-00ff29e62bab',NULL,'出差报销','userTask','434','2024-05-30 21:27:39.521',NULL,3,NULL,NULL,''),('6512b002-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:32:02.091','2024-05-29 12:32:02.092',1,1,NULL,''),('6512fe23-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:32:02.093','2024-05-29 12:32:02.093',2,0,NULL,''),('6512fe24-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','651436a5-1d74-11ef-b1f5-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:32:02.093',NULL,3,NULL,NULL,''),('6561d60d-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:06:38.936','2024-05-30 13:06:38.936',1,0,NULL,''),('6561d60e-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 13:06:38.936','2024-05-30 13:06:38.937',2,1,NULL,''),('6561fd1f-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-05-30 13:06:38.937','2024-05-30 13:06:38.937',3,0,NULL,''),('6561fd20-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','directorTak','6561fd21-1e42-11ef-877e-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-05-30 13:06:38.937',NULL,4,NULL,NULL,''),('6d7023fc-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:04:47.288','2024-05-30 19:04:47.288',1,0,NULL,''),('6d7023fd-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 19:04:47.288','2024-05-30 19:04:47.291',2,3,NULL,''),('6d70992e-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-05-30 19:04:47.291','2024-05-30 19:04:47.291',3,0,NULL,''),('6d70c03f-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','directorTak','6d70c040-1e74-11ef-aa50-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-05-30 19:04:47.292',NULL,4,NULL,NULL,''),('72319b52-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:32:24.104','2024-05-29 12:32:24.106',1,2,NULL,''),('7231e973-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:32:24.106','2024-05-29 12:32:24.106',2,0,NULL,''),('72321084-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','72339725-1d74-11ef-8067-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:32:24.107',NULL,3,NULL,NULL,''),('7798dbc8-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','startEvent1',NULL,NULL,'开始 ','startEvent',NULL,'2024-05-29 17:04:34.045','2024-05-29 17:04:34.047',1,2,NULL,''),('779929e9-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05',NULL,NULL,'流程开始 ','sequenceFlow',NULL,'2024-05-29 17:04:34.047','2024-05-29 17:04:34.047',2,0,NULL,''),('779950fa-1d9a-11ef-b8cc-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','apply','779b25bb-1d9a-11ef-b8cc-00ff29e62bab',NULL,'请假申请 ','userTask','小明','2024-05-29 17:04:34.048','2024-05-29 17:04:34.118',3,70,NULL,''),('77a4266e-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','applyFlow',NULL,NULL,'申请流程 ','sequenceFlow',NULL,'2024-05-29 17:04:34.119','2024-05-29 17:04:34.119',1,0,NULL,''),('77a44d7f-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','teacherPass','77a44d80-1d9a-11ef-b8cc-00ff29e62bab',NULL,'领导审批 ','userTask',NULL,'2024-05-29 17:04:34.120',NULL,2,NULL,NULL,''),('8205f9ae-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 12:38:49.001','2024-05-30 12:38:49.002',1,1,NULL,''),('820620bf-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:38:49.002','2024-05-30 12:38:49.002',2,0,NULL,''),('820620c0-1e3e-11ef-91f3-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','fillTask','8207f581-1e3e-11ef-91f3-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 12:38:49.002','2024-05-30 12:43:07.386',3,258384,NULL,''),('85c6c315-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:05:28.121','2024-05-30 19:05:28.122',1,1,NULL,''),('85c6ea26-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:28.122','2024-05-30 19:05:28.122',2,0,NULL,''),('85c6ea27-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','fillTask','85c6ea28-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','383','2024-05-30 19:05:28.122',NULL,3,NULL,NULL,''),('87a1c4af-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234',1,0,NULL,''),('87a1c4b0-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234',2,0,NULL,''),('87a1c4b1-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','fillTask','87a1c4b2-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','383','2024-05-30 19:05:31.234',NULL,3,NULL,NULL,''),('87f31909-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:05:31.767','2024-05-30 19:05:31.767',1,0,NULL,''),('87f3190a-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:31.767','2024-05-30 19:05:31.767',2,0,NULL,''),('87f3190b-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','fillTask','87f3190c-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','383','2024-05-30 19:05:31.767',NULL,3,NULL,NULL,''),('8842bfb3-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289',1,0,NULL,''),('8842bfb4-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289',2,0,NULL,''),('8842bfb5-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','fillTask','8842bfb6-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','383','2024-05-30 19:05:32.289',NULL,3,NULL,NULL,''),('a252b1b6-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:47:20.967','2024-06-02 21:47:20.967',1,0,NULL,''),('a252b1b7-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-02 21:47:20.967','2024-06-02 21:47:20.970',2,3,NULL,''),('a25326e8-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-06-02 21:47:20.970','2024-06-02 21:47:20.970',3,0,NULL,''),('a25326e9-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','directorTak','a25326ea-20e6-11ef-8056-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-06-02 21:47:20.970',NULL,4,NULL,NULL,''),('a27aff15-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:39:43.455','2024-05-30 12:39:43.455',1,0,NULL,''),('a27aff16-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:39:43.455','2024-05-30 12:39:43.457',2,2,NULL,''),('a27b4d37-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','judgeMore',NULL,NULL,'大于500元','sequenceFlow',NULL,'2024-05-30 12:39:43.457','2024-05-30 12:39:43.457',3,0,NULL,''),('a27b7448-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','bossTask','a27b7449-1e3e-11ef-91f3-00ff29e62bab',NULL,'老板审批','userTask',NULL,'2024-05-30 12:39:43.458',NULL,4,NULL,NULL,''),('b0f4d79c-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-28 19:01:53.383','2024-05-28 19:01:53.386',1,3,NULL,''),('b0f54ccd-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-28 19:01:53.386','2024-05-28 19:01:53.386',2,0,NULL,''),('b0f573de-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b0f6854f-1ce1-11ef-94ed-00ff29e62bab',NULL,'自评','userTask','a','2024-05-28 19:01:53.387',NULL,3,NULL,NULL,''),('b2ec222e-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040',1,0,NULL,''),('b2ec222f-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040',2,0,NULL,''),('b2ec2230-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','fillTask','b2ec2231-1e3e-11ef-91f3-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 12:40:11.040',NULL,3,NULL,NULL,''),('b8fcbb7c-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:27:13.379','2024-05-29 12:27:13.381',1,2,NULL,''),('b8fd30ad-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:27:13.382','2024-05-29 12:27:13.382',2,0,NULL,''),('b8fd30ae-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b8fe692f-1d73-11ef-880e-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:27:13.382',NULL,3,NULL,NULL,''),('c0ed8adb-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 18:59:57.864','2024-05-30 18:59:57.866',1,2,NULL,''),('c0edd8fc-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 18:59:57.866','2024-05-30 18:59:57.866',2,0,NULL,''),('c0edd8fd-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','fillTask','c0effbde-1e73-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','222','2024-05-30 18:59:57.866','2024-05-30 19:02:23.595',3,145729,NULL,''),('c8887ef0-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-06-02 21:48:25.073','2024-06-02 21:48:25.075',1,2,NULL,''),('c888cd11-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:48:25.075','2024-06-02 21:48:25.075',2,0,NULL,''),('c888f422-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','fillTask','c88a2ca3-20e6-11ef-a633-00ff29e62bab',NULL,'出差报销','userTask','456','2024-06-02 21:48:25.076',NULL,3,NULL,NULL,''),('c91d1b06-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 13:02:16.761','2024-05-30 13:02:16.762',1,1,NULL,''),('c91d6927-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:02:16.763','2024-05-30 13:02:16.763',2,0,NULL,''),('c91d6928-1e41-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','fillTask','c91f16d9-1e41-11ef-877e-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 13:02:16.763','2024-05-30 13:03:37.272',3,80509,NULL,''),('cc84d196-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','startEvent1',NULL,NULL,'开始 ','startEvent',NULL,'2024-05-30 20:54:49.259','2024-05-30 20:54:49.260',1,1,NULL,''),('cc8546c7-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05',NULL,NULL,'流程开始 ','sequenceFlow',NULL,'2024-05-30 20:54:49.261','2024-05-30 20:54:49.261',2,0,NULL,''),('cc8546c8-1e83-11ef-a97f-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','apply','cc86cd69-1e83-11ef-a97f-00ff29e62bab',NULL,'请假申请 ','userTask','小明','2024-05-30 20:54:49.261','2024-05-30 20:54:49.320',3,59,NULL,''),('cc8e477c-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','applyFlow',NULL,NULL,'申请流程 ','sequenceFlow',NULL,'2024-05-30 20:54:49.320','2024-05-30 20:54:49.320',1,0,NULL,''),('cc8e6e8d-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','teacherPass','cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',NULL,'领导审批 ','userTask',NULL,'2024-05-30 20:54:49.321',NULL,2,NULL,NULL,''),('ddc3e5b5-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245',1,0,NULL,''),('ddc3e5b6-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245',2,0,NULL,''),('ddc3e5b7-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','fillTask','ddc3e5b8-1e73-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','222','2024-05-30 19:00:46.245','2024-05-30 19:04:47.288',3,241043,NULL,''),('e7719175-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:41:39.156','2024-05-30 12:41:39.156',1,0,NULL,''),('e7719176-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:41:39.156','2024-05-30 12:41:39.157',2,1,NULL,''),('e771b887-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','judgeMore',NULL,NULL,'大于500元','sequenceFlow',NULL,'2024-05-30 12:41:39.157','2024-05-30 12:41:39.157',3,0,NULL,''),('e771b888-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','bossTask','e771b889-1e3e-11ef-91f3-00ff29e62bab',NULL,'老板审批','userTask',NULL,'2024-05-30 12:41:39.157',NULL,4,NULL,NULL,''),('e7d26f63-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:52:51.039','2024-05-30 21:52:51.039',1,0,NULL,''),('e7d2bd84-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 21:52:51.041','2024-05-30 21:52:51.050',2,9,NULL,''),('e7d41d15-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-05-30 21:52:51.050','2024-05-30 21:52:51.050',3,0,NULL,''),('e7d44426-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','directorTak','e7d44427-1e8b-11ef-bdf1-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-05-30 21:52:51.051',NULL,4,NULL,NULL,''),('eb6ecaa7-1e2e-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 10:47:13.901','2024-05-30 10:47:13.903',1,2,NULL,''),('eb6f18c8-1e2e-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 10:47:13.903','2024-05-30 10:47:13.903',2,0,NULL,''),('eb6f3fd9-1e2e-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','fillTask','eb70785a-1e2e-11ef-9942-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 10:47:13.904','2024-05-30 12:39:43.455',3,6749551,NULL,''),('f35f8cb7-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:14:32.341','2024-05-29 12:14:32.343',1,2,NULL,''),('f36001e8-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:32.344','2024-05-29 12:14:32.344',2,0,NULL,''),('f36001e9-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','f361888a-1d71-11ef-8ae9-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:14:32.344',NULL,3,NULL,NULL,''),('f91a430d-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:03:37.273','2024-05-30 13:03:37.273',1,0,NULL,''),('f91a430e-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 13:03:37.273','2024-05-30 13:03:37.277',2,4,NULL,''),('f91adf4f-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','judgeMore',NULL,NULL,'大于500元','sequenceFlow',NULL,'2024-05-30 13:03:37.277','2024-05-30 13:03:37.277',3,0,NULL,''),('f91b0660-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','bossTask','f91b0661-1e41-11ef-877e-00ff29e62bab',NULL,'su审批','userTask',NULL,'2024-05-30 13:03:37.278',NULL,4,NULL,NULL,''),('fb3ded7e-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372',1,0,NULL,''),('fb3ded7f-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372',2,0,NULL,''),('fb3ded80-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','fillTask','fb3ded81-1e3e-11ef-91f3-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 12:42:12.372',NULL,3,NULL,NULL,''),('fb651444-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:14:45.799','2024-05-29 12:14:45.801',1,2,NULL,''),('fb658975-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:45.802','2024-05-29 12:14:45.802',2,0,NULL,''),('fb658976-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fb66c1f7-1d71-11ef-8e79-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:14:45.802',NULL,3,NULL,NULL,''),('fc7b3f3c-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:14:47.622','2024-05-29 12:14:47.622',1,0,NULL,''),('fc7b3f3d-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:47.622','2024-05-29 12:14:47.622',2,0,NULL,''),('fc7b3f3e-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fc7b3f3f-1d71-11ef-8e79-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:14:47.622',NULL,3,NULL,NULL,'');
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  `TIME_` datetime(3) NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_entitylink`
--

DROP TABLE IF EXISTS `act_hi_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_entitylink` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_HI_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_entitylink`
--

LOCK TABLES `act_hi_entitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_entitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
INSERT INTO `act_hi_identitylink` VALUES ('0c7dc625-1e2f-11ef-9942-00ff29e62bab',NULL,'assignee','123','0c7d9f14-1e2f-11ef-9942-00ff29e62bab','2024-05-30 10:48:09.364',NULL,NULL,NULL,NULL,NULL),('0c7dc626-1e2f-11ef-9942-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 10:48:09.364','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL),('0f4f7ef0-1d72-11ef-8102-00ff29e62bab',NULL,'assignee','a','0f4f57df-1d72-11ef-8102-00ff29e62bab','2024-05-29 12:15:19.212',NULL,NULL,NULL,NULL,NULL),('0f4f7ef1-1d72-11ef-8102-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:15:19.212','0f4dd13a-1d72-11ef-8102-00ff29e62bab',NULL,NULL,NULL,NULL),('1e89b27a-1e42-11ef-877e-00ff29e62bab',NULL,'assignee','111','1e89b279-1e42-11ef-877e-00ff29e62bab','2024-05-30 13:04:40.079',NULL,NULL,NULL,NULL,NULL),('1e89b27b-1e42-11ef-877e-00ff29e62bab',NULL,'participant','111',NULL,'2024-05-30 13:04:40.079','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL),('37452ed7-1d73-11ef-bde3-00ff29e62bab',NULL,'assignee','a','374507c6-1d73-11ef-bde3-00ff29e62bab','2024-05-29 12:23:35.750',NULL,NULL,NULL,NULL,NULL),('37452ed8-1d73-11ef-bde3-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:23:35.751','37435a11-1d73-11ef-bde3-00ff29e62bab',NULL,NULL,NULL,NULL),('4248013b-1e8a-11ef-8eab-00ff29e62bab',NULL,'assignee','243','4248013a-1e8a-11ef-8eab-00ff29e62bab','2024-05-30 21:41:03.811',NULL,NULL,NULL,NULL,NULL),('4248284c-1e8a-11ef-8eab-00ff29e62bab',NULL,'participant','243',NULL,'2024-05-30 21:41:03.812','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL),('4d27d3e9-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','33','4d27d3e8-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:03:53.127',NULL,NULL,NULL,NULL,NULL),('4d27d3ea-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','33',NULL,'2024-05-30 19:03:53.127','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('5d0f25c0-1cfa-11ef-aff9-00ff29e62bab',NULL,'assignee','a','5d0efeaf-1cfa-11ef-aff9-00ff29e62bab','2024-05-28 21:58:30.045',NULL,NULL,NULL,NULL,NULL),('5d0f4cd1-1cfa-11ef-aff9-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-28 21:58:30.046','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',NULL,NULL,NULL,NULL),('5ee3a9c3-20e6-11ef-8056-00ff29e62bab',NULL,'assignee','456','5ee35ba2-20e6-11ef-8056-00ff29e62bab','2024-06-02 21:45:27.832',NULL,NULL,NULL,NULL,NULL),('5ee3d0d4-20e6-11ef-8056-00ff29e62bab',NULL,'participant','456',NULL,'2024-06-02 21:45:27.833','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL),('62e53a7a-1e88-11ef-bccc-00ff29e62bab',NULL,'assignee','434','62e4ec59-1e88-11ef-bccc-00ff29e62bab','2024-05-30 21:27:39.535',NULL,NULL,NULL,NULL,NULL),('62e5618b-1e88-11ef-bccc-00ff29e62bab',NULL,'participant','434',NULL,'2024-05-30 21:27:39.536','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL),('65145db6-1d74-11ef-b1f5-00ff29e62bab',NULL,'assignee','a','651436a5-1d74-11ef-b1f5-00ff29e62bab','2024-05-29 12:32:02.102',NULL,NULL,NULL,NULL,NULL),('65145db7-1d74-11ef-b1f5-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:32:02.102','651288f0-1d74-11ef-b1f5-00ff29e62bab',NULL,NULL,NULL,NULL),('7233be36-1d74-11ef-8067-00ff29e62bab',NULL,'assignee','a','72339725-1d74-11ef-8067-00ff29e62bab','2024-05-29 12:32:24.118',NULL,NULL,NULL,NULL,NULL),('7233e547-1d74-11ef-8067-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:32:24.119','72317440-1d74-11ef-8067-00ff29e62bab',NULL,NULL,NULL,NULL),('779b73dc-1d9a-11ef-b8cc-00ff29e62bab',NULL,'assignee','小明','779b25bb-1d9a-11ef-b8cc-00ff29e62bab','2024-05-29 17:04:34.062',NULL,NULL,NULL,NULL,NULL),('779b73dd-1d9a-11ef-b8cc-00ff29e62bab',NULL,'participant','小明',NULL,'2024-05-29 17:04:34.062','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL),('77a44d81-1d9a-11ef-b8cc-00ff29e62bab','a','candidate',NULL,'77a44d80-1d9a-11ef-b8cc-00ff29e62bab','2024-05-29 17:04:34.120',NULL,NULL,NULL,NULL,NULL),('82081c92-1e3e-11ef-91f3-00ff29e62bab',NULL,'assignee','123','8207f581-1e3e-11ef-91f3-00ff29e62bab','2024-05-30 12:38:49.015',NULL,NULL,NULL,NULL,NULL),('8208b8d3-1e3e-11ef-91f3-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 12:38:49.019','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL),('85c6ea29-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','383','85c6ea28-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:05:28.122',NULL,NULL,NULL,NULL,NULL),('85c6ea2a-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','383',NULL,'2024-05-30 19:05:28.123','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('87a1c4b3-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','383','87a1c4b2-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:05:31.234',NULL,NULL,NULL,NULL,NULL),('87a1ebc4-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','383',NULL,'2024-05-30 19:05:31.235','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('87f3190d-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','383','87f3190c-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:05:31.767',NULL,NULL,NULL,NULL,NULL),('87f3190e-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','383',NULL,'2024-05-30 19:05:31.767','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('8842e6c7-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','383','8842bfb6-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:05:32.290',NULL,NULL,NULL,NULL,NULL),('8842e6c8-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','383',NULL,'2024-05-30 19:05:32.290','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('b0f6ac60-1ce1-11ef-94ed-00ff29e62bab',NULL,'assignee','a','b0f6854f-1ce1-11ef-94ed-00ff29e62bab','2024-05-28 19:01:53.395',NULL,NULL,NULL,NULL,NULL),('b0f6ac61-1ce1-11ef-94ed-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-28 19:01:53.396','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',NULL,NULL,NULL,NULL),('b2ec4942-1e3e-11ef-91f3-00ff29e62bab',NULL,'assignee','123','b2ec2231-1e3e-11ef-91f3-00ff29e62bab','2024-05-30 12:40:11.041',NULL,NULL,NULL,NULL,NULL),('b2ec4943-1e3e-11ef-91f3-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 12:40:11.041','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL),('b8fe6930-1d73-11ef-880e-00ff29e62bab',NULL,'assignee','a','b8fe692f-1d73-11ef-880e-00ff29e62bab','2024-05-29 12:27:13.390',NULL,NULL,NULL,NULL,NULL),('b8fe9041-1d73-11ef-880e-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:27:13.391','b8fcbb7a-1d73-11ef-880e-00ff29e62bab',NULL,NULL,NULL,NULL),('c0effbdf-1e73-11ef-aa50-00ff29e62bab',NULL,'assignee','222','c0effbde-1e73-11ef-aa50-00ff29e62bab','2024-05-30 18:59:57.880',NULL,NULL,NULL,NULL,NULL),('c0effbe0-1e73-11ef-aa50-00ff29e62bab',NULL,'participant','222',NULL,'2024-05-30 18:59:57.880','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('c88a7ac4-20e6-11ef-a633-00ff29e62bab',NULL,'assignee','456','c88a2ca3-20e6-11ef-a633-00ff29e62bab','2024-06-02 21:48:25.086',NULL,NULL,NULL,NULL,NULL),('c88ac8e5-20e6-11ef-a633-00ff29e62bab',NULL,'participant','456',NULL,'2024-06-02 21:48:25.088','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL),('c91f3dea-1e41-11ef-877e-00ff29e62bab',NULL,'assignee','123','c91f16d9-1e41-11ef-877e-00ff29e62bab','2024-05-30 13:02:16.775',NULL,NULL,NULL,NULL,NULL),('c91f3deb-1e41-11ef-877e-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 13:02:16.775','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL),('cc871b8a-1e83-11ef-a97f-00ff29e62bab',NULL,'assignee','小明','cc86cd69-1e83-11ef-a97f-00ff29e62bab','2024-05-30 20:54:49.273',NULL,NULL,NULL,NULL,NULL),('cc871b8b-1e83-11ef-a97f-00ff29e62bab',NULL,'participant','小明',NULL,'2024-05-30 20:54:49.273','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL),('cc8e6e8f-1e83-11ef-a97f-00ff29e62bab','a','candidate',NULL,'cc8e6e8e-1e83-11ef-a97f-00ff29e62bab','2024-05-30 20:54:49.321',NULL,NULL,NULL,NULL,NULL),('ddc3e5b9-1e73-11ef-aa50-00ff29e62bab',NULL,'assignee','222','ddc3e5b8-1e73-11ef-aa50-00ff29e62bab','2024-05-30 19:00:46.245',NULL,NULL,NULL,NULL,NULL),('ddc3e5ba-1e73-11ef-aa50-00ff29e62bab',NULL,'participant','222',NULL,'2024-05-30 19:00:46.245','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('eb709f6b-1e2e-11ef-9942-00ff29e62bab',NULL,'assignee','123','eb70785a-1e2e-11ef-9942-00ff29e62bab','2024-05-30 10:47:13.913',NULL,NULL,NULL,NULL,NULL),('eb709f6c-1e2e-11ef-9942-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 10:47:13.913','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL),('f361af9b-1d71-11ef-8ae9-00ff29e62bab',NULL,'assignee','a','f361888a-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:14:32.355',NULL,NULL,NULL,NULL,NULL),('f361af9c-1d71-11ef-8ae9-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:14:32.355','f35f65a5-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL),('fb3ded82-1e3e-11ef-91f3-00ff29e62bab',NULL,'assignee','123','fb3ded81-1e3e-11ef-91f3-00ff29e62bab','2024-05-30 12:42:12.372',NULL,NULL,NULL,NULL,NULL),('fb3ded83-1e3e-11ef-91f3-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 12:42:12.372','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL),('fb66c1f8-1d71-11ef-8e79-00ff29e62bab',NULL,'assignee','a','fb66c1f7-1d71-11ef-8e79-00ff29e62bab','2024-05-29 12:14:45.810',NULL,NULL,NULL,NULL,NULL),('fb66e909-1d71-11ef-8e79-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:14:45.811','fb651442-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL),('fc7b3f40-1d71-11ef-8e79-00ff29e62bab',NULL,'assignee','a','fc7b3f3f-1d71-11ef-8e79-00ff29e62bab','2024-05-29 12:14:47.622',NULL,NULL,NULL,NULL,NULL),('fc7b3f41-1d71-11ef-8e79-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:14:47.622','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDX_HI_PRO_SUPER_PROCINST` (`SUPER_PROCESS_INSTANCE_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
INSERT INTO `act_hi_procinst` VALUES ('0c7d50ed-1e2f-11ef-9942-00ff29e62bab',1,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','2024-05-30 10:48:09.361',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('0f4dd13a-1d72-11ef-8102-00ff29e62bab',1,'0f4dd13a-1d72-11ef-8102-00ff29e62bab',NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:15:19.201',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1e89b272-1e42-11ef-877e-00ff29e62bab',1,'1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 13:04:40.079',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('33e63d93-1d79-11ef-965a-00ff29e62bab',1,'33e63d93-1d79-11ef-965a-00ff29e62bab',NULL,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','2024-05-29 13:06:27.075',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('37435a11-1d73-11ef-bde3-00ff29e62bab',1,'37435a11-1d73-11ef-bde3-00ff29e62bab',NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:23:35.738',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4247da21-1e8a-11ef-8eab-00ff29e62bab',1,'4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 21:41:03.810',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4d27acd1-1e74-11ef-aa50-00ff29e62bab',1,'4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 19:03:53.126',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',1,'5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',NULL,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','2024-05-28 21:58:30.021',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5ee02749-20e6-11ef-8056-00ff29e62bab',1,'5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-06-02 21:45:27.809',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('62e2a260-1e88-11ef-bccc-00ff29e62bab',1,'62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 21:27:39.518',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('651288f0-1d74-11ef-b1f5-00ff29e62bab',1,'651288f0-1d74-11ef-b1f5-00ff29e62bab',NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:32:02.090',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('72317440-1d74-11ef-8067-00ff29e62bab',1,'72317440-1d74-11ef-8067-00ff29e62bab',NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:32:24.103',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',1,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','2024-05-29 17:04:34.044',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8205d29a-1e3e-11ef-91f3-00ff29e62bab',1,'8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','2024-05-30 12:38:49.000',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('85c6c311-1e74-11ef-aa50-00ff29e62bab',1,'85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 19:05:28.121',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('87a1c4ab-1e74-11ef-aa50-00ff29e62bab',1,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 19:05:31.234',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('87f2f1f5-1e74-11ef-aa50-00ff29e62bab',1,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 19:05:31.766',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('8842989f-1e74-11ef-aa50-00ff29e62bab',1,'8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 19:05:32.288',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',1,'b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',NULL,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','2024-05-28 19:01:53.383',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b2ec222a-1e3e-11ef-91f3-00ff29e62bab',1,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','2024-05-30 12:40:11.040',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('b8fcbb7a-1d73-11ef-880e-00ff29e62bab',1,'b8fcbb7a-1d73-11ef-880e-00ff29e62bab',NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:27:13.379',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c0ec5257-1e73-11ef-aa50-00ff29e62bab',1,'c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 18:59:57.856',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c88830ca-20e6-11ef-a633-00ff29e62bab',1,'c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-06-02 21:48:25.071',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c91ccce2-1e41-11ef-877e-00ff29e62bab',1,'c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 13:02:16.759',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc84aa82-1e83-11ef-a97f-00ff29e62bab',1,'cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','2024-05-30 20:54:49.257',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',1,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','2024-05-30 19:00:46.245',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('eb6ea393-1e2e-11ef-9942-00ff29e62bab',1,'eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','2024-05-30 10:47:13.900',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('f35f65a5-1d71-11ef-8ae9-00ff29e62bab',1,'f35f65a5-1d71-11ef-8ae9-00ff29e62bab',NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:14:32.340',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',1,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','2024-05-30 12:42:12.371',NULL,NULL,NULL,'start',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('fb651442-1d71-11ef-8e79-00ff29e62bab',1,'fb651442-1d71-11ef-8e79-00ff29e62bab',NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:14:45.799',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',1,'fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:14:47.622',NULL,NULL,NULL,'startEvent1',NULL,NULL,NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
INSERT INTO `act_hi_taskinst` VALUES ('0c7d9f14-1e2f-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'123','2024-05-30 10:48:09.363',NULL,'2024-05-30 12:41:39.152',6809789,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:41:39.152'),('0f4f57df-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-29 12:15:19.204',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:15:19.212'),('17cc28e0-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,NULL,NULL,'2024-05-30 19:02:23.607',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:02:23.607'),('1c08b409-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'bossTask','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'老板审批',NULL,NULL,NULL,NULL,'2024-05-30 12:43:07.388',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:43:07.388'),('1e89b279-1e42-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'111','2024-05-30 13:04:40.079',NULL,'2024-05-30 13:06:38.935',118856,NULL,50,NULL,NULL,NULL,'','2024-05-30 13:06:38.935'),('33e88788-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,NULL,'2024-05-29 13:06:27.079',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 13:06:27.090'),('374507c6-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-29 12:23:35.741',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:23:35.750'),('4248013a-1e8a-11ef-8eab-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'243','2024-05-30 21:41:03.811',NULL,'2024-05-30 21:52:51.034',707223,NULL,50,NULL,NULL,NULL,'','2024-05-30 21:52:51.034'),('4d27d3e8-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'33','2024-05-30 19:03:53.127',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:03:53.127'),('5d0efeaf-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-28 21:58:30.025',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-28 21:58:30.045'),('5ee35ba2-20e6-11ef-8056-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'456','2024-06-02 21:45:27.819',NULL,'2024-06-02 21:47:20.963',113144,NULL,50,NULL,NULL,NULL,'','2024-06-02 21:47:20.963'),('62e4ec59-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'434','2024-05-30 21:27:39.521',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 21:27:39.534'),('651436a5-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-29 12:32:02.093',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:32:02.102'),('6561fd21-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,NULL,NULL,'2024-05-30 13:06:38.937',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 13:06:38.937'),('6d70c040-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,NULL,NULL,'2024-05-30 19:04:47.292',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:04:47.292'),('72339725-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-29 12:32:24.107',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:32:24.118'),('779b25bb-1d9a-11ef-b8cc-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'apply','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'请假申请',NULL,NULL,NULL,'小明','2024-05-29 17:04:34.048',NULL,'2024-05-29 17:04:34.116',68,NULL,50,NULL,NULL,NULL,'','2024-05-29 17:04:34.116'),('77a44d80-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'teacherPass','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'领导审批',NULL,NULL,NULL,NULL,'2024-05-29 17:04:34.120',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 17:04:34.120'),('8207f581-1e3e-11ef-91f3-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'123','2024-05-30 12:38:49.002',NULL,'2024-05-30 12:43:07.384',258382,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:43:07.384'),('85c6ea28-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'383','2024-05-30 19:05:28.122',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:05:28.122'),('87a1c4b2-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'383','2024-05-30 19:05:31.234',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:05:31.234'),('87f3190c-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'383','2024-05-30 19:05:31.767',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:05:31.767'),('8842bfb6-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'383','2024-05-30 19:05:32.289',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:05:32.290'),('a25326ea-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,NULL,NULL,'2024-06-02 21:47:20.970',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-06-02 21:47:20.970'),('a27b7449-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'bossTask','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'老板审批',NULL,NULL,NULL,NULL,'2024-05-30 12:39:43.458',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:39:43.458'),('b0f6854f-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-28 19:01:53.387',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-28 19:01:53.395'),('b2ec2231-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'123','2024-05-30 12:40:11.040',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:40:11.040'),('b8fe692f-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-29 12:27:13.382',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:27:13.390'),('c0effbde-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'222','2024-05-30 18:59:57.866',NULL,'2024-05-30 19:02:23.592',145726,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:02:23.592'),('c88a2ca3-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'456','2024-06-02 21:48:25.076',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-06-02 21:48:25.085'),('c91f16d9-1e41-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'123','2024-05-30 13:02:16.763',NULL,'2024-05-30 13:03:37.269',80506,NULL,50,NULL,NULL,NULL,'','2024-05-30 13:03:37.269'),('cc86cd69-1e83-11ef-a97f-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'apply','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'请假申请',NULL,NULL,NULL,'小明','2024-05-30 20:54:49.261',NULL,'2024-05-30 20:54:49.317',56,NULL,50,NULL,NULL,NULL,'','2024-05-30 20:54:49.317'),('cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'teacherPass','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'领导审批',NULL,NULL,NULL,NULL,'2024-05-30 20:54:49.321',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 20:54:49.321'),('ddc3e5b8-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'222','2024-05-30 19:00:46.245',NULL,'2024-05-30 19:04:47.286',241041,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:04:47.286'),('e771b889-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'bossTask','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'老板审批',NULL,NULL,NULL,NULL,'2024-05-30 12:41:39.157',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:41:39.157'),('e7d44427-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,NULL,NULL,'2024-05-30 21:52:51.051',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 21:52:51.052'),('eb70785a-1e2e-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'123','2024-05-30 10:47:13.904',NULL,'2024-05-30 12:39:43.452',6749548,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:39:43.452'),('f361888a-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-29 12:14:32.344',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:14:32.355'),('f91b0661-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'bossTask','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'su审批',NULL,NULL,NULL,NULL,'2024-05-30 13:03:37.278',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 13:03:37.278'),('fb3ded81-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,NULL,'123','2024-05-30 12:42:12.372',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:42:12.372'),('fb66c1f7-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-29 12:14:45.802',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:14:45.810'),('fc7b3f3f-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,NULL,'a','2024-05-29 12:14:47.622',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:14:47.622');
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_tsk_log`
--

DROP TABLE IF EXISTS `act_hi_tsk_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_tsk_log` (
  `ID_` bigint NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DATA_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_tsk_log`
--

LOCK TABLES `act_hi_tsk_log` WRITE;
/*!40000 ALTER TABLE `act_hi_tsk_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_tsk_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_EXE` (`EXECUTION_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
INSERT INTO `act_hi_varinst` VALUES ('0c7d9f0e-1e2f-11ef-9942-00ff29e62bab',0,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363'),('0c7d9f0f-1e2f-11ef-9942-00ff29e62bab',0,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363'),('17c9b7db-1e74-11ef-aa50-00ff29e62bab',0,'c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'驳回',NULL,NULL,'2024-05-30 19:02:23.592','2024-05-30 19:02:23.592'),('1c07f0b4-1e3f-11ef-91f3-00ff29e62bab',0,'8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL,'2024-05-30 12:43:07.383','2024-05-30 12:43:07.383'),('1e89b273-1e42-11ef-877e-00ff29e62bab',0,'1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,10,'10',NULL,NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079'),('1e89b274-1e42-11ef-877e-00ff29e62bab',0,'1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'111',NULL,NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079'),('4247da22-1e8a-11ef-8eab-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL,'2024-05-30 21:41:03.810','2024-05-30 21:41:03.810'),('4247da23-1e8a-11ef-8eab-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'descption','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-30 21:41:03.810','2024-05-30 21:41:03.810'),('4247da24-1e8a-11ef-8eab-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'user','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-30 21:41:03.810','2024-05-30 21:41:03.810'),('4247da25-1e8a-11ef-8eab-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'243',NULL,NULL,'2024-05-30 21:41:03.810','2024-05-30 21:41:03.810'),('4d27d3e2-1e74-11ef-aa50-00ff29e62bab',0,'4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127'),('4d27d3e3-1e74-11ef-aa50-00ff29e62bab',0,'4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'33',NULL,NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127'),('5ee04e5a-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL,'2024-06-02 21:45:27.811','2024-06-02 21:45:27.811'),('5ee0756b-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'descption','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-02 21:45:27.811','2024-06-02 21:45:27.811'),('5ee0756c-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'user','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-02 21:45:27.811','2024-06-02 21:45:27.811'),('5ee0756d-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'456',NULL,NULL,'2024-06-02 21:45:27.812','2024-06-02 21:45:27.812'),('62e2a261-1e88-11ef-bccc-00ff29e62bab',0,'62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.519'),('62e2c972-1e88-11ef-bccc-00ff29e62bab',0,'62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'descption','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.519'),('62e2c973-1e88-11ef-bccc-00ff29e62bab',0,'62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'user','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.519'),('62e2c974-1e88-11ef-bccc-00ff29e62bab',0,'62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'434',NULL,NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.519'),('6561aefc-1e42-11ef-877e-00ff29e62bab',0,'1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL,'2024-05-30 13:06:38.935','2024-05-30 13:06:38.935'),('6d6fd5db-1e74-11ef-aa50-00ff29e62bab',0,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'驳回',NULL,NULL,'2024-05-30 19:04:47.286','2024-05-30 19:04:47.286'),('7798b4b5-1d9a-11ef-b8cc-00ff29e62bab',0,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,'studentUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'小明',NULL,NULL,'2024-05-29 17:04:34.045','2024-05-29 17:04:34.045'),('7798dbc6-1d9a-11ef-b8cc-00ff29e62bab',0,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,'day','integer',NULL,NULL,NULL,NULL,NULL,5,'5',NULL,NULL,'2024-05-29 17:04:34.045','2024-05-29 17:04:34.045'),('8205d29b-1e3e-11ef-91f3-00ff29e62bab',0,'8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 12:38:49.000','2024-05-30 12:38:49.000'),('8205d29c-1e3e-11ef-91f3-00ff29e62bab',0,'8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 12:38:49.000','2024-05-30 12:38:49.000'),('85c6c312-1e74-11ef-aa50-00ff29e62bab',0,'85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:05:28.121','2024-05-30 19:05:28.121'),('85c6c313-1e74-11ef-aa50-00ff29e62bab',0,'85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL,'2024-05-30 19:05:28.121','2024-05-30 19:05:28.121'),('87a1c4ac-1e74-11ef-aa50-00ff29e62bab',0,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234'),('87a1c4ad-1e74-11ef-aa50-00ff29e62bab',0,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234'),('87f2f1f6-1e74-11ef-aa50-00ff29e62bab',0,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:05:31.766','2024-05-30 19:05:31.766'),('87f2f1f7-1e74-11ef-aa50-00ff29e62bab',0,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL,'2024-05-30 19:05:31.766','2024-05-30 19:05:31.766'),('8842bfb0-1e74-11ef-aa50-00ff29e62bab',0,'8842989f-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289'),('8842bfb1-1e74-11ef-aa50-00ff29e62bab',0,'8842989f-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289'),('a2521575-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL,'2024-06-02 21:47:20.963','2024-06-02 21:47:20.963'),('a27a89e4-1e3e-11ef-91f3-00ff29e62bab',0,'eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL,'2024-05-30 12:39:43.452','2024-05-30 12:39:43.452'),('b2ec222b-1e3e-11ef-91f3-00ff29e62bab',0,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040'),('b2ec222c-1e3e-11ef-91f3-00ff29e62bab',0,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040'),('c0ec5258-1e73-11ef-aa50-00ff29e62bab',0,'c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,222,'222',NULL,NULL,'2024-05-30 18:59:57.864','2024-05-30 18:59:57.864'),('c0ed8ad9-1e73-11ef-aa50-00ff29e62bab',0,'c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'222',NULL,NULL,'2024-05-30 18:59:57.864','2024-05-30 18:59:57.864'),('c88830cb-20e6-11ef-a633-00ff29e62bab',0,'c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL,'2024-06-02 21:48:25.072','2024-06-02 21:48:25.072'),('c88857dc-20e6-11ef-a633-00ff29e62bab',0,'c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'descption','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-02 21:48:25.072','2024-06-02 21:48:25.072'),('c88857dd-20e6-11ef-a633-00ff29e62bab',0,'c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'user','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-02 21:48:25.073','2024-06-02 21:48:25.073'),('c8887eee-20e6-11ef-a633-00ff29e62bab',0,'c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'456',NULL,NULL,'2024-06-02 21:48:25.073','2024-06-02 21:48:25.073'),('c91cf3f3-1e41-11ef-877e-00ff29e62bab',0,'c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 13:02:16.761','2024-05-30 13:02:16.761'),('c91d1b04-1e41-11ef-877e-00ff29e62bab',0,'c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 13:02:16.761','2024-05-30 13:02:16.761'),('cc84d193-1e83-11ef-a97f-00ff29e62bab',0,'cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,'studentUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'小明',NULL,NULL,'2024-05-30 20:54:49.258','2024-05-30 20:54:49.258'),('cc84d194-1e83-11ef-a97f-00ff29e62bab',0,'cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,'day','integer',NULL,NULL,NULL,NULL,NULL,5,'5',NULL,NULL,'2024-05-30 20:54:49.258','2024-05-30 20:54:49.258'),('ddc3e5b2-1e73-11ef-aa50-00ff29e62bab',0,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,222,'222',NULL,NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245'),('ddc3e5b3-1e73-11ef-aa50-00ff29e62bab',0,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'222',NULL,NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245'),('e770f534-1e3e-11ef-91f3-00ff29e62bab',0,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL,'2024-05-30 12:41:39.152','2024-05-30 12:41:39.152'),('e7d15df2-1e8b-11ef-bdf1-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL,'2024-05-30 21:52:51.033','2024-05-30 21:52:51.033'),('eb6ea394-1e2e-11ef-9942-00ff29e62bab',0,'eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 10:47:13.901','2024-05-30 10:47:13.901'),('eb6ecaa5-1e2e-11ef-9942-00ff29e62bab',0,'eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 10:47:13.901','2024-05-30 10:47:13.901'),('f919a6cc-1e41-11ef-877e-00ff29e62bab',0,'c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL,'2024-05-30 13:03:37.269','2024-05-30 13:03:37.269'),('fb3ded7b-1e3e-11ef-91f3-00ff29e62bab',0,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372'),('fb3ded7c-1e3e-11ef-91f3-00ff29e62bab',0,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372');
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_bytearray`
--

DROP TABLE IF EXISTS `act_id_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_bytearray` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_bytearray`
--

LOCK TABLES `act_id_bytearray` WRITE;
/*!40000 ALTER TABLE `act_id_bytearray` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `GROUP_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_priv`
--

DROP TABLE IF EXISTS `act_id_priv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_priv` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PRIV_NAME` (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_priv`
--

LOCK TABLES `act_id_priv` WRITE;
/*!40000 ALTER TABLE `act_id_priv` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_priv_mapping`
--

DROP TABLE IF EXISTS `act_id_priv_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_priv_mapping` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `PRIV_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_PRIV_MAPPING` (`PRIV_ID_`),
  KEY `ACT_IDX_PRIV_USER` (`USER_ID_`),
  KEY `ACT_IDX_PRIV_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_PRIV_MAPPING` FOREIGN KEY (`PRIV_ID_`) REFERENCES `act_id_priv` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_priv_mapping`
--

LOCK TABLES `act_id_priv_mapping` WRITE;
/*!40000 ALTER TABLE `act_id_priv_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_priv_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_property`
--

DROP TABLE IF EXISTS `act_id_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_property` (
  `NAME_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `VALUE_` varchar(300) COLLATE utf8mb3_bin DEFAULT NULL,
  `REV_` int DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_property`
--

LOCK TABLES `act_id_property` WRITE;
/*!40000 ALTER TABLE `act_id_property` DISABLE KEYS */;
INSERT INTO `act_id_property` VALUES ('schema.version','7.0.0.0',1);
/*!40000 ALTER TABLE `act_id_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_token`
--

DROP TABLE IF EXISTS `act_id_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_token` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TOKEN_VALUE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TOKEN_DATE_` timestamp(3) NULL DEFAULT NULL,
  `IP_ADDRESS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `USER_AGENT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TOKEN_DATA_` varchar(2000) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_token`
--

LOCK TABLES `act_id_token` WRITE;
/*!40000 ALTER TABLE `act_id_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DISPLAY_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:57:45.245',NULL,NULL,'1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab',NULL),('21f94fef-1d79-11ef-965a-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-29 05:05:57.001',NULL,NULL,'21f94fef-1d79-11ef-965a-00ff29e62bab',NULL),('276aafe0-1ce0-11ef-90dc-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:50:53.133',NULL,NULL,'276aafe0-1ce0-11ef-90dc-00ff29e62bab',NULL),('28499e34-1ce0-11ef-90dc-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:50:54.594',NULL,NULL,'28499e34-1ce0-11ef-90dc-00ff29e62bab',NULL),('3250903a-1cdf-11ef-a741-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:44:01.920',NULL,NULL,'3250903a-1cdf-11ef-a741-00ff29e62bab',NULL),('3b19cb33-1ce1-11ef-bf3b-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:58:35.654',NULL,NULL,'3b19cb33-1ce1-11ef-bf3b-00ff29e62bab',NULL),('43be2116-1cfa-11ef-aff9-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 13:57:47.571',NULL,NULL,'43be2116-1cfa-11ef-aff9-00ff29e62bab',NULL),('64ac108d-1cde-11ef-95cf-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:38:16.909',NULL,NULL,'64ac108d-1cde-11ef-95cf-00ff29e62bab',NULL),('6eb91d51-1d71-11ef-8ae9-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-29 04:10:49.791',NULL,NULL,'6eb91d51-1d71-11ef-8ae9-00ff29e62bab',NULL),('7708d0c0-1d9a-11ef-b8cc-00ff29e62bab','SpringBootAutoDeployment',NULL,NULL,'','2024-05-29 09:04:33.099',NULL,NULL,'7708d0c0-1d9a-11ef-b8cc-00ff29e62bab',NULL),('94f81149-1cdd-11ef-95cf-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:32:28.441',NULL,NULL,'94f81149-1cdd-11ef-95cf-00ff29e62bab',NULL),('a51f04ba-1ce0-11ef-962e-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:54:24.030',NULL,NULL,'a51f04ba-1ce0-11ef-962e-00ff29e62bab',NULL),('c4eeb38e-1e41-11ef-877e-00ff29e62bab','SpringBootAutoDeployment',NULL,NULL,'','2024-05-30 05:02:09.743',NULL,NULL,'c4eeb38e-1e41-11ef-877e-00ff29e62bab',NULL),('ce700574-1cde-11ef-96e8-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:41:14.354',NULL,NULL,'ce700574-1cde-11ef-96e8-00ff29e62bab',NULL),('e61a32af-1e2e-11ef-9942-00ff29e62bab','SpringBootAutoDeployment',NULL,NULL,'','2024-05-30 02:47:04.950',NULL,NULL,'e61a32af-1e2e-11ef-9942-00ff29e62bab',NULL),('ea0f18c8-1cde-11ef-96e8-00ff29e62bab','绩效流程',NULL,NULL,'','2024-05-28 10:42:00.695',NULL,NULL,'ea0f18c8-1cde-11ef-96e8-00ff29e62bab',NULL);
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `VERSION_` int NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DERIVED_FROM_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DERIVED_FROM_ROOT_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DERIVED_VERSION_` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`DERIVED_VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',1,'http://www.flowable.org/processdef','ExpenseProcess','Expense',1,'e61a32af-1e2e-11ef-9942-00ff29e62bab','D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.Expense.png','报销流程',0,1,1,'',NULL,NULL,NULL,0),('Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',1,'http://www.flowable.org/processdef','ExpenseProcess','Expense',2,'c4eeb38e-1e41-11ef-877e-00ff29e62bab','D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.Expense.png','报销流程',0,1,1,'',NULL,NULL,NULL,0),('leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',1,'http://www.flowable.org/processdef','公司员工请假流程','leave',1,'7708d0c0-1d9a-11ef-b8cc-00ff29e62bab','D:\\ProgramWorks\\JavaProjects\\qj\\target\\classes\\processes\\公司员工调休流程.bpmn20.xml','D:\\ProgramWorks\\JavaProjects\\qj\\target\\classes\\processes\\公司员工调休流程.leave.png','公司员工请假流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:10:3b236826-1ce1-11ef-bf3b-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',10,'3b19cb33-1ce1-11ef-bf3b-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',11,'43be2116-1cfa-11ef-aff9-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',12,'6eb91d51-1d71-11ef-8ae9-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',13,'21f94fef-1d79-11ef-965a-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:1:951ed32c-1cdd-11ef-95cf-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',1,'94f81149-1cdd-11ef-95cf-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:2:64b3d8c0-1cde-11ef-95cf-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',2,'64ac108d-1cde-11ef-95cf-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:3:ceae46f7-1cde-11ef-96e8-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',3,'ce700574-1cde-11ef-96e8-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:4:ea1e0ceb-1cde-11ef-96e8-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',4,'ea0f18c8-1cde-11ef-96e8-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:5:326d8e1d-1cdf-11ef-a741-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',5,'3250903a-1cdf-11ef-a741-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:6:27867543-1ce0-11ef-90dc-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',6,'276aafe0-1ce0-11ef-90dc-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:7:285229b7-1ce0-11ef-90dc-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',7,'28499e34-1ce0-11ef-90dc-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:8:a53c029d-1ce0-11ef-962e-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',8,'a51f04ba-1ce0-11ef-962e-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0),('performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',9,'1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','绩效流程',0,1,1,'',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_actinst`
--

DROP TABLE IF EXISTS `act_ru_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_actinst` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT '1',
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_TIME_` datetime(3) NOT NULL,
  `END_TIME_` datetime(3) DEFAULT NULL,
  `DURATION_` bigint DEFAULT NULL,
  `TRANSACTION_ORDER_` int DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_ACTI_START` (`START_TIME_`),
  KEY `ACT_IDX_RU_ACTI_END` (`END_TIME_`),
  KEY `ACT_IDX_RU_ACTI_PROC` (`PROC_INST_ID_`),
  KEY `ACT_IDX_RU_ACTI_PROC_ACT` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC` (`EXECUTION_ID_`),
  KEY `ACT_IDX_RU_ACTI_EXEC_ACT` (`EXECUTION_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_RU_ACTI_TASK` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_actinst`
--

LOCK TABLES `act_ru_actinst` WRITE;
/*!40000 ALTER TABLE `act_ru_actinst` DISABLE KEYS */;
INSERT INTO `act_ru_actinst` VALUES ('0c7d9f11-1e2f-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363',0,1,NULL,''),('0c7d9f12-1e2f-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363',0,2,NULL,''),('0c7d9f13-1e2f-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','fillTask','0c7d9f14-1e2f-11ef-9942-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 10:48:09.363','2024-05-30 12:41:39.155',6809792,3,NULL,''),('0f4dd13c-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:15:19.201','2024-05-29 12:15:19.203',2,1,NULL,''),('0f4e1f5d-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:15:19.203','2024-05-29 12:15:19.203',0,2,NULL,''),('0f4e466e-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','0f4f57df-1d72-11ef-8102-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:15:19.204',NULL,NULL,3,NULL,''),('17ca541c-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:02:23.595','2024-05-30 19:02:23.595',0,1,NULL,''),('17ca7b2d-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 19:02:23.596','2024-05-30 19:02:23.606',10,2,NULL,''),('17cc01ce-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-05-30 19:02:23.606','2024-05-30 19:02:23.606',0,3,NULL,''),('17cc28df-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','directorTak','17cc28e0-1e74-11ef-aa50-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-05-30 19:02:23.607',NULL,NULL,4,NULL,''),('1c088cf5-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',0,1,NULL,''),('1c088cf6-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',0,2,NULL,''),('1c088cf7-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','judgeMore',NULL,NULL,'大于500元','sequenceFlow',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',0,3,NULL,''),('1c08b408-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','bossTask','1c08b409-1e3f-11ef-91f3-00ff29e62bab',NULL,'老板审批','userTask',NULL,'2024-05-30 12:43:07.388',NULL,NULL,4,NULL,''),('1e89b276-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079',0,1,NULL,''),('1e89b277-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079',0,2,NULL,''),('1e89b278-1e42-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','fillTask','1e89b279-1e42-11ef-877e-00ff29e62bab',NULL,'出差报销','userTask','111','2024-05-30 13:04:40.079','2024-05-30 13:06:38.936',118857,3,NULL,''),('33e664a5-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 13:06:27.076','2024-05-29 13:06:27.078',2,1,NULL,''),('33e6d9d6-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 13:06:27.079','2024-05-29 13:06:27.079',0,2,NULL,''),('33e6d9d7-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','33e88788-1d79-11ef-965a-00ff29e62bab',NULL,'自评','userTask',NULL,'2024-05-29 13:06:27.079',NULL,NULL,3,NULL,''),('37435a13-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:23:35.738','2024-05-29 12:23:35.740',2,1,NULL,''),('3743cf44-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:23:35.741','2024-05-29 12:23:35.741',0,2,NULL,''),('3743cf45-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','374507c6-1d73-11ef-bde3-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:23:35.741',NULL,NULL,3,NULL,''),('42480137-1e8a-11ef-8eab-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 21:41:03.811','2024-05-30 21:41:03.811',0,1,NULL,''),('42480138-1e8a-11ef-8eab-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:41:03.811','2024-05-30 21:41:03.811',0,2,NULL,''),('42480139-1e8a-11ef-8eab-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','fillTask','4248013a-1e8a-11ef-8eab-00ff29e62bab',NULL,'出差报销','userTask','243','2024-05-30 21:41:03.811','2024-05-30 21:52:51.037',707226,3,NULL,''),('4d27d3e5-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127',0,1,NULL,''),('4d27d3e6-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127',0,2,NULL,''),('4d27d3e7-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','fillTask','4d27d3e8-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','33','2024-05-30 19:03:53.127',NULL,NULL,3,NULL,''),('5d0ba34c-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-28 21:58:30.022','2024-05-28 21:58:30.025',3,1,NULL,''),('5d0c187d-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-28 21:58:30.025','2024-05-28 21:58:30.025',0,2,NULL,''),('5d0c187e-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','5d0efeaf-1cfa-11ef-aff9-00ff29e62bab',NULL,'自评','userTask','a','2024-05-28 21:58:30.025',NULL,NULL,3,NULL,''),('5ee09c7f-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-06-02 21:45:27.812','2024-06-02 21:45:27.818',6,1,NULL,''),('5ee1adf0-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:45:27.819','2024-06-02 21:45:27.819',0,2,NULL,''),('5ee1adf1-20e6-11ef-8056-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','fillTask','5ee35ba2-20e6-11ef-8056-00ff29e62bab',NULL,'出差报销','userTask','456','2024-06-02 21:45:27.819','2024-06-02 21:47:20.966',113147,3,NULL,''),('62e2c976-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.521',2,1,NULL,''),('62e31797-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:27:39.521','2024-05-30 21:27:39.521',0,2,NULL,''),('62e31798-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','fillTask','62e4ec59-1e88-11ef-bccc-00ff29e62bab',NULL,'出差报销','userTask','434','2024-05-30 21:27:39.521',NULL,NULL,3,NULL,''),('6512b002-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:32:02.091','2024-05-29 12:32:02.092',1,1,NULL,''),('6512fe23-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:32:02.093','2024-05-29 12:32:02.093',0,2,NULL,''),('6512fe24-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','651436a5-1d74-11ef-b1f5-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:32:02.093',NULL,NULL,3,NULL,''),('6561d60d-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:06:38.936','2024-05-30 13:06:38.936',0,1,NULL,''),('6561d60e-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 13:06:38.936','2024-05-30 13:06:38.937',1,2,NULL,''),('6561fd1f-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-05-30 13:06:38.937','2024-05-30 13:06:38.937',0,3,NULL,''),('6561fd20-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','directorTak','6561fd21-1e42-11ef-877e-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-05-30 13:06:38.937',NULL,NULL,4,NULL,''),('6d7023fc-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:04:47.288','2024-05-30 19:04:47.288',0,1,NULL,''),('6d7023fd-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 19:04:47.288','2024-05-30 19:04:47.291',3,2,NULL,''),('6d70992e-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-05-30 19:04:47.291','2024-05-30 19:04:47.291',0,3,NULL,''),('6d70c03f-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','directorTak','6d70c040-1e74-11ef-aa50-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-05-30 19:04:47.292',NULL,NULL,4,NULL,''),('72319b52-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:32:24.104','2024-05-29 12:32:24.106',2,1,NULL,''),('7231e973-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:32:24.106','2024-05-29 12:32:24.106',0,2,NULL,''),('72321084-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','72339725-1d74-11ef-8067-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:32:24.107',NULL,NULL,3,NULL,''),('7798dbc8-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','startEvent1',NULL,NULL,'开始 ','startEvent',NULL,'2024-05-29 17:04:34.045','2024-05-29 17:04:34.047',2,1,NULL,''),('779929e9-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05',NULL,NULL,'流程开始 ','sequenceFlow',NULL,'2024-05-29 17:04:34.047','2024-05-29 17:04:34.047',0,2,NULL,''),('779950fa-1d9a-11ef-b8cc-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','apply','779b25bb-1d9a-11ef-b8cc-00ff29e62bab',NULL,'请假申请 ','userTask','小明','2024-05-29 17:04:34.048','2024-05-29 17:04:34.118',70,3,NULL,''),('77a4266e-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','applyFlow',NULL,NULL,'申请流程 ','sequenceFlow',NULL,'2024-05-29 17:04:34.119','2024-05-29 17:04:34.119',0,1,NULL,''),('77a44d7f-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','teacherPass','77a44d80-1d9a-11ef-b8cc-00ff29e62bab',NULL,'领导审批 ','userTask',NULL,'2024-05-29 17:04:34.120',NULL,NULL,2,NULL,''),('8205f9ae-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 12:38:49.001','2024-05-30 12:38:49.002',1,1,NULL,''),('820620bf-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:38:49.002','2024-05-30 12:38:49.002',0,2,NULL,''),('820620c0-1e3e-11ef-91f3-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','fillTask','8207f581-1e3e-11ef-91f3-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 12:38:49.002','2024-05-30 12:43:07.386',258384,3,NULL,''),('85c6c315-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:05:28.121','2024-05-30 19:05:28.122',1,1,NULL,''),('85c6ea26-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:28.122','2024-05-30 19:05:28.122',0,2,NULL,''),('85c6ea27-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','fillTask','85c6ea28-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','383','2024-05-30 19:05:28.122',NULL,NULL,3,NULL,''),('87a1c4af-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234',0,1,NULL,''),('87a1c4b0-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234',0,2,NULL,''),('87a1c4b1-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','fillTask','87a1c4b2-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','383','2024-05-30 19:05:31.234',NULL,NULL,3,NULL,''),('87f31909-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:05:31.767','2024-05-30 19:05:31.767',0,1,NULL,''),('87f3190a-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:31.767','2024-05-30 19:05:31.767',0,2,NULL,''),('87f3190b-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','fillTask','87f3190c-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','383','2024-05-30 19:05:31.767',NULL,NULL,3,NULL,''),('8842bfb3-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289',0,1,NULL,''),('8842bfb4-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289',0,2,NULL,''),('8842bfb5-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','fillTask','8842bfb6-1e74-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','383','2024-05-30 19:05:32.289',NULL,NULL,3,NULL,''),('a252b1b6-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:47:20.967','2024-06-02 21:47:20.967',0,1,NULL,''),('a252b1b7-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-02 21:47:20.967','2024-06-02 21:47:20.970',3,2,NULL,''),('a25326e8-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-06-02 21:47:20.970','2024-06-02 21:47:20.970',0,3,NULL,''),('a25326e9-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','directorTak','a25326ea-20e6-11ef-8056-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-06-02 21:47:20.970',NULL,NULL,4,NULL,''),('a27aff15-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:39:43.455','2024-05-30 12:39:43.455',0,1,NULL,''),('a27aff16-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:39:43.455','2024-05-30 12:39:43.457',2,2,NULL,''),('a27b4d37-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','judgeMore',NULL,NULL,'大于500元','sequenceFlow',NULL,'2024-05-30 12:39:43.457','2024-05-30 12:39:43.457',0,3,NULL,''),('a27b7448-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','bossTask','a27b7449-1e3e-11ef-91f3-00ff29e62bab',NULL,'老板审批','userTask',NULL,'2024-05-30 12:39:43.458',NULL,NULL,4,NULL,''),('b0f4d79c-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-28 19:01:53.383','2024-05-28 19:01:53.386',3,1,NULL,''),('b0f54ccd-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-28 19:01:53.386','2024-05-28 19:01:53.386',0,2,NULL,''),('b0f573de-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b0f6854f-1ce1-11ef-94ed-00ff29e62bab',NULL,'自评','userTask','a','2024-05-28 19:01:53.387',NULL,NULL,3,NULL,''),('b2ec222e-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040',0,1,NULL,''),('b2ec222f-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040',0,2,NULL,''),('b2ec2230-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','fillTask','b2ec2231-1e3e-11ef-91f3-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 12:40:11.040',NULL,NULL,3,NULL,''),('b8fcbb7c-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:27:13.379','2024-05-29 12:27:13.381',2,1,NULL,''),('b8fd30ad-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:27:13.382','2024-05-29 12:27:13.382',0,2,NULL,''),('b8fd30ae-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b8fe692f-1d73-11ef-880e-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:27:13.382',NULL,NULL,3,NULL,''),('c0ed8adb-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 18:59:57.864','2024-05-30 18:59:57.866',2,1,NULL,''),('c0edd8fc-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 18:59:57.866','2024-05-30 18:59:57.866',0,2,NULL,''),('c0edd8fd-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','fillTask','c0effbde-1e73-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','222','2024-05-30 18:59:57.866','2024-05-30 19:02:23.595',145729,3,NULL,''),('c8887ef0-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-06-02 21:48:25.073','2024-06-02 21:48:25.075',2,1,NULL,''),('c888cd11-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:48:25.075','2024-06-02 21:48:25.075',0,2,NULL,''),('c888f422-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','fillTask','c88a2ca3-20e6-11ef-a633-00ff29e62bab',NULL,'出差报销','userTask','456','2024-06-02 21:48:25.076',NULL,NULL,3,NULL,''),('c91d1b06-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 13:02:16.761','2024-05-30 13:02:16.762',1,1,NULL,''),('c91d6927-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:02:16.763','2024-05-30 13:02:16.763',0,2,NULL,''),('c91d6928-1e41-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','fillTask','c91f16d9-1e41-11ef-877e-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 13:02:16.763','2024-05-30 13:03:37.272',80509,3,NULL,''),('cc84d196-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','startEvent1',NULL,NULL,'开始 ','startEvent',NULL,'2024-05-30 20:54:49.259','2024-05-30 20:54:49.260',1,1,NULL,''),('cc8546c7-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05',NULL,NULL,'流程开始 ','sequenceFlow',NULL,'2024-05-30 20:54:49.261','2024-05-30 20:54:49.261',0,2,NULL,''),('cc8546c8-1e83-11ef-a97f-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','apply','cc86cd69-1e83-11ef-a97f-00ff29e62bab',NULL,'请假申请 ','userTask','小明','2024-05-30 20:54:49.261','2024-05-30 20:54:49.320',59,3,NULL,''),('cc8e477c-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','applyFlow',NULL,NULL,'申请流程 ','sequenceFlow',NULL,'2024-05-30 20:54:49.320','2024-05-30 20:54:49.320',0,1,NULL,''),('cc8e6e8d-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','teacherPass','cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',NULL,'领导审批 ','userTask',NULL,'2024-05-30 20:54:49.321',NULL,NULL,2,NULL,''),('ddc3e5b5-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245',0,1,NULL,''),('ddc3e5b6-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245',0,2,NULL,''),('ddc3e5b7-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','fillTask','ddc3e5b8-1e73-11ef-aa50-00ff29e62bab',NULL,'出差报销','userTask','222','2024-05-30 19:00:46.245','2024-05-30 19:04:47.288',241043,3,NULL,''),('e7719175-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:41:39.156','2024-05-30 12:41:39.156',0,1,NULL,''),('e7719176-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:41:39.156','2024-05-30 12:41:39.157',1,2,NULL,''),('e771b887-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','judgeMore',NULL,NULL,'大于500元','sequenceFlow',NULL,'2024-05-30 12:41:39.157','2024-05-30 12:41:39.157',0,3,NULL,''),('e771b888-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','bossTask','e771b889-1e3e-11ef-91f3-00ff29e62bab',NULL,'老板审批','userTask',NULL,'2024-05-30 12:41:39.157',NULL,NULL,4,NULL,''),('e7d26f63-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:52:51.039','2024-05-30 21:52:51.039',0,1,NULL,''),('e7d2bd84-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 21:52:51.041','2024-05-30 21:52:51.050',9,2,NULL,''),('e7d41d15-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','judgeLess',NULL,NULL,'小于500元','sequenceFlow',NULL,'2024-05-30 21:52:51.050','2024-05-30 21:52:51.050',0,3,NULL,''),('e7d44426-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','directorTak','e7d44427-1e8b-11ef-bdf1-00ff29e62bab',NULL,'ad审批','userTask',NULL,'2024-05-30 21:52:51.051',NULL,NULL,4,NULL,''),('eb6ecaa7-1e2e-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 10:47:13.901','2024-05-30 10:47:13.903',2,1,NULL,''),('eb6f18c8-1e2e-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 10:47:13.903','2024-05-30 10:47:13.903',0,2,NULL,''),('eb6f3fd9-1e2e-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','fillTask','eb70785a-1e2e-11ef-9942-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 10:47:13.904','2024-05-30 12:39:43.455',6749551,3,NULL,''),('f35f8cb7-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:14:32.341','2024-05-29 12:14:32.343',2,1,NULL,''),('f36001e8-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:32.344','2024-05-29 12:14:32.344',0,2,NULL,''),('f36001e9-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','f361888a-1d71-11ef-8ae9-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:14:32.344',NULL,NULL,3,NULL,''),('f91a430d-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:03:37.273','2024-05-30 13:03:37.273',0,1,NULL,''),('f91a430e-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 13:03:37.273','2024-05-30 13:03:37.277',4,2,NULL,''),('f91adf4f-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','judgeMore',NULL,NULL,'大于500元','sequenceFlow',NULL,'2024-05-30 13:03:37.277','2024-05-30 13:03:37.277',0,3,NULL,''),('f91b0660-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','bossTask','f91b0661-1e41-11ef-877e-00ff29e62bab',NULL,'su审批','userTask',NULL,'2024-05-30 13:03:37.278',NULL,NULL,4,NULL,''),('fb3ded7e-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'开始','startEvent',NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372',0,1,NULL,''),('fb3ded7f-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372',0,2,NULL,''),('fb3ded80-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','fillTask','fb3ded81-1e3e-11ef-91f3-00ff29e62bab',NULL,'出差报销','userTask','123','2024-05-30 12:42:12.372',NULL,NULL,3,NULL,''),('fb651444-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:14:45.799','2024-05-29 12:14:45.801',2,1,NULL,''),('fb658975-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:45.802','2024-05-29 12:14:45.802',0,2,NULL,''),('fb658976-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fb66c1f7-1d71-11ef-8e79-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:14:45.802',NULL,NULL,3,NULL,''),('fc7b3f3c-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','startEvent1',NULL,NULL,'开始节点','startEvent',NULL,'2024-05-29 12:14:47.622','2024-05-29 12:14:47.622',0,1,NULL,''),('fc7b3f3d-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:47.622','2024-05-29 12:14:47.622',0,2,NULL,''),('fc7b3f3e-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fc7b3f3f-1d71-11ef-8e79-00ff29e62bab',NULL,'自评','userTask','a','2024-05-29 12:14:47.622',NULL,NULL,3,NULL,'');
/*!40000 ALTER TABLE `act_ru_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_deadletter_job`
--

DROP TABLE IF EXISTS `act_ru_deadletter_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_DEADLETTER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_DJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_DJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_deadletter_job`
--

LOCK TABLES `act_ru_deadletter_job` WRITE;
/*!40000 ALTER TABLE `act_ru_deadletter_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_deadletter_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_entitylink`
--

DROP TABLE IF EXISTS `act_ru_entitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_entitylink` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `LINK_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REF_SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HIERARCHY_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_REF_SCOPE` (`REF_SCOPE_ID_`,`REF_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_ROOT_SCOPE` (`ROOT_SCOPE_ID_`,`ROOT_SCOPE_TYPE_`,`LINK_TYPE_`),
  KEY `ACT_IDX_ENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`,`LINK_TYPE_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_entitylink`
--

LOCK TABLES `act_ru_entitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_entitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_entitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATED_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_IDX_EVENT_SUBSCR_SCOPEREF_` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint DEFAULT NULL,
  `IS_CONCURRENT_` tinyint DEFAULT NULL,
  `IS_SCOPE_` tinyint DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint DEFAULT NULL,
  `IS_MI_ROOT_` tinyint DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `CACHED_ENT_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `START_TIME_` datetime(3) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int DEFAULT NULL,
  `TASK_COUNT_` int DEFAULT NULL,
  `JOB_COUNT_` int DEFAULT NULL,
  `TIMER_JOB_COUNT_` int DEFAULT NULL,
  `SUSP_JOB_COUNT_` int DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int DEFAULT NULL,
  `EXTERNAL_WORKER_JOB_COUNT_` int DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `CALLBACK_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CALLBACK_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REFERENCE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `REFERENCE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BUSINESS_STATUS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_IDX_EXEC_REF_ID_` (`REFERENCE_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
INSERT INTO `act_ru_execution` VALUES ('0c7d50ed-1e2f-11ef-9942-00ff29e62bab',1,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 10:48:09.361',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('0c7d9f10-1e2f-11ef-9942-00ff29e62bab',2,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab','bossTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 10:48:09.363',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('0f4dd13a-1d72-11ef-8102-00ff29e62bab',1,'0f4dd13a-1d72-11ef-8102-00ff29e62bab',NULL,NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'0f4dd13a-1d72-11ef-8102-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 12:15:19.201',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('0f4dd13b-1d72-11ef-8102-00ff29e62bab',1,'0f4dd13a-1d72-11ef-8102-00ff29e62bab',NULL,'0f4dd13a-1d72-11ef-8102-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'0f4dd13a-1d72-11ef-8102-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 12:15:19.201',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('1e89b272-1e42-11ef-877e-00ff29e62bab',1,'1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 13:04:40.079',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('1e89b275-1e42-11ef-877e-00ff29e62bab',2,'1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,'1e89b272-1e42-11ef-877e-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'1e89b272-1e42-11ef-877e-00ff29e62bab','directorTak',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 13:04:40.079',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('33e63d93-1d79-11ef-965a-00ff29e62bab',1,'33e63d93-1d79-11ef-965a-00ff29e62bab',NULL,NULL,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab',NULL,'33e63d93-1d79-11ef-965a-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 13:06:27.075',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('33e664a4-1d79-11ef-965a-00ff29e62bab',1,'33e63d93-1d79-11ef-965a-00ff29e62bab',NULL,'33e63d93-1d79-11ef-965a-00ff29e62bab','performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab',NULL,'33e63d93-1d79-11ef-965a-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 13:06:27.075',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('37435a11-1d73-11ef-bde3-00ff29e62bab',1,'37435a11-1d73-11ef-bde3-00ff29e62bab',NULL,NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'37435a11-1d73-11ef-bde3-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 12:23:35.738',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('37435a12-1d73-11ef-bde3-00ff29e62bab',1,'37435a11-1d73-11ef-bde3-00ff29e62bab',NULL,'37435a11-1d73-11ef-bde3-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'37435a11-1d73-11ef-bde3-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 12:23:35.738',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('4247da21-1e8a-11ef-8eab-00ff29e62bab',1,'4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 21:41:03.810',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('4247da26-1e8a-11ef-8eab-00ff29e62bab',2,'4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'4247da21-1e8a-11ef-8eab-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'4247da21-1e8a-11ef-8eab-00ff29e62bab','directorTak',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 21:41:03.810',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('4d27acd1-1e74-11ef-aa50-00ff29e62bab',1,'4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 19:03:53.126',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('4d27d3e4-1e74-11ef-aa50-00ff29e62bab',1,'4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,'4d27acd1-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'4d27acd1-1e74-11ef-aa50-00ff29e62bab','fillTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 19:03:53.127',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',1,'5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',NULL,NULL,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab',NULL,'5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-28 21:58:30.021',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab',1,'5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',NULL,'5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab',NULL,'5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-28 21:58:30.021',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('5ee02749-20e6-11ef-8056-00ff29e62bab',1,'5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-06-02 21:45:27.809',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('5ee09c7e-20e6-11ef-8056-00ff29e62bab',2,'5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'5ee02749-20e6-11ef-8056-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'5ee02749-20e6-11ef-8056-00ff29e62bab','directorTak',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-06-02 21:45:27.812',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('62e2a260-1e88-11ef-bccc-00ff29e62bab',1,'62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 21:27:39.518',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('62e2c975-1e88-11ef-bccc-00ff29e62bab',1,'62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'62e2a260-1e88-11ef-bccc-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'62e2a260-1e88-11ef-bccc-00ff29e62bab','fillTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 21:27:39.519',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('651288f0-1d74-11ef-b1f5-00ff29e62bab',1,'651288f0-1d74-11ef-b1f5-00ff29e62bab',NULL,NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'651288f0-1d74-11ef-b1f5-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 12:32:02.090',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('6512b001-1d74-11ef-b1f5-00ff29e62bab',1,'651288f0-1d74-11ef-b1f5-00ff29e62bab',NULL,'651288f0-1d74-11ef-b1f5-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'651288f0-1d74-11ef-b1f5-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 12:32:02.091',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('72317440-1d74-11ef-8067-00ff29e62bab',1,'72317440-1d74-11ef-8067-00ff29e62bab',NULL,NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'72317440-1d74-11ef-8067-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 12:32:24.103',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('72319b51-1d74-11ef-8067-00ff29e62bab',1,'72317440-1d74-11ef-8067-00ff29e62bab',NULL,'72317440-1d74-11ef-8067-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'72317440-1d74-11ef-8067-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 12:32:24.104',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',1,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 17:04:34.044',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('7798dbc7-1d9a-11ef-b8cc-00ff29e62bab',2,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','teacherPass',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 17:04:34.045',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('8205d29a-1e3e-11ef-91f3-00ff29e62bab',1,'8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 12:38:49.000',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('8205f9ad-1e3e-11ef-91f3-00ff29e62bab',2,'8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,'8205d29a-1e3e-11ef-91f3-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'8205d29a-1e3e-11ef-91f3-00ff29e62bab','bossTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 12:38:49.001',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('85c6c311-1e74-11ef-aa50-00ff29e62bab',1,'85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 19:05:28.121',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('85c6c314-1e74-11ef-aa50-00ff29e62bab',1,'85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,'85c6c311-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'85c6c311-1e74-11ef-aa50-00ff29e62bab','fillTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 19:05:28.121',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('87a1c4ab-1e74-11ef-aa50-00ff29e62bab',1,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 19:05:31.234',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('87a1c4ae-1e74-11ef-aa50-00ff29e62bab',1,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab','fillTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 19:05:31.234',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('87f2f1f5-1e74-11ef-aa50-00ff29e62bab',1,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 19:05:31.766',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('87f31908-1e74-11ef-aa50-00ff29e62bab',1,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab','fillTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 19:05:31.767',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('8842989f-1e74-11ef-aa50-00ff29e62bab',1,'8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 19:05:32.288',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('8842bfb2-1e74-11ef-aa50-00ff29e62bab',1,'8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,'8842989f-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'8842989f-1e74-11ef-aa50-00ff29e62bab','fillTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 19:05:32.289',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',1,'b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',NULL,NULL,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab',NULL,'b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-28 19:01:53.383',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('b0f4d79b-1ce1-11ef-94ed-00ff29e62bab',1,'b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',NULL,'b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab',NULL,'b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-28 19:01:53.383',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('b2ec222a-1e3e-11ef-91f3-00ff29e62bab',1,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 12:40:11.040',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('b2ec222d-1e3e-11ef-91f3-00ff29e62bab',1,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab','fillTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 12:40:11.040',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('b8fcbb7a-1d73-11ef-880e-00ff29e62bab',1,'b8fcbb7a-1d73-11ef-880e-00ff29e62bab',NULL,NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'b8fcbb7a-1d73-11ef-880e-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 12:27:13.379',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('b8fcbb7b-1d73-11ef-880e-00ff29e62bab',1,'b8fcbb7a-1d73-11ef-880e-00ff29e62bab',NULL,'b8fcbb7a-1d73-11ef-880e-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'b8fcbb7a-1d73-11ef-880e-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 12:27:13.379',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('c0ec5257-1e73-11ef-aa50-00ff29e62bab',1,'c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 18:59:57.856',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('c0ed8ada-1e73-11ef-aa50-00ff29e62bab',2,'c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,'c0ec5257-1e73-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'c0ec5257-1e73-11ef-aa50-00ff29e62bab','directorTak',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 18:59:57.864',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('c88830ca-20e6-11ef-a633-00ff29e62bab',1,'c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-06-02 21:48:25.071',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('c8887eef-20e6-11ef-a633-00ff29e62bab',1,'c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'c88830ca-20e6-11ef-a633-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'c88830ca-20e6-11ef-a633-00ff29e62bab','fillTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-06-02 21:48:25.073',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('c91ccce2-1e41-11ef-877e-00ff29e62bab',1,'c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 13:02:16.759',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('c91d1b05-1e41-11ef-877e-00ff29e62bab',2,'c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,'c91ccce2-1e41-11ef-877e-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'c91ccce2-1e41-11ef-877e-00ff29e62bab','bossTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 13:02:16.761',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('cc84aa82-1e83-11ef-a97f-00ff29e62bab',1,'cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-30 20:54:49.257',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('cc84d195-1e83-11ef-a97f-00ff29e62bab',2,'cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,'cc84aa82-1e83-11ef-a97f-00ff29e62bab','leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'cc84aa82-1e83-11ef-a97f-00ff29e62bab','teacherPass',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 20:54:49.258',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',1,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 19:00:46.245',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('ddc3e5b4-1e73-11ef-aa50-00ff29e62bab',2,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','directorTak',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 19:00:46.245',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('eb6ea393-1e2e-11ef-9942-00ff29e62bab',1,'eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 10:47:13.900',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('eb6ecaa6-1e2e-11ef-9942-00ff29e62bab',2,'eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,'eb6ea393-1e2e-11ef-9942-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'eb6ea393-1e2e-11ef-9942-00ff29e62bab','bossTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 10:47:13.901',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('f35f65a5-1d71-11ef-8ae9-00ff29e62bab',1,'f35f65a5-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'f35f65a5-1d71-11ef-8ae9-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 12:14:32.340',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('f35f8cb6-1d71-11ef-8ae9-00ff29e62bab',1,'f35f65a5-1d71-11ef-8ae9-00ff29e62bab',NULL,'f35f65a5-1d71-11ef-8ae9-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'f35f65a5-1d71-11ef-8ae9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 12:14:32.341',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',1,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'start','2024-05-30 12:42:12.371',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('fb3ded7d-1e3e-11ef-91f3-00ff29e62bab',1,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fillTask',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-30 12:42:12.372',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('fb651442-1d71-11ef-8e79-00ff29e62bab',1,'fb651442-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'fb651442-1d71-11ef-8e79-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 12:14:45.799',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('fb651443-1d71-11ef-8e79-00ff29e62bab',1,'fb651442-1d71-11ef-8e79-00ff29e62bab',NULL,'fb651442-1d71-11ef-8e79-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'fb651442-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 12:14:45.799',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',1,'fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',NULL,1,0,1,0,0,1,NULL,'',NULL,'startEvent1','2024-05-29 12:14:47.622',NULL,NULL,NULL,1,0,0,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL),('fc7b3f3b-1d71-11ef-8e79-00ff29e62bab',1,'fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',NULL,'fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D',1,0,0,0,0,1,NULL,'',NULL,NULL,'2024-05-29 12:14:47.622',NULL,NULL,NULL,1,0,1,0,0,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_external_job`
--

DROP TABLE IF EXISTS `act_ru_external_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_external_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_EXTERNAL_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_EJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_EJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_EXTERNAL_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_external_job`
--

LOCK TABLES `act_ru_external_job` WRITE;
/*!40000 ALTER TABLE `act_ru_external_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_external_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_history_job`
--

DROP TABLE IF EXISTS `act_ru_history_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_history_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ADV_HANDLER_CFG_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_history_job`
--

LOCK TABLES `act_ru_history_job` WRITE;
/*!40000 ALTER TABLE `act_ru_history_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_history_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_IDENT_LNK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
INSERT INTO `act_ru_identitylink` VALUES ('0c7dc626-1e2f-11ef-9942-00ff29e62bab',1,NULL,'participant','123',NULL,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('0f4f7ef1-1d72-11ef-8102-00ff29e62bab',1,NULL,'participant','a',NULL,'0f4dd13a-1d72-11ef-8102-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('1e89b27b-1e42-11ef-877e-00ff29e62bab',1,NULL,'participant','111',NULL,'1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('37452ed8-1d73-11ef-bde3-00ff29e62bab',1,NULL,'participant','a',NULL,'37435a11-1d73-11ef-bde3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('4248284c-1e8a-11ef-8eab-00ff29e62bab',1,NULL,'participant','243',NULL,'4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('4d27d3ea-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','33',NULL,'4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('5d0f4cd1-1cfa-11ef-aff9-00ff29e62bab',1,NULL,'participant','a',NULL,'5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('5ee3d0d4-20e6-11ef-8056-00ff29e62bab',1,NULL,'participant','456',NULL,'5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('62e5618b-1e88-11ef-bccc-00ff29e62bab',1,NULL,'participant','434',NULL,'62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('65145db7-1d74-11ef-b1f5-00ff29e62bab',1,NULL,'participant','a',NULL,'651288f0-1d74-11ef-b1f5-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('7233e547-1d74-11ef-8067-00ff29e62bab',1,NULL,'participant','a',NULL,'72317440-1d74-11ef-8067-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('779b73dd-1d9a-11ef-b8cc-00ff29e62bab',1,NULL,'participant','小明',NULL,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('77a44d81-1d9a-11ef-b8cc-00ff29e62bab',1,'a','candidate',NULL,'77a44d80-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL),('8208b8d3-1e3e-11ef-91f3-00ff29e62bab',1,NULL,'participant','123',NULL,'8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('85c6ea2a-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','383',NULL,'85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('87a1ebc4-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','383',NULL,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('87f3190e-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','383',NULL,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('8842e6c8-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','383',NULL,'8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('b0f6ac61-1ce1-11ef-94ed-00ff29e62bab',1,NULL,'participant','a',NULL,'b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('b2ec4943-1e3e-11ef-91f3-00ff29e62bab',1,NULL,'participant','123',NULL,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('b8fe9041-1d73-11ef-880e-00ff29e62bab',1,NULL,'participant','a',NULL,'b8fcbb7a-1d73-11ef-880e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('c0effbe0-1e73-11ef-aa50-00ff29e62bab',1,NULL,'participant','222',NULL,'c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('c88ac8e5-20e6-11ef-a633-00ff29e62bab',1,NULL,'participant','456',NULL,'c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('c91f3deb-1e41-11ef-877e-00ff29e62bab',1,NULL,'participant','123',NULL,'c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('cc871b8b-1e83-11ef-a97f-00ff29e62bab',1,NULL,'participant','小明',NULL,'cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('cc8e6e8f-1e83-11ef-a97f-00ff29e62bab',1,'a','candidate',NULL,'cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL),('ddc3e5ba-1e73-11ef-aa50-00ff29e62bab',1,NULL,'participant','222',NULL,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('eb709f6c-1e2e-11ef-9942-00ff29e62bab',1,NULL,'participant','123',NULL,'eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('f361af9c-1d71-11ef-8ae9-00ff29e62bab',1,NULL,'participant','a',NULL,'f35f65a5-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('fb3ded83-1e3e-11ef-91f3-00ff29e62bab',1,NULL,'participant','123',NULL,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('fb66e909-1d71-11ef-8e79-00ff29e62bab',1,NULL,'participant','a',NULL,'fb651442-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('fc7b3f41-1d71-11ef-8e79-00ff29e62bab',1,NULL,'participant','a',NULL,'fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_JOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_JOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_suspended_job`
--

DROP TABLE IF EXISTS `act_ru_suspended_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_SUSPENDED_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_SJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_SJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_suspended_job`
--

LOCK TABLES `act_ru_suspended_job` WRITE;
/*!40000 ALTER TABLE `act_ru_suspended_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_suspended_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROPAGATED_STAGE_INST_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PRIORITY_` int DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime(3) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime(3) DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint DEFAULT NULL,
  `VAR_COUNT_` int DEFAULT NULL,
  `ID_LINK_COUNT_` int DEFAULT NULL,
  `SUB_TASK_COUNT_` int DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_IDX_TASK_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TASK_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
INSERT INTO `act_ru_task` VALUES ('0f4f57df-1d72-11ef-8102-00ff29e62bab',1,'0f4dd13b-1d72-11ef-8102-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:15:19.204',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('17cc28e0-1e74-11ef-aa50-00ff29e62bab',1,'c0ed8ada-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-05-30 11:02:23.607',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('1c08b409-1e3f-11ef-91f3-00ff29e62bab',1,'8205f9ad-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'老板审批',NULL,NULL,'bossTask',NULL,'老板',NULL,50,'2024-05-30 04:43:07.388',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('33e88788-1d79-11ef-965a-00ff29e62bab',1,'33e664a4-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,NULL,NULL,50,'2024-05-29 05:06:27.079',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('374507c6-1d73-11ef-bde3-00ff29e62bab',1,'37435a12-1d73-11ef-bde3-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:23:35.741',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('4d27d3e8-1e74-11ef-aa50-00ff29e62bab',1,'4d27d3e4-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,'fillTask',NULL,'33',NULL,50,'2024-05-30 11:03:53.127',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('5d0efeaf-1cfa-11ef-aff9-00ff29e62bab',1,'5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-28 13:58:30.025',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('62e4ec59-1e88-11ef-bccc-00ff29e62bab',1,'62e2c975-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,'fillTask',NULL,'434',NULL,50,'2024-05-30 13:27:39.521',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('651436a5-1d74-11ef-b1f5-00ff29e62bab',1,'6512b001-1d74-11ef-b1f5-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:32:02.093',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('6561fd21-1e42-11ef-877e-00ff29e62bab',1,'1e89b275-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-05-30 05:06:38.937',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('6d70c040-1e74-11ef-aa50-00ff29e62bab',1,'ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-05-30 11:04:47.292',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('72339725-1d74-11ef-8067-00ff29e62bab',1,'72319b51-1d74-11ef-8067-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:32:24.107',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('77a44d80-1d9a-11ef-b8cc-00ff29e62bab',1,'7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'领导审批',NULL,NULL,'teacherPass',NULL,NULL,NULL,50,'2024-05-29 09:04:34.120',NULL,NULL,1,'',NULL,NULL,1,0,1,0),('85c6ea28-1e74-11ef-aa50-00ff29e62bab',1,'85c6c314-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,'fillTask',NULL,'383',NULL,50,'2024-05-30 11:05:28.122',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('87a1c4b2-1e74-11ef-aa50-00ff29e62bab',1,'87a1c4ae-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,'fillTask',NULL,'383',NULL,50,'2024-05-30 11:05:31.234',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('87f3190c-1e74-11ef-aa50-00ff29e62bab',1,'87f31908-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,'fillTask',NULL,'383',NULL,50,'2024-05-30 11:05:31.767',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('8842bfb6-1e74-11ef-aa50-00ff29e62bab',1,'8842bfb2-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,'fillTask',NULL,'383',NULL,50,'2024-05-30 11:05:32.289',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('a25326ea-20e6-11ef-8056-00ff29e62bab',1,'5ee09c7e-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-06-02 13:47:20.970',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('a27b7449-1e3e-11ef-91f3-00ff29e62bab',1,'eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'老板审批',NULL,NULL,'bossTask',NULL,'老板',NULL,50,'2024-05-30 04:39:43.458',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('b0f6854f-1ce1-11ef-94ed-00ff29e62bab',1,'b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-28 11:01:53.387',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('b2ec2231-1e3e-11ef-91f3-00ff29e62bab',1,'b2ec222d-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,'fillTask',NULL,'123',NULL,50,'2024-05-30 04:40:11.040',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('b8fe692f-1d73-11ef-880e-00ff29e62bab',1,'b8fcbb7b-1d73-11ef-880e-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:27:13.382',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('c88a2ca3-20e6-11ef-a633-00ff29e62bab',1,'c8887eef-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,'fillTask',NULL,'456',NULL,50,'2024-06-02 13:48:25.076',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',1,'cc84d195-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'领导审批',NULL,NULL,'teacherPass',NULL,NULL,NULL,50,'2024-05-30 12:54:49.321',NULL,NULL,1,'',NULL,NULL,1,0,1,0),('e771b889-1e3e-11ef-91f3-00ff29e62bab',1,'0c7d9f10-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'老板审批',NULL,NULL,'bossTask',NULL,'老板',NULL,50,'2024-05-30 04:41:39.157',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('e7d44427-1e8b-11ef-bdf1-00ff29e62bab',1,'4247da26-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'ad审批',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-05-30 13:52:51.051',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('f361888a-1d71-11ef-8ae9-00ff29e62bab',1,'f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:14:32.344',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('f91b0661-1e41-11ef-877e-00ff29e62bab',1,'c91d1b05-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'su审批',NULL,NULL,'bossTask',NULL,'su',NULL,50,'2024-05-30 05:03:37.278',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('fb3ded81-1e3e-11ef-91f3-00ff29e62bab',1,'fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'出差报销',NULL,NULL,'fillTask',NULL,'123',NULL,50,'2024-05-30 04:42:12.372',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('fb66c1f7-1d71-11ef-8e79-00ff29e62bab',1,'fb651443-1d71-11ef-8e79-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:14:45.802',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('fc7b3f3f-1d71-11ef-8e79-00ff29e62bab',1,'fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'自评',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:14:47.622',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_timer_job`
--

DROP TABLE IF EXISTS `act_ru_timer_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp(3) NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `ELEMENT_NAME_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_DEFINITION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CORRELATION_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RETRIES_` int DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `DUEDATE_` timestamp(3) NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `CUSTOM_VALUES_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID` (`EXCEPTION_STACK_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID` (`CUSTOM_VALUES_ID_`),
  KEY `ACT_IDX_TIMER_JOB_CORRELATION_ID` (`CORRELATION_ID_`),
  KEY `ACT_IDX_TIMER_JOB_DUEDATE` (`DUEDATE_`),
  KEY `ACT_IDX_TJOB_SCOPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SUB_SCOPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_TJOB_SCOPE_DEF` (`SCOPE_DEFINITION_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_CUSTOM_VALUES` FOREIGN KEY (`CUSTOM_VALUES_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_timer_job`
--

LOCK TABLES `act_ru_timer_job` WRITE;
/*!40000 ALTER TABLE `act_ru_timer_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_timer_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb3_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_RU_VAR_SCOPE_ID_TYPE` (`SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_IDX_RU_VAR_SUB_ID_TYPE` (`SUB_SCOPE_ID_`,`SCOPE_TYPE_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
INSERT INTO `act_ru_variable` VALUES ('0c7d9f0e-1e2f-11ef-9942-00ff29e62bab',1,'integer','money','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('0c7d9f0f-1e2f-11ef-9942-00ff29e62bab',1,'string','taskUser','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('17c9b7db-1e74-11ef-aa50-00ff29e62bab',1,'string','outcome','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'驳回',NULL,NULL),('1c07f0b4-1e3f-11ef-91f3-00ff29e62bab',1,'string','outcome','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL),('1e89b273-1e42-11ef-877e-00ff29e62bab',1,'integer','money','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,10,'10',NULL,NULL),('1e89b274-1e42-11ef-877e-00ff29e62bab',1,'string','taskUser','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111',NULL,NULL),('4247da22-1e8a-11ef-8eab-00ff29e62bab',1,'integer','money','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL),('4247da23-1e8a-11ef-8eab-00ff29e62bab',1,'null','descption','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4247da24-1e8a-11ef-8eab-00ff29e62bab',1,'null','user','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4247da25-1e8a-11ef-8eab-00ff29e62bab',1,'string','taskUser','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'243',NULL,NULL),('4d27d3e2-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('4d27d3e3-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'33',NULL,NULL),('5ee04e5a-20e6-11ef-8056-00ff29e62bab',1,'integer','money','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL),('5ee0756b-20e6-11ef-8056-00ff29e62bab',1,'null','descption','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5ee0756c-20e6-11ef-8056-00ff29e62bab',1,'null','user','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5ee0756d-20e6-11ef-8056-00ff29e62bab',1,'string','taskUser','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'456',NULL,NULL),('62e2a261-1e88-11ef-bccc-00ff29e62bab',1,'integer','money','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL),('62e2c972-1e88-11ef-bccc-00ff29e62bab',1,'null','descption','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('62e2c973-1e88-11ef-bccc-00ff29e62bab',1,'null','user','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('62e2c974-1e88-11ef-bccc-00ff29e62bab',1,'string','taskUser','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'434',NULL,NULL),('6561aefc-1e42-11ef-877e-00ff29e62bab',1,'string','outcome','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL),('6d6fd5db-1e74-11ef-aa50-00ff29e62bab',1,'string','outcome','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'驳回',NULL,NULL),('7798b4b5-1d9a-11ef-b8cc-00ff29e62bab',1,'string','studentUser','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'小明',NULL,NULL),('7798dbc6-1d9a-11ef-b8cc-00ff29e62bab',1,'integer','day','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,5,'5',NULL,NULL),('8205d29b-1e3e-11ef-91f3-00ff29e62bab',1,'integer','money','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('8205d29c-1e3e-11ef-91f3-00ff29e62bab',1,'string','taskUser','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('85c6c312-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('85c6c313-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL),('87a1c4ac-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('87a1c4ad-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL),('87f2f1f6-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('87f2f1f7-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL),('8842bfb0-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','8842989f-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('8842bfb1-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','8842989f-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL),('a2521575-20e6-11ef-8056-00ff29e62bab',1,'string','outcome','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL),('a27a89e4-1e3e-11ef-91f3-00ff29e62bab',1,'string','outcome','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL),('b2ec222b-1e3e-11ef-91f3-00ff29e62bab',1,'integer','money','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('b2ec222c-1e3e-11ef-91f3-00ff29e62bab',1,'string','taskUser','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('c0ec5258-1e73-11ef-aa50-00ff29e62bab',1,'integer','money','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,222,'222',NULL,NULL),('c0ed8ad9-1e73-11ef-aa50-00ff29e62bab',1,'string','taskUser','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'222',NULL,NULL),('c88830cb-20e6-11ef-a633-00ff29e62bab',1,'integer','money','c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL),('c88857dc-20e6-11ef-a633-00ff29e62bab',1,'null','descption','c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c88857dd-20e6-11ef-a633-00ff29e62bab',1,'null','user','c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c8887eee-20e6-11ef-a633-00ff29e62bab',1,'string','taskUser','c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'456',NULL,NULL),('c91cf3f3-1e41-11ef-877e-00ff29e62bab',1,'integer','money','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('c91d1b04-1e41-11ef-877e-00ff29e62bab',1,'string','taskUser','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('cc84d193-1e83-11ef-a97f-00ff29e62bab',1,'string','studentUser','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'小明',NULL,NULL),('cc84d194-1e83-11ef-a97f-00ff29e62bab',1,'integer','day','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,5,'5',NULL,NULL),('ddc3e5b2-1e73-11ef-aa50-00ff29e62bab',1,'integer','money','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,222,'222',NULL,NULL),('ddc3e5b3-1e73-11ef-aa50-00ff29e62bab',1,'string','taskUser','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'222',NULL,NULL),('e770f534-1e3e-11ef-91f3-00ff29e62bab',1,'string','outcome','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL),('e7d15df2-1e8b-11ef-bdf1-00ff29e62bab',1,'string','outcome','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL),('eb6ea394-1e2e-11ef-9942-00ff29e62bab',1,'integer','money','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('eb6ecaa5-1e2e-11ef-9942-00ff29e62bab',1,'string','taskUser','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('f919a6cc-1e41-11ef-877e-00ff29e62bab',1,'string','outcome','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'通过',NULL,NULL),('fb3ded7b-1e3e-11ef-91f3-00ff29e62bab',1,'integer','money','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('fb3ded7c-1e3e-11ef-91f3-00ff29e62bab',1,'string','taskUser','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL);
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dp_name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
INSERT INTO `announcement` VALUES (1,'端午节调休安排','下周连上','研发部门');
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apply`
--

DROP TABLE IF EXISTS `apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `feedback` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apply`
--

LOCK TABLES `apply` WRITE;
/*!40000 ALTER TABLE `apply` DISABLE KEYS */;
INSERT INTO `apply` VALUES (1,'赶火车，请一下午的假，望批','wwwwww',3,'再编个好点的理由'),(2,'我申请加入研发部','wwwwww',1,NULL),(3,'我想加入销售部门','ssssss',1,NULL),(4,'我想加入销售部门','xxxxxx',1,NULL),(5,'我想从销售部门转入研发部门','ssssss',2,NULL),(6,'我想从研发部门转入销售部门','ssssss',1,NULL),(7,'赶火车，请一下午的假，望批','wwwwww',1,NULL);
/*!40000 ALTER TABLE `apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `employee_name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'研发部门','aaaaaa'),(3,'销售部门','zzzzzz'),(4,'销售部门','xxxxxx'),(5,'研发部门','wwwwww');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_channel_definition`
--

DROP TABLE IF EXISTS `flw_channel_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_channel_definition` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CREATE_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `IMPLEMENTATION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_CHANNEL_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_channel_definition`
--

LOCK TABLES `flw_channel_definition` WRITE;
/*!40000 ALTER TABLE `flw_channel_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_channel_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ev_databasechangelog`
--

DROP TABLE IF EXISTS `flw_ev_databasechangelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ev_databasechangelog` (
  `ID` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `AUTHOR` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `FILENAME` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `MD5SUM` varchar(35) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `LABELS` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ev_databasechangelog`
--

LOCK TABLES `flw_ev_databasechangelog` WRITE;
/*!40000 ALTER TABLE `flw_ev_databasechangelog` DISABLE KEYS */;
INSERT INTO `flw_ev_databasechangelog` VALUES ('1','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2024-05-28 12:13:16',1,'EXECUTED','9:63268f536c469325acef35970312551b','createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...','',NULL,'4.9.1',NULL,NULL,'6869595798'),('2','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2024-05-28 12:13:16',2,'EXECUTED','9:dcb58b7dfd6dbda66939123a96985536','addColumn tableName=FLW_CHANNEL_DEFINITION; addColumn tableName=FLW_CHANNEL_DEFINITION','',NULL,'4.9.1',NULL,NULL,'6869595798'),('3','flowable','org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml','2024-05-28 12:13:16',3,'EXECUTED','9:d0c05678d57af23ad93699991e3bf4f6','customChange','',NULL,'4.9.1',NULL,NULL,'6869595798');
/*!40000 ALTER TABLE `flw_ev_databasechangelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ev_databasechangeloglock`
--

DROP TABLE IF EXISTS `flw_ev_databasechangeloglock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ev_databasechangeloglock` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ev_databasechangeloglock`
--

LOCK TABLES `flw_ev_databasechangeloglock` WRITE;
/*!40000 ALTER TABLE `flw_ev_databasechangeloglock` DISABLE KEYS */;
INSERT INTO `flw_ev_databasechangeloglock` VALUES (1,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `flw_ev_databasechangeloglock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_definition`
--

DROP TABLE IF EXISTS `flw_event_definition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_event_definition` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `VERSION_` int DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DESCRIPTION_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_IDX_EVENT_DEF_UNIQ` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_definition`
--

LOCK TABLES `flw_event_definition` WRITE;
/*!40000 ALTER TABLE `flw_event_definition` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_definition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_deployment`
--

DROP TABLE IF EXISTS `flw_event_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_event_deployment` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOY_TIME_` datetime(3) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `PARENT_DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_deployment`
--

LOCK TABLES `flw_event_deployment` WRITE;
/*!40000 ALTER TABLE `flw_event_deployment` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_event_resource`
--

DROP TABLE IF EXISTS `flw_event_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_event_resource` (
  `ID_` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `NAME_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `RESOURCE_BYTES_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_event_resource`
--

LOCK TABLES `flw_event_resource` WRITE;
/*!40000 ALTER TABLE `flw_event_resource` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_event_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ru_batch`
--

DROP TABLE IF EXISTS `flw_ru_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ru_batch` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `BATCH_DOC_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ru_batch`
--

LOCK TABLES `flw_ru_batch` WRITE;
/*!40000 ALTER TABLE `flw_ru_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_ru_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flw_ru_batch_part`
--

DROP TABLE IF EXISTS `flw_ru_batch_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flw_ru_batch_part` (
  `ID_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `REV_` int DEFAULT NULL,
  `BATCH_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `SCOPE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SUB_SCOPE_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SCOPE_TYPE_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `SEARCH_KEY_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `SEARCH_KEY2_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `CREATE_TIME_` datetime(3) NOT NULL,
  `COMPLETE_TIME_` datetime(3) DEFAULT NULL,
  `STATUS_` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  `RESULT_DOC_ID_` varchar(64) COLLATE utf8mb3_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `FLW_IDX_BATCH_PART` (`BATCH_ID_`),
  CONSTRAINT `FLW_FK_BATCH_PART_PARENT` FOREIGN KEY (`BATCH_ID_`) REFERENCES `flw_ru_batch` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flw_ru_batch_part`
--

LOCK TABLES `flw_ru_batch_part` WRITE;
/*!40000 ALTER TABLE `flw_ru_batch_part` DISABLE KEYS */;
/*!40000 ALTER TABLE `flw_ru_batch_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'销售一组'),(2,'研发一组'),(6,'研发二组'),(7,'研发二组');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `process` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'完成第一个小目标','已完成一半啦','研发一组'),(2,'先完成第一个小目标','0','研发二组'),(3,'完成第一个小目标','0','销售一组'),(4,'完成第二个小目标','0','销售二组'),(5,'完成第二个小目标','1','销售二组'),(6,'完成第一个小目标','0','研发一组'),(7,'完成第一个小目标','0','研发一组');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `role` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_pic` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `salt` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dp_name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `group_name` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'qqqqqq','27e5d56d515cdd49af754d800fd8447d','su',NULL,NULL,'FxE0EDD9CSq4',NULL,'2024-05-23 18:25:53','2024-05-23 18:25:53',NULL),(4,'aaaaaa','6bc7ee934038ff6d452c07e86761ba1d','ad','2518016656@qq.com','https://bkimg.cdn.bcebo,m_lfit,limit_1,h_1080','ckVfitA3kXHM',NULL,'2024-06-02 18:18:27','2024-06-02 18:29:05',NULL),(5,'zzzzzz','01d2fc1c6c44f08c696baf42bc968608','ad',NULL,NULL,'SKFyxSqwCr1A',NULL,'2024-05-23 18:35:24','2024-05-23 18:35:24','研发一组'),(6,'wwwwww','7169a6a4ad22c56e108d55cb7d16b2b3','user',NULL,NULL,'kmnNdPwFwv1q',NULL,'2024-05-23 18:35:30','2024-05-23 18:35:30','研发一组'),(7,'ssssss','df2230551ab3ef36ae4fcaa20de150e4','user',NULL,NULL,'7YYtLbCqU1MV',NULL,'2024-05-23 18:35:36','2024-05-23 18:35:36','研发一组'),(8,'xxxxxx','dea9c42fb198bc65ed46d93a945a5c00','user',NULL,NULL,'F3u8wmdmDsiX',NULL,'2024-05-23 18:35:43','2024-05-23 18:35:43','研发二组'),(9,'gggggg','19071c485dc314358f442ed1482eef16','user',NULL,NULL,'kf1amf9B3hXj',NULL,'2024-06-02 16:43:48','2024-06-02 16:43:48',NULL),(10,'gggggz','96329f9cb8722e129f8bd393b0be23be','user',NULL,NULL,'BUmAvhhKUmCs',NULL,'2024-06-02 16:51:34','2024-06-02 16:51:34',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-03 10:52:11
