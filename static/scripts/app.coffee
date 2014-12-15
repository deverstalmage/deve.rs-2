# $ = jQuery = require 'jquery'
require 'angular'
require 'angular-route'

require './templates'

require './components/nav/nav-directive'

Config = ($routeProvider, $locationProvider) ->
  $routeProvider
    .when '/',
      templateUrl: 'home/index.html'
      slug: 'home'
    .when '/projects',
      templateUrl: 'projects/index.html'
      slug: 'projects'
    .when '/skills',
      templateUrl: 'skills/index.html'
      slug: 'skills'
    .when '/contact',
      templateUrl: 'contact/index.html'
      slug: 'contact'
  $locationProvider.html5Mode true

angular
  .module 'deve.rs', [
    'ngRoute'
    'deve.rs.templates',
    'deve.rs.directives.nav'
  ]
  .config Config