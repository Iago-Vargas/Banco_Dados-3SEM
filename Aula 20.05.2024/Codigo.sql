
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departamento` (
  `idDepartamento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `localizacao` VARCHAR(45) NOT NULL,
  `orcamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empregado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empregado` (
  `idEmpregado` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `idGerente` INT NULL,
  `funcao` VARCHAR(45) NULL,
  `Departamento_idDepartamento` INT NOT NULL,
  `dataAdmissao` DATE NOT NULL,
  `salario` INT NULL,
  `comissao` INT NULL,
  PRIMARY KEY (`idEmpregado`, `Departamento_idDepartamento`),
  INDEX `fk_Empregado_Departamento_idx` (`Departamento_idDepartamento` ASC),
  CONSTRAINT `fk_Empregado_Departamento`
    FOREIGN KEY (`Departamento_idDepartamento`)
    REFERENCES `mydb`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


=======================================================

INSERT INTO Departamento VALUES("1","Banco de Dados","Porto Alegre","2346");
INSERT INTO Departamento VALUES("2","Balconistas","Pelotas","10000");
INSERT INTO Departamento VALUES("3","Inteligência Artific","Pelotas","333");
INSERT INTO Departamento VALUES("4","Compiladores","Novo Hamburgo","5050");
INSERT INTO Departamento VALUES("5","Redes","Taquara","12122");

INSERT INTO Empregado VALUES("1","Mariewa",NULL,"Gerente","1","2000-04-05","2300","0");
INSERT INTO Empregado VALUES("2","Zico","1","Operário","1","1999-08-13","100","0");
INSERT INTO Empregado VALUES("3","Lula",NULL,"Presidente","5","1950-01-01","10000","0");
INSERT INTO Empregado VALUES("4","Vera Fixer","5","Balconista","2","1999-05-05","3300","0");
INSERT INTO Empregado VALUES("5","Luana Pyovany",NULL,"Gerente","2","1998-06-23","2300","0");
INSERT INTO Empregado VALUES("6","Daniela Schicarelli",NULL,"Gerente","3","1999-10-10","2300","0");
INSERT INTO Empregado VALUES("7","Luize Altenhofen",NULL,"Gerente","4","1999-04-26","2300","0");
INSERT INTO Empregado VALUES("8","Helo Pinheiro",NULL,"Gerente","5","1997-09-25","2300","0");
INSERT INTO Empregado VALUES("9","Pelé","1","Operário","1","2000-09-09","100",NULL);
INSERT INTO Empregado VALUES("10","Romário","1","Operário","5","2001-12-25","100","0");
INSERT INTO Empregado VALUES("11","Malu Mader","5","Balconista","2","2001-10-20","3400","0");
INSERT INTO Empregado VALUES("12","Antônio Fagundes","7","Vendedor","3","2002-12-22","5000","10");
