module.exports = function(grunt) {
    'use strict';

    var fs = require('fs');

    grunt.registerTask('gitcommit', 'Sets either platform or ui commit hash', function() {
        var done = this.async();
        var gitcommit = {};

        var git_cwd = '.';
        if(fs.existsSync('../../platform/.git')) {
            grunt.log.writeln('Commit from platform');
            git_cwd = '../';
        }
        else {
            grunt.log.writeln('Commit from current folder');
        }

        setTimeout(grunt.util.spawn(
            {
                cmd: 'git',
                args: ['rev-parse', '--verify', 'HEAD'],
                opts: {
                    cwd: git_cwd
                }
            },
            function (err, result) {
                if(err) {
                    grunt.log.writeln('Error', err);
                    return false;
                }
                else {
                    gitcommit = {'hash': result.stdout};
                    grunt.config.set('gitcommit', gitcommit);
                }
                done();
            }
        ), 1000);
    });
};
