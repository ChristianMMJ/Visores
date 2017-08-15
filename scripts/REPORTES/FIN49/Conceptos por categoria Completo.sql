
SELECT T.Movimiento,T.FechaCreacion,T.FolioCliente,T.Importe,
CTE.Nombre,S.CR,S.Nombre, E.Nombre,E.RutaLogo,CTE.RutaLogo,
T.PRECIARIO_ID,PC.Clave,TD.Unidad,TD.Cantidad,TD.Precio,TD.IntExt,TD.Importe AS ImporteRenglon,
PCAT.Descripcion AS Categoria
FROM TRABAJOS T
INNER JOIN clientes CTE ON CTE.ID =  T.Cliente_ID 
INNER JOIN sucursales S ON S.ID  = T.Sucursal_ID
INNER JOIN trabajosdetalle TD ON TD.Trabajo_ID = T.ID 
INNER JOIN preciarios PRE ON PRE.ID = T.Preciario_ID
INNER JOIN preciarioconceptos PC ON PC.ID = TD.PreciarioConcepto_ID
INNER JOIN preciariocategorias PCAT ON PCAT.ID = PC.PreciarioCategorias_ID
INNER JOIN empresas E ON E.id = S.Empresa_ID
WHERE T.Estatus IN ('Borrador','Concluido') 
AND T.ID =53 ;
