$(document).ready(function(){
    jQuery("#users_table").tablesorter({
        widthFixed: true,
        widgets: ['zebra']
        }).tablesorterPager({
        container: jQuery("#pager"),
        size: 5
    });

    jQuery("#email_group").live("change", function() {
        val = jQuery(this).val();
        if (val != "")
        {
          href = "/email_groups/get_email_format?email_group=" + val;
          jQuery("#temp_link").attr("href", href).trigger("click");
        }
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
