#global module:false
module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    watch:

      stylesheets:
        files: "scss/**/*"
        tasks: "compass:dev"

      livereload:
        files: ["dist/css/*", "dist/*.html"]
        options:
          livereload: true

      images:
        files: "opt-imgs/*"
        tasks: "optimizeImages"

      partials:
        files: ["partials/*", "data/*"]
        tasks: ["assemble"]
        options:
          livereload: true

      data:
        files: "data/**/*"
        tasks: "assemble"

      javascript:
        files: ["coffee/*", "js/*.js"]
        tasks: "javascript:dev"

      jsTesting:
        files: "dist/js/*.js"
        tasks: "jasmine"

      cukes:
        files: ["features/*.feature", "features/step_definitions/*.coffee"]
        tasks: "cucumberjs"

      publicDirectory:
        files: [ "public/**/*" ]
        tasks: "default"

    compass:
        dev:
          options:
            environment: 'dev'
        dist:
          options:
            environment: 'production'

    coffee:
      compile:
        files:
          "js/app.js": ["coffee/foundry-listing.coffee", "coffee/foundry-detail.coffee", "coffee/app.coffee"]
      jasmine_specs:
        files: grunt.file.expandMapping(["specs/*.coffee"], "specs/js/", {
          rename: (destBase, destPath) ->
            destBase + destPath.replace(/\.coffee$/, ".js").replace(/specs\//, "")
        })

    assemble:
      options:
        partials: "partials/*.hbs"
        data: "data/common/*.yml"
        pkg: "<%= pkg %>"
      index:
        options:
          data: "data/index/*.yml"
        src: "partials/index.hbs"
        dest: "dist/index.html"
      home:
        options:
          data: "data/home/*.yml"
        src: "partials/home.hbs"
        dest: "dist/home.html"
      foundry_listing:
        options:
          data: "data/foundry-listing/*.yml"
        src: "partials/foundry-listing.hbs"
        dest: "dist/foundry-listing.html"
      foundry_entry:
        options:
          data: "data/foundry-entry/*.yml"
        src: "partials/foundry-entry.hbs"
        dest: "dist/foundry-entry.html"
      team:
        options:
          data: "data/team/*.yml"
        src: "partials/team.hbs"
        dest: "dist/team.html"
      work:
        options:
          data: "data/work/*.yml"
        src: "partials/work.hbs"
        dest: "dist/work.html"
      foundry_header:
        options:
          data: "data/foundry/*.yml"
        src: "partials/foundry-header.hbs"
        dest: "../foundry/forgeIt/expressionengine/templates/default_site/includes.group/foundry-header.html"
      foundry_footer:
        options:
          data: "data/foundry/*.yml"
        src: "partials/foundry-footer.hbs"
        dest: "../foundry/forgeIt/expressionengine/templates/default_site/includes.group/foundry-footer.html"

    concat:
      js:
        src: ["js/libs/*", "js/app.js"]
        #put it in dist/
        dest: "dist/js/<%= pkg.name %>.js"

    sg:
      default_options:
        options:
          css:  'scss'
          project_css: 'mq-base'
          html: 'partials'
          data: 'data/styleguide'
          dest: 'dist/styleguide'
          syntax: 'tomorrow-night'
          logo: '/img/styleguide-sb-logo.jpg'
          js: ["/js/Sparkbox.js"]

    modernizr:
      devFile: "dist/js/modernizr.js"
      outputFile: "dist/js/modernizr.js"
      extra:
        shiv: true
        printshiv: true
        load: true
        mq: false
        cssclasses: true

      extensibility:
        addtest: false
        prefixed: false
        teststyles: false
        testprops: false
        testallprops: false
        hasevents: false
        prefixes: false
        domprefixes: false

      uglify: true
      parseFiles: true
      matchCommunityTests: false

    clean:
      all:
        src: "dist/*"
        dot: true # clean hidden files as well

    copy:
      main:
        files: [
          expand: true
          dot: true
          cwd:'public/'
          src: ["**"]
          dest: "dist/"
        ]
      img:
        files: [
          expand: true
          cwd:'opt-imgs/'
          src: ["**"]
          dest: "dist/img"
        ]

    jasmine:
      src: "dist/js/*.js"
      options:
        specs: "specs/js/*Spec.js"
        helpers: "specs/js/*Helper.js"
        vendor: ["public/js/jquery-1.9.1.min.js", "specs/lib/*.js"]

    cucumberjs: {
      files: 'features',
      options: {
        steps: "features/step_definitions"
      }
    }

    imageoptim:
      files: ["opt-imgs"]
      options:
        imageAlpha:true

    plato:
      complexity:
        files:
          'reports/js-complexity': ['js/app.js']

    symlink:
      explicit:
        src: '../foundry'
        dest: 'dist/foundry'


  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-compass"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-jasmine"
  grunt.loadNpmTasks "grunt-contrib-symlink"
  grunt.loadNpmTasks "grunt-cucumber"
  grunt.loadNpmTasks "grunt-modernizr"
  grunt.loadNpmTasks "grunt-notify"
  grunt.loadNpmTasks "grunt-exec"
  grunt.loadNpmTasks "grunt-plato"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-imageoptim"
  grunt.loadNpmTasks "assemble"
  grunt.loadNpmTasks "grunt-sg"

  # NOTE: this has to wipe out everything
  grunt.registerTask "root-canal", [ "clean:all", "copy:main", "copy:img"]

  grunt.registerTask "optimizeImages", ["imageoptim", "copy:img"]

  # Clean, compile and concatenate JS
  grunt.registerTask "javascript:dev", [ "coffee", "concat:js",  "jasmine", "cucumberjs", "plato" ]

  grunt.registerTask "javascript:dist", [ "coffee", "concat:js", "modernizr", "jasmine", "cucumberjs" ]

  # Production task
  grunt.registerTask "dev", [ "root-canal", "javascript:dev", "compass:dev", "assemble", "sg", "symlink", "watch"]

  grunt.registerTask "dist", [ "root-canal", "javascript:dist", "compass:dist", "assemble", "sg", "symlink" ]

  # Default task
  grunt.registerTask "default", "dev"
