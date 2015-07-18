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

Required parameters for interacting with subscriptions can be set up.
```Ruby
credentials = Garbanzo::Credentials.new('login', 'password')
charge = Garbanzo::Charge.new(dollar_amount, card_number, exp_month, exp_year)
duration = Garbanzo::Duration.new # run indefinitely, starting tomorrow
interval = Garbanzo::Interval.new(1, :month) # run every month
```

With those, you can create a subscription.
```Ruby
subscription = Garbanzo::Subscription.new(credentials)
subscription.create(charge, duration, interval)
subscription.id # returned from Authorize
```

Or retrieve one from the API.
```Ruby
subscription = Garbanzo::Subscription.new(credentials).find(other_subscription_id)
```

In addition, Garbanzo supports `update`, `status`, and `cancel`.
```Ruby
subscription.update(charge, duration, interval)
subscription.status
subscription.cancel
```

## Contributing

1. Fork it ( https://github.com/dubdromic/garbanzo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
