

use ayr;


SELECT T.FechaCreacion, T.FolioCliente, T.Importe, CTE.Nombre AS Cliente, S.CR, S.Nombre 
AS Sucursal, E.Nombre AS Empresa, CTE.RutaLogo AS LogoCliente, PC.Clave, 
TD.Unidad, TD.Cantidad, TD.Precio,PCAT.Descripcion AS Categoria, PC.Descripcion AS Concepto,TD.PreciarioConcepto_ID AS ConceptoId, 
CONCAT(S.Calle,' ',ifnull(S.NoExterior,''),' ',ifnull(S.NoInterior,''),' ',
ifnull(S.Colonia,''),', ',ifnull(S.Ciudad,''),', ',ifnull(S.Estado,'')) AS Direccion
FROM TRABAJOS T 
INNER JOIN clientes CTE ON CTE.ID = T.Cliente_ID 
INNER JOIN sucursales S ON S.ID = T.Sucursal_ID 
INNER JOIN trabajosdetalle TD ON TD.Trabajo_ID = T.ID 
left JOIN preciarios PRE ON PRE.ID = T.Preciario_ID 
left JOIN preciarioconceptos PC ON PC.ID = TD.PreciarioConcepto_ID 
left JOIN preciariocategorias PCAT ON PCAT.ID = PC.PreciarioCategorias_ID 
left JOIN empresas E ON E.id = S.Empresa_ID
WHERE T.Estatus IN('Borrador', 'Concluido')
AND T.ID = 53
