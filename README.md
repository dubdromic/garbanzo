# Garbanzo

Ruby library for interacting with Authorize.net's Automated Recurring Billing.

## Installation

### Not available on RubyGems yet.

Add this line to your application's Gemfile:

```ruby
gem 'garbanzo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install garbanzo

## Usage

### Alpha API, subject to change.


### Connection

Configuration for the connection to Authorize.net is handled through `Garbanzo.configure`.

```Ruby
Garbanzo.configure do |c|
  c.login = 'your_login'
  c.password = 'your_key'
  c.test_mode = true # defaults to false
end
```

You can also assign a connection object directly.

```Ruby
test_mode = true
connection = Garbanzo::Connection.new('your_login', 'your_key', test_mode)
Garbanzo.connection = connection
```

### Subscriptions

Subscription objects are `ActiveAttr::Model`s.

```Ruby
subscription = Garbanzo::Subscription.new

# Regular assignment
subscription.amount = amount

# Mass assignment
subscription.attributes = { address: address, duration: duration, interval: interval }

# Without ID present, create new subscription
subscription.save

# With ID present, update existing subscription
subscription.id = 12345
subscription.amount = amount + 100
subscription.save

# Returns active, expired, suspended, canceled, or terminated
subscription.status

# Cancels subscription
subscription.cancel
```

### Parameters

Required parameters for interacting with ARB subscriptions are wrapped in helper classes.

They include validation via a `#valid?` method, where appropriate.

```Ruby
# Only first and last name are required.
address = Garbanzo::Address.new(
  first_name: 'Test',
  last_name: 'Dude',
  address1: '123 Main St',
  city: 'New York',
  state: 'NY',
  zip: '12345',
  country: 'USA'
)

card_number = '4111111111111111'
exp_month = '10'
exp_year = '2021'
card = Garbanzo::CreditCard.new(card_number, exp_month, exp_year)

# Amount is in dollars
amount = 10.0

# Defaults: start today, run indefinitely
# Example: start today, run for 12 intervals
duration = Garbanzo::Duration.new(Date.today, 12)

# Defaults: run every month
# Example: run every 14 days
interval = Garbanzo::Interval.new(14, :days)
```

### TODO

- Public method return value documentation
- Errors

## Contributing

1. Fork it ( https://github.com/dubdromic/garbanzo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
