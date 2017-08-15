

use ayr;


SELECT GTD.Concepto_ID,
GTD.Area,GTD.Eje,GTD.EntreEje1,GTD.EntreEje2,GTD.Largo,GTD.Ancho,GTD.Alto,GTD.Cantidad,GTD.Total
FROM TRABAJOS T 
INNER JOIN trabajosdetalle TD ON TD.Trabajo_ID = T.ID 
left join generadortrabajosdetalle GTD ON GTD.Concepto_ID = TD.PreciarioConcepto_ID 
WHERE T.Estatus IN('Borrador', 'Concluido')
AND T.ID = 53
