#!/bin/bash

set -x
set -e


#https://mail.google.com/mail/u/0?ui=2&ik=c3edd9d861&view=lg&permmsgid=msg-f%3A1641244202227469251&ser=1

export FS_HISTO_STD_THRESH=15
# [Bruce Fisschl]
# It's hard to explain what it does in detail, but
# essentially the algorithm decided that the histogram fit it did to wm was
# too broad and hence it gave up. Setting FS_HISTO_STD_THRESH bigger changed
# this behavior so it kept going (and in fact the fit was fine). Sure, try it
# with a bigger value on all your data and see how it goes (15 is probably
# fine, 10 is the default)

./mri_deface `jq -r '.t1' config.json` $FREESURFER_HOME/average/talairach_mixed_with_skull.gca $FREESURFER_HOME/average/face.gca t1.nii.gz
