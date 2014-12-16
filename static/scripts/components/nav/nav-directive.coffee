angular.module 'deve.rs.directives.nav', []
  .directive 'deversNav', ($location) ->
    link = (scope, element, attrs) ->
      scope.isActive = (slug) ->
        return slug == $location.path()

    return {
      restrict: 'A'
      link: link
    }