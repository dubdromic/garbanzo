require 'minitest_helper'

module Garbanzo
  class TestInterval < Minitest::Test
    def setup
      @klass = Garbanzo::Interval
    end

    def test_defaults
      interval = @klass.new
      assert_equal interval.length, 1
      assert_equal interval.unit, :month
    end

    def test_to_h
      interval = @klass.new(21, :days)
      assert_equal interval.to_h, { length: 21, unit: :days }
    end

    def assert_valid?(length, unit, assertion)
      interval = @klass.new(length, unit)
      assert_equal interval.valid?, assertion
    end

    def test_month_length_validation
      assert_valid?(1, :month, true)
      assert_valid?(15, :month, false)
    end

    def test_days_length_validation
      assert_valid?(140, :days, true)
      assert_valid?(3, :days, false)
      assert_valid?(400, :days, false)
    end

    def test_months_unit_validation
      assert_valid?(1, :month, true)
      assert_valid?(1, :months, true)
      assert_valid?(1, :m, false)
    end

    def test_days_unit_validation
      assert_valid?(100, :days, true)
      assert_valid?(100, :day, false)
      assert_valid?(100, :d, false)
    end
  end
end
