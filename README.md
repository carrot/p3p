# P3P

Inserts P3P headers to allow cookies to be utilized in iframe scenarios with IE.

## Installation

Add this line to your application's Gemfile:

    gem 'p3p'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install p3p

## Usage

### Configuration
You can customize the P3P header text, if you so desire.

```ruby
P3P.configure do |config|
  config.header = 'CP="CAO PSA OUR"'
end

# Default Header: 'CP="NOI ADM DEV PSAi COM NAV OUR OTRo STP IND DEM"'
```

### Rails

Just add the gem into your Gemfile and bundle! That's it!

### Rack

  ```ruby
  require 'p3p'
  use P3P::Middleware
  ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/carrot/p3p/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
