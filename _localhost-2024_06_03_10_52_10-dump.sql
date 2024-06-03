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
INSERT INTO `act_ge_bytearray` VALUES ('1d0dfda0-1ce1-11ef-bf3b-00ff29e62bab',1,'process/performance.bpmn20.xml','1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('1d26b5c1-1ce1-11ef-bf3b-00ff29e62bab',1,'process/performance.performance-001.png','1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('21f94ff0-1d79-11ef-965a-00ff29e62bab',1,'process/performance.bpmn20.xml','21f94fef-1d79-11ef-965a-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"/>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"/>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"aaaaaa\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"/>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"qqqqqq\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"/>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"/>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"/>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"/>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"/>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"/>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"/>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"/>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"/>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"/>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>\n',0),('2219f751-1d79-11ef-965a-00ff29e62bab',1,'process/performance.performance-001.png','21f94fef-1d79-11ef-965a-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('276aafe1-1ce0-11ef-90dc-00ff29e62bab',1,'process/performance.bpmn20.xml','276aafe0-1ce0-11ef-90dc-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('27862722-1ce0-11ef-90dc-00ff29e62bab',1,'process/performance.performance-001.png','276aafe0-1ce0-11ef-90dc-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('28499e35-1ce0-11ef-90dc-00ff29e62bab',1,'process/performance.bpmn20.xml','28499e34-1ce0-11ef-90dc-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('285202a6-1ce0-11ef-90dc-00ff29e62bab',1,'process/performance.performance-001.png','28499e34-1ce0-11ef-90dc-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('3250903b-1cdf-11ef-a741-00ff29e62bab',1,'process/performance.bpmn20.xml','3250903a-1cdf-11ef-a741-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('326d670c-1cdf-11ef-a741-00ff29e62bab',1,'process/performance.performance-001.png','3250903a-1cdf-11ef-a741-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('3b19cb34-1ce1-11ef-bf3b-00ff29e62bab',1,'process/performance.bpmn20.xml','3b19cb33-1ce1-11ef-bf3b-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('3b222fa5-1ce1-11ef-bf3b-00ff29e62bab',1,'process/performance.performance-001.png','3b19cb33-1ce1-11ef-bf3b-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('43be2117-1cfa-11ef-aff9-00ff29e62bab',1,'process/performance.bpmn20.xml','43be2116-1cfa-11ef-aff9-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('44062698-1cfa-11ef-aff9-00ff29e62bab',1,'process/performance.performance-001.png','43be2116-1cfa-11ef-aff9-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('64ac108e-1cde-11ef-95cf-00ff29e62bab',1,'process/performance.bpmn20.xml','64ac108d-1cde-11ef-95cf-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('64b38a9f-1cde-11ef-95cf-00ff29e62bab',1,'process/performance.performance-001.png','64ac108d-1cde-11ef-95cf-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('6eb94462-1d71-11ef-8ae9-00ff29e62bab',1,'process/performance.bpmn20.xml','6eb91d51-1d71-11ef-8ae9-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('6ee0a283-1d71-11ef-8ae9-00ff29e62bab',1,'process/performance.performance-001.png','6eb91d51-1d71-11ef-8ae9-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('7708d0c1-1d9a-11ef-b8cc-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\qj\\target\\classes\\processes\\å…¬å¸å‘˜å·¥è°ƒä¼‘æµç¨‹.bpmn20.xml','7708d0c0-1d9a-11ef-b8cc-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.1\">\r\n    <process id=\"leave\" name=\"å…¬å¸å‘˜å·¥è¯·å‡æµç¨‹\" isExecutable=\"true\">\r\n        <documentation>å…¬å¸å‘˜å·¥è¯·å‡æµç¨‹</documentation>\r\n        <startEvent id=\"startEvent1\" name=\"å¼€å§‹ \" flowable:formFieldValidation=\"true\"></startEvent>\r\n        <userTask id=\"apply\" name=\"è¯·å‡ç”³è¯· \" flowable:assignee=\"${studentUser}\" flowable:formFieldValidation=\"true\">\r\n            <extensionElements>\r\n                <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\r\n            </extensionElements>\r\n        </userTask>\r\n        <userTask id=\"teacherPass\" name=\"é¢†å¯¼å®¡æ‰¹ \" flowable:candidateGroups=\"a\" flowable:formFieldValidation=\"true\"></userTask>\r\n        <exclusiveGateway id=\"judgeTask\" name=\"åˆ¤æ–­æ˜¯å¦å¤§äº2å¤©\"></exclusiveGateway>\r\n        <sequenceFlow id=\"applyFlow\" name=\"ç”³è¯·æµç¨‹ \" sourceRef=\"apply\" targetRef=\"teacherPass\"></sequenceFlow>\r\n        <userTask id=\"principalPass\" name=\"è€æ¿å®¡æ‰¹\" flowable:candidateGroups=\"b\" flowable:formFieldValidation=\"true\"></userTask>\r\n        <endEvent id=\"sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\" name=\"ç»“æŸ\"></endEvent>\r\n        <sequenceFlow id=\"principalCheck\" name=\"é€šè¿‡\" sourceRef=\"principalPass\" targetRef=\"sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é€šè¿‡\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05\" name=\"æµç¨‹å¼€å§‹ \" sourceRef=\"startEvent1\" targetRef=\"apply\"></sequenceFlow>\r\n        <sequenceFlow id=\"teacherPassFlow\" name=\"é€šè¿‡ \" sourceRef=\"teacherPass\" targetRef=\"judgeTask\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é€šè¿‡\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"teacherNotPassFlow\" name=\"é©³å›\" sourceRef=\"teacherPass\" targetRef=\"apply\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é©³å›\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"judgeLess\" name=\"å°äº2å¤©\" sourceRef=\"judgeTask\" targetRef=\"sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${day<=2}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"judgeMore\" name=\"å¤§äº2å¤© \" sourceRef=\"judgeTask\" targetRef=\"principalPass\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${day>2}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"principalNotPassFlow\" name=\"é©³å› \" sourceRef=\"principalPass\" targetRef=\"apply\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é©³å›\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n    </process>\r\n    <bpmndi:BPMNDiagram id=\"BPMNDiagram_leave\">\r\n        <bpmndi:BPMNPlane bpmnElement=\"leave\" id=\"BPMNPlane_leave\">\r\n            <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\r\n                <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"74.99999776482586\" y=\"159.99999329447763\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"apply\" id=\"BPMNShape_apply\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"254.99999620020395\" y=\"134.99999798834327\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"teacherPass\" id=\"BPMNShape_teacherPass\">\r\n                <omgdc:Bounds height=\"79.99999999999994\" width=\"100.0\" x=\"494.9999926239253\" y=\"134.99999798834327\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"judgeTask\" id=\"BPMNShape_judgeTask\">\r\n                <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"734.9999780952935\" y=\"154.99999567866334\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"principalPass\" id=\"BPMNShape_principalPass\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"704.9999785423283\" y=\"434.999993517995\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\" id=\"BPMNShape_sid-EA94CD8C-3002-421E-BD64-B46EBDD8070F\">\r\n                <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"914.9999863654377\" y=\"160.99999089539082\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNEdge bpmnElement=\"judgeLess\" id=\"BPMNEdge_judgeLess\" flowable:sourceDockerX=\"20.0\" flowable:sourceDockerY=\"20.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\r\n                <omgdi:waypoint x=\"774.9442491776681\" y=\"174.9999951288619\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"914.9999863654377\" y=\"174.9999912788773\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"judgeMore\" id=\"BPMNEdge_judgeMore\" flowable:sourceDockerX=\"20.0\" flowable:sourceDockerY=\"20.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\r\n                <omgdi:waypoint x=\"754.9999781250214\" y=\"194.94667175689042\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"754.9999784827237\" y=\"434.999993517995\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"principalNotPassFlow\" id=\"BPMNEdge_principalNotPassFlow\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\r\n                <omgdi:waypoint x=\"704.9999785423213\" y=\"474.88912948633504\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"304.0\" y=\"474.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"304.86621744522387\" y=\"214.94999798834328\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"teacherNotPassFlow\" id=\"BPMNEdge_teacherNotPassFlow\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"39.99999999999997\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\r\n                <omgdi:waypoint x=\"544.9999926239253\" y=\"134.99999798834327\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"544.9999926239253\" y=\"75.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"306.0\" y=\"75.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"305.3994977262591\" y=\"134.99999798834327\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"applyFlow\" id=\"BPMNEdge_applyFlow\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"39.99999999999997\">\r\n                <omgdi:waypoint x=\"354.94999620020394\" y=\"174.99999798834324\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"494.9999926238438\" y=\"174.99999798834324\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"principalCheck\" id=\"BPMNEdge_principalCheck\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\r\n                <omgdi:waypoint x=\"804.9499785423245\" y=\"474.71097808621374\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"928.0\" y=\"474.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"928.953164519099\" y=\"188.9499145334794\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05\" id=\"BPMNEdge_sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\r\n                <omgdi:waypoint x=\"104.94999736929918\" y=\"174.99999362086504\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"254.99999620020395\" y=\"174.9999968967466\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"teacherPassFlow\" id=\"BPMNEdge_teacherPassFlow\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"39.99999999999997\" flowable:targetDockerX=\"20.0\" flowable:targetDockerY=\"20.0\">\r\n                <omgdi:waypoint x=\"594.949992623855\" y=\"174.9999974384194\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"734.9999775100968\" y=\"174.99999589808294\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n        </bpmndi:BPMNPlane>\r\n    </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('773efbf2-1d9a-11ef-b8cc-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\qj\\target\\classes\\processes\\å…¬å¸å‘˜å·¥è°ƒä¼‘æµç¨‹.leave.png','7708d0c0-1d9a-11ef-b8cc-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0¸\0\0\0\0\0\ß\0Œ\0\0A1IDATx^\í\İ	œ]ey?pjûo­\Õ\Ú\Íjµ¶µZmm«Ukµ.%î¢‚[\ïœ9w’`@@D«  VqWw@)n,¢„\n¸²†M‘%„°I2ÿ\çM\î\È\ğf&™¹Yæœ¼\ß\ï\ç\ó9\Ï]f˜{\Şsß½3w¶\Ú\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0`«­‡•R\í«|-\0@Ñ¦M›\ö{1(ßŸ\÷f‹u»\"­ß¼\0\0Åš5k\ÖCcP¾7\ïÍ–\ÖmZ¿y\0\0Šµ\İv\Û=¢®\ë;\ó>\Ğlp—u:‡\ç}\0\0(V·\Ûı\Ó”o\Ïû@³UUµdÖ¬Y’\÷\0 XN\çQp\÷fK\ë6­ß¼\0\0Åš>}ú_Å |S\Şš-­Û´~\ó>\0\0«\Ó\éüM\Ê\×\å} \Ùb\İ^\õø¼\0\0\Å\êv»C\ò\Õyh¶X·;\Î\ò>\0\0«ªª\'Ç |y\Şš-­Û´~\ó>\0\0«\Ó\é<µ®\ëK\ò>\Ğliİ¦\õ›\÷\0 XUU=}pp\ğ§yh¶X·?‹û´¼\0\0\Å\êv»ÏŠAù¢¼4[¬\ÛUU\õÌ¼\0\0ÅŠ!ù9Q\ç\ç} \ÙÒºM\ë7\ï\0@±\êº~A\É\ß\Ïû@³¥u;00\ğü¼\0\0ÅŠ!yZ\ÔYyh¶X·g\×u½u\Ş\0€b\r¼4†\ä3\ò>\Ğlp\ÏL\ë7\ï\0@±\"Ü¾2\å¹yh¶´n\Óú\Íû\0\0P¬·­ª\ê[yh¶¸§\Ä\Ú}M\Ş\0€bÅüú¨\ò>\ĞlnO¬\ëúuy\0\0ŠCr\'†\ä¯\å} \ÙÒºM\ë7\ï\0@±bH®\Ëû@³¥u›\Öo\Ş\0€bUU53f\ä£\ó>\Ğlp‰š‘\÷\0 X1 \ï\õù¼4[]\×_¨ªjv\Ş\0€bE¸\İ)ê¨¼4[Z·iı\æ}\0\0(V]×»VU\õ\é¼4[Z·iı\æ}\0\0(V\É{Æü±¼4\Û\à\à\àÇ£\ö\Èû\0\0P¬·{G\È=,\ï\Ík\÷Ã±vß–\÷\0 Xƒƒƒ\ïˆ:$\ïÍ–\ÖmZ¿y\0\0Š\ò~u]¿?\ïÍ–\ÖmUU\ï\Îû\0\0P¬¸D½7\ï\Íf\í\0@Æ«@\ĞN~ú\0\02~\Ú\É\ï\Ï\0@\Æ;±B;yt\0\0\Èø[š\ĞNş†5\0\0dbHştÉ»\æ} \ÙÒºM\ë7\ï\0@±Š\Ú)\ïÍ–\ÖmZ¿y\0\0ŠU\×\õªªš\÷f‹p»C\Ô\ç\ó>\0\0+\äc¢f\ä} ÙªªšY\×\õ\Ñy\0\0Š\á\ö¸’\ë¼4[Z·iı\æ}\0\0(V\Ì\È_«ªª“\÷fK\ë6­ß¼\0\0ÅŠ!ù\Ä’_—\÷f|}\Ô	y\0\0Š\ò)r_“\÷f«\ëz\ÛX»\ß\Êû\0\0P¬¸scP~e\Şš-\Â\íPZ¿y\0\0Š\ò™/\Íû@su:\'œt\ÒI\Ë\÷\Üs\Ï\ó\Ë\0\0 XpÏ®\ëz\ë¼4\×{\ßû\ŞsV®\\¹\ê\'?ù\Éıv?¿\0\0Š\÷û\Ï\Ïû@3\r\r\rU.¼k¸\ç\ßø\Æ)ùu\0\0 HpÏzN\Şš§\Ó\é<\ò3Ÿù\Ì\í#\á6Y¶l\ÙÊƒ:\è\rùu\0 8nTU\Õ3\ó>\Ğ<»\îº\ë\ç\ï	£n\ò\Ãş\ğ\î™3gşy~}\0\0\ØbE˜}\ì¶\Ûnû°¬\÷³º®Ÿ6º4OUU\Ï=\ó\Ì3û£É¹#8\â¼ü6\0\0°ÅŠ û\á´\Ã\ë¨û¢\Î\Ûi§ş_~[`\êL›6\í\÷\ö\ßÿ+V­Zµ2¶#\î¸\ã\ß\ì¾û\î{\ä·\0€-Rz7jùÁ\ö·!x\÷üvÀ\Ô\êv»\ï¸şú\ë\ô»·c9ë¬³\î\Êo\0\0[¬ªª\ÌC\í¨ºÖŸ\æ™1c\Æu\÷\Üs\Ïuy \Í-X°\à\Çùm\0`‹\ö	d\ï#Ü¦\Ú!¿>0\õ\êº\Şş ƒZv\ÜQ¾\õ\Ö[W¼\ó\ï|F~[\0\0Ø¢E=fŒp{yú=¿üº@3\Ä\Zı\âø\ÃK\ò`;\â\È#üQ~\0\0\Ø\âu:§Æ°¼rtÀ­ªj0¿\Ğ\é\ĞgÏ}\é=\÷\Ü\ó\ë<\Ü^r\É%w¼4¿\r\0\0!\í7F\Ü_D\ëw\ò\ë\0Í’œ:\äC\îˆL»j$Ü®Zµê¾½\÷\Şû²üº\0\0PŒn·û¬¶«RÀ;ù\å@3¥\ß\Ç=\÷\Üs—Œ\Ü\ÓO?ıÊªªf\ç\×\0€¢D¸\Ã\ò\ÊY³f=4¿h®]v\Ù\å+w\ß}\÷=‹/^5s\æ\ÌE\Ûl³\Í\ä\×\0€	şı…~\í¼\ó\ÎûÍ¼y\ó†\Ï8\ãŒVÖ±\Ç›ş\îmzh­Ëš^\ñ}_µ`Á‚›\æÏŸÿ\Úü\ñu\Ù\Ö\ïÜ¹s‡:\ê¨\áC=tu\å—7½¬_\0€‰\áø\ë1œ\r/^¼xø\Ş{\ï¾\ï¾ûZ[)\à\æ½6Tú¾§\ïÿ\ÙgŸ½4\æW\çŒgKY¿\ñÿ±úw\èo¹å–µ.kzY¿\0\0\r’^ùI\ÃY>´©\Í_‹-º5\ä\ò\ÇÆ³%­\ßn¸a­^›\Êú\0h€\ôcm~\ågKª\ô8Ä€¼<Œ`<\Öos\Êú\0h€\ô;dù ¦¦®\Ò\ã‘?F0\ë·Yeı\0L±‰\Èwİ±hx\á…_¾\ä\Ì\÷­®\ôq\ê\å\×SVd&\ÃúmVY¿\0\0Sl\"\ò²%7_|úş\Ã?û\Î\ÛT©—.Ë¯¯ú/2“aı6«¬_\0€)6‘ù†K¾µ\Öp<R¿ºä”µ®¯ú/2“aı6«¬_\0€)6‘ù—g}p­Áx¤\Òeù\õUÿe@f2¬\ßf•\õ\00\Å&2 _|\Æk\r\Æ#•.Ë¯¯ú/2“aı6«¬_\0€)f@nV™\ë·Yeı\0L±‰\È\é]W\óÁx¤\Òeù\õUÿe@f2¬\ßf•\õ\00\Å&2 _ùƒO­5Tº,¿¾\ê¿\ÈL†\õÛ¬²~\0¦\ØD\ä\Ûnüù\ğ\Å\ß}\ïZ\Ãq\ê¥\Ë\ò\ë«şË€\ÌdX¿\Í*\ë\0`ŠMd@Nu\ÍEÇ¬5 §^~=µae@f2¬\ßf•\õ\00\Å&4 /_>|\å¹G¬5 §^ºl­ë«¾Ë€\ÌdX¿\Í*\ë\0`Š­o@^¶\ä\Æ\á+~\ğÉµ†\ã‘J—¥\ë\ä·Sı•™É°~›U\Ö/\0Àw@^¾|xÑ•\ó‡qÚ»\Ö\ZŠ\óJ\×I\×\õjĞ†—™É°~›U\Ö/\0Àk@^ß«>\ã•Wƒ6¼\ÈL†\õÛ¬²~\0¦\ØX\òD^\õ¯\Òm\óûS/2“aı6«¬_¦\Ø\Ã\ò\0g¬9z\'[ùı©‰—™É°~›U\Ö/Sh\ë¨Å½ \\c\r\Èj\êÊ€\ÌdX¿\Í*\ë—)2n\÷\éı+\äP.r³Ê€\ÌdX¿\Í*\ë—)¿r›o@Y\È\Í*2“aı6«¬_6³\ñ\Â\ìx}\0\Ø\ò›Ud&\ÃúmVY¿lF\ë±\ë»`\ò:\Î\ãw®ª\ê[\ñ\ïQ7D\r\÷ş½ \×\ß9]/¿-l.\äf•™É°~›U\Ö/›\ÉD\Ã\ëD¯›…l\Ôb/ŠgAÔ­»\ï¾ûÜ“N:\é\äK.¹\ä¢_ÿú\×‡‡‡—\İz\ë­w]~ù\å\×Ï›7\ï\â8\àCCCK\Ó\õ\Ó\í\òû‚MÍ€Ü¬2 3\Öo³\Êúe3˜lh\ì\õa£•R˜h\ÉFMPU\Õ\ãÁ˜u\å\ñ\Çÿ••+W.€¸\Ş\ğ\÷¿ÿı;\æÌ™sK·\Û==\İO~ß°©›Ud&\ÃúmVY¿lbı†\Õ~odT6\Ê\Ã\ëdj®l4E^\ZÀÍ‡z\èW¬XqCb\'\"n7|\ò\É\'/™1cÆ’tù\ç€MÁ€Ü¬2 3\Öo³\Êúe\ÚĞº¡·‡I\ée£\ÛG‡\Õ\éÓ§¯:ø\àƒ‡\çÍ›7|\õ\ÕW\ßv\Ûm«3Pú7m§~º<²Pro—6³ø¦\ïu\ã\÷¾\÷½£³\ÌÚ—\Ë.»lx\ö\ì\Ùwv»\İ7\åŸ66r³Ê€\ÌdX¿\Í*\ë—Mdc…Óu?°N½ltÿH@L³ê³Ÿı\ì\ğ’%K\ò\Ø3¦t½tı¡¡¡\Ñ!7\İ\ßù\çb\è=;qÓµ\×^{Jş\àlˆÅ‹\ï°\Ã\÷\Ôuı²üs\Â\Æd@nV™\ë·Yeı²	l\ìPº±\ï¤—~n\ßò–·¬¼\æšk\ò¨3!\év»\í¶ÛƒB®Wr7±N§\ó¤øF/\ÚX¯\Ü\æz¯\ä.KŸ\'ÿÜ°±›Ud&\ÃúmVY¿ldyı¨\í{ÿNF~»ü~a£\èe£\ÛF\é»\Ş\õ®UK—.\Í#Î¤¤Û¿û\İ\ïro“6¡øŸš~\ç6¾\÷«\òcc9\õ\ÔSW\í¶\Ûn?\Î?7l,\äf•™É°~›U\Ö/QBS8ı|T\Ú\ÇÒ¿\r¹\ã\İ.¿\Ø`)~\åvC\Ã\íˆt?\Ù+¹§æŸ› \÷v\×W\öû†R•\Şxj=\ö¸\Çw|Eş5À\Æ`@nV™\ë·Yeı²‘Œ>\Ó+°iÿ\Z©‰„\Ü\Ñ\áv¤fº|¬\Ï}\ée£\ßş\Îm¿?–<t£\'×Ÿ\Ú\â{\Î\ñ\Çÿ\åü›¿)œw\ŞyÃ»\ï¾û5ù\×\0ƒ¹Ye@f2¬\ßf•\õ\ËF0^\è+¬®+\äuı\Ï\õú£\÷ù`RR6\Z	Ÿ\é\r¢6…t¿£^\Å=\'ÿ\Z\Ø\0N\çq\ñM½e\åÊ•7\ç\ßøM!ı\Ü9sæ¬œ={\ö\ã\ó¯6”¹Ye@f2¬\ßf•\õ\ËZ_\Ø+´rÇº\ŞX\áv\Äú>/¬S/­JÁ3ı) ‰¾[\òd¥û\õ\'„V¥Ï›-\ô©ªª]v\Ûm·S\óoú¦tø\á‡x\à‡\å_¬K,ş³¢¦\åı\Ñ\È\Í*2#¬\ß\öÕº\Ö\ï\Í7\ßü„ë¯¿ş\âŸş\ô§w½\ç=\ïùÀ´i\Ó~/¿[‰¬\ß\ÌDC\æX\áut\È\ë\òu…\Ûıüh}ûs\ÊF#¯¬r\È!yŒÙ¨\Òı|®\ôy\ó¯…>\Å7\ô„O<\ñ[ù7|SJ?¦ü®w½\ëŠüku9\0¬\ëÀd@nV­k@¦,\Öoûj¬\õ§\ğß½\âŠ+>º|ù\ò•#\ç\ô¸\îı_ı\êWoœ={\ö\ó\ò\ë³e˜\Èúe²\ár¬›¶2F\"\áv\Äd¿\n±¾ı9z\'Œ\\\ç\Ì3\Ï•`6¾tÿ£¾\ò¯…>\Å7\ó\ÂK/½\ô¢ü¾)-\\¸px\ï½\÷¾3ÿZ`]F\0\Æ=0›Uc\rÈ”\Éúm_\å\ë\÷šk®\Ùz\ñ\âÅ¿\Î\Ï\é#®½\ö\Ú\ß|\ğƒüz§\Óy\ä\è\Û\Ñ~Y¿=ı†Ê±B\î\å\Ù\öd\Â\íˆ~¿¶`\ëÛŸ\ã\ãG.K™eSJ\÷?\ê\ë¸pÔ—É†ˆoæ·\Ür\ËUù7|Sºı\öÛ‡\ßü\æ7ßŸ-°.c\Ö:0›Uù€L¹\ÆX·\Öo\Ãkdı\ÆiûW]u\Õw\Ò{h¬Ïª·[¶\×^{mÿ €Vcİ®µ~·\Ú\ğ09V\Èİp;bC¿.¶0c\ì\ÇÚŸ£n\é¥Ì²)¥û\õùoÌ¿Vú\ß\Ì\å\÷\ßÿù7|SŠÏ·ú—ª\ó¯\ÖeŒQ^g›U.#\ÆX¯yY¿\r«\ôx\\q\Å;-]º\ô\Şü<¾>K–,ùÍ‘Gù£N§\ó„|_ }\ÆX¯ª7¾\ñ\ò‡,‰«\î“\ßv’Ò%\ç¯Ü¦\í\Ô\ß\é\ëJ!\÷aù”\'\ß\óª\ëz\å\È\Ç)³lJ\éşG}\î\åù\×JŸ\â›y\ãm·İ¶,ÿ†oJ\éÙŠw\Şy\õ»“)µ1Ë€Ü¬JGş)5^5mınµ\ö«H«ks]>\Õu\â‰\'v\ØaÃ·\Şzk~\Z_¯t›t\Ûü1V[n½ø\Å/~\èCš\öá­·\êÏº^Á\ëİ•\'*}=«_ÁÍ¿f¥\ÖW^Ám©øf^xù\å—_›\Ã7¥\ô\ó\æû\î»\ï½ù\×\ë’tF\ÕYƒ\rıÇ­\Ö>I?h€\Íûû\ò©.¯\à2bŒuÛŠ\õ»®Ş¦¾|ª+=\é\Ø9s\æ|wşüù·¬Zµjı?£<<¼bÑ¢E\Ç\ï°\Ã¿ˆ\Ç\õT¯\àn\ÆX·k­ß­·\ê\ïÇ\Ç\n·ù+¹ı„\Ü~¿¶`c\ì\ÇÚŸınû\Å7\ó„3\Ï<\ó’ü¾)¥wQ>è ƒnÉ¿X—\ñD£¯c@»7U%\à2\Âú]»·¾Ë§ºF¯ßº®\ö\ßÿ\Å\ëz“©•+Wş$½\ÉT<®¿J\×¹-\í7‘\õ;\Ê\Ö[M.Tn\Ó\ïÜ\õ.Ê“	¹“ı:(\Äú\ö\çA\ï¢\Ü~\éo.x\à\ç\ß\ğM)ıÜ£>úŒüku\ï@4šy\ì\ŞT•€\Ë\ëw\í\Şú.Ÿ\ê\Ê\×ozwä¡¡¡#;\î¸;V¬XqÏ¨\Óú]tÑ—\â²_\Åc{¸wQ\Ş\òLdıf¶\Şjb\ár¼p;bÇº|\"!w¢ŸŸ­o\öwp·\0q\"z\\œ”\î˜È»#n\é\ó\ì¸\ã\Ã\ç{\î\ë\ó¯\Öe¼\Ñh\ä±{SUù€L¹¬ßµ{\ë»|ªk¼\õC\Øs\÷\Üs\ÏK\ÃÍ·\ß~û9o{\Û\Û\æ\Çcû³\ÔÏ¯Ë–a\"\ëw[oµ\î9Vx\ëİ’ÇºŞºB\îú>/…[\ßşœ²Q\\¾ú½‚Ò›\â.Y²$3Eº\ßtÿ½€»*}\Şüka\Ä7\õœ\ïÿûw\ä\ßøM!ıx\ò~û\í\÷›øpC\ß\Öb@»7U5Ş€c±~\Ç\îMU­kıN›6\í\÷\êº\Ş7\æ‡+Ó¿i;¿l5~\Ø+´nGŒuı±B\îxŸ&%e£^\ğş\ìg?›Ç™\"\İ\ï\È\çHŸ/ÿ\Z\Ø@/š3g\Î-+V¬È¿\÷Uºÿ·¾\õ­\Ãs\ç\Î=*ÿ\Z`c0 İ›ªZ×€9\ëw\ì\ŞT•\õ\ËF²\õVk‡\Î\í£V\ï\ï½ZW¸1VÈ9\ê\ò±>\ô%e£‘\ğ9444|\Í5\×\ä±fƒ¤ûK\÷;\ò9\Ò\çË¿6‚n·{\Ú\É\'Ÿ¼i^ƒ\ï9\õ\ÔS‡\ßÿş\÷§¿§\÷\Ğü\ó\Ã\Æ`@»7Ue@f2š¸~Çª\ÍuùT—\õ\ËF´\õVŸ£\Ã\êD\Â\íˆ\ñn—\ß?l°§\Ğ\İv\Ûmx\éÒ¥y´\éKºŸt£^½=5ÿ\Ül$N\çI3g\Î\\r\Ùe—­\Êˆ!\î7ı\í\Û\ô»·o\É?7l,\ä_>\Õe@f2š¶~K/ë—l\ë­\Ö¹\éØ‰†\Ûù\í\òû…\"e£Ÿ·\Ñw¿û\İr\Ó\í\ÓıŒ\Üg·\Û]’>Oş¹Ùˆ^:{\ö\ìe‹/\Î\r’\î/…\Û\ÓO?ı+ùç„É€Ü¬2 3\Öo³\Êúe\Ø\Øatc\ß<H\ÊFD\ïıJn¿?®œn7ú•Ûº®W¤û\Ï?\'›@·\Û}Óœ9s\îI¯¸n\é~v\Ùe—\áN8á‡±9\Ùg\é`R\È\Í*2“aı6«¬_6‘J7\ÖıÀ:E\İat\ÈM¿;›\Ş j¢ï®œ®—®?úwnS¸M\÷›.6¡ø¦¿lÖ¬Yw¥ß™\í\÷§\Ò\í\Ò\í\ßü\æ7¯~\åvX¸e30 7«\ÈL†\õÛ¬²~Ù„64œn\è\íaRz¯\ä\Ş>PS¥?\ñs\ğÁÏ›7oøê«¯¾\í¶\ÛVg \ôo\ÚNıtù¨?4n\ï\ğ\Ê\í©ªê‰»\îº\ë\÷\ØcûÓŸ\ö™\è\ß\ÉM\×K\×O\ï–|\ĞA\İ{şù\çû[6r³Ê€\ÌdX¿\Í*\ë—M¬ß\Ú\ï\í`ƒ¤lu\î\è°\ÚG\ÍM\÷“\ß7›Ù;\îøŠ\İw\ß}\á›\Ş\ô¦•‡~øp\Ö1Ÿ¥Hıtùœ9s†\÷\ßÿßœv\ÚiŸ\ön\Élf\äf•™É°~›U\Ö/›Ád\Ã\êd¯]\ïO-#¼®«øS@\r4{\ö\ì\Çt\ĞA‡½\ã\ï¸jŸ}\ö¹s\çw^ı³\è»\ì²Ëª\è\İ{\à\Şz\Ì1\Ç|\÷¼\ó\Î{CÛ‡ä·‡\ÍÁ€Ü¬2 3\Öo³\Êúe3™hh\è\õ`³\èt:‹,´sUUßŠ/ˆºaT ½ \×\ß9]/¿-À„›Ud&\ÃúmVY¿lF\ë¯\ë»\Z¡®\ëï¥€›\÷úf@nV™\ë·Yeı²™b\Ç\ëC£D¸}\ñ¨Wp_˜_\Ğr³Ê€\ÌdX¿\Í*\ë—)‡\Ù|\Z+B\í9#7\Â\îù\å\0}1 7«\ÈL†\õÛ¬²~™\"#¡vŸŞ¿\Â-—ş\Ä\ê¨WoG\êyù\õ\0&Í€Ü¬2 3\Öo³\Êúe\ny\å–V‰0ûƒ1\î\éù\õ\0&Í€Ü¬2 3\Öo³\ÊúeŠ=,…„¼	M\Ó\ív_1F¸]]UU=7¿>À¤›Ud&\ÃúmVY¿L5—6ˆı\ô¼<Øª¹ù\õ&Å€Ü¬2 3\Öo³\Êúeª	¸4]UUÛŒjT\İn\÷?\ò\ÛL˜¹Ye@f2¬\ßf•\õ\ËTpiº\ØG˜\Ú1\ê\Ûù\í\0&Ì€Ü¬2 3\Öo³\Êúeª	¸´M§\Óù\Ã\Øo\ï\Éû\0}3 7«\ÈL†\õÛ¬²~™j.m³\í¶Û¦7G»;\ï\ôÍ€Ü¬2 3\Öo³\Êúeª	¸´ÍŒ3ş(\öÛ»\ò>@\ß\È\Í*2“aı6«¬_¦š€K\Û¸ÀFg@nV™\ë·Yeı2\Õ\\Ú¦\Ó\é<<\ö\Ûey o\äf•™É°~›U\Ö/SMÀ¥m¶\Ûn»G\Ôu}g\Ş\è›¹Ye@f2¬\ßf•\õ\ËTpi›¡¡¡?ıvi\Ş\è›¹Ye@f2¬\ßf•\õ\ËTpi›N§\ó\È\Øo\ï\Èû\0}3 7«\ÈL†\õÛ¬²~™j.m3kÖ¬?©ªjI\Ş\è›¹Ye@f2¬\ßf•\õ\ËTpi›n·û§±\ßŞ\÷úf@nV™\ë·Yeı2\Õ\\Ú¦\Ó\éüYì··\å}€¾›Ud&cŞ¼y«\î½\÷Şµ\ö#µù+‡›bı.\Ï#Øœ\\\Úf\æÌ™û\í­y o\ä\æ”™\ÉZ°`ÁM‹/^k_R›¿®»\îº\ãcı^?F°9	¸´M]\×û\í-y o\ä\æ”™Éš?şk\Ï>ûì¥‹-º\ÕUSS\ñ}_t\íµ\×k\÷ú¨W\çlN.m#\ày\êË€Ì†HûLzb$\ê¾\ô#\îj³Wú¾§ï¿µË”pi›N§\ó¨\Øo\÷6H\Z\ÌzšyjÊ€Àpi›3füeì·‹\ó>@\ñ\â\à8Í‰€’9\Ò6u]?:\öÛ›\ó>@\ñ\â\0ù=\'v\0J\æ<H\Ût:\Ç\Ä~»(\ï-Œ/I\'\õTt__\0%pi›\éÓ§ÿU\ì·7\å}€¢Å\ñœQ\÷Œür\0(€K\Û\Ä>ûØ¨\ó>@±\"Ğ¾l$Üª\ç\å\×€-€K\Ût:\Ç\Å~û«¼P¬8(›ÜªªNË¯\0[:—¶\Z\Zú\ë\Øoo\Èû\0Eª\ëú•y¸rŸ›_\0¶d.mû\ìã£®\Ïû\0EŠ\âùy°U§\æ\×€-™€K\Û¸\0=\İn\÷Uc„\ÚüU\Üg\ç·€-•€K\Ût:¿‰ı\öº¼Pœ8^\Ú1\ê”üv\0°¥pi›n·û·±\ß^›\÷Š·\í¶\Û>,w\ç}\0(…€K\Û\Ä>ûwQ\×\ä}€\âÍ˜1\ã\â\0yW\Ş€R¸´M§\ÓyB\ì·\ó>@\ñ\â\0ù\ğ8@.\Ëû\0P\n—¶\év»û\í\Õy x\Ûm·\İ#êº¾3\ï@)\\Ú¦ªª\'\Æ~{U\Ş(\Ş\Ğ\Ğ\Ğ\Çri\Ş€R¸´M§\ÓyR\ì·W\æ}€\â\Å\ò‘q€¼#\ï@)\\Ú¦\Û\íşC\ì·W\ä}€\âÍš5\ëOªªZ’\÷ .m#\àŒ#\Z\È\Û\ó>\0”BÀ¥mªªzrì·—\ç}€\âu:?‹\ämy\0J!\à\Ò61¿=¥®\ë\Ë\ò>@\ñfÎœù\çqb¿5\ï@)\\\Ú&\Â\í?\Æ~ûË¼P¼8@şE o\Éû\0P\n—¶©ª\êŸb¿½4\ï¯\Ó\é<*¿\Îû\0P\n—¶‰ù\í©u]_’\÷Š7cÆŒ¿Œû\â¼\0¥pi›·ÿû\í\Åy x.\0¥pi›ªªş%\ö\Û_\ä}€\â\Õuı\è8@Şœ\÷ .m344\ô¯r\÷Š\×\ét\'\öEy\0J!\à\Ò6u]?-\öÛŸ\å}€\âMŸ>ı¯\â\0yS\Ş€R¸´€088>6\êÆ¼\0¥pi›ªªû\íO\ó>@\ñ:\Î\ã\â\0ù«¼\0¥pi›n·ûor’\÷Š744\ô\×qb¿!\ï@)\\\Ú&\ö\ÙgDı8\ï/º>\ï@)\\Ú¦ªªg\Æ~û£¼P¼N§\ó7q€¼.\ï@)\\Ú¦\Û\í>+\öÛ‹\ò>@\ñ\â\0ù·q€¼6\ï@)\\\Ú&\ö\Ùº0\ï/uM\Ş€R¸´MUUÏı\ö‚¼P¼N§\ó„8@.\Ìû\0P\n—¶\év»ÿû\í\ó>@\ñ\â\0ù\÷q€¼:\ï@)\\\Ú&\ö\Ù\çDŸ\÷ŠWU\Õ\ã\0yU\Ş€R¸´€0N§\ó¤8@^™\÷ .mSU\Õsc¿=/\ï¯\Û\íşC ¯\Èû\0P\n—¶©\ëú?c¿=7\ï¯ªª\'\Ç\ò\ò¼\0¥pi›\ØgŸ\õƒ¼P¼N§ó”º®/\Ëû\0P\n—¶x~\ì·\ß\Ïû\0Å‹pûq€üe\Ş€R¸´M\Ìo/ˆı\öœ¼P¼ªªş)—\æ}\0(…€K\Û\Ä>ûÂ¨y xN\ç©u]_’\÷ .m300\ğ_1¿}/\ï/ÿ\'\ö‹\ó>\0”BÀ¥mb~\Û:\öÛ³\ó>@\ñªªú—8@ş\"\ï@)\\\Ú&\ö\ÙiQg\å}€\â\r\r\rık„ÜŸ\ç}\0(…€K\Û¸\0\ã¨\ëúiq€üY\Ş€R¸´\ÍÀÀÀ‹b†›Ÿ\÷ŠWU\Õ\Ó\ã\ÄşÓ¼\0¥pi›·/ıv^\Ş(^·\Ûı·¹?\Éû\0P\n—¶‰}\ö%Qg\æ}€\â\ÅÁ\ñQ?\Îû\0P\n—¶xi]\×g\ä}€\âUU\õ\Ì8±ÿ(\ï@)\\\Ú&\Â\í\Ëb¿ın\Ş(^·\Û}V /\Êû\0P\n—¶©ª\ê\å±ß\÷Š\Çº0\ï@)\\Ú¦\Û\í¾\"B\îiy xqp|vœ\Ø/\Èû\0P\n—¶©\ëú•±\ß\Î\Íû\0\Å\ëv»ÿ\È\æ}\0(…€K\ÛTUµMì·§\æ}€\â\ÅÁ\ñ9Q\ç\ç}\0(…€K\Û¸\0\ãˆ\äs\ã\0y^\Ş€R¸´M·\Û}U\Ìp\ß\Éû\0Å«\ëú?\ã\Ä~n\Ş€R¸´Mì³¯úv\Ş(^Ÿ\õƒ¼\0¥pi›ªª^û\í)y xÏ\ä\÷\ó>\0”BÀ¥m\êº\Ş6B\î·\ò>@\ñ\â\0ù‚8±Ÿ“\÷ .mû\ìvQ\'\ç}€\â\ÅÁ\ñ…Q\ò>\0”BÀ¥mªªzm\ì·\'\å}€\â\rüW]\×\ß\Ëû\0P\n—¶‰\Ù\íurO\Ìû\0Å‹\ä\Öqb?;\ï@)\\\Ú&\ö\Ù\×G\÷Š\ÇiQg\å}\0(…€K\Û¸\0\ãxQ]\×\ó\ó>\0”BÀ¥mªªzC\ì·\ß\Ìû\0Å‹pû\â8@\Î\Ëû\0P\n—¶‰ù\ír¿‘\÷Š\'\õ—D™\÷ .mû\ìG}=\ïo``\à¥u]Ÿ‘\÷ .mSUU\'æ·¯\å}€\â\ÅÁ\ñeqbÿn\Ş€R¸´M\Ìo±\ß~5\ï¯ªª—\Ç\ò\ô¼\0¥pi›\Øg«¨\ã\ó>@\ñº\İ\î+\"ä–\÷ .m³\Û`]\×ÿ—\÷Š\ÇWÆ‰}n\Ş€R¸´M\Ìou\ì·\Ç\å}€\âUUµM O\Íû\0P\n—¶‰}¶\õ•¼P¼n·ûª¹\ß\Éû\0P\n—¶p\Æ\ÇWG};\ï@)\\Ú¦ªª¡º®¿œ\÷Š\È\×Ä‰ı”¼\0¥pi›·\Óc¿=6\ï/\ÛF\ÈıV\Ş€R¸´M\ì³3¢\Éû\0Å‹ƒ\ãvQ\'\ç}\0(…€K\ÛTU5³®\ë£\ó>@\ñ\â\0ù\Ú8±Ÿ”\÷ .m\ávû\Øo¿”\÷Š\È\×E\È=1\ï@)\\\Ú&\ö\ÙYQ_\Ìû\0Å‹ƒ\ã\ë£N\Èû\0P\n—¶©ªjv]\×_\Èû\0Å‹\ä\â\ÄşÍ¼\0¥pi›\Øgwˆú|\Ş(^]\×oŒû¼\0¥pi›\Øg\ß\õ¹¼P¼88şw\Ô\×\ó>\0”BÀ¥m\\€qTUÕ©\ëúky\0J!\à\Ò61»Í‰\î³y xq€ˆûW\ó>\0”BÀ¥mbŸ\İ1\ê3y xqp¬¢\Ïû\0P\n—¶‰}v§¨£\ò>@\ñªª\Z¬\ëúÿ\ò>\0”BÀ¥mbv{s\ÌpG\æ}€\â\Å²ûqy\0J!\à\Ò6±\Ï\îuD\Ş(^»Q_\Éû\0P\n—¶©ªj—\Øo\Ïû\0Å‹\äP]\×_\Îû\0P\n—¶‰\Ùm×˜\á>\÷Š\È\éqb?6\ï@)\\\Ú&\öÙ·D}*\ï/3¢\Éû\0P\n—¶©ªj·\Øo?™\÷ŠÈ™u]\÷ .m#\àŒ#\Â\í\öq€üR\Ş€R¸´M\Ìo»G\ÈıD\Ş(^œ\ÔgE}1\ï@)\\\Ú&\ö\Ù=¢>\÷ŠWU\Õìº®¿\÷ .m\óÛ1¿},\ï/N\ê;D}>\ï@)\\\Ú&\Â\í[#\ä~4\ï/N\êoŠú\\\Ş€R¸´M\ì³{E}$\ï¯®\ë9UU}6\ï@)\\\Ú&f··\Å\÷\á¼P¼8©\ï\õ™¼\0¥pi›·{G\È=,\ï/N\ê;E•\÷ .mû\ì>Q\Êû\0Å«\ëú\ÍUU™\÷ .m³\Û\Ûc†;4\ï/N\ê;G‘\÷ .m#\àŒ#»Ä‰ı\ğ¼\0¥pi›·û\Æ\÷Á¼P¼8@\î\Z\ÈO\ç}\0(…€K\Û\Ä>û¨C\ò>@\ñ\â\àø–¨O\å}\0(…€K\ÛTU\õÎº®\Îû\0\Åp(€K\ÛD¸ıŸ\Øo?\÷ŠWU\Õnq€üd\Ş€R¸´M\ì³\ïŠúß¼P¼º®wû‰¼\0¥pi›˜\İ\Ş3\Üû\ó>@\ñâ¤¾G\Ô\Ç\ó>\0”BÀ¥mbŸ\İ/ê ¼P¼ªª\ö¬\ëúcy\0J!\à\Ò6±\Ï\î\õ¾¼P¼·oûÑ¼\0¥pi›˜\İ\Ş3Üy xqR\ß+\ê#y\0J!\à\Ò6.À8\â\0ù¶8@~8\ï@)\\\Ú&\ö\Ù\÷F\÷Š\áv\ï¹‡\å}\0(…€KÛ¤p›Bn\Ş(^\÷‰úP\Ş€R¸´Mú\ñ\ä\ôc\Êy xqp|{$\Íû\0P\n—¶I\ï µ\Ş(^„\Û}#\ä~0\ï@)\\\Ú&\öÙƒ¢\ö\Ëû\0Å‹ƒ\ã;¢\Éû\0P\n—¶©\ëúıUU½;\ï/ïŒƒ\äÁy\0J!\à\Ò6±\ÏşoÔ»\ò>@\ñ\"\ÜşO ?\÷ .m“f·4\Ã\å}€\â¥gÿÒ³€y\0J!\à\Ò6.À8\Ò\ïo¤\ß\ã\Èû\0P\n—¶I¿^–~\Í,\ï/½_\ÔAy\0J!\à\Ò6\é\rB£Ş‘\÷Š\Çı£Ş—\÷ .m“ş\ÄcúSy xq€|O \Ìû\0P\n—¶‰\Ù\íĞ˜\áŞ\÷Š\'\õ\÷F\÷ .mûì‡¢\ö\Éû\0\ÅK\á6…Ü¼\0¥pi›ªª«\ëz\ï¼P¼\ô\ã\É\éÇ”\ó>\0”BÀ¥mb~ûp\Ìoo\Ëû\0\ÅKo0•\Şh*\ï@)\\\Ú&\öÙD\í•\÷ŠÇƒ¢\ö\Ëû\0P\n—¶©ª\ê£u]¿5\ï/ïƒ\ä»\ó>\0”BÀ¥m\\€q\ÄIı£Ş•\÷ .m\á\öcr\÷\Ìû\0Å‹“ú\â ù?y\0J!\à\Ò6±\Ï~<j¼P¼·WU\õÎ¼\0¥pi›˜\İ>3\Ü\îy xqR?$\êy\0J!\à\Ò6±\Ï~2B\îny xqpü`]\×û\æ}\0(…€K\Û\Ä>û©¨·\ä}€\âE¸=4B\î\Û\ó>\0”BÀ¥mbvût\Ìp»\æ}€\â\ÅIıCQû\ä}\0(…€K\Û\Ä>{x„\Ü]\ò>@\ñ\â\àxX]\×{\ç}\0(…€K\Û\Ä>{D\Ô\Îy xn?!\÷my\0J!\à\Ò61»3Ü›\ó>@\ñ\â¤ş‘¨½\ò>\0”BÀ¥m\\€q\Ä\ò£q€|k\Ş€R¸´M\ì³GE\í”\÷Š\á\öcr\÷\Ìû\0P\n—¶‰}\ö3Q;\æ}€\â\ÅÁ\ñ\ãQ{\ä}\0(…€K\ÛTU\õÙº®\ç\ä}€\â\Å\òq€\Ü=\ï@)\\\Ú&\ö\Ù\ÏE½)\ï/ŸŒ»[\Ş€R¸´Mì³Ÿ\Ú!\ï/ŸŠzK\Ş€R¸´M]\×_¨ªjv\Ş(^?\É]\ó>\0”BÀ¥mbŸıbÔ¬¼P¼88!w—¼\0¥pi›\Øg¿T\×\õ\öy xq€<\"j\ç¼\0¥pi›·GWU53\ï/G\ÆA\ò\Íy\0J!\à\Ò6.À8\â¤~T\ÔNy\0J!\à\Ò6±\Ï5#\ï/Ÿ‰\Ú1\ï@)\\\Ú&\ö\Ùcëº\÷ŠWU\Õg\ã\09\'\ï@)\\\Ú&f·/\Ç7”\÷Š\'\õ\ÏE½)\ï@)\\\Ú&\öÙ¯Du\ó>@\ñ\â\àøù¨\ò>\0”BÀ¥mbŸ=®y xqlüBUU³\ó>\0”BÀ¥mb~û¿˜\ß\ó>@\ñ\â¤şÅ¨Yy\0J!\à\Ò6±\ÏU\å}€\â\ÅÁ\ñKu]oŸ\÷ .mû\ìWc~\Èû\0\Å\ó‡\Â(€K\Û\Äü\öµ˜\ß:y xƒşP8\0…pi`ƒşP8\0…pi›\Øg¿\õ\ßy xşP8\0¥pi›˜İ¾3\Ü\ó>@\ñı¡p\0\n\'\à\Ò6±\Ï~3B\î\ò>@\ñı¡p\0\n\'\à\Ò6±Ï\õú¼P<(€\Ò	¸´M\Ìn\'\Æ\÷º¼P¼A(€\Â	¸´M\ì³\'E\È}m\Ş(Ş ?@\á\\\Ú&\öÙ“£¶\Ëû\0\Å\ów\Ô\0(€K\Û\Ä\ì\ö­˜\á¶\Íû\0\Å\ôw\Ô\0(œ€K\Û\Ä>{J„\Ü\×\ä}€\âù;j\0”NÀ¥m\\€qú;j\0NÀ¥mbŸıvÔ«\ó>@\ñı5\0\n\'\à\Ò6UU}§\Û\í¾*\ï\Ï\ßQ t.mû\ì©1\Ãm“\÷Š7\è\ï¨P8—¶‰}vn]×¯\Ìû\0\Å\ôw\Ô\0(œ€K\ÛTUuZ·\Û}E\Ş(¿£@\é\\\Ú&\ö\Ù\Óc†{y\Ş(Ş ·™ p.mû\ìw\ëº~Y\Ş(Ş ·™ p.m\á\öŒ—\æ}€\ây›y\0J\'\à\Ò6.À8¼\Í<\0¥pi›\ØgÏŒzI\Ş(Ş ·™ p.mûì¼˜\ß^œ\÷Š\çm\æ(€K\ÛD¸?00\ğ¢¼P<o3@\é\\\Ú&\öÙ³¢¦\å}€\â\rz›y\0\n\'\à\Ò6±Ï\ó\Û\Öy xŞ…€\Ò	¸´M\Ìoß‹ù\í¿\ò>@\ñ¼\0¥pi›\ØgD½0\ïÏ»\ğP:—¶‰}\öœ˜\ß^\÷Š\ç]ø\0(€K\Û\Ä>ûı˜ßŸ\÷Š\ç]ø\0(€K\Û¸\0\ã\ğ.|\0”NÀ¥mbŸıA\Ô\ó\ò>@\ñ\\\0J\'\à\Ò6±Ï\ó\Û\æ}€\ây›y\0J\'\à\Ò6±ÏWU\Õs\ó>@\ñ½\Í<\0…pi›\ØgÏzN\Ş(Ş ·™ p.mû\ì»\İ\î\ä}€\â\rz>\0\n\'\à\Ò6±\Ï^PUÕ³\ó>@\ñ½\0…pi›\Øg/Œú\÷¼P¼A\ï\Â@\á\\\Ú&\öÙ‹º\İ\î³\ò>@\ñ½\0…pi›\Øg\ó\Û3\ó>@\ñ½\0…pi`ƒŞ…€\Â	¸´M\ì³?zF\Ş(Ş w\á p.m³\ÛOº\İ\î¿\å}€\â\rz>\0\n\'\à\Ò6±\Ïş4B\î\Ó\ó>@\ñ½\0…pi›\ØgV\×\õ\Ó\ò>@\ñ¼I\0¥pi›˜\İ~>44\ô¯y xŞ¤\0€\Ò	¸´Mì³¿ˆû/y xŞ¤\0€’D08+\Ú\õ\ÔYù\í Ib½¸®\ë\Îû\0\Å\ô&\0$\Î{\Ó\Æ´yM\ËoM\á\ö’N§\óÔ¼P¼AoR\0@a\Ò+´c„Z¯\Ş\Ò\Z±Ÿ^ZU\Õ?\å}€\ây“\0J“^¡#\Øz\õ–\Öp\Æ1\èM\n\0(Pz¥vŒp\ë\Õ[Z!\ö\Õ_\Öuıy xƒŞ¤\0€¥Wj\Ç¸\Ó\ò\ëA\Å\ìvY§\ÓyJ\Ş(7)\0 TÙ«¸^½¥5b½¼ªª\'\ç}€\â\rú\0\n•½Š;-¿š*\ö\×+º\İ\î?\ä}€\â\rú\0\n6\ò*nŞ‡&‹}\ö\ÊN§\ó¤¼P<¿\Ã@?†‡‡\áÂ…_;\ï¼\ó~3oŞ¼\á3\Î8Cm\æŠ\ïûª\Ü4şü\×\æ[¶¸WUU\õÄ¼P<¿\Ã@?\"\Ü~=\Â\Õ\ğ\âÅ‹‡\ï½\÷\Ş\áû\î»Om\æJ\ß\÷\ôı?ûì³—F\à}uş±\åŠù\í\ên·û\÷y x~‡€~¤WnS¸\ÊC—\ÚüµhÑ¢[#\à^?Fl¹b~[\Ø\ét\÷Š\çw8\0\èGú±d¯\Ü6£\Ò\ãwyş±\åŠùíš¨¿\Ëû\0\Å\ó;\0\ô#ıh´\Ô\ÔUz<\òÇˆ-—€0¿\Ã@?&\Zp\ïºc\Ñ\ğ\Â¿8|É™\ï[]\é\ã\ÔË¯§6¬Ü²\Äüvm\Ìo›\÷Š\çw8\0\è\ÇD\î²%7_|úş\Ã?û\Î\ÛT©—.Ë¯¯ú/·,1¿]\ó\Û\ß\ä}€\âù\0ú1‘€{\Ã%\ßZ+ÜÔ¯.9e­\ë«şKÀ-K\Ìn\×G=>\ïÏ¸\0Ğ‰\Ü_\õÁµ‚\íH¥\Ë\ò\ë«şKÀ-K\Ìo7\r\rıu\Ş(q 	¸ŸqÀZÁv¤\Òeù\õUÿ%\à–%\æ·_\Åü\ö¸¼P<?\â@?\Üf•€[–˜\İnŒzl\Ş(q 	¸\é]“\ó`;R\é²üúªÿp\Ë\ó\ÛMÓ§Oÿ«¼P<?\â@?&p¯üÁ§\Ö\n¶#•.Ë¯¯ú/·,1¿-Šù\í1y x~\Ä€~L$\à\Şv\ãÏ‡/ş\î{\×\n·©—.Ë¯¯ú/·,1»\İ\\\×\õ£\ó>@\ñüˆ\0ı˜HÀMu\ÍEÇ¬pS/¿Ú°p\Ë\"\àŒÃ¸\0Ğ	\Ü\åË‡¯<\÷ˆµn\ê¥\ËÖº¾\ê»Ü²\Äü¶xÆŒ™\÷Š\ç@\0ú±¾€»lÉ\ÃWü\à“k…Û‘J—¥\ë\ä·Sı•€[–˜\ß~\İ\ét•\÷Š\ç@\0ú1nÀ]¾|xÑ•\ó‡qÚ»\Ö\nµy¥\ë¤\ëz5w\ÃKÀ-K\Ìo·\Ôuıy x c\Ü\õ½j;^y5w\ÃKÀ-K\Ìo·Îœ9\ó\Ï\ó>@\ñ<@?\Æ\n¸y\Õv¼J·\Í\ïOM¼Ü²\Äüv[§\Óù³¼P<\Ï\0Ğ±nZ\'[ùı©‰—€[–˜\ßn\ïv»š\÷Š\ç@\0ú1VÀUSWnYªªZ2kÖ¬?\Éû\0\Å\ó \0ıp›UnYb~»£\Ó\é<2\ï\Ï3€\0\ôCÀmV	¸ep\Æ\á\0	@?\Üf•€[–˜ß–\r\rıq\Ş($\0ıp›UnYêº¾s»\í¶{D\Ş($\0ıp›UnY—u:‡\ç}€\â9@\Ğ·Y%\à–%æ·»fÌ˜\ñGy x\0\ôCÀmV	¸e‰ù\í\îm·\İ\öay x\0\ôCÀmV	¸e‰ù\íN§\ó‡y x\0\ôCÀmV	¸e‰ù\í\ŞY³f=4\ï\Ï€~¸\Í*·,1¿-\ßf›mş \ï\Ï€~¸\Í*·,1¿\İ\×\ét~?\ï\Ï€~¸\Í*·,\æ7€q\Ä\ò7;\í´\Óÿ\Ëû\0°.n³JÀ-‹ù\r`q€¼Ú´i¿—\÷(W:/\Ôu½oœ#®Œ·\Ï/O\ÜfÕºnUU¯\Ç\òŠ\ô˜:\ço\Ìo\0\ãˆ\äŠN§\ó»y€2Ez\î{\îù\Ë\Ë/¿|\ñ’%K.\Øk¯½.s\Å\ó?)\'\à6«\Æ¸\ñ\Ø\íµ\ï¾ûŞ¼t\é\ÒK¯º\êª[\ßş\ö·_–\ãüz´‹ù\r`q€\\yÀ<$\ïP––9}ú\ô#¿úÕ¯Ş±bÅŠ\å\Ã¸k\îÜ¹\r\r]\×y\ê\È\õ\ÜfUpSø™9sæ‘§œr\ÊÍ«V­ú\ÍÈƒ™>>é¤“\î\Ü~û\íJù\è\Û\Ğ\æ7€q\ÄrUü\ó;y€r\Ôu=\Ã\ò¯o\r£‚\íƒ,]º\ôºı\÷\ßÿ\ö‘Yp›U£\îv\Ûm\÷ˆC=\ôü[n¹eYş8¸#\ÄunIı{ma~G \Çü‘&\0¶|N\ç	;\í´\Ó,HÁve‚Æ°bşüù·\î¸\ã_;w\îZ!KM]\ÜO|\âOMçª?xcù\ñ¼d\Ï=\÷œ—\ö…|ÿ ¹\Ìo\0\ãH\È^­\ê\Õ\Ê^­ˆº¿W¿‰º¯WË£\î\í\Õ=½º;\ê®^-«\ëú\ÎT\ñ\ñÒ¨;RUUµ$U||{\Ôm½º5\ê–^ı:jq¯nZÔ«›zucÔ¯zuC\Ô\õ½º.\ê\Ú^]Ó«…QW\÷êª¨+{uETú]²\Ë\ã\ë»,U|üË¨KS\Å\ö%\ñ\ïÅ½úE|½?Oÿ¬W?íŸ¤Š\õ£^]ua¯.ˆúa¯\Î\ï\ÕyQ\ç\ö\êQ\ß\ï\Õ9QR\Å\çş^ªøøì¨³R\Å\öüøw^¯ÎŒ\í3R\Å\Ç\ß\í\Õ\éñµœ–*>ujª\ØşNüû\í^’*zßŠO\î\ÕI±}bªøø„¨o¦Š\íoÄ¿_OŸ\çk©\â\ã¯FŸ*¶ÿ/ş=®W_‰\í/§Š\í\Õ1±}tªøøKQ_L\Û_ˆ?ß«Ï¥Š\Ï\õ\Ùø\÷3½:*¶Luxª\ØştªøøSQŸLÛŸˆ?*\î\÷c±ı\ÑT±ı‘\Øşpª\Ø>,U\ô>Û‡¦Š\í\Æ\ö!©bû\àø\÷½ú\ßT\Ñ{ü{P¯\Ş\Û¦Šˆzoª¸\÷¤Š\÷\Ú/Ul¿;ş}Wª¸şÿ\Ä\ö;S\Å\ö;b{\ßT±ı\öT\Ñ\Û\'¶\÷N\Ûo‹\í½R\Å\ö[c{\ÏT±½Gª\è\íÛ»¥Š\í·\Ä\ö®©b{—\Ø\Ş9Ul¿9U|¼SÔ©b{Nüû¦^\í×Ÿ*>•*.\ß>¶g¦Š\í±==Ul\Åv7Ul×±=˜*¤ÿT\Ñ\Zˆ\íNª\Øş\ï\Ø~cª\Ø~Cl¿>Ul¿.Uµ\æ\Íl¶K\Û\Û\Æ\ökR\Å\ö«»\İ\î«R\Å\ö6©\â\òW\Æ\ö+R\Å\ö\Ëcûe©^\Z\×Iª\Ø~qª\è½(¶§¥Š\í­cû¿R\Å\öcû©bûù±ı¼T±ıŸ©\â~Ÿ\Û\ÏIŸ\ç?bûÙ©bû\ßcûY©bû™©¢\÷Œ\Øş·T±ı\ô¸ı\ÓR\r\r\rıklÿKª\Øş\çT\éGucûŸR\Å\ö?\Æ\öSR\Å\ö“\ã\öÿ*¶Ÿ”*zOŒ\í¿O•BD|¿K\Û\Û“*¶Ÿ\ç¯S\Å\ö\ãRE\ï±Ó§Oÿ«T±ı˜ø<N5cÆŒ¿Œ\íG¥Š\í¿H5s\æ\Ì?\í?K\÷û§³f\Íú“T±ıÈ¸\Ï?N•^\ÕK½‡\Ç}üQú\Z?ü\ğ;—-[v_z\Ö\ç®p\ä‘G/\\¸p­ ¥¦¦RÀ½è¢‹\öY²dÉŠü\ñZŸ\åË—¯8ú\è£\ï}#­™´¿¦ı7\í\ÏiÿNûü\Óz\ë\"­“´v\ÒZJk+­µ´\ö\ÒZLk3­Õ—\ö\Ö\ô6\Ñ{u½\æ8\é8‘\é8’+\éX“=3\×£v¨\×\Ã\Ò1-\ã\Ò1/\Ó11\'\Óq3G\Óq5k\Ó\ñ7\ß[¯9^§\ãw:\\­9\æ§s@:\'¤sD:o¤sI:·9¸\æ\Ü\ó¹z\Íù)¯\Òù+\Ï\Òù-\ï\Òù/\Óy27\Óy4[Ó¹\ö\ôzÍ¹8›Ó¹:»\Óù<\ß\Ó9?\Íi.HsBš\Ò‘\æŠ4g\\6¸fI³IšU\Ò“fš4ã¤™\'\Í@i&º­Z33¥9j\Ù\àš9+\Í]iK\óYš\×\\€\õH?\æ\ò;\é\÷9RÅ‰\íwÓ»\ó¥JoCÛ¿Ÿj›m¶ùƒšš*¶ÿ0Uz\ã‘4,¥Jƒ\Ó\È•ª4\\¥\Z¶\Ò\à52„¥¬\î\rg±ı¨4´¥Š\íG\Ç\öcRwq l§7\ô¥0¶Ÿ*¶ÿ&\r‰©{Cc\ô02L\Æ	â‰Ş™NØ±ı\äT\Ş0\ZŸ\ë«Ş\Z\ÛO­{\ÃklÿK\ZjSÕ½!7zOO\'øT\ñyQ\õ†\â\Ø~Vlÿ{ª\Ø~v:\ñ§\Z\ì\r\Õ\Ñ{n\İ¶cûyiO\Û/ˆ\í¦\ZÖ£·\õ`oˆO}\İ\îcû%ihHU\÷B@\Ü\ï\Ë\Ó‘*¶_Y\õBCl¿*®ÿ\êTU/\\\Ä\å\Û\öBGl¿¶î…‘\Ø~}l¿!Ul¿1¶ÿ;U\Õ3\Ñì…œ0X\÷\Äv7¶‡RÕ½½U/<\Å\ö\öƒ½PU­	X;\ôjuøª\×1«CY\ÔN\õam\ç¸ş.©\ê^¨‹\Ş[ª^Ø‹\í\İ{!0¶\÷Œ\í·¦Š\í½bûm©\ê^ˆŒ\Ş>U/\\\Ök\Ş\r\ö©bû±ı?©{\á´Z3(­­QûW„\ÙnS\È= ~ \ô¾o°†\ë5ÁxuHú@lœ*>>$nÿÁTu/dG\ïCU/|\Ç\ö‡cû#©bû£±ı±Tƒ½\ğ^­	\ò«C}Ô§ª\Â~\nÿ\éI€#ª8j°\÷dAµæ‰ƒ\ÕO\"D}>\î\ó©{O6D}©~\àIˆc{ON\Ôk»¯\ô\ê¸\Øş¿Tƒ½\'7¢¾Z?\ğ¤\Ç\×\ã\ó|#\Õ\àš\'GÒ“$\'T<ir\Ò`\ïÉ”j\Í+«Ÿd‰úvl\'\Õ`\ïÉ˜¨¹\ÕOÒœ>\Ø{\ò¦^3<Ù«\ÕO\ò\Ôk\ğYı\äO\Ô\Ù\õO\n¥\'‰\Òp™*=q”†\ÌT#O*¥\'˜FlJO<¥\á3UzB*\r¡©F¬úq\õÀ“X?\ì=¹U­PÑ«\ÕO‚\Õk[ı\äX\Ô/\ë4KO¢¥6\ÕÈ“ki˜y\Ò-\rµ#OÆ¥\'\æÒ€›*=a—\İT#Oæ¥¡w\äI¾4ü¦\'ÿR¥!8=)˜j\äI\Â\ô„\áÈ“‡·W<©˜dLC\ò\Òú\'\ÓÀ¼úIÉƒ>ø¾Å‹\çyg½n¹\å–\á\Ã;,=9:ü«_ıj­°¥6|\ò\É\ÃúĞ‡V?6“u\íµ×®\Úo¿ı\Òş”\öÏ´¿¦w\\¾lp\Íş\öù´ÒºH\ë$­´–\Ò\ÚJk\íœ\ŞZLk3­\Õ3zk:­\ñ´\î\Óq \Òq\â½\ãH:®¤cM:\ö¤cQ\n™Ÿ¯\Ö\Ã\Ò1\íˆj\Í1/\Ó11\'\Óq3G\Óq5k\Ó\ñ7¨\Ö¯\Ó\ñ;\Ï\Ó1>\ó\Ó9 \Ò9\"7Ò¹$[Ò¹&{\ŞÛ³\ë5\ç«tşJ\ç³t~‹WŸ\Óy1\'\Óy\ó5\é\ÜZ¯9×¾¼w.N\ç\æt®N\ç\ît>OO®=§Z3¤¹ \Í	O\ï\Íi®Hs\ÆSz³HšMf˜\ŞL“fœ\Ç\ôf 4ıYš™zs\Ô\ÃÓœ•\æ®\Ş<–\ŞXÊ&\0ÀX\Î?ÿü?:ÅŠ\ëı‘\ÖU«V­X°`Á\ÂÙ³g\ß|è¡‡§_\ÙÍƒ\ÖTUü¯ŒY›\ë\ò©®\ô\nn„£GÏ™3\ç\ßş\ö·\ï]\ò\Ç/·[5şü³¿\öµ¯ı\áV\0\0\0[Šc=v\Î\ÕW_=\î+_w\İuw\ï·\ß~W¤W½\ÒO\ó4\íM¦¶\Z#l\îm\êË§ºF¿\ÉT\nºt\ĞÑ—]v\Ùıù\ã8\â\ÒK/]~ø\á‡O¹\r\0\0Àe\÷\İw\Ô7¿ùÍŸ\Ş{ï½¿ı=\Î{\î¹g\Õ×¿ş\õ‹·\ß~û—¾®€;voª*ÿ3AI\nº\'x\âiË–-û\í«\ów\ß}\÷ı_ù\ÊW.J¿&”_\0\0`‹³ÿşû\ï{\ÑE\İs\Ùe—]\õ¹\Ï}\î¿\ò\Ëw\ì\ŞT\ÕXwÄ±\Çû”Ÿ‡\ó\Ï?ÿ®}\ö\Ù\çmù\å\0\0\0Ep\Ç\îMU­+\à\0\0°\îØ½©*\0\0 O\îØ½©*\0\0 OM¸c\Õ\æº|ªKÀ\0\0\èS\Ón\é%\à\0\0\ôIÀmV	¸\0\0\0}p›U.\0\0@Ÿ\Üf•€\0\0\Ğ\'·Y%\à\0\0\ôIÀmV	¸\0\0\0}p›U.\0\0@Ÿ\Üf•€\0\0\Ğ\'·Y%\à\0\0\ôIÀmV	¸\0\0\0}p›U.\0\0@Ÿ\Üf•€\0\0\Ğ\'·Y%\à\0\0\ôIÀmV	¸\0\0\0}p›U.\0\0@Ÿ\Üf•€\0\0\Ğ\'·Y%\à\0\0\ôIÀmV	¸\0\0\0}p›U.\0\0@Ÿ\Üf•€\0\0\Ğ\'·Y%\à\0\0\ôIÀmV	¸\0\0\0}p›U.\0\0@Ÿ\Üf•€\0\0\Ğ\'·Y%\à\0\0\ôIÀmV	¸\0\0\0}p›U.\0\0@Ÿ\æÍ›·\ê\Ş{\ï]+h©\Í_\ñ8\Üwyş\0\00,¸i\ñ\â\Åk…-µù\ëº\ë®;>\îùc\0\0ÀÌŸ?ÿµgŸ}\ö\ÒE‹\İ\ê•Ü©©ø¾/º\ö\Úk‹p{}Ô«\ó\Ç\0\0€	J¡*½ru_úPµ\Ù+}\ß\Ó\÷_¸\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€\Éøÿµ¿£f\Çû\0\0\0\0IEND®B`‚',1),('94f8114a-1cdd-11ef-95cf-00ff29e62bab',1,'process/performance.bpmn20.xml','94f81149-1cdd-11ef-95cf-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('951e0fdb-1cdd-11ef-95cf-00ff29e62bab',1,'process/performance.performance-001.png','94f81149-1cdd-11ef-95cf-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('a51f2bcb-1ce0-11ef-962e-00ff29e62bab',1,'process/performance.bpmn20.xml','a51f04ba-1ce0-11ef-962e-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('a53bb47c-1ce0-11ef-962e-00ff29e62bab',1,'process/performance.performance-001.png','a51f04ba-1ce0-11ef-962e-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('c4eeb38f-1e41-11ef-877e-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','c4eeb38e-1e41-11ef-877e-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\">\r\n  <process id=\"Expense\" name=\"ExpenseProcess\" isExecutable=\"true\">\r\n    <documentation>æŠ¥é”€æµç¨‹</documentation>\r\n    <startEvent id=\"start\" name=\"å¼€å§‹\"/>\r\n    <userTask id=\"fillTask\" name=\"å‡ºå·®æŠ¥é”€\" flowable:assignee=\"${taskUser}\">\r\n      <extensionElements>\r\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\r\n      </extensionElements>\r\n    </userTask>\r\n    <exclusiveGateway id=\"judgeTask\"/>\r\n    <userTask id=\"directorTak\" name=\"adå®¡æ‰¹\">\r\n      <extensionElements>\r\n        <flowable:taskListener event=\"create\" class=\"com.example.expence.task.ManagerTaskHandler\"/>\r\n      </extensionElements>\r\n    </userTask>\r\n    <userTask id=\"bossTask\" name=\"suå®¡æ‰¹\">\r\n      <extensionElements>\r\n        <flowable:taskListener event=\"create\" class=\"com.example.expence.task.BossTaskHandler\"/>\r\n      </extensionElements>\r\n    </userTask>\r\n    <endEvent id=\"end\" name=\"ç»“æŸ\"/>\r\n    <sequenceFlow id=\"directorNotPassFlow\" name=\"é©³å›\" sourceRef=\"directorTak\" targetRef=\"fillTask\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é©³å›\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"bossNotPassFlow\" name=\"é©³å›\" sourceRef=\"bossTask\" targetRef=\"fillTask\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é©³å›\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"fillTask\"/>\r\n    <sequenceFlow id=\"flow2\" sourceRef=\"fillTask\" targetRef=\"judgeTask\"/>\r\n    <sequenceFlow id=\"judgeMore\" name=\"å¤§äº500å…ƒ\" sourceRef=\"judgeTask\" targetRef=\"bossTask\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money > 500}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"bossPassFlow\" name=\"é€šè¿‡\" sourceRef=\"bossTask\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é€šè¿‡\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"directorPassFlow\" name=\"é€šè¿‡\" sourceRef=\"directorTak\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é€šè¿‡\'}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"judgeLess\" name=\"å°äº500å…ƒ\" sourceRef=\"judgeTask\" targetRef=\"directorTak\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money <= 500}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_Expense\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"Expense\" id=\"BPMNPlane_Expense\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"285.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"fillTask\" id=\"BPMNShape_fillTask\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"405.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"judgeTask\" id=\"BPMNShape_judgeTask\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"585.0\" y=\"130.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"directorTak\" id=\"BPMNShape_directorTak\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"735.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"bossTask\" id=\"BPMNShape_bossTask\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"555.0\" y=\"255.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"771.0\" y=\"281.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\r\n        <omgdi:waypoint x=\"315.0\" y=\"150.0\"/>\r\n        <omgdi:waypoint x=\"405.0\" y=\"150.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\r\n        <omgdi:waypoint x=\"505.0\" y=\"150.16611295681062\"/>\r\n        <omgdi:waypoint x=\"585.4333333333333\" y=\"150.43333333333334\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"judgeLess\" id=\"BPMNEdge_judgeLess\">\r\n        <omgdi:waypoint x=\"624.5530726256983\" y=\"150.44692737430168\"/>\r\n        <omgdi:waypoint x=\"735.0\" y=\"150.1392757660167\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"directorNotPassFlow\" id=\"BPMNEdge_directorNotPassFlow\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"110.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"37.0\"/>\r\n        <omgdi:waypoint x=\"455.0\" y=\"37.0\"/>\r\n        <omgdi:waypoint x=\"455.0\" y=\"110.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"bossPassFlow\" id=\"BPMNEdge_bossPassFlow\">\r\n        <omgdi:waypoint x=\"655.0\" y=\"295.0\"/>\r\n        <omgdi:waypoint x=\"771.0\" y=\"295.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"judgeMore\" id=\"BPMNEdge_judgeMore\">\r\n        <omgdi:waypoint x=\"605.4340277777778\" y=\"169.56597222222223\"/>\r\n        <omgdi:waypoint x=\"605.1384083044983\" y=\"255.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"directorPassFlow\" id=\"BPMNEdge_directorPassFlow\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"190.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"281.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"bossNotPassFlow\" id=\"BPMNEdge_bossNotPassFlow\">\r\n        <omgdi:waypoint x=\"555.0\" y=\"295.0\"/>\r\n        <omgdi:waypoint x=\"455.0\" y=\"295.0\"/>\r\n        <omgdi:waypoint x=\"455.0\" y=\"190.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>\r\n',0),('c5191ef0-1e41-11ef-877e-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.Expense.png','c4eeb38e-1e41-11ef-877e-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0M\0\0Y\0\0\0D\ÛÄˆ\0\0+xIDATx^\í\İ°œuy?pD«x+VG«\âF¦jk§vlgZ´CP\ÛQ‹ş\õ\äp’\"$	\å&Õ¿‘¨ÜŠ\ØTG\Û¼UEK¡\Ö  „$”(¤\ÊEBH\"‚$\ËûŸıgO7¿³\Ùl\Î9»û;û~>3Ïœs\Ş}\÷B\ö\å9\Ïw»\ï\Ùk/\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 Z8\âˆB)¥T\ëJ{\'\0P!†€\Ö\ôI\0¨8\Ã\0@kú$\0Tœa\0 5}\0*\Î0\0Ğš>	\0g\0hMŸ€Š3\0´¦O@\Å\0Z\Ó\' \â\0­\é“\0Pq†€\Ö\ôI\0¨8\Ã\0@kú$\0Tœa\0 5}\0*\Î0\0Ğš>	\0g\0hMŸ€Š3\0´¦O@\Å\0Z\Ó\' \â\0­\é“\0Pq†€\Ö\ôI\0¨8\Ã\0@kú$\0Tœa\0 5}\0*\Î0\0Ğš>	\0g\0hMŸ€Š3\0´¦O@\Å\0Z\Ó\' \â\0­\é“\0Pq†€\Ö\ôI\0¨8\Ã\0@kú$\0Tœa\0 5}\0*\Î0\0Ğš>	\0g\0hMŸ€Š3\0´¦O@\Å\0Z\Ó\' \â\0­\é“\0Pq†€\Ö\ôI\0¨8\Ã\0@kú$\0Tœa\0 5}\0*\Î0\0Ğš>	\0g\0hMŸ€Š3\0´¦O@\Å\0Z\Ó\' \â\0­\é“\0Pq†€\Ö\ôI\0¨8\Ã\0@kú$\0Tœa\0 5}\0*\Î0\0Ğš>	\0g\0hMŸ€Š3\0´¦O@\Å\0Z\Ó\' \â\0­\é“\0Pq†€\Ö\ôI\0¨8\Ã\0@kú$\0Tœa\0 5}\0*\Î0\0Ğš>	\0g\0hMŸ€Š3\0´¦O@\Å\0Z\Ó\' \â\0­\é“\0Pq†€][¶l\ÙG\æÎ[^\0T„\Ğ\Ğ\\Q/Ú°aÃ¦µk\×³fÍº6½\0¨¡	 ¹\åË—_U\ì°p\á\ÂG‡††¦¦û\0\0 4Œ¶r\åÊƒ·m\ÛV\ÏL\Å\ö\íÛ·Í™3g\ÍÀÀÀ¾\é¾\0@Ÿš\0vVf¤g¯Y³æ‘‘Ä´Cl›>}ú\éş\0@Ÿš\0v¶lÙ²/¦©\î\â‹/~|pp\ğ/\Ò\ë\0\0}¢H‹\"$\í¦¥\×¨Š\á\á\áı7o\Şü¿\ï\ËKlİº\õ©“O>ù®)S¦<\'½.\0\Ğ\Ê@4¥IHJkJz=€ª¸ÿşû\ïHƒRê®»\îzxhh\è\éu€>+IM‚’U&€Ò­·\ŞúT\Z’R\ëÖ­»±\ì—¤\×\0úD¬$5	KV™\0Js\æ\Ì9\çé§ŸŞ’¥Oœz\ê©­4@Ÿ‹¥&\É*Py\ñY¥K/½tuš”\ê–.]ú­²_\Ş\î3M\0\Ğ\çv±\Ú4%\İ ŠfÌ˜qĞªU«IÓ¶m\Ûn>}úƒÎ\0‘¬6Yehp\Şy\ç}o{©!3mme¿<?\İ\0\èS\ÉjÓ”\ôr€*\Ø\÷º\ë®\ÛXOL\Ã\ÃÃ—”½\òÁØ\î\0\ô±újSº€½\ö:\å”S>¼~ıúgÖ®][Ìœ9\óWCCCS\Ó}\0€>W_mJ·\ğÿ]x\á…ÿ3w\î\ÜX‘ŸŸ^\0\ìFQ\Ï]±b\Å-Y²\ä™\×]wİ¤¬M\é¶\ÉR\å¿û\öÅ‹?´p\á\Â\Ã\Ó\ç\è½~\è“\ó\æÍ«\õ\Éøš^6JŸ §\ÊA\à{\å/¢bÍš5Å¦M›Š§Ÿ~Zu¹\â\ß=şıo¸\á†\r\åp\ğ\ô9z«_ú\äC=4j\Ûd)}€ŠWN\ãQúJu¿†‡‡×–\ÃÀ\Í\és\ô–>™O\é“\0\ôD¼\Õd2¿r\ÚO\ÏC9lNŸ# ·\ô\É|JŸ \'\â½\â\é/%Õ»Š\ç#}€\Ş\Ò\'\ó*}€®kwx\ò\ñ\áb\Å-\ß,\î¼ş\ÌZ\Å\÷±-\İO¯}2¯\Ò\'\èºv†\ëWw\\;§¸ıªÿ»SÅ¶¸,\İ_½}2¯\Ò\'\èºv†\î¼b\Ô P¯\ï¼r\Ôşj\ìe€ü\è“y•>	@×µ3Ü½\è¼QC@½\â²t5\ö2@~\ôÉ¼JŸ \ë\Ú\î¸î³£†€z\Åe\éşj\ìe€ü\è“y•>	@\×\ò*\Ã\0\äGŸÌ«\ôI\0º®a \Î•\õŠ\Ë\Òı\Õ\Ø\Ë0\0ù\Ñ\'\ó*}€®kg¸\÷§ÿ6j¨W\\–\î¯\Æ^†È>™W\é“\0t];\ÃÀc«Y\Ü\ñ£ÏŒ\Zb[\\–\î¯\Æ^†È>™W\é“\0t];\Ã@\ÔÊ¥\Zb[ºŸ\Z_ ?úd^¥O\Ğum\r›7\÷\ŞtÁ¨a ¶\Åe£\öWc.\Ã\0\äGŸÌ«\ôI\0ºnw\Ã@ü%ûe?ı\×Qƒ@½\â2\í~\â\Ê0\0ù\Ñ\'\ó*}€®\Û\å0°ys1|\ï\Â\âW×œ6j\0H+\ö‰}½š:ş2@~\ôÉ¼JŸ \ëš\r»{\ÕtW\å\Õ\Ô\ñ—a\0\ò£O\æUú$\0]\×lh\çU\Ó]U\\7½=\Õ~²\ó‚tÕ£O\æUú$\0]\×lHÁ\ïi¥·§\Ú/\Ã@V.kÍ¯T˜>™W\é“\0t]³a@\õ®Ù¨¦\ïø*8U˜>™W\é“\0ta ¯2d!]aJ¦b\ôÉ¼JŸ \ëy•a \çvvµ\n\Ğ\'\ó*}€®3\äU†\Ú]0\Ú\İ\å\ô)}2¯\Ò\'I«(Š½—,Y\ò.º\è¢q\Ækÿ\ñÿq\Ó\ñ\Ç¿ıˆ#(fÏ½\å\ãÿø\å¶\ågu\Ö\Ü3f¼6½>½cÈ«=\Ón jw?úˆ>™W\é“À¤S†¥}®¹æš¯Î™3\ç™c9¦8ÿü\ó‹Ÿı\ìg\Å}\÷\İW<\ö\ØcEˆ¯\ñsl\ËgÍšµ\í¤“NZq\ì±Ç¾;½=º\Ï0WzbOƒĞ\î\Ï$§O\æUú$0©”!è„³\Î:k\ÓG?ú\ÑbÉ’%Å¶m\Ûj!iwb¿\Øÿ\ä“O\Ş\ò\÷ÿ\÷¿|Cz\Ûta ¯2t\İX\ĞX¯\Ç$¤O\æUú$0)”¹\çY\×^{\íw\Üq\Åüù\ó‹­[·¦¹¨-q½¸ş\ÑGı\ä\Ğ\Ğ\Ğa\éı\Ğ†¼\Ê0\ĞU\ã\r>\ã½>“„>™W\é“@\öÊ¬\ó¬y\ó\æıüø\ã/~ı\ë_§9hL\âv9æ˜§¦M›6+½?:\Ï0Wºf¢\ÏD\İ\Ó\'\ó*}\È^¬0Í=»X³fMš}\Æ%noÆŒ§NzhzŸt–a ¯2t\ÅD‰¾=2£O\æUú$µ›nº\é„LµÂ”*owû‡?ü\á\õ¦\÷M\ç\ò*\Ã@Ç¥\çYeµ\ã\ëH¯—\Ş.}DŸÌ«\ôI [e¦\Ù\ç\ì³\Ï\ŞŸA\ê¤\Ë/¿|ı´iÓ®I\ïŸ\Î1\äU†JƒMo”ÿ\æ\ñµ\İà´«ë¥·OŸ\Ğ\'\ó*}\È\Ö\ÕW_ı•8K\ŞXOúĞ®¸ıc9\æÑ©S§’>:\Ã0W:¦Y ‰•¢ø\÷®W;Á©10\Õ\ë\Ã\r—7»&9}2¯\Ò\',•Yf\ï\ÓO?ı™8Mx7ü\ä\'?yüˆ#¸1}t†a ¯2tÄ®‚L³\0\Ô*85\Ûÿ\ë;¶7\Ú\Õı1I\é“y•>	dé¦›núÀ±\Ç\Û\ö\ßa\Z¯¸Ÿ\éÓ§?>00°_úXh_<•5%İ2\äU†\æ\Ú=›\Ø]€i„š§fû5Lu»»_2\Ğ\îq¥O\æUú$¥oû\Û×şùi¶\é¨3\Î8\ãÁÁÁ\ã\Ó\ÇBû\ÊA \ØQ-‡\Ã@^eh®\İ\ã9\Ñnpiˆ\ZƒS³\Ë[¦ºv\ïŸi\÷¸\Ò\'\ó*}\È\ÒYg\õh·ŞšWwı\õ\×\ßYş›—>\Ú\×0´\ny•a ¹v\ç{\ZXš£øy\ï&\Û\Û	Lu{ú8\è¢v+}2¯\Ò\',}\âŸØ´bÅŠ4\×t\Ô=\÷Ü³ªü\ÅuKúXh_“a \éP`È«\Í59›\Ï;Œ5¨4N\÷$?\ïI`ª\ë\ã¡ÃšOM+}2¯\Ò\',Í={ûºu\ë\Ò\\\ÓQ=\ö\Ø\Æ\ò\Ö\ê\ô±Ğ¾&C@Zµ¡ ‡a\à§?ı\é¨mimØ°¡\öG·\İt\ÓMÅ¦M›F\í{\Ë-·O>ùd\íû§zjd{\Ç\é¾\å±6j[;§Seh®\É\ñ›V\íx\Şkü¥Yp\ZO`ª\ï\ã¢šGiÕ«ú\äxkÙ²e\Å<0j{Z?ÿù\ÏGm»\ñ\Æ‹\'xb\Ô\ö^•>	d\é\È#,¶lÙ’æš*\ï\ï‰&¿¼T*‡a\àu¯{]q\ÕUW\Ú\ŞX«W¯.ş\ò/ÿ²øú×¿^ûù‘G)^ş\ò—ÿü\Ïÿ\\¬\\¹r§}?\ò‘§œrJ\íû?ù“?)fÌ˜Q«·½\ímÅ—¿ü\å\ö}\ë[\ßZ|\÷»\ß-–.]Z\Ä\ÛPcÛ³Ÿı\ì\Ú\Ï_ø\ÂŠ\Ç|\Ôc\éd¥Ïj¿Š}\ö\Ù\'†©§}l\Å[\ò\Ò¦ø9¶\Ç\Ç\ÓÇ¬&G\å\Ğ\'Û©‡~¸\ö¢Ñ½\÷\Ş[û9^(ú\ío[û>¶½\æ5¯Ù©§5{\Ñ\é\ío{Ÿc¾\ò\Ê+‹8	T„¥\Ã?¼8ı\ô\ÓG\íÛ«š€,w\Üq[º½\Ò\ôè£.?\ÂJÓ¸¤¿\ôj\Ñ=~\ÛIü¢>\ãŒ3Šµk\×\Ö~şƒ?øƒ\"\Ş\Z\ß\æ3Ÿ‰\Ó\Î\ï´ÿ\ç?ÿù\Ú/\ï¿ù›¿)<\ğÀ\Ú\÷S¦L)ş\ôOÿ´8ê¨£jƒrŸúş\'œpBqÁ7n,~\÷wwdhø\ë¿ş\ë\â\Úk¯\Ù\ï¾û\î«]\÷ƒü`\ñ\Ú×¾¶øı\ßÿı\âŠ+®¨m‹\Ç¡\ìê«¯\õø;Y†\æš\ÇM\ç½Æ¿¢\Ój¥©\ÙY\õ\Ú5\Ş\ÇE49šW½\è“c©C9¤v¬~\ç;ß©ı}\öCúPüı\ÃbÖ¬YµË¢gÎœ9³\öBÒ›\ßü\æ\â¶\Ûn\Û\é6¢·.Z´¨\Ö\ßû\Ş\÷Ö¶\Å—]vYm¥*újz¿\İ.}\È\Ò\Ç>\ö±\'ºı™¦»\îºk\é>\Ó4.»\êz5<\ïy\ÏY!jMl\â\Î\Æ}\ã­y\õWD.\\X¼\ó\ï¹¬¼¢¾\ño\Ô?ú£?ª­ ı\ñÿqmHx\ğÁk¿dc@¸ı\ö\ÛG\ö?ûì³‹‹.º¨Ø¼ys\í\Õ\×/~\ñ‹µ\ë?ÿù\Ï/?şø\â‡?ü\á¨\Ç\İ\é24\×\î\ñ¼\ÃXJ³À”®8%8\õ\ñ\Ğa\íW½\ê“{Z±Zş¬g=k$4pÀ\ñût\ä\ò—¾\ô¥#!)V\İ\çÌ™S[ÅŸ#$\ÅRû\í·_\ñ¦7½©\ö\Õû\ßÿşZHŠ\Ğ\ôı\ï¿\Ö{£G¦\÷\Û\í\Ò\',v\ÚiËº}\ö¼\Ë.»\ìŠ#œ=o\\v7\Ô\õjx\á_8\ò}chŠÕ¤Fû._¾¼8\î¸\ãj¿\Ğ\ã—\ö\ßø\Æ\Ú\÷Q±B\ôOÿ\ôOµı\âsL\ñ¦~\ô£µ•¦C/{\Ù\Ëbå²¶o¼\Å$¶Å¾\ñ–“W¿ú\ÕE¼ı\ô°\Ã+\Ş\ó\÷û\ï¿\íşŸ\óœ\çş\ç^¼ş\õ¯/~\ñ‹_Œz\ì,\Ã@s\í\Ï\r\ö4¨4L\ñ¦fg\ÏÛ“à´§ƒ.j\÷¸\êUŸL+\Ïÿ\÷—_~ù¨\Ï\'\Åg<\ã\óHû\î»\ïHhŠ·\ë½\ë]\ï\Z\é—/xÁF¾~½µ~ı\è¢.^¼¸\ö\âU\ôÀxût\ôÑ·¼\å-\Å\'?ù\ÉÚ‹X\é\ã\êv\é“@–\Î8ãŒ¹\İş;M\'x\â|§i|v7\Ô\õbˆ_\ÔLê¿¼_\ò’—Ó¦M	A\Í>ß´~ıú\Ú\×9_|\ñ¨Û«+R\ñJh|ş)‚V\Üv¼5%jhh¨\ö\Êi§oû\Û\Å\r7\ÜPt\ĞA\Å\Í7\ß\\[iz\îsŸ;\ò˜¢\â\çú[ûºU†\æ\Ú=\í–]¦V§©\à\Ô\îı\Ó#\íW½\è“i½û\İ\ïn<şj«\õ\ñù¥¸\ìK_úRm[|\óE/z\ÑHhŠŠ·\×ûX¼PT\ßşŠW¼b\Ô}\ÄO\Ñ\ã-z\ñ¶\å|\àµ\í±\ÒTÿ<i¥OY*\Ğ×–\ç¶Ršm:¢¼Ÿ‡\Ë_b–Mz¿\ô±0\ñz1D\è‰ ¾\êÓ¸\Ò\'qˆ\Ï$\Õ\Éÿò—¿¬m«™x{\ÉÔ©SG~W‰cxˆBD¸A >›t\Şy\çÕ®¯\Æ~\ñ”N\ßü\æ7k\Ûü\ã×¶Ç¾±º¯¢–ÿ;=\Îx\ÅVhš\ôv\\š¢fg\Ék¶_«à´»ûe\éEŸL\ë+_ùJ1şü\Ú[ŠO<\ñ\Ä\Ú1XG±\Z4{\ö\ì\â\Ö[o\İi{\Ô+_ù\Ê\âè£®½˜+M\õ\ã\Ä\÷·oo€/4\Åg?\ãóœ¡)>Ó”>¦^•>	dë¤“NZÙ­·\è]r\É%\ß-\á\Ó\Ç@g\ôbˆ\Ğ+K\õŸCS¼¯>U\ãş\õS…\×?\ÈÜ¸\Zoù\êW¿Z»<NCEı\íy±-B\Ó\õ\×__û¥ÿg\ög;‚<>\ëT_iŠŸßºb¥©¯\ì*À4B\ÍS]³ı›§]\İ“T/údZÿ\ò/ÿR[¡ÿ½\ßû½\Úg\öjGq\òš=\ñ}\ã\ö¨\è\ñ‚Q\ô´x[t½¿\Åu\ZûaüI‡øgı\íy\ÍB\Ó\İw\ß]m\éc\ëv\é“@¶\Êû\î“O>y\ËÖ­[ÓŒ3¡\Ê\Û L\÷N:\õ\ô1\Ğ½ş\ó?ÿ³\ö6»úÏ¡)\ŞG_ÿE\İX\×\\sM\ísG\ñù¤ø¹\ñ3Qi5†¦X™Š\÷\é\ÇI!ş\ê¯şª¸ÿşûw\Ú7BÓ¹\ç[[©z\ñ‹_¼\ÓeVšúJ³ s\Ô^\í¦ºfÁ\é\Ã\r—7»&¹^\ôÉ´\",zè¡µ\Õ\ò³\Î:«v\ì\Å\Ém\â-z\ñ§>ø\à\Úg\ö\Ş{\ï\Ú\ç˜\ê×‹³\ÖW\õcÕ©¾=\Ş\Ò\×\ì”ã¡\é}\ï{_\í„9qrœy\ó\æ\ÕÎªw\Úi§ºN·KŸ²v\â‰\'şbşüù\ÛÓ 3¶—\Íı›ehšŸ\Ş7Ó‹a\àsŸû\\\í\ÌL\õ·‰D8¬}¿°\ã„\rûÇ«¦qš\ÜÆ¿/\Òš†‡‡k_\ãƒÑ±\ê\á\ê\Â/¬m‹SÇ€+¥q¶¨<\"T\Åe1H\ÄJU\"\ñ\á\æúm\Æo\õ‹•¦\ÆWb»Q†JMc\0j\'0\Õ\í\êz\é\í\Ó\'z\Ñ\'ÓŠ\Ş\Ä\Ûç¢§}úÓŸ®½M9\Ş^:!ß«^\õªÚ‰r\"½\ã\ïuı¨¸~º­^\÷\ÜsO\ío\ÓÅ‰v\â¤\ÑK#€\Å\Û\Ï<\ó\Ì\Ú\ç¡\â\Ìz\ï\èU\é“@\Ö,‡Ú¿ş\õ¯Ó°3!~ü\ã»L\Ãq?\é}\Ó9½\" \Ä/út{T¼=$N\÷]ÿyÁ‚Å¿ÿû¿\×N[YQ\ñ6•ú\÷18\Ä\'N\ğ,€¸~|^)Ş¶W¿½8ını\í~Q\ßúÖ·j«Wq\İ?ü\Ã?¬m‹·©\Ä\ÛWzqj]\Ã@Ç¥Á&O¬µ˜\ê\Òë¥·K\éEŸ\ìDÅŸbH·\Õ+^D:\çœsj/\"\Å	!V­ZUÌ;w\Ô~9”>	dohhè°™3g>C\åD*›\ó•e`zh\êÔ©‡¦\÷Ig\å64{»HTü=¦vOu[+ÊÖ®î»›eèŠ‰8}{d&·>9\Ö\Ú\İ\Êy=°\Ò\'IaÚ´i³fÌ˜\ñ\ÄD­8\íXaZ]\Ö\Ì\ô¾\è¼~ú¥]3QAg¢n‡Œ\é“y•>	L\Z±\"t\ä‘G®¿ü\ò\Ë×\õ\äqÒ‡Ÿaz\Ø\nS\ï\ò*\Ã@W7\ğŒ\÷úLúd^¥O“\Ê\à\à\à¦M›v\í1\Ç\ó\èO~\ò“\Ç\Ûı;N\å~k.¹\ä’ÿˆ³\ä•uu\ÜNz\Ûta ¯2t\İXƒ\ÏX¯\Ç$¤O\æUú$0)\Å\éÁ\Ë\ğ³xú\ô\é>û\Ù\ÏşjÁ‚w\Üs\Ï=\÷¯]»\ö\É2#m|\ä‘GV\Üy\çK\ğƒ\\~\ÒI\']]\î»6\öwZ\ñ<\ò*\Ã@O\ìi\0\Ú\Óı™\ä\ôÉ¼JŸ&µı\Ê04{pp\ğŠ\ò\ë\Íe\Å\ß\\*v|½y\Ç\öÙ±_z]z\Ç0Wz¦\İ \Ô\î~\ô}2¯\Ò\'\è:\Ã@^e\è©\İ¢\İ]NŸ\Ò\'\ó*}€®3\äU†\ÛU0\Ú\Õv*@ŸÌ«\ôI\0º\Î0W²¤\ôg*FŸÌ«\ôI\0º\Î0W²QJ\ß\ñU`ª0}2¯\Ò\'\è:\Ã@^e\È\ÊÁq2›øš^@µ\è“y•>	@\×\ò*\Ã@^v„&*NŸÌ«\ôI\0º\Î0W\ò\"4\ôÉ¼JŸ \ëy•a /BAŸÌ«\ôI\0º\Î0W\ò\"4\ôÉ¼JŸ \ëy•a /BAŸÌ«\ôI\0º\Î0W\ò\"4\ôÉ¼JŸ \ëy•a /BAŸÌ«\ôI\0º\Î0W\ò\"4\ôÉ¼JŸ \ëy•a /BAŸÌ«\ôI\0º\Î0W\ò\"4\ôÉ¼JŸ \ëy•a /BAŸÌ«\ôI\0º\Î0W\ò\"4\ôÉ¼JŸ \ëy•a /BAŸÌ«\ôI\0º\Î0W\ò\"4\ôÉ¼JŸ \ëy•a /BAŸÌ«\ôI\0º\Î0W\ò\"4\ôÉ¼JŸ \ë,X°}Ó¦M£~)©\îWù<<T›\Ó\çˆ\Şšúd>¥O\Ğ‹/~hÍš5£~1©\î\×o~\ó›K\Êa\à\æ\ô9¢w„&‚>™O\é“\0\ô\ÄÂ…¿\á†6¯\õJjoªüw^µj\Õ\Å\å pY\ïIŸ#zGh\"\ôKŸ|è¡‡Fm›,¥O\Ğs\ñ(^¹+\ë\éx¯ød«‹.º¨ˆ\á6\İ>‰*ş\İ\ã\ß\ß ¡‰ºøÿs\Çÿ§“²O.Y²¤˜;wn1oŞ¼Q—M’\Ò\'`<\ÊÁv‘\á–Np\\\ÑŠ¢xÑ†\r6­]»¶˜5kÖµ\é\å\0@Ÿ+‡\Ú)1\Ø\î¨)\é\å0Bı`ù\ò\åW;,\\¸\ğÑ¡¡¡©\é>\0@«¯2\í¨E\é\å0B“\İÊ•+Ş¶m[=3Û·o\ß6gÎœ5û¦û\0}(Ye²\ÚÄ„š˜\ÌÊŒ\ô\ì5k\Ö<2’˜vˆmÓ§O¿ \İ\0\èC\É*“\Õ&&œ\Ğ\Äd¶lÙ²/¦©\î\â‹/~|pp\ğ/\Ò\ë\0\0}d«LV›˜PB“\Õ\ğ\ğ\ğş›7oş\ß\÷\å%¶n\İú\Ô\É\'Ÿ|×”)S“^\0\è»Xe²\ÚÄ„š˜¬\î¿ÿş;Ò ”ºë®»\Z\ZúDz]\0 \ÄJR“ ”Ö”\ôz°§„&&«[o½\õ©4$¥Ö­[wcyŒ?^\0\è±’\Ô$$¥eµ‰qš˜¬\æÌ™s\Î\ÓO?½%\rJ\r8\õ\ÔSZi€\n1\Ü\Ò	+&«ø¬Ò¥—^º:MJuK—.ıVy|\ß\î3M\0P!†[:Áq\Åd6cÆŒƒV­Z\õL\Z˜¶m\Ûv\ë\ô\é\Ót\ö<\0¨\Ã-\à¸b²;\ï¼ó¾·½Ô™¶Æ¶\ò\Ø>?\İ\0\ès†[:Áq\Åd700°\ïu\×]·±˜†‡‡/)\ëc{º/\0\Ğ\ç·t‚\ãŠ~p\Ê)§|xıú\õÏ¬]»¶˜9sæ¯†††¦¦û\0\0`¸¥W\ô‹/¼\ğ\æÎgŸ^\0T„\á–Np\\\Ñ/ˆ\ã9¾¦—\0a¸¥W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†:ÁqE?q<@\Å\è\Çı\Ä\ñ\0g W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†:ÁqE?q<@\Å\è\Çı\Ä\ñ\0g W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†:ÁqE?q<@\Å\è\Çı\Ä\ñ\0g W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†:ÁqE?q<@\Å\è\Çı\Ä\ñ\0g W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†:ÁqE?q<@\Å\è\Çı\Ä\ñ\0g W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†:ÁqE?q<@\Å\è\Çı\Ä\ñ\0g W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†:ÁqE?q<@\Å\è\Çı\Ä\ñ\0g W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†:ÁqE?q<@\Å\è\Çı\Ä\ñ\0g W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†:ÁqE?q<@\Å\è\Çı\Ä\ñ\0g W\ô\Ç3\0Tœa€Np\\\ÑO\Ï\0Pq†Æ«<†\Åq´›Z”^&}\0*\Î0Àx•\ÇĞ”&!)­)\é\õ`²\Ğ\' \âL„XIj”¬2\Ñ\ôI\0¨8\Ã\0!V’š„%«L\ô}\0*\Î0ÀD‰¥&\É*“>	\0g`¢ÄŠR“\Ğ4%\İ&}\0*\Î0ÀDJV›¬2\Ñ\ôI\0¨8\Ã\0)Ymš’^“‘>	\0g`¢\ÕW›\Ò\í0Y9 \âL´újSº&+\Ç3\0Tœa /EQ<wÅŠÿµdÉ’g,XP\\w\İuª\ËUş»o_¼x\ñC.<<}~¨&}\0*\Î0—20}¯Ø‹5k\Ö›6m*~úi\Õ\åŠ\÷ø\÷¿\á†6”!\ê=\ésD\õ\è“\0Pq†¼\Ä\nS\ì\é ¯º_\Ã\Ã\Ãk\Ë\ĞtsúQ=ú$\0Tœa /\ñ–<+LyT<ehÚœ>GT>	\0g\ÈK|¦&\ŞU\ï*\ô9¢z\ôI\0¨8\Ã@^\Ú\rMO>>\\¬¸\å›Å×ŸY«ø>¶¥û©\ñ•\ĞD\Ğ\' \âyi\'4m\\¿º¸\ã\Ú9\Å\íWıß*¶\Åe\éşj\ì%4\ôI\0¨8\Ã@^\Ú	M\ÜyÅ¨ÀT¯\ï¼r\Ôşj\ì%4\ôI\0¨8\Ã@^\Ú	Mw/:oTXªW\\–\î¯\Æ^BAŸ€Š3ä¥\Ğt\ÇuŸ–\ê—¥û«±—\ĞD\Ğ\' \âyš\ò*¡‰ O@\Å\ò\ÒNhŠ³\å¥a©^qYº¿\Z{	M}\0*\Î0—vBÓ½?ı·Qa©^qYº¿\Z{	M}\0*\Î0—vB\Óc«Y\Ü\ñ£ÏŒ\nL±-.K\÷Wc/¡‰ O@\Å\ò\ÒNhŠZ¹\ô¢Q¡)¶¥û©\ñ•\ĞD\Ğ\' \âyi+4m\Ş\\\Ü{\Ó£BSl‹\ËF\í¯\Æ\\BAŸ€Š3\äew¡i\ãú\ÕÅ²Ÿş\ë¨ÀT¯¸,\öI¯§\ÆVBS\õ”=qQ\ô\Å\İÔ¢\ôz\0@š\ò²\ËĞ´ys1|\ï\Â\âW×œ6*(¥ûÄ¾V\Æ_BS\õ”=qJ“”Ö”\ôz\0@š\ò\Ò,4\ínuiWe\Õiü%4US¬$5	JV™\0 ª„¦¼4M\í¬.\íª\âº\é\í©\öKhª¦XIj–¬2@U	Myiš\Ò ´§•Şj¿„¦\êŠ¥&\É*\0T‘Ğ”—f¡I\õ®„¦\ê\Ú\ÅjÓ”t?\0 „¦¼My•\ĞTm\Éj“U&\0¨*¡)/BS^%4U[²\Ú4%½\0¨¡)/BS^%4Q_mJ·\0bÈ‹Ğ”W	M\Õ300°_\Ùg^Q~½¹üúÈ•¦vü\Ûg\Ç~\éu€>%4\åEhÊ«„¦\ê˜:u\ê!e?\\\Ü\ğv¼vjq\\/½-\0 \ÏMyš\ò*¡©ÿ\r¾¡\ìƒW7	D{RW\Ç\í¤·\r\0\ô‰ø…Ÿn£w„¦¼Jh\êoS§N=thh\è\ñ\Æ\0t\ä‘G\ç{n±`Á‚\â¾û\î+{\ì±\"\Ä\×ø9¶\Ç\å±_œ\Ö\Å\í¥\÷\0\ô¡)/BS^%4\õ¯²\÷\Í,\Ó\Öz\è™>}z\ñµ¯}­X¿~}-$\íN\ìû\Ç\õ\Z‚Ó–¸\İ\ô¾\0€INhÊ‹Ğ”W	Mıi\Ç\n\ÓH`:\ñ\Ä‹•+W¦¹¨-q½¸~cp²\â\0}FhÊ‹Ğ”W	Mıg``\àÀiÓ¦­¯‡œO}\êSÅ†\r\Ò,´G\âúq;\rÁé±¸Ÿ\ô¾€IJhÊ‹Ğ”W	Mı§\ìy\óW˜\Æ˜\ê\âv’§ù\é}\0“”Ğ”¡)¯šúËÓŠ|†i¬o\ÉÛ•¸½\Æ\Ï899\0\ô	¡)/BS^%4\õ—²\ß\İX4q‡Nˆ\ÛmXmº1}\0À$$4u\Ç\Ã?|Àı\÷\ß\Çm·\İ\ö\ä§?ı\éš2e\Ês\Ò}‚Ğ”W\í*4µû|\Òe[TÖ”t{£ı\Ê}¶GÏ‹Ó…·{–¼=·\Ûp:\ò\íq¿\éc\0&¡©³\Ê\ê\ÙË–-û\â\æÍ›·Õ‡ªr\ßré¥—®1c\ÆA\éşBS^•†¦=}>é†•]†§ÁÁÁ\ã\ëû}\îsŸ«?}·_¿¯¸\ß\ô±\0\0“Œ\Ğ\Ô9+W®<xÍš5¤UİªU«9\ï¼\ó¾700°oı:BS^\Õš\Æ\ò|\Ò\r¡i—\á©üy^ı\òë¯¿>}ú&T\Ü~\Ãc™\×ø8\0€IHhšx\å\Ì\ô\â\åË—_µm\Û\Èb\Ä.m/•ƒù\ÆSO=\õ¨¸®Ğ”W\Å\óQŒ\ãù¤;š„¦Q\á©üzK}ûŠ+Ò§nB\Å\í7<†[’‡\0L6B\Ó\ÄZ¶l\ÙG6lØ°)¢vgıú\õ\Ï\\x\á…ÿ3oŞ¼Qƒûd¬\òß¡x\àFmo¬Ÿÿüç£¶\İx\ã\ÅO<1j{¯jÉ’%q*\é1?Ÿ¤\Ç¯IXJ+\Â\Ó\Úú\Ï\ëÖ­KŸ²	·\ßpß«\Ó\Ç\0L2M†5š;wn±v\í\Út†Ú­¸N\\7nã¡‡\Z5¼O†ŠA\ñ·¿ım\íû{ï½·x\Ík^S<şø\ã#—oÚ´i§ı\ßş\ö·\çŸ~q\å•W\Ç{l-,~ø\á\Åé§Ÿ>\ê¶{Q\ñ<L\Ä\ó©\ò«-[¶¤OÙ„Š\Ûo¸¿\Íi\ß\0¨´XY8\æ˜c~´p\á\ÂG·oß¾û\÷s\Å\Ö\á\á\áKfÎœù«r¸š?™Wš\Î8\ãŒ\âCúPQş\÷³fÍŠ\Ìâ¨£*\Êÿ¶bÆŒÅ›\ßü\æ\â¶\Ûn\ÙÊ”)Å¢E‹Š+®¸¢x\ï{\ß[\ÛVşû—]vYm•j\ãÆ£\î£\Û\Ï\ÇxO+Mİ‘†¢†Zt\Äÿ¾=ou}»•&\0€\r\rM3gÎšV\'Ø¶mÛ­q\â€r¨z0\ö\ëM\æ\Ï4pÀ\Å]w\İ5\ò\óK_úÒ‘\ô\å/¹(ÿ=ŠÕ«W\×BR¬,\í·\ß~Å›\Ş\ô¦\âÀ,\Şÿş\÷\×BR„¦\ïÿû\Å;\ßù\ÎZ\ĞJ\ï£\ÛU?\ÄXŸOº£UXj\Ø\Çgš\0\0rgQ›>}ú_|\ñ\ã[·n}ªa¦zb\éÒ¥\ß*/{°¨\Î\Ï\ñ\ìyO=\õT-0Äª\Ï\Ï~\ö³¢\Å\âÅ‹‹\ï|\ç;\Å\ò\å\Ëwú¾~‡~¸x×»\ŞUDQ/xÁF¾\ßÿıG\öÛ€t\Øa‡\Õn\'Ş\÷ú×¿¾x\İ\ë^W¼\ìe/+\Ş\ò–·Ÿü\ä\'\ã³D£W·«\ñ\ìycy>\éVa©\îg\Ï\0\È\×\à\à\à_œr\Ê)w•^·nİÿ\ğÿ°°¤n\íé¾¹„¦C9¤\ö\öºz\Å\ã\Z\Z\Zª}a©\ñû\Æ\ë½ü\å/ù\\Ó«_ı\ê‘\í¯x\Å+v\Ú\ï\É\'Ÿ,:\è \Ú[\ô>øÁøÀj\Ûc¥\é\ë_ÿú¨\ÇÓ«JÿNSØ“\ç“\îh–\êü&\0€Ì•\á\à9e\ĞøD9D\İ_\ã\çtŸKhŠ·\Îı\í\ßşm\í\ìqw\ß}w\ñ\àƒ\ÖN\ä°× ´y\óæ¦¡é•¯|eq\ô\ÑG\×\ŞZ+M\ñµş}}Ÿo|\ãµp\õ’—¼¤¸\ö\Úk‹«¯¾z§\Ğ«[\é\ã\éU5M¡\İ\ç“|”\Ç\Ö~\å\óµ=‚Ì‘Gg8L³Î„ˆ\Ûı»¿û»\Úı\Äı\Åı¦\0€q\È%4\İq\Çµ“8D¸‰\Ï=\ö\Øcµ\í{5¥\Æ\ï\ëo¯‹A\Ä[\ò^ø\Â¼=oŸ}\ö©½-/\ö‰·úı\ğ‡?y{^³\ĞA\í¢‹.\Z\õ¸º]»\nMLNeˆ¹±¾\ôµ¯}-\Í;\"n·~q\éc\0\0`œr	M\ñÙ¤¯~\õ«µ·•«øÁ~P\Ûş;¿\ó;µ3\ä}\ìc+\÷¼\ç\Õ\ök¼\Ş\ç?ÿù\Ú*T|«N\õ\í_úÒ—Fr¼14½\ï}\ï+\Î>û\ì\âù\Ï~\íŒuqV½\ÓN;m\Ô\ã\êv	Mıe\êÔ©‡\Ô\Í\ô\éÓ‹•+W¦™g\\\â\ö¦M›V_e*\âş\Ò\Ç\0\0À8\åš\Ş\ö¶·\ÕN\ÎÁ\è\ĞCYiŠU£6\ñ–»W½\êU\Å;\Ş\ñQ×­W¬R¥Û¢\î¹\ç\â_øB\ñ\Æ7¾±¸é¦›j\ál\ï½\÷.¾\ò•¯gyf\í³P\ñ\öÀrøu\İn—\Ğ\Ô\Ê03¿jN<\ñ\Ä\Ú	G&B\Ü\Î	\'œ°­a•i~z\ß\0\0L€\\BSı­tã©·¾\õ­£¶E\ÅJ\Ô9\çœScqBˆU«V\Õşlº_%4\õŸ\Ë@\óX=\Ü|\êSŸ\ZwpŠ\ëŸv\Úi#+Lqûq?\é}\00r	MQ­‚WúV½\\Kh\êOS§N=´6[\ZWœ\ÆúV½¸^²Â´%n?½O\0\0&H?…¦~(¡©•\áffcpŠ\Ï8\ÅI\Ú=«^\ìû7~†i\Ç\í\ÍL\ï\0€	$4\åUBSÛ±â´®!\ô\ÔNG~\î¹\ç,(\î»\ï¾\Ú\çùB|Ÿc{\\\ŞpZ\ñz­³\Â\0\ĞBS^%4\õ¿ÁÁÁ7”\ç\ê$\0\íi]·“\Ş6\0\0 4\åUBSu\ì8ù\â&¨U-vZq\0€.š\ò*¡©z\ö+\Ã\Ğ\ìÁÁÁ+Ê¯7—\õÀ€_oŞ±}v\ì—^\0€.š\ò*¡	\0\02#4\åUB\0\0dFhÊ«„&\0\0ÈŒĞ”W	M\0\0¡)¯š\0\0 3BS^%4\0@f„¦¼Jh\0€\ÌMy•\Ğ\0\0™š\ò*¡	\0\02#4\åUB\0\0dFhÊ«„&\0\0ÈŒĞ”W	M\0\0¡)¯š\0\0 3BS^%4\0@f„¦¼Jh\0€\ÌMy•\Ğ\0\0™š\ò*¡	\0\02#4\åUB\0\0dFhÊ«„&\0\0ÈŒĞ”W	M\0\0¡)¯š\0\0 3,Ø¾iÓ¦QÃ»\ê~•\Ï\ÃCehÚœ>G\0\0@-^¼ø¡5kÖŒ\Z\àU\÷\ë7¿ù\Í%ehº9}\0\0€Z¸p\á\á7\ÜpÃ†\á\á\áµVœzS\å¿û\ğªU«..\Óıe½\'}\0\0€‹A=V8\Êz:>S£º^\ñ\ïÿş\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0P\rÿ	¤r\æ*z~\0\0\0\0IEND®B`‚',1),('ce700575-1cde-11ef-96e8-00ff29e62bab',1,'process/performance.bpmn20.xml','ce700574-1cde-11ef-96e8-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('ceadf8d6-1cde-11ef-96e8-00ff29e62bab',1,'process/performance.performance-001.png','ce700574-1cde-11ef-96e8-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1),('e61a32b0-1e2e-11ef-9942-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','e61a32af-1e2e-11ef-9942-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\r\n             xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\"\r\n             xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\"\r\n             typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\"\r\n             targetNamespace=\"http://www.flowable.org/processdef\">\r\n    <process id=\"Expense\" name=\"ExpenseProcess\" isExecutable=\"true\">\r\n        <documentation>æŠ¥é”€æµç¨‹</documentation>\r\n        <startEvent id=\"start\" name=\"å¼€å§‹\"></startEvent>\r\n        <userTask id=\"fillTask\" name=\"å‡ºå·®æŠ¥é”€\" flowable:assignee=\"${taskUser}\">\r\n            <extensionElements>\r\n                <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\">\r\n                    <![CDATA[false]]></modeler:initiator-can-complete>\r\n            </extensionElements>\r\n        </userTask>\r\n        <exclusiveGateway id=\"judgeTask\"></exclusiveGateway>\r\n        <userTask id=\"directorTak\" name=\"ç»ç†å®¡æ‰¹\">\r\n            <extensionElements>\r\n                <flowable:taskListener event=\"create\"\r\n                                       class=\"com.example.expence.task.ManagerTaskHandler\"></flowable:taskListener>\r\n            </extensionElements>\r\n        </userTask>\r\n        <userTask id=\"bossTask\" name=\"è€æ¿å®¡æ‰¹\">\r\n            <extensionElements>\r\n                <flowable:taskListener event=\"create\"\r\n                                       class=\"com.example.expence.task.BossTaskHandler\"></flowable:taskListener>\r\n            </extensionElements>\r\n        </userTask>\r\n        <endEvent id=\"end\" name=\"ç»“æŸ\"></endEvent>\r\n        <sequenceFlow id=\"directorNotPassFlow\" name=\"é©³å›\" sourceRef=\"directorTak\" targetRef=\"fillTask\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é©³å›\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"bossNotPassFlow\" name=\"é©³å›\" sourceRef=\"bossTask\" targetRef=\"fillTask\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é©³å›\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"flow1\" sourceRef=\"start\" targetRef=\"fillTask\"></sequenceFlow>\r\n        <sequenceFlow id=\"flow2\" sourceRef=\"fillTask\" targetRef=\"judgeTask\"></sequenceFlow>\r\n        <sequenceFlow id=\"judgeMore\" name=\"å¤§äº500å…ƒ\" sourceRef=\"judgeTask\" targetRef=\"bossTask\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money > 500}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"bossPassFlow\" name=\"é€šè¿‡\" sourceRef=\"bossTask\" targetRef=\"end\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é€šè¿‡\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"directorPassFlow\" name=\"é€šè¿‡\" sourceRef=\"directorTak\" targetRef=\"end\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${outcome==\'é€šè¿‡\'}]]></conditionExpression>\r\n        </sequenceFlow>\r\n        <sequenceFlow id=\"judgeLess\" name=\"å°äº500å…ƒ\" sourceRef=\"judgeTask\" targetRef=\"directorTak\">\r\n            <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${money <= 500}]]></conditionExpression>\r\n        </sequenceFlow>\r\n    </process>\r\n    <bpmndi:BPMNDiagram id=\"BPMNDiagram_Expense\">\r\n        <bpmndi:BPMNPlane bpmnElement=\"Expense\" id=\"BPMNPlane_Expense\">\r\n            <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n                <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"285.0\" y=\"135.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"fillTask\" id=\"BPMNShape_fillTask\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"405.0\" y=\"110.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"judgeTask\" id=\"BPMNShape_judgeTask\">\r\n                <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"585.0\" y=\"130.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"directorTak\" id=\"BPMNShape_directorTak\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"735.0\" y=\"110.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"bossTask\" id=\"BPMNShape_bossTask\">\r\n                <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"555.0\" y=\"255.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n                <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"771.0\" y=\"281.0\"></omgdc:Bounds>\r\n            </bpmndi:BPMNShape>\r\n            <bpmndi:BPMNEdge bpmnElement=\"flow1\" id=\"BPMNEdge_flow1\">\r\n                <omgdi:waypoint x=\"315.0\" y=\"150.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"405.0\" y=\"150.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"flow2\" id=\"BPMNEdge_flow2\">\r\n                <omgdi:waypoint x=\"505.0\" y=\"150.16611295681062\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"585.4333333333333\" y=\"150.43333333333334\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"judgeLess\" id=\"BPMNEdge_judgeLess\">\r\n                <omgdi:waypoint x=\"624.5530726256983\" y=\"150.44692737430168\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"735.0\" y=\"150.1392757660167\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"directorNotPassFlow\" id=\"BPMNEdge_directorNotPassFlow\">\r\n                <omgdi:waypoint x=\"785.0\" y=\"110.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"785.0\" y=\"37.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"455.0\" y=\"37.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"455.0\" y=\"110.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"bossPassFlow\" id=\"BPMNEdge_bossPassFlow\">\r\n                <omgdi:waypoint x=\"655.0\" y=\"295.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"771.0\" y=\"295.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"judgeMore\" id=\"BPMNEdge_judgeMore\">\r\n                <omgdi:waypoint x=\"605.4340277777778\" y=\"169.56597222222223\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"605.1384083044983\" y=\"255.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"directorPassFlow\" id=\"BPMNEdge_directorPassFlow\">\r\n                <omgdi:waypoint x=\"785.0\" y=\"190.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"785.0\" y=\"281.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n            <bpmndi:BPMNEdge bpmnElement=\"bossNotPassFlow\" id=\"BPMNEdge_bossNotPassFlow\">\r\n                <omgdi:waypoint x=\"555.0\" y=\"295.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"455.0\" y=\"295.0\"></omgdi:waypoint>\r\n                <omgdi:waypoint x=\"455.0\" y=\"190.0\"></omgdi:waypoint>\r\n            </bpmndi:BPMNEdge>\r\n        </bpmndi:BPMNPlane>\r\n    </bpmndi:BPMNDiagram>\r\n</definitions>',0),('e65985a1-1e2e-11ef-9942-00ff29e62bab',1,'D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.Expense.png','e61a32af-1e2e-11ef-9942-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0M\0\0Y\0\0\0D\ÛÄˆ\0\0-\ğIDATx^\í\İ´\\Uy8p‹.\ë\ßZñ…²ª¶¶\Úem-¶š*.m\Õ\â\ë\æry$	•gµv‰DEP\Äfi\Õ.ÀWª)”eP\0BJƒ ”Hx„K $Hrş\ç›\æv²g2™\Ü{g\î¾s~¿µ¾u\ïœ\Ùsf\Èl¾ù¾\Ù\çœû˜\Ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ÕrÀB!\ÚGš;€\nQ\0´\'O@\Å)\0Ú“\' \â\0\íÉ“\0PqŠ€\ö\äI\0¨8\Å\0@{\ò$\0Tœb\0 =y\0*N1\0Ğ<	\0§\0hO€ŠS\0´\'O@\Å)\0Ú“\' \â\0\íÉ“\0PqŠ€\ö\äI\0¨8\Å\0@{\ò$\0Tœb\0 =y\0*N1\0Ğ<	\0§\0hO€ŠS\0´\'O@\Å)\0Ú“\' \â\0\íÉ“\0PqŠ€\ö\äI\0¨8\Å\0@{\ò$\0Tœb\0 =y\0*N1\0Ğ<	\0§\0hO€ŠS\0´\'O@\Å)\0Ú“\' \â\0\íÉ“\0PqŠ€\ö\äI\0¨8\Å\0@{\ò$\0Tœb\0 =y\0*N1\0Ğ<	\0§\0hO€ŠS\0´\'O@\Å)\0Ú“\' \â\0\íÉ“\0PqŠ€\ö\äI\0¨8\Å\0@{\ò$\0Tœb\0 =y\0*N1\0Ğ<	\0§\0hO€ŠS\0´\'O@\Å)\0Ú“\' \â\0\íÉ“\0PqŠ€\ö\äI\0¨8\Å\0@{\ò$\0Tœb\0 =y\0*N1\0Ğ<	\0§\0hO€ŠS\0´\'O@\Å)\0Ú“\' \â\0\íÉ“\0PqŠ€\ö\äI\0¨8\Å\0@{\ò$\0Tœb\0 =y\0*N1\0Ğ<	\0§\0hO€ŠS\0\ìÜŠ+>4w\î\Üb```\ï\ô>\0 \"4M\0­E\ñ”7nZ·n]1kÖ¬K\Òû€Š\Ğ4´¶r\å\Ê‹\í-Zt\Ï\Ğ\Ğ\Ğ\Ôt\0Pš&€f«V­z\óÖ­[\ë=S±mÛ¶­s\æ\ÌY;00°g:\0\èsš&€•=\Òc×®]{\÷HÇ´]l›>}ú\é\éx\0 \Ïiš\0v´bÅŠ/¥\rSİ¼y\ó\î|Cú\0 O”\r\Ò\âh’v‹\Ó\ÇT\Å\ğ\ğ\ğK7o\Şü\Ç\å%¶l\Ù\ò\Ğ\ÑG}Ã”)S—>\0\èeC4¥E“”Æ”\ôq\0Uq\Ûm·-O¥\Ô\r7\Üp\×\Ğ\Ğ\Ğ\Ç\Ò\Ç\0}\"V’Z4JV™\0J\×\\s\ÍCi“”Z¿~ıe¾¼=},\0\Ğ\'b%©E³d•	 4gÎœ\Ï>ü\ğÃ¦Rƒû;\î¸EVš\0 \ÏÅŠR‹†\É*Pyq®\Ò9çœ³&\í”\ê–-[\ö2_ş\Ú9M\0\Ğ\çv²\Ú4%PE3f\Ì\Øw\õ\êÕ¤\r\ÓÖ­[¯™>}ú®\0‘¬6Yehpê©§»­\Ô\Ğ3m‰me¾<-\0\ô©dµiJz?@•\r\ìyé¥—>Pï˜†‡‡\Ï.s\å±=\0\ô±újSº€\Ç<\æ˜c9hÃ†\r¬[·®˜9s\æuCCCS\Ó1\0@Ÿ«¯6¥\Ûøÿ\Î8ãŒ«\çÎ+\ò\Òû\0€](Š\â\ñ·\Ür\Ëÿ.]º\ô‘…—^zé¤Œhš\Òm“%\Ê\÷mK–,¹sÑ¢Eû§\ï0\ñú!OÎŸ?¿–\'\ãgz\ßdy€	U\ç–D\ÅÚµk‹M›6?ü°\èqÄ¿{üû_~ù\å\Ë\â\à\é{L¬~É“w\ŞygÓ¶\É\ò$\0*¾9¢\ôJ\ô>†‡‡×•\ÅÀU\é{L,y2Ÿ\'˜q¨\Édşæ´Ÿ\"Ş‡²Øœ¾GÀÄ’\'\ó	y€	ÇŠ§Jb\â\"Ş\ô=&–<™WÈ“\0\ô\\§\ÅÀƒ\÷\r·ü\ò\Û\Å\õ—}¦\ñ{lKÇ‰±…b\0\ò#O\æ\ò$\0=\×I1\ğÀ†5\Å\òK\æ¿¾\ğ_wˆ\Ø\÷¥\ã\Å\èC1\0ù‘\'\ó\ny€\ë¤¸ıú\ó›\nz\ÜqıM\ã\Å\èC1\0ù‘\'\ó\ny€\ë¤ø\í\âS›Š€z\Ä}\éx1úP@~\äÉ¼B \ç:)–_ú\é¦\" q_:^Œ>y2¯\'\è9\Å@^¡€üÈ“y…<	@\ÏuR\ÄU \Ò\" q_:^Œ>y2¯\'\è¹NŠ›~\öŸME@=\â¾t¼}( ?\òd^!O\Ğs\÷®ùM±üÇŸj*b[Ü—£\Å\0\äG\Ì+\äI\0z®“b bÕ²³šŠØ–c\Å\0\äG\Ì+\äI\0z®£b`\ó\æ\â¦+Oo*b[\Ü\×4^Œ:y2¯\'\è¹]\ñ—\ìWü\ì«M…@=\â>\í~üB1\0ù‘\'\ó\ny€\Ûi1°ys1|Ó¢âº‹o*\0Òˆ11Ö·©c\Å\0\äG\Ì+\äI\0z®U1°«oMw¾M{( ?\òd^!O\Ğs­ŠN¾5\İY\Äc\Óı‰\ÎC1\'¥¨y2¯\'\è¹V\Å@ú¿»‘\îOtŠ¬¼¹Œµ\ÛRa\òd^!O\Ğs­Š1q¡\ÈF½aú\è\öŸ\Z§\n“\'\ó\ny€S\äŠ,¤+L\ém*F\Ì+\äI\0zN1W(&\Ü\Î\Z¤m§\äÉ¼B \çy…b`B\íª1\Ú\Õı\ô)y2¯\'I«(Š=–.]ú¾³\Î:\ë\Ç\'x\âºû·\Ût\ÄGl;\à€ŠÙ³g?úÑ~\ôşr\ÛÊ“N:i\îŒ3^”>‰£\È+¦Ó†¨\Óq\ôy2¯\'I§l–p\ñ\Å}Îœ9z\è¡\Åi§Vüü\ç?/n¾ù\æ\â\Ş{\ï-BüŒÛ±=\îŸ5k\ÖÖ£:\ê–\Ã;\ì\í\éş\è=\Å@^¡˜»\Û\í\îx&9y2¯\'I¥l‚>|\ÒI\'m:\ö\Øc‹¥K—[·n­5I»\ãbü\ÑGı\è?ÿ\ó?ÿjpp\ğ\å\é¾\é\Å@^¡\è¹\Ñ6@£}“<™WÈ“À¤P\ö=p\É%—|\ï\ğ\Ã/,XPlÙ²%\í‹:‹\Çr\È!\r\r½-}zC1W(zj¬\ÏX\Ï$!O\æ\ò$½²\×ùƒù\ó\çÿ\âˆ#(~\÷»ß¥}Ğ¨\Ä~=\ôĞ‡¦M›6+}>ºO1W(zf¼\Z\ñ\Ú“\'\ó\ny\È^¬0Í=»X»vm\ÚûŒI\ìoÆŒL:u¿\ô9\é.\Å@^¡\è‰\ñnt\Æ{dF\Ì+\äI kW^yå‡£a\Z¯¦T¹\ßmtĞ†}\Ò\ç¦{y…b \ë\Ò\ç\Ê8xû\Ïİ‘>.\İ/}D\Ì+\äI [eO\ó„“O>ySœƒ\ÔM?ü\á7L›6\í\â\ôù\é\Å@^¡èª´±‰†\ç[eÄ¿yü\ì´q\Ú\Ù\ã\Òı\Ó\'\äÉ¼B²u\ÑE}-®’7Ú‹>t*\öè¡‡\Ş3u\êÔ¿O_İ¡\È+]Óª¡‰•¢ø\÷®G\'Sc\ÃTƒ\Z\îo\õ<Lr\òd^!OY*{™=N8\á„G\â2\á½\ğÓŸş\ô¾8\àŠ\ôu\ĞŠ¼B1\Ğ;kdZ5@\í\Z§Vã¿¹}{£=“”<™WÈ“@–®¼\ò\Ê\÷v\Øaÿ¦±Š\ç™>}ú}{¥¯…Î•\ç\â2¦¤\ÛSŠ¼B1\ĞZ§\ó¹…]50­\Z¡VS«q­\Z¦º]=/\èt^É“y…<	d\é\Ì3Ï¼\ô´\ÓNK{›®:\ñ\Ä—‘¾:W\Å\öh[(\ò\n\Å@k\Î\çD§K«†¨±qju»†©®\Ó\çg‚t:¯\äÉ¼B²t\ÒI\'\İÓ«C\ó\ê.»\ì²\ë\Ë°ù\ék¡s\r\Å@Û¢@1W(Z\ët>7\Øİ†¥Uc·\÷h±½“†©nw_=\Ôé¼’\'\ó\ny\È\Ò\Ç>\ö±M·\ÜrK\Ú\×tÕ7Ş¸ºü\àúeúZ\è\\‹b eQ \È+­µ˜\Ç-\ç\óv£mTZ5N7&·w§aª\í\ë¡\ËZÌ§–\óJ\Ì+\äI K³g\ÏŞ¶~ıú´¯\éª{\ï½\÷\òkMúZ\è\\‹\" ZQC1\ğ³Ÿı¬i[\Z7n¬ı\ä\ÆmW^ye±iÓ¦¦±¿ü\å/‹|°\öûC=4²=\æq:¶œkM\Û:y=\İ\n\Å@k-\æo\Zµùü˜±7(­\Z§±4Luc}]tA‹y”Fm^MT\\±bEq\Ï=\÷4mo•\÷F±ÿ\Ûo¿½i{\Z¿ø\Å/š¶]q\Å\Åı\÷\ßß´½!OY:\ğÀ‹G}4\íkºª|¾û[|x‰.\ÄD\ñ\â¿¸¸\ğ\Â›¶7Æš5kŠ¿ù›¿)¾ù\Ío\Ön\ß}\÷\İ\Ås\óœ\â\ßÿıß‹U«V\í0\öCúPq\Ì1\Ç\Ô~\Ík^SÌ˜1£¯{\İëŠ¯|\å+;Œ}\ík_[|\÷»\ß-–-[V\Äa¨±\í±}l\í\ö¿ø\Å\â¾û\îkz-İŒ\ôı\ÇÀÀ@\ñ„\'<!Š©¦yl7\Å!y\é\nSÜ\íc\ñ\Ñ\ô5‹\É•\'8\âˆ\â}\ï{_q\É%—Œä±ˆW¼\â\Å\ò\åË›\Æÿş\÷¿¯5B\Ã\Ã\Ã;l¿ú\ê«G~/b\\ü~\ÓM7/|\áw\Ès­\Z²7¾\ñEœ\Û|Áqa¨h–\ö\ßÿ\â„Nh\ZÛ‹\Ğ4Y:ü\ğ\Ã\í\õJ\Ó=\÷Ü³\ò\0+Mc’~\è7\Ä\â&ø°“øP>\ñ\Ä‹u\ë\Ö\Õnÿ\ñÿq‡€\Æ\ïŸúÔ§\â²\ó;Œÿ\Â¾Pû ş‡ø‡bŸ}\ö©ı>eÊ”\â/ş\â/Šƒ>¸V(G\ãSÿ\á¸8ı\ôÓ‹x x\ÚÓ6R ¼\ã\ï¨\õq7\ß|s\í±\ïÿû‹½\èE\Å\ó\÷¼\âü\óÏ¯m‹\×M\ÙE]\Ô\ôú»Š\ÖZ\Ì\ã–\óù1c_\Ñi·\Ò\Ô\êªz\Z\ë\ë¢ZÌ§–\ój\"\ò\ä]w\İU\ËK·\Şzk1oŞ¼\ÚG±=\òß‘G92.¾\ì‰mozÓ›Š?û³?«\å\Æú¶ˆg?û\Ù#+J‘{?\ğ\Ä\ßD,fÍšU›Û‘GgÎœYk\È^\õªW\×^{\í¯%\ò\í\âÅ‹kù\ñ]\ïzWm[|Iq\Şy\ç\Õ\ö¹6}ı\İy\È\ÒG>\ò‘û{}N\Ó\r7Ü°\ì\0\ç4É®Š€º‰(\"ş\ğÿpd…¨±iŠ\Æ&¾\Íl‡\æÕ¿ı\\´hQñ–·¼e\ä¾z\ã\ñ­o}«\ö¡ÿ§ú§µ¤(\Êÿ\Ä\â;\î¨}\ÈF1\ğ\ë_ÿzdü\É\'Ÿ\\œu\ÖY\Å\æÍ›kß´~\éK_ª=ş‰O|b\í\Şı\èGM¯»Û¡h­\Óù¼\İh”V\rSº\â4š\Æi´¯‡.\ët^MDŒ&&\òS|!\ôÒ—¾´¶²\ô\ßÿı\ß\ÅSŸúÔ¦¦&r\Ü{\ßû\ŞbÉ’%µq{\íµWq\ĞA\Ïx\Æ3j9-V\ó\ëc\÷\Ş{\ïøŒ¹ı\Ìg>sd±?gÎœ‘-š¤hºb¯|\å+k_Z½\ç=\ï©5I\Ñ4}ÿûß¯\å\ãx\ô\õw3\äI K\ÇüŠ^_=\ï¼\ó\Î;ÿ\0W\Ï“]uQD<ù\ÉOù½±iŠÕ¤hŒ\ZÇ®\\¹²8ü\ğ\Ãk\Ş\ñ‡¦Ô¿Aob?\÷¹\Ï\Õ\Æ\ÅyLqÓ±\Ç[[iŠf\èY\ÏzVíœ€‡“Ä¶‡—¼\à/(\â\ğÓ·½\ím\Å;\ßù\ÎZa\Ïÿ¸\Ç=®xı\ë__¼\ä%/)~\õ«_5½\ön†b µN\çsƒ\İmTZ5LqS««\ç\íNã´»¯ƒ\êt^\õ:Oyæ™µ\ïı\öÛ¯x\îsŸ[;\\ø«_ıjm\Å\'Î¹ü»¿û»\âƒü`±aÃ†‘\ÇD\Ó¹3¾Šœ_6ıÉŸüI\í¾—½\ìe#\ãb\ë­o}\ëH}Ò“4\ò{\äÀÈ·\õ±‘O£AŠıEC_hE^Œ&,r\ë«_ı\ê\â\ãÿx\í¹\Òÿ†n†<	d\é\ÄOœ\Û\ë¿\Ót\ä‘G.\ğwš\ÆfWE@]¯‹ˆøPÆ¤şAı\ô§?½˜6m\ÚH\Ô\êü¦zqMNª’\î¯ş{¬HÅ·qşS4Z±\ï8%bhh¨\ö-i4NQ”\\~ù\åÅ¾û\î[\\u\ÕUµ•¦\Ç?ş\ñ;\Ò·\ë‡\ö\õ*­u:Ÿ6,;k˜\Úı¦N\Z§NŸŸ	\Ò\é¼\êuŒs6.\\X\Ëe\Ñ,\Å\áss\ç\Î¹°M|A_ ]|\ñ\Å\Åu\×]W;3V\â¥?ÿ\ó?/ÿü\ç\ï°\Ò_5\î?=®\ç¶\Æû¢AK_K<W\ä\Éh\Ø\âP\æh\Îb{¬4\Õ\Ï1\íuÈ“@–Ê„û¢²\à\ÜZJ{›®(Ÿ\ç®\òC\ì2!ï•¾\Æ_¯‹ˆhz\Şş\ö·¬ú4®4Å‡œ“Tÿ@ÿ\Ío~S\ÛVod\âP’©S§Üo‰\ãP¿¸ D4\÷\ñ¡\ç&zê©µ\ÇÇ·¡1.7‰\Æ\é\Û\ßşvmûO~\ò“\Ú\ö«K\ñiùÏ±\Ã\ë\Üs\Ï=5M“ß®\Z—V\rQ««\äµ\Z×®q\Ú\Õ\ó2‰\ô:O\Æ\Ê\ÍG>\ò‘ÚŠ\Ğg?û\Ù\Ú\êycŒ‹CÄ…m\ê‡\'\ÇyE\ñ…P¬\İx\ã\Åı\×\í°\Ò¹±qÿ\ÑTr\È!µ†*Vš\ê˜ˆ\ß\Ç\Å!\Ï\Ñ`Å—Oq>hœ\ã\Ù\Ø4\Å9M\ék\ïEÈ“@¶:\ê¨U½:D\ï\ì³\ÏşnY_‘¾º£\×\Å@D4M±²T¿\İ\Ø4\Å1\ô\ÑP5¯_*¼~\Òr\ãjP*\ò\õ¯½v\\>|Á‚#‡\çÅ¶hš.»\ì²\Úü_ş\å_\îp	\ò8 ¾\Ò·S±\Ò\ÔWv\ÖÀ´j„Z5Lu­Æ·jœv\ö|LR½Î“\ÑÅ¡r‘\ó¢Š\ôhŒ\â§?T?§)\òk\ä¯8\'ª¾\ÒWÈ‹©ú\ØÈ‹\ñ%RŒ‹C¥\ë9/	lÌ‘\ñg\â\Ü\Îú\áy­š¦\ßş\ö·µ×•¾n†<	d«L¦o?ú\è£İ²eK\ÚãŒ«rÿ·—\r\ÓMS§Nıû\ô5\Ğ½.\"ş\çş§v˜]ıvc\Ó\Ç\Ì\×?”#C‰\ó\ê³¤\ñœ¨4\Z›¦X™Šc\ò\ã¢qÀm·İ¶\Ã\ØhšN9\å”\ÚJUœ`\İxŸ•¦¾Òª‘9ø17Lu­\Z§ƒ\Z\îo\õ<Lr½Î“qH\\|Q+=\ñ\çb\õ=\Z§¸D½iŠ¼Vop\â<¦83K\Ü\Ä\÷\ZWš\â\Î\Æ\óâŠ¤\õ•şXuªoÿ\ò—¿\Ü\ò’\ãMÓ»\ßı\î\Ús\Äs\æÏŸ_»ª\Ş\ñ\Ç\ß\ô˜n†<	d\í\È#üÕ‚¶¥\Î8\ÚV&\òo—MÓ‚\ô¹\é^Ÿÿü\çkWaª\Í\É\à\à`\í\÷øp64B!\éoü[\"MSıo’\Ä7±±\ê\Í\ÕgœQ\Û—?é¤“jH\\*¾y¦*î‹¢!Vª\âd\ë((\êûŒ?‡³\ÄJSã·®½\Å@W¥\rMc\ÔI\ÃT·³Ç¥û§O\ô:O\Æ\óÅ—I\ÑÜœ}\ö\Ù#+AÂ‰/|\"/F#\óG\ôGµ†\'\ò^=¯6\Ó\ô\×ı×µK…·ú(¿K·\Õ#\õ‹¿W\ÏL<\ò\ë{\ìQ|\ík_+>\ó™\Ï\ÔÎ‡Š+\ë59Ğ‹\'¬\r\ìS&\ß~\÷»ß¥\ÍÎ¸ø\ÉO~rf\Ù0\r\Ç\ó¤\ÏM\÷\ôºˆˆ%şFRº=\"‰\Ë}\×o\Ç\É\Ğq|~\\·^DÄ…$\ê¿\ÇyIŸü\ä\'k\rN\\\à!\Z²ø°\Ç\ÇùJq\Ø^}q©\İú\á~\ßù\Îwj«W\ñ\Øú·²qHJ%;;¦›¡èº´±‰†\'VŠ:m˜\ê\ÒÇ¥û¥LD¬¯EÄ¡\Ä\éıˆŸ±¢T_\ï4\â\Ï3¤\Û\ê¯!Î©Š/–b\õk\õ\êÕµR¤\ãz\ò$½¡¡¡·Íœ9\ó¡(*\ÇS™ˆ/(¦;§Nº_úœt\×D\í¢Õ¡!qŒ§—µm,6v\'v\öÜ½\Å@OŒwƒ3\Şû#3¹\å\É\ñŒ]­¦\çÓ\'IaÚ´i³fÌ˜qÿx­8m_aZS\Æ\Ì\ô¹\è¾~.&c(zf¼\Z\ñ\Ú“\'\ó\ny˜4bE\èÀ\Ü\ğ\Ãşp\Ãh/}\Ø~\Ó]V˜&b ¯P\ô\ÔX±>IB\Ì+\äI`R|ù´i\Ó.9\ô\ĞC\ïù\éOz_§Ç©·\ö\ì³\Ïş^\\%¯Œ‹b?\é¾\é\Å@^¡\è¹\Ñ6>£}“<™WÈ“À¤—/›Ÿ%Ó§O\ßø\éOúº….¿\ñ\Æo[·nİƒe\ôÀ\İw\ß}\Ë\õ\×_¿\ì?øÁ:ê¨‹Ê±\ëb¼ËŠ\çA1W(&\Ä\î6@»;IN\Ì+\äI`RØ«l†f_ş¼ªŒø›K\Å\öŸWm\ß>;Æ¥e\â(\ò\n\ÅÀ„\é´\êt}D\Ì+\äI\0zN1W(&Ô®\Z¢]\İOŸ’\'\ó\ny€S\äŠ	·³\ÆhgÛ©\0y2¯\'\è9\Å@^¡\ÈB\Ú ¥·©y2¯\'\è9\Å@^¡\ÈF½Qú\è\öŸ\Z¦\n“\'\ó\ny€S\äŠ¬¼9.f?\Ó;¨y2¯\'\è9\Å@^¡\È\Ë\ö¦‰Š“\'\ó\ny€S\äŠ¼hš\òd^!O\ĞsŠ¼B1MA\Ì+\äI\0zN1W(\ò¢i\"È“y…<	@\Ï)\ò\n\Å@^4My2¯\'\è9\Å@^¡È‹¦‰ O\æ\ò$\0=§\È+y\Ñ4\äÉ¼B \çy…b /š&‚<™WÈ“\0\ôœb ¯P\äE\ÓD\'\ó\ny€S\äŠ¼hš\òd^!O\ĞsŠ¼B1MA\Ì+\äI\0zN1W(\ò¢i\"È“y…<	@\Ï)\ò\n\Å@^4My2¯\'\è9\Å@^¡È‹¦‰ O\æ\ò$\0=§\È+y\Ñ4\äÉ¼B \çy…b /š&‚<™WÈ“\0\ô\ÜÂ…·mÚ´©\éCI\ô>\Ê\÷\áÎ²Øœ¾GLMA\Ì\'\äI\0&Ä’%K\î\\»vm\Ó“\è}\Üz\ë­g—\ÅÀU\é{\Ä\Ä\Ñ4\ä\É|B`B,Z´hÿ\Ë/¿|\ã\ğ\ğ\ğ:ß¤NL”ÿ\îÃ«W¯W·•\ñ\Î\ô=b\âhšı’\'\ï¼\óÎ¦m“%\äI\0&\\|\0\Å7we<ÇŠO¶8ë¬³Š(n\Ó\í“(\â\ß=şı™\Ñ4QÿnÿÿtR\æÉ¥K—s\ç\Î-\æÏŸ\ßt\ß$	y\0Æ¢,l+n\é\óŠ~P\ÅS6nÜ¸iİºuÅ¬Y³.I\ï\0ú\\Y\ÔN‰\Âv{LIï‡±\Ğ4\ÑV®\\ya±İ¢E‹\î\Z\Zšš\0úX}•i{,Nï‡±\Ğ41Ù­Zµ\ê\Í[·n­\÷LÅ¶mÛ¶Î™3g\íÀÀÀ\éX\0 %«LV›wš&&³²Gz\ìÚµk\ïé˜¶‹mÓ§O?=\0\ô¡d•\Éj\ãN\Ó\Äd¶bÅŠ/¥\rSİ¼y\ó\î|Cú\0 \ìd•\Éj\ãJ\Ó\Äd5<<ü\ÒÍ›7ÿ\ßqy‰-[¶<t\ô\ÑG\ß0eÊ”Ç¥\0ú\ÄNV™¬61®4MLV·\İv\Û\ò´QJ\İp\Ã\rw\r\r\r},},\0\Ğb%©E£”Æ”\ôq°»4MLV\×\\s\ÍCi“”Z¿~ı\å¿=},\0\Ğb%©E“”†\Õ&\ÆL\Ó\Äd5gÎœ\Ï>ü\ğÃ¦Rƒû;\î¸EVš\0 B·tƒy\Åd\ç*s\Î9k\ÒN©nÙ²e\ß)\ç\÷¯\Ó\0¢¸¥\Ì+&³3f\ì»z\õ\êGÒ†i\ëÖ­\×LŸ>ıW\Ï€ŠQ\Ü\Ò\r\æ“İ©§z\î¶RCÏ´%¶•sû´t,\0\Ğ\ç·tƒy\Åd700°ç¥—^ú@½c\Z>»œ\×w\Ä\öt,\0\Ğ\ç·tƒyE?8\æ˜cÚ°a\Ã#\ëÖ­+fÎœy\İ\Ğ\Ğ\Ğ\Ôt\0PŠ[ºÁ¼¢_œq\ÆWÏ;7®,º ½\0¨\Å-\İ`^\Ñ/\öù?\Óû\0€ŠP\Ü\Ò\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS\Ğ\r\æı\Ä|€ŠS0V\åZ\óh±8}L\ò$\0Tœb€±*\çĞ”MR\ZS\Ò\ÇÁd!O@\Å)±’Ô¢Q²\ÊD_\' \âŒ‡XIj\Ñ,Ye¢/È“\0PqŠ\ÆK¬(µh˜¬21\éÉ“\0PqŠ\ÆK¬(µhš¦¤\ã`²‘\' \âŒ§dµ\É*}A€ŠS0’Õ¦)\éı0É“\0PqŠ\Æ[}µ)\İ“•ù\0§`¼\ÕW›\Ò\í0Y™\Ï\0PqŠ¼E\ñø[n¹\å—.]ú\ÈÂ…‹K/½T\ô8\Ê\÷mK–,¹sÑ¢Eû§\ï\Õ$O@\Å)\òR6L\ç–{±v\í\ÚbÓ¦M\Å\Ã?,z\ñ\ïÿş—_~ùÆ²‰zgúQ=\ò$\0Tœb /±\Â{ZÈ‹\Ş\Ç\ğ\ğ\ğº²iº*}¨y\0*N1—8$\Ï\nS\ïC\Ù4mN\ß#ªG€ŠS\ä%Î©I‹w1q\ïGúQ=\ò$\0Tœb /6M\Ş7\\\Ü\ò\Ëo\×_\ö™Z\Ä\ï±-\'\Æš&‚<	\0§\ÈK\'M\Ó\Ö\Ë/™Süú\Â\İ!b[Ü—£MA€ŠSä¥“¦\é\ö\ë\Ïoj˜\êq\Ç\õ4£MA€ŠSä¥“¦é·‹Omj–\ê\÷¥\ã\Å\èC\ÓD\' \ây\é¤iZ~é§›š¥z\Ä}\éx1ú\Ğ4\äI\0¨8\Å@^4My…¦‰ O@\Å)\ò\ÒI\ÓW\ËK›¥z\Ä}\éx1ú\Ğ4\äI\0¨8\Å@^:išnú\Ù65K\õˆû\Ò\ñb\ô¡i\"È“\0PqŠ¼t\Ò4İ»\æ7\Å\òª©aŠmq_:^Œ>4My\0*N1—Nš¦ˆU\Ë\Îjjšb[:NŒ-4My\0*N1—š¦Í›‹›®<½©iŠmq_\Óx1\ê\Ğ4\äI\0¨8\Å@^v\Õ4=°aM±\âg_mj˜\ê\÷Å˜\ôqbt¡iª2\'.¼¸‹Xœ>\0\ècš¦¼\ì´iÚ¼¹¾iQq\İ\Å\Ç75JiÄ˜k\Õi\ì¡iª2\'Ni\Ñ$¥1%}\0\Ğ\Ç4Myi\Õ4\íjuiga\Õi\ì¡iª¦XIj\Ñ(Ye€ª\Ò4\å¥U\Ó\Ô\É\ê\Ò\Î\"›\îOtš¦jŠ•¤Í’U&\0¨*MS^Z5Mi#´»‘\îOtš¦\êŠ¥\r“U&\0¨\"MS^Z5Mb\âB\ÓT];Ymš’\0*@Ó”MS^¡iª¶dµ\É*\0T•¦)/š¦¼B\ÓTm\ÉjÓ”\ô~\0 \"4My\Ñ4\åš&\ê«M\év\0 By\Ñ4\åš¦\êØ«Ì‹³\Ï/^Uş¼{ûJ\Ó\í\Ûo\Ç\ö\Ù1.},\0Ğ§4My\Ñ4\åš¦\ê˜:u\êß—ùpI\Ã\áxÄ’x\\º/\0 \Ïhš\ò¢i\Ê+4Mıopp\ğ\åe¼¨EC´;qQ\ì\'\İ7\0\Ğ\'\â?\İ\Æ\Ä\Ñ4\åš¦ş6u\ê\Ôı†††\îkl€<\ğÀ\â”SN).\\X\Ü|\ó\ÍÅ½\÷\Ş[„ø·c{\Ü\ã’\Æi}\ì/}\0 hš\ò¢i\Ê+4Mı«\Ì}3Ë†iK½\é™>}z\ño|£Ø°aC­IÚ•\ã\ãq\rÓ£±\ß\ô¹\0€INÓ”MS^¡i\êO\ÛW˜F\Z¦#<²XµjU\Úu$olœ¬8@Ÿ\Ñ4\åEÓ”Whšú\ÏÀÀÀ>Ó¦M\ÛPor>\ñ‰O7nL{¡\İı44N\÷\Æ\ó¤\Ï\r\0LRš¦¼hš\ò\nMSÿ)sŞ‚\Æ¦±6Lu±Ÿd\ÅiAú\Ü\0À$¥iÊ‹¦)¯\Ğ4\õ—\í—9‡i´‡\ä\íL\ì¯\ñ\'—#€>¡iÊ‹¦)¯\Ğ4\õ—2\ß]Qoh\â\"\İûmXmº\"}\r\0À$¤iê»\îºk\ï\Ûn»mùµ\×^û\à\'?ù\É\ÏM™2\åqé˜ i\Ê+v\Ö4uú~\Òe[\\Æ”t{£½\Ê1\Û\"\ç\Å\å\Â;½J\Ş\îŠı6\\|[<oúZ\0€IF\Ó\Ô]e\r\õ\Ø+V|i\ó\æ\Í[\ëEUYŒ?z\Î9ç¬™1cÆ¾\éxMS^‘6M»û~\Ò\r+;;m¨ûü\ç?_ûº\"\ö_®x\Ş\ôµ\0\0“Œ¦©{V­Z\õ\æµk\×ŞTu«W¯~\ä\ÔSO=w```\Ïúc4MyEc\Ó4š\÷“\Şhhšv\Ú<•·\ç\×\ï¿\ì²\ËÒ·o\\\Åş^\Ëü\Æ\×\0LBš¦\ñW\ÖLO]¹r\å…[·,F\ìÔ¶RY˜?p\Üq\Ç\Õ4\å\ñ~cx?\éMSS\óTşüe}û-·Ü’¾u\ã*\ö\ß\ğ\Z~™¼\\\0`²\Ñ4¯+V|h\ãÆ›\Ò\"jW6l\Ø\ğ\Ègœq\õüù\ó›\n\÷^\Æ\êÕ«‹\åË—\ÜŞ¼ysÓ˜Ÿÿü\çM\Û\"|\ğÁ\â\Ş{\ïm\ÚQş»·\ß~{\Ó\ö4~\ñ‹_4m»\âŠ+Šûï¿¿i{/b\éÒ¥q)\éQ¿Ÿ{§s„\ñ×¢YJ#š§u\õ\Û\ë×¯Oß²qûox\î5\é\ë\0&™Å…CÌ;·X·n]ZC\íR<&û¸\ó\Î;›Š\÷^E¬¬¼\ğ…/,Ö¬YSkT=\ô\Ğ\â\Ì3\Ï\Üa\Ìk^\óšbŞ¼y\Å]w\İU\Üq\Ç\Å\ÕW_]œ|\ò\É\ÅK_úÒ¢lF\ÆE\áøû\ßÿ¾\öûM7\İT\Û\ï}\÷\İ7rÿ¦M›šÿo|cq\Úi§\\pAq\Øa‡\Õ^\Ãşû\ï_œp\Â	Mc»\ñ>Œ\Çû)\ò‹G}4}\Ë\ÆU\ì¿\áù6§y\0 \Òbe¡l4~¼hÑ¢{¶mÛ¶\ëã¹Šb\Ë\ğ\ğ\ğ\Ù3gÎ¼®,®L\ÄJS4H\Ç{l\ís¾ÿı\ï/\÷¼\ç3f\Ì(ÿü\çO{\Ú\ÓjT\ãø×¿ş\õµ¡«®ºªx\ÊSRü\Ó?ıS1gÎœ\âû\ßÿ~±lÙ²‘Õ©O<±øÀ>Pk¼fÍš+š\ÅÁ\\”ÿ­µı¿\êU¯*®½\ö\Ú\ö=eÊ”b\ñ\â\Å\Åù\çŸ_¼\ë]\ïªm‹F\ì¼\óÎ«­T=\ğÀM¯¿›\ï\ÇX\ŞO+M½‘6E\r±ø€ÿ;<oM}»•&\0€\r\rM-‰µ\í.°u\ë\Ök\â\ÂeQuGŒÇ¥\rJ¯\"\ÎÁ¸ûî»‹û\î»om…\'V”¾ş\õ¯\åC­ª¯ş<\÷¹\Ï-^û\Ú\×\õWUûÙ¸Ÿ‡zh\ä\÷½\÷Ş»¸\á†Fn?\ó™\Ïi’¾\ò•¯\Ô\Z­h\Ø\âv4I±\ï½\öÚ«x\å+_Y\ì³\Ï>\Å{\Ş\óZ“MS4doy\Ë[j\ÍVúÚ»\õAŒ\öı¤7\Ú5K\rcœ\Ó\0›¸Š\Ú\ô\é\ÓOŸ7o\Ş}[¶ly¨¡¦ºÙ²e\ß)ï»£,¨N›È«\ç\Å9;Ñˆ\Ô\ãÿ\ñkMÑ›\Ş\ô¦\Ú*Sl{\Ù\Ë^VÌ=»\ÖE\õø\Ç?¾X²dIqı\õ\×\Ïy\Îsj\ÍND47\ïx\Ç;FVš\âğ½·¾\õ­#\÷?\éIO\Zù=\å[¹r\å\È\ëˆ}Gƒ\ô¶·½­¶\ïh\Ğ^\ò’—/~\ñ‹‹g=\ëYÅ«_ı\ê\â\ãÿxœ_\Ô\ô\ß\Ğ\Íh¼z\Şh\ŞOz£]³Tw€«\ç\0\äkpp\ğ\r\Çs\Ì\r¥»Ö¯_Å¿üË¿,*©_\Ç\ötl¯›¦ˆ8/)~\ÆùGq(]4O±\ÚT?\'©\ç{n­iŠ\ó“N?ı\ô\ÚjS~\÷\r\r\r\Õ\ÎGjMU}/xÁF¶Gc–¾¸D¬r\Å!zq˜\à{\ßû\Ş\Ú\öhÆ¾ù\Ío6\ïE¤§)\ì\ÎûIo´k–\êü&\0€Ì•À\ãÊ¦\âceuSüŒ\Û\é˜0MS=¾\÷½\ï\Õ©ûĞ‡>T»`\ÃGQ;Ï©qÌ´i\Ój«G\'tR\íg¬,•Eaq\Ï=\÷/ùË›®\çEr\È!µ«Xiª¯h\Å\ï\ã¾\õ­o\Õ\Z¬§?ı\é\Å%—\\R\\t\ÑE;4MqNSúz{­š¦\Ğ\éûI>\Êy´Wù~m‹F\æÀŒ+¦½Î¸ˆı~\ğƒ¬=O<_<oúZ\0\0ƒ‰hš\âĞ¸/ù\Ë\Å3\ñŒ\Ú\áq¿úÕ¯Š7¼\á\rÅ»\ßı\î.\ç\'\Å*T\\ø!.q\ÆgÔšªh¶ş\öoÿ¶\å\î\âĞºX‰ŠC\òü\ä\'\÷„\'<a‡\óŸâ°¿ı\èG#‡\çµjš~û\Û\ßguV\Óst3v\Ö419•M\Ì\õ o|\ãi¿3.b¿\õ\çˆ\çK_\0\0c\Ô\ë¦)\ÎiŠ\æ\èsŸû\\\í\Ò\â±2+M\×\\sM\íşë®»®ø\êW¿Zû=.\Ö\ÍM¬0\Å\Õ\ób…)\Î=ŠC\ç\âp»ÿøÿh\Úÿ¾\ğ…‘sœb\ß\õ\íÑ¤µº\äxc\Ó¯+.eş\Ä\'>±v»¸ª\Ş\ñ\Ç\ß\ô˜n†¦©¿L:\õ\ï\ë\r\Í\ô\éÓ‹U«V¥=Ï˜\Äş¦M›V_e*\âù\Ò\×\0\0À\õºijl\\~\ğƒoû\Ûw¸ÿ\â‹/®5Q\Ûâ¼£8Ÿ\éu¯{]\íŸı\ìgk‡\å\Å\Õ\ö\Ş\÷¾\÷5]¢¼qø]º­7\Şxc\ñ\Å/~±x\Å+^Q\\yå•µ«\ö\í±\Ç\Å×¾\öµ\â3ŸùL\í|¨¸²^˜>¶›¡i\ê?e3³ \Ş\Ô\ÄJi\\\\d<\Ä~>ü\áomXeZ>7\0\0\ã`g\rG/\"\Z—g?ûÙµ¡hR\"\ö\Üs\ÏÚ¥¾ÿ>\Ò~û\íWk9\æ˜®€—,\ó•\âü¤t\ß\é\å\É#V£¢ùŠ}\Ç!V¯^]û\ã°\é¸^‡¦©ÿ\ìS64\÷Ö››O|\âcnœ\â\ñ\Çü\È\nS\ì?\'}n\0\0\ÆÁD6MF«\Ã\ê:‰\Æs˜Z\Åh\÷\Û\Í\Ğ4\õ§©S§\îW666®8\öP½x\\²\Â\ôh\ì?}N\0\0\Æ\Édhšªš¦şU673§8\Ç).\â\Ğ\éU\õb\\Œo<‡iûşf¦\Ï\0À8\Ò4\åš¦ş¶}\Åi}C\ÓS»ù)§œR,\\¸°¸ù\æ›k\ç\ë…ø·c{\Ü\ßpY\ñz¬·\Â\0\Ğš¦¼B\Ó\Ôÿ_^6<%\r\Ğ\î\ÆE±Ÿt\ß\0\0t¦)¯\Ğ4U\Ç\öË‘/i\Ñµ‹%.+\0\Ğcš¦¼B\ÓT={•\Í\Ğ\ìÁÁÁ\óËŸW•qû\ö)~^µ}û\ì—>\0€\Ğ4\åš&\0\0ÈŒ¦)¯\Ğ4\0@f4My…¦	\0\02£i\Ê+4M\0\0MS^¡i\0€\Ìhš\ò\nM\0\0dFÓ”Whš\0\0 3š¦¼B\Ó\0\0™\Ñ4\åš&\0\0ÈŒ¦)¯\Ğ4\0@f4My…¦	\0\02£i\Ê+4M\0\0MS^¡i\0€\Ìhš\ò\nM\0\0dFÓ”Whš\0\0 3š¦¼B\Ó\0\0™\Ñ4\åš&\0\0ÈŒ¦)¯\Ğ4\0@f4My…¦	\0\02£i\Ê+4M\0\0MS^¡i\0€\Ì,\\¸pÛ¦M›šŠw\Ñû(ß‡;Ë¦isú\0\0hÉ’%w®]»¶©€½[o½\õ\ì²iº*}\0\0€	´hÑ¢ı/¿ü\ò\Ã\Ã\Ã\ë¬8ML”ÿ\îÃ«W¯W6L·•\ñ\Î\ô=\0\0&X\ê±\ÂQ\Æ\ÃqN\èyÄ¿{üûk˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€jø–Š‡Š’¥\0\0\0\0IEND®B`‚',1),('ea0f18c9-1cde-11ef-96e8-00ff29e62bab',1,'process/performance.bpmn20.xml','ea0f18c8-1cde-11ef-96e8-00ff29e62bab',_binary '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:flowable=\"http://flowable.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.flowable.org/processdef\" exporter=\"Flowable Open Source Modeler\" exporterVersion=\"6.7.2\">\n  <process id=\"performance-001\" name=\"performance\" isExecutable=\"true\">\n    <documentation>ç»©æ•ˆæµç¨‹</documentation>\n    <startEvent id=\"startEvent1\" name=\"å¼€å§‹èŠ‚ç‚¹\" flowable:formFieldValidation=\"true\"></startEvent>\n    <userTask id=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" name=\"è‡ªè¯„\" flowable:assignee=\"a\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" sourceRef=\"startEvent1\" targetRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\"></sequenceFlow>\n    <userTask id=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" name=\"ä¸Šçº§è¯„\" flowable:assignee=\"b\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" sourceRef=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" targetRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\"></sequenceFlow>\n    <userTask id=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" name=\"éš”çº§è¯„\" flowable:assignee=\"c\" flowable:formFieldValidation=\"true\">\n      <extensionElements>\n        <modeler:initiator-can-complete xmlns:modeler=\"http://flowable.org/modeler\"><![CDATA[false]]></modeler:initiator-can-complete>\n      </extensionElements>\n    </userTask>\n    <sequenceFlow id=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" sourceRef=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" targetRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\"></sequenceFlow>\n    <endEvent id=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" name=\"ç»“æŸèŠ‚ç‚¹\"></endEvent>\n    <sequenceFlow id=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" sourceRef=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" targetRef=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\"></sequenceFlow>\n  </process>\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_performance-001\">\n    <bpmndi:BPMNPlane bpmnElement=\"performance-001\" id=\"BPMNPlane_performance-001\">\n      <bpmndi:BPMNShape bpmnElement=\"startEvent1\" id=\"BPMNShape_startEvent1\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"134.9999959766866\" y=\"194.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-31500697-6B82-4DF0-BC49-7DA591839A3D\" id=\"BPMNShape_sid-31500697-6B82-4DF0-BC49-7DA591839A3D\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.00000000000003\" x=\"209.999983459712\" y=\"169.9999840557585\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\" id=\"BPMNShape_sid-8CE42BE9-E2BB-4562-95A9-CB848AFCD88A\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"354.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\" id=\"BPMNShape_sid-47A37E04-E3B9-4E96-B68E-CC72C551AC10\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"499.9999959766866\" y=\"169.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-20C07DE6-1358-4003-A79E-D69A45F455E4\" id=\"BPMNShape_sid-20C07DE6-1358-4003-A79E-D69A45F455E4\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"644.9999959766866\" y=\"195.9999941885473\"></omgdc:Bounds>\n      </bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" id=\"BPMNEdge_sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03\" flowable:sourceDockerX=\"15.0\" flowable:sourceDockerY=\"15.0\" flowable:targetDockerX=\"50.000000000000014\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"164.94999446725586\" y=\"209.99999280680322\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"209.9999834596995\" y=\"209.99998865696628\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" id=\"BPMNEdge_sid-8C545A8F-2D6D-4ADF-9832-824E97CC9713\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"454.94999597659483\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"499.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" id=\"BPMNEdge_sid-505F6DEA-A974-436A-BB92-51EFF5FEC04D\" flowable:sourceDockerX=\"50.0\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"14.0\" flowable:targetDockerY=\"14.0\">\n        <omgdi:waypoint x=\"599.9499959766206\" y=\"209.9999941885473\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"644.9999959766866\" y=\"209.9999941885473\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" id=\"BPMNEdge_sid-2AF84A9F-E84C-441C-A94C-CAE079DEEECB\" flowable:sourceDockerX=\"50.000000000000014\" flowable:sourceDockerY=\"40.0\" flowable:targetDockerX=\"50.0\" flowable:targetDockerY=\"40.0\">\n        <omgdi:waypoint x=\"309.94998313112615\" y=\"209.9999875463292\"></omgdi:waypoint>\n        <omgdi:waypoint x=\"354.99999597661997\" y=\"209.99999069448253\"></omgdi:waypoint>\n      </bpmndi:BPMNEdge>\n    </bpmndi:BPMNPlane>\n  </bpmndi:BPMNDiagram>\n</definitions>',0),('ea1d97ba-1cde-11ef-96e8-00ff29e62bab',1,'process/performance.performance-001.png','ea0f18c8-1cde-11ef-96e8-00ff29e62bab',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0ª\0\0\0\0\0ı~&\Ñ\0\0\ĞIDATx^\í\İß\\\åy\ği/ªşU®’?¤‘\å\"Q+Ù‹w±f-\Û`[HPlPqdŠr—Šª\õEj*«•&ª\rÁkŒq05(RL\íÿH¨q{m(6ø\Ç\ô¼\ÖNt\ò\î\÷\İ\õ¾\Ï\é\ç#}µ\æœ\Ùs{¾;\Ï\ÙÙ™\Ù^\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ºª\ß\ïÿ\ÙÉ“\'ÿ\í\ğ\á\Ã_MOO\÷_ıu¹\Ëi¾\î7<ø\ñşıûŸŸthù£CRš\è:ªÿ\Ş\Ü9\õgffú—/_\îù\å—r—“¾\î\é\ë\àÀK\ÍÀø~~j§C\Ë’\ÒD\ï\ĞQ\éŒt\ç”\ßi\É\İ\ÏÙ³g\Ï7\âH~j§C\õD‡¤4Q;tTú5›G0\êH:Í€¸’Ÿ£\Ú\éP=\Ñ!)M\Ô•›”\ßQ\É\ò%ü\ÕN‡\êŠIi\"v\è¨Q\ÄŸ\íŸ|\÷\Çı£ûş\îfÒ¿Ó²üvR–ˆB‡\êŠIi\"v\è¨Q\Ä\ç\Ï\ô\ß\í©şı\Ç\ßüQÒ²´.¿½,<„\Õ’\ÒD\ì\ĞQ£ˆ¾2o8\ò¿G:\ï\ö²\ğD:TWtHJ±C@G2 şç¿Ÿ7I\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€xÿ\õ§\ç\r†AÒºü\ö²\ğD:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:j”‘^]›†AÒºü\ö²\ğD:TWtHJ±C@G2 >üù?\Ìƒ¤uù\íe\á‰8 t¨®è”&b‡€\Ze@Ìù\ïşû?û\Ûy\Ã!-K\ë\ò\Û\Ë\Âq@\èP]\Ñ!)M\Ä5Ê€H9\õŞ‹\óDZ–\ßN\Êq@\èP]\Ñ!)M\Ä5Ò€¸r¥ÿ\á\Ûÿ8o@¤eiİ¼\ÛË‚q@\èP]\Ñ!)M\Äu»‘ş\âË¯~ş£y\Ãa´\Î_…Y¼D:TWtHJ±C@G\İr@\\¹\Ò?û\áşş/_\İ<o(\äI·I·\õ¨Fy\"ª+:¤C¥‰\Ø! £†\rˆ\Û=zq«xT£<„\ÕÒ¡\ÒD\ì\ĞQ\Ã\Ä(^\Ü*\és\ó\í\É\è‰8 t¨®\è•&b‡€\Z6 \ò;ı;M¾==„\ÕÒ¡\ÒD\ì\ĞQ\Ã„,_\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C\ĞI+V¬ø‹{\î¹g\İ\Ø\Ø\Ø+\Í\Ç#M>jÒŸûxdnùºt»üs»Â€¨+„\Õ’\ÒD\ì\Ğ(\Ì|\ÂX¹rå·›2lr~\ãÆ{_~ù\å\İG}\ï“O>9\Ù\ï\÷??şüÇÿ\í\ô\ô\ôûO?ı\ô/\'&&.¥Û§\ÏË·QW\"ª+:$¥‰Ø¡¯Óšù\é¢t\Ôtr\æS¹æ§¥o6\å\Û\Û\äÃ;wş\äú\õ\ë3ı4·\ë:t\èÓ©©©s\ã\ãã¯¥\í\äÛÊ€¨+„\Õ’\ÒD\ì\Ğ0­™Ÿ_„\ŞI\övi\æS±\æ\'£\ï4…û\İs\Ï=\÷\ãk×®}”_Œ¢ù¼ş\îİ»/\Şw\ß}\Ó\ö\ò}Dd@Ô•ˆB‡\êŠIi\"v(77\ó/´/:\ï½\÷\ŞÛ·o\ïOOO\÷Oœ8ÑŸ½9\Û\Ó\Ç\ô\ßiyZ\ß\Ìøüb\õBWf>•jJ¶ºÉ™7\ß|\ó…\ì\ÚsA;ÖŸœœül||üÁ|_\Ñu%\â€Ğ¡º¢CRšˆj››ùWšÍ¬¾±cÇşÅ‹\óq>Tº]ºı\Ä\ÄDûb5mou¾/(6\÷S\ÕÇ§OŸşi^\Æ333ıÕ«Wÿ~ÕªU\ß\Í\÷‰QW\"ª+:$¥‰Ø¡¹™ÿ‡‹Ô‡~øú©S§\ò>’\ôy6lø£‹U¬²¨V¬X\ñ­¦Xg\ë‘\Ô\Ü\Ü#«Ÿ§ı\äûÂ€¨+„\Õ’\ÒD\ìP27\óg–›7o¾q\éÒ¥|tß‘\ôù[¶li_¬\ÎFùT¦)Ô\ôœÔ¦k7\ò\ò-–={\ö\Üh~\âúE¾\ï(ˆºq@\èP]\Ñ!)M\Ä%i\æ·I-½HH\Û\ÉYİ“\ï\î\Ø\Ü\ÛQ|¸\ĞN*½ÀjÓ¦MW×¬Y\ó½ü\"0 \êJ\Ä¡CuE‡¤4;47\óÿ\ğœÔ…şºÿV\Ò\ö\Ú\ÏY\õ\ÖUkŠ\ô\ÖÎ;ÿ%/\ÛR8|øp\ãÆ§\òcˆÀ€¨+„\Õ’\ÒD\ìPšùƒ‹\È\ôB¨¥¶\ÛzT\õ­ü`ds}\â\Ü\õ\ë\×—m)¤\÷Yššº>99ùüXjg@Ô•ˆB‡\êŠIi¢uhn\æ\ßH\é-¨F}uÿJ\Ûm½u\Õ\rÁŠ[¿aÃ†=yÉ–\Ò\ó\Ï?\ßßºu\ë\ócYN\Í7\ÒMş2_\Şf@Ô•\Ú„Å‹Ii¢u(\ÍüÁ#\Ï>ûl>U\Úş`_i¿ù±ÀHš\ízé¥—^\É¶”Ò¯ÿ7o\Şü«üX–\Ó\à›\é\ë¾\É\rˆºR\á€Ğ¡`\Ñ!)M´5\Ëv\rn³oß¾|</ª´ı\Ö\ñ\ìÊFÒ”\ç\İ>øà½¼`K\é\äÉ“ıG}\ô³üX–S\ë›\é–\ß\äD]©x@\èPè”&Z‡š¿;X—f\ñRJ\ÛoÇ»­Ã„\Ñ5\å9s\îÜ¹_\ç[J.\\\è¯]»\öj~,\Ëi\È7\÷¼or¢®:TytHJ­CM\Î–¥Y¼”\Ò\ö[û?“+Œ¤)Ï•«W¯~–l)5û»ù$\ëüX–Óo\ê<ou%Ğ€Ğ¡J£CRšhZµj\Õ\õÁ¿\Ó,^Jiû­}_ÉFÒ”\ç\Ì\ì\ì\ì\çyÁ–Rú)kİºu7_u)D]I\ç#?GµG‡\êŠIi\"vh¨BSw?~:/\ØRJ\Ï[yü\ñ\Ç/\çÇ²œ\òo\àVŞ¸\'\è¯ÜšCšQ\××@d„\éPoHRk}mÑ¡\ÅOo\ÈùOY¬\õµ%Z‡\î\ñU¢iÊ³kß¾}G\ó‚-¥\ôªÿmÛ¶Ëe9\İê›º}›\ÚDŞ;\÷\ö²Û­¯=D¸\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ö¡{¼\êŸh\Ò{›mİº\õı¼`K)½\ê/¼\ğz~,\Ë\éV\ß\Ômµˆ<½!w\î\íe·[_{*a;\Ôrş\Û\ËJ\×\×Zü\ô†œ\ï\ö²\Ò\õµ%Z‡¼*á¤¿111\ñiú‹QwC\ÚÏš5kúo¿ı\ö_\åÇ²œn\õM\İVû€\È\Ór\ç\Ş^v»\õµ§\Â¾C½!ç¿½¬t}mÑ¡\ÅOo\Èùn/+]_[¢u¨ı—©Ò‹šıe*BhJ\ôÖ¡C‡>Í‹¶Ò¯ıŸ|\òÉ¯šşi~µ«}@\ä\é\r¹so/»\İú\ÚSÛ€E\í\ê\r9ÿ\íe¥\ëk‹-~zC\Îw{Y\éú\Ú±Ci\æ\éÜ±cG>¦E\Ú\î`iù1ÀY¹rå·§¦¦\Î]»v-\ïÚ¢J\Û\ä‘Gú{\÷\îı§ü\"¨}@\ä\é\r¹so/»\İú\Úq@\ÔŞ¡Ş\ó\ß^Vº¾¶\è\Ğ\â§7\ä|·—•®¯-;”fş\à\"rbb¢\êÔ©|\\I\ÛK\Û\ì#\í/?¸c\ã\ã\ã¯\îŞ½{i~0gÏ=ıgy\ær\ó\Ï?\Ï\÷A\í\"OoÈ{{\Ù\í\Ö×ˆ¢\ö\õ†œÿ\ö²\Ò\õµE‡?½!ç»½¬t}m‰Ø¡¤¹€\Ü3¸Ü°aCÿÒ¥Kù\È^´´½Ö£©{\ò}Ã‚¬X±\â[\÷\ßÿ\ÅcÇ\İÈ‹·š\í¦\÷NM\ÏM}8\ßwµˆ<\Í!Í¨\ëkO\ÄQ{‡zCú²X\ëk‹-~zC\Î\Êb­¯-;”¤™\ß\\D\Î.(·l\ÙR|±š>?mg°\Í\ñ\ñ\ñ‹i?ù¾aÁV®\\ù\É\É\É\Ïgff\òşI\ÛK©¯½\ö\ÚO\ò}FRû€øÿ–ˆB‡\êŠIi\"vh \Íü\æ‚\òjû‘Õ…>\r }^û‘\ÔU«V]K\Û\Ï\÷	ÅšŸ€œššú}zt1¤\í¬_¿¾¿k×®ÿlş\óO\òıEb@Ô•ˆB‡\êŠIi\"v¨­¹¨\\İ¾XM\Ï-M/„\Z\õ\İ\0\Ò\í\Ò\í\Û\ÏIM©i»ù¾`\Ñ4%û\î<\ğEzN\éB_`•>/}şÚµko>’\Ú~‘šu%\â€Ğ¡º¢CRšˆ\Ê\Í=²zap¡™’\ŞZjû\ö\íı\é\é\éş‰\'ú³³³7g{ú˜ş;-O\ë[oA5¸Hı\Ô#©\Üccc\ß|è¡‡~±iÓ¦«\é-¥F}Ÿ\Õt»tû\ô\êşmÛ¶]~\çw\Â>\'5g@Ô•ˆB‡\êŠIi\"vh˜4\ó›Í½\í‹\Îdo\ÚN¾mXRkÖ¬ù\ŞÆO>ø\àƒ\×\Ó_”j.<‡şt•–§\õSSSı§z\ê«W_}\õŸûA_\İ+D]‰8 t¨®è”&b‡¾\Î\Ü[Wrúu9\è-¨Xv“““\ßØ¶m\ÛŸx\â‰_?\ö\ØcŸ­[·\î\æsZÖ¯_£Yvy\ëÖ­\ç_|\ñÅŸ>|ø¯û\ß\ÌD]‰8 t¨®è”&b‡F1\÷¬Ö½\Ò|<\Òä£¹‹\Ò\ô\ñ\È\Ü\òuş\âTÄ€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Äe@Ô•ˆB‡\êŠIi\"v\è(¢®D:TWtHJ±C@Gu%\â€Ğ¡º¢CRšˆ:Ê€¨+„\Õ’\ÒD\ì\ĞQD]‰8 t¨®è”&b‡€2 \êJ\Ä¡CuE‡¤4;t”QW\"ª+:$¥‰\Ø! £ˆºq@\èP]\Ñ!)M\Ä5==}\ã\ò\å\Ë\ó\î¨\ä\î§97\âJ~j§C\õD‡¤4Q;t\ÔÁƒ?™™™wg%w?¿ù\Íov6\âH~j§C\õD‡¤4Q;t\Ôşıûp\àÀKgÏ=\ï\åI\óu?{ú\ô\ém†\Ão›|??GµÓ¡\åIi¢w\è°t§”~‚n\òezn’\Ü\õ¤¯{úú‡\é\Ø\çşthy¢CRš\ğ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âÿ\0\Û5<\ê\ÎQ“\0\0\0\0IEND®B`‚',1);
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
INSERT INTO `act_hi_actinst` VALUES ('0c7d9f11-1e2f-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363',1,0,NULL,''),('0c7d9f12-1e2f-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363',2,0,NULL,''),('0c7d9f13-1e2f-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','fillTask','0c7d9f14-1e2f-11ef-9942-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 10:48:09.363','2024-05-30 12:41:39.155',3,6809792,NULL,''),('0f4dd13c-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:15:19.201','2024-05-29 12:15:19.203',1,2,NULL,''),('0f4e1f5d-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:15:19.203','2024-05-29 12:15:19.203',2,0,NULL,''),('0f4e466e-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','0f4f57df-1d72-11ef-8102-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:15:19.204',NULL,3,NULL,NULL,''),('17ca541c-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:02:23.595','2024-05-30 19:02:23.595',1,0,NULL,''),('17ca7b2d-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 19:02:23.596','2024-05-30 19:02:23.606',2,10,NULL,''),('17cc01ce-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 19:02:23.606','2024-05-30 19:02:23.606',3,0,NULL,''),('17cc28df-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','directorTak','17cc28e0-1e74-11ef-aa50-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-05-30 19:02:23.607',NULL,4,NULL,NULL,''),('1c088cf5-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',1,0,NULL,''),('1c088cf6-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',2,0,NULL,''),('1c088cf7-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','judgeMore',NULL,NULL,'å¤§äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',3,0,NULL,''),('1c08b408-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','bossTask','1c08b409-1e3f-11ef-91f3-00ff29e62bab',NULL,'è€æ¿å®¡æ‰¹','userTask',NULL,'2024-05-30 12:43:07.388',NULL,4,NULL,NULL,''),('1e89b276-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079',1,0,NULL,''),('1e89b277-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079',2,0,NULL,''),('1e89b278-1e42-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','fillTask','1e89b279-1e42-11ef-877e-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','111','2024-05-30 13:04:40.079','2024-05-30 13:06:38.936',3,118857,NULL,''),('33e664a5-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 13:06:27.076','2024-05-29 13:06:27.078',1,2,NULL,''),('33e6d9d6-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 13:06:27.079','2024-05-29 13:06:27.079',2,0,NULL,''),('33e6d9d7-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','33e88788-1d79-11ef-965a-00ff29e62bab',NULL,'è‡ªè¯„','userTask',NULL,'2024-05-29 13:06:27.079',NULL,3,NULL,NULL,''),('37435a13-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:23:35.738','2024-05-29 12:23:35.740',1,2,NULL,''),('3743cf44-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:23:35.741','2024-05-29 12:23:35.741',2,0,NULL,''),('3743cf45-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','374507c6-1d73-11ef-bde3-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:23:35.741',NULL,3,NULL,NULL,''),('42480137-1e8a-11ef-8eab-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 21:41:03.811','2024-05-30 21:41:03.811',1,0,NULL,''),('42480138-1e8a-11ef-8eab-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:41:03.811','2024-05-30 21:41:03.811',2,0,NULL,''),('42480139-1e8a-11ef-8eab-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','fillTask','4248013a-1e8a-11ef-8eab-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','243','2024-05-30 21:41:03.811','2024-05-30 21:52:51.037',3,707226,NULL,''),('4d27d3e5-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127',1,0,NULL,''),('4d27d3e6-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127',2,0,NULL,''),('4d27d3e7-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','fillTask','4d27d3e8-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','33','2024-05-30 19:03:53.127',NULL,3,NULL,NULL,''),('5d0ba34c-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-28 21:58:30.022','2024-05-28 21:58:30.025',1,3,NULL,''),('5d0c187d-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-28 21:58:30.025','2024-05-28 21:58:30.025',2,0,NULL,''),('5d0c187e-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','5d0efeaf-1cfa-11ef-aff9-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-28 21:58:30.025',NULL,3,NULL,NULL,''),('5ee09c7f-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-06-02 21:45:27.812','2024-06-02 21:45:27.818',1,6,NULL,''),('5ee1adf0-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:45:27.819','2024-06-02 21:45:27.819',2,0,NULL,''),('5ee1adf1-20e6-11ef-8056-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','fillTask','5ee35ba2-20e6-11ef-8056-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','456','2024-06-02 21:45:27.819','2024-06-02 21:47:20.966',3,113147,NULL,''),('62e2c976-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.521',1,2,NULL,''),('62e31797-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:27:39.521','2024-05-30 21:27:39.521',2,0,NULL,''),('62e31798-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','fillTask','62e4ec59-1e88-11ef-bccc-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','434','2024-05-30 21:27:39.521',NULL,3,NULL,NULL,''),('6512b002-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:32:02.091','2024-05-29 12:32:02.092',1,1,NULL,''),('6512fe23-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:32:02.093','2024-05-29 12:32:02.093',2,0,NULL,''),('6512fe24-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','651436a5-1d74-11ef-b1f5-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:32:02.093',NULL,3,NULL,NULL,''),('6561d60d-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:06:38.936','2024-05-30 13:06:38.936',1,0,NULL,''),('6561d60e-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 13:06:38.936','2024-05-30 13:06:38.937',2,1,NULL,''),('6561fd1f-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 13:06:38.937','2024-05-30 13:06:38.937',3,0,NULL,''),('6561fd20-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','directorTak','6561fd21-1e42-11ef-877e-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-05-30 13:06:38.937',NULL,4,NULL,NULL,''),('6d7023fc-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:04:47.288','2024-05-30 19:04:47.288',1,0,NULL,''),('6d7023fd-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 19:04:47.288','2024-05-30 19:04:47.291',2,3,NULL,''),('6d70992e-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 19:04:47.291','2024-05-30 19:04:47.291',3,0,NULL,''),('6d70c03f-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','directorTak','6d70c040-1e74-11ef-aa50-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-05-30 19:04:47.292',NULL,4,NULL,NULL,''),('72319b52-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:32:24.104','2024-05-29 12:32:24.106',1,2,NULL,''),('7231e973-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:32:24.106','2024-05-29 12:32:24.106',2,0,NULL,''),('72321084-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','72339725-1d74-11ef-8067-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:32:24.107',NULL,3,NULL,NULL,''),('7798dbc8-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹ ','startEvent',NULL,'2024-05-29 17:04:34.045','2024-05-29 17:04:34.047',1,2,NULL,''),('779929e9-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05',NULL,NULL,'æµç¨‹å¼€å§‹ ','sequenceFlow',NULL,'2024-05-29 17:04:34.047','2024-05-29 17:04:34.047',2,0,NULL,''),('779950fa-1d9a-11ef-b8cc-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','apply','779b25bb-1d9a-11ef-b8cc-00ff29e62bab',NULL,'è¯·å‡ç”³è¯· ','userTask','å°æ˜','2024-05-29 17:04:34.048','2024-05-29 17:04:34.118',3,70,NULL,''),('77a4266e-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','applyFlow',NULL,NULL,'ç”³è¯·æµç¨‹ ','sequenceFlow',NULL,'2024-05-29 17:04:34.119','2024-05-29 17:04:34.119',1,0,NULL,''),('77a44d7f-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','teacherPass','77a44d80-1d9a-11ef-b8cc-00ff29e62bab',NULL,'é¢†å¯¼å®¡æ‰¹ ','userTask',NULL,'2024-05-29 17:04:34.120',NULL,2,NULL,NULL,''),('8205f9ae-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 12:38:49.001','2024-05-30 12:38:49.002',1,1,NULL,''),('820620bf-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:38:49.002','2024-05-30 12:38:49.002',2,0,NULL,''),('820620c0-1e3e-11ef-91f3-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','fillTask','8207f581-1e3e-11ef-91f3-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 12:38:49.002','2024-05-30 12:43:07.386',3,258384,NULL,''),('85c6c315-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:05:28.121','2024-05-30 19:05:28.122',1,1,NULL,''),('85c6ea26-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:28.122','2024-05-30 19:05:28.122',2,0,NULL,''),('85c6ea27-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','fillTask','85c6ea28-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','383','2024-05-30 19:05:28.122',NULL,3,NULL,NULL,''),('87a1c4af-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234',1,0,NULL,''),('87a1c4b0-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234',2,0,NULL,''),('87a1c4b1-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','fillTask','87a1c4b2-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','383','2024-05-30 19:05:31.234',NULL,3,NULL,NULL,''),('87f31909-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:05:31.767','2024-05-30 19:05:31.767',1,0,NULL,''),('87f3190a-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:31.767','2024-05-30 19:05:31.767',2,0,NULL,''),('87f3190b-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','fillTask','87f3190c-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','383','2024-05-30 19:05:31.767',NULL,3,NULL,NULL,''),('8842bfb3-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289',1,0,NULL,''),('8842bfb4-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289',2,0,NULL,''),('8842bfb5-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','fillTask','8842bfb6-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','383','2024-05-30 19:05:32.289',NULL,3,NULL,NULL,''),('a252b1b6-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:47:20.967','2024-06-02 21:47:20.967',1,0,NULL,''),('a252b1b7-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-02 21:47:20.967','2024-06-02 21:47:20.970',2,3,NULL,''),('a25326e8-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-06-02 21:47:20.970','2024-06-02 21:47:20.970',3,0,NULL,''),('a25326e9-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','directorTak','a25326ea-20e6-11ef-8056-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-06-02 21:47:20.970',NULL,4,NULL,NULL,''),('a27aff15-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:39:43.455','2024-05-30 12:39:43.455',1,0,NULL,''),('a27aff16-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:39:43.455','2024-05-30 12:39:43.457',2,2,NULL,''),('a27b4d37-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','judgeMore',NULL,NULL,'å¤§äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 12:39:43.457','2024-05-30 12:39:43.457',3,0,NULL,''),('a27b7448-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','bossTask','a27b7449-1e3e-11ef-91f3-00ff29e62bab',NULL,'è€æ¿å®¡æ‰¹','userTask',NULL,'2024-05-30 12:39:43.458',NULL,4,NULL,NULL,''),('b0f4d79c-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-28 19:01:53.383','2024-05-28 19:01:53.386',1,3,NULL,''),('b0f54ccd-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-28 19:01:53.386','2024-05-28 19:01:53.386',2,0,NULL,''),('b0f573de-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b0f6854f-1ce1-11ef-94ed-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-28 19:01:53.387',NULL,3,NULL,NULL,''),('b2ec222e-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040',1,0,NULL,''),('b2ec222f-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040',2,0,NULL,''),('b2ec2230-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','fillTask','b2ec2231-1e3e-11ef-91f3-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 12:40:11.040',NULL,3,NULL,NULL,''),('b8fcbb7c-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:27:13.379','2024-05-29 12:27:13.381',1,2,NULL,''),('b8fd30ad-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:27:13.382','2024-05-29 12:27:13.382',2,0,NULL,''),('b8fd30ae-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b8fe692f-1d73-11ef-880e-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:27:13.382',NULL,3,NULL,NULL,''),('c0ed8adb-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 18:59:57.864','2024-05-30 18:59:57.866',1,2,NULL,''),('c0edd8fc-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 18:59:57.866','2024-05-30 18:59:57.866',2,0,NULL,''),('c0edd8fd-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','fillTask','c0effbde-1e73-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','222','2024-05-30 18:59:57.866','2024-05-30 19:02:23.595',3,145729,NULL,''),('c8887ef0-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-06-02 21:48:25.073','2024-06-02 21:48:25.075',1,2,NULL,''),('c888cd11-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:48:25.075','2024-06-02 21:48:25.075',2,0,NULL,''),('c888f422-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','fillTask','c88a2ca3-20e6-11ef-a633-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','456','2024-06-02 21:48:25.076',NULL,3,NULL,NULL,''),('c91d1b06-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 13:02:16.761','2024-05-30 13:02:16.762',1,1,NULL,''),('c91d6927-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:02:16.763','2024-05-30 13:02:16.763',2,0,NULL,''),('c91d6928-1e41-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','fillTask','c91f16d9-1e41-11ef-877e-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 13:02:16.763','2024-05-30 13:03:37.272',3,80509,NULL,''),('cc84d196-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹ ','startEvent',NULL,'2024-05-30 20:54:49.259','2024-05-30 20:54:49.260',1,1,NULL,''),('cc8546c7-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05',NULL,NULL,'æµç¨‹å¼€å§‹ ','sequenceFlow',NULL,'2024-05-30 20:54:49.261','2024-05-30 20:54:49.261',2,0,NULL,''),('cc8546c8-1e83-11ef-a97f-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','apply','cc86cd69-1e83-11ef-a97f-00ff29e62bab',NULL,'è¯·å‡ç”³è¯· ','userTask','å°æ˜','2024-05-30 20:54:49.261','2024-05-30 20:54:49.320',3,59,NULL,''),('cc8e477c-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','applyFlow',NULL,NULL,'ç”³è¯·æµç¨‹ ','sequenceFlow',NULL,'2024-05-30 20:54:49.320','2024-05-30 20:54:49.320',1,0,NULL,''),('cc8e6e8d-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','teacherPass','cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',NULL,'é¢†å¯¼å®¡æ‰¹ ','userTask',NULL,'2024-05-30 20:54:49.321',NULL,2,NULL,NULL,''),('ddc3e5b5-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245',1,0,NULL,''),('ddc3e5b6-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245',2,0,NULL,''),('ddc3e5b7-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','fillTask','ddc3e5b8-1e73-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','222','2024-05-30 19:00:46.245','2024-05-30 19:04:47.288',3,241043,NULL,''),('e7719175-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:41:39.156','2024-05-30 12:41:39.156',1,0,NULL,''),('e7719176-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:41:39.156','2024-05-30 12:41:39.157',2,1,NULL,''),('e771b887-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','judgeMore',NULL,NULL,'å¤§äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 12:41:39.157','2024-05-30 12:41:39.157',3,0,NULL,''),('e771b888-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','bossTask','e771b889-1e3e-11ef-91f3-00ff29e62bab',NULL,'è€æ¿å®¡æ‰¹','userTask',NULL,'2024-05-30 12:41:39.157',NULL,4,NULL,NULL,''),('e7d26f63-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:52:51.039','2024-05-30 21:52:51.039',1,0,NULL,''),('e7d2bd84-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 21:52:51.041','2024-05-30 21:52:51.050',2,9,NULL,''),('e7d41d15-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 21:52:51.050','2024-05-30 21:52:51.050',3,0,NULL,''),('e7d44426-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','directorTak','e7d44427-1e8b-11ef-bdf1-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-05-30 21:52:51.051',NULL,4,NULL,NULL,''),('eb6ecaa7-1e2e-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 10:47:13.901','2024-05-30 10:47:13.903',1,2,NULL,''),('eb6f18c8-1e2e-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 10:47:13.903','2024-05-30 10:47:13.903',2,0,NULL,''),('eb6f3fd9-1e2e-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','fillTask','eb70785a-1e2e-11ef-9942-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 10:47:13.904','2024-05-30 12:39:43.455',3,6749551,NULL,''),('f35f8cb7-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:14:32.341','2024-05-29 12:14:32.343',1,2,NULL,''),('f36001e8-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:32.344','2024-05-29 12:14:32.344',2,0,NULL,''),('f36001e9-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','f361888a-1d71-11ef-8ae9-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:14:32.344',NULL,3,NULL,NULL,''),('f91a430d-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:03:37.273','2024-05-30 13:03:37.273',1,0,NULL,''),('f91a430e-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 13:03:37.273','2024-05-30 13:03:37.277',2,4,NULL,''),('f91adf4f-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','judgeMore',NULL,NULL,'å¤§äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 13:03:37.277','2024-05-30 13:03:37.277',3,0,NULL,''),('f91b0660-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','bossTask','f91b0661-1e41-11ef-877e-00ff29e62bab',NULL,'suå®¡æ‰¹','userTask',NULL,'2024-05-30 13:03:37.278',NULL,4,NULL,NULL,''),('fb3ded7e-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372',1,0,NULL,''),('fb3ded7f-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372',2,0,NULL,''),('fb3ded80-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','fillTask','fb3ded81-1e3e-11ef-91f3-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 12:42:12.372',NULL,3,NULL,NULL,''),('fb651444-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:14:45.799','2024-05-29 12:14:45.801',1,2,NULL,''),('fb658975-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:45.802','2024-05-29 12:14:45.802',2,0,NULL,''),('fb658976-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fb66c1f7-1d71-11ef-8e79-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:14:45.802',NULL,3,NULL,NULL,''),('fc7b3f3c-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:14:47.622','2024-05-29 12:14:47.622',1,0,NULL,''),('fc7b3f3d-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:47.622','2024-05-29 12:14:47.622',2,0,NULL,''),('fc7b3f3e-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fc7b3f3f-1d71-11ef-8e79-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:14:47.622',NULL,3,NULL,NULL,'');
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
INSERT INTO `act_hi_identitylink` VALUES ('0c7dc625-1e2f-11ef-9942-00ff29e62bab',NULL,'assignee','123','0c7d9f14-1e2f-11ef-9942-00ff29e62bab','2024-05-30 10:48:09.364',NULL,NULL,NULL,NULL,NULL),('0c7dc626-1e2f-11ef-9942-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 10:48:09.364','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL),('0f4f7ef0-1d72-11ef-8102-00ff29e62bab',NULL,'assignee','a','0f4f57df-1d72-11ef-8102-00ff29e62bab','2024-05-29 12:15:19.212',NULL,NULL,NULL,NULL,NULL),('0f4f7ef1-1d72-11ef-8102-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:15:19.212','0f4dd13a-1d72-11ef-8102-00ff29e62bab',NULL,NULL,NULL,NULL),('1e89b27a-1e42-11ef-877e-00ff29e62bab',NULL,'assignee','111','1e89b279-1e42-11ef-877e-00ff29e62bab','2024-05-30 13:04:40.079',NULL,NULL,NULL,NULL,NULL),('1e89b27b-1e42-11ef-877e-00ff29e62bab',NULL,'participant','111',NULL,'2024-05-30 13:04:40.079','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL),('37452ed7-1d73-11ef-bde3-00ff29e62bab',NULL,'assignee','a','374507c6-1d73-11ef-bde3-00ff29e62bab','2024-05-29 12:23:35.750',NULL,NULL,NULL,NULL,NULL),('37452ed8-1d73-11ef-bde3-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:23:35.751','37435a11-1d73-11ef-bde3-00ff29e62bab',NULL,NULL,NULL,NULL),('4248013b-1e8a-11ef-8eab-00ff29e62bab',NULL,'assignee','243','4248013a-1e8a-11ef-8eab-00ff29e62bab','2024-05-30 21:41:03.811',NULL,NULL,NULL,NULL,NULL),('4248284c-1e8a-11ef-8eab-00ff29e62bab',NULL,'participant','243',NULL,'2024-05-30 21:41:03.812','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL),('4d27d3e9-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','33','4d27d3e8-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:03:53.127',NULL,NULL,NULL,NULL,NULL),('4d27d3ea-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','33',NULL,'2024-05-30 19:03:53.127','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('5d0f25c0-1cfa-11ef-aff9-00ff29e62bab',NULL,'assignee','a','5d0efeaf-1cfa-11ef-aff9-00ff29e62bab','2024-05-28 21:58:30.045',NULL,NULL,NULL,NULL,NULL),('5d0f4cd1-1cfa-11ef-aff9-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-28 21:58:30.046','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',NULL,NULL,NULL,NULL),('5ee3a9c3-20e6-11ef-8056-00ff29e62bab',NULL,'assignee','456','5ee35ba2-20e6-11ef-8056-00ff29e62bab','2024-06-02 21:45:27.832',NULL,NULL,NULL,NULL,NULL),('5ee3d0d4-20e6-11ef-8056-00ff29e62bab',NULL,'participant','456',NULL,'2024-06-02 21:45:27.833','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL),('62e53a7a-1e88-11ef-bccc-00ff29e62bab',NULL,'assignee','434','62e4ec59-1e88-11ef-bccc-00ff29e62bab','2024-05-30 21:27:39.535',NULL,NULL,NULL,NULL,NULL),('62e5618b-1e88-11ef-bccc-00ff29e62bab',NULL,'participant','434',NULL,'2024-05-30 21:27:39.536','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL),('65145db6-1d74-11ef-b1f5-00ff29e62bab',NULL,'assignee','a','651436a5-1d74-11ef-b1f5-00ff29e62bab','2024-05-29 12:32:02.102',NULL,NULL,NULL,NULL,NULL),('65145db7-1d74-11ef-b1f5-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:32:02.102','651288f0-1d74-11ef-b1f5-00ff29e62bab',NULL,NULL,NULL,NULL),('7233be36-1d74-11ef-8067-00ff29e62bab',NULL,'assignee','a','72339725-1d74-11ef-8067-00ff29e62bab','2024-05-29 12:32:24.118',NULL,NULL,NULL,NULL,NULL),('7233e547-1d74-11ef-8067-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:32:24.119','72317440-1d74-11ef-8067-00ff29e62bab',NULL,NULL,NULL,NULL),('779b73dc-1d9a-11ef-b8cc-00ff29e62bab',NULL,'assignee','å°æ˜','779b25bb-1d9a-11ef-b8cc-00ff29e62bab','2024-05-29 17:04:34.062',NULL,NULL,NULL,NULL,NULL),('779b73dd-1d9a-11ef-b8cc-00ff29e62bab',NULL,'participant','å°æ˜',NULL,'2024-05-29 17:04:34.062','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL),('77a44d81-1d9a-11ef-b8cc-00ff29e62bab','a','candidate',NULL,'77a44d80-1d9a-11ef-b8cc-00ff29e62bab','2024-05-29 17:04:34.120',NULL,NULL,NULL,NULL,NULL),('82081c92-1e3e-11ef-91f3-00ff29e62bab',NULL,'assignee','123','8207f581-1e3e-11ef-91f3-00ff29e62bab','2024-05-30 12:38:49.015',NULL,NULL,NULL,NULL,NULL),('8208b8d3-1e3e-11ef-91f3-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 12:38:49.019','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL),('85c6ea29-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','383','85c6ea28-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:05:28.122',NULL,NULL,NULL,NULL,NULL),('85c6ea2a-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','383',NULL,'2024-05-30 19:05:28.123','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('87a1c4b3-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','383','87a1c4b2-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:05:31.234',NULL,NULL,NULL,NULL,NULL),('87a1ebc4-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','383',NULL,'2024-05-30 19:05:31.235','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('87f3190d-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','383','87f3190c-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:05:31.767',NULL,NULL,NULL,NULL,NULL),('87f3190e-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','383',NULL,'2024-05-30 19:05:31.767','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('8842e6c7-1e74-11ef-aa50-00ff29e62bab',NULL,'assignee','383','8842bfb6-1e74-11ef-aa50-00ff29e62bab','2024-05-30 19:05:32.290',NULL,NULL,NULL,NULL,NULL),('8842e6c8-1e74-11ef-aa50-00ff29e62bab',NULL,'participant','383',NULL,'2024-05-30 19:05:32.290','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('b0f6ac60-1ce1-11ef-94ed-00ff29e62bab',NULL,'assignee','a','b0f6854f-1ce1-11ef-94ed-00ff29e62bab','2024-05-28 19:01:53.395',NULL,NULL,NULL,NULL,NULL),('b0f6ac61-1ce1-11ef-94ed-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-28 19:01:53.396','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',NULL,NULL,NULL,NULL),('b2ec4942-1e3e-11ef-91f3-00ff29e62bab',NULL,'assignee','123','b2ec2231-1e3e-11ef-91f3-00ff29e62bab','2024-05-30 12:40:11.041',NULL,NULL,NULL,NULL,NULL),('b2ec4943-1e3e-11ef-91f3-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 12:40:11.041','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL),('b8fe6930-1d73-11ef-880e-00ff29e62bab',NULL,'assignee','a','b8fe692f-1d73-11ef-880e-00ff29e62bab','2024-05-29 12:27:13.390',NULL,NULL,NULL,NULL,NULL),('b8fe9041-1d73-11ef-880e-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:27:13.391','b8fcbb7a-1d73-11ef-880e-00ff29e62bab',NULL,NULL,NULL,NULL),('c0effbdf-1e73-11ef-aa50-00ff29e62bab',NULL,'assignee','222','c0effbde-1e73-11ef-aa50-00ff29e62bab','2024-05-30 18:59:57.880',NULL,NULL,NULL,NULL,NULL),('c0effbe0-1e73-11ef-aa50-00ff29e62bab',NULL,'participant','222',NULL,'2024-05-30 18:59:57.880','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('c88a7ac4-20e6-11ef-a633-00ff29e62bab',NULL,'assignee','456','c88a2ca3-20e6-11ef-a633-00ff29e62bab','2024-06-02 21:48:25.086',NULL,NULL,NULL,NULL,NULL),('c88ac8e5-20e6-11ef-a633-00ff29e62bab',NULL,'participant','456',NULL,'2024-06-02 21:48:25.088','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL),('c91f3dea-1e41-11ef-877e-00ff29e62bab',NULL,'assignee','123','c91f16d9-1e41-11ef-877e-00ff29e62bab','2024-05-30 13:02:16.775',NULL,NULL,NULL,NULL,NULL),('c91f3deb-1e41-11ef-877e-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 13:02:16.775','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL),('cc871b8a-1e83-11ef-a97f-00ff29e62bab',NULL,'assignee','å°æ˜','cc86cd69-1e83-11ef-a97f-00ff29e62bab','2024-05-30 20:54:49.273',NULL,NULL,NULL,NULL,NULL),('cc871b8b-1e83-11ef-a97f-00ff29e62bab',NULL,'participant','å°æ˜',NULL,'2024-05-30 20:54:49.273','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL),('cc8e6e8f-1e83-11ef-a97f-00ff29e62bab','a','candidate',NULL,'cc8e6e8e-1e83-11ef-a97f-00ff29e62bab','2024-05-30 20:54:49.321',NULL,NULL,NULL,NULL,NULL),('ddc3e5b9-1e73-11ef-aa50-00ff29e62bab',NULL,'assignee','222','ddc3e5b8-1e73-11ef-aa50-00ff29e62bab','2024-05-30 19:00:46.245',NULL,NULL,NULL,NULL,NULL),('ddc3e5ba-1e73-11ef-aa50-00ff29e62bab',NULL,'participant','222',NULL,'2024-05-30 19:00:46.245','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL),('eb709f6b-1e2e-11ef-9942-00ff29e62bab',NULL,'assignee','123','eb70785a-1e2e-11ef-9942-00ff29e62bab','2024-05-30 10:47:13.913',NULL,NULL,NULL,NULL,NULL),('eb709f6c-1e2e-11ef-9942-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 10:47:13.913','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL),('f361af9b-1d71-11ef-8ae9-00ff29e62bab',NULL,'assignee','a','f361888a-1d71-11ef-8ae9-00ff29e62bab','2024-05-29 12:14:32.355',NULL,NULL,NULL,NULL,NULL),('f361af9c-1d71-11ef-8ae9-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:14:32.355','f35f65a5-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL),('fb3ded82-1e3e-11ef-91f3-00ff29e62bab',NULL,'assignee','123','fb3ded81-1e3e-11ef-91f3-00ff29e62bab','2024-05-30 12:42:12.372',NULL,NULL,NULL,NULL,NULL),('fb3ded83-1e3e-11ef-91f3-00ff29e62bab',NULL,'participant','123',NULL,'2024-05-30 12:42:12.372','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL),('fb66c1f8-1d71-11ef-8e79-00ff29e62bab',NULL,'assignee','a','fb66c1f7-1d71-11ef-8e79-00ff29e62bab','2024-05-29 12:14:45.810',NULL,NULL,NULL,NULL,NULL),('fb66e909-1d71-11ef-8e79-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:14:45.811','fb651442-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL),('fc7b3f40-1d71-11ef-8e79-00ff29e62bab',NULL,'assignee','a','fc7b3f3f-1d71-11ef-8e79-00ff29e62bab','2024-05-29 12:14:47.622',NULL,NULL,NULL,NULL,NULL),('fc7b3f41-1d71-11ef-8e79-00ff29e62bab',NULL,'participant','a',NULL,'2024-05-29 12:14:47.622','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL);
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
INSERT INTO `act_hi_taskinst` VALUES ('0c7d9f14-1e2f-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'123','2024-05-30 10:48:09.363',NULL,'2024-05-30 12:41:39.152',6809789,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:41:39.152'),('0f4f57df-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-29 12:15:19.204',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:15:19.212'),('17cc28e0-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-30 19:02:23.607',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:02:23.607'),('1c08b409-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'bossTask','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è€æ¿å®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-30 12:43:07.388',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:43:07.388'),('1e89b279-1e42-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'111','2024-05-30 13:04:40.079',NULL,'2024-05-30 13:06:38.935',118856,NULL,50,NULL,NULL,NULL,'','2024-05-30 13:06:38.935'),('33e88788-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,NULL,'2024-05-29 13:06:27.079',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 13:06:27.090'),('374507c6-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-29 12:23:35.741',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:23:35.750'),('4248013a-1e8a-11ef-8eab-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'243','2024-05-30 21:41:03.811',NULL,'2024-05-30 21:52:51.034',707223,NULL,50,NULL,NULL,NULL,'','2024-05-30 21:52:51.034'),('4d27d3e8-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'33','2024-05-30 19:03:53.127',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:03:53.127'),('5d0efeaf-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-28 21:58:30.025',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-28 21:58:30.045'),('5ee35ba2-20e6-11ef-8056-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'456','2024-06-02 21:45:27.819',NULL,'2024-06-02 21:47:20.963',113144,NULL,50,NULL,NULL,NULL,'','2024-06-02 21:47:20.963'),('62e4ec59-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'434','2024-05-30 21:27:39.521',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 21:27:39.534'),('651436a5-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-29 12:32:02.093',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:32:02.102'),('6561fd21-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-30 13:06:38.937',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 13:06:38.937'),('6d70c040-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-30 19:04:47.292',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:04:47.292'),('72339725-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-29 12:32:24.107',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:32:24.118'),('779b25bb-1d9a-11ef-b8cc-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'apply','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è¯·å‡ç”³è¯·',NULL,NULL,NULL,'å°æ˜','2024-05-29 17:04:34.048',NULL,'2024-05-29 17:04:34.116',68,NULL,50,NULL,NULL,NULL,'','2024-05-29 17:04:34.116'),('77a44d80-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'teacherPass','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'é¢†å¯¼å®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-29 17:04:34.120',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 17:04:34.120'),('8207f581-1e3e-11ef-91f3-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'123','2024-05-30 12:38:49.002',NULL,'2024-05-30 12:43:07.384',258382,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:43:07.384'),('85c6ea28-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'383','2024-05-30 19:05:28.122',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:05:28.122'),('87a1c4b2-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'383','2024-05-30 19:05:31.234',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:05:31.234'),('87f3190c-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'383','2024-05-30 19:05:31.767',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:05:31.767'),('8842bfb6-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'383','2024-05-30 19:05:32.289',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:05:32.290'),('a25326ea-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-06-02 21:47:20.970',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-06-02 21:47:20.970'),('a27b7449-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'bossTask','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è€æ¿å®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-30 12:39:43.458',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:39:43.458'),('b0f6854f-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-28 19:01:53.387',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-28 19:01:53.395'),('b2ec2231-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'123','2024-05-30 12:40:11.040',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:40:11.040'),('b8fe692f-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-29 12:27:13.382',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:27:13.390'),('c0effbde-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'222','2024-05-30 18:59:57.866',NULL,'2024-05-30 19:02:23.592',145726,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:02:23.592'),('c88a2ca3-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'456','2024-06-02 21:48:25.076',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-06-02 21:48:25.085'),('c91f16d9-1e41-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'123','2024-05-30 13:02:16.763',NULL,'2024-05-30 13:03:37.269',80506,NULL,50,NULL,NULL,NULL,'','2024-05-30 13:03:37.269'),('cc86cd69-1e83-11ef-a97f-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'apply','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è¯·å‡ç”³è¯·',NULL,NULL,NULL,'å°æ˜','2024-05-30 20:54:49.261',NULL,'2024-05-30 20:54:49.317',56,NULL,50,NULL,NULL,NULL,'','2024-05-30 20:54:49.317'),('cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,'teacherPass','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'é¢†å¯¼å®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-30 20:54:49.321',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 20:54:49.321'),('ddc3e5b8-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'fillTask','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'222','2024-05-30 19:00:46.245',NULL,'2024-05-30 19:04:47.286',241041,NULL,50,NULL,NULL,NULL,'','2024-05-30 19:04:47.286'),('e771b889-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'bossTask','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è€æ¿å®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-30 12:41:39.157',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:41:39.157'),('e7d44427-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'directorTak','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-30 21:52:51.051',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 21:52:51.052'),('eb70785a-1e2e-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'123','2024-05-30 10:47:13.904',NULL,'2024-05-30 12:39:43.452',6749548,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:39:43.452'),('f361888a-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-29 12:14:32.344',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:14:32.355'),('f91b0661-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,'bossTask','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'suå®¡æ‰¹',NULL,NULL,NULL,NULL,'2024-05-30 13:03:37.278',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 13:03:37.278'),('fb3ded81-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,'fillTask','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,NULL,'123','2024-05-30 12:42:12.372',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-30 12:42:12.372'),('fb66c1f7-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-29 12:14:45.802',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:14:45.810'),('fc7b3f3f-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,NULL,'a','2024-05-29 12:14:47.622',NULL,NULL,NULL,NULL,50,NULL,NULL,NULL,'','2024-05-29 12:14:47.622');
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
INSERT INTO `act_hi_varinst` VALUES ('0c7d9f0e-1e2f-11ef-9942-00ff29e62bab',0,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363'),('0c7d9f0f-1e2f-11ef-9942-00ff29e62bab',0,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363'),('17c9b7db-1e74-11ef-aa50-00ff29e62bab',0,'c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'é©³å›',NULL,NULL,'2024-05-30 19:02:23.592','2024-05-30 19:02:23.592'),('1c07f0b4-1e3f-11ef-91f3-00ff29e62bab',0,'8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL,'2024-05-30 12:43:07.383','2024-05-30 12:43:07.383'),('1e89b273-1e42-11ef-877e-00ff29e62bab',0,'1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,10,'10',NULL,NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079'),('1e89b274-1e42-11ef-877e-00ff29e62bab',0,'1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'111',NULL,NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079'),('4247da22-1e8a-11ef-8eab-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL,'2024-05-30 21:41:03.810','2024-05-30 21:41:03.810'),('4247da23-1e8a-11ef-8eab-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'descption','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-30 21:41:03.810','2024-05-30 21:41:03.810'),('4247da24-1e8a-11ef-8eab-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'user','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-30 21:41:03.810','2024-05-30 21:41:03.810'),('4247da25-1e8a-11ef-8eab-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'243',NULL,NULL,'2024-05-30 21:41:03.810','2024-05-30 21:41:03.810'),('4d27d3e2-1e74-11ef-aa50-00ff29e62bab',0,'4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127'),('4d27d3e3-1e74-11ef-aa50-00ff29e62bab',0,'4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'33',NULL,NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127'),('5ee04e5a-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL,'2024-06-02 21:45:27.811','2024-06-02 21:45:27.811'),('5ee0756b-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'descption','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-02 21:45:27.811','2024-06-02 21:45:27.811'),('5ee0756c-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'user','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-02 21:45:27.811','2024-06-02 21:45:27.811'),('5ee0756d-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'456',NULL,NULL,'2024-06-02 21:45:27.812','2024-06-02 21:45:27.812'),('62e2a261-1e88-11ef-bccc-00ff29e62bab',0,'62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.519'),('62e2c972-1e88-11ef-bccc-00ff29e62bab',0,'62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'descption','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.519'),('62e2c973-1e88-11ef-bccc-00ff29e62bab',0,'62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'user','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.519'),('62e2c974-1e88-11ef-bccc-00ff29e62bab',0,'62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'434',NULL,NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.519'),('6561aefc-1e42-11ef-877e-00ff29e62bab',0,'1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL,'2024-05-30 13:06:38.935','2024-05-30 13:06:38.935'),('6d6fd5db-1e74-11ef-aa50-00ff29e62bab',0,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'é©³å›',NULL,NULL,'2024-05-30 19:04:47.286','2024-05-30 19:04:47.286'),('7798b4b5-1d9a-11ef-b8cc-00ff29e62bab',0,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,'studentUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'å°æ˜',NULL,NULL,'2024-05-29 17:04:34.045','2024-05-29 17:04:34.045'),('7798dbc6-1d9a-11ef-b8cc-00ff29e62bab',0,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,'day','integer',NULL,NULL,NULL,NULL,NULL,5,'5',NULL,NULL,'2024-05-29 17:04:34.045','2024-05-29 17:04:34.045'),('8205d29b-1e3e-11ef-91f3-00ff29e62bab',0,'8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 12:38:49.000','2024-05-30 12:38:49.000'),('8205d29c-1e3e-11ef-91f3-00ff29e62bab',0,'8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 12:38:49.000','2024-05-30 12:38:49.000'),('85c6c312-1e74-11ef-aa50-00ff29e62bab',0,'85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:05:28.121','2024-05-30 19:05:28.121'),('85c6c313-1e74-11ef-aa50-00ff29e62bab',0,'85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL,'2024-05-30 19:05:28.121','2024-05-30 19:05:28.121'),('87a1c4ac-1e74-11ef-aa50-00ff29e62bab',0,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234'),('87a1c4ad-1e74-11ef-aa50-00ff29e62bab',0,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234'),('87f2f1f6-1e74-11ef-aa50-00ff29e62bab',0,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:05:31.766','2024-05-30 19:05:31.766'),('87f2f1f7-1e74-11ef-aa50-00ff29e62bab',0,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL,'2024-05-30 19:05:31.766','2024-05-30 19:05:31.766'),('8842bfb0-1e74-11ef-aa50-00ff29e62bab',0,'8842989f-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289'),('8842bfb1-1e74-11ef-aa50-00ff29e62bab',0,'8842989f-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289'),('a2521575-20e6-11ef-8056-00ff29e62bab',0,'5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL,'2024-06-02 21:47:20.963','2024-06-02 21:47:20.963'),('a27a89e4-1e3e-11ef-91f3-00ff29e62bab',0,'eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL,'2024-05-30 12:39:43.452','2024-05-30 12:39:43.452'),('b2ec222b-1e3e-11ef-91f3-00ff29e62bab',0,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040'),('b2ec222c-1e3e-11ef-91f3-00ff29e62bab',0,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040'),('c0ec5258-1e73-11ef-aa50-00ff29e62bab',0,'c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,222,'222',NULL,NULL,'2024-05-30 18:59:57.864','2024-05-30 18:59:57.864'),('c0ed8ad9-1e73-11ef-aa50-00ff29e62bab',0,'c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'222',NULL,NULL,'2024-05-30 18:59:57.864','2024-05-30 18:59:57.864'),('c88830cb-20e6-11ef-a633-00ff29e62bab',0,'c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL,'2024-06-02 21:48:25.072','2024-06-02 21:48:25.072'),('c88857dc-20e6-11ef-a633-00ff29e62bab',0,'c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'descption','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-02 21:48:25.072','2024-06-02 21:48:25.072'),('c88857dd-20e6-11ef-a633-00ff29e62bab',0,'c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'user','null',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2024-06-02 21:48:25.073','2024-06-02 21:48:25.073'),('c8887eee-20e6-11ef-a633-00ff29e62bab',0,'c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'456',NULL,NULL,'2024-06-02 21:48:25.073','2024-06-02 21:48:25.073'),('c91cf3f3-1e41-11ef-877e-00ff29e62bab',0,'c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 13:02:16.761','2024-05-30 13:02:16.761'),('c91d1b04-1e41-11ef-877e-00ff29e62bab',0,'c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 13:02:16.761','2024-05-30 13:02:16.761'),('cc84d193-1e83-11ef-a97f-00ff29e62bab',0,'cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,'studentUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'å°æ˜',NULL,NULL,'2024-05-30 20:54:49.258','2024-05-30 20:54:49.258'),('cc84d194-1e83-11ef-a97f-00ff29e62bab',0,'cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,'day','integer',NULL,NULL,NULL,NULL,NULL,5,'5',NULL,NULL,'2024-05-30 20:54:49.258','2024-05-30 20:54:49.258'),('ddc3e5b2-1e73-11ef-aa50-00ff29e62bab',0,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,222,'222',NULL,NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245'),('ddc3e5b3-1e73-11ef-aa50-00ff29e62bab',0,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'222',NULL,NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245'),('e770f534-1e3e-11ef-91f3-00ff29e62bab',0,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL,'2024-05-30 12:41:39.152','2024-05-30 12:41:39.152'),('e7d15df2-1e8b-11ef-bdf1-00ff29e62bab',0,'4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL,'2024-05-30 21:52:51.033','2024-05-30 21:52:51.033'),('eb6ea394-1e2e-11ef-9942-00ff29e62bab',0,'eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 10:47:13.901','2024-05-30 10:47:13.901'),('eb6ecaa5-1e2e-11ef-9942-00ff29e62bab',0,'eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 10:47:13.901','2024-05-30 10:47:13.901'),('f919a6cc-1e41-11ef-877e-00ff29e62bab',0,'c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,'outcome','string',NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL,'2024-05-30 13:03:37.269','2024-05-30 13:03:37.269'),('fb3ded7b-1e3e-11ef-91f3-00ff29e62bab',0,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,'money','integer',NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372'),('fb3ded7c-1e3e-11ef-91f3-00ff29e62bab',0,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,'taskUser','string',NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372');
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
INSERT INTO `act_re_deployment` VALUES ('1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:57:45.245',NULL,NULL,'1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab',NULL),('21f94fef-1d79-11ef-965a-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-29 05:05:57.001',NULL,NULL,'21f94fef-1d79-11ef-965a-00ff29e62bab',NULL),('276aafe0-1ce0-11ef-90dc-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:50:53.133',NULL,NULL,'276aafe0-1ce0-11ef-90dc-00ff29e62bab',NULL),('28499e34-1ce0-11ef-90dc-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:50:54.594',NULL,NULL,'28499e34-1ce0-11ef-90dc-00ff29e62bab',NULL),('3250903a-1cdf-11ef-a741-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:44:01.920',NULL,NULL,'3250903a-1cdf-11ef-a741-00ff29e62bab',NULL),('3b19cb33-1ce1-11ef-bf3b-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:58:35.654',NULL,NULL,'3b19cb33-1ce1-11ef-bf3b-00ff29e62bab',NULL),('43be2116-1cfa-11ef-aff9-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 13:57:47.571',NULL,NULL,'43be2116-1cfa-11ef-aff9-00ff29e62bab',NULL),('64ac108d-1cde-11ef-95cf-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:38:16.909',NULL,NULL,'64ac108d-1cde-11ef-95cf-00ff29e62bab',NULL),('6eb91d51-1d71-11ef-8ae9-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-29 04:10:49.791',NULL,NULL,'6eb91d51-1d71-11ef-8ae9-00ff29e62bab',NULL),('7708d0c0-1d9a-11ef-b8cc-00ff29e62bab','SpringBootAutoDeployment',NULL,NULL,'','2024-05-29 09:04:33.099',NULL,NULL,'7708d0c0-1d9a-11ef-b8cc-00ff29e62bab',NULL),('94f81149-1cdd-11ef-95cf-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:32:28.441',NULL,NULL,'94f81149-1cdd-11ef-95cf-00ff29e62bab',NULL),('a51f04ba-1ce0-11ef-962e-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:54:24.030',NULL,NULL,'a51f04ba-1ce0-11ef-962e-00ff29e62bab',NULL),('c4eeb38e-1e41-11ef-877e-00ff29e62bab','SpringBootAutoDeployment',NULL,NULL,'','2024-05-30 05:02:09.743',NULL,NULL,'c4eeb38e-1e41-11ef-877e-00ff29e62bab',NULL),('ce700574-1cde-11ef-96e8-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:41:14.354',NULL,NULL,'ce700574-1cde-11ef-96e8-00ff29e62bab',NULL),('e61a32af-1e2e-11ef-9942-00ff29e62bab','SpringBootAutoDeployment',NULL,NULL,'','2024-05-30 02:47:04.950',NULL,NULL,'e61a32af-1e2e-11ef-9942-00ff29e62bab',NULL),('ea0f18c8-1cde-11ef-96e8-00ff29e62bab','ç»©æ•ˆæµç¨‹',NULL,NULL,'','2024-05-28 10:42:00.695',NULL,NULL,'ea0f18c8-1cde-11ef-96e8-00ff29e62bab',NULL);
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
INSERT INTO `act_re_procdef` VALUES ('Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',1,'http://www.flowable.org/processdef','ExpenseProcess','Expense',1,'e61a32af-1e2e-11ef-9942-00ff29e62bab','D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.Expense.png','æŠ¥é”€æµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',1,'http://www.flowable.org/processdef','ExpenseProcess','Expense',2,'c4eeb38e-1e41-11ef-877e-00ff29e62bab','D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.bpmn20.xml','D:\\ProgramWorks\\JavaProjects\\expence\\target\\classes\\processes\\ExpenseProcess.Expense.png','æŠ¥é”€æµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',1,'http://www.flowable.org/processdef','å…¬å¸å‘˜å·¥è¯·å‡æµç¨‹','leave',1,'7708d0c0-1d9a-11ef-b8cc-00ff29e62bab','D:\\ProgramWorks\\JavaProjects\\qj\\target\\classes\\processes\\å…¬å¸å‘˜å·¥è°ƒä¼‘æµç¨‹.bpmn20.xml','D:\\ProgramWorks\\JavaProjects\\qj\\target\\classes\\processes\\å…¬å¸å‘˜å·¥è°ƒä¼‘æµç¨‹.leave.png','å…¬å¸å‘˜å·¥è¯·å‡æµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:10:3b236826-1ce1-11ef-bf3b-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',10,'3b19cb33-1ce1-11ef-bf3b-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',11,'43be2116-1cfa-11ef-aff9-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',12,'6eb91d51-1d71-11ef-8ae9-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',13,'21f94fef-1d79-11ef-965a-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:1:951ed32c-1cdd-11ef-95cf-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',1,'94f81149-1cdd-11ef-95cf-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:2:64b3d8c0-1cde-11ef-95cf-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',2,'64ac108d-1cde-11ef-95cf-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:3:ceae46f7-1cde-11ef-96e8-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',3,'ce700574-1cde-11ef-96e8-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:4:ea1e0ceb-1cde-11ef-96e8-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',4,'ea0f18c8-1cde-11ef-96e8-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:5:326d8e1d-1cdf-11ef-a741-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',5,'3250903a-1cdf-11ef-a741-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:6:27867543-1ce0-11ef-90dc-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',6,'276aafe0-1ce0-11ef-90dc-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:7:285229b7-1ce0-11ef-90dc-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',7,'28499e34-1ce0-11ef-90dc-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:8:a53c029d-1ce0-11ef-962e-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',8,'a51f04ba-1ce0-11ef-962e-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0),('performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab',1,'http://www.flowable.org/processdef','performance','performance-001',9,'1d0dfd9f-1ce1-11ef-bf3b-00ff29e62bab','process/performance.bpmn20.xml','process/performance.performance-001.png','ç»©æ•ˆæµç¨‹',0,1,1,'',NULL,NULL,NULL,0);
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
INSERT INTO `act_ru_actinst` VALUES ('0c7d9f11-1e2f-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363',0,1,NULL,''),('0c7d9f12-1e2f-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 10:48:09.363','2024-05-30 10:48:09.363',0,2,NULL,''),('0c7d9f13-1e2f-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','fillTask','0c7d9f14-1e2f-11ef-9942-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 10:48:09.363','2024-05-30 12:41:39.155',6809792,3,NULL,''),('0f4dd13c-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:15:19.201','2024-05-29 12:15:19.203',2,1,NULL,''),('0f4e1f5d-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:15:19.203','2024-05-29 12:15:19.203',0,2,NULL,''),('0f4e466e-1d72-11ef-8102-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','0f4dd13b-1d72-11ef-8102-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','0f4f57df-1d72-11ef-8102-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:15:19.204',NULL,NULL,3,NULL,''),('17ca541c-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:02:23.595','2024-05-30 19:02:23.595',0,1,NULL,''),('17ca7b2d-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 19:02:23.596','2024-05-30 19:02:23.606',10,2,NULL,''),('17cc01ce-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 19:02:23.606','2024-05-30 19:02:23.606',0,3,NULL,''),('17cc28df-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','directorTak','17cc28e0-1e74-11ef-aa50-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-05-30 19:02:23.607',NULL,NULL,4,NULL,''),('1c088cf5-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',0,1,NULL,''),('1c088cf6-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',0,2,NULL,''),('1c088cf7-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','judgeMore',NULL,NULL,'å¤§äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 12:43:07.387','2024-05-30 12:43:07.387',0,3,NULL,''),('1c08b408-1e3f-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','bossTask','1c08b409-1e3f-11ef-91f3-00ff29e62bab',NULL,'è€æ¿å®¡æ‰¹','userTask',NULL,'2024-05-30 12:43:07.388',NULL,NULL,4,NULL,''),('1e89b276-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079',0,1,NULL,''),('1e89b277-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:04:40.079','2024-05-30 13:04:40.079',0,2,NULL,''),('1e89b278-1e42-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','fillTask','1e89b279-1e42-11ef-877e-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','111','2024-05-30 13:04:40.079','2024-05-30 13:06:38.936',118857,3,NULL,''),('33e664a5-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 13:06:27.076','2024-05-29 13:06:27.078',2,1,NULL,''),('33e6d9d6-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 13:06:27.079','2024-05-29 13:06:27.079',0,2,NULL,''),('33e6d9d7-1d79-11ef-965a-00ff29e62bab',1,'performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','33e664a4-1d79-11ef-965a-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','33e88788-1d79-11ef-965a-00ff29e62bab',NULL,'è‡ªè¯„','userTask',NULL,'2024-05-29 13:06:27.079',NULL,NULL,3,NULL,''),('37435a13-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:23:35.738','2024-05-29 12:23:35.740',2,1,NULL,''),('3743cf44-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:23:35.741','2024-05-29 12:23:35.741',0,2,NULL,''),('3743cf45-1d73-11ef-bde3-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','37435a12-1d73-11ef-bde3-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','374507c6-1d73-11ef-bde3-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:23:35.741',NULL,NULL,3,NULL,''),('42480137-1e8a-11ef-8eab-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 21:41:03.811','2024-05-30 21:41:03.811',0,1,NULL,''),('42480138-1e8a-11ef-8eab-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:41:03.811','2024-05-30 21:41:03.811',0,2,NULL,''),('42480139-1e8a-11ef-8eab-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','fillTask','4248013a-1e8a-11ef-8eab-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','243','2024-05-30 21:41:03.811','2024-05-30 21:52:51.037',707226,3,NULL,''),('4d27d3e5-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127',0,1,NULL,''),('4d27d3e6-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:03:53.127','2024-05-30 19:03:53.127',0,2,NULL,''),('4d27d3e7-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27d3e4-1e74-11ef-aa50-00ff29e62bab','fillTask','4d27d3e8-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','33','2024-05-30 19:03:53.127',NULL,NULL,3,NULL,''),('5d0ba34c-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-28 21:58:30.022','2024-05-28 21:58:30.025',3,1,NULL,''),('5d0c187d-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-28 21:58:30.025','2024-05-28 21:58:30.025',0,2,NULL,''),('5d0c187e-1cfa-11ef-aff9-00ff29e62bab',1,'performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','5d0efeaf-1cfa-11ef-aff9-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-28 21:58:30.025',NULL,NULL,3,NULL,''),('5ee09c7f-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-06-02 21:45:27.812','2024-06-02 21:45:27.818',6,1,NULL,''),('5ee1adf0-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:45:27.819','2024-06-02 21:45:27.819',0,2,NULL,''),('5ee1adf1-20e6-11ef-8056-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','fillTask','5ee35ba2-20e6-11ef-8056-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','456','2024-06-02 21:45:27.819','2024-06-02 21:47:20.966',113147,3,NULL,''),('62e2c976-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 21:27:39.519','2024-05-30 21:27:39.521',2,1,NULL,''),('62e31797-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:27:39.521','2024-05-30 21:27:39.521',0,2,NULL,''),('62e31798-1e88-11ef-bccc-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2c975-1e88-11ef-bccc-00ff29e62bab','fillTask','62e4ec59-1e88-11ef-bccc-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','434','2024-05-30 21:27:39.521',NULL,NULL,3,NULL,''),('6512b002-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:32:02.091','2024-05-29 12:32:02.092',1,1,NULL,''),('6512fe23-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:32:02.093','2024-05-29 12:32:02.093',0,2,NULL,''),('6512fe24-1d74-11ef-b1f5-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','6512b001-1d74-11ef-b1f5-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','651436a5-1d74-11ef-b1f5-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:32:02.093',NULL,NULL,3,NULL,''),('6561d60d-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:06:38.936','2024-05-30 13:06:38.936',0,1,NULL,''),('6561d60e-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 13:06:38.936','2024-05-30 13:06:38.937',1,2,NULL,''),('6561fd1f-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 13:06:38.937','2024-05-30 13:06:38.937',0,3,NULL,''),('6561fd20-1e42-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b275-1e42-11ef-877e-00ff29e62bab','directorTak','6561fd21-1e42-11ef-877e-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-05-30 13:06:38.937',NULL,NULL,4,NULL,''),('6d7023fc-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:04:47.288','2024-05-30 19:04:47.288',0,1,NULL,''),('6d7023fd-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 19:04:47.288','2024-05-30 19:04:47.291',3,2,NULL,''),('6d70992e-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 19:04:47.291','2024-05-30 19:04:47.291',0,3,NULL,''),('6d70c03f-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','directorTak','6d70c040-1e74-11ef-aa50-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-05-30 19:04:47.292',NULL,NULL,4,NULL,''),('72319b52-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:32:24.104','2024-05-29 12:32:24.106',2,1,NULL,''),('7231e973-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:32:24.106','2024-05-29 12:32:24.106',0,2,NULL,''),('72321084-1d74-11ef-8067-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','72319b51-1d74-11ef-8067-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','72339725-1d74-11ef-8067-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:32:24.107',NULL,NULL,3,NULL,''),('7798dbc8-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹ ','startEvent',NULL,'2024-05-29 17:04:34.045','2024-05-29 17:04:34.047',2,1,NULL,''),('779929e9-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05',NULL,NULL,'æµç¨‹å¼€å§‹ ','sequenceFlow',NULL,'2024-05-29 17:04:34.047','2024-05-29 17:04:34.047',0,2,NULL,''),('779950fa-1d9a-11ef-b8cc-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','apply','779b25bb-1d9a-11ef-b8cc-00ff29e62bab',NULL,'è¯·å‡ç”³è¯· ','userTask','å°æ˜','2024-05-29 17:04:34.048','2024-05-29 17:04:34.118',70,3,NULL,''),('77a4266e-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','applyFlow',NULL,NULL,'ç”³è¯·æµç¨‹ ','sequenceFlow',NULL,'2024-05-29 17:04:34.119','2024-05-29 17:04:34.119',0,1,NULL,''),('77a44d7f-1d9a-11ef-b8cc-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','teacherPass','77a44d80-1d9a-11ef-b8cc-00ff29e62bab',NULL,'é¢†å¯¼å®¡æ‰¹ ','userTask',NULL,'2024-05-29 17:04:34.120',NULL,NULL,2,NULL,''),('8205f9ae-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 12:38:49.001','2024-05-30 12:38:49.002',1,1,NULL,''),('820620bf-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:38:49.002','2024-05-30 12:38:49.002',0,2,NULL,''),('820620c0-1e3e-11ef-91f3-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205f9ad-1e3e-11ef-91f3-00ff29e62bab','fillTask','8207f581-1e3e-11ef-91f3-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 12:38:49.002','2024-05-30 12:43:07.386',258384,3,NULL,''),('85c6c315-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:05:28.121','2024-05-30 19:05:28.122',1,1,NULL,''),('85c6ea26-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:28.122','2024-05-30 19:05:28.122',0,2,NULL,''),('85c6ea27-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c314-1e74-11ef-aa50-00ff29e62bab','fillTask','85c6ea28-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','383','2024-05-30 19:05:28.122',NULL,NULL,3,NULL,''),('87a1c4af-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234',0,1,NULL,''),('87a1c4b0-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:31.234','2024-05-30 19:05:31.234',0,2,NULL,''),('87a1c4b1-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ae-1e74-11ef-aa50-00ff29e62bab','fillTask','87a1c4b2-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','383','2024-05-30 19:05:31.234',NULL,NULL,3,NULL,''),('87f31909-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:05:31.767','2024-05-30 19:05:31.767',0,1,NULL,''),('87f3190a-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:31.767','2024-05-30 19:05:31.767',0,2,NULL,''),('87f3190b-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f31908-1e74-11ef-aa50-00ff29e62bab','fillTask','87f3190c-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','383','2024-05-30 19:05:31.767',NULL,NULL,3,NULL,''),('8842bfb3-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289',0,1,NULL,''),('8842bfb4-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:05:32.289','2024-05-30 19:05:32.289',0,2,NULL,''),('8842bfb5-1e74-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','8842bfb2-1e74-11ef-aa50-00ff29e62bab','fillTask','8842bfb6-1e74-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','383','2024-05-30 19:05:32.289',NULL,NULL,3,NULL,''),('a252b1b6-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:47:20.967','2024-06-02 21:47:20.967',0,1,NULL,''),('a252b1b7-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-06-02 21:47:20.967','2024-06-02 21:47:20.970',3,2,NULL,''),('a25326e8-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-06-02 21:47:20.970','2024-06-02 21:47:20.970',0,3,NULL,''),('a25326e9-20e6-11ef-8056-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee09c7e-20e6-11ef-8056-00ff29e62bab','directorTak','a25326ea-20e6-11ef-8056-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-06-02 21:47:20.970',NULL,NULL,4,NULL,''),('a27aff15-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:39:43.455','2024-05-30 12:39:43.455',0,1,NULL,''),('a27aff16-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:39:43.455','2024-05-30 12:39:43.457',2,2,NULL,''),('a27b4d37-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','judgeMore',NULL,NULL,'å¤§äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 12:39:43.457','2024-05-30 12:39:43.457',0,3,NULL,''),('a27b7448-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','bossTask','a27b7449-1e3e-11ef-91f3-00ff29e62bab',NULL,'è€æ¿å®¡æ‰¹','userTask',NULL,'2024-05-30 12:39:43.458',NULL,NULL,4,NULL,''),('b0f4d79c-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-28 19:01:53.383','2024-05-28 19:01:53.386',3,1,NULL,''),('b0f54ccd-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-28 19:01:53.386','2024-05-28 19:01:53.386',0,2,NULL,''),('b0f573de-1ce1-11ef-94ed-00ff29e62bab',1,'performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b0f6854f-1ce1-11ef-94ed-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-28 19:01:53.387',NULL,NULL,3,NULL,''),('b2ec222e-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040',0,1,NULL,''),('b2ec222f-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:40:11.040','2024-05-30 12:40:11.040',0,2,NULL,''),('b2ec2230-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222d-1e3e-11ef-91f3-00ff29e62bab','fillTask','b2ec2231-1e3e-11ef-91f3-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 12:40:11.040',NULL,NULL,3,NULL,''),('b8fcbb7c-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:27:13.379','2024-05-29 12:27:13.381',2,1,NULL,''),('b8fd30ad-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:27:13.382','2024-05-29 12:27:13.382',0,2,NULL,''),('b8fd30ae-1d73-11ef-880e-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','b8fcbb7b-1d73-11ef-880e-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','b8fe692f-1d73-11ef-880e-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:27:13.382',NULL,NULL,3,NULL,''),('c0ed8adb-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 18:59:57.864','2024-05-30 18:59:57.866',2,1,NULL,''),('c0edd8fc-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 18:59:57.866','2024-05-30 18:59:57.866',0,2,NULL,''),('c0edd8fd-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ed8ada-1e73-11ef-aa50-00ff29e62bab','fillTask','c0effbde-1e73-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','222','2024-05-30 18:59:57.866','2024-05-30 19:02:23.595',145729,3,NULL,''),('c8887ef0-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-06-02 21:48:25.073','2024-06-02 21:48:25.075',2,1,NULL,''),('c888cd11-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-06-02 21:48:25.075','2024-06-02 21:48:25.075',0,2,NULL,''),('c888f422-20e6-11ef-a633-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','c8887eef-20e6-11ef-a633-00ff29e62bab','fillTask','c88a2ca3-20e6-11ef-a633-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','456','2024-06-02 21:48:25.076',NULL,NULL,3,NULL,''),('c91d1b06-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 13:02:16.761','2024-05-30 13:02:16.762',1,1,NULL,''),('c91d6927-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:02:16.763','2024-05-30 13:02:16.763',0,2,NULL,''),('c91d6928-1e41-11ef-877e-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','fillTask','c91f16d9-1e41-11ef-877e-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 13:02:16.763','2024-05-30 13:03:37.272',80509,3,NULL,''),('cc84d196-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹ ','startEvent',NULL,'2024-05-30 20:54:49.259','2024-05-30 20:54:49.260',1,1,NULL,''),('cc8546c7-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','sid-8BA4821E-F022-45C8-B86B-CD7052B9FB05',NULL,NULL,'æµç¨‹å¼€å§‹ ','sequenceFlow',NULL,'2024-05-30 20:54:49.261','2024-05-30 20:54:49.261',0,2,NULL,''),('cc8546c8-1e83-11ef-a97f-00ff29e62bab',2,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','apply','cc86cd69-1e83-11ef-a97f-00ff29e62bab',NULL,'è¯·å‡ç”³è¯· ','userTask','å°æ˜','2024-05-30 20:54:49.261','2024-05-30 20:54:49.320',59,3,NULL,''),('cc8e477c-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','applyFlow',NULL,NULL,'ç”³è¯·æµç¨‹ ','sequenceFlow',NULL,'2024-05-30 20:54:49.320','2024-05-30 20:54:49.320',0,1,NULL,''),('cc8e6e8d-1e83-11ef-a97f-00ff29e62bab',1,'leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84d195-1e83-11ef-a97f-00ff29e62bab','teacherPass','cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',NULL,'é¢†å¯¼å®¡æ‰¹ ','userTask',NULL,'2024-05-30 20:54:49.321',NULL,NULL,2,NULL,''),('ddc3e5b5-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245',0,1,NULL,''),('ddc3e5b6-1e73-11ef-aa50-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 19:00:46.245','2024-05-30 19:00:46.245',0,2,NULL,''),('ddc3e5b7-1e73-11ef-aa50-00ff29e62bab',2,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','fillTask','ddc3e5b8-1e73-11ef-aa50-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','222','2024-05-30 19:00:46.245','2024-05-30 19:04:47.288',241043,3,NULL,''),('e7719175-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:41:39.156','2024-05-30 12:41:39.156',0,1,NULL,''),('e7719176-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 12:41:39.156','2024-05-30 12:41:39.157',1,2,NULL,''),('e771b887-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','judgeMore',NULL,NULL,'å¤§äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 12:41:39.157','2024-05-30 12:41:39.157',0,3,NULL,''),('e771b888-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d9f10-1e2f-11ef-9942-00ff29e62bab','bossTask','e771b889-1e3e-11ef-91f3-00ff29e62bab',NULL,'è€æ¿å®¡æ‰¹','userTask',NULL,'2024-05-30 12:41:39.157',NULL,NULL,4,NULL,''),('e7d26f63-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 21:52:51.039','2024-05-30 21:52:51.039',0,1,NULL,''),('e7d2bd84-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 21:52:51.041','2024-05-30 21:52:51.050',9,2,NULL,''),('e7d41d15-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','judgeLess',NULL,NULL,'å°äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 21:52:51.050','2024-05-30 21:52:51.050',0,3,NULL,''),('e7d44426-1e8b-11ef-bdf1-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da26-1e8a-11ef-8eab-00ff29e62bab','directorTak','e7d44427-1e8b-11ef-bdf1-00ff29e62bab',NULL,'adå®¡æ‰¹','userTask',NULL,'2024-05-30 21:52:51.051',NULL,NULL,4,NULL,''),('eb6ecaa7-1e2e-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 10:47:13.901','2024-05-30 10:47:13.903',2,1,NULL,''),('eb6f18c8-1e2e-11ef-9942-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 10:47:13.903','2024-05-30 10:47:13.903',0,2,NULL,''),('eb6f3fd9-1e2e-11ef-9942-00ff29e62bab',2,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','fillTask','eb70785a-1e2e-11ef-9942-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 10:47:13.904','2024-05-30 12:39:43.455',6749551,3,NULL,''),('f35f8cb7-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:14:32.341','2024-05-29 12:14:32.343',2,1,NULL,''),('f36001e8-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:32.344','2024-05-29 12:14:32.344',0,2,NULL,''),('f36001e9-1d71-11ef-8ae9-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','f361888a-1d71-11ef-8ae9-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:14:32.344',NULL,NULL,3,NULL,''),('f91a430d-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','flow2',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 13:03:37.273','2024-05-30 13:03:37.273',0,1,NULL,''),('f91a430e-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','judgeTask',NULL,NULL,NULL,'exclusiveGateway',NULL,'2024-05-30 13:03:37.273','2024-05-30 13:03:37.277',4,2,NULL,''),('f91adf4f-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','judgeMore',NULL,NULL,'å¤§äº500å…ƒ','sequenceFlow',NULL,'2024-05-30 13:03:37.277','2024-05-30 13:03:37.277',0,3,NULL,''),('f91b0660-1e41-11ef-877e-00ff29e62bab',1,'Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91d1b05-1e41-11ef-877e-00ff29e62bab','bossTask','f91b0661-1e41-11ef-877e-00ff29e62bab',NULL,'suå®¡æ‰¹','userTask',NULL,'2024-05-30 13:03:37.278',NULL,NULL,4,NULL,''),('fb3ded7e-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','start',NULL,NULL,'å¼€å§‹','startEvent',NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372',0,1,NULL,''),('fb3ded7f-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','flow1',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-30 12:42:12.372','2024-05-30 12:42:12.372',0,2,NULL,''),('fb3ded80-1e3e-11ef-91f3-00ff29e62bab',1,'Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','fillTask','fb3ded81-1e3e-11ef-91f3-00ff29e62bab',NULL,'å‡ºå·®æŠ¥é”€','userTask','123','2024-05-30 12:42:12.372',NULL,NULL,3,NULL,''),('fb651444-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:14:45.799','2024-05-29 12:14:45.801',2,1,NULL,''),('fb658975-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:45.802','2024-05-29 12:14:45.802',0,2,NULL,''),('fb658976-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','fb651443-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fb66c1f7-1d71-11ef-8e79-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:14:45.802',NULL,NULL,3,NULL,''),('fc7b3f3c-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','startEvent1',NULL,NULL,'å¼€å§‹èŠ‚ç‚¹','startEvent',NULL,'2024-05-29 12:14:47.622','2024-05-29 12:14:47.622',0,1,NULL,''),('fc7b3f3d-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','sid-1C1283A9-4B06-4F6F-A61A-305D8A1B7C03',NULL,NULL,NULL,'sequenceFlow',NULL,'2024-05-29 12:14:47.622','2024-05-29 12:14:47.622',0,2,NULL,''),('fc7b3f3e-1d71-11ef-8e79-00ff29e62bab',1,'performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','sid-31500697-6B82-4DF0-BC49-7DA591839A3D','fc7b3f3f-1d71-11ef-8e79-00ff29e62bab',NULL,'è‡ªè¯„','userTask','a','2024-05-29 12:14:47.622',NULL,NULL,3,NULL,'');
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
INSERT INTO `act_ru_identitylink` VALUES ('0c7dc626-1e2f-11ef-9942-00ff29e62bab',1,NULL,'participant','123',NULL,'0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('0f4f7ef1-1d72-11ef-8102-00ff29e62bab',1,NULL,'participant','a',NULL,'0f4dd13a-1d72-11ef-8102-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('1e89b27b-1e42-11ef-877e-00ff29e62bab',1,NULL,'participant','111',NULL,'1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('37452ed8-1d73-11ef-bde3-00ff29e62bab',1,NULL,'participant','a',NULL,'37435a11-1d73-11ef-bde3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('4248284c-1e8a-11ef-8eab-00ff29e62bab',1,NULL,'participant','243',NULL,'4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('4d27d3ea-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','33',NULL,'4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('5d0f4cd1-1cfa-11ef-aff9-00ff29e62bab',1,NULL,'participant','a',NULL,'5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('5ee3d0d4-20e6-11ef-8056-00ff29e62bab',1,NULL,'participant','456',NULL,'5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('62e5618b-1e88-11ef-bccc-00ff29e62bab',1,NULL,'participant','434',NULL,'62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('65145db7-1d74-11ef-b1f5-00ff29e62bab',1,NULL,'participant','a',NULL,'651288f0-1d74-11ef-b1f5-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('7233e547-1d74-11ef-8067-00ff29e62bab',1,NULL,'participant','a',NULL,'72317440-1d74-11ef-8067-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('779b73dd-1d9a-11ef-b8cc-00ff29e62bab',1,NULL,'participant','å°æ˜',NULL,'7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('77a44d81-1d9a-11ef-b8cc-00ff29e62bab',1,'a','candidate',NULL,'77a44d80-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL),('8208b8d3-1e3e-11ef-91f3-00ff29e62bab',1,NULL,'participant','123',NULL,'8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('85c6ea2a-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','383',NULL,'85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('87a1ebc4-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','383',NULL,'87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('87f3190e-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','383',NULL,'87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('8842e6c8-1e74-11ef-aa50-00ff29e62bab',1,NULL,'participant','383',NULL,'8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('b0f6ac61-1ce1-11ef-94ed-00ff29e62bab',1,NULL,'participant','a',NULL,'b0f4d79a-1ce1-11ef-94ed-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('b2ec4943-1e3e-11ef-91f3-00ff29e62bab',1,NULL,'participant','123',NULL,'b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('b8fe9041-1d73-11ef-880e-00ff29e62bab',1,NULL,'participant','a',NULL,'b8fcbb7a-1d73-11ef-880e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('c0effbe0-1e73-11ef-aa50-00ff29e62bab',1,NULL,'participant','222',NULL,'c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('c88ac8e5-20e6-11ef-a633-00ff29e62bab',1,NULL,'participant','456',NULL,'c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('c91f3deb-1e41-11ef-877e-00ff29e62bab',1,NULL,'participant','123',NULL,'c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('cc871b8b-1e83-11ef-a97f-00ff29e62bab',1,NULL,'participant','å°æ˜',NULL,'cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('cc8e6e8f-1e83-11ef-a97f-00ff29e62bab',1,'a','candidate',NULL,'cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL),('ddc3e5ba-1e73-11ef-aa50-00ff29e62bab',1,NULL,'participant','222',NULL,'ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('eb709f6c-1e2e-11ef-9942-00ff29e62bab',1,NULL,'participant','123',NULL,'eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('f361af9c-1d71-11ef-8ae9-00ff29e62bab',1,NULL,'participant','a',NULL,'f35f65a5-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('fb3ded83-1e3e-11ef-91f3-00ff29e62bab',1,NULL,'participant','123',NULL,'fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('fb66e909-1d71-11ef-8e79-00ff29e62bab',1,NULL,'participant','a',NULL,'fb651442-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL,NULL),('fc7b3f41-1d71-11ef-8e79-00ff29e62bab',1,NULL,'participant','a',NULL,'fc7b3f3a-1d71-11ef-8e79-00ff29e62bab',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `act_ru_task` VALUES ('0f4f57df-1d72-11ef-8102-00ff29e62bab',1,'0f4dd13b-1d72-11ef-8102-00ff29e62bab','0f4dd13a-1d72-11ef-8102-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:15:19.204',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('17cc28e0-1e74-11ef-aa50-00ff29e62bab',1,'c0ed8ada-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-05-30 11:02:23.607',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('1c08b409-1e3f-11ef-91f3-00ff29e62bab',1,'8205f9ad-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è€æ¿å®¡æ‰¹',NULL,NULL,'bossTask',NULL,'è€æ¿',NULL,50,'2024-05-30 04:43:07.388',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('33e88788-1d79-11ef-965a-00ff29e62bab',1,'33e664a4-1d79-11ef-965a-00ff29e62bab','33e63d93-1d79-11ef-965a-00ff29e62bab','performance-001:13:221a1e62-1d79-11ef-965a-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,NULL,NULL,50,'2024-05-29 05:06:27.079',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('374507c6-1d73-11ef-bde3-00ff29e62bab',1,'37435a12-1d73-11ef-bde3-00ff29e62bab','37435a11-1d73-11ef-bde3-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:23:35.741',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('4d27d3e8-1e74-11ef-aa50-00ff29e62bab',1,'4d27d3e4-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,'fillTask',NULL,'33',NULL,50,'2024-05-30 11:03:53.127',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('5d0efeaf-1cfa-11ef-aff9-00ff29e62bab',1,'5d0b7c3b-1cfa-11ef-aff9-00ff29e62bab','5d0b7c3a-1cfa-11ef-aff9-00ff29e62bab','performance-001:11:44069bc9-1cfa-11ef-aff9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-28 13:58:30.025',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('62e4ec59-1e88-11ef-bccc-00ff29e62bab',1,'62e2c975-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,'fillTask',NULL,'434',NULL,50,'2024-05-30 13:27:39.521',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('651436a5-1d74-11ef-b1f5-00ff29e62bab',1,'6512b001-1d74-11ef-b1f5-00ff29e62bab','651288f0-1d74-11ef-b1f5-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:32:02.093',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('6561fd21-1e42-11ef-877e-00ff29e62bab',1,'1e89b275-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-05-30 05:06:38.937',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('6d70c040-1e74-11ef-aa50-00ff29e62bab',1,'ddc3e5b4-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-05-30 11:04:47.292',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('72339725-1d74-11ef-8067-00ff29e62bab',1,'72319b51-1d74-11ef-8067-00ff29e62bab','72317440-1d74-11ef-8067-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:32:24.107',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('77a44d80-1d9a-11ef-b8cc-00ff29e62bab',1,'7798dbc7-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'é¢†å¯¼å®¡æ‰¹',NULL,NULL,'teacherPass',NULL,NULL,NULL,50,'2024-05-29 09:04:34.120',NULL,NULL,1,'',NULL,NULL,1,0,1,0),('85c6ea28-1e74-11ef-aa50-00ff29e62bab',1,'85c6c314-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,'fillTask',NULL,'383',NULL,50,'2024-05-30 11:05:28.122',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('87a1c4b2-1e74-11ef-aa50-00ff29e62bab',1,'87a1c4ae-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,'fillTask',NULL,'383',NULL,50,'2024-05-30 11:05:31.234',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('87f3190c-1e74-11ef-aa50-00ff29e62bab',1,'87f31908-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,'fillTask',NULL,'383',NULL,50,'2024-05-30 11:05:31.767',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('8842bfb6-1e74-11ef-aa50-00ff29e62bab',1,'8842bfb2-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,'fillTask',NULL,'383',NULL,50,'2024-05-30 11:05:32.289',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('a25326ea-20e6-11ef-8056-00ff29e62bab',1,'5ee09c7e-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-06-02 13:47:20.970',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('a27b7449-1e3e-11ef-91f3-00ff29e62bab',1,'eb6ecaa6-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è€æ¿å®¡æ‰¹',NULL,NULL,'bossTask',NULL,'è€æ¿',NULL,50,'2024-05-30 04:39:43.458',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('b0f6854f-1ce1-11ef-94ed-00ff29e62bab',1,'b0f4d79b-1ce1-11ef-94ed-00ff29e62bab','b0f4d79a-1ce1-11ef-94ed-00ff29e62bab','performance-001:9:1d26dcd2-1ce1-11ef-bf3b-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-28 11:01:53.387',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('b2ec2231-1e3e-11ef-91f3-00ff29e62bab',1,'b2ec222d-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,'fillTask',NULL,'123',NULL,50,'2024-05-30 04:40:11.040',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('b8fe692f-1d73-11ef-880e-00ff29e62bab',1,'b8fcbb7b-1d73-11ef-880e-00ff29e62bab','b8fcbb7a-1d73-11ef-880e-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:27:13.382',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('c88a2ca3-20e6-11ef-a633-00ff29e62bab',1,'c8887eef-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,'fillTask',NULL,'456',NULL,50,'2024-06-02 13:48:25.076',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('cc8e6e8e-1e83-11ef-a97f-00ff29e62bab',1,'cc84d195-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab','leave:1:773f2303-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'é¢†å¯¼å®¡æ‰¹',NULL,NULL,'teacherPass',NULL,NULL,NULL,50,'2024-05-30 12:54:49.321',NULL,NULL,1,'',NULL,NULL,1,0,1,0),('e771b889-1e3e-11ef-91f3-00ff29e62bab',1,'0c7d9f10-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è€æ¿å®¡æ‰¹',NULL,NULL,'bossTask',NULL,'è€æ¿',NULL,50,'2024-05-30 04:41:39.157',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('e7d44427-1e8b-11ef-bdf1-00ff29e62bab',1,'4247da26-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'adå®¡æ‰¹',NULL,NULL,'directorTak',NULL,'ad',NULL,50,'2024-05-30 13:52:51.051',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('f361888a-1d71-11ef-8ae9-00ff29e62bab',1,'f35f8cb6-1d71-11ef-8ae9-00ff29e62bab','f35f65a5-1d71-11ef-8ae9-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:14:32.344',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('f91b0661-1e41-11ef-877e-00ff29e62bab',1,'c91d1b05-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab','Expense:2:c5196d11-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'suå®¡æ‰¹',NULL,NULL,'bossTask',NULL,'su',NULL,50,'2024-05-30 05:03:37.278',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('fb3ded81-1e3e-11ef-91f3-00ff29e62bab',1,'fb3ded7d-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','Expense:1:e659acb2-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'å‡ºå·®æŠ¥é”€',NULL,NULL,'fillTask',NULL,'123',NULL,50,'2024-05-30 04:42:12.372',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('fb66c1f7-1d71-11ef-8e79-00ff29e62bab',1,'fb651443-1d71-11ef-8e79-00ff29e62bab','fb651442-1d71-11ef-8e79-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:14:45.802',NULL,NULL,1,'',NULL,NULL,1,0,0,0),('fc7b3f3f-1d71-11ef-8e79-00ff29e62bab',1,'fc7b3f3b-1d71-11ef-8e79-00ff29e62bab','fc7b3f3a-1d71-11ef-8e79-00ff29e62bab','performance-001:12:6ee117b4-1d71-11ef-8ae9-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,'è‡ªè¯„',NULL,NULL,'sid-31500697-6B82-4DF0-BC49-7DA591839A3D',NULL,'a',NULL,50,'2024-05-29 04:14:47.622',NULL,NULL,1,'',NULL,NULL,1,0,0,0);
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
INSERT INTO `act_ru_variable` VALUES ('0c7d9f0e-1e2f-11ef-9942-00ff29e62bab',1,'integer','money','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('0c7d9f0f-1e2f-11ef-9942-00ff29e62bab',1,'string','taskUser','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('17c9b7db-1e74-11ef-aa50-00ff29e62bab',1,'string','outcome','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'é©³å›',NULL,NULL),('1c07f0b4-1e3f-11ef-91f3-00ff29e62bab',1,'string','outcome','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL),('1e89b273-1e42-11ef-877e-00ff29e62bab',1,'integer','money','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,10,'10',NULL,NULL),('1e89b274-1e42-11ef-877e-00ff29e62bab',1,'string','taskUser','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'111',NULL,NULL),('4247da22-1e8a-11ef-8eab-00ff29e62bab',1,'integer','money','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL),('4247da23-1e8a-11ef-8eab-00ff29e62bab',1,'null','descption','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4247da24-1e8a-11ef-8eab-00ff29e62bab',1,'null','user','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('4247da25-1e8a-11ef-8eab-00ff29e62bab',1,'string','taskUser','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'243',NULL,NULL),('4d27d3e2-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('4d27d3e3-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','4d27acd1-1e74-11ef-aa50-00ff29e62bab','4d27acd1-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'33',NULL,NULL),('5ee04e5a-20e6-11ef-8056-00ff29e62bab',1,'integer','money','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL),('5ee0756b-20e6-11ef-8056-00ff29e62bab',1,'null','descption','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5ee0756c-20e6-11ef-8056-00ff29e62bab',1,'null','user','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('5ee0756d-20e6-11ef-8056-00ff29e62bab',1,'string','taskUser','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'456',NULL,NULL),('62e2a261-1e88-11ef-bccc-00ff29e62bab',1,'integer','money','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL),('62e2c972-1e88-11ef-bccc-00ff29e62bab',1,'null','descption','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('62e2c973-1e88-11ef-bccc-00ff29e62bab',1,'null','user','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('62e2c974-1e88-11ef-bccc-00ff29e62bab',1,'string','taskUser','62e2a260-1e88-11ef-bccc-00ff29e62bab','62e2a260-1e88-11ef-bccc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'434',NULL,NULL),('6561aefc-1e42-11ef-877e-00ff29e62bab',1,'string','outcome','1e89b272-1e42-11ef-877e-00ff29e62bab','1e89b272-1e42-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL),('6d6fd5db-1e74-11ef-aa50-00ff29e62bab',1,'string','outcome','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'é©³å›',NULL,NULL),('7798b4b5-1d9a-11ef-b8cc-00ff29e62bab',1,'string','studentUser','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'å°æ˜',NULL,NULL),('7798dbc6-1d9a-11ef-b8cc-00ff29e62bab',1,'integer','day','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab','7798b4b4-1d9a-11ef-b8cc-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,5,'5',NULL,NULL),('8205d29b-1e3e-11ef-91f3-00ff29e62bab',1,'integer','money','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('8205d29c-1e3e-11ef-91f3-00ff29e62bab',1,'string','taskUser','8205d29a-1e3e-11ef-91f3-00ff29e62bab','8205d29a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('85c6c312-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('85c6c313-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','85c6c311-1e74-11ef-aa50-00ff29e62bab','85c6c311-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL),('87a1c4ac-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('87a1c4ad-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','87a1c4ab-1e74-11ef-aa50-00ff29e62bab','87a1c4ab-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL),('87f2f1f6-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('87f2f1f7-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','87f2f1f5-1e74-11ef-aa50-00ff29e62bab','87f2f1f5-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL),('8842bfb0-1e74-11ef-aa50-00ff29e62bab',1,'integer','money','8842989f-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,111,'111',NULL,NULL),('8842bfb1-1e74-11ef-aa50-00ff29e62bab',1,'string','taskUser','8842989f-1e74-11ef-aa50-00ff29e62bab','8842989f-1e74-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'383',NULL,NULL),('a2521575-20e6-11ef-8056-00ff29e62bab',1,'string','outcome','5ee02749-20e6-11ef-8056-00ff29e62bab','5ee02749-20e6-11ef-8056-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL),('a27a89e4-1e3e-11ef-91f3-00ff29e62bab',1,'string','outcome','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL),('b2ec222b-1e3e-11ef-91f3-00ff29e62bab',1,'integer','money','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('b2ec222c-1e3e-11ef-91f3-00ff29e62bab',1,'string','taskUser','b2ec222a-1e3e-11ef-91f3-00ff29e62bab','b2ec222a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('c0ec5258-1e73-11ef-aa50-00ff29e62bab',1,'integer','money','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,222,'222',NULL,NULL),('c0ed8ad9-1e73-11ef-aa50-00ff29e62bab',1,'string','taskUser','c0ec5257-1e73-11ef-aa50-00ff29e62bab','c0ec5257-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'222',NULL,NULL),('c88830cb-20e6-11ef-a633-00ff29e62bab',1,'integer','money','c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,333,'333',NULL,NULL),('c88857dc-20e6-11ef-a633-00ff29e62bab',1,'null','descption','c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c88857dd-20e6-11ef-a633-00ff29e62bab',1,'null','user','c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('c8887eee-20e6-11ef-a633-00ff29e62bab',1,'string','taskUser','c88830ca-20e6-11ef-a633-00ff29e62bab','c88830ca-20e6-11ef-a633-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'456',NULL,NULL),('c91cf3f3-1e41-11ef-877e-00ff29e62bab',1,'integer','money','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('c91d1b04-1e41-11ef-877e-00ff29e62bab',1,'string','taskUser','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('cc84d193-1e83-11ef-a97f-00ff29e62bab',1,'string','studentUser','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'å°æ˜',NULL,NULL),('cc84d194-1e83-11ef-a97f-00ff29e62bab',1,'integer','day','cc84aa82-1e83-11ef-a97f-00ff29e62bab','cc84aa82-1e83-11ef-a97f-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,5,'5',NULL,NULL),('ddc3e5b2-1e73-11ef-aa50-00ff29e62bab',1,'integer','money','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,222,'222',NULL,NULL),('ddc3e5b3-1e73-11ef-aa50-00ff29e62bab',1,'string','taskUser','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab','ddc3e5b1-1e73-11ef-aa50-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'222',NULL,NULL),('e770f534-1e3e-11ef-91f3-00ff29e62bab',1,'string','outcome','0c7d50ed-1e2f-11ef-9942-00ff29e62bab','0c7d50ed-1e2f-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL),('e7d15df2-1e8b-11ef-bdf1-00ff29e62bab',1,'string','outcome','4247da21-1e8a-11ef-8eab-00ff29e62bab','4247da21-1e8a-11ef-8eab-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL),('eb6ea394-1e2e-11ef-9942-00ff29e62bab',1,'integer','money','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('eb6ecaa5-1e2e-11ef-9942-00ff29e62bab',1,'string','taskUser','eb6ea393-1e2e-11ef-9942-00ff29e62bab','eb6ea393-1e2e-11ef-9942-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL),('f919a6cc-1e41-11ef-877e-00ff29e62bab',1,'string','outcome','c91ccce2-1e41-11ef-877e-00ff29e62bab','c91ccce2-1e41-11ef-877e-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'é€šè¿‡',NULL,NULL),('fb3ded7b-1e3e-11ef-91f3-00ff29e62bab',1,'integer','money','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,2000,'2000',NULL,NULL),('fb3ded7c-1e3e-11ef-91f3-00ff29e62bab',1,'string','taskUser','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab','fb3dc66a-1e3e-11ef-91f3-00ff29e62bab',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'123',NULL,NULL);
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
INSERT INTO `announcement` VALUES (1,'ç«¯åˆèŠ‚è°ƒä¼‘å®‰æ’','ä¸‹å‘¨è¿ä¸Š','ç ”å‘éƒ¨é—¨');
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
INSERT INTO `apply` VALUES (1,'èµ¶ç«è½¦ï¼Œè¯·ä¸€ä¸‹åˆçš„å‡ï¼Œæœ›æ‰¹','wwwwww',3,'å†ç¼–ä¸ªå¥½ç‚¹çš„ç†ç”±'),(2,'æˆ‘ç”³è¯·åŠ å…¥ç ”å‘éƒ¨','wwwwww',1,NULL),(3,'æˆ‘æƒ³åŠ å…¥é”€å”®éƒ¨é—¨','ssssss',1,NULL),(4,'æˆ‘æƒ³åŠ å…¥é”€å”®éƒ¨é—¨','xxxxxx',1,NULL),(5,'æˆ‘æƒ³ä»é”€å”®éƒ¨é—¨è½¬å…¥ç ”å‘éƒ¨é—¨','ssssss',2,NULL),(6,'æˆ‘æƒ³ä»ç ”å‘éƒ¨é—¨è½¬å…¥é”€å”®éƒ¨é—¨','ssssss',1,NULL),(7,'èµ¶ç«è½¦ï¼Œè¯·ä¸€ä¸‹åˆçš„å‡ï¼Œæœ›æ‰¹','wwwwww',1,NULL);
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
INSERT INTO `department` VALUES (1,'ç ”å‘éƒ¨é—¨','aaaaaa'),(3,'é”€å”®éƒ¨é—¨','zzzzzz'),(4,'é”€å”®éƒ¨é—¨','xxxxxx'),(5,'ç ”å‘éƒ¨é—¨','wwwwww');
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
INSERT INTO `group` VALUES (1,'é”€å”®ä¸€ç»„'),(2,'ç ”å‘ä¸€ç»„'),(6,'ç ”å‘äºŒç»„'),(7,'ç ”å‘äºŒç»„');
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
INSERT INTO `task` VALUES (1,'å®Œæˆç¬¬ä¸€ä¸ªå°ç›®æ ‡','å·²å®Œæˆä¸€åŠå•¦','ç ”å‘ä¸€ç»„'),(2,'å…ˆå®Œæˆç¬¬ä¸€ä¸ªå°ç›®æ ‡','0','ç ”å‘äºŒç»„'),(3,'å®Œæˆç¬¬ä¸€ä¸ªå°ç›®æ ‡','0','é”€å”®ä¸€ç»„'),(4,'å®Œæˆç¬¬äºŒä¸ªå°ç›®æ ‡','0','é”€å”®äºŒç»„'),(5,'å®Œæˆç¬¬äºŒä¸ªå°ç›®æ ‡','1','é”€å”®äºŒç»„'),(6,'å®Œæˆç¬¬ä¸€ä¸ªå°ç›®æ ‡','0','ç ”å‘ä¸€ç»„'),(7,'å®Œæˆç¬¬ä¸€ä¸ªå°ç›®æ ‡','0','ç ”å‘ä¸€ç»„');
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
INSERT INTO `user` VALUES (1,'qqqqqq','27e5d56d515cdd49af754d800fd8447d','su',NULL,NULL,'FxE0EDD9CSq4',NULL,'2024-05-23 18:25:53','2024-05-23 18:25:53',NULL),(4,'aaaaaa','6bc7ee934038ff6d452c07e86761ba1d','ad','2518016656@qq.com','https://bkimg.cdn.bcebo,m_lfit,limit_1,h_1080','ckVfitA3kXHM',NULL,'2024-06-02 18:18:27','2024-06-02 18:29:05',NULL),(5,'zzzzzz','01d2fc1c6c44f08c696baf42bc968608','ad',NULL,NULL,'SKFyxSqwCr1A',NULL,'2024-05-23 18:35:24','2024-05-23 18:35:24','ç ”å‘ä¸€ç»„'),(6,'wwwwww','7169a6a4ad22c56e108d55cb7d16b2b3','user',NULL,NULL,'kmnNdPwFwv1q',NULL,'2024-05-23 18:35:30','2024-05-23 18:35:30','ç ”å‘ä¸€ç»„'),(7,'ssssss','df2230551ab3ef36ae4fcaa20de150e4','user',NULL,NULL,'7YYtLbCqU1MV',NULL,'2024-05-23 18:35:36','2024-05-23 18:35:36','ç ”å‘ä¸€ç»„'),(8,'xxxxxx','dea9c42fb198bc65ed46d93a945a5c00','user',NULL,NULL,'F3u8wmdmDsiX',NULL,'2024-05-23 18:35:43','2024-05-23 18:35:43','ç ”å‘äºŒç»„'),(9,'gggggg','19071c485dc314358f442ed1482eef16','user',NULL,NULL,'kf1amf9B3hXj',NULL,'2024-06-02 16:43:48','2024-06-02 16:43:48',NULL),(10,'gggggz','96329f9cb8722e129f8bd393b0be23be','user',NULL,NULL,'BUmAvhhKUmCs',NULL,'2024-06-02 16:51:34','2024-06-02 16:51:34',NULL);
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
