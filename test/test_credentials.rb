require 'minitest_helper'

module Garbanzo
  class TestCredentials < Minitest::Test
    def setup
      @klass = Garbanzo::Credentials
    end

    def test_defaults
      credentials = @klass.new('name', 'password')
      assert credentials.test_mode
    end

    def test_to_h
      credentials = @klass.new('name', 'password', false)
      assert_equal credentials.to_h, { login: 'name', password: 'password', test_mode: false }
    end

    def test_valid?
      credentials = @klass.new('name', 'password')
      assert credentials.valid?
    end
  end
end
