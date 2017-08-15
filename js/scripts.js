/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*******************************************************************************
 * VAR FOR TEMPORAL DATA
 *******************************************************************************/
var temp = 0;

/*******************************************************************************
 * EVENT FOR CLICK ROW
 *******************************************************************************/
var selected = [];

/*******************************************************************************
 * OPTIONS FOR TABLES
 *******************************************************************************/

var tableOptions = {
    "dom": 'Bfrtip',
    buttons: [
//        {
//            extend: 'copyHtml5',
//            text: '<span data-tooltip="Copiar Registros"><spam class="fa fa-clipboard CustomIconsForDataTable"></spam></spam>',
//            message: 'COPIADO',
//            exportOptions: {
//                modifier: {
//                    page: 'current'
//                },
//                columns: ':visible'
//            }
//        },
        {
            extend: 'excelHtml5',
            text: '<span  data-tooltip="Exportar a Excel"><span class="fa fa-file-excel-o CustomIconsForDataTable"></span></span>',
            exportOptions: {
                columns: ':visible'
            }
        },

//        {
//            extend: 'csvHtml5',
//            text: '<span class="fa fa-table"></span><h6>CSV</h6>',
//            exportOptions: {
//                modifier: {
//                    page: 'current'
//                },
//                columns: ':visible'
//            }
//        },
//        {
//            extend: 'pdfHtml5',
//            text: '<span  data-tooltip="Exportar a PDF"><span class="fa fa-file-pdf-o CustomIconsForDataTable"></span></span>',
//            orientation: 'landscape',
//            pageSize: 'LEGAL',
//            exportOptions: {
//                columns: ':visible'
//            }
//        },
//        {
//            extend: 'print',
//            customize: function (win) {
//                $(win.document.body)
//                        .css('font-size', '10pt')
//                        .prepend('<img src="' + base_url + '/media/log_1o.png" style="width:25%;heigth:25%; position:absolute; top:0; left:30%;" />');
//                $(win.document.body).find('table').addClass('compact')
//                        .css('font-size', 'inherit').css('margin-top', '500px');
//            },
//            text: '<span class="fa fa-eye"></span><h6>VISTA PREVIA</h6>',
//            exportOptions: { 
//                columns: ':visible'
//            }
//        },
//        {
//            extend: 'pdfHtml5',
//            text: '<span class="fa fa-asterisk"></span><h6>PDF</h6>',
//            orientation: 'landscape',
//            pageSize: 'LEGAL',
//            exportOptions: {
//                columns: ':visible'
//            }
//        },
        {
            extend: 'colvis',
            text: '<span  data-tooltip="Columnas"><span class="fa fa-columns CustomIconsForDataTable"></span></span>',
            exportOptions: {
                modifier: {
                    page: 'current'
                },
                columns: ':visible'
            }
        }
//        {
//            extend: 'print',
//            text: '<span class="fa fa-check"></span><h6>SELECCIONADOS</h6>',
//            exportOptions: {
//                modifier: {
//                    selected: true
//                }
//            }
//        }
    ],
    language: {
        processing: "Proceso en curso...",
        search: "Buscar:",
        lengthMenu: "Mostrar _MENU_ Elementos",
        info: "Mostrando  _START_ de _END_ , de _TOTAL_ Elementos.",
        infoEmpty: "Mostrando 0 de 0 A 0 Elementos.",
        infoFiltered: "(Filtrando un total _MAX_ Elementos. )",
        infoPostFix: "",
        loadingRecords: "Procesando los datos...",
        zeroRecords: "No se encontro nada.",
        emptyTable: "No existen datos en la tabla.",
        paginate: {
            first: "Primero",
            previous: "Anterior",
            next: "Siguiente",
            last: "&Uacute;ltimo"
        },
        aria: {
            sortAscending: ": Habilitado para ordenar la columna en orden ascendente",
            sortDescending: ": Habilitado para ordenar la columna en orden descendente"
        }, buttons: {
            copyTitle: 'Registros copiados a portapapeles',
            copyKeys: 'Copiado con teclas clave.',
            copySuccess: {
                _: ' %d Registros copiados',
                1: ' 1 Registro copiado'
            }
        }
    },
    "autoWidth": true,
    "colReorder": true, 
    "displayLength": 10,
    "bLengthChange": false,
    "deferRender": true,
    "scrollY": false,
    "scrollX": true,
    "scrollCollapse": true,
    "aaSorting": [[0, 'desc']]
//    ,
//    "columnDefs": [
//        {"width": "20%", "targets": [0]}
//    ]
};


function getTable(tblname, data) {
    var column = '';
    var i = 0;
    var div = "<div class=\" \">";
    div = "<table id=\"" + tblname + "\" class=\"table table-striped table-hover \"  width=\"100%\">";
    //Create header
    div += "<thead>";
    div += "<tr class=\"\" >";
    for (var key in data[i]) {
        column += "<th>" + key + "</th>";
    }
    div += column;
    div += "</tr></thead>";
    //Create Rows
    div += "<tbody>";
    $.each(data, function (key, value) {
        div += "<tr data-toggle='tooltip' title='Haga clic para editar' >";
        $.each(value, function (key, value) {
            div += "<td>" + value + "</td>";
        });
        div += "</tr>";
    });
    div += "</tbody>";
    //Create Footer
    div += "<tfoot>";
    div += "<tr class=\"\">";

    div += column;
    div += "</tr></tfoot>";
    div += "</table>";
    div += "</div>";
    return div;
} 
function getTableConceptosTrabajos(tblname, data) {
    var column = '';
    var i = 0;
    var div = "<div class=\" \">";
    div = "<table id=\"" + tblname + "\" class=\"table table-striped table-hover \"  width=\"100%\">";
    //Create header
    div += "<thead>";
    div += "<tr class=\"\" >";
    for (var key in data[i]) {
        column += "<th>" + key + "</th>";
    }
    div += column;
    div += "</tr></thead>";
    //Create Rows
    div += "<tbody>";
    $.each(data, function (key, value) {
        div += "<tr data-toggle='tooltip' title='Haga clic para editar' >";
        $.each(value, function (key, value) {
            div += "<td>" + value + "</td>";
        });
        div += "</tr>";
    });
    div += "</tbody>";
    //Create Footer
    div += "<tfoot>";
    div += "<tr class=\"\">";

    div += column;
    div += "</tr></tfoot>";
    div += "</table>";
    div += "</div>";
    return div;
} 
function getExt(filename) {
    var dot_pos = filename.lastIndexOf(".");
    if (dot_pos === -1)
        return "";
    return filename.substr(dot_pos + 1).toLowerCase();
}

