//special functions for me!!
var log = {
    log: function (text) {
        console.log(text);
    },
    info: function (text) {
        console.info(text);
    },
    error: function (text) {
        console.error(text);
    }
};

var jumpScroll = function (x, y) {
    window.scrollTo(x, y);
};

//to use with animate.css
function animateElement(element, animation) {
    element = $(element);
    element.addClass('animated ' + animation);
    //wait for animation to finish before removing classes
    window.setTimeout(function () {
        element.removeClass('animated ' + animation);
    }, 1000);
};

var age = function () {
    var currentDate = new Date();
    var currentYear = currentDate.getFullYear();
    var currentMonth = currentDate.getMonth();
    var currentDay = currentDate.getDate();
    //since javascript starts at 0, 4 is May.
    var ageDate = new Date(2002, 4, 27)
    var ageYear = ageDate.getFullYear();
    var ageMonth = ageDate.getMonth();
    var ageDay = ageDate.getDate();

    var age = currentYear - ageYear;
    if (currentMonth < ageMonth) {
        age = age - 1;
    } else if (currentMonth > ageMonth) {
        age = age;
    } else {
        if (currentDay < ageDay) {
            age = age - 1;
        } else {
            age = age;
        }
    }
    return age;
};

var returnHomeCarouselIntervalVariables = function (array, html) {

    var jHtml = $(html);
    var x = 0;
    var currentCarousel = array[x];
    jHtml.text(currentCarousel);
    x++;

    return {
        html: jHtml,
        counter: x,
        currentCarousel: currentCarousel
    }
};