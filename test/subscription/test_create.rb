require 'minitest_helper'

module Garbanzo
  class TestSubscriptionCreate < Minitest::Test
    def setup
      @klass = Garbanzo::Subscription::Create
    end

    def test_create
      assert_nil @klass.new({}).create(0, {}, {}, Duration.new, Interval.new)
    end
  end
end
