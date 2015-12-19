#global module:false

"use strict"

module.exports = (grunt) ->
  grunt.loadNpmTasks "grunt-bower-task"
  grunt.loadNpmTasks "grunt-contrib-connect"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-exec"
  grunt.loadNpmTasks "grunt-jekyll"

  grunt.initConfig

    copy:
      jquery:
        files: [{
          expand: true
          cwd: "bower_components/jquery/dist/"
          src: "jquery.min.js"
          dest: "vendor/js/"
        }]
      bootstrap:
        files: [{
          expand: true
          cwd: "bower_components/bootstrap/dist/css/"
          src: "bootstrap.min.css"
          dest: "vendor/css/"
        },
        {
          expand: true
          cwd: "bower_components/bootstrap/dist/js/"
          src: "bootstrap.min.js"
          dest: "vendor/js/"
        }]
      materialize:
        files: [{
          expand: true
          cwd: "bower_components/materialize/dist/css/"
          src: "materialize.min.css"
          dest: "vendor/css/"
        },
        {
          expand: true
          cwd: "bower_components/materialize/dist/js/"
          src: "materialize.min.js"
          dest: "vendor/js/"
        }]

    jekyll: [
      server : {
        src : "templates"
        dest: "dev"
        server : true
        server_port : 8000
        auto : true
      },
      dev: {
        src: "templates"
        dest: "dev"
      },
      prod: {
        src: "templates"
        dest: "prod"
      }
      ]

    watch:
      options:
        livereload: true
      source:
        files: [
          "_drafts/**/*"
          "_includes/**/*"
          "_layouts/**/*"
          "_posts/**/*"
          "css/**/*"
          "js/**/*"
          "vendor/**/*"
          "images/*"
          "_config.yml"
          "*.html"
          "*.md"
        ]
        tasks: [
          "jekyll"
        ]

    connect:
      server:
        options:
          port: 4000
          base: '_site'
          livereload: true

  grunt.registerTask "build", [
    "copy"
    "jekyll"
  ]

  grunt.registerTask "serve", [
    "build"
    "connect:server"
    "watch"
  ]

  grunt.registerTask "default", [
    "serve"
  ]
