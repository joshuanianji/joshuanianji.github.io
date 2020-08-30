'use strict';

myModule
    //le faces
    .directive('shrug', function () {
        return {
            restrict: 'AE',
            replace: false,
            template: '<p>¯\\_(ツ)_/¯</p>'
            //\\ on the template b/c backslash escapes characters
        };
    })
    .directive('lenny', function () {
        return {
            restrict: 'AE',
            replace: false,
            template: '<p>( ͡° ͜ʖ ͡°)</p>'
        };
    })
    .directive('disapproval', function () {
        return {
            restrict: 'AE',
            replace: false,
            template: '<p>ಠ_ಠ</p>'
        };
    });