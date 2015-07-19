# $LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'garbanzo'

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/color'

require 'webmock/minitest'
WebMock.disable_net_connect!
