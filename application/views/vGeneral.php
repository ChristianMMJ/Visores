<div class="col-md-12" id="MenuTablero">
    <div class="panel panel-default animated">
        <div class="panel-heading"><div class="cursor-hand" >Visor Gastos - General</div></div>
        <fieldset>
            <div class="col-md-12 dt-buttons" align="right">
                <button type="button" class="btn btn-default" id="btnNuevo"><span class="fa fa-plus fa-1x" ></span><br>NUEVO</button>
                <button type="button" class="btn btn-default hide" id="btnRefrescar"><span class="fa fa-refresh fa-1x"></span><br>ACTUALIZAR</button>
            </div>
            <div class="col-md-12" id="pvtGeneral"></div>
            <div class="col-md-12"><br></div>
        </fieldset> 
    </div>
</div>

<!--SCRIPT-->
<script>
    var master_url = base_url + 'index.php/CtrlGeneral/';
    var menuTablero = $('#MenuTablero');

    $(document).ready(function () {
//        getRecords();
        var derivers = $.pivotUtilities.derivers;

//        $.getJSON("<?php // print base_url(); ?>js/pivot/mps.json", function (mps) {
//            $("#pvtGeneral").pivotUI(mps, {
//                derivedAttributes: {
//                    "Edad": derivers.bin("Age", 10),
//                    "Genero": function (mp) {
//                        return mp["Gender"] == "Male" ? 1 : -1;
//                    }
//                }
//            });
//        });
        
        
        $.getJSON(master_url + 'getRecords', function (mps) {
            $("#pvtGeneral").pivotUI(mps, {
                derivedAttributes: {
                    "Año": derivers.bin("Año", 10),
                    "EGRESOImporteLinea": function (mp) {
                        return mp["EGRESOImporteLinea"] >0 ? mp["EGRESOImporteLinea"] : 0;
                    }
                }
            });
        });
        
    });

    function getRecords() {
        HoldOn.open({theme: "sk-bounce", message: "CARGANDO DATOS..."});
        $.ajax({
            url: master_url + 'getRecords',
            type: "POST",
            dataType: "JSON"
        }).done(function (data, x, jq) {
            $("#tblRegistros").html(getTable('tblTrabajos', data));
            $('#tblTrabajos tfoot th').each(function () {
                var title = $(this).text();
                $(this).html('<div class="col-md-12" style="overflow-x:auto; "><div class="form-group Customform-group"><input type="text" placeholder="Buscar por ' + title + '" class="form-control" style="width: 100%;"/></div></div>');
            });
            var tblSelected = $('#tblTrabajos').DataTable(tableOptions);
            tblSelected.columns().every(function () {
                var that = this;
                $('input', this.footer()).on('keyup change', function () {
                    if (that.search() !== this.value) {
                        that.search(this.value).draw();
                    }
                });
            });
            $('#tblTrabajos tbody').on('click', 'tr', function () {
                $("#tblTrabajos").find("tr").removeClass("success");
                $("#tblTrabajos").find("tr").removeClass("warning");
                var id = this.id;
                var index = $.inArray(id, selected);
                if (index === -1) {
                    selected.push(id);
                } else {
                    selected.splice(index, 1);
                }
                $(this).addClass('success');
                var dtm = tblSelected.row(this).data();


            });
        }).fail(function (x, y, z) {
            console.log(x, y, z);
        }).always(function () {
            HoldOn.close();
        });
    }

</script>
