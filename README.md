# Cf::Api::Specification

Ruby gem to generate and provide OpenAPI Specification for Cloud Foundry API. This package will generate an openapi.yml
document from basic CRUD like operations that are mined from the cloud foundry cloud controllers V3 API documentation. 

It is intended that the final modified openapi.yml can be used to support CRUD, and management,  like operations for 
organisations, spaces, applications , policies and routes. It is assumed that the target cloud foundry installation 
has all the required users, roles and quotas already configured.

One main objective is to provide a easy to use API that is an abstraction inorder to maintain a stable structure for the 
consumer of this specification even when the backend cloud controller API is modified. There are some complexities with 
the full API from cloud foundry that should be handled(hidden) by the client implementation.

1. Where are the network policy resources? This will have to be added in to the final openAPI document.
2. Simple easy to use response models. 
3. Simple use of organisation and spaces names for parameters, no exposure of the relations that we see currently.
4. Avoid going into the cloud controllers API rabbit hole!

The output documents are located under api where `openapi-generated.yml` is the generated prototype (do this once) 
and `cloud-foundry-crud-v3-openapi.yml` is the final modified version.


[![build-ruby](https://github.com/meltingturret/cf-api-specification/actions/workflows/build-ruby.yml/badge.svg)](https://github.com/meltingturret/cf-api-specification/actions/workflows/build-ruby.yml)
[![release-please](https://github.com/meltingturret/cf-api-specification/actions/workflows/release-please.yml/badge.svg)](https://github.com/meltingturret/cf-api-specification/actions/workflows/release-please.yml)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cf-api-specification'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cf-api-specification

## Usage

Clone cloud_controller_ng source code:

```shell
$ git clone https://github.com/cloudfoundry/cloud_controller_ng.git
```

Run cfas to scan the source code:

```shell
$ ./bin/cfas --location ~/Projects/workspace/api/cloud_controller_ng
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
