-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema geek
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema geek
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `geek` ;
USE `geek` ;

-- -----------------------------------------------------
-- Table `geek`.`tipos_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek`.`tipos_produto` (
  `id_tipos_produto` INT NOT NULL AUTO_INCREMENT,
  `tipos` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_tipos_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geek`.`fabricantes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek`.`fabricantes` (
  `id_fabricante` INT NOT NULL AUTO_INCREMENT,
  `fabricante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fabricante`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geek`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek`.`produtos` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `produto` VARCHAR(45) NOT NULL,
  `designacao` VARCHAR(200) NOT NULL,
  `composicao` VARCHAR(200) NOT NULL,
  `preco_venda` DECIMAL(8,2) NOT NULL,
  `id_tipos_produto` INT NOT NULL,
  `id_fabricantes` INT NOT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `fk_tipos_produtos_idx` (`id_tipos_produto` ASC),
  INDEX `fk_fabricantes_idx` (`id_fabricantes` ASC),
  CONSTRAINT `fk_tipos_produtos`
    FOREIGN KEY (`id_tipos_produto`)
    REFERENCES `geek`.`tipos_produto` (`id_tipos_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fabricantes`
    FOREIGN KEY (`id_fabricantes`)
    REFERENCES `geek`.`fabricantes` (`id_fabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geek`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek`.`clientes` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome_cliente` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` VARCHAR(15) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geek`.`compras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek`.`compras` (
  `id_compra` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `data_compra` DATE NOT NULL,
  PRIMARY KEY (`id_compra`),
  INDEX `fk_clientes_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_clientes`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `geek`.`clientes` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geek`.`compras_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek`.`compras_produtos` (
  `id_compras_produto` INT NOT NULL AUTO_INCREMENT,
  `id_compra` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id_compras_produto`),
  INDEX `fk_compras_has_produtos_produtos1_idx` (`id_produto` ASC),
  INDEX `fk_compras_has_produtos_compras1_idx` (`id_compra` ASC),
  CONSTRAINT `fk_compras_has_produtos_compras1`
    FOREIGN KEY (`id_compra`)
    REFERENCES `geek`.`compras` (`id_compra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_compras_has_produtos_produtos1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `geek`.`produtos` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geek`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek`.`medicos` (
  `id_medico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `crm` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_medico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geek`.`receitas_medica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geek`.`receitas_medica` (
  `id_receitas_medica` INT NOT NULL AUTO_INCREMENT,
  `id_compras_produto` INT NOT NULL,
  `id_medico` INT NOT NULL,
  `receita` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id_receitas_medica`),
  INDEX `fk_compras_produtos_idx` (`id_compras_produto` ASC),
  INDEX `fk_medico_idx` (`id_medico` ASC) VISIBLE,
  CONSTRAINT `fk_compras_produtos`
    FOREIGN KEY (`id_compras_produto`)
    REFERENCES `geek`.`compras_produtos` (`id_compras_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_medico`
    FOREIGN KEY (`id_medico`)
    REFERENCES `geek`.`medicos` (`id_medico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
