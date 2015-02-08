gulp = require 'gulp'
watch = require 'gulp-watch'
paths = require('../config').paths

gulp.task 'watch', () ->

  watch ["#{paths.src.jade}/**/*.jade"], () ->
    gulp.start 'jade'

  watch ["#{paths.src.stylus}/**/*.styl"], () ->
    gulp.start ['css', 'imgcp']

  watch ["#{paths.src.coffee}/**/*.coffee"], () ->
    gulp.start ['coffee', 'browserify']

  watch ["#{paths.src.spec}/**/*.coffee", "#{paths.src.spec}/*.coffee"], () ->
    gulp.start 'test'

  watch ["#{paths.src.fixture}/**/*.jade", "#{paths.src.fixture}/*.jade"], () ->
    gulp.start 'fixture'
