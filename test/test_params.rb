require 'minitest_helper'

module Garbanzo
  class TestParams < Minitest::Test
    def setup
      @klass = Garbanzo::Params
      @target = OpenStruct.new(name: nil, phone: nil, email: nil)
      @options = { name: 'Test Name', phone: '555-5555', email: 'dev@rtcreativegroup.com' }
    end

    def test_it_assigns_the_hash_values
      @klass.new(@target, @options).assign_from_hash
      assert_equal @target.name, 'Test Name'
      assert_equal @target.phone, '555-5555'
      assert_equal @target.email, 'dev@rtcreativegroup.com'
    end
  end
end
