---
title: BIDS derivatives
teaching: 30
exercises: 15
---

::::::::::::::::::::::::::::::::::::::: objectives

- Learn about neuroimaging applications using BIDS data structures
- Use neuroimaging applications through containers

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- What are BIDS Apps?
- What are containers?

::::::::::::::::::::::::::::::::::::::::::::::::::



[BIDS Apps](https://bids-apps.neuroimaging.io/) are containerized applications that run on BIDS data structures.

Some examples include:

- mriqc
- fmriprep
- freesurfer
- ciftify
- SPM
- MRtrix3\_connectome

They rely on 2 technologies for container computing:

- **Docker**
  - for building, hosting, and running containers on local hardware (Windows, Mac OS, Linux) or in the cloud
- **Singularity**
  - for running containers on high performance compute clusters

![](fig/bids_app.png)

Building a singularity container is as easy as:

```bash
singularity build mriqc-0.16.1.simg docker://poldracklab/mriqc:0.16.1`
```

To run the container:

```bash
singularity run --cleanenv \
  -B bids_folder:/data \
  mriqc-0.16.1.simg \
  /data /data/derivatives participant
```

:::::::::::::::::::::::::::::::::::::::: keypoints

- 
::::::::::::::::::::::::::::::::::::::::::::::::::


