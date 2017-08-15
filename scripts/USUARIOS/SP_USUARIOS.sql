USE `ayr`;
DROP procedure IF EXISTS `SP_USUARIOS`;

DELIMITER $$
USE `ayr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_USUARIOS`()
BEGIN 
	 SELECT 
     ID,  CONCAT(U.Nombre, ' ', U.Apellidos) AS "Nombre", u.Estatus, U.TipoAcceso AS "Acceso" ,
     (CASE 
     WHEN U.Empresa_ID IS NULL THEN "No especifico"
     ELSE (SELECT E.Nombre FROM empresas AS E WHERE E.ID = U.Empresa_ID)
     END) AS Empresa
     
     FROM Usuarios AS U
     WHERE U.Estatus IN('Activo');
END$$

DELIMITER ;

