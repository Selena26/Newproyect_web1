<?php
require('fpdf.php');
class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    
    // Arial bold 15
    $this->SetFont('Arial','B',18);
    // Movernos a la derecha
    $this->Cell(60);
    // Título
    $this->Cell(70,10,'Reporte',0,0,'C');
    // Salto de línea
    $this->Ln(20);

    $this->Cell(35, 10, 'Usuario', 1, 0, 'C', 0);
    $this->Cell(80, 10, 'Nombre', 1, 0, 'C', 0);
    $this->Cell(40, 10, 'Fecha', 1, 0, 'C', 0);
    $this->Cell(40, 10, 'Control', 1, 1, 'C', 0);
}

// Pie de página
function Footer()
{
    // Posición: a 1,5 cm del final
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página
    $this->Cell(0,10,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'C');
}
}

require 'conexion.php';
$consulta="Select u.usuario, p.Nombre, r.fecha, r.control from registro_botellas as r 
join usuarios u on r.usuario=u.id 
join punto_acopio p on p.id=r.pto_acopio";
$resultado=$mysqli->query($consulta);

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Arial','B',16);

while($row=$resultado->fetch_assoc()){
    $pdf->Cell(35, 10, $row['usuario'], 1, 0, 'C', 0);
    $pdf->Cell(80, 10, $row['Nombre'], 1, 0, 'C', 0);
    $pdf->Cell(40, 10, $row['fecha'], 1, 0, 'C', 0);
    $pdf->Cell(40, 10, $row['control'], 1, 1, 'C', 0);

}

$pdf->Output();
?>