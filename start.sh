#!/bin/bash

#clean up previous job (just in case)
rm -f finished

nohup ./deface.sh &
echo $! > pid

