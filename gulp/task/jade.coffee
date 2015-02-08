gulp = require 'gulp'
rawJade = require 'jade'
jade = require 'gulp-jade'
plumber = require 'gulp-plumber'
runSequence = require 'run-sequence'
paths = require('../config').paths

gulp.task 'jade', () ->
  gulp.src ["#{paths.src.jade}/**/!(_)*.jade"]
    .pipe plumber()
    .pipe jade
      jade: rawJade
      pretty: true
    .pipe gulp.dest "#{paths.dest.html}"