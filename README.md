# hps-ruby-rspec
[![Build Status](https://travis-ci.org/hiptest/hps-ruby-rspec.svg?branch=master)](https://travis-ci.org/hiptest/hps-ruby-rspec)

Hiptest publisher samples with Ruby/Rspec

In this repository you'll find tests generated in Ruby/Rspec format from [Hiptest](https://hiptest.net), using [Hiptest publisher](https://github.com/hiptest/hiptest-publisher).

The goals are:

 * to show how tests are exported in Ruby/Rspec.
 * to check exports work out of the box (well, with implemented actionwords)

System under test
------------------

The SUT is a (not that much) simple coffee machine. You start it, you ask for a coffee and you get it, sometimes. But most of times you have to add water or beans, empty the grounds. You have an automatic expresso machine at work or at home? So you know how it goes :-)

Update tests
-------------


To update the tests:

    hiptest-publisher -c rspec.conf --only=tests

The tests are generated in [``spec/project_spec.rb``](https://github.com/hiptest/hps-ruby-rspec/blob/master/spec/project_spec.rb)

Run tests
---------


To build the project and run the tests, use the following command:

    bundle exec rspec --format RspecJunitFormatter -o report.xml

The SUT implementation can be seen in [``src/coffee_machine.rb``](https://github.com/hiptest/hps-ruby-rspec/blob/master/src/coffee_machine.rb)

The test report is generated in ```report.xml```