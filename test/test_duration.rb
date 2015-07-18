require 'minitest_helper'

module Garbanzo
  class TestDuration < Minitest::Test
    def setup
      @klass = Garbanzo::Duration
    end

    def test_defaults
      duration = @klass.new
      assert_equal duration.start_date, Date.today
      assert_equal duration.occurrences, 9999
    end

    def test_to_h
      date = Date.today.next_day
      duration = @klass.new(date, 10)
      assert_equal duration.to_h, { start_date: date, occurrences: 10 }
    end

    def test_valid?
      duration = @klass.new(nil, 10)
      refute duration.valid?

      duration = @klass.new(Time.now, 10)
      assert duration.valid?

      duration = @klass.new(Date.today, 0)
      refute duration.valid?

      duration = @klass.new(Date.today, 1000000)
      refute duration.valid?
    end
  end
end
