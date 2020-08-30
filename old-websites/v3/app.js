'use strict';

$(document).ready(function () {

    //so the bootstrap nav bar will work
    $(".nav li").on("click", function () {
        $(".nav li").removeClass("active");
        $(this).addClass("active");
    });

    $("#brand").on("click", function () {
        $(".nav li").removeClass("active");
        $(".nav li#home").addClass("active");
    });

});

// Declare app level module which depends on views, and components
var myModule = angular.module('myApp', [
    'ui.router'
]);
myModule.config(function ($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise("/home");

    $stateProvider
        .state('home', {
            url: '/home',
            views: {
                "view-carousel": {
                    templateUrl: 'views/main-views/carousels/carousel_home.html'
                },
                "main-view": {
                    templateUrl: 'views/main-views/mains/main_home.html'
                }
            }
        })
        .state('blog', {
            url: '/blog',
            views: {
                "view-carousel": {
                    templateUrl: 'views/main-views/carousels/carousel_blog.html'
                },
                'main-view': {
                    templateUrl: 'views/main-views/mains/main_blog.html',
                    controller: 'blogController'
                }
            }
        });
});
myModule.controller('titleController', ['$scope', '$log', function ($scope, $log) {
    //controller
}]);
myModule.controller('blogController', ['$scope', '$log', function ($scope, $log) {

    $scope.log = function (log) {
        console.log(log);
    };

    $scope.test = 'testing';
    $scope.testArray = blogs;
    $scope.arrayNum = $scope.testArray.length;
    $scope.arrayDivided = [];

    $scope.counter = 0;

    for (var i = 0; i < Math.ceil($scope.testArray.length / 5); i++) {

        var fleetingArray = [];

        if ($scope.counter <= $scope.testArray.length - 5) {

            for (var j = 0; j < 5; j++) {
                fleetingArray.push($scope.testArray[$scope.counter]);
                $scope.counter++;
            }

            $scope.arrayDivided.push(fleetingArray);

        } else {

            var fleetingCounter = $scope.counter;

            for (var j = 0; j < $scope.testArray.length - fleetingCounter; j++) {

                fleetingArray.push($scope.testArray[$scope.counter]);
                $scope.counter++;
            }

            $scope.arrayDivided.push(fleetingArray);
            $scope.counter = 0;

        }

    }

    $log.info('Dividing $scope.testArray is finished. $scope.arrayDivided is ' + $scope.arrayDivided.length + ' value(s) long.');

    $scope.arrayDividedCounter = 0;
    // To show which array piece on the arrayDivided we are on.
    $scope.currentArray = $scope.arrayDivided[$scope.arrayDividedCounter];
    $scope.previous = function () {
        if ($scope.arrayDividedCounter > 0) {

            $scope.arrayDividedCounter--;
            $scope.currentArray = $scope.arrayDivided[$scope.arrayDividedCounter];

        } else {

            $scope.arrayDividedCounter = $scope.arrayDivided.length - 1;
            $scope.currentArray = $scope.arrayDivided[$scope.arrayDividedCounter];

        }
    };
    $scope.next = function () {
        if ($scope.arrayDividedCounter < $scope.arrayDivided.length - 1) {

            $scope.arrayDividedCounter++;
            $scope.currentArray = $scope.arrayDivided[$scope.arrayDividedCounter];

        } else {

            $scope.arrayDividedCounter = 0;
            $scope.currentArray = $scope.arrayDivided[$scope.arrayDividedCounter];

        }
    };
    $scope.oldest = function () {
        $scope.arrayDividedCounter = $scope.arrayDivided.length - 1;
        $scope.currentArray = $scope.arrayDivided[$scope.arrayDividedCounter];
    };
    $scope.newest = function () {
        $scope.arrayDividedCounter = 0;
        $scope.currentArray = $scope.arrayDivided[$scope.arrayDividedCounter];
    };

}]);