gulp = require 'gulp'
browserSync = require 'browser-sync'
mockServer = require('easymock').MockServer

gulp.task 'browserSync', () ->
  browserSync({
    server: {
      baseDir: ['public'],
      index: 'index.html'
    },
    startPath: '/html/index.html',
    files: ['public/html/*.html', 'public/css/*.css', 'public/js/*.js', 'public/image/*'],
    # browser: ['google chrome', 'firefox', 'safari'],
    port: 8000
  })

gulp.task 'easymock', () ->
  options =
    keepalive: true
    port: 3000
    path: 'mock'
    cors: true
    jsonp: true
  server = new mockServer(options)
  server.start()