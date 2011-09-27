jQuery("document").ready(function() {
    jQuery("#email_groups_table").tablesorter({widthFixed: true, widgets: ['zebra']}).tablesorterPager({container: jQuery("#pager"), size: 5});
});

