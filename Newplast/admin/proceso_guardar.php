<?php
include("conexion.php");
$nombre_marca=$_POST['nombre_marca'];
$representacion_fisica=$_POST['representacion_fisica'];
$foto=addslashes(file_get_contents($_FILES['foto']['tmp_name']));
$puntos_promocion=$_POST['puntos_promocion'];
$query="INSERT INTO marca_botellas(nombre_marca, representacion_fisica, foto, puntos_promocion) 
VALUES ('$nombre_marca', '$representacion_fisica', '$foto' ,'$puntos_promocion')";
$result=$mysqli->query($query);
?>