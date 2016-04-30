var ready;
ready = function() {
    grade_distr = $("#gradeDistribution").html().split(","), a = new Array, labels = new Array;
    for (var e = 0; e < grade_distr.length; e++) 0 != grade_distr[e].length && (datapts = grade_distr[e].split(":"), labels.push(datapts[0]), a.push(parseInt(datapts[1])));
    new_labels = ["A+","A","A-","B+","B","B-","C+","C","C-","D+","D","D-","F","HP","P","W","NC"], new_data = new Array(new_labels.length);
    for (var e = 0; e < labels.length; e++) {
        var t = labels.indexOf(new_labels[e]); - 1 != t && (new_data[e] = a[t])
    }
    var a = {
        labels: new_labels,
        datasets: [{
            backgroundColor: "rgba(234,170,0,0.5)",
            borderColor: "rgba(234,170,0,0.5)",
            data: new_data
        }]
    },
    r = {
        scaleBeginAtZero: true,
        scaleShowGridLines: true,
        scaleGridLineColor: "rgba(0,0,0,.05)",
        scaleGridLineWidth: 1,
        barShowStroke: true,
        scaleFontSize: 16,
        responsive: true,
        maintainAspectRatio: true,
        showTooltips: false,
        barStrokeWidth: 1,
        barValueSpacing: 4,
        barDatasetSpacing: 1,
        //legendTemplate: '<ul class="<%=name.toLowerCase()%>-legend"><% for (var i=0; i<datasets.length; i++){%><li><span style="background-color:<%=datasets[i].lineColor%>"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>'
        legend: {
            display: false
        }
    };
    //c.attr("width", "300"), c.attr("height", "280"), myNewChart = new Chart(ctx).Bar(a, r)
    var ctx = document.getElementById("gradeChart");
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: a,
        options: r
    });
};
$(document).ready(ready);
$(document).on('page:load', ready);
