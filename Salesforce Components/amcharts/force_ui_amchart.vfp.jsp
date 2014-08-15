<apex:page contentType="text/plain">
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/amcharts/3.10.0/amcharts.js"></script> 
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/amcharts/3.10.0/pie.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/amcharts/3.10.0/serial.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/amcharts/3.10.0/funnel.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/amcharts/3.10.0/themes/dark.js"></script>
    <polymer-element name="force-amchart" attributes="charttype valuefield titlefield sobject limitResults orderby" noscript="true">
        <template>
        <style>
        #chartdiv {background: #3f3f4f;color:#ffffff;	
    width		: 100%;
    height		: 500px; 
    font-size	: 11px;
    }				
    width		: 100%;
    height		: 500px;
    font-size	: 11px;
    }       
    </style>
    <div id="chartdiv"></div>
    <force-sobject-collection id="obj_collection" sobject="{{sobject}}" querytype="soql" query="{{query}}" on-sync="{{updateChart}}"></force-sobject-collection>
    </template> 
    <script>
        Polymer('force-amchart', {
            observe: {
                sobject: 'ready',
                valuefield: 'ready',
                titlefield: 'ready',
                limitResults : 'ready',
                charttype: 'updateChart'
            },
            charttype: 'pie',
            valuefield: "",
            titlefield: "", 
            limitResults : '5',
            ready: function() {
                this.query = "Select Id, " + this.valuefield + ", " + this.titlefield + " from " + this.sobject + " Order by "+ this.valuefield + " DESC limit " + this.limitResults ;
            },
            updateChart: function() {
                var data = [];
                this.$.obj_collection.collection.models.forEach(function(model) {
                    data.push(model.attributes);
                });
                
                var barChart = {
                    "type": "serial",
                    "theme": "dark",
                    "valueAxes": [{
                        "gridColor":"#FFFFFF",
                        "gridAlpha": 0.2,
                        "dashLength": 0
                    }],
                    "dataProvider": data,
                    "gridAboveGraphs": true,
                    "startDuration": 1,
                    "graphs": [{
                        "balloonText": "[[category]]: <b>[[value]]</b>",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.2,
                        "type": "column",
                        "valueField": this.valuefield   
                    }],
                    "valueAxes": [{
                        "gridColor":"#FFFFFF",
                        "gridAlpha": 0.2,
                        "dashLength": 0
                    }],
                    "gridAboveGraphs": true,
                    "startDuration": 1,
                    "graphs": [{
                        "balloonText": "[[category]]: <b>[[value]]</b>",
                        "fillAlphas": 0.8,
                        "fillColors": ['#1fc072', '#1fc072', '#1fc072', '#1fc072', '#1fc072', '#1fc072', '#1fc072', '#1fc072', '#1fc072', '#1fc072', '#349862', '#349862', '#349862', '#349862', '#349862', '#349862', '#349862', '#349862', '#349862', '#349862'],
                        "gradientOrientation": "horizontal",
                        "lineAlpha": 0.2,
                        "type": "column",
                        "valueField": this.valuefield		
                    }],
                    "chartCursor": {
                        "categoryBalloonEnabled": false,
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": this.titlefield,
                    "categoryAxis": {
                        "gridPosition": "start",
                        "gridAlpha": 0,
                        "tickPosition":"start",
                        "tickLength":20
                    },
                    "exportConfig":{
                        "menuTop": 0,
                        "menuItems": [{
                            "icon": '/lib/3/images/export.png',
                            "format": 'png'   
                        }]  
                    }
                };
                
                var pyramid =
                    {
                        "type": "funnel",
                        "theme": "dark",
                        "dataProvider": data,
                        "balloon": { 
                            "fixedPosition": true
                        },
                        "valueField": this.valuefield,
                        "titleField": this.titlefield,
                        "marginRight": 210,
                        "marginLeft": 50,
                        "startX": -500,
                        "rotate": true,
                        "labelPosition": "right",
                        "balloonText": "[[title]]: [[value]]n[[description]]",
                        "exportConfig":{
                            "menuItems": [{
                                "icon": '/lib/3/images/export.png',
                                "format": 'png'     
                            }]  
                        }
                    }
                
                var barRotated = 
                    {
                        "type": "serial",
                        "theme": "dark",
                        "pathToImages":"http://www.amcharts.com/lib/3/images/",
                        "dataProvider": data,
                        "startDuration": 1,
                        "graphs": [{
                            "balloonText": "[[category]]: <b>[[value]]</b>",
                            "colorField": "color",
                            "fillAlphas": 1,
                            "fillColorsField": "fill",
                            "lineAlpha": 0.1,
                            "type": "column",
                            "valueField": this.valuefield,
                            "showHandOnHover": true
                        }],
                        "depth3D": 20,
                        "angle": 30,
                        "chartCursor": {
                            "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": false
                        },    
                        "categoryField": "country",
                        "categoryAxis": {
                            "gridPosition": "start",
                            "labelRotation": 90
                        },
                        "chartCursor": {
                            "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": false
                        },
                        "categoryField": this.titlefield,
                        "categoryAxis": {
                            "gridPosition": "start",
                            "labelRotation": 45
                        },
                        "amExport":{}
                    }
                
                var donutChart =  {
                    "type": "pie",
                    "theme": "dark",
                    "valueField": this.valuefield,
                    "titleField": this.titlefield,
                    "dataProvider": data,
                    "startEffect": "elastic",
                    "startDuration": 2,
                    "labelRadius": 15,
                    "innerRadius": "50%",
                    "depth3D": 10,
                    "angle": 15,
                    "exportConfig":{    
                        menuItems: [{
                            icon: 'https://www.amcharts.com/lib/3/images/export.png',
                            format: 'png'     
                        }]  
                    }
                };
                
                var barline=
                    {
                        "type": "serial",
                        "theme": "dark",
                        "pathToImages": "/lib/3/images/",
                        "autoMargins": false,
                        "marginLeft":30,
                        "marginRight":8,
                        "marginTop":10,
                        "marginBottom":26,
                        
                        "dataProvider": data,
                        "valueAxes": [{
                            "axisAlpha": 0,
                            "position": "left"
                        }],
                        "startDuration": 1,
                        "graphs": [{
                            "alphaField": "alpha",
                            "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>",
                            "dashLengthField": "dashLengthColumn",
                            "fillAlphas": 1,
                            "title": "Income",
                            "type": "column",
                            "valueField": this.valuefield,
                        }, {
                            "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b> [[additional]]</span>",
                            "bullet": "round",
                            "dashLengthField": "dashLengthLine",
                            "lineThickness": 3,
                            "bulletSize": 7,
                            "bulletBorderAlpha": 1,
                            "bulletColor": "#FFFFFF",
                            "useLineColorForBulletBorder": true,
                            "bulletBorderThickness": 3,
                            "fillAlphas": 0,
                            "lineAlpha": 1,
                            "title": "Expenses",
                            "valueField": "expenses"
                        }],
                        "categoryField": this.titlefield,
                        "categoryAxis": {
                            "gridPosition": "start",
                            "axisAlpha":0,
                            "tickLength":0
                        }
                    }
                
                
                var pieChart =  {
                    "type": "pie",
                    "theme": "dark",
                    "valueField": this.valuefield,
                    "titleField": this.titlefield,
                    "dataProvider": data,
                    "depth3D": 10,
                    "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
                    "angle": 15,
                    "exportConfig":{    
                        menuItems: [{
                            icon: 'https://www.amcharts.com/lib/3/images/export.png',
                            format: 'png'     
                        }]  
                    }
                };
                
                var piechartwithlegend = {
                    "type": "pie",	
                    "theme": "dark",
                    "legend": {
                        "markerType": "circle",
                        "position": "right",
                        "marginRight": 80,		
                        "autoMargins": false
                    },
                    "dataProvider":data,
                    "valueField": this.valuefield,
                    "titleField": this.titlefield,
                    "balloonText": "[[title]]<br><span style='font-size:14px'><b>[[value]]</b> ([[percents]]%)</span>",
                    "exportConfig": {
                        "menuTop":"0px",
                        "menuItems": [{
                            "icon": '/lib/3/images/export.png',
                            "format": 'png'
                        }]
                    }
                };
                
                var chart = AmCharts.makeChart(this.$.chartdiv,
                                               (function(charttype) {
                                                   switch(charttype) {
                                                       case "bar": return barChart;
                                                       case "pie": return pieChart;
                                                       case "donut" : return donutChart;
                                                       case "bar_rotate" : return barRotated;
                                                       case "pyramid" : return pyramid;
                                                       case "barline" : return barline;
                                                       case "pielegend" : return piechartwithlegend;
                                                   }
                                               })(this.charttype));
            }
        });
    </script>
</polymer-element>
<script>
document.addEventListener('WebComponentsReady', function() {
    SFDC.launch({
        accessToken: "{!$API.Session_ID}",
        instanceUrl: "https://" + window.location.hostname
    });
});
</script>
</apex:page>