gulp = require 'gulp'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
gzip = require 'gulp-gzip'
paths = require('../config').paths


gulp.task 'coffee', () ->
  gulp.src ["#{paths.src.coffee}/**/*"]
    .pipe coffee({bare:true})
    .pipe gulp.dest "#{paths.tmp.js}"
    .pipe uglify({
      preserveComments: false
    })
    .pipe gulp.dest paths.dest.js
    .pipe gzip({ append: true })
    .pipe gulp.dest "#{paths.dest.js}"