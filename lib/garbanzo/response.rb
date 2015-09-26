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
      { id: node(:subscriptionId).to_i }
    end

    def error
      { id: -1, code: node(:code), message: node(:text) }
    end
  end
end
