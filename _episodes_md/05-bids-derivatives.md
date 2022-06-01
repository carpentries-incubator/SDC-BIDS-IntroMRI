---
jupyter:
  jupytext:
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.13.8
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

## BIDS Apps

[BIDS Apps](https://bids-apps.neuroimaging.io/) are containerized applications that run on BIDS data structures.  

Some examples include:
- mriqc
- fmriprep
- freesurfer
- ciftify
- SPM
- MRtrix3_connectome

They rely on 2 technologies for container computing:
- **Docker**
  - for building, hosting, and running containers on local hardware (Windows, Mac OS, Linux) or in the cloud
- **Singularity**
  - for running containers on high performance compute clusters

<img src="../fig/bids_app.png" alt="Drawing" align="middle" width="500px"/>

All BIDS Apps use the same command line format to run them:

`<app_name> /data /output participant [options]`

Building a singularity container is as easy as:

    `singularity build mriqc-0.16.1.simg docker://poldracklab/mriqc:0.16.1`

To run the container:

```
singularity run --cleanenv \
  -B bids_folder:/data \
  mriqc-0.16.1.simg \
  /data /data/derivatives participant
```
