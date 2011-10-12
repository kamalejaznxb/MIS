jQuery(document).ready(function(){

    jQuery("#vendors_table").tablesorter({
        widthFixed: true,
        widgets: ['zebra']
        }).tablesorterPager({
        container: jQuery("#pager"),
        size: 5
    });

    
});
