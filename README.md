# Initialize project

```shell
$ prj.sh -t init -d ${DEVICE} -n ${APP_NAME}
```

e.g. `prj.sh -t init -d sp -n MyAppSp`

# Build app

```shell
$ prj.sh -t build -d ${DEVICE}
```

e.g. `prj.sh -t init -d sp`

# Directory

    .
    ├── dist
    ├── pc
    ├── sp
    └── prj.sh

# Modify prject config for myself

## bower.json

```json
  "dependencies": {
    "jquery": "~1.10.2",
    "underscore": "*",
    "GlobalJS": "kashiro/GlobalJS",
    "js-flipsnap":"pxgrid/js-flipsnap"
  },
```

## .jshint.rc

```json
    "globals": {
        "_": true,
        "Global": true,
        "$": true
    }
```

## Gruntfile.js

### add `karma` task

```javascript
        karma: {
            options: {
                frameworks: 'mocha',
                files: [
                    '<%= yeoman.app %>/bower_components/**/*.js',
                    '<%= yeoman.app %>/scripts/{,*/}*.js',
                    'test/bower_components/chai/chai.js',
                    'test/bower_components/mocha/mocha.js',
                    'test/spec/{,*/}*.js',
                    '!<%= yeoman.app %>/scripts/main.js'
                ],
                runnerPort: 8080,
                singleRun: true,
                browsers: ['PhantomJS']
            }
        },
```

### modify `test` task

```javascript
    grunt.registerTask('test', function(target) {
        if (target !== 'watch') {
            grunt.task.run([
                'clean:server',
                'concurrent:test',
                'autoprefixer',
            ]);
        }
    
        grunt.task.run([
            'connect:test',
            'mocha'
        ]);
    });
```

↓

```javascript
    grunt.registerTask('test', ['karma']);
```
