module Garbanzo
  class Interval
    attr_reader :length, :unit

    def initialize(length = 1, unit = :month)
      @length = length.to_i
      @unit = unit.to_sym
    end

    def to_h
      {
        length: length,
        unit: unit
      }
    end

    def valid?
      unit_valid? && length_valid?
    end

    private

    def unit_valid?
      months? || days?
    end

    def length_valid?
      fail NotImplementedError unless unit_valid?
      return length.between?(1, 12) if months?
      return length.between?(7, 365) if days?
    end

    def months?
      unit == :months || unit == :month
    end

    def days?
      unit == :days
    end
  end
end
