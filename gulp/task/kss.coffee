gulp = require 'gulp'
shell = require 'gulp-shell'
paths = require('../config').paths

gulp.task 'kss', ->
  gulp.src 'assets'
    .pipe shell(['assets/shell/kss_template_install.cmd'])
    .pipe shell "kss-node #{paths.src.stylus} -y #{paths.src.stylus}/common.styl --template libs/kss-node-template/template --destination styleguide"
  return
