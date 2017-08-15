<?php

class FotosFPB extends FPDF {

// Page header
    function Header() {
        if ($this->page == 1 && $this->getLast() == '') {
            /* Pagina principal */
            $this->SetY(0);
            $this->SetX(0);
            $this->SetFillColor(10, 79, 164);
            $this->Cell(279, 36, '', 0, 0, 'L', true);
            $this->SetY(36);
            $this->SetX(0);
            $this->Image(base_url() . 'img/logo_cajeros.png', 7, 7, 25);
            $this->SetFillColor(0, 101, 193);
            $this->Cell(279, 36, '', 0, 0, 'L', true);
            $this->SetY(72);
            $this->SetX(0);
            $this->SetFillColor(0, 159, 229);
            $this->Cell(279, 36, '', 0, 0, 'L', true);
            $this->SetY(108);
            $this->SetX(0);
            $this->SetFillColor(82, 189, 236);
            $this->Cell(279, 36, '', 0, 0, 'L', true);
            $this->SetY(144);
            $this->SetX(0);
            $this->SetFillColor(136, 209, 243);
            $this->Cell(279, 36, '', 0, 0, 'L', true);
            $this->SetY(180);
            $this->SetX(0);
            $this->SetFillColor(181, 229, 249);
            $this->Cell(279, 36, '', 0, 0, 'L', true);
        } 
        else if ($this->getLast() == '') {
            /* Estructura de la presentación */
            $this->Image(base_url() . 'img/barra_cajeros.png', 0, 0, 7);
            $this->Image(base_url() . 'img/bbva_cajeros.png', 13, 6, 25);
            $this->SetDrawColor(137, 209, 243);
            $this->SetLineWidth(0.8);
            $this->SetY(5);
            $this->SetX(207);
            $this->SetFont('Arial', '', 9);
            $this->SetTextColor(0, 112, 192);
            $this->Cell(30, 7, utf8_decode('CR ó Folio:'), 1, 0, 'C');
            $this->SetTextColor(14, 114, 236);
            $this->SetFont('Arial', 'B', 9);
            $this->Cell(30, 7, utf8_decode($this->getCRL()), 1, 0, 'C');

            /* Primer recuardo */
            $this->SetLineWidth(0.9);
            $this->SetDrawColor(10, 79, 164); 
            $this->Rect(13, 18, 123, 84); 
            $this->SetDrawColor(137, 209, 243); 
            $this->Rect(13, 104, 123, 8); 

            /* Segundo recuardo */
            $this->SetDrawColor(10, 79, 164); 
            $this->Rect(144, 18, 123, 84); 
            $this->SetDrawColor(137, 209, 243);
            $this->Rect(144, 104, 123, 8);  

            /* Tercer recuardo */
            $this->SetDrawColor(10, 79, 164);
            $this->Rect(13, 115, 123, 84);  
            $this->SetDrawColor(137, 209, 243); 
            $this->Rect(13, 201, 123, 8);  

            /* Cuarto recuardo */
            $this->SetDrawColor(10, 79, 164); 
            $this->Rect(144, 115, 123, 84);  
            $this->SetDrawColor(137, 209, 243);
            $this->Rect(144, 201, 123, 8);  
             
            
        } else if ($this->getLast() == 'Si') {
            /* Estructura de la presentación */
            $this->Image(base_url() . 'img/barra_cajeros.png', 0, 0, 7);
            $this->Image(base_url() . 'img/bbva_cajeros.png', 13, 6, 25);
            $this->SetDrawColor(137, 209, 243);
            $this->SetLineWidth(0.8);
            $this->SetY(5);
            $this->SetX(207);
            $this->SetFont('Arial', '', 9);
            $this->SetTextColor(0, 112, 192);
            $this->Cell(30, 7, utf8_decode('CR ó Folio:'), 1, 0, 'C');
            $this->SetTextColor(14, 114, 236);
            $this->SetFont('Arial', 'B', 9);
            $this->Cell(30, 7, utf8_decode($this->getCRL()), 1, 0, 'C');
            
            $this->SetFont('Arial', 'B', 10);
            /* Primer recuardo */
            $this->SetLineWidth(0.9);
            $this->SetDrawColor(10, 79, 164);
            $this->SetY(18);
            $this->SetX(13);
            $this->Cell(123, 180, '', 1, 0, 'C');
            $this->SetDrawColor(137, 209, 243);
            $this->SetY(200);
            $this->SetX(13);
            $this->Cell(123, 8, 'COMENTARIOS', 1, 0, 'C');

            /* Segundo recuardo */
            $this->SetDrawColor(10, 79, 164);
            $this->SetY(18);
            $this->SetX(144);
            $this->Cell(123, 180, '', 1, 0, 'C');
            $this->SetDrawColor(137, 209, 243);
            $this->Rect(144, 200, 123, 8);  
            $this->SetY(200);
            $this->SetX(144);
            $this->Cell(123, 8, 'VISITA PREVIA', 0, 0, 'C');
            
            
        }
    }

// Page footer
    function Footer() {
        if ($this->page > 1) {
            $this->setY(-60); 
            $this->SetFont('Arial', 'B', 9);
            $this->SetTextColor(10, 79, 164); 
            $this->Text(271, 210, $this->PageNo(), 0, 0, 'R');
        }
    }

    /*  STTER AND GETTER */

    public $EmpresaL = '';
    public $CrL = '';
    public $SucursalL = '';
    public $ConceptoL = '';
    public $ClienteL = '';
    public $DireccionL = '';
    public $Last = '';

    public function setLast($Last) {
        $this->$Last = $Last;
    }

    public function getLast() {
        return $this->Last;
    }

    public function setDireccionL($DireccionL) {
        $this->DireccionL = $DireccionL;
    }

    public function getDireccionL() {
        return $this->DireccionL;
    }

    public function setClienteL($ClienteL) {
        $this->ClienteL = $ClienteL;
    }

    public function getClienteL() {
        return $this->ClienteL;
    }

    public function setEmpresaL($EmpresaL) {
        $this->EmpresaL = $EmpresaL;
    }

    public function getEmpresaL() {
        return $this->EmpresaL;
    }

    public function setCrL($CrL) {
        $this->CrL = $CrL;
    }

    public function getCrL() {
        return $this->CrL;
    }

    public function setSucursalL($SucursalL) {
        $this->SucursalL = $SucursalL;
    }

    public function getSucursalL() {
        return $this->SucursalL;
    }

    public function setConceptoL($ConceptoL) {
        $this->ConceptoL = $ConceptoL;
    }

    public function getConceptoL() {
        return $this->ConceptoL;
    }

}
