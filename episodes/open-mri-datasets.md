---
title: Exploring open MRI datasets
teaching: 30
exercises: 15
---

::::::::::::::::::::::::::::::::::::::: objectives

- Understand the BIDS format
- Use PyBIDS in to easily explore a BIDS dataset

::::::::::::::::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::::: questions

- How does standardizing neuroimaging data ease the data exploration process

::::::::::::::::::::::::::::::::::::::::::::::::::



## Tutorial Dataset

In this episode, we will be using a subset of a publicly available dataset, **ds000030**, from [openneuro.org](https://openneuro.org/datasets/ds000030). All of the datasets on OpenNeuro are already structured according to BIDS.

## Downloading Data

### DataLad

`DataLad` installs the data - which for a dataset means that we get the "small" data (i.e. the text files) and the download instructions for the larger files.
We can now navigate the dataset like its a part of our file system and plan our analysis.

First, navigate to the folder where you'd like to download the dataset.

```bash
cd ~/Desktop/dc-mri/data
datalad install ///openneuro/ds000030
```

Let's take a look at the `participants.tsv` file to see what the demographics for this dataset look like.

```python
import pandas as pd

participant_metadata = pd.read_csv('../data/ds000030/participants.tsv', sep='\t')
participant_metadata
```

**OUTPUT:**

<table border="1" class="dataframe">  <thead>   <tr style="text-align: right;">   <th></th>   <th>participant_id</th>   <th>diagnosis</th>   <th>age</th>   <th>gender</th>   <th>bart</th>   <th>bht</th>   <th>dwi</th>   <th>pamenc</th>   <th>pamret</th>   <th>rest</th>   <th>scap</th>   <th>stopsignal</th>   <th>T1w</th>   <th>taskswitch</th>   <th>ScannerSerialNumber</th>   <th>ghost_NoGhost</th>   </tr>  </thead>  <tbody>   <tr>   <th>0</th>   <td>sub-10159</td>   <td>CONTROL</td>   <td>30</td>   <td>F</td>   <td>1.0</td>   <td>NaN</td>   <td>1.0</td>   <td>NaN</td>   <td>NaN</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>35343.0</td>   <td>No_ghost</td>   </tr>   <tr>   <th>1</th>   <td>sub-10171</td>   <td>CONTROL</td>   <td>24</td>   <td>M</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>NaN</td>   <td>NaN</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>35343.0</td>   <td>No_ghost</td>   </tr>   <tr>   <th>2</th>   <td>sub-10189</td>   <td>CONTROL</td>   <td>49</td>   <td>M</td>   <td>1.0</td>   <td>NaN</td>   <td>1.0</td>   <td>NaN</td>   <td>NaN</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>35343.0</td>   <td>No_ghost</td>   </tr>   <tr>   <th>3</th>   <td>sub-10193</td>   <td>CONTROL</td>   <td>40</td>   <td>M</td>   <td>1.0</td>   <td>NaN</td>   <td>1.0</td>   <td>NaN</td>   <td>NaN</td>   <td>NaN</td>   <td>NaN</td>   <td>NaN</td>   <td>1.0</td>   <td>NaN</td>   <td>35343.0</td>   <td>No_ghost</td>   </tr>   <tr>   <th>4</th>   <td>sub-10206</td>   <td>CONTROL</td>   <td>21</td>   <td>M</td>   <td>1.0</td>   <td>NaN</td>   <td>1.0</td>   <td>NaN</td>   <td>NaN</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>1.0</td>   <td>35343.0</td>   <td>No_ghost</td>   </tr>  </tbody></table>

From this table we can easily view unique diagnostic groups:

```python
participant_metadata['diagnosis'].unique()
```

```output
array(['CONTROL', 'SCHZ', 'BIPOLAR', 'ADHD'], dtype=object)
```

Imagine we'd like to work with participants that are either CONTROL or SCHZ (`diagnosis`) and have both a T1w (`T1w == 1`) and rest (`rest == 1`) scan. Also, you'll notice some of the T1w scans included in this dataset have a ghosting artifact. We'll need to filter these out as well (`ghost_NoGhost == 'No_ghost'`).

We'll filter this data out like so:

```python
participant_metadata = participant_metadata[(participant_metadata.diagnosis.isin(['CONTROL', 'SCHZ'])) &
                                            (participant_metadata.T1w == 1) &
                                            (participant_metadata.rest == 1) &
                                            (participant_metadata.ghost_NoGhost == 'No_ghost')]
participant_metadata['diagnosis'].unique()
```

```output
array(['CONTROL', 'SCHZ'], dtype=object)
```

From this we have a list of participants corresponding to a list of participants who are of interest in our analysis.
We can then use this list in order to download participant from software such as `aws` or `datalad`.
In fact, this is exactly how we set up a list of participants to download for the fMRI workshop!
Since we've already downloaded the dataset, we can now explore the structure using PyBIDS, a Python API for querying, summarizing and manipulating the BIDS folder structure.

Getting and dropping data

datalad get
datalad drop

```python
from bids.layout import BIDSLayout

layout = BIDSLayout("~/Desktop/dc-mri/data/ds000030")
```

The pybids layout object indexes the BIDS folder.
Indexing can take a really long time, especially if you have several subjects, modalities, scan types, etc.
`pybids` has an option to save the indexed results to a SQLite database.
This database can then be re-used the next time you want to query the same BIDS folder.

```python
layout.save("~/Desktop/dc-mri/data/ds000030/.db")

layout = BIDSLayout("~/Desktop/dc-mri/data/ds000030", database_path="~/Desktop/dc-mri/data/ds000030/.db")
```

The pybids layout object also lets you query your BIDS dataset according to a number of parameters by using a `get_*()` method.
We can get a list of the subjects we've downloaded from the dataset.

```python
layout.get_subjects()
```

```output
['10171',
 '10292',
 '10365',
 '10438',
 '10565',
 '10788',
 '11106',
 '11108',
 '11122',
   ...
 '50083']
```

We can also pull a list of imaging modalities in the dataset:

```python
layout.get_modalities()
```

```output
['anat', 'func']
```

As well as tasks and more!:

```python
#Task fMRI
print(layout.get_tasks())

#Data types (bold, brainmask, confounds, smoothwm, probtissue, warp...)
print(layout.get_types())
```

```output
['rest']

['bold',
 'brainmask',
 'confounds',
 'description',
 'dtissue',
 'fsaverage5',
 'inflated',
 'midthickness',
 'participants',
 'pial',
 'preproc',
 'probtissue',
 'smoothwm',
 'warp']
```

In addition we can specify sub-types of each BIDS category:

```python
layout.get_types(modality='func')
```

```output
['brainmask', 'confounds', 'fsaverage5', 'preproc']
```

We can use this functionality to pull all our fMRI NIfTI files:

```python
layout.get(task='rest', type='bold', extensions='nii.gz', return_type='file')
```

```output
TO FILL
```

Finally, we can convert the data stored in `bids.layout` into a `pandas.DataFrame` :

```python
df = layout.as_data_frame()
df.head()
```

**OUTPUT:**

<table border="1" class="dataframe">  <thead>   <tr style="text-align: right;">   <th></th>   <th>path</th>   <th>modality</th>   <th>subject</th>   <th>task</th>   <th>type</th>   </tr>  </thead>  <tbody>   <tr>   <th>0</th>   <td>~/Desktop/dc-mri/data...</td>   <td>NaN</td>   <td>NaN</td>   <td>rest</td>   <td>bold</td>   </tr>   <tr>   <th>1</th>   <td>~/Desktop/dc-mri/data...</td>   <td>NaN</td>   <td>NaN</td>   <td>NaN</td>   <td>participants</td>   </tr>   <tr>   <th>2</th>   <td>~/Desktop/dc-mri/data...</td>   <td>NaN</td>   <td>NaN</td>   <td>NaN</td>   <td>NaN</td>   </tr>   <tr>   <th>3</th>   <td>~/Desktop/dc-mri/data...</td>   <td>anat</td>   <td>10565</td>   <td>NaN</td>   <td>brainmask</td>   </tr>   <tr>   <th>4</th>   <td>~/Desktop/dc-mri/data...</td>   <td>anat</td>   <td>10565</td>   <td>NaN</td>   <td>probtissue</td>   </tr>  </tbody></table>



:::::::::::::::::::::::::::::::::::::::: keypoints

- BIDS is an organizational principle for neuroimaging data
- PyBIDS is a Python-based tool that allows for easy exploration of BIDS-formatted neuroimaging data

::::::::::::::::::::::::::::::::::::::::::::::::::


