gulp = require 'gulp'
browserify = require 'browserify'
shim = require 'browserify-shim'
source = require 'vinyl-source-stream'
plugins = require('gulp-load-plugins') lazy: false
penthouse = require 'penthouse'
fs = require 'fs'

onError = (err) ->
  plugins.util.beep()
  console.log err
  return

URL = 'http://localhost:3000/'

gulp.task 'browserify', ->
  browserify
    entries: './static/scripts/app.coffee'
    extensions: [
      '.coffee'
      '.js'
      '.json'
    ]
  .bundle()
  .pipe plugins.plumber
    errorHandler: onError
  .pipe source 'app.js'
  .pipe gulp.dest './static/scripts'
  .pipe plugins.streamify plugins.uglify()
  .pipe plugins.rename 'app.min.js'
  .pipe gulp.dest './static/scripts'

gulp.task 'styles', ->
  # using libsass for foundation (compass)
  gulp.src './static/styles/app.scss'
    .pipe plugins.plumber
      errorHandler: onError
    .pipe plugins.sass
      outputStyle: 'expanded'
      includePaths: [
        './app'
        './node_modules'
      ]
    .pipe plugins.autoprefixer 'last 2 versions'
    .pipe gulp.dest './static/styles'
    .pipe plugins.size()
  return

gulp.task 'critical-css', ['styles'], ->
  penthouse
    url: URL
    css: './static/styles/app.css'
    height: 640
    width: 480
  , (err, criticalCss) ->
    fs.writeFileSync './static/styles/critical.css', criticalCss
    return

gulp.task 'images', ->
  gulp.src './static/uncompressed/images/**/*.{jpg,jpeg,png,gif,svg}'
    .pipe gulp.dest './static/compressed/images'
    .pipe plugins.size()
  return

gulp.task 'watch', ->
  gulp.watch [
    './views/**/*.jade'
    './static/scripts/**/*.js'
    './static/styles/**/*.css'
  ]
    .on 'change', plugins.livereload.changed
  gulp.watch [
    './static/scripts/**/*.coffee'
  ], ['browserify']
  gulp.watch './static/styles/**/*.scss', ['critical-css']
  gulp.watch './static/images/uncompressed/**/*.{jpg,png,jpeg,gif}', ['images']
  return

gulp.task 'livereload', ->
  plugins.livereload.listen()
  return

gulp.task 'default', [
  'livereload'
  'browserify'
  'critical-css'
  'images'
  'watch'
]

gulp.task 'build', [
  'browserify'
  'critical-css'
  'images'
]