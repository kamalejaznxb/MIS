$(document).ready(function(){
   
    //    $('dl.options>dt>a').hover(function(){
    //      $('.row').unbind('mouseenter mouseleave');
    //    }, function(){
    //       $('.row').bind('hover');
    //    });
    
    $('.datepicker').datepicker();

    //    $('.row').wrap('<a href="#" class="row-wrapper" />');

    $('.row-wrapper').live('click', function(e){
        value = $(this).find('ul').prop('id');
        value = value.split('-');
        $.getScript('/tickets/'+value[1]);
    });

    jQuery("#tickets_table").tablesorter({
        widthFixed: true,
        widgets: ['zebra']
        }).tablesorterPager({
        container: jQuery("#pager"),
        size: 20
    });
  

});

function new_ticket()
{
    $('.software-issue').hide().find('select').prop({
        'disabled':true
    });
    $('.hardware-issue').hide().find('select').prop({
        'disabled':true
    });
    $('input.radio').change(function(e){
        if($(this).val()=='Technical'){
            $('.technical-issues').show()
            .find('select').prop({
                'disabled': false
            });
            $('.internet-issue').show()
            .find('select').prop({
                'disabled': false
            });
            ;
            $('.software-issue').hide()
            .find('select').prop({
                'disabled': true
            });
            $('.hardware-issue').hide()
            .find('select').prop({
                'disabled': true
            });
        }else if($(this).val()=='New hardware Request'){
            $('.technical-issues').hide()
            .find('select').prop({
                'disabled': true
            });
            $('.internet-issue').hide()
            .find('select').prop({
                'disabled': true
            });
            $('.software-issue').hide()
            .find('select').prop({
                'disabled': true
            });
            $('.hardware-issue').show()
            .find('select').prop({
                'disabled': false
            });
        }
    });
    $('.technical-issues').change(function(){
        if($(this).find('select option:selected').text()=='Internet'){
            $('.internet-issue').show()
            .find('select').prop({
                'disabled': false
            });
            $('.software-issue').hide()
            .find('select').prop({
                'disabled': true
            });
            $('.hardware-issue').hide()
            .find('select').prop({
                'disabled': true
            });
        }else if($(this).find('select option:selected').text()=='Software'){
            $('.internet-issue').hide()
             .find('select').prop({
                'disabled': true
            });
            $('.software-issue').show()
            .find('select').prop({
                'disabled': false
            });;
            $('.hardware-issue').hide()
            .find('select').prop({
                'disabled': true
            });
        }
    //        console.log($(this).find('select option:selected').text());
    });


}

