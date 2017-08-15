USE `ayr`;
DROP procedure IF EXISTS `SP_EMPRESAS`;

DELIMITER $$
USE `ayr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EMPRESAS`()
BEGIN 
	 SELECT 
     E.ID, E.Nombre AS Nombre, E.Rfc AS RFC, 
     CONCAT(E.ContactoNombre ,' ',E.ContactoApellidos) AS "Contacto "
     FROM Empresas AS E
     WHERE E.Estatus IN('Activo');
END$$

DELIMITER ;	

