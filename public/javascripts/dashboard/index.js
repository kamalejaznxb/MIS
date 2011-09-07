$(document).ready(function() {
    $('.chart-button').live('click', function(e){
        e.preventDefault();
        console.log($(this).prop('href'))
        $.getJSON($(this).prop('href'), function(data) {
            console.log(data);
            chart1 = new Highcharts.Chart({
                chart: {
                    renderTo: 'container',
                    type: 'column'
                },
                title: {
                    text: 'Graph'
                },
                xAxis: {
                    categories: ['Total', 'Closed', 'Open'],
                    title: {
                        text: 'Category'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Tickets'
                    }
                },
                series: [{
                        name: 'Technical',
                        data: [ data.technical_all,
                            data.technical_close,
                            data.technical_open ]
                        }, {
                            name: 'New Hardware Request',
                            data: [ data.hardware_all,
                            data.hardware_close,
                            data.hardware_open ]
                        }]
                });
            });
    
        });
    });