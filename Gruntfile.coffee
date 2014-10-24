path = require "path"
fs   = require "fs"

WT_HOME = process.env.WT_HOME

module.exports = (grunt) ->
    grunt.initConfig
        pkg: grunt.file.readJSON("package.json")

        cfg:
            build:    "#{path.join "static", "build", "production", "App"}"
            ext_root: "#{path.join process.env["HOME"], "develop", "js", "Sencha", "ext-4.2.2"}"

        # coffee compile task
        coffee:
            compile:
                options:            # coffee compile options
                    sourceMap: yes
                expand: yes         # use dynamic glob patterns when expanding src
                cwd: "src"          # all src paths are relative to here
                src:  [ "app/**/*.coffee", "app.coffee" ]
                dest: "static/"
                ext: ".js"

        copy:
            vm:
                files: [
                    cwd:    "static"
                    src:    ["app.js", "app/**"]
                    dest:   "#{WT_HOME}/codebase/netmarkets/html/nexiles/sulis.promowiz"
                    expand: yes
                ]



        # watch files
        watch:
            src:
                # unfortunately, no 'cwd' option like in the 'coffee' task.
                files: [
                    "src/app/**/*.coffee"
                    "src/app.coffee"
                    "resources/**"
                ]
                tasks: [ "coffee", "copy" ]
                options:
                    livereload: yes


    #grunt.loadNpmTasks "grunt-node-webkit-builder"
    grunt.loadNpmTasks "grunt-contrib-coffee"
    grunt.loadNpmTasks "grunt-contrib-watch"
    grunt.loadNpmTasks "grunt-contrib-uglify"
    grunt.loadNpmTasks "grunt-contrib-copy"
    grunt.loadNpmTasks "grunt-notify"

    grunt.registerTask "default", ["watch"]

    #grunt.registerTask "version", "bump the web app version", ->
        #version_file = grunt.config.get "cfg.version_file"
        #version = JSON.parse fs.readFileSync version_file
        #grunt.log.write "#{version.name} v#{version.version} - build #{version.build} - date #{version.date}"

    #grunt.registerTask "bump_version", "bump the web app version", ->
        #grunt.log.write "bumping version ...."
        #version_file = grunt.config.get "cfg.version_file"
        #version = JSON.parse fs.readFileSync version_file
        #version.build += 1
        #d = new Date()
        #version.date = "#{d.getFullYear()}-#{d.getMonth()+1}-#{d.getDate()}"
        #fs.writeFileSync version_file, JSON.stringify version
        #grunt.log.write "#{version.name} v#{version.version} - build #{version.build} - date #{version.date}"

# vim: set nolist ts=4 sw=4 expandtab :
