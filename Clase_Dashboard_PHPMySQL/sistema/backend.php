<?php
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

?>