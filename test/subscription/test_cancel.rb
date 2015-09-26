require 'minitest_helper'

module Garbanzo
  class TestSubscriptionCancel < Minitest::Test
    def setup
      @klass = Garbanzo::Subscription::Cancel
      @credentials = Garbanzo::Credentials.new(AUTHORIZE_TEST_LOGIN, AUTHORIZE_TEST_KEY)
    end

    def stub_cancellation_request(body)
      stub_request(:post, 'https://apitest.authorize.net/xml/v1/request.api')
        .to_return(body: body)
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
      <code>E00007</code>
      <text>User authentication failed due to invalid authentication values.</text>
    </message>
  </messages>
</ErrorResponse>
BODY
    end

    def test_successful_cancellation
      stub_cancellation_request success_body
      response = @klass
        .new(@credentials).cancel(12345)
      assert_equal response, { id: 0 }
    end

    def test_unsuccessful_cancellation
      stub_cancellation_request failure_body
      response = @klass
        .new(@credentials).cancel(12345)
      assert_equal response, {
        id: -1,
        code: 'E00007',
        message: 'User authentication failed due to invalid authentication values.'
      }
    end
  end
end
