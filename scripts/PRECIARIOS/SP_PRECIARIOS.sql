USE `ayr`;
DROP procedure IF EXISTS `SP_PRECIARIOS`;

DELIMITER $$
USE `ayr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PRECIARIOS`()
BEGIN 
	 SELECT 
     P.ID, P.Nombre AS Nombre, P.Tipo AS Tipo, P.FechaCreacion AS "Fecha de Creación", 
     (CASE 
     WHEN P.Cliente_ID IS NULL THEN "No especifica"
     ELSE (SELECT C.Nombre FROM Clientes AS C WHERE C.ID = P.Cliente_ID)
     END) AS Cliente
     FROM preciarios AS P
     WHERE P.Estatus IN('Activo');
END$$

DELIMITER ;	

