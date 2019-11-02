-- MySQL Script generated by MySQL Workbench
-- Sat Nov  2 16:42:44 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mpmg
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mpmg` ;

-- -----------------------------------------------------
-- Schema mpmg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mpmg` DEFAULT CHARACTER SET utf8 ;
USE `mpmg` ;

-- -----------------------------------------------------
-- Table `mpmg`.`Municipio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`Municipio` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`Municipio` (
  `id_municipio` INT NOT NULL,
  `nome_municipio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_municipio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mpmg`.`TabelaUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`TabelaUsuario` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`TabelaUsuario` (
  `sgdp` INT NOT NULL COMMENT 'Código identificador da tabela.\n',
  `id_municipio_refente` INT NOT NULL,
  `id_municipio` INT NOT NULL,
  `dt_geracao` DATE NOT NULL,
  `ano_referente` VARCHAR(4) NOT NULL,
  `titulo_aba_1` VARCHAR(120) NOT NULL,
  `titulo_aba_2` VARCHAR(120) NOT NULL,
  `titulo_aba_3` VARCHAR(120) NOT NULL,
  `analista_resp` VARCHAR(90) NULL,
  PRIMARY KEY (`sgdp`),
  CONSTRAINT `fk_TabelaUsuario_Municipio1`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `mpmg`.`Municipio` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TabelaUsuario_Municipio2`
    FOREIGN KEY (`id_municipio_refente`)
    REFERENCES `mpmg`.`Municipio` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mpmg`.`UploadANP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`UploadANP` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`UploadANP` (
  `id_upload_anp` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_upload_anp`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mpmg`.`TabelaANP`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`TabelaANP` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`TabelaANP` (
  `id_municipio` INT NOT NULL,
  `mes` CHAR(2) NOT NULL,
  `ano` CHAR(4) NOT NULL,
  `id_upload_anp` INT NULL,
  `produto` VARCHAR(45) NOT NULL,
  `preco_medio_revenda` DECIMAL(7,3) NOT NULL,
  `preco_maximo_revenda` DECIMAL(7,3) NOT NULL,
  `preco_minimo_revenda` DECIMAL(7,3) NOT NULL,
  `dt_vigencia_municipio_anp` DATE NULL,
  PRIMARY KEY (`id_municipio`, `mes`, `ano`, `produto`),
  CONSTRAINT `fk_TabelaANP_Municipio1`
    FOREIGN KEY (`id_municipio`)
    REFERENCES `mpmg`.`Municipio` (`id_municipio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TabelaANP_UploadANP1`
    FOREIGN KEY (`id_upload_anp`)
    REFERENCES `mpmg`.`UploadANP` (`id_upload_anp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mpmg`.`Departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`Departamento` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`Departamento` (
  `id_dpto` INT NOT NULL,
  `nome_dpto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_dpto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mpmg`.`UploadTabelaFAM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`UploadTabelaFAM` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`UploadTabelaFAM` (
  `id_upload` INT NOT NULL,
  `dt_upload` DATE NULL,
  PRIMARY KEY (`id_upload`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mpmg`.`TabelaFAM`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`TabelaFAM` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`TabelaFAM` (
  `mes` CHAR(2) NOT NULL,
  `ano` CHAR(4) NOT NULL,
  `id_upload` INT NOT NULL,
  `valor_fam` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mes`, `ano`),
  CONSTRAINT `fk_TabelaFAM_UploadTabelaFAM1`
    FOREIGN KEY (`id_upload`)
    REFERENCES `mpmg`.`UploadTabelaFAM` (`id_upload`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mpmg`.`NotaFiscal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`NotaFiscal` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`NotaFiscal` (
  `id_nota_fiscal` INT NOT NULL,
  `sgdp` INT NOT NULL,
  `id_dpto` INT NOT NULL,
  `mes_fam` CHAR(2) NOT NULL,
  `ano_fam` CHAR(4) NOT NULL,
  `dt_emissao` DATE NOT NULL,
  `mes_consulta_anp` CHAR(2) NOT NULL,
  `ano_consulta_anp` CHAR(4) NOT NULL,
  `vrtotal` DECIMAL(7,3) NOT NULL,
  `valor_fam` DECIMAL(7,3) NOT NULL,
  `preco_medio_revenda` DECIMAL(7,3) NOT NULL,
  `preco_maximo_revenda` DECIMAL(7,3) NOT NULL,
  `preco_minimo_revenda` DECIMAL(7,3) NOT NULL,
  `dt_consulta_anp` DATE NOT NULL,
  `nro_folha` INT NULL,
  `veiculo` VARCHAR(50) NULL,
  `placa_veiculo` VARCHAR(7) NULL,
  PRIMARY KEY (`id_nota_fiscal`),
  CONSTRAINT `fk_NotaFiscal_TabelaUsuario1`
    FOREIGN KEY (`sgdp`)
    REFERENCES `mpmg`.`TabelaUsuario` (`sgdp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotaFiscal_Departamento1`
    FOREIGN KEY (`id_dpto`)
    REFERENCES `mpmg`.`Departamento` (`id_dpto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotaFiscal_TabelaFAM1`
    FOREIGN KEY (`mes_fam` , `ano_fam`)
    REFERENCES `mpmg`.`TabelaFAM` (`mes` , `ano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mpmg`.`CupomFiscal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`CupomFiscal` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`CupomFiscal` (
  `coo` VARCHAR(45) NOT NULL,
  `sgdp` INT NOT NULL,
  `id_nota_fiscal` INT NULL,
  `ecf` VARCHAR(45) NULL,
  `posto_referente` VARCHAR(90) NULL,
  `hodometro` INT NULL,
  `cliente` VARCHAR(90) NULL,
  `dt_emissao` DATETIME NULL,
  `qtd` INT NULL,
  `vr_unitario` DECIMAL(7,2) NULL,
  PRIMARY KEY (`coo`),
  CONSTRAINT `fk_CupomFiscal_NotaFiscal1`
    FOREIGN KEY (`id_nota_fiscal`)
    REFERENCES `mpmg`.`NotaFiscal` (`id_nota_fiscal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CupomFiscal_TabelaUsuario1`
    FOREIGN KEY (`sgdp`)
    REFERENCES `mpmg`.`TabelaUsuario` (`sgdp`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mpmg`.`ItemNotaFiscal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mpmg`.`ItemNotaFiscal` ;

CREATE TABLE IF NOT EXISTS `mpmg`.`ItemNotaFiscal` (
  `id_nota_fiscal` INT NOT NULL,
  `id_item` INT NOT NULL,
  `vrunitario` DECIMAL(7,2) NOT NULL,
  `id_tipo_combustivel` VARCHAR(45) NOT NULL,
  `qtde` INT NOT NULL,
  PRIMARY KEY (`id_nota_fiscal`, `id_item`),
  CONSTRAINT `fk_ItemNF_NF1`
    FOREIGN KEY (`id_nota_fiscal`)
    REFERENCES `mpmg`.`NotaFiscal` (`id_nota_fiscal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
