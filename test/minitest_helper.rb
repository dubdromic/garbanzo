# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'garbanzo'

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/color'
require 'webmock/minitest'

AUTHORIZE_TEST_LOGIN = ENV['AUTHORIZE_TEST_LOGIN'] || 'fake'
AUTHORIZE_TEST_KEY = ENV['AUTHORIZE_TEST_KEY'] || 'login'
USE_REQUEST_STUBS = ENV['STUB_REQUESTS'] || AUTHORIZE_TEST_LOGIN == 'fake'

if USE_REQUEST_STUBS
  WebMock.disable_net_connect!
else
  WebMock.allow_net_connect!
end

module AuthorizeStubs
  def stub_authorize_request(body)
    return unless USE_REQUEST_STUBS
    stub_request(:post, 'https://apitest.authorize.net/xml/v1/request.api')
      .to_return(body: body)
  end
end

module AuthorizeConnection
  def stub_connection
    Garbanzo.configure do |c|
      c.login = AUTHORIZE_TEST_LOGIN
      c.password = AUTHORIZE_TEST_KEY
      c.test_mode = true
    end
  end
end

