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

gulp.task 'default', () ->
  runSequence(
    'clean'
    ['bower', 'image', 'sprite']
    ['jade', 'stylus', 'coffee']
    ['kss', 'test']
  )