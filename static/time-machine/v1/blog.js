var main = function () {
    var blogPosts = localStorage.getItem("blogPosts");


    // checking the state of the blogPosts variable
    switch (blogPosts) {
        case "WD":
            $(".blog").show();
            $(".blog").not(".WD").hide();
            break;
        case "L4C":
            $(".blog").show();
            $(".blog").not(".L4C").hide();
            break;
        case "OT":
            $(".blog").show();
            $(".blog").not(".OT").hide();
            break;
        default:
            $(".blog").show();
    }
}
$(document).ready(main);