angular.module 'deve.rs.directives.nav', []
  .diretive 'deversNav', ($routeParams) ->
    link = (scope, element, attrs) ->
      scope.slug = $routeParams.slug

    return
      restrict: 'A'
      link: link