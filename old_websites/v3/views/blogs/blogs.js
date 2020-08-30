/*(function() {

  'use strict';

  var settings = $("#setting");
  var settingPosition = settings.getBoundingClientRect();
  var placeholder = $("<div>");
  placeholder.style.width = settingPosition.width + 'px';
  placeholder.style.height = settingPosition.height + 'px';
  var isAdded = false;

  window.addEventListener('scroll', function() {
    if (window.pageYOffset >= settingPosition.top && !isAdded) {
      menu.addClass('sticky');
      menu.parentNode.insertBefore(placeholder, menu);
      isAdded = true;
    } else if (window.pageYOffset < settingPosition.top && isAdded) {
      menu.removeClass('sticky');
      menu.parentNode.removeChild(placeholder);
      isAdded = false;
    }
  });
})*/

function makeTextWeird() {
    'use strict';
    $(".text").addClass('ugly');
}

function revertText() {
    'use strict';
    $(".text").removeClass('ugly');
}

var blogModule = angular.module('')

//directives
myModule
    .directive('head-blog', function () {
        'use strict';
        return {
            restrict: 'AE',
            replace: true,
            scope: {
                title: '='
            },
            templateUrl: 'blog-template-head.html'
        };
    });