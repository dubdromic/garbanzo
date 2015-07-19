require 'faraday'

module Garbanzo
  class Request
    def self.post(xml, test_mode = true)
      new(test_mode).post(xml).body
    end

    def initialize(test_mode)
      @test_mode = test_mode
    end

    def post(xml)
      connection.post do |p|
        p.url Garbanzo::API_URI
        p.headers['Content-Type'] = 'text/xml'
        p.body = xml
      end
    end

    private

    attr_reader :test_mode

    def connection
      @connection ||= Faraday.new(url: host)
    end

    def host
      test_mode ? Garbanzo::TEST_HOST : Garbanzo::LIVE_HOST
    end
  end
end
