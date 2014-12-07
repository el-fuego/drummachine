'use strict';

var karma = require('karma').server;

var gulp =    require('gulp'),
    plugins = require('gulp-load-plugins')(),
    es =      require('event-stream'),
    _ =       require('lodash'),
    nib =     require('nib');

var paths = {
    coffee:     [
        'app/scripts/app.coffee',
        'app/scripts/{**/,}*.coffee'
    ],
    js:  'dist/scripts/script.min.js',
    coffeeTest:     [
        'app/spec/{**/,}*spec.coffee'
    ],
    unitTest:     [
        'spec/{**/,}*spec.coffee'
    ],
    styles:     [
        'app/styles/{**/,}*.styl'
    ],
    templates:  'app/*.jade'
};

var config = {
    production: true
};

function templates() {
    gulp.src(paths.templates)
        .pipe(plugins.jade())
        .pipe(plugins.if(config.production, plugins.usemin({
            js:  [plugins.uglify()],
            css: []
        })))
        .pipe(gulp.dest('dist'))
        .pipe(plugins.if(!config.production, plugins.connect.reload()));
}

function styles() {
    return gulp.src('app/styles/index.styl')
        .pipe(plugins.stylus({
            use: nib()
        }))
        .pipe(plugins.concat('style.min.css'))
        .pipe(gulp.dest('dist/styles'))
        .pipe(plugins.if(!config.production, plugins.connect.reload()));
}

function coffee() {
    return gulp.src(paths.coffee)
        .pipe(plugins.coffee())
        .pipe(plugins.concat('script.min.js'))
        .pipe(gulp.dest('dist/scripts'))
        .pipe(plugins.if(!config.production, plugins.connect.reload()));
}

function coffeeTest() {
    return gulp.src(paths.coffeeTest)
        .pipe(plugins.coffee())
        .pipe(gulp.dest('spec'));
}

function webserver() {
    plugins.connect.server({
        // livereload: true,
        port: 8000,
        root: config.production ? ['dist'] : ['dist', 'app']
    });
}

function protractor() {
    return gulp.src('dist/test/{**/,}*spec.js')
        .pipe(plugins.protractor.protractor({
            configFile: "protractor.conf.js",
            args:       ['--baseUrl', 'http://127.0.0.1:8000', '--ignore-ssl-errors=yes']
        }));
}
function unitTest(done) {
    karma.start({
        configFile: __dirname + '/karma.conf.js',
        singleRun:  true
    }, done);
}


function watch() {
    gulp.watch(paths.coffee, coffee);
    gulp.watch(paths.styles, styles);
    gulp.watch(paths.templates, templates);
}

function watchTest() {
    gulp.watch(paths.coffee, coffee);
    gulp.watch(paths.js, unitTest);
    gulp.watch(paths.templates, templates);
    gulp.watch(paths.coffeeTest, coffeeTest);
    gulp.watch(paths.karmaTest, unitTest);
}

function build() {
    templates();
    coffee();
    styles();
}

function serve() {
    build();
    webserver();
    watch();
}



/**
 * Tasks
 */

gulp.task('clean', function () {
    return gulp.src('dist', {read: false}).pipe(plugins.rimraf());
});
gulp.task('cleanTest', function () {
    return gulp.src('spec', {read: false}).pipe(plugins.rimraf());
});

gulp.task('serve', ['clean'], function () {
    config.production = false;
    serve();
});

gulp.task('serve:production', ['clean'], serve);

gulp.task('default', ['serve']);

gulp.task('build', ['clean'], build);

gulp.task('buildTest', ['cleanTest'], coffeeTest);
gulp.task('unitTest', ['build', 'buildTest'], unitTest);

gulp.task('test', ['unitTest'], watchTest);
