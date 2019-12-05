-- MySQL Script generated by MySQL Workbench
-- Thu 05 Dec 2019 04:43:07 PM CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema bioskop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema bioskop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `bioskop` DEFAULT CHARACTER SET utf8 ;
USE `bioskop` ;

-- -----------------------------------------------------
-- Table `bioskop`.`kategorija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`kategorija` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`zanr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`zanr` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`tip_projekcije`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`tip_projekcije` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`sala` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `aktivna` BIT(1) NOT NULL,
  `ukupan_broj_mjesta` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`film` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(128) NOT NULL,
  `pocetak_prikazivanja` DATE NOT NULL,
  `kategorija_id` INT NOT NULL,
  `trajanje` DOUBLE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_film_kategorija_idx` (`kategorija_id` ASC),
  CONSTRAINT `fk_film_kategorija`
    FOREIGN KEY (`kategorija_id`)
    REFERENCES `bioskop`.`kategorija` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`film_zanr`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`film_zanr` (
  `film_id` INT NOT NULL,
  `zanr_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `zanr_id`),
  INDEX `fk_film_has_zanr_zanr1_idx` (`zanr_id` ASC),
  INDEX `fk_film_has_zanr_film1_idx` (`film_id` ASC),
  CONSTRAINT `fk_film_has_zanr_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `bioskop`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_has_zanr_zanr1`
    FOREIGN KEY (`zanr_id`)
    REFERENCES `bioskop`.`zanr` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`akcija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`akcija` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(128) NOT NULL,
  `popust` INT NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`projekcija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`projekcija` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `film_id` INT NOT NULL,
  `tip_projekcije_id` INT NOT NULL,
  `vrijeme_prikazivanja` DATE NOT NULL,
  `akcija_id` INT NULL,
  `sala_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_projekcija_film_id_key_idx` (`film_id` ASC),
  INDEX `fk_projekcija_tip_projekcije_id_key_idx` (`tip_projekcije_id` ASC),
  INDEX `fk_projekcija_akcija_id_key_idx` (`akcija_id` ASC),
  INDEX `fk_projekcija_sala_id_key_idx` (`sala_id` ASC),
  CONSTRAINT `fk_projekcija_film_id_key`
    FOREIGN KEY (`film_id`)
    REFERENCES `bioskop`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projekcija_tip_projekcije_id_key`
    FOREIGN KEY (`tip_projekcije_id`)
    REFERENCES `bioskop`.`tip_projekcije` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projekcija_akcija_id_key`
    FOREIGN KEY (`akcija_id`)
    REFERENCES `bioskop`.`akcija` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projekcija_sala_id_key`
    FOREIGN KEY (`sala_id`)
    REFERENCES `bioskop`.`sala` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`dogadjaji`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`dogadjaji` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NOT NULL,
  `kategorija_id` INT NOT NULL,
  `opis` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dogadjaji_kategorija_id_key_idx` (`kategorija_id` ASC),
  CONSTRAINT `fk_dogadjaji_kategorija_id_key`
    FOREIGN KEY (`kategorija_id`)
    REFERENCES `bioskop`.`kategorija` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`vijesti`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`vijesti` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `kategorija_id` INT NOT NULL,
  `naslov` VARCHAR(128) NOT NULL,
  `opis` VARCHAR(255) NOT NULL,
  `vrijeme_objave` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_vijesti_kategorija_id_key_idx` (`kategorija_id` ASC),
  CONSTRAINT `fk_vijesti_kategorija_id_key`
    FOREIGN KEY (`kategorija_id`)
    REFERENCES `bioskop`.`kategorija` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`tip_kartice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`tip_kartice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `naziv` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`kartica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`kartica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tip_kartice_id` INT NOT NULL,
  `identifikator` VARCHAR(128) NOT NULL,
  `poeni` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_kartica_tip_kartice_id_key_idx` (`tip_kartice_id` ASC),
  CONSTRAINT `fk_kartica_tip_kartice_id_key`
    FOREIGN KEY (`tip_kartice_id`)
    REFERENCES `bioskop`.`tip_kartice` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`korisnik` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ime` VARCHAR(45) NOT NULL,
  `prezime` VARCHAR(45) NOT NULL,
  `email` VARCHAR(128) NOT NULL,
  `lozinka` VARCHAR(128) NOT NULL,
  `kartica_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `kartica_id_UNIQUE` (`kartica_id` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  CONSTRAINT `fk_korisnik_kartica_id_key`
    FOREIGN KEY (`kartica_id`)
    REFERENCES `bioskop`.`kartica` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`film_rejting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`film_rejting` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `film_id` INT NOT NULL,
  `rejting` INT NOT NULL,
  `korisnik_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_film_rejting_film_id_key_idx` (`film_id` ASC),
  INDEX `fk_film_rejting_korisnik_id_key_idx` (`korisnik_id` ASC),
  CONSTRAINT `fk_film_rejting_film_id_key`
    FOREIGN KEY (`film_id`)
    REFERENCES `bioskop`.`film` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_film_rejting_korisnik_id_key`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES `bioskop`.`korisnik` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`sala_red`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`sala_red` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sala_id` INT NOT NULL,
  `red` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sala_red_sala_id_key_idx` (`sala_id` ASC),
  CONSTRAINT `fk_sala_red_sala_id_key`
    FOREIGN KEY (`sala_id`)
    REFERENCES `bioskop`.`sala` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`sala_red_mjesto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`sala_red_mjesto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sala_red_id` INT NOT NULL,
  `mjesto` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_sala_red_mjesto_sala_red_id_key_idx` (`sala_red_id` ASC),
  CONSTRAINT `fk_sala_red_mjesto_sala_red_id_key`
    FOREIGN KEY (`sala_red_id`)
    REFERENCES `bioskop`.`sala_red` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `bioskop`.`rezervacija`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `bioskop`.`rezervacija` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sala_red_mjesto` INT NOT NULL,
  `korisnik_id` INT NOT NULL,
  `projekcija_id` INT NOT NULL,
  `kreirano` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_rezervacija_sala_red_mjesto_id_key_idx` (`sala_red_mjesto` ASC),
  INDEX `fk_rezervacija_korisnik_id_key_idx` (`korisnik_id` ASC),
  INDEX `fk_rezervacija_projekcija_id_key_idx` (`projekcija_id` ASC),
  CONSTRAINT `fk_rezervacija_sala_red_mjesto_id_key`
    FOREIGN KEY (`sala_red_mjesto`)
    REFERENCES `bioskop`.`sala_red_mjesto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rezervacija_korisnik_id_key`
    FOREIGN KEY (`korisnik_id`)
    REFERENCES `bioskop`.`korisnik` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_rezervacija_projekcija_id_key`
    FOREIGN KEY (`projekcija_id`)
    REFERENCES `bioskop`.`projekcija` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;