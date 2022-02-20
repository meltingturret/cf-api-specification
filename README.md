# Cf::Api::Specification

Ruby gem to provide OpenAPI Specification document for basic application hosting CRUD and management operations that 
when implemented can interact with Cloud Foundry PAAS either PCF, CFAR or K8S. 

The project [GOALS](GOALS.md) are detailed separately.

[![build-ruby](https://github.com/meltingturret/cf-api-specification/actions/workflows/build-ruby.yml/badge.svg)](https://github.com/meltingturret/cf-api-specification/actions/workflows/build-ruby.yml)
[![release-please](https://github.com/meltingturret/cf-api-specification/actions/workflows/release-please.yml/badge.svg)](https://github.com/meltingturret/cf-api-specification/actions/workflows/release-please.yml)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cf-generated-specification'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cf-api-specification

## Usage

Clone cf cli golang source code:

```shell
$ git clone https://github.com/cloudfoundry/cli.git
```

Run cfas to scan the source code:

```shell
$ ./bin/cfas --location ~/Projects/workspace/generated/cli
```

## Development

To setup local gem install add this to your ~/.bashrc:

```shell
$ mkdir ~/.ruby
$ echo 'export GEM_HOME=~/.ruby/' >> ~/.bashrc
$ echo 'export PATH="$PATH:~/.ruby/bin"' >> ~/.bashrc
$ source ~/.bashrc
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/meltingturret/cf-api-specification. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/meltingturret/cf-api-specification/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cf::Api::Specification project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/meltingturret/cf-api-specification/blob/master/CODE_OF_CONDUCT.md).
