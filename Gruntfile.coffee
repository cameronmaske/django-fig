module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON('provisioner/builder/package.json')
        watch:
            coffee:
                files: [
                    'client/**/*.coffee'
                ]
                tasks: ['coffee', 'ngmin:app', 'concat:app']
            vendor:
                files: ['client/vendor/**/*.js']
                tasks: ['copy:vendor', 'concat:vendor']
            sass:
                files: ['client/style/**/*.scss']
                tasks: ['sass', 'cssmin:concat']
            options:
                livereload: true
                # Not sure if these are nessecary anymore...
                # interval: 5007
                # nospawn: true
        coffee:
            source:
                expand: true
                cwd: 'client/app/'
                src: ['**/*.coffee']
                dest: 'build/js/app/raw'
                ext: '.js'
        ngmin:
            app:
                expand: true
                cwd: 'build/js/app/raw'
                src: ['**/*.js']
                dest: 'build/js/app/minifed'
        copy:
            vendor:
                filter: 'isFile'
                expand: true
                flatten: true
                cwd: 'client/vendor/'
                src: '**/*.js'
                dest: 'build/js/vendor/'
        concat:
            app:
                src: ['build/js/app/minifed**/*.js']
                dest: 'server/static/js/app.js'
            vendor:
                src: ['build/js/vendor/angular.js', 'build/js/vendor/**/*.js']
                dest: 'server/static/js/vendor.js'
        sass:
            compile:
                files:
                    'build/css/main.css': 'client/style/main.scss'
        cssmin:
            concat:
                options:
                    keepSpecialComments: 0
                files:
                    'server/static/css/main.css': 'build/css/**/*.css'

    grunt.loadNpmTasks 'grunt-contrib-sass'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-ngmin'
    grunt.loadNpmTasks 'grunt-contrib-cssmin'
    grunt.loadNpmTasks 'grunt-contrib-concat'
    grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.registerTask 'build', ['coffee', 'copy', 'ngmin', 'concat', 'sass', 'cssmin']