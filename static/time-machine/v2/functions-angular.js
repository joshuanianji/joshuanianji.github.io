//Angular.js!
var myApp = angular.module('App', []);
myApp.controller('all', ['$scope', function($scope){
   $scope.characters = '';
   $scope.textReset = function(){
      $scope.characters = null;
   };
}]);

//Functions!
function changeBodyBlog(){
   var footerHeight = $("#footer").height();
   $("#body").css("padding-bottom", footerHeight + "px");
}

function animationHover(elements, animation) {
   var element = $(elements);
   element.hover(function(){
      element.addClass('animated ' + animation);
   }, function(){
      setTimeout(function(){
         element.removeClass('animated ' + animation);
      }, 1000);
   });
}

function animationClick(elements, animation) {
   var element = $(elements);
   element.click(function(){
      element.addClass('animated ' + animation);
      setTimeout(function(){
         element.removeClass('animated ' + animation);
      }, 1000);
   });
}

function changeTitle() {
   var width = $("body").width();
   var w = width;
   width = (w * 0.07);
   if (width < 50) {
      width = 50;
   }
   $("#title").css("font-size", width);
}

function alrt(text) {
   if(text === ''){
      alert("hello");
   } else {
      alert(text);
   }
}
