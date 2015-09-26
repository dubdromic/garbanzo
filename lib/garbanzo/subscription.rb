module Garbanzo
  class Subscription
    include ActiveAttr::Model

    def self.cancel; end
    def self.create; end
    def self.status; end
    def self.update; end

    attribute :subscription_id
    attribute :amount, type: Integer
    attribute :card
    attribute :address
    attribute :duration, default: -> { Duration.new }
    attribute :interval, default: -> { Interval.new }
  end
end
