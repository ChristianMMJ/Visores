USE `ayr`;
DROP procedure IF EXISTS `SP_EMPRESAS_SUPERVISORAS`;

DELIMITER $$
USE `ayr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EMPRESAS_SUPERVISORAS`()
BEGIN 
	 SELECT 
     ES.ID,ES.Nombre as Empresa
     FROM empresassupervisoras AS ES
     WHERE ES.Estatus = 'Activo';
    
END$$

DELIMITER ;	



