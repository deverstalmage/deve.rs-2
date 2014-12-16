$ = jQuery = require 'jquery'
attachFC = require 'fastclick'
require 'angular'
require 'angular-route'
require 'angular-animate'

require './templates'

require './components/nav/nav-directive'
require './components/view/view-directive'

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
    'ngAnimate'
    'deve.rs.templates'
    'deve.rs.directives.nav'
    'deve.rs.directives.view'
  ]
  .config Config
  .run ->
    attachFC document.body
