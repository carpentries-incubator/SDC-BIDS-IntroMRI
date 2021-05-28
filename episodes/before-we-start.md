---
title: Before we start
teaching: 30
exercises: 0
questions:
  - "What is Python and why should I learn it?"
objectives:
  - "Present motivations for using Python."
  - "Organize files and directories for a set of analyses as a Python project."
  - "How to work with Jupyter Notebook."
  - "Know where to find help."
keypoints:
  - "Python is an open source and platform independent programming language."
  - "Jupyter Notebook is a great tool to code in and interact with Python."
  - "With the large Python community it is easy to find help on the internet."
---

{% include base_path.html %}

This overview have been adapted from the [Data Carpentry Python Lessons with Ecological Data](https://datacarpentry.org/python-ecology-lesson/).

## Why Python?

Python is rapidly becoming the standard language for data analysis, visualization and automated workflow building.
It is a free and open-source software that is relatively easy to pick up by new programmers and is available on multiple operating systems.
In addition, with Python packages such as `Jupyter` one can keep an interactive code journal of analysis - this is what we'll be using in the workshop.
Using Jupyter notebooks allows you to keep a record of all the steps in your analysis, enabling reproducibility and ease of code sharing.

Another advantage of Python is that it is maintained by a large user-base.
Anyone can easily make their own Python packages for others to use.
Therefore, there exists a *very* large codebase for you to take advantage of for your neuroimaging analysis; from basic statistical analysis, to brain visualization tools, to advanced machine learning and multivariate methods!

## Knowing your way around Anaconda and Jupyter

The [Anaconda][anaconda] distribution of Python includes a lot of its popular packages, such as the IPython console, and Jupyter Notebook.
Have a quick look around the Anaconda Navigator.
You can launch programs from the Navigator or use the command line.

The [Jupyter notebook](https://jupyter.org) is an open-source web application that allows you to create
and share documents that allow one to create documents that combine code, graphs, and narrative text.
If you have not worked with Jupyter notebooks before, you might start with the [tutorial from Jupyter.org](https://jupyter.org/try) called “Try Classic Notebook”.

Anaconda also comes with a package manager called [conda](https://conda.io/docs/), which makes it easy to install and update additional packages.

## Organizing your working directory

Using a consistent folder structure across your projects will help you keep things organized, and will also make it easy to find/file things in the future.
This can be especially helpful when you have multiple projects.
In general, you may wish to create separate directories for your scripts, data, and documents.

This lesson uses the following folders to keep things organized:

- **`data/`**: Use this folder to store your raw data. For the sake of transparency and provenance,
you should always keep a copy of your **raw data**. If you need to cleanup data, do it
programmatically (_i.e._ with scripts) and make sure to separate cleaned up data from the raw data.
For example, you can store raw data in files `./data/raw/` and clean data in `./data/clean/`.

- **`code/`**: Use this folder to store your (Python) scripts for data cleaning, analysis, and
plotting that you use in this particular project. This folder contains all of the Jupyter notebooks used in the lesson.

- **`files/`**: Use this folder to store any miscellaneous outlines, drafts, and other text. This folder contains a set of Powerpoint slides that will be used for parts of the lesson.

## How to learn more after the workshop?

The material we cover during this workshop will give you an initial taste of how you can use Python
to analyze MRI data for your own research.
However, you will need to learn more to do advanced operations such as working with specific MRI modalities, cleaning your dataset, using statistical methods, or creating beautiful graphics.
The best way to become proficient and efficient at Python, as with any other tool, is to use it to address your actual research questions.
As a beginner, it can feel daunting to have to write a script from scratch, and given that many people make their code available online, modifying existing code to suit your purpose might make it easier for you to get started.

## Seeking help

* check under the _Help_ menu
* type `help()`
* type `?object` or `help(object)` to get information about an object
* [Python documentation][python-docs]
* [NiBabel documentation][nibabel-docs]

Finally, a generic Google or internet search "Python task" will often either send you to the
appropriate module documentation or a helpful forum where someone else has already asked your
question.

I am stuck... I get an error message that I don’t understand.
Start by googling the error message. However, this doesn’t always work very well, because often,
package developers rely on the error catching provided by Python. You end up with general error
messages that might not be very helpful to diagnose a problem (e.g. "subscript out of bounds"). If
the message is very generic, you might also include the name of the function or package you’re using
in your query.

You can also check [Stack Overflow][stack-overflow]. Most questions have already been answered, but the challenge is to use the right words in the search to find the answers.

Another helpful resource specific to the neuroimaging community is [NeuroStars](https://neurostars.org/).

[anaconda]: https://www.anaconda.com
[nibabel-docs]: https://nipy.org/nibabel/manual.html#manual
[python-docs]: https://www.python.org/doc
[stack-overflow]: https://stackoverflow.com

{% include links.md %}
