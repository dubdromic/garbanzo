require 'minitest_helper'

class TestGarbanzo < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Garbanzo::VERSION
  end

  def test_connection_block
    Garbanzo.configure do |c|
      c.login = 'test'
      c.password = 'password'
      c.test_mode = false
    end

    assert_equal Garbanzo.connection.login, 'test'
    assert_equal Garbanzo.connection.password, 'password'
    assert_equal Garbanzo.connection.test_mode, false
  end
end
