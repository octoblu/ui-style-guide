gulp    = require 'gulp'
concat  = require 'gulp-concat'
less    = require 'gulp-less'
webserver = require 'gulp-webserver'

gulp.task 'server',  ->
  gulp
    .src 'site'
    .pipe webserver
      host: '0.0.0.0'
      livereload: true
      open: true

gulp.task 'less', ->
  gulp
    .src './assets/less/manifest.less'
    .pipe less().on 'error', (err) ->
      console.error err
      this.emit 'end'
    .pipe concat('styles.css')
    .pipe gulp.dest('./site/assets/styles')

gulp.task 'watch', ->
  gulp.watch ['./assets/less/**/*.less'], ['less']

gulp.task 'default', ['server', 'watch']
