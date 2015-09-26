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
    attribute :internal_status, default: nil

    attribute :error_code

    def save
      id ? update : create
      !errors.any?
    end

    def cancel
      handle_response Cancel.call(id)
    end

    def status
      handle_response Status.call(id)
      internal_status
    end

    private

    def create
      handle_response Create.call(amount, card, address, duration, interval)
    end

    def update
      handle_response Update.call(id, amount, card, address, duration, interval)
    end

    def handle_response(response)
      if response[:errors]
        errors.add(:base, response[:errors])
      else
        self.attributes = response
      end
      self
    end
  end
end
