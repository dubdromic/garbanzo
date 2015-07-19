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


### Parameters

Required parameters for interacting with ARB subscriptions are wrapped in helper classes. They include validation via a `#valid?` method.

```Ruby
# No defaults
credentials = Garbanzo::Credentials.new('login', 'password')

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

card = Garbanzo::CreditCard.new(card_number, exp_month, exp_year)

# Dollars, or cents if Integer
amount = 10.0

# Defaults: start today, run indefinitely
# Example: start today, run for 12 intervals
duration = Garbanzo::Duration.new(Date.today, 12)

# Defaults: run every month
# Example: run every 14 days
interval = Garbanzo::Interval.new(14, :days)
```

### Creating a subscription

```Ruby
# Duration and interval can be omitted if you want to use defaults
Garbanzo::Subscription.create(credentials, amount, card, address, duration, interval)
```

### Updating an existing subscsription

```Ruby
Garbanzo::Subscription.update(credentials, subscription_id, amount, card, address, duration, interval)
```

### Canceling an existing subscription

```Ruby
Garbanzo::Subscription.cancel(credentials, subscription_id)
```

### Retreiving status of an existing subscription

```Ruby
Garbanzo::Subscription.status(credentials, subscription_id)
```

### TODO

- `Garbanzo::Subscription::Status` API documentation
- Public method return value documentation
- Errors

## Contributing

1. Fork it ( https://github.com/dubdromic/garbanzo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
