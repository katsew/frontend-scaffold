gulp = require 'gulp'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
gzip = require 'gulp-gzip'
source = require 'vinyl-source-stream'
streamify = require 'gulp-streamify'
browserify = require 'browserify'
plumber = require 'gulp-plumber'
paths = require('../config').paths


gulp.task 'coffee', () ->
  gulp.src ["#{paths.src.coffee}/**/*", "!#{paths.src.coffee}/app/*"]
    .pipe coffee({bare:true})
    .pipe gulp.dest "#{paths.tmp.js}"
    .pipe uglify({
      preserveComments: false
    })
    .pipe gulp.dest "#{paths.dest.js}"
    .pipe gzip({ append: true })
    .pipe gulp.dest "#{paths.dest.js}"

gulp.task 'browserify', () ->
  browserify
    entries: ["#{paths.src.coffee}/app/app.coffee"]
    extensions: ['.coffee', '.js']
  .transform 'coffeeify'
  .bundle()
  .pipe plumber()
  .pipe source 'app.js'
  .pipe gulp.dest "#{paths.tmp.js}/app"
  # .pipe streamify(uglify({ preserveComments: true }))
  .pipe gulp.dest "#{paths.dest.js}/app"
  .pipe gzip({append: true})
  .pipe gulp.dest "#{paths.dest.js}/app"