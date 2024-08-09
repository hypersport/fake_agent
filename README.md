# FakeAgent

[![Ruby](https://github.com/hypersport/fake_agent/workflows/Ruby/badge.svg)](https://github.com/hypersport/fake_agent/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/fake_agent.svg)](https://badge.fury.io/rb/fake_agent)

Up-to-date simple user agents of the [top 5 browsers in the world](https://gs.statcounter.com/browser-market-share).

## Features

- The data consists of the current browser versions or one version lower
- Data is the part of the gem
- Support Ruby 3.x

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

FakeAgent::FakeAgent.opera

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

FakeAgent::FakeAgent.desktop

FakeAgent::FakeAgent.mobile

FakeAgent::FakeAgent.tablet
```

Get user-agent string from combine all those arguments:

```ruby
require 'fake_agent'

FakeAgent::FakeAgent.random(browsers: "chrome")

FakeAgent::FakeAgent.random(browsers: %w[chrome safari firefox opera edge])

FakeAgent::FakeAgent.random(systems: "windows")

FakeAgent::FakeAgent.random(systems: %w[windows macos linux android ios])

FakeAgent::FakeAgent.random(platforms: "mobile")

FakeAgent::FakeAgent.random(platforms: %w[desktop mobile tablet])

FakeAgent::FakeAgent.random(browsers: "chrome", systems: "windows", platforms: "desktop")

FakeAgent::FakeAgent.random(browsers: %w[chrome safari firefox opera edge], systems: "windows", platforms: "desktop")

FakeAgent::FakeAgent.random(browsers: %w[chrome firefox], systems: %w[windows macos])

FakeAgent::FakeAgent.chrome(systems: "windows")

FakeAgent::FakeAgent.chrome(systems: %w[windows macos linux android ios])

FakeAgent::FakeAgent.chrome(platforms: "mobile")

FakeAgent::FakeAgent.chrome(platforms: %w[desktop mobile tablet])

FakeAgent::FakeAgent.chrome(systems: %w[windows linux], platforms: "desktop")

FakeAgent::FakeAgent.windows(browsers: "chrome")

FakeAgent::FakeAgent.windows(browsers: %w[chrome firefox edge opera])

FakeAgent::FakeAgent.windows(platforms: "desktop")

FakeAgent::FakeAgent.windows(browsers: %w[chrome firefox edge opera], platforms: "desktop")

FakeAgent::FakeAgent.desktop(browsers: "chrome")

FakeAgent::FakeAgent.desktop(browsers: %w[chrome firefox edge safari opera])

FakeAgent::FakeAgent.desktop(systems: "windows")

FakeAgent::FakeAgent.desktop(systems: %w[windows macos linux])

FakeAgent::FakeAgent.desktop(browsers: %w[chrome firefox edge opera], systems: "windows")
```

See [Fake Agent Document](https://rubydoc.info/github/hypersport/fake_agent) for more examples.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hypersport/fake_agent.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
