---
title: Setup
---

## Overview

This lesson is designed to be run on either a personal computer or in a web-based interactive computational environment using [Binder][binder-info].

## Binder

The Binder webpage for this lesson can be accessed by clicking the button below.

[![][binder-svg]{alt='Binder'}][binder-repo]

Binder enables you to run the collection of Python notebooks found in the `code` folder.
All of the software and data used in the lesson are pre-installed in a custom computational environment and no additional software needs to be installed locally.

:::::::::::::::::::::::::::::::::::::::::  callout

## Binder Tips

If using Binder, please be aware that startup can take anywhere from 30 seconds to 10 minutes, depending on your internet connection and how recent the custom environment was used.
Also, files can be uploaded to the Binder environment.
However, the state of the environment is not permanent.
If you are inactive for 10 minutes, the environment will shut down and all data will be lost.
You should save any changed files to their computers in order to preserve them.


::::::::::::::::::::::::::::::::::::::::::::::::::

## Local

### Install Python

In this lesson, we will be using Python 3 with some of its most popular scientific and neuroimaging libraries.
Although one can install a plain-vanilla Python and all required libraries by hand, we recommend installing [Anaconda][anaconda-website], a Python distribution that comes with everything we need for the lesson.
Detailed installation instructions for various operating systems can be found on The Carpentries [template website for workshops][anaconda-instructions] and in the [Anaconda documentation][anaconda-install].

### Install Python Packages

Pip is the most common package installer for Python. This lesson requires a few additional neuroimaging-specific Python packages that can be installed with:

```bash
pip install nibabel nilearn pybids
```

### Install dcm2niix

We will be using the `dcm2niix` software package for converting neuroimaging data from the DICOM format that is exported from the MRI scanner to the NIfTI format, which is much easier to work with.
Detailed installation instructions for various operating systems can be found on the [dcm2niix README][dcm2niix-install].
If using the Anaconda Python distribution described earlier, `dcm2niix` can be installed by running:

```bash
conda install -c conda-forge dcm2niix
```

### Install DataLad

In order to obtain some of the data that will be used in this lesson, we will be using DataLad, a tool for managing and version controlling large datasets.
Detailed installation instructions for various operating systems can be found in the [Datalad Handbook] [datalad-install].
Again, if using Anaconda, DataLad can be easily installed by running:

```bash
conda install -c conda-forge datalad
```

### Obtain lesson materials

Once DataLad has been installed, create a new folder on your Desktop and download the [ds000030 dataset][ds000030] found on OpenNeuro.

```bash
mkdir ~/Desktop/dc-mri/data
cd ~/Desktop/dc-mri/data
datalad clone https://github.com/OpenNeuroDatasets/ds000030.git
```

## Launch Python interface

To start working with Python, we need to launch a program that will interpret and execute our Python
commands. Below we list several options. If you don't have a preference, proceed with the top
option in the list that is available on your machine. Otherwise, you may use any interface you like.

### Option A: Jupyter Notebook

A Jupyter Notebook provides a browser-based interface for working with Python.
If you installed Anaconda, you can launch a notebook in two ways:

:::::::::::::::  solution

## Anaconda Navigator

1. Launch Anaconda Navigator.
  It might ask you if you'd like to send anonymized usage information to Anaconda developers:
  ![](fig/anaconda-navigator-first-launch.png){alt='Anaconda Navigator first launch'}
  Make your choice and click "Ok, and don't show again" button.

2. Find the "Notebook" tab and click on the "Launch" button:
  ![](fig/anaconda-navigator-notebook-launch.png){alt='Anaconda Navigator Notebook launch'}
  Anaconda will open a new browser window or tab with a Notebook Dashboard showing you the
  contents of your Home (or User) folder.

3. Navigate to the `data` directory by clicking on the directory names leading to it:
  `Desktop`, `dc-mri`, then `data`:
  ![](fig/jupyter-notebook-data-directory.png){alt='Anaconda Navigator Notebook directory'}

4. Launch the notebook by clicking on the "New" button and then selecting "Python 3":
  ![](fig/jupyter-notebook-launch-notebook.png){alt='Anaconda Navigator Notebook directory'}
  

:::::::::::::::::::::::::

:::::::::::::::  solution

## Command line (Terminal)

1\. Navigate to the `data` directory:

:::::::::::::::  solution

## Unix shell

If you're using a Unix shell application, such as Terminal app in macOS, Console or Terminal
in Linux, or [Git Bash][gitbash] on Windows, execute the following command:

```bash
cd ~/Desktop/dc-mri/data
```

:::::::::::::::::::::::::

:::::::::::::::  solution

## Command Prompt (Windows)

On Windows, you can use its native Command Prompt program.  The easiest way to start it up is
pressing <kbd>Windows Logo Key</kbd>\+<kbd>R</kbd>, entering `cmd`, and hitting
<kbd>Return</kbd>. In the Command Prompt, use the following command to navigate to
the `data` folder:

```bash
cd /D %userprofile%\Desktop\dc-mri\data
```

:::::::::::::::::::::::::

2\. Start Jupyter server

:::::::::::::::  solution

## Unix shell

```bash
jupyter notebook
```

:::::::::::::::::::::::::

:::::::::::::::  solution

## Command Prompt (Windows)

```bash
python -m notebook
```

:::::::::::::::::::::::::

3\. Launch the notebook by clicking on the "New" button on the right and selecting "Python 3"
from the drop-down menu:
![](fig/jupyter-notebook-launch-notebook2.png){alt='Anaconda Navigator Notebook directory'}


:::::::::::::::::::::::::

  <!-- vertical spacer -->

### Option B: IPython interpreter

IPython is an alternative solution situated somewhere in between the plain-vanilla Python
interpreter and Jupyter Notebook. It provides an interactive command-line based interpreter with
various convenience features and commands.  You should have IPython on your system if you installed
[Anaconda][anaconda-instructions].

To start using IPython, execute:

```bash
ipython
```

  <!-- vertical spacer -->

### Option C: plain-vanilla Python interpreter

To launch a plain-vanilla Python interpreter, execute:

```bash
python
```

If you are using [Git Bash on Windows][gitbash], you have to call Python *via* `winpty`:

```bash
winpty python
```



[binder-info]: https://mybinder.readthedocs.io/en/latest/index.html
[binder-repo]: https://mybinder.org/v2/gh/carpentries-incubator/SDC-BIDS-IntroMRI/gh-pages?filepath=code%2F
[binder-svg]: https://mybinder.org/badge_logo.svg
[anaconda-website]: https://www.anaconda.com/
[anaconda-instructions]: https://carpentries.github.io/workshop-template/#python
[anaconda-install]: https://docs.anaconda.com/anaconda/install
[dcm2niix-install]: https://github.com/rordenlab/dcm2niix#install
[datalad-install]: https://handbook.datalad.org/en/latest/intro/installation.html
[ds000030]: https://openneuro.org/datasets/ds000030/versions/1.0.0
[gitbash]: https://gitforwindows.org



