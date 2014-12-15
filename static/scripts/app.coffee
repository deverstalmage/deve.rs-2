# $ = jQuery = require 'jquery'
require 'angular'
require 'angular-route'

require './templates'


angular
  .module 'deve.rs', [
    'ngRoute'
    'deve.rs.'
  ]