gulp = require 'gulp'
runSequence = require 'run-sequence'
spritesmith = require 'gulp.spritesmith'
imagemin = require 'gulp-imagemin'
plumber = require 'gulp-plumber'
paths = require('../config').paths


gulp.task 'sprite', (callback) ->
  return runSequence(
    ['sprite:icon', 'sprite:button', 'sprite:arrow'],
    callback
  )

gulp.task 'sprite:icon', () ->
  spriteData = gulp.src ["#{paths.src.image}/sprite/icon/*"]
    .pipe plumber()
    .pipe spritesmith
      imgName: 'icon.png'
      imgPath: '../image/sprite/icon.png'
      cssName: '_icon.styl'
      algorithm: 'binary-tree'
      padding: 20
      cssSpritesheetName: 'icon_sprite'
      cssVarMap: (sprite) ->
        sprite.name = 'icon-' + sprite.name
        return false
  spriteData.img
    .pipe imagemin()
    .pipe gulp.dest "#{paths.dest.sprite.image}"
  spriteData.css
    .pipe gulp.dest "#{paths.dest.sprite.css}"


gulp.task 'sprite:button', () ->
  spriteData = gulp.src ["#{paths.src.image}/sprite/button/*"]
    .pipe plumber()
    .pipe spritesmith
      imgName: 'button.png'
      imgPath: '../image/sprite/button.png'
      cssName: '_button.styl'
      algorithm: 'binary-tree'
      padding: 20
      cssSpritesheetName: 'button_sprite'
      cssVarMap: (sprite) ->
        sprite.name = 'button-' + sprite.name
        return false
  spriteData.img
    .pipe imagemin()
    .pipe gulp.dest "#{paths.dest.sprite.image}"
  spriteData.css
    .pipe gulp.dest "#{paths.dest.sprite.css}"

gulp.task 'sprite:arrow', () ->
  spriteData = gulp.src ["#{paths.src.image}/sprite/arrow/*"]
    .pipe plumber()
    .pipe spritesmith
      imgName: 'arrow.png'
      imgPath: '../image/sprite/arrow.png'
      cssName: '_arrow.styl'
      algorithm: 'binary-tree'
      padding: 20
      cssSpritesheetName: 'arrow_sprite'
      cssVarMap: (sprite) ->
        sprite.name = 'arrow-' + sprite.name
        return false
  spriteData.img
    .pipe imagemin()
    .pipe gulp.dest "#{paths.dest.sprite.image}"
  spriteData.css
    .pipe gulp.dest "#{paths.dest.sprite.css}"