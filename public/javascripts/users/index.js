jQuery(document).ready(function(){

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
            jQuery("#dynamic_attributes_container").show();
            href = "/email_groups/get_email_format?email_group=" + val;
            jQuery("#temp_link").attr("href", href).trigger("click");
        }
        else
        {
            jQuery("#dynamic_attributes_container").hide();
        }

    });

    jQuery("#get_email_preview").live("click", function() {
       jQuery("#get_email_preview_hidden_field").val("1");
       jQuery("#user_submit_button").trigger("click");
       return false;
    });

    jQuery('#user_user_role_id').live('change', function(e){
        if( jQuery('option:selected').text() == 'TL' ){
            jQuery('.dm').show();
            jQuery('.dm').find('select').removeProp('disabled');
            jQuery('.tl').hide();
            jQuery('.tl').find('select').prop('disabled', true)
        }else if( jQuery('option:selected').text()== 'TM'){
            jQuery('.dm').hide();
            jQuery('.dm').find('select').prop('disabled', true);
            jQuery('.tl').find('select').removeProp('disabled');
            jQuery('.tl').show();
        }else{
            jQuery('.employee-role').hide();
            jQuery('.dm').find('select').prop('disabled', true);
            jQuery('.tl').find('select').prop('disabled', true);
        }
		
    });
});
