# FakeAgent

[![Ruby](https://github.com/hypersport/fake_agent/workflows/Ruby/badge.svg)](https://github.com/hypersport/fake_agent/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/fake_agent.svg)](https://badge.fury.io/rb/fake_agent)

Up-to-date simple useragent faker with real world database.

## Features

- Data is pre-downloaded from [https://user-agents.net/](https://user-agents.net/download) and the data is part of the package
- The data consists of the current browser versions or one version lower
- Supports Ruby 3.x

## Installation

Install the gem and add to the application's Gemfile by executing:

```sh
bundle add fake_agent
```

If bundler is not being used to manage dependencies, install the gem by executing:

```sh
gem install fake_agent
```

## Usage

Get a random browser user-agent string:

```ruby
require 'fake_agent'

FakeAgent::FakeAgent.random
```

Get user-agent string from a specific browser:

```ruby
require 'fake_agent'

FakeAgent::FakeAgent.chrome

FakeAgent::FakeAgent.firefox

FakeAgent::FakeAgent.safari

FakeAgent::FakeAgent.duckduckgo

FakeAgent::FakeAgent.edge
```

Get user-agent string from a specific system:

```ruby
require 'fake_agent'

FakeAgent::FakeAgent.macos

FakeAgent::FakeAgent.windows

FakeAgent::FakeAgent.linux

FakeAgent::FakeAgent.android

FakeAgent::FakeAgent.ios
```

Get user-agent string from a specific platform:

```ruby
require 'fake_agent'

FakeAgent::FakeAgent.pc

FakeAgent::FakeAgent.mobile

FakeAgent::FakeAgent.tablet
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hypersport/fake_agent.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
