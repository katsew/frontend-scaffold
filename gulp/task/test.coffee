gulp = require 'gulp'
karma = require('karma').server
rawJade = require 'jade'
jade = require 'gulp-jade'
paths = require('../config').paths


gulp.task 'fixture:gen', () ->
  return gulp.src ["#{paths.src.fixture}/**/*.jade"]
    .pipe jade
      jade: rawJade
      pretty: true
    .pipe gulp.dest "#{paths.dest.fixture}"

gulp.task 'test', (done) ->
  karma.start({
    configFile: __dirname + '/../../karma.conf.js',
    singleRun: false
  }, done)