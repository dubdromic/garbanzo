require 'minitest_helper'

module Garbanzo
  class TestSubscriptionCreate < Minitest::Test
    def setup
      @klass = Garbanzo::Subscription::Create
      stub_request(:post, 'https://apitest.authorize.net/xml/v1/request.api')
    end

    def test_general_function
      credentials = Garbanzo::Credentials.new('name', 'pw')
      response = @klass.new(credentials).create(0, {}, {}, Duration.new, Interval.new)
      assert_equal response, { id: -1, code: '', message: '' }
    end
  end
end
