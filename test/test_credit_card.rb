require 'minitest_helper'
require 'credit_card_validator'

module Garbanzo
  class TestCreditCard < Minitest::Test
    TestValidator = Struct.new(:result) do
      def valid?(number)
        result
      end
    end

    def setup
      @klass = Garbanzo::CreditCard
      @card_number = '4111-1111-1111-1111'
      @valid_year = Date.today.year + 1
    end

    def test_card_validator
      assert @klass.new(@card_number, 8, @valid_year, TestValidator.new(true)).valid?
      refute @klass.new(@card_number, 8, @valid_year, TestValidator.new(false)).valid?
    end

    def test_expiration_valid?
      validator = TestValidator.new(true)
      assert @klass.new(@card_number, '08', @valid_year.to_s, validator).valid?
      assert @klass.new(@card_number, 8, @valid_year, validator).valid?
      refute @klass.new(@card_number, 15, @valid_year, validator).valid?
      refute @klass.new(@card_number, 2, Date.today.year - 1, validator).valid?
    end

    def test_to_h
      card = @klass.new(@card_number, 5, 2100)
      assert_equal card.to_h, { card_number: '4111111111111111', expiration_date: '2100-05' }
    end

    def test_expiration_date
      card = @klass.new(@card_number, 1, 2100)
      assert_equal card.expiration_date, '2100-01'

      card = @klass.new(@card_number, '7', '1980')
      assert_equal card.expiration_date, '1980-07'
    end
  end
end
