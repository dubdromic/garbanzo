require 'credit_card_validator'

module Garbanzo
  class CreditCard
    attr_accessor :number, :exp_month, :exp_year

    def initialize(number, exp_month, exp_year, card_validator = ::CreditCardValidator::Validator)
      @number = number.gsub(/[^\d]/, '')
      @exp_month = exp_month.to_i
      @exp_year = exp_year.to_i
      @card_validator = card_validator
    end

    # TODO: fix this
    def valid?
      exp_month.between?(1, 12) &&
        exp_year >= Date.today.year &&
        card_validator.valid?(number)
    end

    def to_h
      {
        number: number,
        exp_date: exp_date
      }
    end

    def exp_date
      format('%04d-%02d', exp_year, exp_month)
    end

    private

    attr_reader :card_validator
  end
end
