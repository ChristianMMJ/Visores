USE `ayr`;
DROP procedure IF EXISTS `SP_CLIENTES`;

DELIMITER $$
USE `ayr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CLIENTES`()
BEGIN 
	 SELECT C.ID, C.Nombre 
     FROM Clientes AS C
     WHERE C.Estatus='Activo'
     ORDER BY C.ID ASC;
    
END$$

DELIMITER ;	



