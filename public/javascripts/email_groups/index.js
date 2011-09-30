jQuery("document").ready(function() {
    jQuery("#email_groups_table").tablesorter({
        widthFixed: true,
        widgets: ['zebra']
    }).tablesorterPager({
        container: jQuery("#pager"),
        size: 5
    });
    jQuery(".button").live("click", function() {

        //        jQuery("textarea").bind("invalid", function(e) {
        //           alert("Textarea is Invalid.") ;
        //        });
        
        textarea = jQuery("textarea[required=required]");

        if(textarea.val() == "")
        {
            jQuery("#errors").html("Description cannot be blank.");
            textarea.val(".");
        }
       
    });
    
});

