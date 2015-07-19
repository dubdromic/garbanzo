require 'minitest_helper'

module Garbanzo
  class TestSubscriptionCreate < Minitest::Test
    def setup
      @klass = Garbanzo::Subscription::Create
    end

    def test_general_function
      response = @klass.new({}).create(0, {}, {}, Duration.new, Interval.new)
      assert_equal response, { id: -1, code: '', message: '' }
    end
  end
end
