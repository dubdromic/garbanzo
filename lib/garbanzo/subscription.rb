module Garbanzo
  class Subscription
    def self.create(
        credentials, amount, card, address, duration = Duration.new, interval = Interval.new
      )
      Garbanzo::Subscription::Create.new(credentials).create(amount, card, duration, interval)
    end

    def self.update(
        credentials, amount, card, address, duration = Duration.new, interval = Interval.new
      )
      Garbanzo::Subscription::Update.new(credentials).update(amount, card, duration, interval)
    end

    def self.cancel(credentials, subscription_id)
      Garbanzo::Subscription::Cancel.new(credentials).cancel(subscription_id)
    end

    def self.status(credentials, subscription_id)
      Garbanzo::Subscription::Status.new(credentials).status(subscription_id)
    end
  end
end
