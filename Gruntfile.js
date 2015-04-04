module.exports = function(grunt) {

    grunt.initConfig({
      srcPath: 'source',
      pkg: grunt.file.readJSON('package.json'),

      watch: {
         scripts: {
              files: ['<%= srcPath %>/assets/js/**/*.js'],
              tasks: ['newer:jshint:all'],
              options: {
                  spawn: false
              }
          }
      },

      grunticon: {
          myIcons: {
              files: [{
                  expand: true,
                  cwd: '<%= srcPath %>/assets/svg',
                  src: ['*.svg', '*.png'],
                  dest: '<%= srcPath %>/assets/icons'
              }],
              options: {
                  datasvgcss: 'icons.css',
                  enhanceSVG: true,
                  customselectors: {
                    "*": [".e8-icon--$1:before"]
                  }
              }
          }
      },

      jshint: {
          all: ['Gruntfile.js', '<%= srcPath %>/assets/js/app/**/*.js']
      },

      bump: {
        options: {
          files: ['package.json'],
          updateConfigs: [],
          commit: true,
          commitMessage: 'Release v%VERSION%',
          commitFiles: ['package.json'],
          createTag: false,
          tagName: 'v%VERSION%',
          tagMessage: 'Version %VERSION%',
          push: false,
          pushTo: 'upstream',
          gitDescribeOptions: '--tags --always --abbrev=1 --dirty=-d',
          globalReplace: false,
          prereleaseName: false,
          regExp: false
        }
      }

    });

    require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks);

    grunt.registerTask('default', [
        'newer:jshint',
        'grunticon:myIcons',
        'watch'
    ]);

};