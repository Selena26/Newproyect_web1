
<?php
require('fpdf.php');
class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    // Logo
    $this->Image('assets/img/newplast.jpg',10,8,33);
    // Arial bold 15
    $this->SetFont('Arial','B',16);
    // Movernos a la derecha
    $this->Cell(60);
    // Título
    $this->Cell(80,30,'Reporte del registro de botellas',0,0,'C');
    // Salto de línea
    $this->Ln(40);
    $this->SetFillColor(28,130,114);
    $this->Cell(40, 10, 'Nombre', 1, 0, 'C', 1);
    $this->Cell(25, 10, 'Usuario', 1, 0, 'C', 1);
    $this->Cell(70, 10, 'Punto Acopio', 1, 0, 'C', 1);
    $this->Cell(30, 10, 'Fecha', 1, 0, 'C', 1);
    $this->Cell(28, 10, 'Control', 1, 1, 'C', 1);
    
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
$consulta="Select u.nombre, u.usuario, p.Nombre, r.fecha, r.control from registro_botellas as r 
join usuarios u on r.usuario=u.id 
join punto_acopio p on p.id=r.pto_acopio";
$resultado=$mysqli->query($consulta);

$pdf = new PDF();
$pdf->AliasNbPages();
$pdf->AddPage();
$pdf->SetFont('Arial','',12);
$pdf->SetFillColor(255,255,255);

while($row=$resultado->fetch_assoc()){
    $pdf->Cell(40, 10, $row['nombre'], 1, 0, 'C', 1);
    $pdf->Cell(25, 10, $row['usuario'], 1, 0, 'C', 1);
    $pdf->Cell(70, 10, $row['Nombre'], 1, 0, 'C', 1);
    $pdf->Cell(30, 10, $row['fecha'], 1, 0, 'C', 1);
    $pdf->Cell(28, 10, $row['control'], 1, 1, 'C', 1);

}

$pdf->Output();
?>