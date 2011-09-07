$(document).ready(function(){
    $('input.radio').change(function(e){
        if($(this).val()=='Technical'){
            $('.technical-issues').show();
            $('.internet-issue').show();
            $('.software-issue').hide();
            $('.hardware-issue').hide();
        }else if($(this).val()=='New hardware Request'){
            $('.technical-issues').hide();
            $('.internet-issue').hide();
            $('.software-issue').hide();
            $('.hardware-issue').show();
        }
    });
    $('.technical-issues').change(function(){
        if($(this).find('select').val()=='Internet'){
            $('.internet-issue').show();
            $('.software-issue').hide();
            $('.hardware-issue').hide();
        }else if($(this).find('select').val()=='Software'){
            $('.internet-issue').hide();
            $('.software-issue').show();
            $('.hardware-issue').hide();
        }
    });

    $('.software-issue').hide();
    $('.hardware-issue').hide();
});