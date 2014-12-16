$ = jQuery = require 'jquery'
angular.module 'deve.rs.directives.view', []
  .directive 'deversView', ($location, $templateCache, $route, $rootScope, $animate) ->
    link = (scope, element, attrs) ->
      first = true
      $rootScope.$on '$routeChangeSuccess', (event, next, current) ->
        if not first
          element.html $templateCache.get next.slug + '/index.html'
        first = false

    return {
      restrict: 'A'
      link: link
    }
