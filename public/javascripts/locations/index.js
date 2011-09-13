jQuery("document").ready(function() {
    jQuery(".sub_locations_cancel").live("click", function() {
        jQuery(this).parent().remove();
        jQuery(".row-selected").removeClass("row-selected");
    });
});


