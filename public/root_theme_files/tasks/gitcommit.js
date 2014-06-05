module.exports = function(grunt) {
    'use strict';

    var fs = require('fs');

    grunt.registerTask('gitcommit', 'Sets either platform or ui commit hash', function() {
        var done = this.async();
        var gitcommit = {};
        var version = process.env.ABQVERSION;

        var git_cwd = '.';
        if(fs.existsSync('../../platform/.git')) {
            grunt.log.writeln('Commit from platform');
            git_cwd = '../';
        }
        else {
            grunt.log.writeln('Commit from current folder');
        }

        function endsWith(str, suffix) {
            return str.indexOf(suffix, str.length - suffix.length) !== -1;
        }

        function storeVersion(version) {
            gitcommit = {'hash': version};
            grunt.config.set('gitcommit', gitcommit);
        }

        function isSnapshot() {
            return typeof version === 'undefined' || endsWith(version, '-SNAPSHOT');
        }

        function commit() {
            setTimeout(grunt.util.spawn(
                {
                    cmd: 'git',
                    args: ['rev-parse', '--verify', '--short', 'HEAD'],
                    opts: {
                        cwd: git_cwd
                    }
                },
                function (err, result, code) {
                    if(err) {
                        grunt.log.writeln('Error ', err);
                        return false;
                    }
                    else {
                        if(isSnapshot()) {
                            storeVersion(result.stdout);
                        }
                        else {
                            storeVersion(version + '-' + result.stdout);
                        }
                    }
                    done();
                }
            ), 1000);
        };

        commit();
    });
};
