// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
var chart1;
$(document).ready(function() {
   
    if ($('p.notice').html() == "") {
        $('p.notice').hide();
    }

    if ($('p.alert').html() == "") {
        $('p.alert').hide();
    }
    setTimeout("$('.alert').hide()", 2000);
    setTimeout("$('.notice').hide()", 2000);

    $('li').live('click',function(e){
        $(this).parent()
        .siblings('a')
        .find('li.selected')
        .removeClass('selected')
        .end()
        .end()
        .end()
        .addClass('selected')
    })
    
    $("a[href='#']").live('click',
        function(e){
            e.preventDefault();
        });

    $('.bottom-option').live('click', function(e){
        $('.bottom-option').next('.under-bottom-nav').show();
    });
    $('.under-bottom-option').mouseleave( function(e){
        $(this).children('.under-bottom-nav').hide();
    });
    $('.cancel').live('click',
        function(e){
            if($('.under-row').prev('.row').length != 0)
            {
                remove_row_class($('.under-row').prev('.row'));
            }
            if($('.under-row').parent('#popup').length>0 )
            {
                $('#popup').remove();
            }else
            {
                $('.under-row').remove();
            }
            e.stopImmediatePropagation();

        });
    $('dl.options>dt>a').live('click', function(e){
        $(this).closest('dl').find('dd').show();
        e.stopImmediatePropagation();
    });
    $('.options').live('mouseleave', function(e){
        $('dl.options>dd').hide();
    });
    
    $('.row-odd, .row-even').live({
        mouseenter: function()
        {
            $(this).find('.row-options').show();
        },
        mouseleave: function()
        {
            $(this).find('.row-options').hide();
        }
    }
    );
    $('.accordion .head').click(function() {
        $(this).next().toggle('slow');
        return false;
    }).next().hide();
    $( "#accordion" ).accordion();

  
});



function remove_row_class(value){
    $(value).removeClass('row-selected');
}
function add_row_class(value){
    $(value).addClass('row-selected')
}
function set_position(){
    var windowWidth = $(document).width();
    var windowHeight = $(window).height();
    var popupHeight = $("#popup").height();
    var popupWidth = $("#popup").width();
    $("#popup").css({
        "top": windowHeight/2-popupHeight/2,
        "left": windowWidth/2-popupWidth/2,
        "scrolling": 'auto'
    });
}
function start_rich(){
    tinyMCE.init({
        mode : "textareas",
        theme : "advanced",
        convert_urls : false,
        plugins : "emotions,preview",
        theme_advanced_buttons1 : "bold,italic,underline,separator,strikethrough, bullist,numlist,link",
        theme_advanced_buttons2 : "",
        theme_advanced_buttons3 : "",
        theme_advanced_toolbar_location : "top",
        theme_advanced_toolbar_align : "left",
        extended_valid_elements : "a[name|href|target|title|onclick],img[class|src|border=0|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name], hr[class|width|size|noshade],font[face|size|color|style],span[class|align|style]"
    });
}
function fancy_box(){
    $('a.pic').fancybox({
        'transitionIn'  : 'elastic',
        'transitionOut' : 'elastic',
        'speedIn'       : 600,
        'speedOut'      : 200,
        'overlayShow'   : false
    });
}

function add_new_email_account(container, content) {
    alert("Imran Latif");
    var new_id = new Date().getTime();
    var regExp = new RegExp("new_email_account", "g");
    content = content.replace(regExp, new_id);
    content = "<div>" + content + "</div>";
    jQuery(container).append(content);
}
