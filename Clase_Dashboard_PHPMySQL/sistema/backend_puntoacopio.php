<?php
require_once('conexion.php'); 
$db= $mysqli;
//=========home content =================--//

// insert
if(empty($_GET['id']) && !empty($_GET['name']) && $_GET['name']=='punto_acopio'){
    extract($_POST);
   if(!empty($Nombre)){
    
       $data= [
        'Nombre'=>$Nombre,
        'Representante' =>$Representante,
        'Contacto_email'=>$Contacto_email,
        'Contacto_telefono'=>$Contacto_telefono,
        'Latitud'=>$Latitud,
        'Longitud'=>$Longitud
        
      ];
   
 
     $tableName=$_GET['name']; 
 
     if(!empty($data) && !empty($tableName)){
        $insertData=insert_data($data,$tableName);
        if($insertData){
          echo "<span class='success'>Contenido guardado con éxito</span>";
        }else{
          echo "<span class='fail'>¡Error!.. revisa tu consulta</span>";
        }
     }
 
 }else{
   echo "<span class='fail'>El campo punto de acopio está vacío</span>";
 }
 
 }
 
 // update 
 if(!empty($_GET['id']) && !empty($_GET['name']) && $_GET['name']=='punto_acopio')
 {
 
   extract($_POST);
    
    if(!empty($Nombre)){
    
       $data= [
         'Nombre'=>$Nombre,
        'Representante' =>$Representante,
        'Contacto_email'=>$Contacto_email,
        'Contacto_telefono'=>$Contacto_telefono,
        'Latitud'=>$Latitud,
        'Longitud'=>$Longitud
        
      ];
   
 
     $tableName=$_GET['name']; 
     $id= $_GET['id'];
   
   $updateData=update_data($data,$tableName, $id);
    if($updateData){
     echo "<span class='success'>Se actualizó correctamente el contenido</span>";
    }else{
     echo "<span class='fail'>¡Error!.. revisa tu consulta</span>";
    }
 
   }else{
    echo "<span class='fail'>El campo punto de acopio está vacío</span>";
   }
 }