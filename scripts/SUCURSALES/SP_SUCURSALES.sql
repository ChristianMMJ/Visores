USE `ayr`;
DROP procedure IF EXISTS `SP_SUCURSALES`;

DELIMITER $$
USE `ayr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SUCURSALES`()
BEGIN 
	 SELECT S.ID, S.CR AS CR,S.Nombre as "Sucursal" , S.Region AS "Región", C.Nombre AS "Cliente"
     FROM sucursales AS S
     INNER JOIN Clientes C 
     ON C.ID = S.Cliente_ID
     ;
    
END$$

DELIMITER ;	



