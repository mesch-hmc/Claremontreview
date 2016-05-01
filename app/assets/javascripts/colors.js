var ready;
ready = function() {
    if (window.location.href.split('/')[3] != null && window.location.href.split('/')[3] == 'courses') {
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
        } else {
            color = "#EAAA00";
        }
        var elements = document.getElementsByClassName('fa');
        for (var i=0; i<elements.length; i++) {
            var curr_element = elements[i];
            curr_element.style.color=color;
        }
        var elements = document.getElementsByClassName('claremont');
        for (var i=0; i<elements.length; i++) {
            var curr_element = elements[i];
            curr_element.style.color=color;
        }
    }
};
$(document).ready(ready);
$(document).on('page:load', ready);
