<?php
header("Content-Type: application/xls");
header("Content-Disposition: attachment; filename=Reporte_CSV.xls");
?>

<table>
    <tr>
        <th>Nombre</th>
        <th>Usuario</th>
        <th>Punto de acopio</th>
        <th>Fecha</th>
        <th>Cotrol</th>
    </tr>


<?php
include("./conexion.php");
$sql="Select u.nombre,u.usuario, p.Nombre, r.fecha, r.control from registro_botellas as r 
join usuarios u on r.usuario=u.id 
join punto_acopio p on p.id=r.pto_acopio";
$ejecutar=mysqli_query($mysqli, $sql);
while($fila=mysqli_fetch_array($ejecutar)){

?>
<tr>
        <th><?php echo $fila[0] ?></th>
        <th><?php echo $fila[1] ?></th>
        <th><?php echo $fila[2] ?></th>
        <th><?php echo $fila[3] ?></th>
        <th><?php echo $fila[4] ?></th>
    </tr>
<?php
}
?>
</table>