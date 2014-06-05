module.exports = function(grunt) {

    if(grunt.option('theme') === undefined) {
        grunt.log.writeln("Theme created will be: abicloudDefault.");
    } else {
        grunt.log.writeln("Theme cretaed will be: " + grunt.option("theme"));
    }

    var reporter = function (errors) {
        console.log(errors.length ? "FAIL" : "OK");
    };

    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        concat: {
            angular_config: {
                src: [
                    'app/js/app.js',
                    'app/js/controllers.js',
                    'app/js/directives.js',
                    'app/js/services.js',
                    'app/js/filters.js'
                ],
                dest: 'app/temp/abiquo.angular.config.js'
            },
            angular_services: {
                src: [
                    'app/js/services/*.js',
                    'app/js/helpers/*.js'
                ],
                dest: 'app/temp/abiquo.angular.services.js'
            },
            angular_controllers: {
                src: [
                    'app/modules/**/*.js'
                ],
                dest: 'app/temp/abiquo.angular.controllers.js'
            },
            angular_all: {
                src: [
                    'app/temp/abiquo.angular.config.js',
                    'app/temp/abiquo.angular.services.js',
                    'app/temp/abiquo.angular.controllers.js'
                ],
                dest: '<%= pkg.buildfolder %>/js/abiquo.js'
            }
        },
        jshint: {
            main: {
                options: {
                    force: true,
                    reporter: './node_modules/grunt-contrib-jshint/node_modules/jshint/src/reporters/default.js',
                    reporterOutput: '<%= pkg.buildfolder %>/reports/jshint_report'
                },
                src: ['Gruntfile.js', '<%= pkg.buildfolder %>/js/abiquo.js']
            }
        },
        removelogging: {
            main: {
                src: "app/temp/abiquo.js",
                dest: "<%= pkg.buildfolder %>/js/abiquo.js"
            }
        },
        uglify: {
            options: {
                banner: '/*! <%= pkg.name %> v:<%= pkg.version %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
            },
            thirdparties: {
                files: {
                    '<%= pkg.buildfolder %>/js/abiquo.thirdparties.min.js':[
                        'app/lib/jquery/jquery-1.9.1.js',
                        'app/lib/jquery/jquery-ui-1.10.3.custom.min.js',
                        'app/lib/select2-3.4.1/select2.min.js',
                        'app/lib/utils/base64.js',
                        'app/lib/utils/lodash-1.2.1.js',
                        'app/lib/utils/toastr.js',
                        'app/lib/utils/jquery.zclip.min.js',
                        'app/lib/crypto-js/core.js',
                        'app/lib/crypto-js/md5.js',
                        'app/lib/spinner/spin.js',
                        //angular
                        'app/lib/angular/angular.js',
                        'app/lib/angular/angular-translate.js',
                        'app/lib/angular/angular-resource.min.js',
                        'app/lib/angular/angular-cookies.min.js',
                        'app/lib/angular/angular-mocks-1.0.1.js',
                        'app/lib/angular/angular-ui-bootstrap.js',
                        'app/lib/angular/angular-ui-utils.js',
                        'app/lib/angular/angular-grid.js',
                        'app/lib/angular/angular-google-maps.js',
                        'app/lib/angular/angular-grid-layout.js',
                        'app/lib/angular/angular-select2.js',
                        'app/lib/angular/angular-file-upload.min.js',
                        //'app/lib/angular/angular-spinner.js'
                        'app/lib/bootstrap/js/bootstrap.js'
                    ]
                }
            },
            main: {
                files: {
                    '<%= pkg.buildfolder %>/js/abiquo.min.js':[
                        '<%= pkg.buildfolder %>/js/abiquo.js'
                    ]
                }
            }
        },
        less: {
            main: {
                options: {
                    paths: ["assets/css"],
                    cleancss: true
                },
                files: {
                    "app/temp/app.css": ["app/theme/abicloudDefault/less/app.less"]
                }
            },
            secured_theme_creator: {
                options: {
                    paths: ["assets/css"],
                    cleancss: true
                },
                files: {
                    "app/temp/<%= grunt.option(\"theme\") %>/app.css": ["app/theme/<%= grunt.option(\"theme\") %>/less/app.less"]
                }
            },
            unsecured_theme_creator: {
                options: {
                    paths: ["assets/css"],
                    cleancss: true
                },
                files: {
                    "app/temp/<%= grunt.option(\"theme\") %>/app.css": ["app/theme/<%= grunt.option(\"theme\") %>/less/app_unsecured.less"]
                }
            }
        },
        cssmin: {
            main: {
                cleancss: true,
                files: {
                    '<%= pkg.buildfolder %>/theme/abicloudDefault/css/app.min.css': ['app/lib/jquery/css/jquery-ui-1.10.3.custom.min.css', 'app/lib/angular/css/angular-grid.css', 'app/lib/select2-3.4.1/select2.css', 'app/temp/app.css']
                }
            },
            secured_theme_creator: {
                cleancss: true,
                files: {
                    '<%= pkg.buildfolder %>/theme/<%= grunt.option(\"theme\") %>/css/app.min.css': ['app/lib/jquery/css/jquery-ui-1.10.3.custom.min.css', 'app/lib/angular/css/angular-grid.css', 'app/lib/select2-3.4.1/select2.css', 'app/temp/<%= grunt.option(\"theme\") %>/app.css']
                }
            },
            unsecured_theme_creator: {
                cleancss: true,
                files: {
                    '<%= pkg.buildfolder %>/theme/abicloudDefault/css/app.min.css': ['app/lib/jquery/css/jquery-ui-1.10.3.custom.min.css', 'app/lib/angular/css/angular-grid.css', 'app/lib/select2-3.4.1/select2.css', 'app/temp/<%= grunt.option(\"theme\") %>/app.css']
                }
            }
        },
        copy: {
            secured_theme_assets: {
                files: [
                    {expand: true, src: ['app/theme/<%= grunt.option(\"theme\") %>/img/*'], dest: '<%= pkg.buildfolder %>/theme/<%= grunt.option(\"theme\") %>/img/', flatten: true},
                    {expand: true, src: ['app/lib/font-awesome/font/*'], dest: '<%= pkg.buildfolder %>/theme/<%= grunt.option(\"theme\") %>/font/', flatten: true}
                ]
            },
            unsecured_theme_assets: {
                files: [
                    {expand: true, src: ['app/theme/<%= grunt.option(\"theme\") %>/img/*'], dest: '<%= pkg.buildfolder %>/theme/abicloudDefault/img/', flatten: true},
                    {expand: true, src: ['app/lib/font-awesome/font/*'], dest: '<%= pkg.buildfolder %>/theme/<%= grunt.option(\"theme\") %>/font/', flatten: true}
                ]
            },
            assets: {
                files: [
                    {expand: true, src: ['app/theme/abicloudDefault/img/*'], dest: '<%= pkg.buildfolder %>/theme/abicloudDefault/img/', flatten: true},
                    {expand: true, src: ['app/lib/font-awesome/font/*'], dest: '<%= pkg.buildfolder %>/theme/abicloudDefault/font/', flatten: true},
                    {expand: true, cwd: 'app/lib/', src: ['bootstrap/template/**'], dest: '<%= pkg.buildfolder %>/lib/'},
                    {expand: true, cwd: 'app/lib/', src: ['remoteaccess/**'], dest: '<%= pkg.buildfolder %>/lib/'},
                    {expand: true, cwd: 'app/modules/', src: ['**/*.html'], dest: '<%= pkg.buildfolder %>/modules/'}
                ]
            },
            config: {
                files: [
                    {expand: true, src: ['app/config/client-config.json'], dest: '<%= pkg.buildfolder %>/config/', flatten: true},
                    {expand: true, src: ['app/lang/*'], dest: '<%= pkg.buildfolder %>/lang/', flatten: true},
                    {expand: true, src: ['app/VERSION'], dest: '<%= pkg.buildfolder %>/', flatten: true}
                ]
            },
	        dev: {
                files: [
                    {expand: true, src: ['app/config/client-config_dev.json'], dest: '<%= pkg.buildfolder %>/config/', flatten: true},
                    {expand: true, src: ['app/VERSION'], dest: '<%= pkg.buildfolder %>/', flatten: true}
                ]
           }
        },
        processhtml: {
            main: {
                options: {
                    process: true,
                    data: {
                        title: 'Abiquo Prod',
                        favicon: 'theme/<%= grunt.option(\"theme\") || \"abicloudDefault\" %>/img/favicon.ico',
                        clientVersion: '<%= gitcommit.hash %>'
                    }
                },
                files: {
                    '<%= pkg.buildfolder %>/index.html': ['app/index.html'],
                    '<%= pkg.buildfolder %>/config/client-config.json': ['app/config/client-config.json'],
                    '<%= pkg.buildfolder %>/VERSION': ['app/VERSION']
                }
            },
            dev: {
                options: {
                    process: true,
                    data: {
                        clientVersion: '<%= gitcommit.hash %>'
                    }
                },
                files: {
                    '<%= pkg.buildfolder %>/config/client-config_dev.json': ['app/config/client-config_dev.json'],
                    '<%= pkg.buildfolder %>/VERSION': ['app/VERSION']
                }
            }
        },
        clean: {
            main: {
                force: true,
                src: ['app/temp']
            },
             pre_clean: {
                force: true,
                src: ['app/temp', 'build']
            }
        }
    });

    // Load the plugin that concat files. We will use it to concat javascripts
    grunt.loadNpmTasks('grunt-contrib-concat');
    // Load the plugin that provides the "uglify" task.
    grunt.loadNpmTasks('grunt-contrib-uglify');
    // Load the plugin that checks for javascript warnings
    grunt.loadNpmTasks('grunt-contrib-jshint');
    // Load the plugin that provides the "less to css" task.
    grunt.loadNpmTasks('grunt-contrib-less');
    // Load the plugin that provides the "cssmin" task to minify css
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    // Load the plugin that copy folders and files
    grunt.loadNpmTasks('grunt-contrib-copy');
    // Load the plugin that cleans undesired folders and files
    grunt.loadNpmTasks('grunt-contrib-clean');
    // Load the plugin that process html to modify css and js inclusions
    grunt.loadNpmTasks('grunt-processhtml');

    // Load custom task to set the commit
    grunt.loadTasks('tasks');

    grunt.registerTask('default', '', function() {
        grunt.log.writeln("a task must be provided. Available tasks are: prod | dev | create_default_theme | create_secured_theme | create_unsecured_theme");
    });

    grunt.registerTask('prod', [
        'clean:pre_clean',
        'concat:angular_config',
        'concat:angular_services',
        'concat:angular_controllers',
        'concat:angular_all',
        'jshint:main',
        'uglify:thirdparties',
        'uglify:main',
        'less:main',
        'cssmin:main',
        'copy:assets',
        'copy:config',
        'gitcommit',
        'processhtml:main',
        'clean:main'
    ]);

    grunt.registerTask('create_default_theme', [
        'less:main',
        'cssmin:main',
        'copy:assets',
        'clean:main'
    ]);

    grunt.registerTask('create_unsecured_theme', [
        'less:unsecured_theme_creator',
        'cssmin:unsecured_theme_creator',
        'copy:unsecured_theme_assets',
        'clean:main'
    ]);

    grunt.registerTask('create_secured_theme', [
        'less:secured_theme_creator',
        'cssmin:secured_theme_creator',
        'copy:secured_theme_assets',
        'clean:main'
    ]);

    grunt.registerTask('dev', [
        'prod',
        'copy:dev',
        'processhtml:dev',

    ]);
};
