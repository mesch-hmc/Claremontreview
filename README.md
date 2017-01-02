# ClaremontReview

## Motivation
Make an accessible site to search for classes in the Claremont Colleges and provide a way for students to better choose their future classes!

### Our Stack
- Ruby
- Rails 4.2.5.2
- [Slim](http://www.rubydoc.info/gems/slim/frames)
- Digital Ocean Server
- SQLite3
- ElasticSearch 2.X.X

### Getting Started
For first-timers, clone our repo below!

``` shell
git clone https://github.com/mesch-hmc/Claremontreview.git
cd Claremontreview
```

**DISCLAIMER:** Currently, ```rake task:importjson``` will not work because we haven't uploaded a sample json file yet.

Update all the gems and migrate the database.
``` ruby
bundle install
rake db:migrate
rake task:importjson
rake task:slug
```

Install ElasticSearch. [Here](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-elasticsearch-on-ubuntu-16-04) is a good tutorial for Ubuntu.
**NOTE:** Make sure that elastic search is running.

``` shell
sudo systemctl restart elasticsearch
rails server
```

There you go, you're now up and running!

### Questions? Suggestions?
Email us at mesch-hmc@gmail.com!




