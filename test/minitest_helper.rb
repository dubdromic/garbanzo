# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'garbanzo'

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/color'

AUTHORIZE_TEST_LOGIN = ENV['AUTHORIZE_TEST_LOGIN'] || 'fake'
AUTHORIZE_TEST_KEY = ENV['AUTHORIZE_TEST_KEY'] || 'login'

require 'webmock/minitest'
WebMock.disable_net_connect!

