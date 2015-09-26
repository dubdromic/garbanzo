module Garbanzo
  class Subscription
    def self.create(
        credentials, amount, card, address, duration = Duration.new, interval = Interval.new
      )
      Garbanzo::Subscription::Create.new(credentials).call(amount, card, duration, interval)
    end

    def self.cancel(credentials, subscription_id)
      Garbanzo::Subscription::Cancel.new(credentials).call(subscription_id)
    end

    def self.update; end

    def self.status
      Garbanzo::Subscription::Status.new(credentials).call(subscription_id)
    end
  end
end
