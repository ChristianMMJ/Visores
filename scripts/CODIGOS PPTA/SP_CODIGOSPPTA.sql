USE `ayr`;
DROP procedure IF EXISTS `SP_CODIGOSPPTA`;

DELIMITER $$
USE `ayr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CODIGOSPPTA`()
BEGIN 
	 SELECT 
     CP.ID, CP.Codigo AS "Código", CP.DIAS AS "Días de Atención"
     FROM CodigosPPTA AS CP;
    
END$$

DELIMITER ;	



