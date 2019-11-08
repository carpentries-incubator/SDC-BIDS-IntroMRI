# Introduction to MRI and BIDS

[![Create a Slack Account with us][create_slack_svg]][slack_heroku_invite]
[![Slack Status][slack_channel_status]][slack_channel_url]

An introduction to MRI.

## Why Python?

Python is rapidly becoming the standard language for data analysis, visualization and automated workflow building. It is a free and open-source software that is relatively easy to pick up by new programmers. In addition, with Python packages such as `Jupyter` one can keep an interactive code journal of analysis - this is what we'll be using in the workshop, and is, in fact, what you are currently using to view this workshop! Using Jupyter notebooks allows you to keep a record of all the steps in your analysis, enabling transparency and ease of code sharing.

Another advantage of Python is that it is maintained by a large user-base. Anyone can easily make their own Python packages for others to use. Therefore, there exists a *very* large codebase for you to take advantage of for your neuroimaging analysis; from basic statistical analysis and visualization tools to advanced machine learning and multivariate methods!

We'll begin with a basic overview of MR data and then move into how we can work with MR data in Python:

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
| 1 | [Neuroimaging Fundamentals][episode01] | 30 | How can I do the same operations on many different values? |
| 2 | [MRI Datasets][episode02] | 30 | How can I store many values together? |
| 3 | [Brain Imaging Data Structure][episode03] | 30 | How can I do the same operations on many different files? |
| 4 | [Anatomy of NIfTI][episode04] | 30 | How can my programs do different things based on data values? |

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
* [Erin Dickie][erin_dickie]

## Authors

A list of contributors to the lesson can be found in [AUTHORS](AUTHORS)

## License

Instructional material from this lesson is made available under the Creative
Commons Attribution (CC BY 4.0) license. Except where otherwise noted, example
programs and software included as part of this lesson are made available under
the MIT license. For more information, see [LICENSE.md](LICENSE.md).

## Citation

To cite this lesson, please consult with [CITATION](CITATION)

[create_slack_svg]: https://img.shields.io/badge/Create_Slack_Account-The_Carpentries-071159.svg
[slack_heroku_invite]: https://swc-slack-invite.herokuapp.com
[slack_channel_status]: https://img.shields.io/badge/Slack_Channel-neuroimaging-E01563.svg
[slack_channel_url]: https://swcarpentry.slack.com/messages/CCJBHKCHZ
[episode01]: https://conp-pcno-training.github.io/SDC-BIDS-IntroMRI/01-neuroimaging-fundamentals/index.html
[episode02]: https://conp-pcno-training.github.io/SDC-BIDS-IntroMRI/02-mri-datasets/index.html
[episode03]: https://conp-pcno-training.github.io/SDC-BIDS-IntroMRI/03-brain-imaging-data-structure/index.html
[episode04]: https://conp-pcno-training.github.io/SDC-BIDS-IntroMRI/04-anatomy-of-nifti/index.html
[lesson-example]: https://carpentries.github.io/lesson-example
[link_issues]: https://github.com/conp-pcno-training/SDC-BIDS-IntroMRI/issues
[michael_joseph]: https://github.com/josephmje
[jerrold_jeyachandra]: https://github.com/jerdra
[erin_dickie]: https://github.com/edickie