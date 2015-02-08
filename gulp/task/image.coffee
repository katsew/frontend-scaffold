gulp = require 'gulp'
imgmin = require 'gulp-imagemin'
paths = require('../config').paths


gulp.task 'imgmin', () ->
  return gulp.src ["#{paths.src.image}/**/*"]
    .pipe imgmin()
    .pipe gulp.dest "#{paths.dest.image}"

gulp.task 'imgcp', () ->
  return gulp.src ["#{paths.src.image}/**/*"]
    .pipe gulp.dest "#{paths.dest.image}"