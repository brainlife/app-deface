<h1 align="center">FreeSurfer Deface</h1>

<p align="center">
  A defaced T1-weighted image, with facial features removed by FreeSurfer <code>mri_deface</code>, ready for de-identified sharing.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.146"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.146-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

## 🧠 At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Removes facial features from a T1-weighted image with FreeSurfer 7.1.1 mri_deface (talairach_mixed_with_skull and face atlases) for de-identification.**

Runs mri_deface with FreeSurfer's talairach_mixed_with_skull.gca and face.gca atlases (FS_HISTO_STD_THRESH set to 15) to strip the face from a whole-head T1w image, e.g. before sharing data. Inputs already tagged defaced are excluded. Requires a FreeSurfer license.

| | |
|---|---|
| 📥 **Inputs** | `neuro/anat/t1w` |
| 📤 **Outputs** | `neuro/anat/t1w` |
| 🐳 **Container** | `brainlife/freesurfer-mini:7.1.1` |
| ⚙️ **Resources** | 1 CPUs · 20 GB memory |
| 🔑 **Requires** | `FREESURFER_LICENSE` |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.146](https://doi.org/10.25663/brainlife.app.146) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` (!defaced) | yes | Whole-head T1-weighted image to deface. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `out` | `neuro/anat/t1w` | Defaced T1-weighted image (t1.nii.gz). |

<!-- brainlife-app:end -->

## 🚀 Running the App

### ☁️ On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.146](https://doi.org/10.25663/brainlife.app.146), choose a whole-head T1-weighted image (`neuro/anat/t1w`) from your project and press **Execute**. Images already tagged `defaced` are not offered as input. The defaced image is archived to your project as a new `neuro/anat/t1w` dataset.

### 💻 Locally

You need [Singularity/Apptainer](https://apptainer.org/), [`jq`](https://jqlang.github.io/jq/) and a [FreeSurfer license](https://surfer.nmr.mgh.harvard.edu/registration.html). The App runs the `brainlife/freesurfer-mini:7.1.1` container and needs about 20 GB of memory.

1. Clone this repository and check out the App branch:

   ```bash
   git clone https://github.com/brainlife/app-deface.git
   cd app-deface
   git checkout 7.1.1
   ```

2. Create `config.json` with the path to your T1-weighted image:

   ```json
   {
       "t1": "testdata/t1.nii.gz"
   }
   ```

3. Export your license and run the App:

   ```bash
   export FREESURFER_LICENSE="$(cat ~/freesurfer/license.txt)"
   ./main
   ```

`deface.sh` runs `mri_deface` with FreeSurfer's `talairach_mixed_with_skull.gca` and `face.gca` atlases.

## 📦 Outputs

```text
out/t1.nii.gz   defaced T1-weighted image
```

## 🩺 Troubleshooting

- **`mri_deface` stops during the white-matter histogram fit**: the App sets `FS_HISTO_STD_THRESH=15` (the FreeSurfer default is 10), following advice from Bruce Fischl, so that the fit is not rejected as too broad. If it still fails, check that the input is a whole-head T1-weighted image.

## 📚 Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Freesurfer Deface. brainlife.io App. [doi:10.25663/brainlife.app.146](https://doi.org/10.25663/brainlife.app.146)
- Fischl. FreeSurfer. *NeuroImage* 62:774-781 (2012). [doi:10.1016/j.neuroimage.2012.01.021](https://doi.org/10.1016/j.neuroimage.2012.01.021)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## 👥 Authors

- Soichi Hayashi
- Franco Pestilli (project director)

**Contributors:** Brad Caron

## 💰 Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## ⚖️ License

MIT. FreeSurfer itself is distributed under its own [license](https://surfer.nmr.mgh.harvard.edu/fswiki/FreeSurferSoftwareLicense).
