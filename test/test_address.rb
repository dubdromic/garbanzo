require 'minitest_helper'

module Garbanzo
  class TestAddress < Minitest::Test
    def setup
      @klass = Garbanzo::Address
    end

    def test_valid?
      address = @klass.new(first_name: 'Hey', last_name: 'There')
      assert address.valid?

      address = @klass.new(first_name: nil, last_name: 'There')
      refute address.valid?

      address = @klass.new(first_name: '', last_name: nil)
      refute address.valid?

      address = @klass.new(address1: '1234 Example St', city: 'New York', state: 'NY')
      refute address.valid?

      address = @klass.new(
        first_name: 'Hey',
        last_name: 'There',
        address1: '1234 Example St',
        city: 'New York',
        state: 'NY'
      )
      assert address.valid?
    end

    def test_to_h
      options = { first_name: 'Hey', last_name: 'There' }
      address = @klass.new(options)
      assert_equal address.to_h, options

      options = { first_name: 'Hey', last_name: 'There', city: 'New York', country: 'USA' }
      address = @klass.new(options)
      assert_equal address.to_h, options
    end
  end
end
