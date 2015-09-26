require 'minitest_helper'

module Garbanzo
  class TestResponse < Minitest::Test
    def setup
      @klass = Garbanzo::Response

      @success_xml = <<-eos
<?xml version="1.0" encoding="utf-8">
<ARBCreateSubscriptionResponse xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
  <messages>
    <resultCode>Ok</resultCode>
    <message>
      <code>I00001</code>
      <text>Successful.</text>
    </message>
  </messages>
  <subscriptionId>100000</subscriptionId>
</ARBCreateSubscriptionResponse>
eos

      @failure_xml = <<-eos
<ErrorResponse xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
  <messages>
    <resultCode>Error</resultCode>
    <message>
      <code>I00010</code>
      <text>User authentication failed.</text>
    </message>
  </messages>
</ErrorResponse>
eos

      @invalid_xml = '<broken>'
    end

    def test_to_h
      response = @klass.new(@success_xml)
      assert_equal response.to_h, { id: 100000 }

      response = @klass.new(@failure_xml)
      assert_equal response.to_h, { id: -1, code: 'I00010', message: 'User authentication failed.' }

      response = @klass.new(@invalid_xml)
      assert_equal response.to_h, { id: -1, code: '', message: '' }
    end
  end
end
