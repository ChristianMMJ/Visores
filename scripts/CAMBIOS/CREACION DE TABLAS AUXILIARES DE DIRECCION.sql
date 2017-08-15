use ayr;

-- -----------------------------------------------------
-- Table `ayr`.`Pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ayr`.`Pais` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Pais` VARCHAR(95) NULL,
  `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO',
  `Registro` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ayr`.`Estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ayr`.`Estado` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Estado` VARCHAR(45) NULL,
  `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO',
  `Registro` VARCHAR(45) NULL,
  `Pais_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Estado_Pais_idx` (`Pais_ID` ASC),
  CONSTRAINT `fk_Estado_Pais`
    FOREIGN KEY (`Pais_ID`)
    REFERENCES `ayr`.`Pais` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ayr`.`Ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ayr`.`Ciudad` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Ciudad` VARCHAR(45) NULL,
  `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO',
  `Registro` VARCHAR(45) NULL,
  `Estado_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Ciudad_Estado1_idx` (`Estado_ID` ASC),
  CONSTRAINT `fk_Ciudad_Estado1`
    FOREIGN KEY (`Estado_ID`)
    REFERENCES `ayr`.`Estado` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ayr`.`Colonia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ayr`.`Colonia` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Colonia` VARCHAR(45) NULL,
  `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO',
  `Registro` VARCHAR(45) NULL,
  `Ciudad_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Colonia_Ciudad1_idx` (`Ciudad_ID` ASC),
  CONSTRAINT `fk_Colonia_Ciudad1`
    FOREIGN KEY (`Ciudad_ID`)
    REFERENCES `ayr`.`Ciudad` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Data for table `ayr`.`Pais`
-- -----------------------------------------------------
START TRANSACTION;
USE `ayr`;
INSERT INTO `ayr`.`Pais` (`ID`, `Pais`, `Estatus`, `Registro`) VALUES (1, 'MÉXICO', 'ACTIVO', '01/08/2016 12:00:00 PM');

COMMIT;