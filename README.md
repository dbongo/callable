[![Gem Version](https://badge.fury.io/rb/callable-mixin.svg)](https://badge.fury.io/rb/callable-mixin)
[![Build Status](https://github.com/dbongo/callable-mixin/actions/workflows/ci.yml/badge.svg)](https://github.com/dbongo/callable-mixin/actions)

# Callable

Callable is a minimal Ruby mix-in that provides your classes with a simple `.call` class method (plus `to_proc`). It allows you to instantiate and immediately invoke an instance method (`call`) without boilerplate or additional dependencies. Perfect for clean, readable, and concise service objects.

Learn more at https://rubydoc.info/gems/callable-mixin

## Features

- Provides a `.call` class method to any Ruby class.
- Supports `Class#to_proc`, letting you use `&YourService` in `Enumerable` methods.
- Transparently forwards positional args, keyword args, and blocks to `#call`.
- Raises `ConstructionError` (subclass of `ArgumentError`) for constructor arity/kwarg mismatches.
- Raises `NotImplementedError` when the class does not define an instance `#call`.
- Zero external runtime dependencies.
- Compatible with MRI Ruby 2.3 through Ruby 3.x.

## Installation

Add this to your application's Gemfile (version 0.2.0 or later):

```ruby
gem 'callable-mixin', '~> 0.2.0'
```

Then execute:

```bash
bundle install
```

Or install directly:

```bash
gem install callable-mixin
```

## Usage

### Example Service with Multiple Arguments

```ruby
class SendNotification
  include Callable

  def initialize(user, message)
    @user = user
    @message = message
  end

  def call
    NotificationMailer.notify(@user, @message).deliver_now
  end
end
```

- **Explicit invocation** when you need multiple constructor args:

  ```ruby
  users.each do |user|
    SendNotification.call(user, "Your message here")
  end

  # You can also call via the `.()` alias:
  SendNotification.(user, "Your message here")
  ```

### Example Service with Single Argument (to_proc Shorthand)

```ruby
class WelcomeUser
  include Callable

  def initialize(user)
    @user = user
  end

  def call
    NotificationMailer.welcome(@user).deliver_now
  end
end
```

- **Proc shorthand** for one-arg services:

  ```ruby
  users.each(&WelcomeUser)

  # Or invoke with the `.()` alias:
  WelcomeUser.(current_user)
  ```

### Using in a Plain Ruby Script

```ruby
require 'callable-mixin'

# Define your service with Callable
class MyService
  include Callable

  def initialize(value)
    @value = value
  end

  def call
    puts "Processing #{@value}"
  end
end

# Invoke the service
MyService.call("some data")

# Or use the `.()` alias:
MyService.("more data")
```

## Development

After cloning the repo, install dependencies with `bundle install`, then run tests with `bundle exec rspec`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dbongo/callable-mixin.

## License

The gem is available under the MIT License.