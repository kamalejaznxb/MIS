jQuery("document").ready(function() {
   alert("Imran Latif") ;
   jQuery("#email_account_categories_table").tablesorter({widthFixed: true, widgets: ['zebra']}).tablesorterPager({container: jQuery("#pager"), size: 5});
});