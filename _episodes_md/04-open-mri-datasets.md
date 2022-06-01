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

# Open MRI datasets

---

In this lesson, we will be using a subset of a publicly available dataset, **ds000030**, from [openneuro.org](https://openneuro.org/datasets/ds000030). All of the datasets on OpenNeuro are already structured according to BIDS.


## OpenNeuro

- client-side BIDS validation
- resumable uploads


## Downloading data

### DataLad

Datalad is a great tool for "versioning" data. Downloading data using datalad has some advantages over downloading data via other ways:

1. When you download the data, datalad is keeping track of exactly which version of the data you have. Meaning that if somebody updates/fixes that dataset later you can incorporate those fixes quickly.
2. As datasets are getting bigger, we are getting to the point where all the data may not fit on your computer. Datalad first downloads the "small" data first (instead of the whole thing). So you can see what is there, plan your analysis, and only download the files you need to your local system.
3. `datalad drop` let's you delete the files you are no longer using from your system - while holding on to the critical metadata that would allow you to report on the data, or re-download it to the same spot if you need it later.

For more information about datalad - check out the [datalad handbook](http://handbook.datalad.org/en/latest/) or [this awesome tutorial video with rabbits!](https://www.youtube.com/watch?v=QsAqnP7TwyY).

`DataLad` installs the data - which for a dataset means that we get the "small" data (i.e. the text files) and the download instructions for the larger files. We can now navigate the dataset like its a file system and plan our analysis.

We'll switch to the terminal for this part.

Navigate to the folder where you'd like to download the dataset.

```python
!datalad clone https://github.com/OpenNeuroDatasets/ds000030.git ../data/ds000030
```

`datalad get` downloads any of the "large" data (i.e. NIfTI files) to our filesystem according to the filepath or regular expression we use. These files can also be removed from our filesystem using `datalad drop`.

```python
!datalad get ../data/ds000030/sub-10788
!datalad drop ../data/ds000030/sub-10788
```

#### if you need to deleted everything and restart...  

It happens. Removing the dataset entirely can be done with `datalad remove`. WARNING: Don't `datalad remove` during the workshop as you will need to redownload the dataset using the steps above.


## Exploring a BIDS dataset

Below is a tree diagram showing the folder structure of single MR session within ds000030.

```python
!tree ../data/ds000030
```

### the participants.tsv

The `participants.tsv` file is meant to describe some demographic information on each participant within your study (eg. age, handedness, sex, etc.) Let's take a look at the `participants.tsv` file to see what's been included in this dataset.

In order to load the data into Python, we'll need to import the `pandas` package. The `pandas` **dataframe** is Python's equivalent to an Excel spreadsheet.

```python
import pandas as pd
```

We'll use the `read_csv()` function. It requires us to specify the name of the file we want to import and the separator that is used to distinguish each column in our file (`\t` since we're working with a `.tsv` file).

```python
participant_metadata = pd.read_csv('../data/ds000030/participants.tsv', sep='\t')
```

In order to get a glimpse of our data, we'll use the `head()` function. By default, `head` prints the first 5 rows of our dataframe.

```python
participant_metadata.head()
```

We can view any number of rows by specifying `n=?` as an argument within `head()`.  
If we want to select particular rows within the dataframe, we can use the `loc[]` function and identify the rows we want based on their index label (the numbers in the left-most column).

```python
participant_metadata.loc[[6, 10, 12]]
```

**EXERCISE**: Select the first 5 rows of the dataframe using `loc[]`.

```python solution2="hidden"
participant_metadata.loc[:4]
```

```python

```

**EXERCISE:** How many participants do we have in total?

```python solution2="hidden"
participant_metadata.shape
```

```python

```

There are 2 different methods of selecting columns in a dataframe:  
*  participant_metadata[`'<column_name>'`] (this is similar to selecting a key in a Python dictionary)  
*  participant_metadata.`<column_name>`  


Another way to see how many participants are in the study is to select the `participant_id` column and use the `count()` function.

```python
participant_metadata['participant_id'].count()
```

**EXERCISE:** Which diagnosis groups are part of the study?  
*Hint: use the* `unique()` *function.*

```python solution2="hidden"
participant_metadata['diagnosis'].unique()
```

```python

```

If we want to count the number of participants in each diagnosis group, we can use the `value_counts()` function.

```python
participant_metadata['diagnosis'].value_counts()
```

**EXERCISE:** How many males and females are in the study? How many are in each diagnosis group?

```python solution2="hidden"
participant_metadata['gender'].value_counts()
```

```python

```

```python
participant_metadata.groupby(['diagnosis', 'gender']).size()
```

When looking at the participant dataframe, we noticed that there is a column called `ghost_NoGhost`. We should look at the README file that comes with the dataset to find out more about this.

```python
!cat ../data/ds000030/README
```

For this tutorial, we're just going to work with participants that are either CONTROL or SCHZ (`diagnosis`) and have both a T1w (`T1w == 1`) and rest (`rest == 1`) scan.

**EXERCISE:** Filter `participant_metadata` so that only the above conditions are present.

```python solution2="hidden"
participant_metadata = participant_metadata[(participant_metadata.diagnosis.isin(['CONTROL', 'SCHZ'])) & 
                                            (participant_metadata.T1w == 1) & 
                                            (participant_metadata.rest == 1)]
participant_metadata
```

```python

```

## Querying a BIDS dataset with pyBIDS


[pybids](https://bids-standard.github.io/pybids/) is a Python API for querying, summarizing and manipulating the BIDS folder structure.

```python
from bids.layout import BIDSLayout
```

```python
layout = BIDSLayout("../data/ds000030")
```

Indexing a database can take a really long time, especially if you have several subjects, modalities, scan types, etc. `pybids` has an option to save the indexed results to a SQLite database. This database can then be re-used the next time you want to query the same database.

```python
layout.save("../data/ds000030/.db")
```

```python
layout = BIDSLayout("../data/ds000030", database_path = "../data/ds000030/.db")
```

The pybids layout object lets you query your BIDS dataset according to a number of parameters by using a `get_*()` method.  
We can get a list of the subjects we've downloaded from the dataset.

```python
layout.get_subjects()
```

To get a list of all of the files, just use `get()`. 

```python
layout.get()
```

There are many arguments we can use to filter down this list. Any BIDS-defined keyword can be passed on as a constraint. In `pybids`, these keywords are known as **entities**. For a complete list of possibilities:

```python
layout.entities
```

For example, if we only want the file paths of all of our resting state fMRI scans,

```python
layout.get(datatype="func", suffix="bold", task="rest", extension=[".nii.gz"], return_type="file")
```

**EXERCISE**: Retrieve the file paths of any scan where the subject is '10292' or '50081' and the `RepetitionTime` is 2 seconds.

```python solution2="hidden"
layout.get(subject=["10159", "50081"], RepetitionTime=2, return_type="file")
```

```python

```

Let's save the first file from our list of file paths to a variable and pull the metadata from its associated JSON file using the `get_metadata()` function.

```python
fmri_file = layout.get(subject=["10159", "50081"], RepetitionTime=2, return_type="file")[0]
layout.get_metadata(fmri_file)
```

We can even collect the metadata for all of our fmri scans into a list and convert this into a dataframe.

```python
import pandas as pd

metadata_list = []
all_fmri_files = layout.get(datatype="func", suffix="bold", return_type="file", extension=[".nii.gz"])
for fmri_file in all_fmri_files:
    fmri_metadata = layout.get_metadata(fmri_file)
    metadata_list.append(fmri_metadata)
df = pd.DataFrame.from_records(metadata_list)
df
```
