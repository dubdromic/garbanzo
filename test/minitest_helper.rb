# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'garbanzo'

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/color'

AUTHORIZE_TEST_LOGIN = ENV['AUTHORIZE_TEST_LOGIN'] || 'fake'
AUTHORIZE_TEST_KEY = ENV['AUTHORIZE_TEST_KEY'] || 'login'

require 'webmock/minitest'
WebMock.disable_net_connect!

module AuthorizeStubs
  def stub_authorize_request(body)
    stub_request(:post, 'https://apitest.authorize.net/xml/v1/request.api')
      .to_return(body: body)
  end
end

module AuthorizeCredentials
  def credentials
    @credentials ||= Garbanzo::Credentials.new(AUTHORIZE_TEST_LOGIN, AUTHORIZE_TEST_KEY)
  end
end

