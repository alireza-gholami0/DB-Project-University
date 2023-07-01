-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: university
-- ------------------------------------------------------
-- Server version	8.0.32

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dates`
--

LOCK TABLES `dates` WRITE;
/*!40000 ALTER TABLE `dates` DISABLE KEYS */;
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
  `Manager_idProfessor` decimal(9,0) NOT NULL,
  `department_name` varchar(45) NOT NULL,
  PRIMARY KEY (`idDepartment`,`Factuly_idFactuly`,`Manager_idProfessor`),
  KEY `fk_Department_Factuly1_idx` (`Factuly_idFactuly`),
  KEY `fk_Department_Professor1_idx` (`Manager_idProfessor`),
  CONSTRAINT `fk_Department_Factuly1` FOREIGN KEY (`Factuly_idFactuly`) REFERENCES `factuly` (`idFactuly`),
  CONSTRAINT `fk_Department_Professor1` FOREIGN KEY (`Manager_idProfessor`) REFERENCES `professor` (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
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
  PRIMARY KEY (`idExam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factuly`
--

LOCK TABLES `factuly` WRITE;
/*!40000 ALTER TABLE `factuly` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
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
  PRIMARY KEY (`idFoodSchedule`),
  KEY `fk_FoodSchedule_Food1_idx` (`Food_idFood`),
  CONSTRAINT `fk_FoodSchedule_Food1` FOREIGN KEY (`Food_idFood`) REFERENCES `food` (`idFood`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodschedule`
--

LOCK TABLES `foodschedule` WRITE;
/*!40000 ALTER TABLE `foodschedule` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `major`
--

LOCK TABLES `major` WRITE;
/*!40000 ALTER TABLE `major` DISABLE KEYS */;
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
  `Student_ssn` decimal(9,0) NOT NULL,
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
  `Professor_idProfessor` decimal(9,0) NOT NULL,
  `Section_idSection` int NOT NULL,
  `text` varchar(45) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`idNotificatoin`),
  KEY `fk_Notificatoin_Professor1_idx` (`Professor_idProfessor`),
  KEY `fk_Notificatoin_Section1_idx` (`Section_idSection`),
  CONSTRAINT `fk_Notificatoin_Professor1` FOREIGN KEY (`Professor_idProfessor`) REFERENCES `professor` (`idProfessor`),
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
  `idProfessor` decimal(9,0) NOT NULL,
  `Department_idDepartment` int NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `office` int DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `phone_number` int DEFAULT NULL,
  `degree` varchar(45) NOT NULL,
  `entry_date` year NOT NULL,
  `avg_mark` int DEFAULT NULL,
  PRIMARY KEY (`idProfessor`,`Department_idDepartment`),
  KEY `fk_Professor_Department1_idx` (`Department_idDepartment`),
  CONSTRAINT `fk_Professor_Department1` FOREIGN KEY (`Department_idDepartment`) REFERENCES `department` (`idDepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professor`
--

LOCK TABLES `professor` WRITE;
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
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
  `Term_idTerm` decimal(3,0) NOT NULL,
  `Course_idCourse` int NOT NULL,
  `Professor_idProfessor` decimal(9,0) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
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
  `ssn` decimal(9,0) NOT NULL,
  `Major_idMajor` int NOT NULL,
  `student_name` varchar(45) NOT NULL,
  `student_email` varchar(45) DEFAULT NULL,
  `student_city` varchar(45) DEFAULT NULL,
  `student_phone` int DEFAULT NULL,
  `student_address` varchar(45) DEFAULT NULL,
  `entry_date` year NOT NULL,
  `student_agverageGrades` int DEFAULT '0',
  `student_balance` int DEFAULT '0',
  PRIMARY KEY (`ssn`),
  KEY `fk_Student_Major1_idx` (`Major_idMajor`),
  CONSTRAINT `fk_Student_Major1` FOREIGN KEY (`Major_idMajor`) REFERENCES `major` (`idMajor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_exam`
--

DROP TABLE IF EXISTS `student_has_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_exam` (
  `Student_ssn` decimal(9,0) NOT NULL,
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
/*!40000 ALTER TABLE `student_has_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_has_foodschedule`
--

DROP TABLE IF EXISTS `student_has_foodschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_has_foodschedule` (
  `Student_ssn` decimal(9,0) NOT NULL,
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
  DECLARE food_price INT;
  SELECT Food_price INTO food_price FROM food WHERE idFood = (SELECT Food_idFood FROM foodschedule WHERE idFoodSchedule = NEW.FoodSchedule_idFoodSchedule);
  IF food_price <= (SELECT student_balance FROM student WHERE ssn = NEW.Student_ssn) THEN
    UPDATE student SET student_balance = student_balance - food_price WHERE ssn = NEW.Student_ssn;
  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insufficient balance';
  END IF;
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
  `Student_ssn` decimal(9,0) NOT NULL,
  `Section_idSection` int NOT NULL,
  `professor_mark` int DEFAULT NULL,
  `student_mark` int DEFAULT NULL,
  `is_passed` tinyint DEFAULT NULL,
  `is_removerd` tinyint DEFAULT '0',
  `is_signed` tinyint DEFAULT '0',
  PRIMARY KEY (`Student_ssn`,`Section_idSection`),
  KEY `fk_Student_has_Section_Section1_idx` (`Section_idSection`),
  KEY `fk_Student_has_Section_Student1_idx` (`Student_ssn`),
  CONSTRAINT `fk_Student_has_Section_Section1` FOREIGN KEY (`Section_idSection`) REFERENCES `section` (`idSection`),
  CONSTRAINT `fk_Student_has_Section_Student1` FOREIGN KEY (`Student_ssn`) REFERENCES `student` (`ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_has_section`
--

LOCK TABLES `student_has_section` WRITE;
/*!40000 ALTER TABLE `student_has_section` DISABLE KEYS */;
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
  `idTerm` decimal(3,0) NOT NULL,
  `Department_idDepartment` int NOT NULL,
  `select_unit_start_date` date NOT NULL,
  `select_unit_end_date` date NOT NULL,
  `is_current` tinyint NOT NULL,
  PRIMARY KEY (`idTerm`),
  KEY `fk_Term_Department1_idx` (`Department_idDepartment`),
  CONSTRAINT `fk_Term_Department1` FOREIGN KEY (`Department_idDepartment`) REFERENCES `department` (`idDepartment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term`
--

LOCK TABLES `term` WRITE;
/*!40000 ALTER TABLE `term` DISABLE KEYS */;
/*!40000 ALTER TABLE `term` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_has_student`
--

DROP TABLE IF EXISTS `term_has_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term_has_student` (
  `Term_idTerm` decimal(3,0) NOT NULL,
  `Student_ssn` decimal(9,0) NOT NULL,
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

-- Dump completed on 2023-07-01 17:49:14
