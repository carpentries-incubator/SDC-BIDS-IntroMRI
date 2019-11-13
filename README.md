# Introduction to MRI and BIDS

[![Create a Slack Account with us][create_slack_svg]][slack_heroku_invite]
[![Slack Status][slack_channel_status]][slack_channel_url]
[![Binder][binder_svg]][binder_url]

An introduction to magnetic resonance imaging analysis in Python.

## Why Python?

Python is rapidly becoming the standard language for data analysis, visualization and automated workflow building. It is a free and open-source software that is relatively easy to pick up by new programmers. In addition, with Python packages such as `Jupyter` one can keep an interactive code journal of analysis - this is what we'll be using in the workshop. Using Jupyter notebooks allows you to keep a record of all the steps in your analysis, enabling transparency and ease of code sharing.

Another advantage of Python is that it is maintained by a large user-base. Anyone can easily make their own Python packages for others to use. Therefore, there exists a *very* large codebase for you to take advantage of for your neuroimaging analysis; from basic statistical analysis, to brain visualization tools, to advanced machine learning and multivariate methods!

## About the Lesson

This lesson teaches:
- a (re?) introduction to MR nomenclature - with BIDS
- "converting" your data to BIDS
- BIDS apps
- queueing up neuroimaging pipelines
- how neuroimaging data is stored

## Episodes

| # |  Episode | Time | Question(s) |
|--:|:---------|:----:|:------------|
| 1 | [Neuroimaging Fundamentals][episode01] | 30 | What are the common neuroimaging modalities? |
| 2 | [Anatomy of a NIfTI][episode02] | 30 | How is MRI data organized in a NIfTI file? |
| 3 | [Brain Imaging Data Structure][episode03] | 30 | How can I organize my study? |
| 4 | [Open MRI Datasets][episode04] | 30 | How can I download and query an MRI dataset? |

## Contributing

We welcome all contributions to improve the lesson! Maintainers will do their best to help you if you have any
questions, concerns, or experience any difficulties along the way.

We'd like to ask you to familiarize yourself with our [Contribution Guide](CONTRIBUTING.md) and have a look at
the [more detailed guidelines][lesson-example] on proper formatting, ways to render the lesson locally, and even
how to write new episodes.

Please see the current list of [issues][link_issues] for ideas for contributing to this
repository. For making your contribution, we use the GitHub flow, which is
nicely explained in the chapter [Contributing to a Project](http://git-scm.com/book/en/v2/GitHub-Contributing-to-a-Project) in Pro Git
by Scott Chacon.
Look for the tag ![good_first_issue](https://img.shields.io/badge/-good%20first%20issue-gold.svg). This indicates that the maintainers will welcome a pull request fixing this issue.

## Maintainer(s)

Current maintainers of this lesson are

* [Michael Joseph][michael_joseph]
* [Jerrold Jeyachandra][jerrold_jeyachandra]

## Authors

A list of contributors to the lesson can be found in [AUTHORS](AUTHORS)

## License

Instructional material from this lesson is made available under the Creative
Commons Attribution (CC BY 4.0) license. Except where otherwise noted, example
programs and software included as part of this lesson are made available under
the MIT license. For more information, see [LICENSE](LICENSE.md).

## Citation

To cite this lesson, please consult with [CITATION](CITATION)

[create_slack_svg]: https://img.shields.io/badge/Create_Slack_Account-The_Carpentries-071159.svg
[slack_heroku_invite]: https://swc-slack-invite.herokuapp.com
[slack_channel_status]: https://img.shields.io/badge/Slack_Channel-neuroimaging-E01563.svg
[slack_channel_url]: https://swcarpentry.slack.com/messages/CCJBHKCHZ
[binder_svg]: https://mybinder.org/badge_logo.svg
[binder_url]: https://mybinder.org/v2/gh/conp-pcno-training/SDC-BIDS-IntroMRI/gh-pages
[episode01]: https://github.com/conp-pcno-training/SDC-BIDS-IntroMRI/blob/gh-pages/files/neuroimaging_analysis_at_scale.pptx
[episode02]: https://github.com/conp-pcno-training/SDC-BIDS-IntroMRI/blob/gh-pages/code/02-anatomy-of-nifti/02-anatomy-of-nifti.ipynb
[episode03]: https://github.com/conp-pcno-training/SDC-BIDS-IntroMRI/blob/gh-pages/files/neuroimaging_analysis_at_scale.pptx
[episode04]: https://github.com/conp-pcno-training/SDC-BIDS-IntroMRI/blob/gh-pages/code/04-open-mri-datasets/04-open-mri-datasets.ipynb
[lesson-example]: https://carpentries.github.io/lesson-example
[link_issues]: https://github.com/conp-pcno-training/SDC-BIDS-IntroMRI/issues
[michael_joseph]: https://github.com/josephmje
[jerrold_jeyachandra]: https://github.com/jerdra