exports.config = {
    // The file path to the selenium server jar ()
    seleniumServerJar: '../../node_modules/protractor/selenium/selenium-server-standalone-2.44.0.jar',

    // The address of a running selenium server.
    //seleniumAddress: 'http://localhost:4444/wd/hub',

    // Capabilities to be passed to the webdriver instance.
    capabilities: {
        'browserName': 'chrome'
        //'phantomjs.binary.path': '../../node_modules/phantomjs/lib/phantom/bin/phantomjs'
    },

    // Spec patterns are relative to the current working directly when
    // protractor is called.

    specs: [__dirname + '/../../dist/test/*spec.js',
            __dirname + '/../../dist/test/**/*spec.js'],

    exclude: [],

    // Options to be passed to Jasmine-node.
    jasmineNodeOpts: {
        showColors: true,
        includeStackTrace: true,
        defaultTimeoutInterval: 30000
    }
};