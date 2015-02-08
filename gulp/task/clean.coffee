gulp = require 'gulp'
del = require 'del'
paths = require('../config').paths


gulp.task 'clean:css', (cb) ->
  del("#{paths.dest.css}/**/*.css*", {force: true}, cb)

gulp.task 'clean:js', (cb) ->
  del("#{paths.dest.js}/**/*.js*", {force: true}, cb)

gulp.task 'clean:tmp', (cb) ->
  del("#{paths.tmp.js}/**/*.js*", {force: true}, cb)

gulp.task 'clean:html', (cb) ->
  del("#{paths.dest.html}/**/*.html", {force: true}, cb)

gulp.task 'clean:image', (cb) ->
  del("#{paths.dest.image}/**/*", {force: true}, cb)

gulp.task 'clean:bower', (cb) ->
  del("#{paths.dest.bower}/**/*", {force: true}, cb)