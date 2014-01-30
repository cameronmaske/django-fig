module.exports = (grunt) ->
    # Speeds up Grunt.
    # https://medium.com/written-in-code/ced193c2900b
    require('jit-grunt')(grunt,
      watch : "grunt-contrib-watch"
      coffee: "grunt-contrib-coffee"
      sass: "grunt-contrib-sass"
      ngmin: "grunt-ngmin"
      concat: "grunt-concat"
      newer: "grunt-newer"
      cssmin: "grunt-contrib-cssmin"
      copy: "grunt-contrib-copy"
      html2js: "grunt-html2js"
    )

    grunt.initConfig
        pkg: grunt.file.readJSON('provisioner/builder/package.json')
        watch:
            coffee:
                files: [
                    'client/**/*.coffee'
                ]
                tasks: ['newer:coffee', 'ngmin:app', 'concat:app']
            vendor:
                files: ['client/vendor/**/*.js']
                tasks: ['ngmin:vendor', 'concat:vendor']
            sass:
                files: ['client/style/**/*.scss']
                tasks: ['sass', 'cssmin:concat']
            templates:
                files: ['client/templates/**/*.template']
                tasks: ['html2js', 'copy:templates']
            options:
                livereload: true
                # Speeds up the reaction time of the watch!
                spawn: false
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
            vendor:
                expand: true
                cwd: 'client/vendor/'
                src: '**/*.js'
                dest: 'build/js/vendor/minifed'
        copy:
            templates:
                src: 'build/js/templates/templates.js'
                dest: 'server/static/js/templates.js'
        concat:
            app:
                src: ['build/js/app/minifed/**/*.js']
                dest: 'server/static/js/app.js'
            vendor:
                # Order matters here! We need angular.js first in the file.
                src: ['build/js/vendor/minifed/**/angular.js', 'build/js/vendor/minifed/**/*.js']
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
        html2js:
            main:
                options:
                    base: 'client'
                    module: 'ngTemplates'
                    rename: (filepath) ->
                        # Removes any folders, renamed to filename only.
                        # templates/graph.template -> graph.template
                        return filepath.split('/').pop()
                src: ['client/templates/**/*.template']
                dest: 'build/js/templates/templates.js'

    #grunt.loadNpmTasks 'grunt-contrib-sass'
    #grunt.loadNpmTasks 'grunt-contrib-watch'
    #grunt.loadNpmTasks 'grunt-contrib-coffee'
    #grunt.loadNpmTasks 'grunt-ngmin'
    #grunt.loadNpmTasks 'grunt-contrib-concat'
    #grunt.loadNpmTasks 'grunt-contrib-cssmin'
    #grunt.loadNpmTasks 'grunt-contrib-copy'
    grunt.registerTask 'build', ['coffee', 'copy', 'ngmin', 'concat', 'sass', 'cssmin']