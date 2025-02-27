---
title: From the scanner to our computer
teaching: 20
exercises: 10
---

::::::::::::::::::::::::::::::::::::::: objectives

- Understand how different MRI modalities differ and what each one represents
- Become familiar with converting MRI data from DICOM to NIfTI

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- What are the main MRI modalities?
- What's the first step necessary to start working with MRI data?

::::::::::::::::::::::::::::::::::::::::::::::::::



## Types of MR scans

### Anatomical

![](fig/t1t2flairbrain.jpg){alt='T1w, T2w and FLAIR anatomical MRI images'}

*Sourced from [https://case.edu/med/neurology/NR/MRI%20Basics.htm](https://case.edu/med/neurology/NR/MRI%20Basics.htm)*

- 3D image of anatomy (i.e., shape, volume, cortical thickness, brain region)
- can differentiate tissue types

### Functional

![](fig/bold.gif){alt='BOLD functional MRI image'}

![](fig/fmri_timeseries.png){alt='Functional MRI time series'}

*Sourced from Wagner and Lindquist, 2015*

- tracks the blood oxygen level-dependant (BOLD) signal as an analogue of brain activity
- 4D image (x, y, z + time)

### Diffusion

![](fig/dwi.gif){alt='Diffusion MRI images'}

![](fig/dwi_tracts.png){alt='Diffusion MRI tractogram'}

*Sourced from [http://brainsuite.org/processing/diffusion/tractography/](https://brainsuite.org/processing/diffusion/tractography/)*

- measures diffusion of water in order to model tissue microstructure
- 4D image (x, y, z + direction of diffusion)
- need parameters about the strength of the diffusion "gradient" and its direction (`.bval` and `.bvec`)

## Neuroimaging file formats

<h6 id="fileformats"> Common file formats:</h6>

| Format Name | File Extension | Origin/Group |
|-------------|----------------|--------------|
| [DICOM](https://www.dicomstandard.org/current) | none (*) | ACR/NEMA Consortium |
| [Analyze](https://eeg.sourceforge.net/ANALYZE75.pdf) | `.img`/`.hdr` | Analyze Software, Mayo Clinic |
| [NIfTI](https://nifti.nimh.nih.gov/) | `.nii` (**)| Neuroimaging Informatics Technology Initiative |
| [MINC](https://www.mcgill.ca/bic/software/minc) | `.mnc` | Montreal Neurological Institute |
| [NRRD](https://teem.sourceforge.net/nrrd/format.html) | `.nrrd` | Gordon L. Kindlmann |
| [MGH](https://surfer.nmr.mgh.harvard.edu/fswiki/FsTutorial/MghFormat) | `.mgz` or `.mgh` | Massachusetts General Hospital |

(*) DICOM files typically have a `.dcm` file extension.
(**) Some files are typically compressed and their extension may incorporate the corresponding
compression tool extension (e.g. `.nii.gz`).

From the MRI scanner, images are initially collected in the DICOM format and can be converted to these other formats to make working with the data easier.

Let's download some example DICOM data to see what it looks like.
This data was generously shared publicly by the [Princeton Handbook for Reproducible Neuroimaging](https://brainhack-princeton.github.io/handbook/).

```bash
wget https://zenodo.org/record/3677090/files/0219191_mystudy-0219-1114.tar.gz -O ../data/0219191_mystudy-0219-1114.tar.gz
mkdir -p ../data/dicom_examples
tar -xvzf ../data/0219191_mystudy-0219-1114.tar.gz -C ../data/dicom_examples
gzip -d ../data/dicom_examples/0219191_mystudy-0219-1114/dcm/*dcm.gz
rm ../data/0219191_mystudy-0219-1114.tar.gz
```

![](fig/dicom_to_nifti.png){alt='dicom-to-nifti'}

NIfTI is one of the most ubiquitous file formats for storing neuroimaging data.
If you're interested in learning more about NIfTI images, we highly recommend [this blog post about the NIfTI format](https://brainder.org/2012/09/23/the-nifti-file-format/).
We can convert our DICOM data to NIfTI using [dcm2niix](https://github.com/rordenlab/dcm2niix).

We can learn how to run `dcm2niix` by taking a look at its help menu.

```bash
dcm2niix -help
```

:::::::::::::::::::::::::::::::::::::::  challenge

## Converting DICOM to NIfTI

Convert the Princeton DICOM data to NIfTI

:::::::::::::::  solution

## Solution

```bash
mkdir -p ../data/dicom_examples/nii
dcm2niix -z y -o ../data/dicom_examples/nii ../data/dicom_examples/0219191_mystudy-0219-1114/
```

:::::::::::::::::::::::::

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: keypoints

- MRI can capture anatomical (structural), functional, or diffusion features.
- A number of file formats exist to store neuroimaging data.

::::::::::::::::::::::::::::::::::::::::::::::::::


