#!/bin/sh

########################################
## valuable
########################################

TYPE=""
DEVICE=""
APP_NAME=""
CMDNAME=`basename $0`
BUILD_DIR='dist'

########################################
## manage arguments
########################################

while getopts t:d:n: OPT
do
  case $OPT in
    "t" ) TYPE="$OPTARG" ;;
    "d" ) DEVICE="$OPTARG" ;;
    "n" ) APP_NAME="$OPTARG" ;;
  esac
done

if [ ${TYPE} = "" -o ${DEVICE} = "" ] ; then
  echo "Usage: ${CMDNAME} [-t type of operation init|build] [-d device name pc|sp|tb] [-n name of app]" 1>&2
  exit 1
fi

if [ ${TYPE} = "init" ] ; then
  if [ ${DEVICE} = "" -o "${APP_NAME}" = "" ] ; then
    echo "Usage: ${CMDNAME} -type init [-d device name pc|sp|tb] [-n name of app]" 1>&2
    exit 1
  fi
fi

########################################
## for initialize project
########################################

if [ ${TYPE} = 'init' ] ; then

  mkdir ${DEVICE}
  cd ${DEVICE}
  yo webapp ${APP_NAME}
  cd -

  exit 0
fi

########################################
## for build project
########################################

if [ ${TYPE} = 'build' ] ; then

  ## init build directory
  if [ ! -d ${BUILD_DIR} ]; then
    mkdir ${BUILD_DIR}
  fi

  ## execute grunt build
  cd ${DEVICE}
  grunt
  cd -

  ## copy built app
  if [ ${DEVICE} = 'pc' ] ; then
    cp -rf ${DEVICE}/dist/* ${BUILD_DIR}/
  else
    cp -rf ${DEVICE}/dist ${BUILD_DIR}/${DEVICE}
  fi

  ## check git statsu
  git status -sb

  exit 0
fi
