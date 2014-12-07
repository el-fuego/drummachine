'use strict';

var gulp =    require('gulp'),
    plugins = require('gulp-load-plugins')(),
    es =      require('event-stream'),
    _ =       require('lodash'),
    nib =     require('nib');

var paths = {
    coffee:     [
        'app/scripts/app.coffee',
        'app/scripts/(**/,)*.coffee'
    ],
    coffeeTest:     [
        'app/test/*spec.coffee',
        'app/test/**/*spec.coffee'
    ],
    styles:     'app/styles/(**/,)*.styl',
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
        .pipe(gulp.dest('dist/test'));
}

function watch() {
    gulp.watch(paths.coffee, coffee);
    gulp.watch(paths.styles, styles);
    gulp.watch(paths.templates, templates);
    gulp.watch(paths.coffeeTest, coffeeTest);
}

function webserver() {
    plugins.connect.server({
        // livereload: true,
        port: 8000,
        root: config.production ? ['dist'] : ['dist', 'app']
    });
}

function protractor() {
    return gulp.src('dist/test/(**/,)*spec.js')
        .pipe(plugins.protractor.protractor({
            configFile: "app/test/_protractor.config.js",
            args:       ['--baseUrl', 'http://127.0.0.1:8000', '--ignore-ssl-errors=yes']
        }));
}

function clean() {
    return gulp.src('dist', {read: false}).pipe(plugins.rimraf());
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

gulp.task('clean', clean);

gulp.task('serve', ['clean'], function () {
    config.production = false;
    serve();
});

gulp.task('serve:production', ['clean'], serve);

gulp.task('default', ['serve']);

gulp.task('build', ['clean'], build);

gulp.task('buildTest', ['build'], coffeeTest);
gulp.task('test', ['buildTest'], protractor);