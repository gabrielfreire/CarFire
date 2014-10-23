-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema carfire
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema carfire
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carfire` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `carfire` ;

-- -----------------------------------------------------
-- Table `carfire`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`veiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `chassi` VARCHAR(45) NULL,
  `placa` VARCHAR(45) NULL,
  `km` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `marca` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NULL,
  `fabricante` VARCHAR(45) NULL,
  `tarifa` VARCHAR(45) NULL,
  `taxa` VARCHAR(45) NULL,
  `combustivel` VARCHAR(45) NULL,
  `portas` INT(1) NULL,
  `ano_modelo` INT(4) NULL,
  `cor` VARCHAR(45) NULL,
  `renavam` VARCHAR(45) NULL,
  `descricao` VARCHAR(100) NULL,
  `disponivel` TINYINT(1) NULL,
  `estoque` VARCHAR(45) NULL,
  `observacoes` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carfire`.`cliente_pf`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`cliente_pf` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  `cpf` BIGINT(11) NULL,
  `nome` VARCHAR(45) NULL,
  `rg` VARCHAR(45) NULL,
  `habilitacao` VARCHAR(45) NULL,
  `data_nascimento` VARCHAR(45) NULL,
  `genero` CHAR(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carfire`.`cliente_pj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`cliente_pj` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  `cnpj` BIGINT(14) NULL,
  `razao_social` VARCHAR(45) NULL,
  `nome_comercial` VARCHAR(45) NULL,
  `inscricao_estadual` VARCHAR(45) NULL,
  `data_fundacao` VARCHAR(45) NULL,
  `numero_funcionarios` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carfire`.`pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`pagamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carfire`.`devolucao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`devolucao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carfire`.`reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`reserva` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carfire`.`emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`emprestimo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pagamento_id` INT NULL,
  `devolucao_id` INT NULL,
  `reserva_id` INT NULL,
  `cliente_pf_id` INT NULL,
  `cliente_pj_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_emprestimo_pagamento1_idx` (`pagamento_id` ASC),
  INDEX `fk_emprestimo_cliente_pj1_idx` (`cliente_pj_id` ASC),
  INDEX `fk_emprestimo_pj_devolucao1_idx` (`devolucao_id` ASC),
  INDEX `fk_emprestimo_pj_reserva1_idx` (`reserva_id` ASC),
  INDEX `fk_emprestimo_cliente_pf1_idx` (`cliente_pf_id` ASC),
  CONSTRAINT `fk_emprestimo_pagamento1`
    FOREIGN KEY (`pagamento_id`)
    REFERENCES `carfire`.`pagamento` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimo_cliente_pj1`
    FOREIGN KEY (`cliente_pj_id`)
    REFERENCES `carfire`.`cliente_pj` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimo_pj_devolucao1`
    FOREIGN KEY (`devolucao_id`)
    REFERENCES `carfire`.`devolucao` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimo_pj_reserva1`
    FOREIGN KEY (`reserva_id`)
    REFERENCES `carfire`.`reserva` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimo_cliente_pf1`
    FOREIGN KEY (`cliente_pf_id`)
    REFERENCES `carfire`.`cliente_pf` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carfire`.`itens_emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`itens_emprestimo` (
  `emprestimo_id` INT NULL,
  `veiculo_id` INT NULL,
  INDEX `fk_itens_emprestimo_veiculo1_idx` (`veiculo_id` ASC),
  INDEX `fk_itens_emprestimo_emprestimo_pj1_idx` (`emprestimo_id` ASC),
  CONSTRAINT `fk_itens_emprestimo_veiculo1`
    FOREIGN KEY (`veiculo_id`)
    REFERENCES `carfire`.`veiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_emprestimo_emprestimo_pj1`
    FOREIGN KEY (`emprestimo_id`)
    REFERENCES `carfire`.`emprestimo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carfire`.`agencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`agencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carfire`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carfire`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Dados para teste
-- -----------------------------------------------------
insert into `locacao`.`usuario`(nome, email, senha) values("Gabriel", "gabriel@provedor.com", "123");