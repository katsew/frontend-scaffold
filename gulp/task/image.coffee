gulp = require 'gulp'
imgmin = require 'gulp-imagemin'
paths = require('../config').paths


gulp.task 'imagemin', () ->
  gulp.src ["#{paths.src.image}/**/*"]
    .pipe imgmin()
    .pipe gulp.dest "#{paths.dest.image}"

gulp.task 'imagecp', () ->
  gulp.src ["#{paths.src.image}/**/*"]
    .pipe gulp.dest "#{paths.dest.image}"