$(document).ready(function(){
   $('#network_management_submit').click(function(e){
        $.getScript('/network_managements/get_ip?ip='+
            $('#network_management_ip').val()+'&ip_range='+
            $('#network_management_ip_range').val());
   });
});
function show_fields(){
	$('.ip-fields').show();
}
