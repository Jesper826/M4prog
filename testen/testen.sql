
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


DROP TABLE IF EXISTS `tel_klant` ;

CREATE TABLE IF NOT EXISTS `tel_klant` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `naam` VARCHAR(250) NOT NULL,
  `geboortedatum` DATETIME NOT NULL,
  PRIMARY KEY (`id`)
  )
ENGINE = InnoDB;


DROP TABLE IF EXISTS `tel_abonnement` ;

CREATE TABLE IF NOT EXISTS `tel_abonnement` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `abonnementtype` VARCHAR(45) NOT NULL,
  `kostenPerMaand` DECIMAL(10,2) UNSIGNED NOT NULL,
  `mbGratis` INT UNSIGNED NOT NULL,
  `smsGratis` INT UNSIGNED NOT NULL,
  `belMinuten` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tel_factuur`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tel_factuur` ;

CREATE TABLE IF NOT EXISTS `tel_factuur` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `vanmaand` INT NOT NULL,
  `factuurDatum` DATETIME NOT NULL,
  `betaaldDatum` DATETIME NOT NULL,
  `totaalBedrag` DECIMAL(10,2) NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_factuur_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `tel_klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tel_dienstcodes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tel_dienstcodes` ;

CREATE TABLE IF NOT EXISTS `tel_dienstcodes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dienstnaam` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tel_tarief`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tel_tarief` ;

CREATE TABLE IF NOT EXISTS `tel_tarief` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `perunit` DECIMAL(10,2) NOT NULL,
  `tariefnaam` VARCHAR(250) NOT NULL,
  `geldigvan` DATETIME NOT NULL,
  `geldigtot` DATETIME NULL,
  `dienstcodes_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_tarief_dienstcodes`
    FOREIGN KEY (`dienstcodes_id`)
    REFERENCES `tel_dienstcodes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tel_gesprekken`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tel_gesprekken` ;

CREATE TABLE IF NOT EXISTS `tel_gesprekken` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naarnummer` VARCHAR(45) NOT NULL,
  `startdatum` DATETIME NOT NULL,
  `einddatum` DATETIME NOT NULL,
  `tarief_id` INT NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_gesprekken_tarief1`
    FOREIGN KEY (`tarief_id`)
    REFERENCES `tel_tarief` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gesprekken_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `tel_klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tel_smsverbruik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tel_smsverbruik` ;

CREATE TABLE IF NOT EXISTS `tel_smsverbruik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naarnummer` VARCHAR(45) NULL,
  `aantalpaginas` INT NULL,
  `tarief_id` INT NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  `datum` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_smsverbruik_tarief1`
    FOREIGN KEY (`tarief_id`)
    REFERENCES `tel_tarief` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_smsverbruik_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `tel_klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tel_dataverbruik`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tel_dataverbruik` ;

CREATE TABLE IF NOT EXISTS `tel_dataverbruik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `MBs` VARCHAR(45) NOT NULL,
  `datum` DATETIME NOT NULL,
  `tarief_id` INT NOT NULL,
  `klant_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_dataverbruik_tarief1`
    FOREIGN KEY (`tarief_id`)
    REFERENCES `tel_tarief` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dataverbruik_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `tel_klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tel_abonnement_has_tarief`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tel_abonnement_has_tarief` ;

CREATE TABLE IF NOT EXISTS `tel_abonnement_has_tarief` (
  `abonnement_id` INT UNSIGNED NOT NULL,
  `tarief_id` INT NOT NULL,
  PRIMARY KEY (`abonnement_id`, `tarief_id`),
  CONSTRAINT `fk_abonnement_has_tarief_abonnement1`
    FOREIGN KEY (`abonnement_id`)
    REFERENCES `tel_abonnement` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_abonnement_has_tarief_tarief1`
    FOREIGN KEY (`tarief_id`)
    REFERENCES `tel_tarief` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tel_contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tel_contract` ;

CREATE TABLE IF NOT EXISTS `tel_contract` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ingangsdatum` DATETIME NOT NULL,
  `einddatum` DATETIME NOT NULL,
  `abonnement_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_contract_abonnement1`
    FOREIGN KEY (`abonnement_id`)
    REFERENCES `tel_abonnement` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tel_klant_has_contract`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tel_klant_has_contract` ;

