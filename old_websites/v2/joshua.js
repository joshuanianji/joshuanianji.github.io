//Global variables and constants
const joshua = "HE'S AWESOME!!!";
const caleb = "HE'S AWESOME TOO!!";
const joshua_sucks = "Well, You swallow.";
const joshuaSucks = "Well, You swallow.";

$(document).ready(function() {

   changeTitle();
   animationClick("#title", "rubberBand");
   //making multiple variables!! remember to separate them by commas!
   var i = 0,
       lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in                     reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
       dateArray = $(".date").toArray(),
       months = [
         "January",
         "February",
         "March",
         "April",
         "May",
         "June",
         "July",
         "August",
         "September",
         "October",
         "November",
         "December"
       ],
       bill = '';

   $(".lorem").text(lorem);

   $(window).resize(function() {
      changeTitle();
      if ($("title").html() === "Joshua's Blog"){
         changeBodyBlog();
      }
   });

   if ($("title").html() === "Joshua's Blog") {
      //blog stuff


      /*$(".progress-bar").width("0px");
      setTimeout(function(){
         var width = $(".progress").width();
         setInterval(function(){
            if(i === width){
               clearInterval();
            } else {
               $(".progress-bar").width((i + 1) + "px");
               i++;
            }
         }, 100);
      }, 2000);*/
      //animates the progress bar to load evenly left to right.

      var blogPlaceHolders = $(".placeholder"),
          heightBlog = 0,
          blogClicked = false,
          blogFirst = false,
          topBlog = {},
          beforeLocation = {},
          beforeOffset = {};

      $(".real-stuff").hide();

      for(i = 0; i < blogPlaceHolders.length; i++){
         if(blogPlaceHolders[i].textContent === ''){
            blogPlaceHolders[i].style.display = 'none';
         } else {
            blogPlaceHolders[i].style.display = 'block';
         }
      }

      $(".blog_clicker").click(function(){
         if(blogClicked){
         //if the blog is already clicked...
            if(blogFirst){
               //if blogFirst is true
               $("clicked-true").children('real-stuff').slideUp(150, function(){
                  $(".blog").filter(":hidden").fadeIn(150, function(){
                     $(".clicked-true").removeClass('clicked-true');
                     blogClicked = false;
                     blogFirst = false;
                     beforeLocation = {};
                     beforeOffset = {};
                  });
               });
            } else {
               //if the blog is not first
               //the clicked-true blog gets its paragraph slid up. the removeClass() is no executed yet.
               $(".clicked-true").children(".real-stuff").slideUp(150, function(){
                  $(".clicked-true").animate({
                     //animates blog-clicked
                     top: beforeLocation.top
                     //the top gets its position back to its original
                  }, 150, "swing", function(){
                     $('.blog').filter(':hidden').fadeIn(150);
                     $(".clicked-true").offset({
                        top: beforeOffset.top
                     });
                     $('.clicked-true').removeClass("clicked-true");
                     blogClicked = false;
                     blogFirst = false;
                     beforeLocation = {};
                     beforeOffset = {};
                  });
               });
            }
         } else {

            if($('.blog_clicker').parent() === $("#body").children().first()){
               blogFirst = true;
               //if the blog is the first blog post
               $(this).parent().addClass('clicked-true');
               $(".blog").not(".clicked-true").fadeOut(150, function(){
                  $(".clicked-true").children(".real-stuff").slideDown(150);
                  blogClicked = true;
                  beforeOffset = {};
                  beforeLocation = {};
               });
            } else {
               blogFirst = false;
               //if the blog is not the first blog post
               $(this).parent().addClass("clicked-true");
               //adds class to the entire bog div
               beforeLocation.top = 0;
               beforeLocation = $(".clicked-true").position();
               //makes offset for the clicked-true class(only 1 div)
               beforeOffset.top = 0;
               //gtes coordinates relative to the document-cannot change position using a position method

               topBlog = $("#body div").first().position();
               beforeOffset = $(".clicked-true").offset();
               $(".blog").not(".clicked-true").fadeOut(150, function(){
                  //fades out all the blogs which are not clicked. after it is done...
                  $(".clicked-true").offset({
                     top: beforeOffset.top
                  });
                  $(".clicked-true").animate({
                     //animates the blog
                     top: topBlog.top
                     //makes it equal to the highest blog post. the title is responsive, remember.
                  }, 150, "swing", function(){
                     //easeInQuint for 150 milliseconds
                        $(".clicked-true").children(".real-stuff").slideDown(150, function(){
                        //the non-hidden blog gets the paragraph slid down
                        blogClicked = true;
                        //blog clicked turns true
                     });
                  });
               });
            }
         }
      });

      for (var x in dateArray) {
         var letter = 0;
         var letters = "";
         var counter = 0;
         var result = "";
         var slashes = 0;
         for (i = 0; i < dateArray[x].textContent.length; i++) {
            var length = dateArray[x].textContent.length;
            //repeats length of the specific "$(".date")" array
            letter = dateArray[x].textContent.charAt(counter);
            counter++;
            //starts counting "letter" at letter 1 of number 1 of the
            //$(".date") array
            if (counter === length) {
               //it is the third part, the year, so add "20"
               //in the front of it and add it into the result
               //since it is the last part, make slashes 0.
               //related to the last part of the script.
               result = result + " 20" + letters.toString() + letter.toString();
               result = "Blog by Joshua Ji in " + result;
               slashes = 0;
               //if the letter is equal to the last letter if the date
               //array, change the date text to the result
               dateArray[x].textContent = result;
               result = "";
               counter = 0;
               //breaks out of the loop completely, or else they will start to
               //analyze the decoded text.
               break;
            } else {
               //if the letter is not the last letter:
               if (letter != "/") {
                  //If the letter is not a slash
                  letters = letters + letter;
                  //add the letter to then variable letters
                  //increase counter by one-which is the variable
                  //to keep track of place of variable 'letters'
               } else {
                  //if the letter is a slash
                  if (slashes === 0) {
                     result = result + months[letters - 1];
                     letters = "";
                     slashes++;
                     //if it is in the first part of the date, make
                     //the first part the date the month. Increase
                     //the slash counter as well
                  } else if (slashes === 1) {
                     result = result + " " + letters.toString() + ",";
                     letters = "";
                     slashes++;
                     //if it is the second part, the day, just make
                     //it into a string and add it to the result
                     //the last part is
                  }
               }
            }
         }
      }
   }
});
