jQuery("document").ready(function() {
    
    jQuery("#users_table").tablesorter({widthFixed: true, widgets: ['zebra']}).tablesorterPager({container: jQuery("#pager"), size: 5});

    jQuery(".sub_locations_cancel").live("click", function() {
//        jQuery(".row-selected").removeClass("row-selected");
        jQuery(this).parent().prev().removeClass("row-selected");
        jQuery(this).parent().remove();
    });
    jQuery(".locations").live("change", function() {
       if (jQuery(this).val() != "") {
           location_id = jQuery(this).val();
           jQuery(this).parent().nextAll("div.sub_locations_select_tags").remove();
           jQuery("#hidden_link").attr("href", "/locations/move_user_to_another_sub_location?location_id=" + location_id);
           jQuery("#hidden_link").trigger("click");
       }
    });
    jQuery("#user-move-submit").live("click", function() {
       var result = confirm("Are you sure to move User Location ?");
       if (result)
       {
            location_id = jQuery(".locations:last").val();
            jQuery("#location_id").val(location_id);
       }
       else
       {
            return false;
       }

    });
});


