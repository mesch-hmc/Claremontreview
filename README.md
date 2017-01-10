# ClaremontReview

## Motivation

Make an accessible site to search for classes in the Claremont Colleges and provide a way
for students to better choose their future classes @ [claremontreview.com](claremontreview.com)!

## Our Stack

- Ruby
- Rails 4.2.5.2
- [Slim](http://www.rubydoc.info/gems/slim/frames)
- Digital Ocean Server (Ubuntu 12.04 or higher)
- SQLite3
- ElasticSearch 2.X.X

## Getting Started

For first-timers, clone our repo below!

``` shell
git clone https://github.com/mesch-hmc/Claremontreview.git
cd Claremontreview
```

Install ElasticSearch. [Here][ElasticSearch] is a good tutorial for Ubuntu.

Run our bash script ```./scripts/loadEnv.sh``` for the initial setup.

Then, run on your local server!

``` shell
rails server -b 0.0.0.0
```

There you go, you're now up and running!

## Build Status

[![License](http://img.shields.io/badge/license-MIT-red.svg?style=flat)][license]
[![Build Status](https://travis-ci.org/mesch-hmc/Claremontreview.svg?branch=master)][travis]
[![Code Quality](http://img.shields.io/codeclimate/github/mesch-hmc/Claremontreview.svg?style=flat)][codeclimate]

## Questions? Suggestions?

Email us at <mesch-hmc@gmail.com>!

## License

MIT. Copyright (c) MESCH. See [LICENSE] for details.

<!-- Links -->
[ElasticSearch]: https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-elasticsearch-on-ubuntu-16-04
[travis]: https://travis-ci.org/mesch-hmc/Claremontreview
[codeclimate]: https://codeclimate.com/github/mesch-hmc/Claremontreview
[LICENSE]: https://github.com/mesch-hmc/Claremontreview/blob/master/LICENSE.md
