jQuery("document").ready(function() {
    jQuery(".sub_locations_cancel").live("click", function() {
//        jQuery(".row-selected").removeClass("row-selected");
        jQuery(this).parent().prev().removeClass("row-selected");
        jQuery(this).parent().remove();
    });
});


