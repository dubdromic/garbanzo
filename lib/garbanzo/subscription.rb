require 'garbanzo/subscription/base'
require 'garbanzo/subscription/create'
require 'garbanzo/subscription/cancel'
require 'garbanzo/subscription/status'
require 'garbanzo/subscription/update'

module Garbanzo
  class Subscription
    include ActiveAttr::Model

    attribute :id, type: Integer
    attribute :amount, type: Integer
    attribute :card
    attribute :address
    attribute :duration, default: -> { Duration.new }
    attribute :interval, default: -> { Interval.new }

    def save
      id ? update : create
    end

    def cancel
      Cancel.call id
    end

    def status
      Status.call id
    end

    private

    def create
      Create.call(amount, card, address, duration, interval)
    end

    def update
      Update.call(id, amount, card, address, duration, interval)
    end
  end
end
