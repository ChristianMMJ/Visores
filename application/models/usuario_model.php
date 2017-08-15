<?php


if (!defined('BASEPATH'))
    exit('No direct script access allowed');
header('Access-Control-Allow-Origin: *');

class usuario_model extends CI_Model {

    public function __construct() {
        parent::__construct();
    }

    public function getRecords() {
        try {
            $query = $this->db->query("SP_USUARIOS");
            /*
             * FOR DEBUG ONLY
             */
            $str = $this->db->last_query();
            $data = $query->result();
            return $data;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function getAcceso($USUARIO, $CONTRASENA) {
        try {

             $query = $this->db->query("SP_ACCESO '{$USUARIO}', '{$CONTRASENA}'");
            $data = $query->result();
   
            return $data;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    

    public function onAgregar($array) {
        try {
               $this->db->insert("App_Usuarios", $array);
            print $str = $this->db->last_query();
            $query = $this->db->query('SELECT U.ID FROM APP_Usuarios AS U WHERE U.Usuario =\''.$array['Usuario'].'\' AND U.Contrasena =\''.$array['Contrasena'].'\'');
            $row = $query->row_array();
            $LastIdInserted = $row['ID'];
            print $LastIdInserted;
            return $LastIdInserted;
            
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function onModificar($ID, $DATA) {
        try {
            $this->db->where('ID', $ID);
            $this->db->update("APP_Usuarios", $DATA);
//            print $str = $this->db->last_query();
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }
    public function onEliminar($ID) {
        try {
            $this->db->set('Estatus', 'Inactivo'); 
            $this->db->where('ID', $ID);
            $this->db->update("APP_Usuarios");
//            print $str = $this->db->last_query();
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

    public function getUsuarioByID($ID) {
        try {
            $this->db->select('U.*', false);
            $this->db->from('APP_Usuarios AS U');
            $this->db->where('U.ID', $ID);
            $this->db->where_in('U.Estatus', 'Activo');
            $query = $this->db->get();
            /*
             * FOR DEBUG ONLY
             */
            $str = $this->db->last_query();
//        print $str;
            $data = $query->result();
            return $data;
        } catch (Exception $exc) {
            echo $exc->getTraceAsString();
        }
    }

}
