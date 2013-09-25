module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    coffee:
      options:
        sourceMap: true
      src:
        expand: true
        cwd: "src/"
        src: ["index.coffee"]
        dest: ""
        ext: ".js"

    mochaTest:
      test:
        options:
          ui: "bdd"
          bail: false
          reporter: "spec"
        src: ["test/**/*.coffee"]

    watch:
      node_project_files:
        files: ["src/**/*.coffee"]
        tasks: ["coffee:src"]


  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-mocha-test"

  # Default task(s).

  grunt.registerTask "default", ["coffee"]
  grunt.registerTask "test", ["mochaTest"]