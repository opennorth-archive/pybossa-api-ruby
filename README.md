# The PyBossa API Ruby Gem

A Ruby wrapper for the [PyBossa](http://pybossa.com/) [API](http://docs.pybossa.com/en/latest/model.html).

[![Build Status](https://secure.travis-ci.org/opennorth/pybossa-api-ruby.png)](http://travis-ci.org/opennorth/pybossa-api-ruby)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/opennorth/pybossa-api-ruby)

## Installation

    gem install pybossa-api

## API Examples

    >> require 'pybossa-api'

    >> PyBossa::App.list limit: 100 # default limit is 20
    => [{"info"=>{"task_presenter"=>"...", "thumbnail"=>"..."}, ...}, ...]

    >> PyBossa::App.list short_name: 'flickrperson'
    => [{"info"=>{"task_presenter"=>"...", "thumbnail"=>"..."}, ...}, ...]

    >> PyBossa::App.get 128
    => {"info"=>{"task_presenter"=>"...", "thumbnail"=>"..."}, ...}

    >> PyBossa::App.api_key = '21ec2020-3aea-1069-a2dd-08002b30309d'

    >> app = PyBossa::App.create "info"=>{"task_presenter"=>"...", "thumbnail"=>"..."}, ...
    => {"info"=>{"task_presenter"=>"...", "thumbnail"=>"..."}, ...}

    >> PyBossa::App.update app['id'], description: "An example API call"
    => nil # raises an error on failure

    >> PyBossa::App.delete app['id']
    => nil # raises an error on failure

You can perform similar operations on `PyBossa::Task` and `PyBossa::TaskRun`.

More documentation at [RubyDoc.info](http://rdoc.info/gems/pybossa-api/PyBossa).

## Bugs? Questions?

This gem's main repository is on GitHub: [http://github.com/opennorth/pybossa-api-ruby](http://github.com/opennorth/pybossa-api-ruby), where your contributions, forks, bug reports, feature requests, and feedback are greatly welcomed.

Copyright (c) 2012 Open North Inc., released under the MIT license
