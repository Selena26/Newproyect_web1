$(document).on('click', '.adminRole', function(e){
       
    var el=$(this);
    var name=$(this).attr('name');
    var id=$(this).attr('rel');
     $.ajax({
     method:"GET",
     url: "./backend_registropromocion.php",
     data:{tableName:name,id:id,role:'admin'},
  
     success: function(data){
  
       switch(data)
       {
         case 'fas fa-user-alt-slash iconRole':
         el.attr('class', 'text-secondary adminRole');
         break;
         case 'fas fa-user-alt iconRole':
         el.attr('class', 'text-success adminRole');
         break;
       }
    
    el.find('.iconRole').attr('class', data);
  
  
  }});
  });
  
  //======= Insert data through admin form==========// 
  
  $(document).on('submit','#adminForm',function(e){
     e.preventDefault();
    var name=$(this).attr('name');
     $.ajax({
     method:"POST",
     url: "./backend_registropromocion.php?name="+name,
     data:$(this).serialize(),
      beforeSend:function(){
      $('button[type="submit"]').attr('disabled','disabled').text('Saving..');
    },
     success: function(data){
    
     $('#adminForm').find('input').val('')
     $('#adminForm').find('textarea').val('');
     $('button[type="submit"]').removeAttr('disabled').text('Save');
     $('#alertBox').html(data).fadeIn();
     swal.fire("Hecho!", "Promoción registrada correctamente", "success");
  },
    error: function(data){
      swal.fire("Error!", "No se pudo registrar la promoción", "error");
    }
  });
    
  });
  
  
  //========= update data through update form============ //
  
  
  $(document).on('submit','#updateForm',function(e){
     e.preventDefault();
    var formData = new FormData(this);
    var name=$(this).attr('name');
    var id= $(this).attr('rel');
    
     $.ajax({
     method:"POST",
     url: "backend_registropromocion.php?name="+name+"&id="+id,
     data:formData,
     cache:false,
     contentType: false,
     processData: false,
      beforeSend:function(){
      $('button[type="submit"]').attr('disabled','disabled');
    }, 
     success: function(data){
    
     $('button[type="submit"]').removeAttr('disabled');
    
      $('#alertBox').html(data).fadeIn();
      swal.fire("Hecho!", "Promoción Actualizada correctamente", "success");
   },
   error: function(data){
    swal.fire("Error!", "No se pudo actualizar la promoción", "error");
  }
        
  });
   });
  
  
  
  // ============= delete data from database============= //
  $(document).on('click','.prom',function(e){
    e.preventDefault();
  var el=$(this);
  var id=$(this).attr('id');
  var name = $(this).attr('name');
  
  Swal.fire({
    title: '¿Realmente quieres borrar esta promoción?',
    text: "¡La promoción se eliminará permanentemente!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    confirmButtonText: 'Si',
    cancelButtonText: 'No'
  }).then((result) => {
    if (result.value) {
      $.ajax({    
        type: "GET",
        url: "./backend_registropromocion.php", 
        data:{deleteId:id, deleteData:name},            
        dataType: "html",                  
        success: function(data){ 
           
            $("#showTable").html(data); 
            $('#alertBox').html(data).fadeIn();
            el.parents('tr').remove();
        }
    });
      Swal.fire(
        'Eliminado!',
        'La promoción ha sido eliminada correctamente.',
        'success'
      )
    }
  })



   
    
  

      


  
  
  
  });
  
  
  // === display alert message within a time interval ====== //
  window.setInterval(function(){
   if ($('#alertBox').css("display") == "block") {
    $('#alertBox').fadeOut();
  }
  }, 3000);