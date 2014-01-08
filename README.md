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

## package.json

add following devdependency

```javascript
  "devDependencies": {
    "karma-expect": "~1.0.0",
    "karma-sinon": "~0.0.1",
    "karma-mocha": "*"
  }
```

## .jshint.rc

```json
    "globals": {
        "_": true,
        "Global": true,
        "$": true,
        "expect": true,
        "sinon" : true,
        "describe": true,
        "it"      : true,
        "beforeEach": true,
        "afterEach" : true
    }
```

## Gruntfile.js

### add `karma` task

```javascript
        karma: {
            unit: {
                options: {
                    frameworks: ['mocha', 'expect', 'sinon'],
                    runnerPort: 8080,
                    singleRun: true,
                    browsers: ['PhantomJS'],
                    files: [
                        '<%= yeoman.app %>/bower_components/query/jquery.min.js',
                        '<%= yeoman.app %>/bower_components/underscore/underscore-min.js',
                        '<%= yeoman.app %>/scripts/{,*/}*.js',
                        'test/spec/{,*/}*.js',
                    ],
                    exclude: [
                        '<%= yeoman.app %>/scripts/main.js'
                    ],
                }
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
    grunt.registerTask('test', ['newer:jshint', 'karma']);
```
