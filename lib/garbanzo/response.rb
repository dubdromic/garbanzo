module Garbanzo
  class Response < Parser
    extend Forwardable

    def_delegators :response, :id, :to_h

    def self.wrap(response)
      new(response).to_h
    end

    private

    Success = Struct.new(:id) do
      def to_h
        { id: id }
      end
    end

    Error = Struct.new(:code, :message) do
      def id
        -1
      end

      def to_h
        { id: id, code: code, message: message }
      end
    end

    def response
      if node(:resultCode) == 'Ok'
        Success.new node(:subscriptionId).to_i
      else
        Error.new node(:code), node(:text)
      end
    end
  end
end
