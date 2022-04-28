/ ============= delete data from database============= //
$(document).on('click','.delete',function(e){
  var el=$(this);
  var id=$(this).attr('id');
  var name = $(this).attr('name');
  //alert('HOLA' + name);
  if ($('#confirmBox').css("display") == "none") {
   $('#confirmBox').fadeIn();

   $('#confirmBox').find('button').on('click', function(){
   
      if($(this).val()==1){

         $.ajax({    
            type: "GET",
            url: "./backend_puntoacopio.php", 
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