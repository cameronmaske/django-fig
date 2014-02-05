gulp = require 'gulp'
gutil = require 'gulp-util'

coffee = require 'gulp-coffee'
concat = require 'gulp-concat'
sass = require 'gulp-sass'
ngmin = require 'gulp-ngmin'
html2js = require 'gulp-ng-html2js'
htmlmin = require 'gulp-htmlmin'
cssmin = require 'gulp-minify-css'
rename = require "gulp-rename"

lr = require 'tiny-lr'
livereload = require 'gulp-livereload'
server = lr()

# Livereload server
gulp.task 'livereload', (next) ->
    server.listen 35729, (err) ->
        gutil.log(err)
        next()

gulp.task('coffee', ->
    gulp.src('app/**/*.coffee')
        .pipe(coffee().on('error', gutil.log))
        .pipe(concat('app.js'))
        .pipe(ngmin())
        .pipe(gulp.dest('../server/static/js/'))
        .pipe(livereload(server))
)

gulp.task('scss', ->
    gulp.src('style/**/*.scss')
        .pipe(sass().on('error', gutil.log))
        .pipe(cssmin({keepSpecialComments: 0}))
        .pipe(gulp.dest('../server/static/css/'))
        .pipe(livereload(server))
)

gulp.task('html2js', ->
    gulp.src('templates/**/*.template')
        .pipe(htmlmin({collapseWhitespace: true}))
        .pipe(rename((dir, base, ext) ->
            return base + ext))
        .pipe(html2js({moduleName:'ngTemplates'}))
        .pipe(concat('templates.js'))
        .pipe(gulp.dest('../server/static/js/'))
        .pipe(livereload(server))
)

gulp.task('vendor', ->
    # Make sure angular is at the top of the file.
    gulp.src(['vendor/**/angular.js', 'vendor/**/*.js'])
        .pipe(concat('vendor.js'))
        .pipe(gulp.dest('../server/static/js/'))
        .pipe(livereload(server))
)

gulp.task 'watch', ->
    # Watch coffee files.
    gulp.watch('app/**/*.coffee', ['coffee'])
    # Watch SCSS files.
    gulp.watch('style/**/*.scss', ['scss'])
    # Watch template files.
    gulp.watch('templates/**/*.template', ['html2js'])
    # Watch vendor files.
    gulp.watch('vendor/**/*.js', ['vendor'])


gulp.task('build', ['coffee', 'vendor', 'scss', 'html2js'])
gulp.task('default', ['livereload', 'build', 'watch'])