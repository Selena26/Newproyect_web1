// ============= admin rol ==============//
$(document).on('click', '.adminRole', function(e){
       
    var el=$(this);
    var name=$(this).attr('name');
    var id=$(this).attr('rel');
     $.ajax({
     method:"GET",
     url: "./backend_registro.php",
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
     url: "./backend_registro.php?name="+name,
     data:$(this).serialize(),
      beforeSend:function(){
      $('button[type="submit"]').attr('disabled','disabled').text('Saving..');
    },
     success: function(data){
    
     $('#adminForm').find('input').val('')
     $('#adminForm').find('textarea').val('');
     $('button[type="submit"]').removeAttr('disabled').text('Save');
    
    $('#alertBox').html(data).fadeIn();
  
  }});
    
  });
  
  
  //========= update data through update form============ //
  
  
  $(document).on('submit','#updateForm',function(e){
     e.preventDefault();
    var formData = new FormData(this);
    var name=$(this).attr('name');
    var id= $(this).attr('rel');
    
     $.ajax({
     method:"POST",
     url: "backend_registro.php?name="+name+"&id="+id,
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
   }
        
  });
   });
  
  
  
  // ============= delete data from database============= //
  $(document).on('click','.delete',function(e){
  var el=$(this);
  var id=$(this).attr('id');
  var name = $(this).attr('name');
  
  if ($('#confirmBox').css("display") == "none") {
   $('#confirmBox').fadeIn();
   alert('HOLA' + name);
   $('#confirmBox').find('button').on('click', function(){
   
      if($(this).val()==1){
  
         $.ajax({    
            type: "GET",
            url: "./backend_registro.php", 
            data:{deleteId:id, deleteData:name},            
            dataType: "html",                  
            success: function(data){ 
               
                $("#showTable").html(data); 
                $('#alertBox').html(data).fadeIn();
                el.parents('tr').remove();
            }
        });
      }
      
     $('#confirmBox').fadeOut(); 
  
   })
  
  }
  
  });
  
  
  // === display alert message within a time interval ====== //
  window.setInterval(function(){
   if ($('#alertBox').css("display") == "block") {
    $('#alertBox').fadeOut();
  }
  }, 3000);