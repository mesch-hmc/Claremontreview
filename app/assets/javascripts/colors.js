function coursePage() {
    return (window.location.href.split('/')[3] != null
        && window.location.href.split('/')[3] == 'courses');
};
function schoolColor() {
    var color = "#EAAA00";
    if (coursePage) {
        course = window.location.href.split('/').pop();
        school = course.substring(course.length-2, course.length);
        if (school == 'CM') {
            color = "#981B32";
        } else if (school == 'HM') {
            color = "#EAAA00";
        } else if (school == 'PO') {
            color = "#20438f";
        } else if (school == 'PZ') {
            color = "#f7941d";
        } else if (school == 'SC') {
            color = "#2e4d41";
        }
    }
    return color;
};
function convertHex(hex,opacity){
    hex = hex.replace('#','');
    r = parseInt(hex.substring(0,2), 16);
    g = parseInt(hex.substring(2,4), 16);
    b = parseInt(hex.substring(4,6), 16);

    result = 'rgba('+r+','+g+','+b+','+opacity/100+')';
    return result;
}

var ready;
ready = function() {
    if (coursePage()) {
        var elements = document.getElementsByClassName('fa-change');
        for (var i=0; i<elements.length; i++) {
            var curr_element = elements[i];
            curr_element.style.color=schoolColor();
        }
        var elements = document.getElementsByClassName('claremont');
        for (var i=0; i<elements.length; i++) {
            var curr_element = elements[i];
            curr_element.style.color=schoolColor();
        }
    }
};
$(document).ready(ready);
$(document).on('page:load', ready);