CREATE TABLE IF NOT EXISTS `tel_klant_has_contract` (
  `klant_id` INT UNSIGNED NOT NULL,
  `contract_id` INT NOT NULL,
  PRIMARY KEY (`klant_id`, `contract_id`),
  CONSTRAINT `fk_klant_has_contract_klant1`
    FOREIGN KEY (`klant_id`)
    REFERENCES `tel_klant` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_klant_has_contract_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `tel_contract` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



INSERT INTO `tel_dienstcodes` (`id`,`dienstnaam`) VALUES
 (1,'SMS'),
(2,'DATA'),
(3,'BELLEN');

INSERT INTO `tel_tarief` (`id`,`perunit`, `tariefnaam`, `geldigvan`, `dienstcodes_id`) VALUES
 (1,'0.05', 'perMinuten', '2000-01-01', '3'),
(2,'0.55', 'perMinutenBuitenland', '2000-01-01', '3'),
(3,'0.50', 'perMB', '2000-01-01', '2'),
(4,'0.10', 'perSms', '2000-01-01', '1'),
(5,'0.00', 'unlimitedMinuten', '2000-01-01', '3'),
(6,'0.00', 'unlimitedSms', '2000-01-01', '1'),
(7,'0.00', 'unlimitedData', '2000-01-01', '2'),
(8,'0.55', 'perMinutenBuitenlandGoedkoop', '2000-01-01', '3'),
(9,'1.50', 'perMBDuur', '2000-01-01', '2');

INSERT INTO `tel_abonnement` (`abonnementtype`, `kostenPerMaand`, `mbGratis`, `smsGratis`, `belMinuten`) VALUES 
('basis', '5', '500', '60', '80');

INSERT INTO `tel_abonnement_has_tarief` (`abonnement_id`, `tarief_id`) VALUES
(1, 1),
(1, 2),
 (1, 3),
 (1, 4);


INSERT INTO `tel_abonnement` (`abonnementtype`, `kostenPerMaand`, `mbGratis`, `smsGratis`, `belMinuten`) VALUES 
('veel mbs', '15', '4000', '0', '60');

INSERT INTO `tel_abonnement_has_tarief` (`abonnement_id`, `tarief_id`) VALUES 
(2, 1),
 (2, 2),
 (2, 3),
 (2, 4);


INSERT INTO `tel_abonnement` (`abonnementtype`, `kostenPerMaand`, `mbGratis`, `smsGratis`, `belMinuten`) VALUES 
('unlimited', '40', '0', '0', '0');

INSERT INTO `tel_abonnement_has_tarief` (`abonnement_id`, `tarief_id`) 
VALUES ('3', '5'),
('3', '6'),
('3', '7'),
('3', '2');


INSERT INTO `tel_abonnement` (`abonnementtype`, `kostenPerMaand`, `mbGratis`, `smsGratis`, `belMinuten`) VALUES
 ('analoog', '10', '0', '200', '300');

INSERT INTO `tel_abonnement_has_tarief` (`abonnement_id`, `tarief_id`) VALUES 
(4, 1),
 (4, 4),
 (4, 8),
 (4, 9);


INSERT INTO `tel_klant` (`naam`, `geboortedatum`) VALUES 
('leraar', '2000-01-01'),
 ('mario', '1980-04-27'),
 ('bowser', '1970-05-21'),
 ('peach', '1979-09-15');


INSERT INTO `tel_contract` (`id`, `ingangsdatum`, `einddatum`, `abonnement_id`) VALUES 
('1', '2020-01-05 00:00:00', '2021-01-05 00:00:00', '1'),
('2', '2020-01-05 00:00:00', '2021-01-05 00:00:00', '2'),
('3', '2020-01-05 00:00:00', '2021-01-05 00:00:00', '3'),
 ('4', '2020-01-05 00:00:00', '2021-01-05 00:00:00', '4');

INSERT INTO `tel_klant_has_contract` (`klant_id`, `contract_id`) VALUES ('1', '1'),
('2', '2'),
('3', '3'),
('4', '4');


