var ready;
ready = function() {
    if (coursePage()) {
        grade_distr = $("#gradeDistribution").html().split(","), a = new Array, labels = new Array;
        for (var e = 0; e < grade_distr.length; e++) 0 != grade_distr[e].length && (datapts = grade_distr[e].split(":"), labels.push(datapts[0]), a.push(parseInt(datapts[1])));
        new_labels = ["A+","A","A-","B+","B","B-","C+","C","C-","D+","D","D-","F","HP","P","NC"], new_data = new Array(new_labels.length);
        for (var e = 0; e < labels.length; e++) {
            var t = labels.indexOf(new_labels[e]); - 1 != t && (new_data[e] = a[t])
        }
        var a = {
            labels: new_labels,
            datasets: [{
                backgroundColor: convertHex(schoolColor(), 100),
                borderColor: convertHex(schoolColor(), 100),
                data: new_data
            }]
        },
        r = {
            responsive: true,
            maintainAspectRatio: true,
            hover: {
                mode: ''
            },
            legend: {
                display: false
            },
            tooltips: {
                enabled: false
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    },
                    gridLines: {
                        display: true,
                        color: "rgba(0,0,0,.05)",
                        lineWidth: 1
                    }
                }]
            },
        };
        var ctx = document.getElementById("gradeChart");
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: a,
            options: r
        });
    }
};
$(document).ready(ready);
$(document).on('page:load', ready);
