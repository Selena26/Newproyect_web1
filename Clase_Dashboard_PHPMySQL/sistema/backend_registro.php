<?php
require_once('conexion.php'); 
$db= $mysqli;
//insert
if(empty($_GET['id']) && !empty($_GET['name']) && $_GET['name']=='cont_registro'){
  extract($_POST);
 if(!empty($usuario)){
  
     $data= [
      'usuario'=>$usuario,
      'pto_acopio' =>$pto_acopio,
      'fecha'=>$fecha,
      'control'=>$control,
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
 echo "<span class='fail'>El campo Resgistro de botellas está vacío</span>";
}
}
// update 
if(!empty($_GET['id']) && !empty($_GET['name']) && $_GET['name']=='cont_registro')
{

 extract($_POST);
  
  if(!empty($usuario)){
  
     $data= [
      'usuario'=>$usuario,
      'pto_acopio' =>$pto_acopio,
      'fecha'=>$fecha,
      'control'=>$control
      
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
  echo "<span class='fail'>El campo Resgistro de botellas está vacío</span>";
 }
}

// ======= delete data from database ============//
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

// MySQL Query for database operation 

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
function delete_menu($tableName, $id, $menu){
global $db;
if($menu=='header_menu')
{
 $query="DELETE FROM ".$tableName." WHERE id=$id AND header_menu=1";

}else if($menu=='footer_menu'){
$query="DELETE FROM ".$tableName." WHERE id=$id AND footer_menu=1";
}

$result= $db->query($query);
if($result){
  return true;
}else{
  echo "Error found in ".$db->error;
}

}
// convert illegal input value to ligal value formate
function legal_input($value) {
$value = trim($value);
$value = stripslashes($value);
$value = htmlspecialchars($value);
return $value;
}


function insert_data(array $data, string $tableName){
    
  global $db;

  $tableColumns = $userValues = ''; 
  $num = 0; 
  foreach($data as $column=>$value){ 
       $comma = ($num > 0)?', ':''; 
       $tableColumns .= $comma.$column; 
       $userValues  .= $comma."'".$value."'"; 
       $num++; 
   } 
 $insertQuery="INSERT INTO ".$tableName."  (".$tableColumns.") VALUES (".$userValues.")";
 $insertResult=$db->query($insertQuery);
 if($insertResult){
    return true;
 }else{
    return "Error: " . $insertQuery . "<br>" . $db->error;
 }

}



function check_unique_content($tableName){

global $db;


    $query="SELECT * FROM ".$tableName;
   $result= $db->query($query);
    $totalRows= $result->num_rows;
   return $totalRows;
   




}
function check_unique_menu($tableName, $menuName){

global $db;


   $query="SELECT * FROM ".$tableName." WHERE menu_name='".$menuName."'";

    $result= $db->query($query);
    if($result)
    {
    $totalRows= $result->num_rows;
    return $totalRows;
   }else{
   return $totalRows=0;
  }

    return $db->error;
  




}

?>