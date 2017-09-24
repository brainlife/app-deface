#!/bin/bash

env

#for debugging
[ -z $SERVICE_DIR ] && SERVICE_DIR=`pwd`

module load freesurfer

time mri_deface `$SERVICE_DIR/jq -r '.t1' config.json` \
	$FREESURFER_HOME/average/talairach_mixed_with_skull.gca \
	$FREESURFER_HOME/average/face.gca \
	t1.nii.gz
