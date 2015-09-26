require 'minitest_helper'

module Garbanzo
  class TestSubscriptionStatus < Minitest::Test
    include AuthorizeStubs
    include AuthorizeConnection

    def setup
      stub_connection
      @klass = Garbanzo::Subscription::Status
    end

    def success_body
      <<-BODY
<?xml version="1.0" encoding="utf-8"?>
<ARBCancelSubscriptionResponse
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema"
  xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
  <messages>
    <resultCode>Ok</resultCode>
    <message>
      <code>I00001</code>
      <text>Successful.</text>
    </message>
  </messages>
  <Status>inactive</Status>
</ARBCancelSubscriptionResponse>
BODY
    end

    def failure_body
      <<-BODY
<?xml version="1.0" encoding="utf-8"?>
<ErrorResponse xmlns="AnetApi/xml/v1/schema/AnetApiSchema.xsd">
  <messages>
    <resultCode>Error</resultCode>
    <message>
      <code>E00003</code>
      <text>An error occurred while parsing the XML request.</text>
    </message>
  </messages>
</ErrorResponse>
BODY
    end

    def response
      @klass.call(12345)
    end

    def test_successful_status
      stub_authorize_request success_body
      assert_equal response, { status: 'inactive' }
    end

    def test_unsuccessful_status
      stub_authorize_request failure_body
      assert_equal response, {
        id: nil,
        error_code: 'E00003',
        errors: ['An error occurred while parsing the XML request.']
      }
    end
  end
end
