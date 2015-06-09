-- -----------------------------------------------------
-- Table `Timetable`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Course` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Course` (
  `code` INT NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `semester` INT NULL ,
  PRIMARY KEY (`code`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Timetable`.`Classroom`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Classroom` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Classroom` (
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
  `fullName` VARCHAR(45) NULL ,
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
-- Table `Timetable`.`Lecturer_has_Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Lecturer_has_Course` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Lecturer_has_Course` (
  `Lecturer_ID` INT NOT NULL ,
  `Course_code` INT NOT NULL ,
  `Classroom_ID` INT NOT NULL ,
  `datetime` DATETIME NULL ,
  PRIMARY KEY (`Lecturer_ID`, `Course_code`, `Classroom_ID`) ,
  INDEX `fk_Lecturer_has_Course_Course1_idx` (`Course_code` ASC) ,
  INDEX `fk_Lecturer_has_Course_Lecturer1_idx` (`Lecturer_ID` ASC) ,
  INDEX `fk_Lecturer_has_Course_Classroom1_idx` (`Classroom_ID` ASC) ,
  CONSTRAINT `fk_Lecturer_has_Course_Lecturer1`
    FOREIGN KEY (`Lecturer_ID` )
    REFERENCES `Timetable`.`Lecturer` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lecturer_has_Course_Course1`
    FOREIGN KEY (`Course_code` )
    REFERENCES `Timetable`.`Course` (`code` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lecturer_has_Course_Classroom1`
    FOREIGN KEY (`Classroom_ID` )
    REFERENCES `Timetable`.`Classroom` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Timetable`.`Departement_has_Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timetable`.`Departement_has_Course` ;

CREATE  TABLE IF NOT EXISTS `Timetable`.`Departement_has_Course` (
  `Departement_ID` INT NOT NULL ,
  `Course_code` INT NOT NULL ,
  PRIMARY KEY (`Departement_ID`, `Course_code`) ,
  INDEX `fk_Departement_has_Course_Course1_idx` (`Course_code` ASC) ,
  INDEX `fk_Departement_has_Course_Departement1_idx` (`Departement_ID` ASC) ,
  CONSTRAINT `fk_Departement_has_Course_Departement1`
    FOREIGN KEY (`Departement_ID` )
    REFERENCES `Timetable`.`Departement` (`ID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Departement_has_Course_Course1`
    FOREIGN KEY (`Course_code` )
    REFERENCES `Timetable`.`Course` (`code` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
