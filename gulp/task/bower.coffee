gulp = require 'gulp'
bower = require 'main-bower-files'
shell = require 'gulp-shell'
async = require 'async'
flatten = require 'gulp-flatten'
csscomb = require 'gulp-csscomb'
cssmin = require 'gulp-cssmin'
paths = require('../config').paths


gulp.task 'bower:install', shell.task(['bower install'])
gulp.task 'bower:flatten', () ->
  bowerPath = bower()
  async.forEach bowerPath, (file, cb) ->
    if /.*\.js$/.test(file)
      return gulp.src file
          .pipe flatten()
          .pipe gulp.dest "#{paths.dest.bower}"
    else if /.*\.css$/.test(file)
      return gulp.src file
          .pipe flatten()
          .pipe csscomb()
          .pipe cssmin()
          .pipe gulp.dest "#{paths.dest.bower}"