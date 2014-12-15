angular.module 'deve.rs.directives.nav', []
  .directive 'deversNav', ($routeParams) ->
    link = (scope, element, attrs) ->
      scope.slug = $routeParams.slug
      console.log element

    return {
      restrict: 'A'
      link: link
    }