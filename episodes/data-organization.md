---
title: "Data Organization with BIDS"
teaching: 30
exercises: 15
questions:
- ""
objectives:
- ""
keypoints:
- ""
---

{% include base_path.html %}

[Brain Imaging Data Structure (BIDS)](https://bids.neuroimaging.io/specification) is a simple and intuitive way to organize and describe your neuroimaging and behavioural data. Neuroimaging experiments result in complicated data that can be arranged in several different ways. BIDS tackles this problem by suggesting a new standard (based on consensus from multiple researchers across the world) for the arrangement of neuroimaging datasets.

Using the same structure for all of your studies will allow you to easily reuse all of your scripts between studies. Additionally, sharing code with other researchers will be much easier.

Why convert the community to BIDS

Share data:
a common file structure for both computers and humans to understand
Using file formats/conventions that are most common in neuroimaging
show completeness of the data right away

Build better pipelines:
All the information you need to design a pipeline for a particular dataset is machine readable
pipelines can be more complex (under the hood) with fewer command-line arguments

bidsifying your dataset
