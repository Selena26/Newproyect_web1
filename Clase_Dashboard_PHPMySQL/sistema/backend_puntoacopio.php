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


 if(!empty($_GET['deleteId']) && !empty($_GET['deleteData']))
{

   $id= legal_input($_GET['deleteId']);
   $deleteData=legal_input($_GET['deleteData']);
   $tableName= $deleteData;
  
   $deleteData=delete_data($tableName, $id);
 
    if($deleteData){
      echo "<span class='success'>".$tableName." data was deleted</span>";
    }else{
      echo  "<span class='fail'>Error...Check your query</span>";
    }
   
}

function update_data($data, $tableName, $id){

  global $db;
  $columnsValues = ''; 
  $num = 0; 
  foreach($data as $column=>$value){ 
                 
          $comma = ($num > 0)?', ':''; 
          $columnsValues.=$comma.$column." = "."'".$value."'"; 
          $num++; 
   } 

    $updateQuery="UPDATE ".$tableName." SET ".$columnsValues." WHERE id=".$id;
   
   $updateResult=$db->query($updateQuery);
   if($updateResult){
     return true;
   }else{
     echo "Error: " . $updateResult . "<br>" . $db->error;
   }


}

function legal_input($value) {
  $value = trim($value);
  $value = stripslashes($value);
  $value = htmlspecialchars($value);
  return $value;
}

function delete_data($tableName, $id){
  global $db;

  $query="DELETE FROM ".$tableName." WHERE id=".$id;
  $result= $db->query($query);
  if($result){
     return true;
  }else{
     echo "Error found in ".$db->error;
  }

}