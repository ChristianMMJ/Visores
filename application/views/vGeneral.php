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
 

</script>
