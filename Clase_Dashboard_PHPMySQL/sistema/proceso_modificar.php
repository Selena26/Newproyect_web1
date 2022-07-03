<?php
include("conexion.php");
$id_marca=$_REQUEST['id'];

$nombre_marca=$_POST['nombre_marca'];
$representacion_fisica=$_POST['representacion_fisica'];
$foto=addslashes(file_get_contents($_FILES['foto']['tmp_name']));
$puntos_promocion=$_POST['puntos_promocion'];

$query="UPDATE marca_botellas SET nombre_marca='$nombre_marca', representacion_fisica='$representacion_fisica',
foto='$foto', puntos_promocion='$puntos_promocion' WHERE id='$id_marca'";
$result=$mysqli->query($query);

if($result){
    header("location: marca_botellas.php");
    echo "<span class='success'>Contenido modifico con éxito</span>";
}else{
    echo "<span class='fail'>¡Error!.. revisa tu consulta</span>";
}
?>