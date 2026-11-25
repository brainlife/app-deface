<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Removes facial features from a T1-weighted image with FreeSurfer 7.1.1 mri_deface (talairach_mixed_with_skull and face atlases) for de-identification.**

Runs mri_deface with FreeSurfer's talairach_mixed_with_skull.gca and face.gca atlases (FS_HISTO_STD_THRESH set to 15) to strip the face from a whole-head T1w image, e.g. before sharing data. Inputs already tagged defaced are excluded. Requires a FreeSurfer license.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.146](https://doi.org/10.25663/brainlife.app.146)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` (!defaced) | yes | Whole-head T1-weighted image to deface. |

| Output | Datatype | Description |
|---|---|---|
| `out` | `neuro/anat/t1w` | Defaced T1-weighted image (t1.nii.gz). |

Runtime: container `brainlife/freesurfer-mini:7.1.1`; 1 CPUs; 20 GB memory; needs `FREESURFER_LICENSE`.

<!-- brainlife-app:end -->

[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.0-green.svg)](https://github.com/brain-life/abcd-spec)

Brain-Life wrapper for freesurfer/mri_deface

## Installation


```
git clone git@github.com:brain-life/app-deface.git
```

Create `config.json` with something like following content. config.json provides input parameter for this app.

```
{
    "t1": "/N/u/hayashis/Karst/testdata/app-deface/t1.nii.gz"
}
```

## Running 

Run `start.sh` to kick off your job.

