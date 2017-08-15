SELECT T.Movimiento,T.FechaCreacion,T.FolioCliente,T.ImpactoEnPlazo,T.DiasImpacto,T.CausaTrabajo,T.ClaveOrigenTrabajo,
T.EspecificaOrigenTrabajo,T.DescripcionOrigenTrabajo,T.DescripcionRiesgoTrabajo,T.DescripcionAlcanceTrabajo,T.Importe,
CTE.Nombre,CTE.NombreCorto,S.CR,S.Nombre,S.TipoConcepto,S.TipoObra,S.Contrato,S.FechaInicio,S.FechaFin, E.Nombre, ES.Nombre,CTE.RutaLogo
FROM TRABAJOS T
INNER JOIN clientes CTE ON CTE.ID =  T.Cliente_ID 
INNER JOIN sucursales S ON S.ID  = T.Sucursal_ID
LEFT JOIN empresassupervisoras ES ON ES.ID = S.EmpresaSupervisora_ID
LEFT JOIN empresas E ON E.id = S.Empresa_ID
WHERE T.Estatus IN ('Borrador','Concluido') ;
