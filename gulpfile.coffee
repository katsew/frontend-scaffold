gulp = require 'gulp'
gulp._maxListeners = 99
runSequence = require 'run-sequence'
requireDir = require 'require-dir'
dir = requireDir './gulp/task'


# task
gulp.task 'bower', () ->
  runSequence('bower:install', 'bower:flatten')

gulp.task 'server', () ->
  runSequence('easymock', 'browserSync')

gulp.task 'clean', () ->
  runSequence(
    ['clean:css', 'clean:js', 'clean:tmp', 'clean:html', 'clean:image', 'clean:bower']
  )

gulp.task 'javascript', () ->
  runSequence(['coffee', 'browserify'])

gulp.task 'default', () ->
  runSequence(
    ['clean']
    ['bower', 'imagemin']
    ['jade', 'stylus', 'javascript']
    ['kss']
  )