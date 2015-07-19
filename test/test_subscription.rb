require 'minitest_helper'

module Garbanzo
  class TestSubscription < Minitest::Test
    def setup
      @klass = Garbanzo::Subscription
    end

    def test_that_it_responds_correctly
      assert_respond_to Garbanzo::Subscription, :create
      assert_respond_to Garbanzo::Subscription, :update
      assert_respond_to Garbanzo::Subscription, :cancel
      assert_respond_to Garbanzo::Subscription, :status
    end
  end
end
