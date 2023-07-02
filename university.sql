-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Temporary view structure for view `a_students`
--

DROP TABLE IF EXISTS `a_students`;
/*!50001 DROP VIEW IF EXISTS `a_students`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `a_students` AS SELECT 
 1 AS `ssn`,
 1 AS `student_name`,
 1 AS `entry_date`,
 1 AS `student_agverageGrades`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `idCourse` int NOT NULL AUTO_INCREMENT,
  `Department_idDepartment` int NOT NULL,
  `unit` int NOT NULL,
  `Course_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idCourse`),
  KEY `fk_Course_Department1_idx` (`Department_idDepartment`),
  CONSTRAINT `fk_Course_Department1` FOREIGN KEY (`Department_idDepartment`) REFERENCES `department` (`idDepartment`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,1,3,'Introduction to Computer Science'),(2,2,4,'Data Structures and Algorithms'),(3,2,3,'Introduction to Psychology'),(4,3,4,'Abnormal Psychology'),(5,5,3,'Introduction to Marketing'),(6,6,4,'Consumer Behaviour'),(7,7,3,'Introduction to Biology'),(8,8,4,'Cell Biology'),(9,5,3,'Introduction to Finance'),(10,5,4,'Investment and Portfolio Management'),(11,1,3,'Web Development'),(12,1,4,'Digital Marketing'),(13,7,3,'American Literature'),(14,2,4,'Abnormal Psychology'),(15,6,3,'Public Speaking'),(16,6,4,'Creative Writing'),(17,2,3,'Environmental Science'),(18,10,4,'Quantum Mechanics'),(19,9,3,'Macroeconomics'),(20,4,4,'Medical Ethics');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dates`
--

DROP TABLE IF EXISTS `dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dates` (
  `iddates` int NOT NULL AUTO_INCREMENT,
  `roomno` varchar(45) NOT NULL,
  `day_of_week` int NOT NULL,
  `time` time NOT NULL,
  `Section_idSection` int NOT NULL,
  PRIMARY KEY (`iddates`,`roomno`,`day_of_week`,`time`),
  KEY `fk_dates_Section1_idx` (`Section_idSection`),
  CONSTRAINT `fk_dates_Section1` FOREIGN KEY (`Section_idSection`) REFERENCES `section` (`idSection`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dates`
--

LOCK TABLES `dates` WRITE;
/*!40000 ALTER TABLE `dates` DISABLE KEYS */;
INSERT INTO `dates` VALUES (1,'1',1,'09:00:00',1),(2,'2',2,'10:30:00',2),(3,'3',3,'12:00:00',3),(4,'4',4,'13:30:00',4),(5,'5',5,'15:00:00',5),(6,'6',6,'16:30:00',6),(7,'7',7,'18:00:00',7),(8,'8',1,'09:00:00',8),(9,'9',2,'10:30:00',9),(10,'10',3,'12:00:00',10),(11,'11',4,'13:30:00',11),(12,'12',5,'15:00:00',12),(13,'13',6,'16:30:00',13),(14,'14',7,'18:00:00',14),(15,'15',1,'09:00:00',15),(16,'16',2,'10:30:00',16),(17,'17',3,'12:00:00',17),(18,'18',4,'13:30:00',18),(19,'19',5,'15:00:00',19),(20,'20',6,'16:30:00',20);
/*!40000 ALTER TABLE `dates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `idDepartment` int NOT NULL AUTO_INCREMENT,
  `Factuly_idFactuly` int NOT NULL,
  `Manager_idProfessor` int DEFAULT NULL,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idDepartment`),
  KEY `fk_Department_Factuly1_idx` (`Factuly_idFactuly`),
  KEY `fk_department_professor1_idx` (`Manager_idProfessor`),
  CONSTRAINT `fk_Department_Factuly1` FOREIGN KEY (`Factuly_idFactuly`) REFERENCES `factuly` (`idFactuly`),
  CONSTRAINT `fk_department_professor1` FOREIGN KEY (`Manager_idProfessor`) REFERENCES `professor` (`idProfessor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,1,NULL,'Electrical Engineering'),(2,1,NULL,'Mechanical Engineering'),(3,1,NULL,'Civil Engineering'),(4,2,NULL,'Mathematics'),(5,2,NULL,'Physics'),(6,2,NULL,'Chemistry'),(7,3,NULL,'English'),(8,3,NULL,'Persian'),(9,3,NULL,'History'),(10,4,NULL,'Surgery');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `idExam` int NOT NULL AUTO_INCREMENT,
  `Exam_date` date NOT NULL,
  `Exam_time` time NOT NULL,
  `section_idsection` int NOT NULL,
  PRIMARY KEY (`idExam`),
  KEY `fk_exam_section1_idx` (`section_idsection`),
  CONSTRAINT `fk_exam_section1` FOREIGN KEY (`section_idsection`) REFERENCES `section` (`idSection`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'2023-08-16','14:00:00',3),(2,'2023-08-18','11:00:00',1),(3,'2023-08-17','09:00:00',2),(4,'2023-08-19','13:00:00',7),(5,'2023-08-15','10:00:00',4),(6,'2023-08-17','09:00:00',5),(7,'2023-08-18','11:00:00',6),(8,'2023-08-20','16:00:00',8),(9,'2023-08-22','15:00:00',9),(10,'2023-08-19','13:00:00',10),(11,'2023-08-18','11:00:00',11),(12,'2023-08-17','09:00:00',12),(13,'2023-08-16','14:00:00',13),(14,'2023-08-15','10:00:00',14),(15,'2023-08-17','09:00:00',15),(16,'2023-08-18','11:00:00',16),(17,'2023-08-19','13:00:00',17),(18,'2023-08-20','16:00:00',18),(19,'2023-08-22','15:00:00',19);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factuly`
--

DROP TABLE IF EXISTS `factuly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factuly` (
  `idFactuly` int NOT NULL AUTO_INCREMENT,
  `city` varchar(45) DEFAULT NULL,
  `Factuly_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idFactuly`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factuly`
--

LOCK TABLES `factuly` WRITE;
/*!40000 ALTER TABLE `factuly` DISABLE KEYS */;
INSERT INTO `factuly` VALUES (1,'Mashhad','Engineering'),(2,'Mashhad','Science'),(3,'Mashhad','Humanities'),(4,'Mashhad','Medicine'),(5,'Mashhad','Law'),(6,'Tehran','Engineering'),(7,'Tehran','Science'),(8,'Tehran','Humanities'),(9,'Tehran','Medicine'),(10,'Tehran','Law');
/*!40000 ALTER TABLE `factuly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `food` (
  `idFood` int NOT NULL AUTO_INCREMENT,
  `Food_name` varchar(45) NOT NULL,
  `Food_price` int DEFAULT NULL,
  PRIMARY KEY (`idFood`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'Hamburger',10),(2,'Pizza',12),(3,'Salad',8),(4,'Chicken Wings',9),(5,'French Fries',5),(6,'Tacos',7),(7,'Sushi',15),(8,'Burrito',8),(9,'Pasta',11),(10,'Sandwich',6),(11,'ash reshte',20);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `food_reservation`
--

DROP TABLE IF EXISTS `food_reservation`;
/*!50001 DROP VIEW IF EXISTS `food_reservation`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `food_reservation` AS SELECT 
 1 AS `food_name`,
 1 AS `reservation_count`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `foodschedule`
--

DROP TABLE IF EXISTS `foodschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foodschedule` (
  `idFoodSchedule` int NOT NULL AUTO_INCREMENT,
  `Food_idFood` int NOT NULL,
  `FoodSchedule_date` date NOT NULL,
  `cont` int DEFAULT '0',
  PRIMARY KEY (`idFoodSchedule`),
  KEY `fk_FoodSchedule_Food1_idx` (`Food_idFood`),
  CONSTRAINT `fk_FoodSchedule_Food1` FOREIGN KEY (`Food_idFood`) REFERENCES `food` (`idFood`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodschedule`
--

LOCK TABLES `foodschedule` WRITE;
/*!40000 ALTER TABLE `foodschedule` DISABLE KEYS */;
INSERT INTO `foodschedule` VALUES (1,1,'2023-07-02',0),(2,2,'2023-07-03',0),(3,3,'2023-07-04',0),(4,4,'2023-07-05',0),(5,5,'2023-07-06',0),(6,6,'2023-07-07',0),(7,7,'2023-07-08',0),(8,1,'2023-07-09',0),(9,2,'2023-07-10',0),(10,4,'2023-07-11',0),(11,3,'2023-07-11',0);
/*!40000 ALTER TABLE `foodschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `low_units`
--

DROP TABLE IF EXISTS `low_units`;
/*!50001 DROP VIEW IF EXISTS `low_units`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `low_units` AS SELECT 
 1 AS `ssn`,
 1 AS `student_name`,
 1 AS `total_units`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `major`
--

DROP TABLE IF EXISTS `major`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `major` (
  `idMajor` int NOT NULL AUTO_INCREMENT,
  `Department_idDepartment` int NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idMajor`,`Department_idDepartment`),
  KEY `fk_Major_Department1_idx` (`Department_idDepartment`),
  CONSTRAINT `fk_Major_Department1` FOREIGN KEY (`Department_idDepartment`) REFERENCES `department` (`idDepartment`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
INSERT INTO `major` VALUES (1,1,'Computer Science'),(2,1,'Electrical Engineering'),(3,2,'Psychology'),(4,2,'Sociology'),(5,3,'Marketing'),(6,3,'Management'),(7,4,'Biology'),(8,4,'Biochemistry'),(9,5,'Finance'),(10,5,'Accounting');
/*!40000 ALTER TABLE `major` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `major_grades`
--

DROP TABLE IF EXISTS `major_grades`;
/*!50001 DROP VIEW IF EXISTS `major_grades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `major_grades` AS SELECT 
 1 AS `name`,
 1 AS `Term_idTerm`,
 1 AS `avg(shs.student_mark)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `meet`
--

DROP TABLE IF EXISTS `meet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meet` (
  `Student_ssn` int NOT NULL,
  `Section_idSection` int NOT NULL,
  PRIMARY KEY (`Student_ssn`,`Section_idSection`),
  KEY `fk_Student_has_Section1_Student1_idx` (`Student_ssn`),
  KEY `fk_Meet_Section1_idx` (`Section_idSection`),
  CONSTRAINT `fk_Meet_Section1` FOREIGN KEY (`Section_idSection`) REFERENCES `section` (`idSection`),
  CONSTRAINT `fk_Student_has_Section1_Student1` FOREIGN KEY (`Student_ssn`) REFERENCES `student` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meet`
--

LOCK TABLES `meet` WRITE;
/*!40000 ALTER TABLE `meet` DISABLE KEYS */;
/*!40000 ALTER TABLE `meet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificatoin`
--

DROP TABLE IF EXISTS `notificatoin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificatoin` (
  `idNotificatoin` int NOT NULL AUTO_INCREMENT,
  `Professor_idProfessor` int NOT NULL,
  `Section_idSection` int NOT NULL,
  `text` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idNotificatoin`),
  KEY `fk_Notificatoin_Professor1_idx` (`Professor_idProfessor`),
  KEY `fk_Notificatoin_Section1_idx` (`Section_idSection`),
  CONSTRAINT `fk_Notificatoin_Section1` FOREIGN KEY (`Section_idSection`) REFERENCES `section` (`idSection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificatoin`
--

LOCK TABLES `notificatoin` WRITE;
/*!40000 ALTER TABLE `notificatoin` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificatoin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `passed_courses`
--

DROP TABLE IF EXISTS `passed_courses`;
/*!50001 DROP VIEW IF EXISTS `passed_courses`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `passed_courses` AS SELECT 
 1 AS `ssn`,
 1 AS `student_name`,
 1 AS `course_name`,
 1 AS `student_mark`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `professor`
--

DROP TABLE IF EXISTS `professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professor` (
  `idProfessor` int NOT NULL AUTO_INCREMENT,
  `Department_idDepartment` int NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `office` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `phone_number` int DEFAULT NULL,
  `degree` varchar(45) NOT NULL,
  `entry_date` year NOT NULL,
  `avg_mark` int DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idProfessor`,`Department_idDepartment`),
  KEY `fk_Professor_Department1_idx` (`Department_idDepartment`),
  CONSTRAINT `fk_Professor_Department1` FOREIGN KEY (`Department_idDepartment`) REFERENCES `department` (`idDepartment`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` VALUES (1,1,'123 Main St',101,'john.smith@university.edu','John Smith',5551234,'PhD',2020,NULL,'password123'),(2,2,'456 Elm St',202,'jane.doe@university.edu','Jane Doe',5555678,'MS',2018,NULL,'password456'),(3,3,'789 Oak St',303,'bob.johnson@university.edu','Bob Johnson',5559012,'PhD',2021,NULL,'password789'),(4,4,'321 Cherry St',404,'sarah.lee@university.edu','Sarah Lee',5553456,'PhD',2019,NULL,'password101'),(5,5,'654 Pine St',505,'david.kim@university.edu','David Kim',5557890,'MS',2017,NULL,'password202'),(6,6,'987 Maple St',606,'mary.park@university.edu','Mary Park',5552345,'PhD',2022,NULL,'password303'),(7,7,'123 Oak St',707,'john.doe@university.edu','John Doe',5559876,'PhD',2020,NULL,'password404'),(8,8,'456 Elm St',808,'jane.smith@university.edu','Jane Smith',5554321,'MS',2018,NULL,'password505'),(9,9,'789 Pine St',909,'bob.lee@university.edu','Bob Lee',5556789,'PhD',2021,NULL,'password606'),(10,10,'321 Cherry St',1010,'sarah.kim@university.edu','Sarah Kim',5559012,'PhD',2019,NULL,'password707'),(11,5,'654 Pine St',505,'david.kim@university.edu','David Kim',5557890,'MS',2017,NULL,'password202'),(12,6,'987 Maple St',606,'alice.park@university.edu','Alice Park',5552345,'PhD',2022,NULL,'password303'),(13,7,'123 Oak St',707,'james.lee@university.edu','James Lee',5559876,'PhD',2020,NULL,'password404'),(14,8,'456 Elm St',808,'emily.chung@university.edu','Emily Chung',5554321,'MS',2018,NULL,'password505'),(15,9,'789 Pine St',909,'william.kim@university.edu','William Kim',5556789,'PhD',2021,NULL,'password606'),(16,1,'321 Cherry St',1010,'grace.lee@university.edu','Grace Lee',5559012,'PhD',2019,NULL,'password707'),(17,4,'654 Maple St',1111,'daniel.park@university.edu','Daniel Park',5553456,'PhD',2022,NULL,'password808'),(18,2,'987 Oak St',1212,'sophie.kim@university.edu','Sophie Kim',5557890,'MS',2017,NULL,'password909'),(19,3,'456 Oak St',202,'asmith@email.com','Amy Smith',5555678,'MS',2015,NULL,'password456'),(20,5,'789 Walnut St',303,'rjones@email.com','Robert Jones',5559012,'PhD',2005,NULL,'password789'),(21,3,'321 Maple St',404,'klee@email.com','Karen Lee',5553456,'MS',2020,NULL,'password101'),(22,6,'654 Birch St',505,'jwang@email.com','James Wang',5557890,'PhD',2012,NULL,'password202'),(23,4,'987 Pine St',606,'mchen@email.com','Michelle Chen',5552345,'MS',2018,NULL,'password303'),(24,7,'234 Cedar St',707,'rpatel@email.com','Raj Patel',5556789,'PhD',2008,NULL,'password404'),(25,9,'567 Elm St',808,'tlee@email.com','Tina Lee',5551234,'MS',2016,NULL,'password505'),(26,8,'876 Oak St',909,'rsmith@email.com','Ryan Smith',5555678,'PhD',2003,NULL,'password606'),(27,10,'123 Maple St',1010,'jlee@email.com','Jin Lee',5559012,'MS',2019,NULL,'password707'),(28,2,'456 Main St',102,'jchang@email.com','Jennifer Chang',5552345,'MS',2017,NULL,'password808'),(29,5,'789 Oak St',203,'jchen@email.com','Jason Chen',5556789,'PhD',2009,NULL,'password909'),(30,1,'321 Walnut St',304,'amiller@email.com','Anna Miller',5551234,'MS',2014,NULL,'password1010'),(31,3,'654 Maple St',405,'mlee@email.com','Michael Lee',5555678,'PhD',2011,NULL,'password111'),(32,6,'987 Birch St',506,'jzhang@email.com','Jenny Zhang',5559012,'MS',2018,NULL,'password222'),(33,4,'234 Pine St',607,'jzhou@email.com','Jessica Zhou',5553456,'PhD',2007,NULL,'password333'),(34,7,'567 Cedar St',708,'jwang@email.com','Jenny Wang',5557890,'MS',2015,NULL,'password444'),(35,9,'876 Elm St',809,'tnguyen@email.com','Tom Nguyen',5552345,'PhD',2004,NULL,'password555'),(36,8,'123 Oak St',910,'jlee@email.com','Jenny Lee',5556789,'MS',2021,NULL,'password666'),(37,10,'456 Maple St',1011,'mliu@email.com','Michelle Liu',5551234,'PhD',2006,NULL,'password777');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `professors_calendar`
--

DROP TABLE IF EXISTS `professors_calendar`;
/*!50001 DROP VIEW IF EXISTS `professors_calendar`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `professors_calendar` AS SELECT 
 1 AS `idProfessor`,
 1 AS `name`,
 1 AS `idSection`,
 1 AS `iddates`,
 1 AS `roomno`,
 1 AS `day_of_week`,
 1 AS `time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `proforssor_garades`
--

DROP TABLE IF EXISTS `proforssor_garades`;
/*!50001 DROP VIEW IF EXISTS `proforssor_garades`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `proforssor_garades` AS SELECT 
 1 AS `idProfessor`,
 1 AS `avg(shs.professor_mark)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `removed_section`
--

DROP TABLE IF EXISTS `removed_section`;
/*!50001 DROP VIEW IF EXISTS `removed_section`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `removed_section` AS SELECT 
 1 AS `ssn`,
 1 AS `student_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `idSection` int NOT NULL AUTO_INCREMENT,
  `Term_idTerm` int NOT NULL,
  `Course_idCourse` int NOT NULL,
  `Professor_idProfessor` int NOT NULL,
  `exam_date` date DEFAULT NULL,
  `Section_capacity` int NOT NULL,
  `exam_time` time DEFAULT NULL,
  PRIMARY KEY (`idSection`,`Term_idTerm`),
  KEY `fk_Section_Term1_idx` (`Term_idTerm`),
  KEY `fk_Section_Course1_idx` (`Course_idCourse`),
  KEY `fk_Section_Professor1_idx` (`Professor_idProfessor`),
  CONSTRAINT `fk_Section_Course1` FOREIGN KEY (`Course_idCourse`) REFERENCES `course` (`idCourse`),
  CONSTRAINT `fk_Section_Professor1` FOREIGN KEY (`Professor_idProfessor`) REFERENCES `professor` (`idProfessor`),
  CONSTRAINT `fk_Section_Term1` FOREIGN KEY (`Term_idTerm`) REFERENCES `term` (`idTerm`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,1,4,1,'2023-08-18',20,'11:00:00'),(2,1,3,2,'2023-08-17',30,'09:00:00'),(3,10,2,3,'2023-08-16',35,'14:00:00'),(4,2,1,4,'2023-08-15',25,'10:00:00'),(5,3,3,5,'2023-08-17',35,'09:00:00'),(6,9,4,6,'2023-08-18',40,'11:00:00'),(7,8,5,7,'2023-08-19',40,'13:00:00'),(8,7,6,8,'2023-08-20',25,'16:00:00'),(9,6,8,9,'2023-08-22',30,'15:00:00'),(10,5,5,10,'2023-08-19',35,'13:00:00'),(11,1,4,1,'2023-08-18',20,'11:00:00'),(12,1,3,2,'2023-08-17',30,'09:00:00'),(13,10,2,3,'2023-08-16',35,'14:00:00'),(14,1,10,4,'2023-08-15',25,'10:00:00'),(15,3,11,5,'2023-08-17',35,'09:00:00'),(16,9,14,6,'2023-08-18',40,'11:00:00'),(17,8,15,7,'2023-08-19',40,'13:00:00'),(18,7,16,8,'2023-08-20',25,'16:00:00'),(19,6,18,9,'2023-08-22',30,'15:00:00'),(20,5,15,10,'2023-08-19',35,'13:00:00');
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `show_info`
--

DROP TABLE IF EXISTS `show_info`;
/*!50001 DROP VIEW IF EXISTS `show_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `show_info` AS SELECT 
 1 AS `student_name`,
 1 AS `ssn`,
 1 AS `idCourse`,
 1 AS `roomno`,
 1 AS `name`,
 1 AS `Factuly_name`,
 1 AS `Course_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `ssn` int NOT NULL AUTO_INCREMENT,
  `Major_idMajor` int NOT NULL,
  `student_name` varchar(45) NOT NULL,
  `student_email` varchar(45) DEFAULT NULL,
  `student_city` varchar(45) DEFAULT NULL,
  `student_phone` int DEFAULT NULL,
  `student_address` varchar(45) DEFAULT NULL,
  `entry_date` year NOT NULL,
  `student_agverageGrades` int DEFAULT '0',
  `student_balance` int DEFAULT '0',
  `student_password` varchar(45) NOT NULL,
  PRIMARY KEY (`ssn`),
  KEY `fk_Student_Major1_idx` (`Major_idMajor`),
  CONSTRAINT `fk_Student_Major1` FOREIGN KEY (`Major_idMajor`) REFERENCES `major` (`idMajor`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,6,'Ethan Moore','ethanmoore@email.com','Miami',5553456,'123 Pine St.',2020,92,4400,'password34'),(2,1,'Abigail Nelson','abigailnelson@email.com','New York',5556789,'456 Cedar St.',2018,96,4900,'password35'),(3,9,'Natalie Parker','natalieparker@email.com','Los Angeles',5551234,'789 Maple St.',2021,85,4300,'password36'),(4,3,'Christopher Perez','christopherperez@email.com','Chicago',5555678,'234 Oak St.',2019,91,4100,'password37'),(5,4,'Avery Phillips','averyphillips@email.com','Dallas',5559012,'567 Pine St.',2022,90,4000,'password38'),(6,6,'Isabella Ramirez','isabellaramirez@email.com','San Francisco',5553456,'890 Cedar St.',2020,92,4400,'password39'),(7,8,'David Reed','davidreed@email.com','Miami',5556789,'123 Maple St.',2018,94,4700,'password40'),(8,2,'Kaitlyn Richardson','kaitlynrichardson@email.com','New York',5551234,'456 Oak St.',2021,88,4200,'password41'),(9,5,'Tyler Rivera','tylerrivera@email.com','Los Angeles',5555678,'789 Pine St.',2019,93,4600,'password42'),(10,7,'Sophia Robinson','sophiarobinson@email.com','Chicago',5559012,'234 Cedar St.',2022,90,4500,'password43'),(11,3,'David Lee','davidlee@email.com','Chicago',5553456,'789 Pine St.',2019,75,500,'password3'),(12,4,'Karen Chen','karenchen@email.com','Houston',5554567,'101 Elm St.',2020,88,2000,'password4'),(13,5,'Michael Brown','michaelbrown@email.com','Philadelphia',5555678,'234 Maple Ln.',2018,91,2500,'password5'),(14,1,'Jennifer Davis','jenniferdavis@email.com','Phoenix',5556789,'567 Cedar Rd.',2017,79,800,'password6'),(15,2,'Robert Kim','robertkim@email.com','San Antonio',5557890,'890 Birch Dr.',2022,83,1200,'password7'),(16,3,'Susan Lee','susanlee@email.com','San Diego',5558901,'111 Walnut St.',2021,87,3000,'password8'),(17,4,'Richard Jones','richardjones@email.com','Dallas',5559012,'222 Cherry Ave.',2019,90,4000,'password9'),(18,7,'Emily Williams','emilywilliams@email.com','Seattle',5551234,'123 Main St.',2020,95,4500,'password1'),(19,2,'Michael Johnson','michaeljohnson@email.com','Houston',5555678,'456 Elm St.',2021,88,4200,'password2'),(20,3,'Jennifer Brown','jenniferbrown@email.com','San Francisco',5559012,'789 Oak St.',2019,91,4100,'password3'),(21,9,'Christopher Davis','christopherdavis@email.com','Miami',5553456,'234 Pine St.',2022,85,4300,'password4'),(22,5,'Jessica Garcia','jessicagarcia@email.com','New York',5556789,'567 Cedar St.',2020,93,4600,'password5'),(23,2,'Matthew Hernandez','matthewhernandez@email.com','Los Angeles',5551234,'901 Maple St.',2021,87,4200,'password6'),(24,6,'Amanda Martinez','amandamartinez@email.com','Chicago',5555678,'234 Oak St.',2019,92,4400,'password7'),(25,7,'David Rodriguez','davidrodriguez@email.com','Dallas',5559012,'567 Pine St.',2022,90,4500,'password8'),(26,10,'Ashley Wilson','ashleywilson@email.com','San Francisco',5553456,'890 Cedar St.',2018,85,4800,'password9'),(27,3,'Daniel Anderson','danielanderson@email.com','Miami',5556789,'123 Maple St.',2020,89,4100,'password10'),(28,8,'Sarah Baker','sarahbaker@email.com','New York',5551234,'456 Oak St.',2021,94,4700,'password11'),(29,9,'Robert Carter','robertcarter@email.com','Los Angeles',5555678,'789 Pine St.',2019,85,4300,'password12'),(30,5,'Stephanie Clark','stephanieclark@email.com','Chicago',5559012,'234 Cedar St.',2022,92,4600,'password13'),(31,4,'Anthony Davis','anthonydavis@email.com','Dallas',5553456,'567 Maple St.',2020,90,4000,'password14'),(32,6,'Melissa Edwards','melissaedwards@email.com','San Francisco',5556789,'901 Oak St.',2018,87,4400,'password15'),(33,2,'Jonathan Evans','jonathanevans@email.com','Miami',5551234,'234 Pine St.',2021,88,4200,'password16'),(34,8,'Nicholas Flores','nicholasflores@email.com','New York',5555678,'567 Cedar St.',2019,94,4700,'password17'),(35,9,'Samantha Garcia','samanthagarcia@email.com','Los Angeles',5559012,'890 Oak St.',2022,85,4300,'password18'),(36,3,'Hannah Gonzalez','hannahgonzalez@email.com','Chicago',5553456,'123 Pine St.',2020,91,4100,'password19'),(37,7,'Brandon Green','brandongreen@email.com','Dallas',5556789,'456 Maple St.',2018,90,4500,'password20'),(38,2,'Elizabeth Hall','elizabethhall@email.com','San Francisco',5551234,'789 Oak St.',2021,87,4200,'password21'),(39,8,'Christopher Harris','christopherharris@email.com','Miami',5555678,'234 Cedar St.',2019,94,4700,'password22'),(40,6,'Victoria Hernandez','victoriahernandez@email.com','New York',5559012,'567 Pine St.',2022,92,4400,'password23'),(41,4,'Jacob Hill','jacobhill@email.com','Los Angeles',5553456,'890 Cedar St.',2020,90,4000,'password24'),(42,1,'Megan Jackson','meganjackson@email.com','Chicago',5556789,'123 Maple St.',2018,96,4900,'password25'),(43,6,'William Johnson','williamjohnson@email.com','Dallas',5551234,'456 Oak St.',2021,92,4400,'password26'),(44,3,'Madison Jones','madisonjones@email.com','San Francisco',5555678,'789 Pine St.',2019,91,4100,'password27'),(45,5,'Joshua King','joshuaking@email.com','Miami',5559012,'234 Cedar St.',2022,93,4600,'password28'),(46,9,'Lauren Lee','laurenlee@email.com','New York',5553456,'567 Oak St.',2020,85,4300,'password29'),(47,2,'Christopher Lewis','christopherlewis@email.com','Los Angeles',5556789,'901 Pine St.',2018,88,4200,'password30'),(48,7,'Olivia Martinez','oliviamartinez@email.com','Chicago',5551234,'234 Maple St.',2021,90,4500,'password31'),(49,8,'Andrew Martin','andrewmartin@email.com','Dallas',5555678,'567 Cedar St.',2019,94,4700,'password32'),(50,5,'Makayla Mitchell','makaylamitchell@email.com','San Francisco',5559012,'890 Oak St.',2022,93,4600,'password33');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_exam`
--

DROP TABLE IF EXISTS `student_has_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_exam` (
  `Student_ssn` int NOT NULL,
  `Exam_idExam` int NOT NULL,
  PRIMARY KEY (`Student_ssn`,`Exam_idExam`),
  KEY `fk_Student_has_Exam_Exam1_idx` (`Exam_idExam`),
  KEY `fk_Student_has_Exam_Student1_idx` (`Student_ssn`),
  CONSTRAINT `fk_Student_has_Exam_Exam1` FOREIGN KEY (`Exam_idExam`) REFERENCES `exam` (`idExam`),
  CONSTRAINT `fk_Student_has_Exam_Student1` FOREIGN KEY (`Student_ssn`) REFERENCES `student` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_exam`
--

LOCK TABLES `student_has_exam` WRITE;
/*!40000 ALTER TABLE `student_has_exam` DISABLE KEYS */;
INSERT INTO `student_has_exam` VALUES (4,1),(10,1),(4,2),(8,2),(10,2),(4,3),(8,3),(10,3),(1,4),(5,4),(10,4),(4,5),(10,5),(1,6),(5,6),(1,7),(5,7),(1,8),(5,8),(1,9),(5,9),(2,10),(4,10),(6,10),(8,10),(2,11),(6,11),(2,12),(6,12),(2,13),(6,13),(2,14),(6,14),(3,15),(7,15),(3,16),(7,16),(3,17),(7,17),(3,18),(7,18),(3,19),(7,19);
/*!40000 ALTER TABLE `student_has_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_foodschedule`
--

DROP TABLE IF EXISTS `student_has_foodschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_foodschedule` (
  `Student_ssn` int NOT NULL,
  `FoodSchedule_idFoodSchedule` int NOT NULL,
  PRIMARY KEY (`Student_ssn`,`FoodSchedule_idFoodSchedule`),
  KEY `fk_Student_has_FoodSchedule_FoodSchedule1_idx` (`FoodSchedule_idFoodSchedule`),
  KEY `fk_Student_has_FoodSchedule_Student1_idx` (`Student_ssn`),
  CONSTRAINT `fk_Student_has_FoodSchedule_FoodSchedule1` FOREIGN KEY (`FoodSchedule_idFoodSchedule`) REFERENCES `foodschedule` (`idFoodSchedule`),
  CONSTRAINT `fk_Student_has_FoodSchedule_Student1` FOREIGN KEY (`Student_ssn`) REFERENCES `student` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_foodschedule`
--

LOCK TABLES `student_has_foodschedule` WRITE;
/*!40000 ALTER TABLE `student_has_foodschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_has_foodschedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_has_foodschedule_AFTER_INSERT` AFTER INSERT ON `student_has_foodschedule` FOR EACH ROW BEGIN

 set @food_price = (SELECT Food_price FROM food WHERE idFood = (SELECT Food_idFood FROM foodschedule WHERE idFoodSchedule = NEW.FoodSchedule_idFoodSchedule));
  IF @food_price <= (SELECT student_balance FROM student WHERE ssn = NEW.Student_ssn) THEN
    UPDATE student SET student_balance = student_balance - @food_price WHERE ssn = NEW.Student_ssn;
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
  END IF;
	update foodschedule set count = count + 1 where NEW.FoodSchedule_idFoodSchedule = idfoodschedule;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `student_has_section`
--

DROP TABLE IF EXISTS `student_has_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_section` (
  `Student_ssn` int NOT NULL,
  `Section_idSection` int NOT NULL,
  `professor_mark` int DEFAULT NULL,
  `student_mark` int DEFAULT NULL,
  `is_passed` tinyint DEFAULT NULL,
  `is_removerd` tinyint DEFAULT '0',
  `is_signed` tinyint DEFAULT '0',
  PRIMARY KEY (`Student_ssn`,`Section_idSection`),
  KEY `fk_Student_has_Section_Section1_idx` (`Section_idSection`),
  KEY `fk_Student_has_Section_Student1_idx` (`Student_ssn`),
  CONSTRAINT `fk_Student_has_Section_Section1` FOREIGN KEY (`Section_idSection`) REFERENCES `section` (`idSection`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Student_has_Section_Student1` FOREIGN KEY (`Student_ssn`) REFERENCES `student` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_section`
--

LOCK TABLES `student_has_section` WRITE;
/*!40000 ALTER TABLE `student_has_section` DISABLE KEYS */;
INSERT INTO `student_has_section` VALUES (1,5,85,90,1,1,0),(1,6,75,80,1,0,1),(1,7,70,75,1,0,1),(1,8,80,85,1,0,1),(1,9,60,70,0,0,1),(2,10,80,90,1,0,1),(2,11,70,80,1,0,1),(2,12,60,70,0,0,1),(2,13,90,95,1,0,1),(2,14,75,85,1,0,1),(3,15,85,90,1,0,1),(3,16,75,80,1,1,0),(3,17,70,75,1,0,1),(3,18,80,85,1,0,1),(3,19,60,70,0,1,0),(4,1,70,80,1,0,1),(4,2,80,90,1,0,1),(4,3,90,95,1,0,1),(4,4,75,85,1,0,1),(4,10,60,70,1,0,1),(5,5,85,90,1,0,1),(5,6,75,80,1,0,1),(5,7,70,75,1,0,1),(5,8,80,85,1,0,1),(5,9,60,70,0,0,1),(6,10,80,90,1,0,1),(6,11,70,80,1,0,1),(6,12,60,70,0,1,0),(6,13,90,95,1,0,0),(6,14,75,85,1,0,1),(7,15,85,90,1,0,1),(7,16,75,80,1,0,1),(7,17,70,75,1,0,1),(7,18,80,85,1,0,1),(7,19,60,70,0,1,0),(8,1,70,80,1,0,1),(8,2,80,90,1,1,0),(8,10,60,70,1,0,1),(10,1,70,80,1,0,1),(10,2,80,90,1,1,0),(10,3,60,70,1,0,1),(10,4,75,85,1,0,1),(10,7,90,95,1,1,0);
/*!40000 ALTER TABLE `student_has_section` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_has_section_AFTER_INSERT` AFTER INSERT ON `student_has_section` FOR EACH ROW BEGIN
  UPDATE term_has_student SET
  Student_Term_nounits = Student_Term_nounits + (select distinct unit from course c , section s where NEW.Section_idSection=s.idSection and c.idCourse=s.Course_idCourse)
  WHERE NEW.Student_ssn = Student_ssn;
  IF NEW.section_idsection NOT IN (select section_idsection from exam) then
  INSERT INTO exam(exam_date, exam_time, section_idsection) (select exam_date, exam_time, NEW.Section_idSection from section s where s.idsection = NEW.section_idsection);
  INSERT into student_has_exam (select NEW.Student_ssn, idExam from exam where NEW.Section_idSection = exam.Section_idSection);
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `student_has_section_AFTER_UPDATE` AFTER UPDATE ON `student_has_section` FOR EACH ROW BEGIN
IF NEW.is_signed = 1 AND OLD.is_signed = 0 THEN
UPDATE student SET 
tudent_total_units = student_total_units + (SELECT course_unit FROM course WHERE idCourse = (SELECT Course_idCourse FROM section WHERE idSection = NEW.Section_idSection)) 
WHERE ssn = NEW.Student_ssn;
END IF;

IF NEW.is_signed = 1 AND Old.is_signed = 0 THEN
update student set
 student_agverageGrades = ( select sum(student_mark*unit)/sum(unit)
 from student_has_section ss , course c , section s
 where ss.Student_ssn = new.Student_ssn and ss.Section_idSection  = s.idSection and s.idSection = c.idCourse and ss.is_signed = 1);

end if	;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `term`
--

DROP TABLE IF EXISTS `term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term` (
  `idTerm` int NOT NULL AUTO_INCREMENT,
  `Department_idDepartment` int NOT NULL,
  `select_unit_start_date` date NOT NULL,
  `select_unit_end_date` date NOT NULL,
  `is_current` tinyint NOT NULL,
  PRIMARY KEY (`idTerm`),
  KEY `fk_Term_Department1_idx` (`Department_idDepartment`),
  CONSTRAINT `fk_Term_Department1` FOREIGN KEY (`Department_idDepartment`) REFERENCES `department` (`idDepartment`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
INSERT INTO `term` VALUES (1,10,'2022-01-10','2022-05-20',1),(2,1,'2022-02-01','2022-05-15',0),(3,2,'2022-01-15','2022-05-25',0),(4,3,'2022-02-10','2022-05-30',0),(5,4,'2022-01-20','2022-06-01',0),(6,5,'2022-02-15','2022-06-05',0),(7,6,'2022-01-25','2022-06-10',0),(8,7,'2022-02-20','2022-06-15',0),(9,8,'2022-02-10','2022-06-20',0),(10,9,'2022-02-25','2022-06-25',0);
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_has_student`
--

DROP TABLE IF EXISTS `term_has_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term_has_student` (
  `Term_idTerm` int NOT NULL,
  `Student_ssn` int NOT NULL,
  `Student_Terrm_avg` int DEFAULT NULL,
  `Student_Term_nounits` int DEFAULT NULL,
  `remove_section` tinyint DEFAULT '0',
  PRIMARY KEY (`Term_idTerm`,`Student_ssn`),
  KEY `fk_Term_has_Student_Student1_idx` (`Student_ssn`),
  KEY `fk_Term_has_Student_Term1_idx` (`Term_idTerm`),
  CONSTRAINT `fk_Term_has_Student_Student1` FOREIGN KEY (`Student_ssn`) REFERENCES `student` (`ssn`),
  CONSTRAINT `fk_Term_has_Student_Term1` FOREIGN KEY (`Term_idTerm`) REFERENCES `term` (`idTerm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_has_student`
--

LOCK TABLES `term_has_student` WRITE;
/*!40000 ALTER TABLE `term_has_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_has_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `top_average_section_marks_in_term`
--

DROP TABLE IF EXISTS `top_average_section_marks_in_term`;
/*!50001 DROP VIEW IF EXISTS `top_average_section_marks_in_term`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `top_average_section_marks_in_term` AS SELECT 
 1 AS `idTerm`,
 1 AS `idSection`,
 1 AS `Student_ssn`,
 1 AS `AVG(shs.student_mark)`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'university'
--

--
-- Dumping routines for database 'university'
--

--
-- Final view structure for view `a_students`
--

/*!50001 DROP VIEW IF EXISTS `a_students`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `a_students` AS select `student`.`ssn` AS `ssn`,`student`.`student_name` AS `student_name`,`student`.`entry_date` AS `entry_date`,`student`.`student_agverageGrades` AS `student_agverageGrades` from `student` where (`student`.`student_agverageGrades` >= 17) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `food_reservation`
--

/*!50001 DROP VIEW IF EXISTS `food_reservation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `food_reservation` AS select `food`.`Food_name` AS `food_name`,count(`student_has_foodschedule`.`Student_ssn`) AS `reservation_count` from ((`food` join `foodschedule`) join `student_has_foodschedule`) where ((`food`.`idFood` = `foodschedule`.`Food_idFood`) and (`foodschedule`.`idFoodSchedule` = `student_has_foodschedule`.`FoodSchedule_idFoodSchedule`) and (`foodschedule`.`FoodSchedule_date` between curdate() and (curdate() + interval 7 day))) group by `food`.`Food_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `low_units`
--

/*!50001 DROP VIEW IF EXISTS `low_units`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `low_units` AS select `student`.`ssn` AS `ssn`,`student`.`student_name` AS `student_name`,sum(`course`.`unit`) AS `total_units` from ((((`student` join `student_has_section`) join `section`) join `course`) join `term`) where ((`student`.`ssn` = `student_has_section`.`Student_ssn`) and (`student_has_section`.`Section_idSection` = `section`.`idSection`) and (`section`.`Course_idCourse` = `course`.`idCourse`) and (`section`.`Term_idTerm` = `term`.`idTerm`) and (`term`.`is_current` = 1) and (`student_has_section`.`is_passed` = 1)) group by `student`.`ssn`,`student`.`student_name` having (`total_units` <= 12) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `major_grades`
--

/*!50001 DROP VIEW IF EXISTS `major_grades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `major_grades` AS select `m`.`name` AS `name`,`sec`.`Term_idTerm` AS `Term_idTerm`,avg(`shs`.`student_mark`) AS `avg(shs.student_mark)` from (((`major` `m` join `student` `s`) join `student_has_section` `shs`) join `section` `sec`) where ((`m`.`idMajor` = `s`.`Major_idMajor`) and (`s`.`ssn` = `shs`.`Student_ssn`) and (`shs`.`Section_idSection` = `sec`.`idSection`)) group by `m`.`name`,`sec`.`Term_idTerm` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `passed_courses`
--

/*!50001 DROP VIEW IF EXISTS `passed_courses`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `passed_courses` AS select `student`.`ssn` AS `ssn`,`student`.`student_name` AS `student_name`,`course`.`Course_name` AS `course_name`,`student_has_section`.`student_mark` AS `student_mark` from (((`student` join `student_has_section`) join `section`) join `course`) where ((`student`.`ssn` = `student_has_section`.`Student_ssn`) and (`student_has_section`.`Section_idSection` = `section`.`idSection`) and (`section`.`Course_idCourse` = `course`.`idCourse`) and (`student_has_section`.`is_passed` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `professors_calendar`
--

/*!50001 DROP VIEW IF EXISTS `professors_calendar`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `professors_calendar` AS select `p`.`idProfessor` AS `idProfessor`,`p`.`name` AS `name`,`s`.`idSection` AS `idSection`,`d`.`iddates` AS `iddates`,`d`.`roomno` AS `roomno`,`d`.`day_of_week` AS `day_of_week`,`d`.`time` AS `time` from ((`professor` `p` join `section` `s`) join `dates` `d`) where ((`p`.`idProfessor` = `s`.`Professor_idProfessor`) and (`s`.`idSection` = `d`.`Section_idSection`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `proforssor_garades`
--

/*!50001 DROP VIEW IF EXISTS `proforssor_garades`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `proforssor_garades` AS select `p`.`idProfessor` AS `idProfessor`,avg(`shs`.`professor_mark`) AS `avg(shs.professor_mark)` from ((`professor` `p` join `student_has_section` `shs`) join `section` `s`) where ((`p`.`idProfessor` = `s`.`Professor_idProfessor`) and (`shs`.`Section_idSection` = `s`.`idSection`)) group by `p`.`idProfessor` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `removed_section`
--

/*!50001 DROP VIEW IF EXISTS `removed_section`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `removed_section` AS select `s`.`ssn` AS `ssn`,`s`.`student_name` AS `student_name` from ((`student` `s` join `term_has_student` `ts`) join `term` `t`) where ((`ts`.`Student_ssn` = `s`.`ssn`) and (`ts`.`remove_section` = 1) and (`ts`.`Term_idTerm` = `t`.`idTerm`) and (`t`.`is_current` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `show_info`
--

/*!50001 DROP VIEW IF EXISTS `show_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `show_info` AS select `s`.`student_name` AS `student_name`,`s`.`ssn` AS `ssn`,`c`.`idCourse` AS `idCourse`,`dt`.`roomno` AS `roomno`,`p`.`name` AS `name`,`f`.`Factuly_name` AS `Factuly_name`,`c`.`Course_name` AS `Course_name` from ((((((((`student` `s` join `student_has_section` `ss`) join `section` `sc`) join `course` `c`) join `dates` `dt`) join `professor` `p`) join `factuly` `f`) join `department` `d`) join `term` `t`) where ((`s`.`ssn` = `ss`.`Student_ssn`) and (`ss`.`Section_idSection` = `sc`.`idSection`) and (`sc`.`Course_idCourse` = `c`.`idCourse`) and (`c`.`Department_idDepartment` = `d`.`idDepartment`) and (`d`.`Factuly_idFactuly` = `f`.`idFactuly`) and (`sc`.`Professor_idProfessor` = `p`.`idProfessor`) and (`dt`.`Section_idSection` = `sc`.`idSection`) and (`t`.`idTerm` = `sc`.`Term_idTerm`) and (`t`.`is_current` = 1)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_average_section_marks_in_term`
--

/*!50001 DROP VIEW IF EXISTS `top_average_section_marks_in_term`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_average_section_marks_in_term` AS select `t`.`idTerm` AS `idTerm`,`s`.`idSection` AS `idSection`,`shs`.`Student_ssn` AS `Student_ssn`,avg(`shs`.`student_mark`) AS `AVG(shs.student_mark)` from ((`term` `t` join `section` `s`) join `student_has_section` `shs`) where ((`t`.`idTerm` = `s`.`Term_idTerm`) and (`s`.`idSection` = `shs`.`Section_idSection`)) group by `t`.`idTerm`,`s`.`idSection`,`shs`.`Student_ssn` order by avg(`shs`.`student_mark`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-02 16:20:34
