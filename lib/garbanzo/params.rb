module Garbanzo
  class Params
    def initialize(target, options = {})
      @target = target
      @options = options
    end

    def assign_from_hash
      options.each do |attribute, value|
        target.public_send("#{attribute}=", value)
      end
    end

    private

    attr_reader :target, :options
  end
end
