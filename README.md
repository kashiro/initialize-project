# initialize project

```shell
  $ prj.sh -t init -d ${DEVICE} -n ${APP_NAMe}
```

e.g. `prj.sh -t init -d sp -n MyAppSp`

# build app

```shell
  $ prj.sh -t build -d ${DEVICE}
```

e.g. `prj.sh -t init -d sp`

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