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
charge = Garbanzo::Charge.new(dollar_amount, card_number, exp_month, exp_year)

# Defaults: start today, run indefinitely
# Example: start today, run for 12 intervals
duration = Garbanzo::Duration.new(Date.today, 12)

# Defaults: run every month
# Example: run every 14 days
interval = Garbanzo::Interval.new(14, :days)
```

### Creating a subscription

```Ruby
subscription = Garbanzo::Subscription.new(credentials)

# Duration and interval can be omitted if you want to use defaults
subscription.create(charge, duration, interval)
```

```Ruby
Garbanzo::Subscription.create(credentials, charge, duration, interval)
```

### Retrieving an existing subscription

```Ruby
subscription = Garbanzo::Subscription.new(credentials).find(other_subscription_id)

# This makes an ARB status API call, and returns a Garbanzo::Subscription::Status object.
# It caches the result, pass in `true` to bust the cache.
subscription.status
```

```Ruby
Graceway::Subscription.find(credentials, charge, duration, interval)
```

### Updating an existing subscription

```Ruby
subscription.update(charge, duration, interval)
```

### Canceling an existing subscription

```Ruby
subscription.cancel
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
