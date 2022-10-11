# Rack::ChangePasswordUrl

Provides endpoint of a Well-Known URL for Changing Passwords for Rails and Rack apps.

References:
* [A Well-Known URL for Changing Passwords | W3C](https://www.w3.org/TR/change-password-url/)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add rack-change-password-url

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install rack-change-password-url

## Usage
### For Rack App

```ruby
require "rack/change-password-url"

use Rack::ChangePasswordUrl::Middleware, redirect_path: 'your-redirect-path'
```

### For Rails App

```ruby
# config/config/application.rb
module MyApp
  class Application < Rails::Application
    ...
    config.rack_change_password_url.redirect_path = 'your-redirect-path'
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/taketo1113/rack-change-password-url.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
