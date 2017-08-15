USE `ayr`;
DROP procedure IF EXISTS `SP_ENTREGADO`;

DELIMITER $$
USE `ayr`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ENTREGADO`(IN ID_Entrega_APP INT)
BEGIN 
	UPDATE trabajos T,
(   SELECT  Trabajo_ID TID
    FROM EntregasDetalle 
    JOIN entregas on entregas.ID = entregasdetalle.Entrega_ID
    where entregas.ID = ID_Entrega_APP
) ED
SET T.Estatus = 'Entregado'
WHERE T.ID = ED.TID;
END$$

DELIMITER ;
