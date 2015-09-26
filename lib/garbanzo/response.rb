module Garbanzo
  class Response < Parser
    extend Forwardable

    def_delegators :response, :id, :to_h

    def self.wrap(response)
      new(response).to_h
    end

    private

    def response
      node(:resultCode) == 'Ok' ? success : error
    end

    def success
      Success.new node(:subscriptionId).to_i
    end

    def error
      Error.new node(:code), node(:text)
    end

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
  end
end
