module Garbanzo
  class Duration
    attr_reader :start_date, :occurrences

    def initialize(start_date = Date.today, occurrences = 9999)
      @start_date = start_date
      @occurrences = occurrences.to_i
    end

    def to_h
      {
        start_date: start_date,
        occurrences: occurrences
      }
    end

    def valid?
      start_date.respond_to?(:strftime) && occurrences.between?(1, 9999)
    end
  end
end
