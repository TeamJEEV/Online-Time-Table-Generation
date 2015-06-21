CREATE SCHEMA IF NOT EXISTS `timetable` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `timetable` ;

-- -----------------------------------------------------
-- Table `timetable`.`courses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `timetable`.`courses` (
  `code` VARCHAR(50) NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `semester` INT NULL ,
  PRIMARY KEY (`code`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `timetable`.`classrooms`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `timetable`.`classrooms` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(35) NULL ,
  `capacity` INT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `timetable`.`lecturer`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `timetable`.`lecturer` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `full name` VARCHAR(45) NULL ,
  `name` VARCHAR(40) NULL ,
  `password` VARCHAR(45) NULL ,
  `role` VARCHAR(30) NOT NULL DEFAULT 'Lecturer' ,
  `email` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `timetable`.`faculty`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `timetable`.`faculty` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `dean_id` INT NOT NULL ,
  PRIMARY KEY (`id`, `dean_id`) ,
  INDEX `fk_faculty_lecturer1_idx` (`dean_id` ASC) ,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) ,
  CONSTRAINT `fk_faculty_lecturer1`
    FOREIGN KEY (`dean_id` )
    REFERENCES `timetable`.`lecturer` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `timetable`.`department`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `timetable`.`department` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NULL ,
  `faculty_id` INT NOT NULL ,
  `hod_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_department_faculty1_idx` (`faculty_id` ASC) ,
  INDEX `fk_department_lecturer1` (`hod_id` ASC) ,
  UNIQUE INDEX `hod_id_UNIQUE` (`hod_id` ASC) ,
  CONSTRAINT `fk_department_faculty1`
    FOREIGN KEY (`faculty_id` )
    REFERENCES `timetable`.`faculty` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_department_lecturer1`
    FOREIGN KEY (`hod_id` )
    REFERENCES `timetable`.`lecturer` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `timetable`.`department_has_courses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `timetable`.`department_has_courses` (
  `department_id` INT NOT NULL ,
  `courses_code` VARCHAR(50) NOT NULL ,
  PRIMARY KEY (`department_id`, `courses_code`) ,
  INDEX `fk_department_has_courses_courses1` (`courses_code` ASC) ,
  INDEX `fk_department_has_courses_department1` (`department_id` ASC) ,
  CONSTRAINT `fk_department_has_courses_department1`
    FOREIGN KEY (`department_id` )
    REFERENCES `timetable`.`department` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_department_has_courses_courses1`
    FOREIGN KEY (`courses_code` )
    REFERENCES `timetable`.`courses` (`code` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `timetable`.`lecturer_has_courses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `timetable`.`lecturer_has_courses` (
  `lecturer_id` INT NOT NULL ,
  `courses_code` VARCHAR(50) NOT NULL ,
  `classrooms_id` INT NOT NULL ,
  `date` DATETIME NULL ,
  PRIMARY KEY (`lecturer_id`, `courses_code`, `classrooms_id`, `date`) ,
  INDEX `fk_lecturer_has_courses_courses1` (`courses_code` ASC) ,
  INDEX `fk_lecturer_has_courses_lecturer1` (`lecturer_id` ASC) ,
  INDEX `fk_lecturer_has_courses_classrooms1` (`classrooms_id` ASC) ,
  CONSTRAINT `fk_lecturer_has_courses_lecturer1`
    FOREIGN KEY (`lecturer_id` )
    REFERENCES `timetable`.`lecturer` (`id` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lecturer_has_courses_courses1`
    FOREIGN KEY (`courses_code` )
    REFERENCES `timetable`.`courses` (`code` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_lecturer_has_courses_classrooms1`
    FOREIGN KEY (`classrooms_id` )
    REFERENCES `timetable`.`classrooms` (`id` )
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

INSERT INTO timetable.lecturer values (NULL,"admin","admin","admin","Sysadmin");