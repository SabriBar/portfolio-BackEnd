-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MiPortfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MiPortfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MiPortfolio` DEFAULT CHARACTER SET utf8 ;
USE `MiPortfolio` ;

-- -----------------------------------------------------
-- Table `MiPortfolio`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiPortfolio`.`PERSONA` (
  `id_persona` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `acerca_de_mi` VARCHAR(225) NULL,
  `nacimiento` DATE NULL,
  `titulo` VARCHAR(45) NULL,
  `foto` VARCHAR(225) NULL,
  `mail` VARCHAR(45) NULL,
  `domicilio` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  PRIMARY KEY (`id_persona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiPortfolio`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiPortfolio`.`USUARIO` (
  `id_usuario` INT NOT NULL,
  `nombre_usuario` VARCHAR(25) BINARY NULL,
  `contraseña` VARCHAR(32) BINARY NULL,
  `PERSONA_id_persona` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `PERSONA_id_persona`),
  INDEX `fk_USUARIO_PERSONA_idx` (`PERSONA_id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_USUARIO_PERSONA`
    FOREIGN KEY (`PERSONA_id_persona`)
    REFERENCES `MiPortfolio`.`PERSONA` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiPortfolio`.`EXPERIENCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiPortfolio`.`EXPERIENCIA` (
  `id_experiencia` INT NOT NULL,
  `nombre_empresa` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_finalizacion` DATE NULL,
  `descripcion` VARCHAR(100) NULL,
  `PERSONA_id_persona` INT NOT NULL,
  PRIMARY KEY (`id_experiencia`, `PERSONA_id_persona`),
  INDEX `fk_EXPERIENCIA_PERSONA1_idx` (`PERSONA_id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_EXPERIENCIA_PERSONA1`
    FOREIGN KEY (`PERSONA_id_persona`)
    REFERENCES `MiPortfolio`.`PERSONA` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiPortfolio`.`TIPO_EDUCACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiPortfolio`.`TIPO_EDUCACION` (
  `id_tipo` INT NOT NULL,
  `tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id_tipo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiPortfolio`.`EDUCACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiPortfolio`.`EDUCACION` (
  `id_educacion` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `nombre_institucion` VARCHAR(45) NULL,
  `fecha_inicio` DATE NULL,
  `fecha_finalizacion` DATE NULL,
  `en_curso` TINYINT NULL,
  `certificado` VARCHAR(225) NULL,
  `logo` VARCHAR(225) NULL,
  `PERSONA_id_persona` INT NOT NULL,
  `TIPO_EDUCACION_id_tipo` INT NOT NULL,
  PRIMARY KEY (`id_educacion`, `PERSONA_id_persona`, `TIPO_EDUCACION_id_tipo`),
  INDEX `fk_EDUCACION_PERSONA1_idx` (`PERSONA_id_persona` ASC) VISIBLE,
  INDEX `fk_EDUCACION_TIPO_EDUCACION1_idx` (`TIPO_EDUCACION_id_tipo` ASC) VISIBLE,
  CONSTRAINT `fk_EDUCACION_PERSONA1`
    FOREIGN KEY (`PERSONA_id_persona`)
    REFERENCES `MiPortfolio`.`PERSONA` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EDUCACION_TIPO_EDUCACION1`
    FOREIGN KEY (`TIPO_EDUCACION_id_tipo`)
    REFERENCES `MiPortfolio`.`TIPO_EDUCACION` (`id_tipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiPortfolio`.`SKILLS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiPortfolio`.`SKILLS` (
  `id_skills` INT NOT NULL,
  `habilidad` VARCHAR(45) NULL,
  `porcentaje` VARCHAR(45) NULL,
  `PERSONA_id_persona` INT NOT NULL,
  PRIMARY KEY (`id_skills`, `PERSONA_id_persona`),
  INDEX `fk_SKILLS_PERSONA1_idx` (`PERSONA_id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_SKILLS_PERSONA1`
    FOREIGN KEY (`PERSONA_id_persona`)
    REFERENCES `MiPortfolio`.`PERSONA` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MiPortfolio`.`PROYECTOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MiPortfolio`.`PROYECTOS` (
  `id_proyectos` INT NOT NULL,
  `titulo` VARCHAR(45) NULL,
  `fecha` DATE NULL,
  `descripcion` VARCHAR(225) NULL,
  `link` VARCHAR(225) NULL,
  `PERSONA_id_persona` INT NOT NULL,
  PRIMARY KEY (`id_proyectos`, `PERSONA_id_persona`),
  INDEX `fk_PROYECTOS_PERSONA1_idx` (`PERSONA_id_persona` ASC) VISIBLE,
  CONSTRAINT `fk_PROYECTOS_PERSONA1`
    FOREIGN KEY (`PERSONA_id_persona`)
    REFERENCES `MiPortfolio`.`PERSONA` (`id_persona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
