$(document).ready(function(){
    jQuery("#users_table").tablesorter({
        widthFixed: true,
        widgets: ['zebra']
        }).tablesorterPager({
        container: jQuery("#pager"),
        size: 5
    });
    
    $('#user_user_role_id').live('change', function(e){
        if( $('option:selected').text() == 'TL' ){
            $('.dm').show();
            $('.dm').find('select').removeProp('disabled');
            $('.tl').hide();
            $('.tl').find('select').prop('disabled', true)
        }else if( $('option:selected').text()== 'TM'){
            $('.dm').hide();
            $('.dm').find('select').prop('disabled', true);
            $('.tl').find('select').removeProp('disabled');
            $('.tl').show();
        }else{
            $('.employee-role').hide();
            $('.dm').find('select').prop('disabled', true);
            $('.tl').find('select').prop('disabled', true);
        }
		
    });
});
