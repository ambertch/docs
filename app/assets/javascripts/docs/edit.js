$(document).ready(function(){
  $('#show_doc').on('click', function(event){
    var windowFeatures = "menubar=no,location=no,resizable=yes,scrollbars=no,status=no,personalbar=no,width=800,height=850"
    window.open('/docs/' + $(this).data('doc') + '/popup', '_doc_popup', windowFeatures)
    // alert($(this).data('doc_id'))
  });
  // put who locked it so it doesn't popup
})
