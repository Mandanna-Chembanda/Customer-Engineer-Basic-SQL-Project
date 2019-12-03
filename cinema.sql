-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cinema
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cinema
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cinema` DEFAULT CHARACTER SET utf8 ;
USE `Cinema` ;

-- -----------------------------------------------------
-- Table `Cinema`.`screen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`screen` (
  `screen_id` INT NOT NULL,
  `screen_name` VARCHAR(45) NULL,
  `screen_type` VARCHAR(45) NULL,
  PRIMARY KEY (`screen_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`seat_class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`seat_class` (
  `seat_class_id` INT NOT NULL AUTO_INCREMENT,
  `class` VARCHAR(45) NULL,
  PRIMARY KEY (`seat_class_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`seat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`seat` (
  `seat_id` INT NOT NULL AUTO_INCREMENT,
  `seat_name` VARCHAR(45) NULL,
  `screen_id` INT NULL,
  `seat_class_id` INT NULL,
  PRIMARY KEY (`seat_id`),
  INDEX `FK_SCREEN_ID_idx` (`screen_id` ASC) VISIBLE,
  INDEX `FK_SEAT_CLASS_idx` (`seat_class_id` ASC) VISIBLE,
  CONSTRAINT `FK_SEAT_SCREEN`
    FOREIGN KEY (`screen_id`)
    REFERENCES `Cinema`.`screen` (`screen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SEAT_CLASS`
    FOREIGN KEY (`seat_class_id`)
    REFERENCES `Cinema`.`seat_class` (`seat_class_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`movie` (
  `movie_id` INT NOT NULL AUTO_INCREMENT,
  `movie_name` VARCHAR(45) NULL,
  `language` VARCHAR(45) NULL,
  `duration_min` INT NULL,
  `show_status` INT NULL,
  PRIMARY KEY (`movie_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`showtime`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`showtime` (
  `showtime_id` INT NOT NULL AUTO_INCREMENT,
  `showtime_start` TIMESTAMP NULL,
  `showtime_end` TIMESTAMP NULL,
  `show_duration_min` INT NULL,
  PRIMARY KEY (`showtime_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`booking` (
  `booking_id` INT NOT NULL AUTO_INCREMENT,
  `booking_type` VARCHAR(45) NULL,
  PRIMARY KEY (`booking_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`show_details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`show_details` (
  `show_id` INT NOT NULL,
  `screen_id` INT NULL,
  `movie_id` INT NULL,
  `showtime_id` INT NULL,
  `status` INT NULL,
  `show_date` DATE NULL,
  PRIMARY KEY (`show_id`),
  INDEX `FK_SHOW_SCREEN_idx` (`screen_id` ASC) VISIBLE,
  INDEX `FK_SHOW_MOVIE_idx` (`movie_id` ASC) VISIBLE,
  INDEX `FK_SHOWTIME_idx` (`showtime_id` ASC) VISIBLE,
  CONSTRAINT `FK_SHOW_SCREEN`
    FOREIGN KEY (`screen_id`)
    REFERENCES `Cinema`.`screen` (`screen_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SHOW_MOVIE`
    FOREIGN KEY (`movie_id`)
    REFERENCES `Cinema`.`movie` (`movie_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SHOWTIME`
    FOREIGN KEY (`showtime_id`)
    REFERENCES `Cinema`.`showtime` (`showtime_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cinema`.`seat_booking`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cinema`.`seat_booking` (
  `seat_booking_id` INT NOT NULL,
  `booking_id` INT NULL,
  `seat_id` INT NULL,
  `show_id` INT NULL,
  `booking_date` DATE NULL,
  PRIMARY KEY (`seat_booking_id`),
  INDEX `FK_SEAT_idx` (`seat_id` ASC) VISIBLE,
  INDEX `FK_SEAT_BOOKING_idx` (`booking_id` ASC) VISIBLE,
  INDEX `FK_SHOW_idx` (`show_id` ASC) VISIBLE,
  CONSTRAINT `FK_SEAT_BOOKING`
    FOREIGN KEY (`booking_id`)
    REFERENCES `Cinema`.`booking` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SEAT`
    FOREIGN KEY (`seat_id`)
    REFERENCES `Cinema`.`seat` (`seat_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SHOW`
    FOREIGN KEY (`show_id`)
    REFERENCES `Cinema`.`show_details` (`show_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into cinema.screen (screen_id,screen_name,screen_type) values (1,'A1','IMAX');
insert into cinema.screen (screen_id,screen_name,screen_type) values (2,'A2','2D');
insert into cinema.screen (screen_id,screen_name,screen_type) values (3,'A3','3D');
insert into cinema.screen (screen_id,screen_name,screen_type) values (4,'A4','4DX');
insert into cinema.screen (screen_id,screen_name,screen_type) values (5,'A5','3D');

insert into cinema.seat_class (seat_class_id,class) values (1,'premium');
insert into cinema.seat_class (seat_class_id,class) values (2,'executive');
insert into cinema.seat_class (seat_class_id,class) values (3,'normal');

insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (1,'A1',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (2,'A2',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (3,'A3',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (4,'A4',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (5,'A5',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (6,'A6',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (7,'A7',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (8,'A8',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (9,'A9',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (10,'A10',1,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (11,'B1',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (12,'B2',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (13,'B3',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (14,'B4',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (15,'B5',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (16,'B6',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (17,'B7',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (18,'B8',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (19,'B9',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (20,'B10',1,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (21,'C1',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (22,'C2',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (23,'C3',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (24,'C4',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (25,'C5',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (26,'C6',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (27,'C7',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (28,'C8',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (29,'C9',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (30,'C10',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (31,'D1',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (32,'D2',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (33,'D3',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (34,'D4',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (35,'D5',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (36,'D6',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (37,'D7',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (38,'D8',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (39,'D9',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (40,'D10',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (41,'E1',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (42,'E2',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (43,'E3',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (44,'E4',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (45,'E5',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (46,'E6',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (47,'E7',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (48,'E8',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (49,'E9',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (50,'E10',1,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (51,'A1',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (52,'A2',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (53,'A3',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (54,'A4',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (55,'A5',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (56,'A6',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (57,'A7',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (58,'A8',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (59,'A9',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (60,'A10',2,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (61,'B1',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (62,'B2',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (63,'B3',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (64,'B4',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (65,'B5',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (66,'B6',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (67,'B7',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (68,'B8',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (69,'B9',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (70,'B10',2,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (71,'C1',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (72,'C2',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (73,'C3',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (74,'C4',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (75,'C5',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (76,'C6',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (77,'C7',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (78,'C8',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (79,'C9',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (80,'C10',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (81,'D1',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (82,'D2',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (83,'D3',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (84,'D4',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (85,'D5',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (86,'D6',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (87,'D7',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (88,'D8',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (89,'D9',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (90,'D10',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (91,'E1',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (92,'E2',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (93,'E3',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (94,'E4',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (95,'E5',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (96,'E6',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (97,'E7',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (98,'E8',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (99,'E9',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (100,'E10',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (101,'F1',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (102,'F2',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (103,'F3',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (104,'F4',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (105,'F5',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (106,'F6',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (107,'F7',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (108,'F8',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (109,'F9',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (110,'F10',2,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (111,'A1',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (112,'A2',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (113,'A3',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (114,'A4',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (115,'A5',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (116,'A6',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (117,'A7',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (118,'A8',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (119,'A9',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (120,'A10',3,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (121,'B1',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (122,'B2',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (123,'B3',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (124,'B4',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (125,'B5',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (126,'B6',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (127,'B7',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (128,'B8',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (129,'B9',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (130,'B10',3,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (131,'C1',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (132,'C2',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (133,'C3',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (134,'C4',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (135,'C5',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (136,'C6',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (137,'C7',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (138,'C8',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (139,'C9',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (140,'C10',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (141,'D1',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (142,'D2',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (143,'D3',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (144,'D4',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (145,'D5',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (146,'D6',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (147,'D7',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (148,'D8',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (149,'D9',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (150,'D10',3,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (151,'A1',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (152,'A2',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (153,'A3',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (154,'A4',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (155,'A5',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (156,'A6',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (157,'A7',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (158,'A8',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (159,'A9',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (160,'A10',4,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (161,'B1',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (162,'B2',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (163,'B3',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (164,'B4',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (165,'B5',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (166,'B6',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (167,'B7',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (168,'B8',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (169,'B9',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (170,'B10',4,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (171,'C1',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (172,'C2',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (173,'C3',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (174,'C4',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (175,'C5',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (176,'C6',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (177,'C7',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (178,'C8',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (179,'C9',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (180,'C10',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (181,'D1',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (182,'D2',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (183,'D3',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (184,'D4',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (185,'D5',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (186,'D6',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (187,'D7',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (188,'D8',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (189,'D9',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (190,'D10',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (191,'E1',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (192,'E2',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (193,'E3',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (194,'E4',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (195,'E5',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (196,'E6',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (197,'E7',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (198,'E8',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (199,'E9',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (200,'E10',4,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (201,'A1',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (202,'A2',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (203,'A3',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (204,'A4',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (205,'A5',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (206,'A6',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (207,'A7',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (208,'A8',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (209,'A9',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (210,'A10',5,1);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (211,'B1',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (212,'B2',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (213,'B3',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (214,'B4',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (215,'B5',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (216,'B6',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (217,'B7',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (218,'B8',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (219,'B9',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (220,'B10',5,2);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (221,'C1',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (222,'C2',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (223,'C3',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (224,'C4',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (225,'C5',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (226,'C6',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (227,'C7',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (228,'C8',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (229,'C9',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (230,'C10',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (231,'D1',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (232,'D2',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (233,'D3',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (234,'D4',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (235,'D5',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (236,'D6',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (237,'D7',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (238,'D8',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (239,'D9',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (240,'D10',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (241,'E1',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (242,'E2',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (243,'E3',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (244,'E4',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (245,'E5',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (246,'E6',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (247,'E7',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (248,'E8',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (249,'E9',5,3);
insert into cinema.seat (seat_id,seat_name,screen_id,seat_class_id) values (250,'E10',5,3);


insert into cinema.movie (movie_id,movie_name,language,duration_min,show_status) values (1,'Kabir Singh','Hindi',148,0);
insert into cinema.movie (movie_id,movie_name,language,duration_min,show_status) values (2,'Gully Boy','Hindi',140,0);
insert into cinema.movie (movie_id,movie_name,language,duration_min,show_status) values (3,'Frozen 2','English',103,1);
insert into cinema.movie (movie_id,movie_name,language,duration_min,show_status) values (4,'Ford V Ferrari','English',155,1);
insert into cinema.movie (movie_id,movie_name,language,duration_min,show_status) values (5,'Bala','Hindi',129,1);
insert into cinema.movie (movie_id,movie_name,language,duration_min,show_status) values (6,'Hotel Mumbai','Hindi',128,1);
insert into cinema.movie (movie_id,movie_name,language,duration_min,show_status) values (7,'Bigil','Tamil',179,1);


insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (1,'09:00','12:00',180);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (2,'12:30','15:30',180);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (3,'16:00','19:00',180);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (4,'19:30','21:30',180);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (5,'09:00','11:00',120);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (6,'11:30','13:30',120);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (7,'14:00','16:00',120);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (8,'16:30','18:30',120);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (9,'19:00','21:00',120);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (10,'09:00','11:30',150);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (11,'12:00','14:30',150);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (12,'15:00','17:30',150);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (13,'18:00','20:30',150);
insert into cinema.showtime (showtime_id,showtime_start,showtime_end,show_duration_min) values (14,'21:00','23:00',150);

insert into cinema.booking (booking_id,booking_type) values (1,'online');
insert into cinema.booking (booking_id,booking_type) values (2,'offline');

insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (1,1,1,1,0,'2019-01-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (2,1,1,2,0,'2019-01-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (3,1,1,3,0,'2019-01-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (4,1,1,4,0,'2019-01-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (5,2,2,1,0,'2019-01-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (6,2,2,2,0,'2019-01-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (7,2,2,3,0,'2019-01-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (8,2,2,4,0,'2019-01-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (9,1,3,5,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (10,1,3,6,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (11,1,3,7,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (12,1,3,8,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (13,1,3,9,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (14,2,4,1,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (15,2,4,2,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (16,2,4,3,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (17,2,4,4,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (18,3,5,10,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (19,3,5,11,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (20,3,5,12,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (21,3,5,13,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (22,3,5,14,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (23,4,6,10,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (24,4,6,11,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (25,4,6,12,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (26,4,6,13,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (27,4,6,14,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (28,5,7,1,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (29,5,7,2,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (30,5,7,3,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (31,5,7,4,1,'2019-02-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (32,1,3,5,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (33,1,3,6,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (34,1,3,7,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (35,1,3,8,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (36,1,3,9,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (37,2,4,1,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (38,2,4,2,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (39,2,4,3,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (40,2,4,4,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (41,3,5,10,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (42,3,5,11,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (43,3,5,12,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (44,3,5,13,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (45,3,5,14,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (46,4,6,10,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (47,4,6,11,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (48,4,6,12,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (49,4,6,13,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (50,4,6,14,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (51,5,7,1,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (52,5,7,2,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (53,5,7,3,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (54,5,7,4,1,'2019-03-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (55,1,3,5,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (56,1,3,6,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (57,1,3,7,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (58,1,3,8,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (59,1,3,9,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (60,2,4,1,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (61,2,4,2,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (62,2,4,3,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (63,2,4,4,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (64,3,5,10,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (65,3,5,11,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (66,3,5,12,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (67,3,5,13,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (68,3,5,14,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (69,4,6,10,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (70,4,6,11,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (71,4,6,12,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (72,4,6,13,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (73,4,6,14,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (74,5,7,1,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (75,5,7,2,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (76,5,7,3,1,'2019-04-12');
insert into cinema.show_details (show_id,screen_id,movie_id,showtime_id,status,show_date) values (77,5,7,4,1,'2019-04-12');

insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (1,1,1,1,'2019-01-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (2,1,2,1,'2019-01-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (3,1,3,1,'2019-01-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (4,1,4,1,'2019-01-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (5,1,5,1,'2019-01-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (6,1,6,1,'2019-01-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (7,2,34,2,'2019-01-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (8,2,35,2,'2019-01-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (9,1,2,10,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (10,1,3,10,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (11,1,46,10,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (12,1,47,10,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (13,1,48,10,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (14,1,31,11,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (15,2,32,11,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (16,2,33,11,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (17,2,34,11,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (18,2,35,11,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (19,2,36,11,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (20,2,37,11,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (21,2,38,11,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (22,1,39,11,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (23,1,51,12,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (24,1,52,12,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (25,1,53,12,'2019-02-12');
insert into seat_booking (seat_booking_id,booking_id,seat_id,show_id,booking_date) values (26,1,54,12,'2019-02-12');

commit;

