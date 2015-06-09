-- -----------------------------------------------------
-- Table `Timetable`.`Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Courses` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Courses` (
  `code` INT NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `semester` INT NULL ,
  PRIMARY KEY (`code`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Timetable`.`Classrooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Classrooms` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Classrooms` (
  `ID` INT NOT NULL ,
  `name` VARCHAR(35) NULL ,
  `capacity` INT NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Timetable`.`Lecturer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Lecturer` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Lecturer` (
  `ID` INT NOT NULL ,
  `full name` VARCHAR(45) NULL ,
  `name` VARCHAR(40) NULL ,
  `role` VARCHAR(30) NULL ,
  `password` VARCHAR(45) NULL ,
  PRIMARY KEY (`ID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Timetable`.`Faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Faculty` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Faculty` (
  `ID` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `Dean_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`, `Dean_ID`) ,
  INDEX `fk_Faculty_Lecturer1_idx` (`Dean_ID` ASC) ,
  CONSTRAINT `fk_Faculty_Lecturer1`
    FOREIGN KEY (`Dean_ID` )
    REFERENCES `Timetable`.`Lecturer` (`ID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Timetable`.`Departement`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Departement` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Departement` (
  `ID` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `HOD_ID` INT NOT NULL ,
  `Faculty_ID` INT NOT NULL ,
  PRIMARY KEY (`ID`, `HOD_ID`, `Faculty_ID`) ,
  INDEX `fk_Departement_Lecturer1_idx` (`HOD_ID` ASC) ,
  INDEX `fk_Departement_Faculty1_idx` (`Faculty_ID` ASC) ,
  CONSTRAINT `fk_Departement_Lecturer1`
    FOREIGN KEY (`HOD_ID` )
    REFERENCES `Timetable`.`Lecturer` (`ID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Departement_Faculty1`
    FOREIGN KEY (`Faculty_ID` )
    REFERENCES `Timetable`.`Faculty` (`ID` )
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Timetable`.`Lecturer_has_Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Lecturer_has_Courses` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Lecturer_has_Courses` (
  `Lecturer_ID` INT NOT NULL ,
  `Courses_code` INT NOT NULL ,
  `Classrooms_ID` INT NOT NULL ,
  `datetime` DATETIME NULL ,
  PRIMARY KEY (`Lecturer_ID`, `Courses_code`, `Classrooms_ID`) ,
  INDEX `fk_Lecturer_has_Courses_Courses1_idx` (`Courses_code` ASC) ,
  INDEX `fk_Lecturer_has_Courses_Lecturer1_idx` (`Lecturer_ID` ASC) ,
  INDEX `fk_Lecturer_has_Courses_Classrooms1_idx` (`Classrooms_ID` ASC) ,
  CONSTRAINT `fk_Lecturer_has_Courses_Lecturer1`
    FOREIGN KEY (`Lecturer_ID` )
    REFERENCES `Timetable`.`Lecturer` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lecturer_has_Courses_Courses1`
    FOREIGN KEY (`Courses_code` )
    REFERENCES `Timetable`.`Courses` (`code` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lecturer_has_Courses_Classrooms1`
    FOREIGN KEY (`Classrooms_ID` )
    REFERENCES `Timetable`.`Classrooms` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Timetable`.`Departement_has_Courses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Departement_has_Courses` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Departement_has_Courses` (
  `Departement_ID` INT NOT NULL ,
  `Courses_code` INT NOT NULL ,
  PRIMARY KEY (`Departement_ID`, `Courses_code`) ,
  INDEX `fk_Departement_has_Courses_Courses1_idx` (`Courses_code` ASC) ,
  INDEX `fk_Departement_has_Courses_Departement1_idx` (`Departement_ID` ASC) ,
  CONSTRAINT `fk_Departement_has_Courses_Departement1`
    FOREIGN KEY (`Departement_ID` )
    REFERENCES `Timetable`.`Departement` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Departement_has_Courses_Courses1`
    FOREIGN KEY (`Courses_code` )
    REFERENCES `Timetable`.`Courses` (`code` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
