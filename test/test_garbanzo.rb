require 'minitest_helper'

class TestGarbanzo < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Garbanzo::VERSION
  end
end
