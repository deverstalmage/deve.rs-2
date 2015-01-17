angular.module 'deve.rs.directives.nav', []
  .directive 'deversNavItem', ($rootScope, $location) ->
    link = (scope, element, attrs) ->
      href = element.attr 'href'
      $rootScope.$on '$locationChangeSuccess', ->
        element.removeClass 'active'
        element.addClass 'active' if href == $location.path()

    return {
      restrict: 'A'
      link: link
    }