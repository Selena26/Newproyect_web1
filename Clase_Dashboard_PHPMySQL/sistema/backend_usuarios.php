<?php
require_once('conexion.php'); 
$db= $mysql;
// insert
if(empty($_GET['id']) && !empty($_GET['name']) && $_GET['name']=='usuarios'){
   extract($_POST);
  if(!empty($usuario) & !empty($password)){
      $row= [
       'usuario' =>$usuario,
       'password'=>md5($password),
       'nombre'=>$nombre,
       'tipo_usuario'=>$tipo_usuario
       
      
     ];
  

    $tableName=$_GET['name']; 

    if(!empty($data) && !empty($tableName)){
       $insertData=insert_data($data,$tableName);
       if($insertData){
         echo "<span class='success'>Perfil de administrador guardado con éxito</span>";
       }else{
         echo "<span class='fail'>¡Error!.. revisa tu consulta</span>";
       }
    }
  

}else{
  echo "<span class='fail'>El campo de perfil de administrador está vacío</span>";
}

}

// update
if(!empty($_GET['id']) && !empty($_GET['name']) && $_GET['name']=='usuarios'){
   extract($_POST);
  if(!empty($usuario) & !empty($password)){

      $data= [
        'usuario' =>$usuario,
        'password'=>md5($password),
        'nombre'=>$nombre,
        'tipo_usuario'=>$tipo_usuario
       
       
     ];
  

  
    $tableName=$_GET['name']; 
    $id= $_GET['id'];
  

    if(!empty($data) && !empty($tableName)){
         $updateData=update_data($data,$tableName, $id);

       if($updateData){
         echo "<span class='success'>Perfil de administrador guardado con éxito</span>";
       }else{
         echo "<span class='fail'>¡Error!.. revisa tu consulta</span>";
       }
    }

}else{
  echo "<span class='fail'>El campo de perfil de administrador está vacío</span>";
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
?>