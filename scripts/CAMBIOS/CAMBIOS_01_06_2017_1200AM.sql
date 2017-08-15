/*10 05 2017*/

ALTER TABLE `ayr`.`usuarios` 
CHANGE COLUMN `Estatus` `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO' ;


ALTER TABLE `ayr`.`empresas` 
ADD COLUMN `Estatus` VARCHAR(45) NULL AFTER `Estado`,
ADD COLUMN `Registro` VARCHAR(45) NULL AFTER `Estatus`;

UPDATE `ayr`.`empresas` SET Estatus = 'ACTIVO' WHERE ID > 0;
ALTER TABLE `ayr`.`empresas` 
CHANGE COLUMN `Estatus` `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO' ;

ALTER TABLE `ayr`.`Cuadrillas` 
ADD COLUMN `Estatus`  VARCHAR(45) NOT NULL DEFAULT 'ACTIVO' ;

ALTER TABLE `ayr`.`preciarios` 
CHANGE COLUMN `EstaActivo` `Estatus` VARCHAR(45) NULL DEFAULT 'ACTIVO' ;

ALTER TABLE `ayr`.`preciarios` 
DROP COLUMN `Preciarioscol`;

ALTER TABLE `ayr`.`clientes` 
ADD COLUMN `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO' AFTER `Contacto3`,
ADD COLUMN `Registro` VARCHAR(45) NULL AFTER `Estatus`;

ALTER TABLE `ayr`.`empresassupervisoras` 
ADD COLUMN `Estatus`  VARCHAR(45) NOT NULL DEFAULT 'ACTIVO' ;

/*13 05 2017 12:00 am*/
ALTER TABLE `ayr`.`sucursales` 
DROP FOREIGN KEY `fk_Sucursales_Clientes1`,
DROP FOREIGN KEY `fk_Sucursales_Empresas1`,
DROP FOREIGN KEY `fk_Sucursales_EmpresasSupervisoras1`;
ALTER TABLE `ayr`.`sucursales` 
CHANGE COLUMN `Cliente_ID` `Cliente_ID` INT(11) NULL ,
CHANGE COLUMN `Empresa_ID` `Empresa_ID` INT(11) NULL ,
CHANGE COLUMN `EmpresaSupervisora_ID` `EmpresaSupervisora_ID` INT(11) NULL ;
ALTER TABLE `ayr`.`sucursales` 
ADD CONSTRAINT `fk_Sucursales_Clientes1`
  FOREIGN KEY (`Cliente_ID`)
  REFERENCES `ayr`.`clientes` (`ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Sucursales_Empresas1`
  FOREIGN KEY (`Empresa_ID`)
  REFERENCES `ayr`.`empresas` (`ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Sucursales_EmpresasSupervisoras1`
  FOREIGN KEY (`EmpresaSupervisora_ID`)
  REFERENCES `ayr`.`empresassupervisoras` (`ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


ALTER TABLE `ayr`.`sucursales` 
ADD COLUMN `EntreCalles` VARCHAR(150) NULL AFTER `NoInterior`;


/*TRABAJOS DETALLE - GENERADOR (FOTOS) (01/06/2017)*/
CREATE TABLE `ayr`.`trabajodetallefotos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `IdTrabajo` INT(12) NULL,
  `IdTrabajoDetalle` INT(12) NULL,
  `Url` VARCHAR(945) NULL,
  `Observaciones` VARCHAR(945) NULL,
  `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO',
  `Registro` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));
  
/*TRABAJOS DETALLE - GENERADOR (CROQUIS) (01/06/2017)*/
CREATE TABLE `ayr`.`trabajodetalleCroquis` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `IdTrabajo` INT(12) NULL,
  `IdTrabajoDetalle` INT(12) NULL,
  `Url` VARCHAR(945) NULL,
  `Observaciones` VARCHAR(945) NULL,
  `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO',
  `Registro` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));
  
/*TRABAJOS DETALLE - GENERADOR (FACTURAS) (01/06/2017)*/
CREATE TABLE `ayr`.`trabajodetalleAnexos` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `IdTrabajo` INT(12) NULL,
  `IdTrabajoDetalle` INT(12) NULL,
  `Url` VARCHAR(945) NULL,
  `Observaciones` VARCHAR(945) NULL,
  `Estatus` VARCHAR(45) NOT NULL DEFAULT 'ACTIVO',
  `Registro` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`));


ALTER TABLE `ayr`.`generadortrabajosdetalle` 
ADD COLUMN `IdTrabajoDetalle` INT(25) NULL AFTER `Total`;


/*Entregas Encbezado*/
CREATE TABLE `entregas` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  
`Movimiento` varchar(45) DEFAULT NULL,
 
`FechaCreacion` varchar(45) DEFAULT NULL,
  
`NoEntrega` varchar(45) DEFAULT NULL,
  
`Estatus` varchar(45) DEFAULT 'Activo',
  
`Cliente_ID` int(11) DEFAULT NULL,
  
`Clasificacion` varchar(45) DEFAULT NULL,
  
`Importe` decimal(14,6) DEFAULT NULL,
  
`Usuario_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) 


