<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');
header('Access-Control-Allow-Origin: *');

class intelisis_model extends CI_Model {

    public function __construct() {
        parent::__construct();
        $this->sqlsrv = $this->load->database('dbsqlsrv',TRUE);
    }

    public function getClientesIntelisis() {
        try {
            $this->sqlsrv->select(" C.Cliente,C.Nombre+' - '+ISNULL( C.NombreCorto,'') AS Nombre ", false);
            $this->sqlsrv->from('Cte AS C');
            $this->sqlsrv->where('C.Tipo', 'Cliente');
            $this->sqlsrv->order_by('C.Cliente', 'ASC');
            $query = $this->sqlsrv->get();
            /*
             * FOR DEBUG ONLY
             */
            $str = $this->sqlsrv->last_query();
//        print $str;
            $data = $query->result();
            return $data;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function getProyectosIntelisis() {
        try {
            $this->sqlsrv->select('Proyecto,Categoria,Descripcion ', false);
            $this->sqlsrv->from('PROY');
            $this->sqlsrv->where('Estatus', 'ALTA');
            $this->sqlsrv->order_by('Descripcion', 'ASC');
            $query = $this->sqlsrv->get();
            /*
             * FOR DEBUG ONLY
             */
            $str = $this->sqlsrv->last_query();
//        print $str;
            $data =$query->result();
            return $data;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
     public function getClienteNombrebyCliente($ID) {
        try {
              $this->sqlsrv->select("C.Nombre", false);
            $this->sqlsrv->from('Cte AS C');
            $this->sqlsrv->where('C.Cliente', $ID);
            $query = $this->sqlsrv->get();
            /*
             * FOR DEBUG ONLY
             */
            $str = $this->sqlsrv->last_query();
//        print $str;
            $data = $query->result();
            return $data;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
     public function onAgregarIntelisis($array) {
        try {
             $this->sqlsrv->insert("Venta", $array);
//            print $str = $sqlsrv->last_query();
            $query = $this->sqlsrv->query('SELECT SCOPE_IDENTITY() AS IDL');
            $row = $query->row_array();
//            PRINT "\n ID IN MODEL: $LastIdInserted \n";
            return $row['IDL'];
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
     public function onAgregarIntelisisDetalle($array) {
        try {
             $this->sqlsrv->insert("VentaD", $array);
//            print $str = $sqlsrv->last_query();
            $query = $this->sqlsrv->query('SELECT SCOPE_IDENTITY() AS IDL');
            $row = $query->row_array();
//            PRINT "\n ID IN MODEL: $LastIdInserted \n";
            return $row['IDL'];
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

     public function getMovIDIntelisis($ID) {
        try {
              $this->sqlsrv->select("MovID", false);
            $this->sqlsrv->from('Venta');
            $this->sqlsrv->where('ID', $ID);
            $query = $this->sqlsrv->get();
            /*
             * FOR DEBUG ONLY
             */
            $str = $this->sqlsrv->last_query();
        print $str;
            $data = $query->result();
            return $data;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    
}
