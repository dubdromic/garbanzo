require 'minitest_helper'

module Garbanzo
  class TestSubscription < Minitest::Test
    def setup
      @subscription = Garbanzo::Subscription.new
    end

    def test_assignment
      @subscription.attributes = {
        amount: 100,
        card: { test: :hash },
        interval: Interval.new(14, :days)
      }

      assert_equal(100, @subscription.amount)
      assert_equal({ test: :hash }, @subscription.card)
      assert_equal(:days, @subscription.interval.unit)
      assert_equal(9999, @subscription.duration.occurrences)
    end

    # NB: remove once methods are actually tested
    def test_method_presence
      assert_respond_to @subscription, :save
      assert_respond_to @subscription, :cancel
      assert_respond_to @subscription, :status
    end
  end
end
