# Callable

Callable is a minimal Ruby mix-in that provides your classes with a simple `.call` class method. It allows you to instantiate and immediately invoke an instance method (`call`) without boilerplate or additional dependencies. Perfect for clean, readable, and concise service objects.

## Features

- Provides a `.call` class method to any Ruby class.
- Transparently forwards positional arguments, keyword arguments, and blocks.
- Handles argument errors gracefully, raising clear exceptions.
- Zero external runtime dependencies.
- Compatible with MRI Ruby 2.3 through Ruby 3.x.

## Installation

Add this to your application's Gemfile:

```ruby
gem 'callable-mixin'
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

Simply include Callable in your class and implement an instance method named `call`:

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

Then run your class using the `.call` class method:

```ruby
SendNotification.call(current_user, "Hello from Callable!")

# or use .() (syntactic sugar for .call)
SendNotification.(current_user, "Hello from Callable!")
```


## Development

After cloning the repo, install dependencies with `bundle install`, then run tests with `bundle exec rspec`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dbongo/callable-mixin.

## License

The gem is available under the MIT License.