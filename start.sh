#!/bin/bash

#allows test execution
if [ -z $SERVICE_DIR ]; then export SERVICE_DIR=`pwd`; fi
if [ -z $ENV ]; then export ENV=IUHPC; fi

#clean up previous job (just in case)
rm -f finished

nohup $SERVICE_DIR/deface.sh &
echo $! > pid

