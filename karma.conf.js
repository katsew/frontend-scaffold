module.exports = function(config) {
  config.set({

    // base path that will be used to resolve all patterns (eg. files, exclude)
    basePath: '',

    // list of files / patterns to load in the browser
    files: [
      'https://code.jquery.com/jquery-2.1.1.min.js',
      // 'front/assets/coffee/*.coffee',
      'test/spec/*.spec.coffee',
      'test/spec/fixture/*.html',
      {
        pattern: 'test/tmp/js/sample.js',
        watched: false,
        include: false,
        served: false
      },
      'test/tmp/js/*.js'
    ],

    // frameworks to use
    // available frameworks: https://npmjs.org/browse/keyword/karma-adapter
    frameworks: ['jasmine-jquery', 'jasmine-ajax', 'browserify', 'jasmine'],

    proxies: {
        '/fixture/': 'http://localhost:9876/base/test/fixture/'
    },

    // list of files to exclude
    exclude: [
    ],


    // preprocess matching files before serving them to the browser
    // available preprocessors: https://npmjs.org/browse/keyword/karma-preprocessor
    preprocessors: {
        // 'front/assets/coffee/*.coffee': ['coffee'],
        'test/spec/*.coffee': ['browserify'],
        'test/tmp/js/*.js': ['coverage']
    },

    browserify: {
        debug: true,
        transform: ['coffeeify'],
        extensions: ['.coffee']
    },

    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['coverage', 'nyan', 'osx'],
    coverageReporter: {
        type: 'html',
        dir : 'coverage/'
    },

    // web server port
    port: 9876,


    // enable / disable colors in the output (reporters and logs)
    colors: true,


    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,


    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,


    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['Chrome'],

    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: false
  });
};
